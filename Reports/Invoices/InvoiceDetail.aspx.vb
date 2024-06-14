Partial Class Reports_Invoices_InvoiceDetail
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("Comment") IsNot Nothing Then
            PrintInvoiceComment()
        Else
            PrintInvoice()
        End If
    End Sub

    Protected Sub PrintInvoice()
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim renderformat As String = ReportFormat()
        Dim renderfile As String = ReportFilename()
        Dim sepCh As Boolean = False
        Dim excCM As Boolean = True

        If Request.QueryString("SeparateChildren") IsNot Nothing Then sepCh = Request.QueryString("SeparateChildren")

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        If sepCh Then
            lr.ReportPath = "Reports\Invoices\RptInvoiceDetailSeparatedCh.rdlc"
            lr.DataSources.Clear()
            lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportsInvoice_InvoiceItem", dsInvoiceItem))
            lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsCoopMarketing_Invoice_Print_CM", dsCM))
        Else
            lr.ReportPath = "Reports\Invoices\RptInvoiceDetail.rdlc"
            lr.DataSources.Clear()
            lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportsInvoice_InvoiceDetail_Print", dsInvoiceDetail))
            lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsCoopMarketing_Invoice_Print_CM", dsCM))
        End If
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportsInvoice_Invoice_Print", dsRptInvoice))
        lr.SetParameters(ReportParams())

        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte() = lr.Render(renderformat, deviceInfo, mimeType, encoding, extension, streamids, warnings)

        Response.ClearContent()
        Response.ClearHeaders()
        Response.ContentType = ReportContent()
        Response.AppendHeader("Content-Disposition", "attachment; filename=" & renderfile & "." + extension)
        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Sub PrintInvoiceComment()
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim renderformat As String = ReportFormat()
        Dim renderfile As String = ReportFilename() & "(comments)"

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Reports\Invoices\RptInvoiceCommNew.rdlc"
        lr.SetParameters(ReportParams())
        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportsInvoice_Invoice_Print", dsRptInvoice))
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsInvoices_InvoiceComment", dsInvoiceComment))

        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte() = lr.Render(renderformat, deviceInfo, mimeType, encoding, extension, streamids, warnings)

        Response.ClearContent()
        Response.ClearHeaders()
        Response.ContentType = ReportContent()
        Response.AppendHeader("Content-Disposition", "attachment; filename=" & renderfile & "." + extension)
        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Function ReportParams() As ReportParameter()
        Dim pr As New dsInvoicesTableAdapters.InvoiceGetPolicyTableAdapter
        Dim hp As dsInvoices.InvoiceGetPolicyRow = pr.GetPrintData(Int32.Parse(Request.QueryString(0))).Rows(0)
        Dim lq As New dsCompanyTableAdapters.FnLayoutTableAdapter
        Dim lt As dsCompany.FnLayoutDataTable = lq.GetData(Int32.Parse(Request.QueryString(0)))
        Dim layout As Integer = 0
        If lt.Rows.Count > 0 Then layout = CType(lt.Rows(0), dsCompany.FnLayoutRow).FnLayout

        Dim user As String = Membership.GetUser.UserName
        Dim excCM As Boolean = False
        If Request.QueryString("CM") IsNot Nothing Then excCM = Request.QueryString("CM")
        If Request.QueryString("GrossBilling") IsNot Nothing Then If Request.QueryString("GrossBilling") Then user = user & " (gb)"

        If hp.Chld1ShLabel Is Nothing Then hp.Chld1ShLabel = "-"
        If hp.Chld2ShLabel Is Nothing Then hp.Chld2ShLabel = "-"
        If hp.Chld3ShLabel Is Nothing Then hp.Chld3ShLabel = "-"
        If hp.Chld4ShLabel Is Nothing Then hp.Chld4ShLabel = "-"

        Dim p As ReportParameter() = { _
            New ReportParameter("ch1Label", hp.Chld1ShLabel), _
            New ReportParameter("ch1Visible", hp.ChldCategories > 0), _
            New ReportParameter("ch2Label", hp.Chld2ShLabel), _
            New ReportParameter("ch2Visible", hp.ChldCategories > 1), _
            New ReportParameter("ch3Label", hp.Chld3ShLabel), _
            New ReportParameter("ch3Visible", hp.ChldCategories > 2), _
            New ReportParameter("ch4Label", hp.Chld4ShLabel), _
            New ReportParameter("ch4Visible", hp.ChldCategories > 3), _
            New ReportParameter("hotel", ReportHotel), _
            New ReportParameter("user", user), _
            New ReportParameter("CM", excCM), _
            New ReportParameter("Layout", layout)}
        Return p
    End Function

    Protected Function ReportHotel() As String
        Dim r As String = "False"
        If Not String.IsNullOrEmpty(Request.QueryString("HotelChecked")) Then r = Request.QueryString("HotelChecked")
        Return r
    End Function

    Protected Function ReportFilename() As String
        Dim q As New ReportsInvoiceTableAdapters.QueriesTableAdapter
        Return q.InvoiceFilename(Int32.Parse(Request.QueryString("InvoiceID")))
    End Function

    Protected Function ReportFormat() As String
        Dim r As String = "PDF"
        If Not String.IsNullOrEmpty(Request.QueryString("Excel")) Then r = "EXCEL"
        Return r
    End Function

    Protected Function ReportContent() As String
        Dim r As String = "application/pdf"
        If Not String.IsNullOrEmpty(Request.QueryString("Excel")) Then r = "application/excel"
        Return r
    End Function

End Class
