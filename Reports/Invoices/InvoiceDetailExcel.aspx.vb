
Partial Class Reports_Invoices_InvoiceDetailExcel
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
        lr.ReportPath = "Reports\Invoices\RptInvoiceDetNew.rdlc"

        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportsInvoice_Invoice_Print", dsRptInvoice))
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportsInvoice_InvoiceDetail_Print", dsInvoiceDetail))
        lr.Refresh()

        'Dim pr As New dsMaintHotelTableAdapters.HotelOcuppancyTableAdapter
        'Dim hp As dsMaintHotel.HotelOcuppancyRow
        'hp = pr.GetData(Integer.Parse(Request.QueryString("HotelID"))).Rows(0)
        Dim pr As New dsInvoicesTableAdapters.InvoiceGetPolicyTableAdapter
        Dim t As dsInvoices.InvoiceGetPolicyDataTable
        Dim hp As dsInvoices.InvoiceGetPolicyRow

        t = pr.GetData(Int32.Parse(Request.QueryString(0)))
        hp = t.Rows(0)

        Dim param1 As ReportParameter
        Dim param2 As ReportParameter
        Dim param3 As ReportParameter
        Dim param4 As ReportParameter

        Dim paramV1 As New ReportParameter("ch1Visible", hp.ChldCategories > 0)
        Dim paramV2 As New ReportParameter("ch2Visible", hp.ChldCategories > 1)
        Dim paramV3 As New ReportParameter("ch3Visible", hp.ChldCategories > 2)
        Dim paramV4 As New ReportParameter("ch4Visible", hp.ChldCategories > 3)
        If hp.Chld1ShLabel IsNot Nothing Then param1 = New ReportParameter("ch1Label", hp.Chld1ShLabel) Else param1 = New ReportParameter("ch1Label", "-")
        If hp.Chld2ShLabel IsNot Nothing Then param2 = New ReportParameter("ch2Label", hp.Chld2ShLabel) Else param2 = New ReportParameter("ch2Label", "-")
        If hp.Chld3ShLabel IsNot Nothing Then param3 = New ReportParameter("ch3Label", hp.Chld3ShLabel) Else param3 = New ReportParameter("ch3Label", "-")
        If hp.Chld4ShLabel IsNot Nothing Then param4 = New ReportParameter("ch4Label", hp.Chld4ShLabel) Else param4 = New ReportParameter("ch4Label", "-")
        Dim photel As New ReportParameter("hotel", Request.QueryString("HotelChecked"))
        Dim puser As New ReportParameter("user", user)

        Dim p As ReportParameter() = {param1, paramV1, param2, paramV2, param3, paramV3, param4, paramV4, photel, puser}
        lr.SetParameters(p)

        bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)

        Try
            Response.ClearContent()
            Response.ClearHeaders()
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Invoice.xls" + """")
            Response.BinaryWrite(bytes)
            Response.Flush()
            'Response.Close()
            Response.End()
        Catch ex As Exception

        End Try
    End Sub
End Class
