
Partial Class Reports_Invoices_RoomNights
    Inherits System.Web.UI.Page

    Protected Sub btClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btClear.Click
        ddlHtlGroup.SelectedIndex = 0
        ddlHotel.SelectedIndex = 0
        ddlToGroup.SelectedIndex = 0
        ddlTO.SelectedIndex = 0
        ddlPayCond.SelectedValue = ""
        ddlMarkets.SelectedValue = ""
        fltInvDateFrom.Text = Nothing
        fltInvDateTo.Text = Nothing
    End Sub

    Protected Sub btReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btReport.Click
        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        Dim photel As New ReportParameter("hotel", Me.cbHotel.Checked)
        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim pfilter As New ReportParameter("reportFilter", PFilterString())
        Dim p As ReportParameter() = {puser, photel, pfilter}

        lr.ReportPath = "Reports\Invoices\RoomNights.rdlc"
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsRoomNights_InvRoomNights_Group", dsRoomNights))
        lr.SetParameters(p)

        Dim bytes As Byte()
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim streamids As String() = Nothing
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"

        Response.ClearContent()
        Response.ClearHeaders()

        If cbExcel.Checked Then
            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Room Nights.xls" + """")
        Else
            bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/pdf"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Room Nights.pdf" + """")
        End If

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Function PFilterString() As String
        Dim strFilter As String = ""

        If Not (ddlHtlGroup.SelectedIndex = 0) Then strFilter = "For hotel group " & ddlHtlGroup.SelectedItem.Text
        If Not (ddlHotel.SelectedIndex = 0) Then strFilter &= IIf(strFilter = "", "For hotel ", " AND For hotel ") & ddlHotel.SelectedItem.Text
        If Not (ddlToGroup.SelectedIndex = 0) Then strFilter &= IIf(strFilter = "", "For tour operator group ", " AND For tour operator group ") & ddlToGroup.SelectedItem.Text
        If Not (ddlTO.SelectedIndex = 0) Then strFilter &= IIf(strFilter = "", "For tour operator ", " AND For tour operator ") & ddlTO.SelectedItem.Text
        If Not (ddlMarkets.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For market ", " AND For market ") & ddlMarkets.Text
        If Not (ddlPayCond.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For pay condition ", " AND For pay condition ") & ddlPayCond.SelectedItem.Text
        If Not (fltInvDateFrom.Text = Nothing) Then strFilter &= IIf(strFilter = "", "From invoice date ", " AND From invoice date ") & fltInvDateFrom.Text
        If Not (fltInvDateTo.Text = Nothing) Then strFilter &= IIf(strFilter = "", "To invoice date ", " AND To invoice date ") & fltInvDateTo.Text

        Return strFilter
    End Function

    Protected Sub dsRoomNights_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles dsRoomNights.Selecting
        If e.InputParameters("HotelGroupID") = 0 Then e.InputParameters("HotelGroupID") = Nothing
        If e.InputParameters("HotelID") = 0 Then e.InputParameters("HotelID") = Nothing
        If e.InputParameters("TourOpGroupID") = 0 Then e.InputParameters("TourOpGroupID") = Nothing
        If e.InputParameters("TourOpId") = 0 Then e.InputParameters("TourOpId") = Nothing
    End Sub
End Class
