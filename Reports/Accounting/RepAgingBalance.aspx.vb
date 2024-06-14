
Partial Class Reports_Accounting_RepAgingBalance
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not (Page.IsPostBack) Then
            If ModificationRights.RightsHotel Then
                cbHotel.Checked = True
                cbHotel.Visible = False
                cbCCI.Checked = True
                cbCCI.Visible = False
            ElseIf ModificationRights.RightsOperatorReport Then
                cbHotel.Checked = False
                cbHotel.Visible = False
            Else
                cbHotel.Visible = True
            End If

            fltStart.Text = Today.ToShortDateString
        End If

        CType(Master.FindControl("tkScriptManager"), ScriptManager).RegisterPostBackControl(Button3)
        cbSortL.Attributes.Add("onclick", "return HandleOnCheck()")
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()
        Dim user As String = Membership.GetUser.UserName
        Dim asdate As String = Nothing

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Reports\Accounting\RptRepAgingBalance.rdlc"

        If Not (String.IsNullOrEmpty(fltStart.Text)) Then
            asdate = fltStart.Text
        End If

        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportAccounting_AccRepAgingBalance", dsAgedBalance))

        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim photel As New ReportParameter("hotel", Me.cbHotel.Checked)
        Dim pHotelName As New ReportParameter("pHotelName", Me.ddlHotel.SelectedItem.Text)
        'Dim psort As New ReportParameter("hsort", cbSort.Checked)
        Dim psort As New ReportParameter("hsort", cbSortL.SelectedValue)
        Dim pasdate As New ReportParameter("asoffdate", asdate)
        Dim pfl As New ReportParameter("FL", cbFL.Checked)
        Dim par As New ReportParameter("AR", cbAR.Checked)
        Dim fs As String = PFilterString()
        Dim pfilter As New ReportParameter("filterstring", fs)

        Dim p As ReportParameter() = {puser, photel, pasdate, psort, pfl, par, pfilter, pHotelName}
        lr.SetParameters(p)
        FilterString()

        Response.ClearContent()
        Response.ClearHeaders()

        If cbExcel.Checked Then
            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Aging Balance.xls" + """")
        Else
            bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/pdf"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Aging Balance.pdf" + """")
        End If
        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        'pnlCnt.Visible = False

        fltStart.Text = Nothing
        ddlMarkets.SelectedValue = ""
        ddlHotel.SelectedValue = ""
        ddlTO.SelectedValue = ""
        ddlHotelGroup.SelectedValue = ""
        ddlTOGroup.SelectedValue = ""
        ddlPay.SelectedValue = ""
    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()
        Dim user As String = Membership.GetUser.UserName

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Reports\Invoices\RptInvoiceJournalComp.rdlc"

        If Not cbAR.Checked Then
            dsAgedBalance.FilterExpression = "State<>-3 AND State<>-7"
        End If

        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportsInvoice_Invoice_Prev_Group", dsAgedBalance))

        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim photel As New ReportParameter("hotel", Me.cbHotel.Checked)
        Dim pHotelName As New ReportParameter("pHotelName", Me.ddlHotel.SelectedItem.Text)

        Dim p As ReportParameter() = {puser, photel, pHotelName}
        lr.SetParameters(p)
        FilterString()

        Response.ClearContent()
        Response.ClearHeaders()

        If cbExcel.Checked Then
            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Aging Balance.xls" + """")
        Else
            bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/pdf"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Aging Balance.pdf" + """")
        End If

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Function PFilterString() As String
        Dim strFilter As String = ""

        'If Not (ddlHotel.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For hotel ", "|For hotel ") & ddlHotel.SelectedItem.Text & Chr(10) & Chr(13)
        If Not (ddlHotelGroup.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For hotel group ", "|For hotel group ") & ddlHotelGroup.SelectedItem.Text
        If Not (ddlTOGroup.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For TO group ", "|For TO group ") & ddlTOGroup.SelectedItem.Text
        If Not (ddlMarkets.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For market ", "|For market ") & ddlMarkets.SelectedItem.Text
        strFilter &= IIf(strFilter = "", "For tour operator ", "|For tour operator ") & Trim(ddlTO.SelectedItem.Text)
        'If Not (ddlOptions.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For option ", "/For option ") & ddlOptions.SelectedItem.Text

        If Not (ddlPay.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For pay ", "|For pay ") & ddlPay.SelectedItem.Text
        If Not (ddlAccType.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For acc type ", "|For acc type ") & ddlAccType.SelectedValue

        Return strFilter
    End Function

    Protected Sub FilterString()
        'Dim strCCI As String = "(HotelId <> 49)"
        Dim strCCI As String = "(HotelId NOT IN (49, 61, 63, 64, 65, 70))"
        If cbCCI.Checked Then
            dsAgedBalance.FilterExpression = strCCI
            dsAgedBalanceSum.FilterExpression = strCCI
        Else
            dsAgedBalance.FilterExpression = Nothing
            dsAgedBalanceSum.FilterExpression = Nothing
        End If
    End Sub
End Class
