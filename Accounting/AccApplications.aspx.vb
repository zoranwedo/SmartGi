Imports App_UserControls_MessagePop

Partial Class Accounting_AccApplications
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        hfUser.Value = Membership.GetUser.UserName

        If Not (Page.IsPostBack) Then
            If ModificationRights.RightsHotel Then
                cbHotel.Checked = True
                cbHotel.Visible = False
            Else
                cbHotel.Visible = True
            End If
        End If

        gvApplications.Columns(6).Visible = cbHotel.Checked
        gvApplications.Columns(8).ItemStyle.Width = IIf(cbHotel.Checked, Unit.Pixel(300), Unit.Pixel(382))

        gvApplications.Columns(5).FooterText = Master.Balance.ToString("N2")
        gvApplications.Columns(6).FooterText = Master.HBalance.ToString("N2")
        btnByBooking.Visible = Master.ArCredit()
        btnByBooking.Enabled = Master.CanApply
        btnApply.Enabled = Master.CanApply
        btnTransfer.Enabled = Master.CanApply

        Dim strRefresh As String = String.Format("document.getElementById('{0}').click();", btnRefresh.ClientID)
        popByBookExtender.OnOkScript = strRefresh
        popByBookExtender.OnCancelScript = strRefresh
        popByAnyExtender.OnOkScript = strRefresh
        popByAnyExtender.OnCancelScript = strRefresh
    End Sub

    Public Function ByBookingSrc() As String
        Return String.Format("AccBookApplication.aspx?TransID=0&DocumentID={0}", Request.QueryString("DocumentID"))
    End Function

    Public Function ByAnySrc() As String
        Return String.Format("AccAnyApplication.aspx?TransID=0&DocumentID={0}", Request.QueryString("DocumentID"))
    End Function

    Protected Sub gvApplications_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvApplications.DataBinding
        gvApplications.Columns(6).Visible = cbHotel.Checked
    End Sub

    Protected Sub btnRefresh_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRefresh.Click
        Response.Redirect(String.Format("AccApplications.aspx?DocumentID={0}", Request.QueryString("DocumentID")))
    End Sub

    Protected Sub cbCanceled_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbCanceled.CheckedChanged
        gvApplications.DataBind()
    End Sub

    Protected Sub btnTransfer_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnTransfer.Click
        Me.Response.Redirect("AccTransfer.aspx?DocumentID=" & Me.Request.QueryString(0))
    End Sub

    Protected Sub btDeapply_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim q As New dsAccountingTableAdapters.QueriesTableAdapter
        Dim usr As String = Membership.GetUser.UserName
        Dim transid As Integer
        Dim docid As Integer
        Dim grv As GridViewRow
        Dim canaply As Boolean

        For Each grv In gvApplications.Rows
            transid = Int32.Parse(grv.Cells(0).Text)
            docid = Int32.Parse(grv.Cells(2).Text)
            canaply = CType(grv.FindControl("btDeapply"), LinkButton).Visible

            If canaply Then
                Try
                    q.AccApplicationDeapply(transid, docid, usr)
                Catch ex As Exception
                    msgPop.ShowError(ex)
                End Try
            End If
        Next
        gvApplications.DataBind()
    End Sub

    Protected Sub gvApplications_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvApplications.RowCommand
        'deapply
        If e.CommandName = "Deapply" Then
            Dim q As New dsAccountingTableAdapters.QueriesTableAdapter
            Dim usr As String = Membership.GetUser.UserName
            Dim transid As Integer = Int32.Parse(CType(CType((e.CommandSource), LinkButton).NamingContainer, GridViewRow).Cells(0).Text)
            Dim docid As Integer = Int32.Parse(CType(CType((e.CommandSource), LinkButton).NamingContainer, GridViewRow).Cells(2).Text)

            Dim info As String = e.CommandArgument.ToString()
            Try
                q.AccApplicationDeapply(transid, docid, usr)
                gvApplications.DataBind()
            Catch ex As Exception
                msgPop.ShowError(ex)
            End Try
        End If

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

    Protected Sub btnReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReport.Click
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
        lr.ReportPath = "Reports\Accounting\RptApplicationDetail.rdlc"
        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsAccounting_DocHeader", dsDocHeader))
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("AccDocApplication_SelectAccDocAppl", dsApplications))
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsAccounting_SelectAccDocStatus", dsAppStatus))
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsAccRegistration_AccTransDocumentAddInfo", AddInfo()))

        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim photel As New ReportParameter("hotel", cbHotel.Checked)
        Dim p As ReportParameter() = {puser, photel}
        lr.SetParameters(p)

        bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)

        Response.ClearContent()
        Response.ClearHeaders()
        Response.ContentType = "application/pdf"
        Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Document Application.pdf" + """")
        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Sub btnBatch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBatch.Click
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

        lr.ReportPath = "Reports\Accounting\RptHistoricalBatch.rdlc"
        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("AccDocApplication_SelectAccDocBatch", dsBatch))

        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim photel As New ReportParameter("hotel", cbHotel.Checked)
        Dim ptoH As New ReportParameter("toH", Master.GetTourOperator)
        Dim photelH As New ReportParameter("hotelH", Master.GetHotel)
        Dim p As ReportParameter() = {puser, photel, ptoH, photelH}
        lr.SetParameters(p)

        bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)

        Response.ClearContent()
        Response.ClearHeaders()
        Response.ContentType = "application/pdf"
        Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Historical Batch.pdf" + """")
        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Sub btnBatchBook_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBatchBook.Click
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

        lr.ReportPath = "Reports\Accounting\RptHistoricalBatchBooking.rdlc"
        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("AccDocApplication_SelectAccDocBatchBooking", dsBatchBook))

        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim photel As New ReportParameter("hotel", cbHotel.Checked)
        Dim ptoH As New ReportParameter("toH", Master.GetTourOperator)
        Dim photelH As New ReportParameter("hotelH", Master.GetHotel)
        Dim p As ReportParameter() = {puser, photel, ptoH, photelH}
        lr.SetParameters(p)

        bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)

        Response.ClearContent()
        Response.ClearHeaders()
        Response.ContentType = "application/pdf"
        Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Historical Batch.pdf" + """")
        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

End Class
