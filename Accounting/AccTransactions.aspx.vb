
Partial Class Accounting_AccTransactions
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            If ModificationRights.RightsHotel Then
                cbHotel.Checked = True
                cbHotel.Visible = False
            Else
                cbHotel.Visible = False
            End If

            btnByBooking.Visible = Master.ArCredit()
            btnByBooking.Enabled = Master.CanApply
            btnApply.Enabled = Master.CanApply
            btnTransfer.Enabled = Master.CanApply

            Dim strRefresh As String = String.Format("document.getElementById('{0}').click();", btnRefresh.ClientID)
            popByBookExtender.OnOkScript = strRefresh
            popByBookExtender.OnCancelScript = strRefresh
            popByAnyExtender.OnOkScript = strRefresh
            popByAnyExtender.OnCancelScript = strRefresh
        End If
    End Sub

    Public Function ByBookingSrc() As String
        Return String.Format("AccBookApplication.aspx?TransID=0&DocumentID={0}", Request.QueryString("DocumentID"))
    End Function

    Public Function ByAnySrc() As String
        Return String.Format("AccAnyApplication.aspx?TransID=0&DocumentID={0}", Request.QueryString("DocumentID"))
    End Function

    Protected Sub btnRefresh_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRefresh.Click
        Response.Redirect(String.Format("AccTransactions.aspx?DocumentID={0}", Request.QueryString("DocumentID")))
    End Sub

    Protected Sub btnTransfer_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnTransfer.Click
        Me.Response.Redirect("AccTransfer.aspx?DocumentID=" & Me.Request.QueryString(0))
    End Sub

    Protected Sub cbHotel_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbHotel.CheckedChanged
        Me.Response.Redirect("~/Accounting/AccTransactions.aspx?DocumentID=" & Me.Request.QueryString("DocumentID"))
    End Sub

    Protected Sub repTransactions_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles repTransactions.ItemCommand
        If e.CommandName = "TrCancel" Then
            Dim t As New dsAccountingTableAdapters.QueriesTableAdapter
            Dim trid As Integer = Int32.Parse(e.CommandArgument)
            Dim usr As String = Membership.GetUser.UserName
            Try
                t.AccTransactionCancel(trid, usr)
                Me.Response.Redirect("~/Accounting/AccTransactions.aspx?DocumentID=" & Me.Request.QueryString("DocumentID"))
            Catch ex As Exception
                msgPop.ShowError(ex)
            End Try
        End If
    End Sub

    Protected Sub gvTrans_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs)
        Dim gv As GridView = sender

        If e.CommandName = "ClearNote" Then
            Dim i As Integer = e.CommandArgument
            Dim TransID As String = gv.DataKeys(i).Values("TransID")
            Dim TransOrd As String = gv.DataKeys(i).Values("TransOrd")

            Dim q As New AccDocApplicationTableAdapters.QueriesTableAdapter
            Try
                q.ClearTransNote(TransID, TransOrd)
                gv.DataBind()
            Catch ex As Exception
                msgPop.ShowError(ex)
            End Try
        ElseIf e.CommandName = "SetNote" Then
            Dim i As Integer = e.CommandArgument
            Dim tx As TextBox = gv.Rows(i).Cells(6).FindControl("txtNote")
            Dim TransID As String = gv.DataKeys(i).Values("TransID")
            Dim TransOrd As String = gv.DataKeys(i).Values("TransOrd")
            Dim TransNote As String = tx.Text

            Dim q As New AccDocApplicationTableAdapters.QueriesTableAdapter
            Try
                q.UpdateTransNote(TransNote, TransID, TransOrd)
                gv.EditIndex = -1
                gv.DataBind()
            Catch ex As Exception
                msgPop.ShowError(ex)
            End Try
        End If

    End Sub

    Protected Sub btnPrint_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrint.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()
        Dim user As String = Membership.GetUser.UserName
        Dim asdate As String = Nothing

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Reports\Accounting\RptTransferDetail.rdlc"
        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsAccounting_DocHeader", dsDocHeader))
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("AccDocApplication_RptTransferDetail", dsTransactionsRpt))
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsAccRegistration_AccTransDocumentAddInfo", AddInfo()))

        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim photel As New ReportParameter("hotel")
        Dim p As ReportParameter() = {puser, photel}
        lr.SetParameters(p)

        bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)

        Response.ClearContent()
        Response.ClearHeaders()
        Response.ContentType = "application/pdf"
        Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Document Transfer.pdf" + """")
        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Function AddInfo() As Data.DataTable
        Dim q As New dsAccRegistrationTableAdapters.AccTransDocumentAddInfoTableAdapter
        Dim t As dsAccRegistration.AccTransDocumentAddInfoDataTable = q.GetData(Request.QueryString("DocumentID"))
        For Each r As dsAccRegistration.AccTransDocumentAddInfoRow In t.Rows
            If Not r.IsInfoReservationNull Then r.InfoReservation = "* " & Replace(r.InfoReservation, "; ", vbCrLf & "* ")
            If r.IsInfoInvoiceNull And r.IsInfoReservationNull And r.IsInfoReceptionDateNull And r.IsInfoApprovalDateNull Then r.Delete()
        Next
        t.AcceptChanges()
        Return t
    End Function

End Class
