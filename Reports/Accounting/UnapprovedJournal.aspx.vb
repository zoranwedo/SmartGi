
Partial Class Reports_Accounting_UnapprovedJournal
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

            fltFinish.Text = Today.ToShortDateString
        End If
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

        If (cbSort.Checked) Then
            lr.ReportPath = "Reports\Accounting\RptUnapprovedJournalTO.rdlc"
        Else
            lr.ReportPath = "Reports\Accounting\RptUnapprovedJournal.rdlc"
        End If

        FilterString()
        dsDailyJournal.DataBind()

        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportAccounting_AccRepDocJournal", dsDailyJournal))
        lr.Refresh()

        Dim pdateFrom As ReportParameter
        Dim pdateTo As ReportParameter
        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim photel As New ReportParameter("hotel", Me.cbHotel.Checked)
        Dim pHotelName As New ReportParameter("pHotelName", Me.ddlHotel.SelectedItem.Text)
        Dim pnote As New ReportParameter("note", Me.cbNote.Checked)
        Dim psort As New ReportParameter("psort", cbSort.Checked)
        'Dim pgroupTO As New ReportParameter("groupTO", cbGroup.Checked)
        Dim fs As String = PFilterString()
        Dim pfilter As New ReportParameter("filterstring", fs)


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


        Dim p As ReportParameter() = {pdateFrom, pdateTo, puser, photel, pfilter, pnote, psort, pHotelName}
        lr.SetParameters(p)

        Response.ClearContent()
        Response.ClearHeaders()

        If cbExcel.Checked Then
            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "UnapprovedJournal.xls" + """")
        Else
            bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/pdf"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "UnapprovedJournal.pdf" + """")
        End If

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Me.dsDailyJournal.Select()
        pnlCnt.Visible = True
    End Sub

    Protected Sub btClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btClear.Click
        pnlCnt.Visible = False

        fltStart.Text = Nothing
        fltFinish.Text = Nothing
        ddlTrSearch.Text = Nothing

        ddlMarkets.SelectedValue = ""
        ddlHotel.SelectedValue = ""
        ddlTO.SelectedValue = ""
        ddlHotelGroup.SelectedValue = ""
        ddlTOGroup.SelectedValue = ""
        ddlPay.SelectedValue = ""
        ddlSign.SelectedValue = ""
        ddlTranType.SelectedValue = ""
        ddlClass.SelectedValue = ""
        ddlDocClass.SelectedValue = ""
        ddlDocType.SelectedValue = ""
        ddlAccType.SelectedValue = ""
        ddlDep.SelectedValue = ""
        ddlEmp.SelectedValue = ""
    End Sub

    Protected Sub gvDocToApply_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvDocToApply.SelectedIndexChanged
        Dim pop As AjaxControlToolkit.PopupControlExtender
        Dim gv As GridView = sender

        ddlTrSearch.Text = gv.SelectedDataKey.Item(0)

        pop = AjaxControlToolkit.PopupControlExtender.GetProxyForCurrentPopup(Page)
        pop.Commit(ddlTrSearch.Text)

        If String.IsNullOrEmpty(ddlTrSearch.Text) Then
            CheckBox1.Checked = True
        Else
            CheckBox1.Checked = False
        End If
    End Sub

    Protected Sub CheckBox1_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBox1.CheckedChanged
        If CheckBox1.Checked Then ddlTrSearch.Text = Nothing
    End Sub

    Protected Sub ddlTrSearch_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlTrSearch.TextChanged
     
    End Sub
    Protected Function PFilterString() As String
        Dim strFilter As String = ""

        'If Not (ddlHotel.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For hotel ", "/For hotel ") & ddlHotel.SelectedItem.Text
        If Not (ddlTO.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For tour operator ", "|For tour operator ") & Trim(ddlTO.SelectedItem.Text) ' & Chr(10) & Chr(13)
        If Not (ddlMarkets.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For market ", "|For market ") & ddlMarkets.SelectedItem.Text
        If Not (ddlAccType.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For acc type  ", "|For acc type  ") & ddlAccType.SelectedItem.Text
        If Not (ddlClass.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For class ", "|For class ") & ddlClass.SelectedItem.Text
        If Not (ddlDocClass.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For doc class ", "|For doc class ") & ddlDocClass.SelectedItem.Text
        If Not (ddlDocType.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For doc type ", "|For doc type ") & ddlDocType.SelectedItem.Text
        If Not (ddlHotelGroup.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For hotel group ", "|For hotel group ") & ddlHotelGroup.SelectedItem.Text
        If Not (ddlMarkets.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For market ", "|For market ") & ddlMarkets.SelectedItem.Text
        'If Not (ddlOptions.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For option ", "/For option ") & ddlOptions.SelectedItem.Text

        If Not (ddlPay.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For pay ", "|For pay ") & ddlPay.SelectedItem.Text
        If Not (ddlSign.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For  ", "|For  ") & ddlSign.SelectedItem.Text
        If Not (ddlTranType.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For tran type ", "|For tran type ") & ddlTranType.SelectedItem.Text


        'If Not (txtDocFrom.Text = Nothing) Then strFilter &= IIf(strFilter = "", "From date ", "/From date ") & txtDocFrom.Text

        Return strFilter
    End Function

    Protected Sub FilterString()
        Dim strFilter As String = String.Empty
        Dim strF1 As String = String.Empty
        Dim strF2 As String = String.Empty
        Dim strDesc As String = String.Empty


        If ddlDep.SelectedValue <> Nothing Then
            strFilter = "DepID = " + ddlDep.SelectedValue
        End If

        If ddlEmp.SelectedValue <> Nothing Then
            strFilter &= IIf(strFilter = String.Empty, "", " AND ") & "EmpID = " + ddlEmp.SelectedValue
        End If

        If Not String.IsNullOrEmpty(strFilter) Then dsDailyJournal.FilterExpression = strFilter

    End Sub
End Class
