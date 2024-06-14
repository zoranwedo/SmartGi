Imports Microsoft.VisualBasic

Partial Class Reports_Contracts_RptContractLead
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not (Page.IsPostBack) Then
            If ModificationRights.RightsHotel Then
                cbHotel.Checked = True
                cbHotel.Visible = False
            ElseIf ModificationRights.RightsOperatorReport Then
                cbHotel.Checked = False
                cbHotel.Visible = False
            Else
                cbHotel.Visible = True
            End If
        End If
    End Sub

    Protected Sub btClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btClear.Click
        ddlHotel.SelectedValue = ""
        ddlHotelGroup.SelectedValue = ""
        ddlTO.SelectedValue = ""
        ddlTOGroup.SelectedValue = ""
        ddlMarkets.SelectedValue = ""
        ddlPayCond.SelectedValue = ""
        'fltRate.Text = Nothing
        fltStart.Text = Nothing
        fltFinish.Text = Nothing
        fltBkStart.Text = Nothing
        fltBkEnd.Text = Nothing
        cbComments.Checked = False
        cbRecieved.Checked = False
        cbRateType.Checked = False
        cbExcel.Checked = True
        For Each nR As ListItem In cblRates.Items
            nR.Selected = False
        Next
        If cbHotel.Visible Then cbHotel.Checked = False
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
        lr.ReportPath = "Reports\Contracts\RptContractLead.rdlc"
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("CntReports_FilterContractLeadReport", dsContractsLead))

        FilterString()

        Dim rp_user As New ReportParameter("user", Membership.GetUser.UserName)
        Dim rp_hotel As New ReportParameter("hotel", cbHotel.Checked)
        Dim rp_travelWindow As New ReportParameter("travelWindow", pTravelWindow())
        Dim rp_filterString As New ReportParameter("filterString", pFilterString())
        Dim rp_comments As New ReportParameter("comments", cbComments.Checked)
        Dim rp_recieved As New ReportParameter("recieved", cbRecieved.Checked)
        Dim rp_rateType As New ReportParameter("rateType", cbRateType.Checked)

        Dim p As ReportParameter() = {rp_user, rp_hotel, rp_travelWindow, rp_filterString, rp_comments, rp_recieved, rp_rateType}
        lr.SetParameters(p)

        Response.ClearContent()
        Response.ClearHeaders()
        Dim rptName As String = "Contracts with Lead Category"
        If cbExcel.Checked Then
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + rptName + ".xls" + """")
            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
        Else
            Response.ContentType = "application/pdf"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + rptName + ".pdf" + """")
            bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
        End If

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Sub FilterString()
        If fltRates.Text = "" Then
            dsContractsLead.FilterExpression = Nothing
        Else
            Dim f As String = fltRates.Text.Replace("; ", "', '")
            f = "RateTypeID IN ('" & f & "')"
            dsContractsLead.FilterExpression = f
        End If
    End Sub

    Protected Function pTravelWindow() As String
        Return "From " & fltStart.Text & " to " & fltFinish.Text
    End Function

    Protected Function pFilterString() As String
        Dim strFilter As String = ""

        If Not (ddlTO.SelectedValue = "") Then strFilter = "For tour operator " & ddlTO.SelectedItem.Text
        If Not (ddlTOGroup.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For Tour op. group ", " AND Tour op. group ") & ddlTOGroup.SelectedItem.Text
        If Not (ddlMarkets.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For market ", " AND market ") & ddlMarkets.SelectedValue
        If Not (ddlPayCond.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For ", " AND for ") & ddlPayCond.SelectedItem.Text & " payment condition"
        If Not (fltRates.Text = Nothing) Then strFilter &= IIf(strFilter = "", "For rate types: ", " AND rate types: ") & fltRates.Text
        If Not (fltBkStart.Text = Nothing) Then strFilter &= IIf(strFilter = "", "Booking from ", " AND Booking from ") & fltBkStart.Text
        If Not (fltBkEnd.Text = Nothing) Then strFilter &= IIf(strFilter = "", "Booking to ", " AND Booking to ") & fltBkEnd.Text

        Return strFilter
    End Function

    Protected Sub dsContractsLead_ObjectCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceEventArgs) Handles dsContractsLead.ObjectCreated
        Dim ta As CntReportsTableAdapters.FilterContractLeadReportTableAdapter
        ta = e.ObjectInstance
        ta.SetTimeout(6000)
    End Sub

    Protected Sub btnCloseCBL_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCloseCBL.Click
        Dim pop As AjaxControlToolkit.PopupControlExtender = AjaxControlToolkit.PopupControlExtender.GetProxyForCurrentPopup(Page)

        Dim sRates As String = ""
        For Each nR As ListItem In cblRates.Items
            If nR.Selected Then sRates &= nR.Text.Trim & "; "
        Next

        If sRates <> "" Then sRates = Left(sRates, sRates.Length - 2)
        fltRates.Text = sRates
        pop.Commit(sRates)
    End Sub
End Class
