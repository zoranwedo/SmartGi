Imports System.Transactions
Imports App_UserControls_InputDateControl

Partial Class Accounting_AccGroupApplication
    Inherits System.Web.UI.Page

    'Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    Protected Sub dlDetails_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles dlDetails.PreRender
        If Not String.IsNullOrEmpty(hfFocus.Value) And dlDetails.Visible Then
            Dim item As DataListItem = dlDetails.Items(hfFocus.Value)
            Dim txt_ftrtNote As TextBox = item.FindControl("txt_ftrtNote")
            txt_ftrtNote.Focus()
        End If
    End Sub

    Protected Sub dsSrcDocument_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles dsSrcDocument.Selecting, dsAccDocStatus.Selecting
        e.InputParameters("UserName") = My.User.Name
    End Sub

    Protected Sub btSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btSearch.Click
        dlDetails.Visible = True
    End Sub

    Protected Sub btClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btClear.Click
        dlDetails.Visible = False
        txtGroup.Text = Nothing
        ctrlDate.ClearControl()
    End Sub

    Dim TotalAmount As Decimal = 0
    Dim AppliedAmount As Decimal = 0

    Protected Sub dlDetails_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles dlDetails.ItemDataBound
        If e.Item.DataItem Is Nothing Then Return

        Dim rowView As Data.DataRowView = e.Item.DataItem
        Dim rowData As dsGroupApplication.FtToApplyRow = rowView.Row
        Dim txt_creditAmount As TextBox = e.Item.FindControl("txt_creditAmount")
        Dim hf_creditAmount As HiddenField = e.Item.FindControl("hf_creditAmount")
        Dim lblDebitAmount As Label = fvTransaction.Row().FindControl("lblDebitAmount")

        If TotalAmount > rowData.Balance Then
            rowData.ApplyAmount = rowData.Balance
        Else
            rowData.ApplyAmount = TotalAmount
        End If
        hf_creditAmount.Value = rowData.ApplyAmount
        txt_creditAmount.Text = rowData.ApplyAmount.ToString("F2")
        TotalAmount = TotalAmount - rowData.ApplyAmount

        AppliedAmount = AppliedAmount + rowData.ApplyAmount
        lblDebitAmount.Text = AppliedAmount.ToString("N2")
    End Sub

    Protected Sub dlDetails_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles dlDetails.DataBinding
        Dim source As FormViewRow = fvTransaction.Row()
        Dim lblBalance As Label = source.FindControl("lblBalance")
        Dim lblDebitAmount As Label = source.FindControl("lblDebitAmount")

        If Not String.IsNullOrEmpty(lblBalance.Text) Then
            TotalAmount = Decimal.Parse(lblBalance.Text, Globalization.NumberStyles.AllowDecimalPoint Or Globalization.NumberStyles.AllowThousands)
            lblDebitAmount.Text = "0.00"
        End If
    End Sub

    Protected Sub txt_creditAmount_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim lblBalance As Label = fvTransaction.Row().FindControl("lblBalance")
        Dim totalBalance = Decimal.Parse(lblBalance.Text, Globalization.NumberStyles.AllowDecimalPoint Or Globalization.NumberStyles.AllowThousands)

        Dim lblDebitAmount As Label = fvTransaction.Row().FindControl("lblDebitAmount")
        Dim oldApplied As Decimal = Decimal.Parse(lblDebitAmount.Text)
        Dim newApplied As Decimal

        Dim txt_creditAmount As TextBox = sender
        Dim item As DataListItem = txt_creditAmount.NamingContainer
        hfFocus.Value = item.ItemIndex
        Dim hf_creditAmount As HiddenField = item.FindControl("hf_creditAmount")
        Dim lblRowBalance As Label = item.FindControl("lblBalance")
        Dim rowBalance As Decimal = lblRowBalance.Text
        Dim oldAmount As Decimal = hf_creditAmount.Value
        Dim newAmount As Decimal

        Dim strAmount As String = txt_creditAmount.Text.Trim()
        If Decimal.TryParse(strAmount, newAmount) Then
            If newAmount >= 0 Then
                If newAmount > rowBalance Then newAmount = rowBalance
                newApplied = oldApplied - oldAmount + newAmount
                If totalBalance < newApplied Then newAmount = totalBalance - oldApplied
                newApplied = oldApplied - oldAmount + newAmount
                lblDebitAmount.Text = newApplied.ToString("F2")
                txt_creditAmount.Text = newAmount.ToString("F2")
                hf_creditAmount.Value = newAmount
                Return
            End If
        End If

        txt_creditAmount.Text = oldAmount.ToString("F2")
    End Sub


    Protected Sub btFinish_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim transID As Integer

        Dim application As New dsGroupApplication.FtToApplyDataTable()

        Dim lblDebitAmount As Label = fvTransaction.Row().FindControl("lblDebitAmount")
        Dim txt_transNote As TextBox = fvTransaction.Row().FindControl("txt_transNote")
        Dim ctr_transDate As App_UserControls_InputDateControl = fvTransaction.Row().FindControl("ctr_transDate")

        Dim totalAmount As Decimal = lblDebitAmount.Text
        If totalAmount = 0 Then Return

        Dim documentId As Integer = Request.QueryString("DocumentID")
        Dim totalNote = txt_transNote.Text
        Dim totalDate = ctr_transDate.DateValue

        For Each rowItem As DataListItem In dlDetails.Items
            Dim hf_ftrtID As HiddenField = rowItem.FindControl("hf_ftrtID")
            Dim txt_creditAmount As TextBox = rowItem.FindControl("txt_creditAmount")
            Dim txt_ftrtNote As TextBox = rowItem.FindControl("txt_ftrtNote")

            If hf_ftrtID Is Nothing Then Continue For

            Dim amount As Decimal = txt_creditAmount.Text
            If amount = 0 Then
                rowItem.Visible = False
                txt_creditAmount.Visible = False
                txt_ftrtNote.Visible = False
                rowItem.DataBind()
                Continue For
            End If

            Dim row As dsGroupApplication.FtToApplyRow = application.NewFtToApplyRow()
            row.DocumentID = hf_ftrtID.Value
            row.ApplyAmount = amount
            row.ApplyNote = txt_ftrtNote.Text
            application.AddFtToApplyRow(row)
        Next

        If application.Count > 0 Then
            Try
                Using ts As New TransactionScope(TransactionScopeOption.RequiresNew)
                    'Start acc application transaction
                    Dim q As New AccDocApplicationTableAdapters.QueriesTableAdapter
                    q.AccApplicationStart(documentId, totalDate, totalNote, My.User.Name, transID)
                    'transID is updated!

                    For Each row As dsGroupApplication.FtToApplyRow In application
                        q.AccApplicationInsert(transID, row.DocumentID, row.ApplyAmount, row.ApplyNote, My.User.Name)
                    Next
                    ts.Complete()
                End Using

                pnSearch.Enabled = False
                fvTransaction.Enabled = False
                dlDetails.Visible = False

                hf_transID.Value = transID
                Dim ds As New dsGroupApplicationTableAdapters.FtToApplyTableAdapter
                dlTrans.DataSource = ds.GetDataByTrans(transID)
                dlTrans.Visible = True
                dlTrans.DataBind()
            Catch ex As Exception
                msgPop.ShowError(ex)
            End Try
        End If
    End Sub

    Protected Sub btCancel_Click(ByVal sender As Object, ByVal e As EventArgs)
        CloseMe(False)
    End Sub

    Protected Sub btnBatch_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Reports\Accounting\RptApplicationDetailTr.rdlc"

        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsAccounting_DocHeader", dsDocHeader))
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("AccDocApplication_ReportAccTranAppl", dsApplications))
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsAccounting_SelectAccDocStatus", dsAccDocStatus))

        Dim puser As New ReportParameter("user", My.User.Name)
        Dim pAppID As New ReportParameter("appID", Request.QueryString("TransID"))
        Dim pAppDate As New ReportParameter("appDate", Date.Parse(fvTransaction.DataKey("TransDate")))
        Dim p As ReportParameter() = {puser, pAppID, pAppDate}
        lr.SetParameters(p)

        Dim bytes As Byte()
        bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)

        Response.ClearContent()
        Response.ClearHeaders()
        Response.ContentType = "application/pdf"
        Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "DocumentApplication.pdf" + """")
        Response.BinaryWrite(bytes)
        Response.Flush()
        Response.End()
        'Response.Close()
    End Sub

    Protected Sub ibClose_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibClose.Click
        CloseMe(False)
    End Sub

    Protected Sub btnClose_Click(ByVal sender As Object, ByVal e As EventArgs)
        CloseMe(True)
    End Sub

    Protected Sub CloseMe(ByVal IsOK As Boolean)
        fvTransaction.Enabled = True
        fvTransaction.DataBind()
        pnSearch.Enabled = True
        dlTrans.Visible = False
        dlDetails.Visible = False

        txtGroup.Text = Nothing
        ctrlDate.ClearControl()

        Dim src As String = String.Format("window.parent.document.getElementById('group{0}').click();", IIf(IsOK, "OK", "Cancel"))
        ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", src, True)
    End Sub
End Class
