Imports System.Transactions
Imports App_UserControls_MessagePop

Partial Class Accounting_AccBookApplication
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            If Request.QueryString("TransID") = 0 Then
                fvTransaction.ChangeMode(FormViewMode.Edit)
            End If
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
        Dim documentID As Integer = Request.QueryString("DocumentID")
        Dim ftrtID As Integer = e.CommandArgument
        Try
            Dim q As New dsAccountingTableAdapters.QueriesTableAdapter
            q.AccApplicationDelete(transID, ftrtID, My.User.Name)

            Response.Redirect(String.Format("AccBookApplication.aspx?TransID={0}&DocumentID={1}", transID, documentID))
        Catch ex As Exception
            msgPop.ShowError(ex)
        End Try
    End Sub

    Protected Sub dlDetails_Cancel(ByVal sender As Object, ByVal e As DataListCommandEventArgs)
        Dim dl As DataList = sender
        dl.EditItemIndex = -1
        dl.DataBind()
    End Sub

    'Dim ftBal As Decimal = 0
    'Dim docBal As Decimal = 0
    Protected Sub gvFt2Apply_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim gv As GridView = sender
        If gv.SelectedIndex > -1 Then
            Dim ftID As Integer = gv.SelectedDataKey.Item("DocumentID")
            Dim ftCode As String = gv.SelectedDataKey.Item("DocCode")
            Dim ftNum As Integer = gv.SelectedDataKey.Item("DocNumber")

            'ftBal = gv.SelectedDataKey.Item("Balance")
            'docBal = fvTransaction.DataKey("Balance")

            pnlNewInvoice.Visible = True
            pnlNewDetail.Visible = False

            hf_ftrtID.Value = ftID
            lbl_ftrt.Text = ftCode & " " & ftNum.ToString
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

    Protected Sub dlNewInvoice_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles dlNewInvoice.ItemDataBound
        Dim r As DataListItem = e.Item
        Dim l As Label = r.FindControl("lbl_detailBalance")
        If l IsNot Nothing Then
            Dim txtAmount As TextBox = r.FindControl("txt_detailAmount")
            Dim imgSet As ImageButton = r.FindControl("btSetAmount")
            Dim imgRSet As ImageButton = r.FindControl("btResetAmount")
            'Dim rBal As Decimal = l.Text
            'If docBal - rBal < 0 Then rBal = docBal
            'txtAmount.Text = rBal.ToString("F2")
            'docBal = docBal - rBal
            Dim lBal As Decimal = l.Text
            imgSet.OnClientClick = String.Format("document.getElementById('{0}').value = '{1}'; return false;", txtAmount.ClientID, lBal.ToString("F2"))
            imgRSet.OnClientClick = String.Format("document.getElementById('{0}').value = '0.00'; return false;", txtAmount.ClientID)
        End If
    End Sub

    Protected Sub btnNewCancel_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnNewCancel.Click
        pnlNewInvoice.Visible = False
        pnlNewDetail.Visible = True
    End Sub

    Protected Sub btnNewUpdate_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnNewUpdate.Click
        Dim transID As Integer = Request.QueryString("TransID")
        Dim documentID As Integer = Request.QueryString("DocumentID")
        Dim ftrtID As Integer = hf_ftrtID.Value
        Dim ftrtNote As String = IIf(String.IsNullOrEmpty(txt_ftrtNote.Text), Nothing, txt_ftrtNote.Text)
        Dim ftrtApplied As Decimal = 0

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

                    Dim det As InvApplication = CheckDetails(dlNewInvoice, ftrtApplied)
                    If det.detResult > 0 Then
                        'insert into InvStayPayment
                        Dim ispA As New dsAccBookApplicationTableAdapters.InvStayPaymentTableAdapter
                        Dim ispT As New dsAccBookApplication.InvStayPaymentDataTable
                        For Each stay As BookApplication In det.detList
                            If Not stay.detailExclude Then ispT.AddInvStayPaymentRow(stay.invoiceID, stay.detailID, documentID, transID, stay.detailAmount, False)
                        Next
                        ispA.Update(ispT)
                        q.AccApplicationFtInsert(transID, ftrtID, det.invoiceAmount, ftrtNote, My.User.Name)
                        ts.Complete()

                        Response.Redirect(String.Format("AccBookApplication.aspx?TransID={0}&DocumentID={1}", transID, documentID))
                    End If
                Catch ex As Exception
                    msgPop.ShowError(ex)
                End Try
            End Using
        Else
            Dim q As New AccDocApplicationTableAdapters.QueriesTableAdapter
            Dim det As InvApplication = CheckDetails(dlNewInvoice, ftrtApplied)
            If det.detResult > 0 Then
                Using ts As New TransactionScope(TransactionScopeOption.RequiresNew)
                    Try
                        'insert into InvStayPayment
                        Dim ispA As New dsAccBookApplicationTableAdapters.InvStayPaymentTableAdapter
                        Dim ispT As New dsAccBookApplication.InvStayPaymentDataTable
                        For Each stay As BookApplication In det.detList
                            If Not stay.detailExclude Then ispT.AddInvStayPaymentRow(stay.invoiceID, stay.detailID, documentID, transID, stay.detailAmount, False)
                        Next
                        ispA.Update(ispT)
                        q.AccApplicationFtInsert(transID, ftrtID, det.invoiceAmount, ftrtNote, My.User.Name)
                        ts.Complete()

                        Response.Redirect(String.Format("AccBookApplication.aspx?TransID={0}&DocumentID={1}", transID, documentID))
                    Catch ex As Exception
                        msgPop.ShowError(ex)
                    End Try
                End Using
            End If
        End If
    End Sub

    Protected Sub btnBatch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBatch.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim fname As String = String.Format("Application Batch {0}.pdf", Request.QueryString("TransID"))

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
        Response.AppendHeader("Content-Disposition", "attachment; filename=""" + fname + """")
        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Sub btnBatchByBookings_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBatchByBookings.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim fname As String = String.Format("Application Batch by Bookings {0}.pdf", Request.QueryString("TransID"))

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Reports\Accounting\RptApplicationDetailTrBook.rdlc"

        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsAccounting_DocHeader", dsDocHeader))
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("AccDocApplication_ReportAccTranApplBook", dsApplicationsBook))
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
        Response.AppendHeader("Content-Disposition", "attachment; filename=""" + fname + """")
        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub


    'Iterate trough datalist
    '- creates list of stay payment rows
    '- check is application valid (overpayments)
    '- checkResult >0 if all rows are OK
    '               0 if nothing to apply
    '              -1 if there are errors
    Protected Function CheckDetails(ByRef bookings As DataList, ByVal ftrtApplied As Decimal) As InvApplication
        Dim documentBalance As Decimal = fvTransaction.DataKey("Balance")

        Dim r As New InvApplication
        r.detList = New List(Of BookApplication)

        Dim newApplied As Decimal = 0
        Dim cntApplied As Integer = 0
        Dim hasError As Boolean = False

        For Each i As DataListItem In bookings.Items
            Dim bkPay As New BookApplication
            bkPay.booking = i
            bkPay.invoiceID = CType(i.FindControl("hf_invoiceID"), HiddenField).Value
            bkPay.detailID = CType(i.FindControl("hf_detailID"), HiddenField).Value
            bkPay.bookingError = i.FindControl("lbl_detailError")
            r.invoiceID = bkPay.invoiceID

            Dim detailAmount As Decimal = CType(i.FindControl("txt_detailAmount"), TextBox).Text
            Dim detailMaxAmount As Decimal = CType(i.FindControl("lbl_detailBalance"), Label).Text

            If hasError Then
                bkPay.detailExclude = True
            ElseIf detailAmount = 0 Then
                bkPay.detailExclude = True
            ElseIf detailAmount < 0 Then
                'this should be handled by range validator
                bkPay.detailError = True
                bkPay.detailErrorMsg = "Negative application is not allowed"
                hasError = True
            ElseIf detailAmount > detailMaxAmount Then
                'this should be handled by range validator
                bkPay.detailError = True
                bkPay.detailErrorMsg = "Booking overapplied"
                hasError = True
            ElseIf newApplied + detailAmount > documentBalance + ftrtApplied Then
                bkPay.detailError = True
                bkPay.detailErrorMsg = "Document overapplied"
                hasError = True
            Else
                bkPay.detailError = False
                bkPay.detailExclude = False
                bkPay.detailAmount = detailAmount
                newApplied += detailAmount
                cntApplied += 1
            End If

            bkPay.bookingError.Text = bkPay.detailErrorMsg
            r.detList.Add(bkPay)
        Next

        r.invoiceAmount = newApplied
        r.detResult = IIf(hasError, -1, cntApplied)

        Return r
    End Function

    Protected Class BookApplication
        Public booking As DataListItem
        Public bookingError As Label
        Public invoiceID As Integer
        Public detailID As Integer
        Public detailAmount As Decimal = 0
        Public detailExclude As Boolean = False
        Public detailError As Boolean = False
        Public detailErrorMsg As String = String.Empty
    End Class

    Protected Class InvApplication
        Public invoiceID As Integer
        Public invoiceAmount As Decimal
        Public detResult As Integer
        Public detList As List(Of BookApplication)
    End Class

    Protected Sub btnClose_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClose.Click
        CloseMe(True)
    End Sub

    Protected Sub CloseMe(ByVal IsOK As Boolean)
        Dim src As String = String.Format("window.parent.document.getElementById('byBook{0}').click();", IIf(IsOK, "OK", "Cancel"))
        ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", src, True)
    End Sub
End Class
