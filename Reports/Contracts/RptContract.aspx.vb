Imports Microsoft.VisualBasic
Partial Class Reports_Contracts_RptContract

    Inherits System.Web.UI.Page

    Protected Sub btClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btClear.Click
        ddlHotel.SelectedValue = ""
        ddlTO.SelectedValue = ""
        ddlMarkets.SelectedValue = ""
        fltName.Text = Nothing
        fltRate.Text = Nothing
        fltStart.Text = Nothing
        fltFinish.Text = Nothing
        fltBkStart.Text = Nothing
        fltBkEnd.Text = Nothing
        rblRecieved.SelectedValue = 0
        cblRateType.Items(0).Selected = True
        cblRateType.Items(1).Selected = True
        cblRateType.Items(2).Selected = True
        cbInactive.Checked = False
    End Sub

    Protected Sub linkReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles linkReport.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"

        Dim bytes As Byte()
        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        'If cbComments.Checked Then
        If cbPDF.Checked Then
            lr.ReportPath = "Reports\Contracts\RptContractCommentNew.rdlc"
        Else
            lr.ReportPath = "Reports\Contracts\RptContractComment_xls.rdlc"
        End If
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("CntReports_FilterContracts", dsFilteredContractsComm))
        'Else
        '    lr.ReportPath = "Reports\Contracts\RptContract.rdlc"
        '    lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("CntReports_FilterContracts", dsFilteredContracts))
        'End If

        FilterString()

        Dim fs As String = PFilterString()
        Dim pfilter As New ReportParameter("filterstring", fs)
        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim pcomments As New ReportParameter("comments", cbComments.Checked)
        Dim p As ReportParameter() = {pfilter, puser, pcomments}
        lr.SetParameters(p)

        If Not cbPDF.Checked Then
            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ClearContent()
            Response.ClearHeaders()
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Contracts Summary.xls" + """")

        Else
            bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ClearContent()
            Response.ClearHeaders()
            Response.ContentType = "application/pdf"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Contracts Summary.pdf" + """")
        End If

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Sub FilterString()
        Dim strRates As String = ""

        For Each l As ListItem In cblRateType.Items
            If Not l.Selected Then strRates &= "," & l.Value.ToString
        Next

        If strRates <> "" Then
            dsFilteredContracts.FilterExpression = "RateType NOT IN (" & Right(strRates, strRates.Length - 1) & ")"
            dsFilteredContractsComm.FilterExpression = "RateType NOT IN (" & Right(strRates, strRates.Length - 1) & ")"
        Else
            dsFilteredContracts.FilterExpression = Nothing
            dsFilteredContractsComm.FilterExpression = Nothing
        End If
    End Sub

    Protected Function PFilterString() As String
        Dim strFilter As String = ""
        Dim intRates As Integer = 0

        For Each l As ListItem In cblRateType.Items
            If l.Selected Then intRates += 1
        Next

        If intRates = 0 Then
            Return "No Rate Type has been selected. Please select at least one option."
        End If

        If Not (ddlHotel.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For ", " AND ") & ddlHotel.SelectedItem.Text
        If Not (ddlTO.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For tour operator ", " AND tour operator ") & ddlTO.SelectedItem.Text
        If Not (ddlMarkets.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For market ", " AND market ") & ddlMarkets.SelectedValue
        If Not (fltName.Text = Nothing) Then strFilter &= IIf(strFilter = "", "For title like """, " AND title like """) & fltName.Text & """"
        If Not (fltRate.Text = Nothing) Then strFilter &= IIf(strFilter = "", "For rate code like """, " AND rate code like """) & fltRate.Text & """"
        If Not (fltStart.Text = Nothing) Then strFilter &= IIf(strFilter = "", "From ", " AND from ") & fltStart.Text
        If Not (fltFinish.Text = Nothing) Then strFilter &= IIf(strFilter = "", "To ", " AND to ") & fltFinish.Text
        If Not (fltBkStart.Text = Nothing) Then strFilter &= IIf(strFilter = "", "Booking from ", " AND Booking from ") & fltBkStart.Text
        If Not (fltBkEnd.Text = Nothing) Then strFilter &= IIf(strFilter = "", "Booking to ", " AND Booking to ") & fltBkEnd.Text

        Return strFilter
    End Function
End Class
