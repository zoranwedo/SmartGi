
Partial Class Reports_Invoices_InvoiceJournal_RT
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
        fltRooms.Text = "all"
        ddlTO.SelectedValue = ""
        ddlPayCond.SelectedValue = ""
        ddlMarkets.SelectedValue = ""
        ddlInvType.SelectedValue = ""
        fltStart.Text = Nothing
        fltFinish.Text = Nothing
        fltInvFrom.Text = Nothing
        fltInvTo.Text = Nothing
        fltInvDateFrom.Text = Nothing
        fltInvDateTo.Text = Nothing
        ddlState.SelectedValue = 10
        ddlInv.SelectedValue = "INV"
    End Sub

    Protected Sub btReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btReport.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()
        Dim user As String = Membership.GetUser.UserName

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        If rbTTOO.Checked Then
            lr.ReportPath = "Reports\Invoices\RptInvoiceJournalRoom_TO.rdlc"
        ElseIf rbRoomType.Checked Then
            lr.ReportPath = "Reports\Invoices\RptInvoiceJournalRoom_RM.rdlc"
        Else
            lr.ReportPath = "Reports\Invoices\RptInvoiceJournalRoom_PL.rdlc"
        End If

        FilterString()
        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportsInvoice_InvoiceJournal_Detail", dsInvoiceReport))
        lr.Refresh()

        Dim pdateFrom As ReportParameter
        Dim pdateTo As ReportParameter
        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim photel As New ReportParameter("hotel", Me.cbHotel.Checked)
        Dim pHotelName As New ReportParameter("pHotelName", Me.ddlHotel.SelectedItem.Text)

        If Not (String.IsNullOrEmpty(fltStart.Text)) Then
            pdateFrom = New ReportParameter("dateFrom", Date.Parse(fltStart.Text))
        Else
            pdateFrom = New ReportParameter("dateFrom")
        End If

        If Not (String.IsNullOrEmpty(fltFinish.Text)) Then
            pdateTo = New ReportParameter("dateTo", Date.Parse(fltFinish.Text))
        Else
            pdateTo = New ReportParameter("dateTo")
        End If
        Dim fs As String = PFilterString()
        Dim pfilter As New ReportParameter("filterstring", fs)

        Dim p As ReportParameter() = {puser, photel, pdateFrom, pdateTo, pfilter, pHotelName}
        lr.SetParameters(p)

        Response.ClearContent()
        Response.ClearHeaders()

        If cbExcel.Checked Then
            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "InvoiceJournalDetail.xls" + """")
        Else
            bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/pdf"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "InvoiceJournalDetail.pdf" + """")
        End If

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Sub ddlHotel_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlHotel.SelectedIndexChanged
        fltRooms.Text = "all"
    End Sub

    Protected Sub btnCloseTV_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCloseTV.Click
        Dim pop As AjaxControlToolkit.PopupControlExtender = AjaxControlToolkit.PopupControlExtender.GetProxyForCurrentPopup(Page)

        Dim sRooms As String = ""
        For Each r As ListItem In cblRooms.Items
            If r.Selected Then sRooms &= r.Value & ", "
        Next
        If sRooms <> "" Then sRooms = Left(sRooms, sRooms.Length - 2) Else sRooms = "all"
        fltRooms.Text = sRooms
        pop.Commit(sRooms)
    End Sub

    Protected Sub FilterString()
        Dim strFilter As String = String.Empty

        If Not String.IsNullOrEmpty(fltRooms.Text) Then
            If fltRooms.Text <> "all" Then
                strFilter = "RoomTypeId IN ('" & fltRooms.Text.Replace(", ", "', '") & "')"
            End If
        End If

        dsInvoiceReport.FilterExpression = strFilter
        Me.dsInvoiceReport.Select()
    End Sub

    Protected Function PFilterString() As String
        Dim strFilter As String = ""
        Dim t As String = IIf(ddlInv.SelectedValue = "INV", "Invoice ", "Proforma ")

        'If Not (ddlHotel.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For hotel ", "/For hotel ") & ddlHotel.SelectedItem.Text
        If Not (String.IsNullOrEmpty(fltRooms.Text)) Then strFilter &= IIf(strFilter = "", "", " /") & "For room types: " & fltRooms.Text
        If Not (ddlTO.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "", " /") & "For tour operator " & ddlTO.SelectedItem.Text
        If Not (ddlPayCond.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "", " /") & "For pay condition " & ddlPayCond.Text
        If Not (ddlMarkets.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "", " /") & "For market " & ddlMarkets.Text
        If Not (ddlInvType.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "", " /") & "For " & t & "type " & ddlInvType.SelectedItem.Text

        If Not (String.IsNullOrEmpty(fltStart.Text)) Then strFilter &= IIf(strFilter = "", "", " /") & "Check In from " & fltStart.Text
        If Not (String.IsNullOrEmpty(fltFinish.Text)) Then strFilter &= IIf(strFilter = "", "", " /") & "Check In to " & fltFinish.Text
        If Not (String.IsNullOrEmpty(fltInvFrom.Text)) Then strFilter &= IIf(strFilter = "", "", " /") & t & "num from " & fltInvFrom.Text
        If Not (String.IsNullOrEmpty(fltInvTo.Text)) Then strFilter &= IIf(strFilter = "", "", " /") & t & " num to " & fltInvTo.Text
        If Not (String.IsNullOrEmpty(fltInvDateFrom.Text)) Then strFilter &= IIf(strFilter = "", "", " /") & "From " & t & "date " & fltInvDateFrom.Text
        If Not (String.IsNullOrEmpty(fltInvDateTo.Text)) Then strFilter &= IIf(strFilter = "", "", " /") & "To " & t & "date " & fltInvDateTo.Text

        If Not (ddlState.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "", " /") & "For state " & ddlState.SelectedItem.Text

        Return strFilter
    End Function
End Class
