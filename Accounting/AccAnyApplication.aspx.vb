Imports System.Transactions
Imports App_UserControls_MessagePop

Partial Class Accounting_AccAnyApplication
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            If Request.QueryString("TransID") = 0 Then fvTransaction.ChangeMode(FormViewMode.Edit)
            btSwitchForm.OnClientClick = "top.window.location.href='AccDocApplication.aspx?DocumentID=" & Request.QueryString("DocumentID") & "';"
            btSwitchForm.Visible = Request.QueryString("TransID") = 0
        End If
    End Sub

    Protected Sub dsSrcDocument_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles dsSrcDocument.Selecting, dsAccDocStatus.Selecting
        e.InputParameters("UserName") = My.User.Name
    End Sub

    Protected Sub fvTransaction_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles fvTransaction.ItemCommand
        If e.CommandName = "TransUpdate" Then
            Dim transID As Integer = Request.QueryString("TransID")
            Try
                Dim txt_transNote As TextBox = fvTransaction.FindControl("txt_transNote")
                Dim transNote As String = IIf(String.IsNullOrEmpty(txt_transNote.Text), Nothing, txt_transNote.Text)

                Dim q As New dsAccBookApplicationTableAdapters.QueriesTableAdapter
                q.UpdateTransNote(transNote, transID)

                fvTransaction.ChangeMode(FormViewMode.ReadOnly)
            Catch ex As Exception
                msgPop.ShowError(ex)
            End Try
        End If
    End Sub

    Protected Sub fvTransFooter_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles fvTransFooter.ItemCommand
        If e.CommandName = "TransDelete" Then
            Dim transID As Integer = Request.QueryString("TransID")
            Try
                Dim q As New dsAccountingTableAdapters.QueriesTableAdapter
                q.AccApplicationCancel(transID, My.User.Name)
                CloseMe(False)
            Catch ex As Exception
                msgPop.ShowError(ex)
            End Try
        ElseIf e.CommandName = "TransFinish" Then
            'CloseMe(True)
            fvTransaction.Visible = False
            fvTransFooter.Visible = False
            pnlNewDetail.Visible = False
            pnlNewInvoice.Visible = False
            pnlReport.Visible = True
        End If
    End Sub

    Protected Sub dlDetails_Edit(ByVal sender As Object, ByVal e As DataListCommandEventArgs)
        Dim dl As DataList = sender
        dl.EditItemIndex = e.Item.ItemIndex

        dl.DataBind()
    End Sub

    Protected Sub dlDetails_Update(ByVal sender As Object, ByVal e As DataListCommandEventArgs)
        Dim dl As DataList = sender
        Dim transID As Integer = Request.QueryString("TransID")
        Dim transOrd As Integer = e.CommandArgument
        Try
            Dim txt_documentNote As TextBox = dl.Items(dl.EditItemIndex).FindControl("txt_documentNote")
            Dim documentNote As String = IIf(String.IsNullOrEmpty(txt_documentNote.Text), Nothing, txt_documentNote.Text)

            Dim q As New AccDocApplicationTableAdapters.QueriesTableAdapter
            q.UpdateTransNote(documentNote, transID, transOrd)

            fvTransaction.DataBind()
        Catch ex As Exception
            msgPop.ShowError(ex)
        End Try
    End Sub

    Protected Sub dlDetails_Delete(ByVal sender As Object, ByVal e As DataListCommandEventArgs)
        Dim transID As Integer = Request.QueryString("TransID")
        Dim ftrtID As Integer = e.CommandArgument
        Try
            Dim q As New dsAccountingTableAdapters.QueriesTableAdapter
            q.AccApplicationDelete(transID, ftrtID, My.User.Name)

            fvTransaction.DataBind()
            fvTransFooter.DataBind()
        Catch ex As Exception
            msgPop.ShowError(ex)
        End Try
    End Sub

    Protected Sub dlDetails_Cancel(ByVal sender As Object, ByVal e As DataListCommandEventArgs)
        Dim dl As DataList = sender
        dl.EditItemIndex = -1
        dl.DataBind()
    End Sub

    Protected Sub gvFt2Apply_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim gv As GridView = sender
        If gv.SelectedIndex > -1 Then
            Dim ftID As Integer = gv.SelectedDataKey.Item("DocumentID")
            Dim ftCode As String = gv.SelectedDataKey.Item("DocCode")
            Dim ftNum As Integer = gv.SelectedDataKey.Item("DocNumber")
            Dim ftBal As Decimal = gv.SelectedDataKey.Item("Balance")
            Dim docBal As Decimal = fvTransaction.DataKey("Balance")
            Dim docSign As Char = fvTransaction.DataKey("TrSign")

            pnlNewInvoice.Visible = True
            pnlNewDetail.Visible = False
            pDebit.Visible = docSign = "D"
            pCredit.Visible = docSign = "C"

            hf_ftrtID.Value = ftID
            lbl_ftrt.Text = ftCode & " " & ftNum.ToString
            lbl_detailBalance.Text = ftBal.ToString("N2")

            Dim ftApply As Decimal = IIf(docBal > ftBal, ftBal, docBal)
            txt_debitAmount.Text = IIf(docSign = "D", ftApply.ToString("F2"), Nothing)
            txt_creditAmount.Text = IIf(docSign = "C", ftApply.ToString("F2"), Nothing)
            rng_txt_debitAmount.MaximumValue = ftApply
            rng_txt_creditAmount.MaximumValue = ftApply
        End If
    End Sub

    Protected Sub gvFt2Apply_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvFt2Apply.DataBound
        Dim c As Integer = gvFt2Apply.Rows.Count
        If c = 0 Then c = 1
        If c > 6 Then c = 6

        If gvFt2Apply.Rows.Count < 6 Then
            popFt2ApplyImg.OffsetY = -(c * 19 - 2)
            popFt2ApplyTxt.OffsetY = -(c * 19 + 4)
        Else
            popFt2ApplyImg.OffsetY = -112
            popFt2ApplyTxt.OffsetY = -118
        End If
    End Sub

    Protected Sub btnNewCancel_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnNewCancel.Click
        pnlNewInvoice.Visible = False
        pnlNewDetail.Visible = True
    End Sub

    Protected Sub btnNewUpdate_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnNewUpdate.Click
        Dim transID As Integer = Request.QueryString("TransID")
        Dim documentID As Integer = Request.QueryString("DocumentID")
        Dim documentSign As Char = fvTransaction.DataKey("TrSign")

        Dim ftrtID As Integer = hf_ftrtID.Value
        Dim ftrtNote As String = IIf(String.IsNullOrEmpty(txt_ftrtNote.Text), Nothing, txt_ftrtNote.Text)
        Dim ftrtApplied As Decimal = 0

        If documentSign = "C" Then
            ftrtApplied = txt_creditAmount.Text
        Else
            ftrtApplied = txt_debitAmount.Text
        End If

        If ftrtApplied > 0 Then
            If transID = 0 Then
                Using ts As New TransactionScope(TransactionScopeOption.RequiresNew)
                    Try
                        Dim transactionDate As Date = CType(fvTransaction.FindControl("ctr_transDate"), App_UserControls_InputDateControl).DateValue
                        Dim txt_transNote As TextBox = fvTransaction.FindControl("txt_transNote")
                        Dim transNote As String = IIf(String.IsNullOrEmpty(txt_transNote.Text), Nothing, txt_transNote.Text)

                        'Start acc application transaction
                        Dim q As New AccDocApplicationTableAdapters.QueriesTableAdapter
                        q.AccApplicationStart(documentID, transactionDate, transNote, My.User.Name, transID)
                        'transID is updated!
                        q.AccApplicationInsert(transID, ftrtID, ftrtApplied, ftrtNote, My.User.Name)
                        ts.Complete()

                        Response.Redirect(String.Format("AccAnyApplication.aspx?TransID={0}&DocumentID={1}", transID, documentID))
                    Catch ex As Exception
                        msgPop.ShowError(ex)
                    End Try
                End Using
            Else
                Dim q As New AccDocApplicationTableAdapters.QueriesTableAdapter
                Using ts As New TransactionScope(TransactionScopeOption.RequiresNew)
                    Try
                        q.AccApplicationInsert(transID, ftrtID, ftrtApplied, ftrtNote, My.User.Name)
                        ts.Complete()

                        Response.Redirect(String.Format("AccAnyApplication.aspx?TransID={0}&DocumentID={1}", transID, documentID))
                    Catch ex As Exception
                        msgPop.ShowError(ex)
                    End Try
                End Using
            End If
        Else
            msgPop.ShowError(New Exception("Can't apply zero amount."))
        End If
    End Sub

    Protected Sub btnBatch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBatch.Click
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
        'Response.Close()
        Response.End()
    End Sub

    Protected Sub btnClose_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClose.Click
        CloseMe(True)
    End Sub

    Protected Sub CloseMe(ByVal IsOK As Boolean)
        Dim src As String = String.Format("window.parent.document.getElementById('byAny{0}').click();", IIf(IsOK, "OK", "Cancel"))
        ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", src, True)
    End Sub

End Class
