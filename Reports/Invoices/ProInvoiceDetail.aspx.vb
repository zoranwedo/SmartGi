
Partial Class Reports_Invoices_ProInvoiceDetail
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()
        Dim user As String = Membership.GetUser.UserName

        'If ModificationRights.RightsOperator Then
        '    Dim setprint As New InvoicesTableAdapters.InvoiceQueries
        '    setprint.Invoice_SetPrint(Request.QueryString("InvoiceID"), user)
        'End If


        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Reports\Invoices\RptProFormaDetNew.rdlc"

        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportsInvoice_Invoice_Print", dsRptInvoice))
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportsInvoice_InvoiceDetail_Print", dsInvoiceDetail))
        lr.Refresh()


        Dim pr As New dsMaintHotelTableAdapters.HotelOcuppancyTableAdapter
        Dim hp As dsMaintHotel.HotelOcuppancyRow

        hp = pr.GetData(Integer.Parse(Request.QueryString("HotelID"))).Rows(0)

        Dim param1 As New ReportParameter("ch1Label", hp.Chld1ShLabel)
        Dim paramV1 As New ReportParameter("ch1Visible", hp.ChldCategories > 0)
        Dim param2 As New ReportParameter("ch2Label", hp.Chld2ShLabel)
        Dim paramV2 As New ReportParameter("ch2Visible", hp.ChldCategories > 1)
        Dim param3 As New ReportParameter("ch3Label", hp.Chld3ShLabel)
        Dim paramV3 As New ReportParameter("ch3Visible", hp.ChldCategories > 2)
        Dim param4 As New ReportParameter("ch4Label", hp.Chld4ShLabel)
        Dim paramV4 As New ReportParameter("ch4Visible", hp.ChldCategories > 3)
        Dim photel As New ReportParameter("hotel", Request.QueryString("HotelChecked"))
        Dim puser As New ReportParameter("user", user)

        Dim p As ReportParameter() = {param1, paramV1, param2, paramV2, param3, paramV3, param4, paramV4, photel, puser}
        lr.SetParameters(p)
        bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)

        Try
            Response.ClearContent()
            Response.ClearHeaders()
            Response.ContentType = "application/pdf"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "ProInvoice.pdf" + """")
            Response.BinaryWrite(bytes)
            Response.Flush()
            'Response.Close()
            Response.End()
        Catch ex As Exception

        End Try
    End Sub
End Class
