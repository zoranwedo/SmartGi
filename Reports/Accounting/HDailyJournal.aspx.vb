
Partial Class Reports_Accounting_HDailyJournal
    Inherits System.Web.UI.Page

    Protected Sub Page_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.DataBinding
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not (Page.IsPostBack) Then
            If ModificationRights.RightsHotel Then
                cbHotel.Checked = True
                cbHotel.Visible = False
            Else
                cbHotel.Visible = True
            End If

            fltFinish.Text = Today.ToShortDateString


            'ddlTranType.DataBind()
            'ddlClass.DataBind()
            'ddlDocClass.DataBind()
            'ddlDocType.DataBind()
            'ddlAccType.DataBind()

        End If
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

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Reports\Accounting\RptHDailyJournal.rdlc"

        dsDailyJournal.DataBind()
        'dsFilteredInvoices.Select()


        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportAccounting_AccRepHDocJournal", dsDailyJournal))


        lr.Refresh()

        Dim pdateFrom
        Dim pdateTo
        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim photel As New ReportParameter("hotel", Me.cbHotel.Checked)
        Dim pnote As New ReportParameter("note", Me.cbNote.Checked)
        Dim psort As New ReportParameter("psort", cbSort.Checked)

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


        Dim p As ReportParameter() = {pdateFrom, pdateTo, puser, photel, pfilter, pnote, psort}
        lr.SetParameters(p)

        Response.ClearContent()
        Response.ClearHeaders()

        If cbExcel.Checked Then
            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "DailyJournal.xls" + """")
        Else
            bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/pdf"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "DailyJournal.pdf" + """")
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

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        pnlCnt.Visible = False

        fltStart.Text = Nothing
        fltFinish.Text = Nothing
        ddlTrSearch.Text = Nothing

        ddlMarkets.SelectedValue = ""
        ddlHotel.SelectedValue = ""
        ddlTO.SelectedValue = ""
        ddlTOGroup.SelectedValue = ""
        ddlPay.SelectedValue = ""
        ddlSign.SelectedValue = ""
        ddlTranType.SelectedValue = ""
        ddlClass.SelectedValue = ""
        ddlDocClass.SelectedValue = ""
        ddlDocType.SelectedValue = ""
        ddlAccType.SelectedValue = ""


    End Sub

    Protected Sub ddlHotel_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlHotel.SelectedIndexChanged
       
    End Sub

    Protected Sub ddlTO_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlTO.SelectedIndexChanged
        'If Not String.IsNullOrEmpty(ddlTO.SelectedValue) Then
        '    Select Case Int32.Parse(ddlTO.SelectedValue)
        '        Case -1
        '            ddlTOGroup.Enabled = True
        '            ddlMarkets.Enabled = False
        '            ddlPay.Enabled = False
        '        Case -2
        '            ddlMarkets.Enabled = True
        '            ddlTOGroup.Enabled = False
        '            ddlPay.Enabled = False
        '        Case -3
        '            ddlPay.Enabled = True
        '            ddlTOGroup.Enabled = False
        '            ddlMarkets.Enabled = False
        '    End Select
        'Else
        '    ddlPay.Enabled = False
        '    ddlTOGroup.Enabled = False
        '    ddlMarkets.Enabled = False
        'End If

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
        If Not (ddlTO.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For tour operator ", "|For tour operator ") & ddlTO.SelectedItem.Text & Chr(10) & Chr(13)
        If Not (ddlMarkets.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For market ", "|For market ") & ddlMarkets.SelectedItem.Text
        If Not (ddlAccType.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For acc type  ", "|For acc type  ") & ddlAccType.SelectedItem.Text
        If Not (ddlClass.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For class ", "|For class ") & ddlClass.SelectedItem.Text
        If Not (ddlDocClass.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For doc class ", "|For doc class ") & ddlDocClass.SelectedItem.Text
        If Not (ddlDocType.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For doc type ", "|For doc type ") & ddlDocType.SelectedItem.Text
        'If Not (ddlHotelGroup.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For hotel group ", "/For hotel group ") & ddlHotelGroup.SelectedItem.Text
        'If Not (ddlMarkets.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For market ", "/For market ") & ddlMarkets.SelectedItem.Text
        'If Not (ddlOptions.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For option ", "/For option ") & ddlOptions.SelectedItem.Text

        If Not (ddlPay.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For pay ", "|For pay ") & ddlPay.SelectedItem.Text
        If Not (ddlSign.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For  ", "|For  ") & ddlSign.SelectedItem.Text
        If Not (ddlTranType.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For tran type ", "|For tran type ") & ddlTranType.SelectedItem.Text


        'If Not (txtDocFrom.Text = Nothing) Then strFilter &= IIf(strFilter = "", "From date ", "/From date ") & txtDocFrom.Text

        Return strFilter
    End Function

    Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
        If Not (Page.IsPostBack) Then
            ddlHotel.DataBind()
        End If

    End Sub
End Class
