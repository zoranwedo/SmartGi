
Partial Class Reports_Contracts_TourOpReport
    Inherits System.Web.UI.Page

    Public Function IsHotel() As Boolean
        Return ModificationRights.RightsHotel()
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        btnReport.Visible = Not IsHotel()
    End Sub

    Protected Sub dsTOSearch_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles dsTOSearch.Selecting
        e.InputParameters("UserName") = My.User.Name
    End Sub

    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        fltName.Text = String.Empty
        ddlMarkets.SelectedIndex = 0
        ddlPay.SelectedIndex = 0
        ddlPaymode.SelectedIndex = 0
        ddlCountryCode.SelectedIndex = 0
        fltCity.Text = String.Empty
        ddlContactType.SelectedIndex = 0
        cbActive.Checked = True
    End Sub

    Protected Sub btnRecap_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRecap.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"

        Dim bytes As Byte()
        Dim lr As New Microsoft.Reporting.WebForms.LocalReport

        lr.ReportPath = "Reports\Contracts\TourOpRecap.rdlc"

        Dim pUser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim pFilter As New ReportParameter("filterString", FilterParam())
        Dim pActive As New ReportParameter("onlyActive", cbActive.Checked)
        Dim pHotel As New ReportParameter("hotel", IsHotel)

        Dim p As ReportParameter() = {pUser, pFilter, pActive, pHotel}
        lr.SetParameters(p)

        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsTourOperator_TourOpReport", dsTOSearch))

        If cbExcel.Checked Then
            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ClearContent()
            Response.ClearHeaders()
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "List of Tour Operator.xls" + """")

        Else
            bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ClearContent()
            Response.ClearHeaders()
            Response.ContentType = "application/pdf"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "List of Tour Operator.pdf" + """")
        End If

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Sub btnReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReport.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"

        Dim bytes As Byte()
        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Reports\Contracts\TourOpReport.rdlc"

        Dim pUser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim pFilter As New ReportParameter("filterString", FilterParam())
        Dim pActive As New ReportParameter("onlyActive", cbActive.Checked)
        Dim pHotel As New ReportParameter("hotel", IsHotel)

        Dim p As ReportParameter() = {pUser, pFilter, pActive, pHotel}
        lr.SetParameters(p)

        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsTourOperator_TourOpReport", dsTOSearch))

        If cbExcel.Checked Then
            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ClearContent()
            Response.ClearHeaders()
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "List of Tour Operator.xls" + """")

        Else
            bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ClearContent()
            Response.ClearHeaders()
            Response.ContentType = "application/pdf"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "List of Tour Operator.pdf" + """")
        End If

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub


    Protected Function FilterParam() As String
        Dim pfc As New List(Of String)

        If Not String.IsNullOrEmpty(fltName.Text) Then pfc.Add("for tour operators like: '" & fltName.Text & "'")
        If ddlMarkets.SelectedValue <> String.Empty Then pfc.Add("for " & ddlMarkets.SelectedItem.Text & " market")
        If ddlPay.SelectedValue <> String.Empty Then pfc.Add("for payment condition: " & ddlPay.SelectedItem.Text)
        If ddlPaymode.SelectedValue <> String.Empty Then pfc.Add("for payment mode: " & ddlPay.SelectedItem.Text)
        If ddlCountryCode.SelectedValue <> String.Empty Then pfc.Add("for county: " & ddlCountryCode.SelectedItem.Text)
        If Not String.IsNullOrEmpty(fltCity.Text) Then pfc.Add("for city like: '" & fltCity.Text & "'")
        If ddlContactType.SelectedIndex <> 0 Then pfc.Add("include contacts: " & ddlContactType.SelectedItem.Text)
        pfc.Add(IIf(cbActive.Checked, "only active", "include inactive"))

        Dim pfs As String = String.Empty
        If pfc.Count > 0 Then
            pfs = Join(pfc.ToArray, " AND ")
            pfs = pfs.Substring(0, 1).ToUpper & pfs.Substring(1)
        End If

        Return pfs
    End Function
End Class
