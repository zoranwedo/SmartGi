
Partial Class Reports_Invoices_InvoiceJournal
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not (Page.IsPostBack) Then
            If ModificationRights.RightsHotel Then
                cbHotel.Checked = True
                cbHotel.Visible = False
                ' Button4.Visible = False
            Else
                cbHotel.Visible = True
            End If
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
        lr.ReportPath = "Reports\Invoices\RptInvoiceJournal.rdlc"



        'dsFilteredInvoices.DataBind()
        FilterString()

        'dsFilteredInvoices.Select()

        If Not cbCancel.Checked Then
            dsFilteredInvoices.FilterExpression = "State<>-3 AND State<>-7"
        End If

        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportsInvoice_Invoice_Prev_Group", dsFilteredInvoices))


        lr.Refresh()

        Dim pdateFrom
        Dim pdateTo
        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim photel As New ReportParameter("hotel", Me.cbHotel.Checked)
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


        Dim p As ReportParameter() = {pdateFrom, pdateTo, puser, photel, pfilter}
        lr.SetParameters(p)

        Response.ClearContent()
        Response.ClearHeaders()

        If cbExcel.Checked Then
            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "InvoiceJournal.xls" + """")
        Else
            bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/pdf"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "InvoiceJournal.pdf" + """")
        End If

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Me.dsFilteredInvoices.Select()
        pnlCnt.Visible = True
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        pnlCnt.Visible = False

        ddlTO.SelectedValue = ""
        fltStart.Text = Nothing
        fltFinish.Text = Nothing
        fltInvFrom.Text = Nothing
        fltInvTo0.Text = Nothing
        ddlInvType.SelectedValue = ""
        ddlHotel.SelectedValue = ""
        ddlState.SelectedValue = ""
    End Sub
    Protected Function PFilterString() As String
        Dim strFilter As String = ""

        'If Not (ddlHotel.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For hotel ", "/For hotel ") & ddlHotel.SelectedItem.Text
        If Not (ddlTO.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For tour operator ", "/For tour operator ") & ddlTO.SelectedItem.Text
        If Not (ddlInvType.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For invoice type ", "/For invoice type ") & ddlInvType.SelectedItem.Text
        If Not (ddlState.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For state ", "/For state ") & ddlState.SelectedItem.Text
        If Not (fltStart.Text = Nothing) Then strFilter &= IIf(strFilter = "", "Chechk In from ", "/Chechk In from ") & fltStart.Text
        If Not (fltFinish.Text = Nothing) Then strFilter &= IIf(strFilter = "", "Chechk In to ", "/Chechk In to ") & fltFinish.Text
        If Not (fltInvFrom.Text = Nothing) Then strFilter &= IIf(strFilter = "", "Inv num from ", "/Inv num from ") & fltInvFrom.Text
        If Not (fltInvTo0.Text = Nothing) Then strFilter &= IIf(strFilter = "", "Inv num to ", "/Inv num to ") & fltInvTo0.Text
        If Not (fltInvDateFrom.Text = Nothing) Then strFilter &= IIf(strFilter = "", "From invoice date ", "/From invoice date ") & fltInvDateFrom.Text
        If Not (fltInvDateTo.Text = Nothing) Then strFilter &= IIf(strFilter = "", "To invoice date ", "/To invoice date ") & fltInvDateTo.Text

        Return strFilter
    End Function

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


        'dsFilteredInvoices.DataBind()

        FilterString()

        'dsFilteredInvoices.Select()
      
        If Not cbCancel.Checked Then
            dsFilteredInvoicesComp.FilterExpression = "State<>-3 AND State<>-7"
        End If

        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportsInvoice_Invoice_Prev_Group", dsFilteredInvoicesComp))


        lr.Refresh()

        Dim pdateFrom
        Dim pdateTo
        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim photel As New ReportParameter("hotel", True)
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

        Dim p As ReportParameter() = {pdateFrom, pdateTo, puser, photel, pfilter}
        lr.SetParameters(p)

        Response.ClearContent()
        Response.ClearHeaders()

        If cbExcel.Checked Then
            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "InvoiceJournalCompare.xls" + """")
        Else
            bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/pdf"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "InvoiceJournalCompare.pdf" + """")
        End If

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Sub Button5_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button5.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()
        Dim user As String = Membership.GetUser.UserName

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Reports\Invoices\RptInvoiceJournalDetailNew.rdlc"                'RptInvoiceJournalDetail.rdlc"


        'dsFilteredInvoices.DataBind()
        'dsInvoiceReport.DataBind()

        FilterString()

        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportsInvoice_Invoice_Print_GroupHeader", dsFilteredInvoices))
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportsInvoice_Invoice_Print_Group", dsInvoiceReport))

        lr.Refresh()

        Dim pdateFrom
        Dim pdateTo
        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim photel As New ReportParameter("hotel", Me.cbHotel.Checked)


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


        Dim p As ReportParameter() = {puser, photel, pdateFrom, pdateTo, pfilter}
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
    Public Sub RptContractRateSubreportProc(ByVal sender As Object, ByVal e As SubreportProcessingEventArgs)
        If e.ReportPath.Contains("subRptInvoiceDet") Then
            'dsInvoiceReport.DataBind()
            e.DataSources.Add(New ReportDataSource("ReportsInvoice_Invoice_Print_Group", dsInvoiceReport))
        End If

    End Sub
    Protected Sub FilterString()
        Dim strFilter As String = String.Empty
        Dim strFilterRev As String = String.Empty

        If ddlState.SelectedItem.Text = "Modified And Reviewed by CCI" Then
            strFilter = "State=5 OR State=6"
            'strFilter = "State=5"
        End If

        dsFilteredInvoices.FilterExpression = strFilter
        dsInvoiceReport.FilterExpression = strFilter
        dsFilteredInvoicesComp.FilterExpression = strFilter

        Me.dsFilteredInvoices.Select()
        dsInvoiceReport.Select()
        dsFilteredInvoicesComp.Select()


        'If Not String.IsNullOrEmpty(cblCCIRev.SelectedValue) Then
        '    If (cblCCIRev.Items(0).Selected) Then
        '        If (cblCCIRev.Items(1).Selected = False) Then
        '            strFilterRev = "CCIReview = true"
        '        End If
        '    ElseIf (cblCCIRev.Items(1).Selected) Then
        '        strFilterRev = "CCIReview = false"
        '    End If
        'End If


        'If Not String.IsNullOrEmpty(strFilter) Then
        '    If Not String.IsNullOrEmpty(strFilterRev) Then
        '        dsFilteredInvoices.FilterExpression = strFilter + " AND " + strFilterRev
        '    Else
        '        dsFilteredInvoices.FilterExpression = strFilter
        '    End If
        'Else
        '    If Not String.IsNullOrEmpty(strFilterRev) Then dsFilteredInvoices.FilterExpression = strFilterRev
        'End If

        'Me.dsFilteredInvoices.Select()
        'dsInvoiceReport.Select()

    End Sub

    Protected Sub dsFilteredInvoices_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles dsFilteredInvoices.Selecting
        'Dim stateID As Nullable(Of Integer)
        Dim strFilter As String = String.Empty

        If ddlState.SelectedItem.Text = "ModifiedAndReviewed" Then
            strFilter = "State=5 OR State=6"
            e.InputParameters.Item("State") = Nothing
        Else
            If ddlState.SelectedItem.Text <> "all states" Then
                e.InputParameters.Item("State") = ddlState.SelectedValue
            End If
        End If
        dsFilteredInvoices.FilterExpression = strFilter
    End Sub

    Protected Sub dsInvoiceReport_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles dsInvoiceReport.Selecting
        'Dim stateID As Nullable(Of Integer)
        Dim strFilter As String = String.Empty

        If ddlState.SelectedItem.Text = "ModifiedAndReviewed" Then
            strFilter = "State=5 OR State=6"
            e.InputParameters.Item("State") = Nothing
        Else
            If ddlState.SelectedItem.Text <> "all states" Then
                e.InputParameters.Item("State") = ddlState.SelectedValue
            End If
        End If
        dsInvoiceReport.FilterExpression = strFilter
    End Sub

    Protected Sub dsFilteredInvoicesComp_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles dsFilteredInvoicesComp.Selecting
        Dim strFilter As String = String.Empty

        If ddlState.SelectedItem.Text = "ModifiedAndReviewed" Then
            strFilter = "State=5 OR State=6"
            e.InputParameters.Item("State") = Nothing
        Else
            If ddlState.SelectedItem.Text <> "all states" Then
                e.InputParameters.Item("State") = ddlState.SelectedValue
            End If
        End If
        dsFilteredInvoicesComp.FilterExpression = strFilter
    End Sub
End Class
