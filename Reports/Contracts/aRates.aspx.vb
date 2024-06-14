
Partial Class Reports_Contracts_aRates
    Inherits System.Web.UI.Page

    Public Sub aRatesSubreportProc(ByVal sender As Object, ByVal e As SubreportProcessingEventArgs)
        If e.ReportPath.Contains("aRatesContract") Then
            dsContract.DataBind()
            e.DataSources.Add(New ReportDataSource("CntReports_RateSheetCtrRpt", dsContract))
        ElseIf e.ReportPath.Contains("aRatesRates") Then
            dsRates.DataBind()
            e.DataSources.Add(New ReportDataSource("CntReports_RateShRate", dsRates))
        ElseIf e.ReportPath.Contains("aRatesOccup") Then
            dsOccup.DataBind()
            e.DataSources.Add(New ReportDataSource("CntReports_RateShOcc", dsOccup))
            'ElseIf e.ReportPath.Contains("aRatesDisc") Then
            '    dsDisc.DataBind()
            '    e.DataSources.Add(New ReportDataSource("CntReports_RateShDisc", dsDisc))
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim cID As Integer = Request.QueryString(0)

        Dim bytes As Byte()
        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Reports\Contracts\aRates.rdlc"
        AddHandler lr.SubreportProcessing, AddressOf aRatesSubreportProc

        dsBase.DataBind()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("CntReports_RateBase", dsBase))

        bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
        Response.ClearContent()
        Response.ClearHeaders()
        Response.ContentType = "application/pdf"
        Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "RateSheet.pdf" + """")
        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub
End Class
