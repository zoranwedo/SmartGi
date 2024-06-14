Imports System.Data.SqlClient
Imports System.Data

Partial Class Proforma_ProFormPrint
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Me.IsPostBack = False Then
            Dim iID As Integer = Request.QueryString("ProformaID")

            lblTitle.Text = "Print Proforma"
            pnlFlat.Visible = False
            cbCommision.Enabled = False
            cbCommision.Checked = False
            cbCommision2.Enabled = False
            cbCommision2.Checked = False
            cbHotel.Checked = False

            Dim q1 As New dsProformaPrintTableAdapters.PrtProformaRowsCheckTableAdapter
            Dim t1 As dsProformaPrint.PrtProformaRowsCheckDataTable
            t1 = q1.GetData(iID)
            If t1.Rows.Count > 0 Then
                pnlFlat.Visible = (t1(0).Cnt > 0)
                lblTitle.Text = "Print <u>PF " & t1(0).InvDocNum & "</u>"
                hfProforma.Value = t1(0).InvDocNum
            End If

            Dim q2 As New dsProformaPrintTableAdapters.PrtProformaCommisionCheckTableAdapter
            Dim t2 As dsProformaPrint.PrtProformaCommisionCheckDataTable
            t2 = q2.GetData(iID)
            If t2.Rows.Count > 0 Then
                If t2(0).Commision Then
                    cbCommision.Enabled = True
                    cbCommision.Checked = True
                    cbCommision.Text = "Apply Commision of " & t2(0).CommisionRate.ToString & "%"
                    cbCommision2.Enabled = True
                    cbCommision2.Text = "Add Commision of " & t2(0).CommisionRate.ToString & "%"
                End If
            End If

            If Not String.IsNullOrEmpty(Request.QueryString("Hotel")) Then cbHotel.Checked = Request.QueryString("Hotel")
        End If
    End Sub

    Protected Sub btnPrint_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrint.Click
        If rbStandard.Checked Then
            PrintProforma()
        Else
            PrintProformaNC()
        End If
    End Sub

    Protected Sub ShowError(ByVal title As String, ByVal ex As Exception)
        pnlFlat.Visible = False
        pnlError.Visible = True
        lblError.Text = title
        lblErrMsg.Text = ex.Message
        If ex.InnerException IsNot Nothing Then lblErrMsg.Text += "<br />" & ex.InnerException.Message
        btnPrint.Enabled = False
    End Sub

    Protected Sub PrintProforma()
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim bytes As Byte()
        Dim strNum As String = hfProforma.Value

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Proforma\Proforma05.rdlc"

        Try
            Dim iID As Integer = Request.QueryString("ProformaID")
            Dim aHeader As New dsProformaPrintTableAdapters.PrtProformaHeaderTableAdapter
            Dim aDetail As New dsProformaPrintTableAdapters.PrtProformaRRowsTableAdapter
            Dim aAded As New dsProformaPrintTableAdapters.PrtProformaAddedValueTableAdapter
            Dim aCharging As New dsProformaPrintTableAdapters.PrtProformaChargingTableAdapter
            Dim aCommision As New dsProformaPrintTableAdapters.PrtProformaCommisionTableAdapter
            Dim tCommision As New dsProformaPrint.PrtProformaCommisionDataTable

            lr.DataSources.Add(New ReportDataSource("dsProformaPrint_PrtProformaHeader", CType(aHeader.GetData(iID), DataTable)))
            lr.DataSources.Add(New ReportDataSource("dsProformaPrint_PrtProformaHeader", CType(aHeader.GetData(iID), DataTable)))
            lr.DataSources.Add(New ReportDataSource("dsProformaPrint_PrtProformaRRows", CType(aDetail.GetData(iID, cbHotel.Checked, cbCancelled.Checked, cbCommision.Checked), DataTable)))
            lr.DataSources.Add(New ReportDataSource("dsProformaPrint_PrtProformaAddedValue", CType(aAded.GetData(iID), DataTable)))
            lr.DataSources.Add(New ReportDataSource("dsProformaPrint_PrtProformaCharging", CType(aCharging.GetData(iID, cbHotel.Checked, cbCommision.Checked Or cbCommision2.Checked), DataTable)))
            If cbCommision2.Checked Then aCommision.Fill(tCommision, iID)
            lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsProformaPrint_PrtProformaCommision", CType(tCommision, DataTable)))

            Dim p As String = "s"
            p = p & IIf(cbHotel.Checked, "1", "0")
            p = p & IIf(cbCommision.Checked, "1", IIf(cbCommision2.Checked, "2", "0"))
            p = p & IIf(cbCancelled.Checked, "1", "0")
            lr.SetParameters(New ReportParameter() {New ReportParameter("version", p)})

            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ClearContent()
            Response.ClearHeaders()
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" & strNum & ".xls" + """")
            Response.BinaryWrite(bytes)
            Response.Flush()
            'Response.Close()
            Response.End()
        Catch ex As Exception
            ShowError("Error rendering report:", ex)
        End Try
    End Sub

    Protected Sub PrintProformaNC()
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim bytes As Byte()
        Dim strNum As String = hfProforma.Value

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Proforma\ProformaNC03.rdlc"

        Try
            Dim iID As Integer = Request.QueryString("ProformaID")
            Dim aHeader As New dsProformaPrintTableAdapters.PrtProformaHeaderTableAdapter
            Dim aDetail As New dsProformaPrintTableAdapters.PrtProformaRDetailTableAdapter
            Dim aAded As New dsProformaPrintTableAdapters.PrtProformaAddedValueTableAdapter
            Dim aCharging As New dsProformaPrintTableAdapters.PrtProformaChargingTableAdapter
            Dim aCommision As New dsProformaPrintTableAdapters.PrtProformaCommisionTableAdapter
            Dim tCommision As New dsProformaPrint.PrtProformaCommisionDataTable

            lr.DataSources.Add(New ReportDataSource("dsProformaPrint_PrtProformaHeader", CType(aHeader.GetData(iID), DataTable)))
            lr.DataSources.Add(New ReportDataSource("dsProformaPrint_PrtProformaRDetail", CType(aDetail.GetData(iID, cbHotel.Checked, cbCancelled.Checked, cbCommision.Checked), DataTable)))
            lr.DataSources.Add(New ReportDataSource("dsProformaPrint_PrtProformaAddedValue", CType(aAded.GetData(iID), DataTable)))
            lr.DataSources.Add(New ReportDataSource("dsProformaPrint_PrtProformaCharging", CType(aCharging.GetData(iID, cbHotel.Checked, cbCommision.Checked Or cbCommision2.Checked), DataTable)))
            If cbCommision2.Checked Then aCommision.Fill(tCommision, iID)
            lr.DataSources.Add(New ReportDataSource("dsProformaPrint_PrtProformaCommision", CType(tCommision, DataTable)))

            Dim p As String = "f"
            p = p & IIf(cbHotel.Checked, "1", "0")
            p = p & IIf(cbCommision.Checked, "1", IIf(cbCommision2.Checked, "2", "0"))
            p = p & IIf(cbCancelled.Checked, "1", "0")
            lr.SetParameters(New ReportParameter() {New ReportParameter("version", p)})

            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ClearContent()
            Response.ClearHeaders()
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" & strNum & ".xls" + """")
            Response.BinaryWrite(bytes)
            Response.Flush()
            'Response.Close()
            Response.End()
        Catch ex As Exception
            ShowError("Error rendering report:", ex)
        End Try
    End Sub
End Class
