
Partial Class Reports_Contracts__RptTourOp
    Inherits System.Web.UI.Page

    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        fltName.Text = Nothing
        fltCity.Text = Nothing
        fltCountry.Text = Nothing
        ddlMarkets.SelectedValue = Nothing
        ddlPay.SelectedValue = Nothing
        ddlPaymode.SelectedValue = Nothing
        ddlContactType.SelectedValue = Nothing
        TextBox1.Text = Nothing
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
        lr.ReportPath = "Reports\Contracts\RptTourOpPlain.rdlc"

        Dim fs As String = PFilterString()
        Dim pfilter As New ReportParameter("filterstring", fs)
        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)

        Dim p As ReportParameter() = {pfilter, puser}
        lr.SetParameters(p)

        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("CntReports_FilterTOContact", dsPlain))

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

    Protected Sub btnReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button5.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"

        Dim bytes As Byte()
        Dim lr As New Microsoft.Reporting.WebForms.LocalReport

        If ModificationRights.RightsHotel Then 
            lr.ReportPath = "Reports\Contracts\RptTourOpH.rdlc"
        Else
            lr.ReportPath = "Reports\Contracts\RptTourOp.rdlc"
        End If

        Dim fs As String = PFilterString()
        Dim pfilter As New ReportParameter("filterstring", fs)
        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)

        Dim p As ReportParameter() = {pfilter, puser}
        lr.SetParameters(p)

        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("CntReports_FilterTOContact", dsTOSearch))

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

    Protected Function PFilterString() As String
        Dim strFilter As String = ""
        If Not (fltName.Text = Nothing) Then strFilter &= IIf(strFilter = "", "For name ", "/For name ") & fltName.Text
        If Not (fltCity.Text = Nothing) Then strFilter &= IIf(strFilter = "", "For city ", "/For city ") & fltCity.Text
        If Not (TextBox1.Text = Nothing) Then strFilter &= IIf(strFilter = "", "For credit days ", "/For credit days ") & TextBox1.Text

        If Not (ddlMarkets.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For market ", "/For market ") & ddlMarkets.SelectedValue
        If Not (ddlPaymode.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For pay mode  ", "/For pay mode  ") & ddlPaymode.SelectedItem.Text
        If Not (ddlPay.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For pay cond. ", "/For pay cond. ") & ddlPay.SelectedItem.Text
        If Not (ddlContactType.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For contact type ", "/For contact type  ") & ddlContactType.SelectedItem.Text
        If Not (ddlState.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For state ", "/For state ") & ddlState.SelectedItem.Text

        Return strFilter
    End Function

End Class
