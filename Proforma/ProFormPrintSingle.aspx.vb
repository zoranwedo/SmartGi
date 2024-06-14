Imports System.Data.SqlClient
Imports System.Data

Partial Class Proforma_ProFormPrintSingle
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Me.IsPostBack = False Then
            Dim iID As Integer = Request.QueryString("ProformaID")
            lblTitle.Text = String.Format("Print <u>PF {0:D6}</u>", iID)
        End If
    End Sub

    Protected Sub btnPrint_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrint.Click
        PrintProforma()
    End Sub

    Protected Sub ShowError(ByVal title As String, ByVal ex As Exception)
        pnlError.Visible = True
        lblError.Text = title
        lblErrMsg.Text = ex.Message
        If ex.InnerException IsNot Nothing Then lblErrMsg.Text += "<br />" & ex.InnerException.Message
        btnPrint.Enabled = False
    End Sub

    Protected Sub PrintProforma()
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim renderformat As String = ReportFormat()
        Dim renderfile As String = ReportFilename()
        Dim sepCh As Boolean = False
        Dim excCM As Boolean = True

        Dim iID As Integer = Request.QueryString("ProformaID")
        Dim qProforma_Print As New dsProformaSearchTableAdapters.Proforma_PrintTableAdapter()
        Dim qProformaItem As New dsProformaSearchTableAdapters.ProformaItemTableAdapter()
        Dim qProformaDetail_Print As New dsProformaSearchTableAdapters.ProformaDetail_PrintTableAdapter()
        Dim qInvoice_Print_CM As New dsCoopMarketingTableAdapters.Invoice_Print_CMTableAdapter()

        Dim Proforma_Print As DataTable = qProforma_Print.GetData(iID)
        Dim ProformaItem As DataTable = qProformaItem.GetData(iID, cbCancelled.Checked)
        Dim ProformaDetail_Print As DataTable = qProformaDetail_Print.GetData(iID, cbCancelled.Checked)
        Dim Invoice_Print_CM As DataTable = New dsCoopMarketing.Invoice_Print_CMDataTable()

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        If cbChSeparate.Checked Then
            lr.ReportPath = "Reports\Invoices\RptInvoiceDetailSeparatedCh.rdlc"
            lr.DataSources.Clear()
            lr.DataSources.Add(New ReportDataSource("ReportsInvoice_InvoiceItem", ProformaItem))
            lr.DataSources.Add(New ReportDataSource("dsCoopMarketing_Invoice_Print_CM", Invoice_Print_CM))
        Else
            lr.ReportPath = "Reports\Invoices\RptInvoiceDetail.rdlc"
            lr.DataSources.Clear()
            lr.DataSources.Add(New ReportDataSource("ReportsInvoice_InvoiceDetail_Print", ProformaDetail_Print))
            lr.DataSources.Add(New ReportDataSource("dsCoopMarketing_Invoice_Print_CM", Invoice_Print_CM))
        End If
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportsInvoice_Invoice_Print", Proforma_Print))
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

    Protected Function ReportFilename() As String
        Dim q As New dsProformaSearchTableAdapters.QueriesTableAdapter
        Return q.ProformaFilename(Int32.Parse(Request.QueryString("ProformaID")))
    End Function

    Protected Function ReportFormat() As String
        Dim r As String = "PDF"
        If cbExcel.Checked Then r = "EXCEL"
        Return r
    End Function

    Protected Function ReportContent() As String
        Dim r As String = "application/pdf"
        If cbExcel.Checked Then r = "application/excel"
        Return r
    End Function

    Protected Function ReportParams() As ReportParameter()
        Dim q As New dsProformaSearchTableAdapters.QueriesTableAdapter
        Dim layout As Integer = 0
        Try
            layout = q.FnLayout(Int32.Parse(Request.QueryString("ProformaID")))
        Catch ex As Exception
        End Try

        Dim p As ReportParameter() = { _
            New ReportParameter("ch1Label", "Inf"), _
            New ReportParameter("ch1Visible", True), _
            New ReportParameter("ch2Label", "Chld"), _
            New ReportParameter("ch2Visible", True), _
            New ReportParameter("ch3Label", "Jun"), _
            New ReportParameter("ch3Visible", True), _
            New ReportParameter("ch4Label", "Jun2"), _
            New ReportParameter("ch4Visible", False), _
            New ReportParameter("hotel", False), _
            New ReportParameter("user", Membership.GetUser.UserName), _
            New ReportParameter("CM", False), _
            New ReportParameter("Layout", layout)}

        Return p
    End Function
End Class
