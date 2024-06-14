
Partial Class Reports_Invoices_InvoiceSummary
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
        lr.ReportPath = "Reports\Invoices\RptInvoiceSummaryNew.rdlc"

        dsFilteredInvoices.DataBind()
        dsInvoiceReport.DataBind()

        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportsInvoice_Invoice_Print_GroupHeader", dsFilteredInvoices))
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportsInvoice_Invoice_Print_Group", dsInvoiceReport))

        lr.Refresh()

        Dim pr As New dsMaintHotelTableAdapters.HotelOcuppancyTableAdapter
        Dim hp As dsMaintHotel.HotelOcuppancyRow

        hp = pr.GetData(Integer.Parse(ddlHotel.SelectedValue)).Rows(0)

        Dim param1 As New ReportParameter("ch1Label", hp.Chld1ShLabel)
        Dim paramV1 As New ReportParameter("ch1Visible", hp.ChldCategories > 0)
        Dim param2 As New ReportParameter("ch2Label", hp.Chld2ShLabel)
        Dim paramV2 As New ReportParameter("ch2Visible", hp.ChldCategories > 1)
        Dim param3 As New ReportParameter("ch3Label", hp.Chld3ShLabel)
        Dim paramV3 As New ReportParameter("ch3Visible", hp.ChldCategories > 2)
        Dim param4 As New ReportParameter("ch4Label", hp.Chld4ShLabel)
        Dim paramV4 As New ReportParameter("ch4Visible", hp.ChldCategories > 3)
        Dim photel As New ReportParameter("hotel", Me.cbHotel.Checked)
        Dim puser As New ReportParameter("user", User)

        Dim p As ReportParameter() = {param1, paramV1, param2, paramV2, param3, paramV3, param4, paramV4, photel, puser}
        lr.SetParameters(p)

        Response.ClearContent()
        Response.ClearHeaders()

        If cbExcel.Checked Then
            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "InvoiceSummary.xls" + """")
        Else
            bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/pdf"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "InvoiceSummary.pdf" + """")
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
        'ddlHotel.SelectedValue = ""
        ddlState.SelectedValue = ""
        ddlHotel.SelectedIndex = 0
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
        lr.ReportPath = "Reports\Invoices\RptInvoiceSummaryNew.rdlc"


        'dsFilteredInvoices.FilterExpression = "CCIReview = true or CCIReview = false"

        'If Not String.IsNullOrEmpty(cblCCIRev.SelectedValue) Then
        '    If (cblCCIRev.Items(0).Selected) Then
        '        If (cblCCIRev.Items(1).Selected = False) Then
        '            dsFilteredInvoices.FilterExpression = "CCIReview = true"
        '        End If
        '    ElseIf (cblCCIRev.Items(1).Selected) Then
        '        dsFilteredInvoices.FilterExpression = "CCIReview = false"
        '    End If
        'End If

        'dsFilteredInvoices.Select()




        'Dim strFilterRev As String = String.Empty

        'If Not String.IsNullOrEmpty(cblCCIRev.SelectedValue) Then
        '    If (cblCCIRev.Items(0).Selected) Then
        '        If (cblCCIRev.Items(1).Selected = False) Then
        '            strFilterRev = "CCIReview = true"
        '        End If
        '    ElseIf (cblCCIRev.Items(1).Selected) Then
        '        strFilterRev = "CCIReview = false"
        '    End If
        'End If


        'If Not String.IsNullOrEmpty(strFilterRev) Then
        '    dsFilteredInvoices.FilterExpression = strFilterRev
        '    dsInvoiceReport.FilterExpression = strFilterRev

        'End If
       
        'Me.dsFilteredInvoices.Select()
        'dsInvoiceReport.Select()

        'dsFilteredInvoices.DataBind()
        'dsInvoiceReport.DataBind()

        FilterString()

        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportsInvoice_Invoice_Print_GroupHeader", dsFilteredInvoices))
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportsInvoice_Invoice_Print_Group", dsInvoiceReport))

        lr.Refresh()

        Dim pr As New dsMaintHotelTableAdapters.HotelOcuppancyTableAdapter
        Dim hp As dsMaintHotel.HotelOcuppancyRow

        hp = pr.GetData(Integer.Parse(ddlHotel.SelectedValue)).Rows(0)

        Dim param1 As New ReportParameter("ch1Label", hp.Chld1ShLabel)
        Dim paramV1 As New ReportParameter("ch1Visible", hp.ChldCategories > 0)
        Dim param2 As New ReportParameter("ch2Label", hp.Chld2ShLabel)
        Dim paramV2 As New ReportParameter("ch2Visible", hp.ChldCategories > 1)
        Dim param3 As New ReportParameter("ch3Label", hp.Chld3ShLabel)
        Dim paramV3 As New ReportParameter("ch3Visible", hp.ChldCategories > 2)
        Dim param4 As New ReportParameter("ch4Label", hp.Chld4ShLabel)
        Dim paramV4 As New ReportParameter("ch4Visible", hp.ChldCategories > 3)
        Dim photel As New ReportParameter("hotel", Me.cbHotel.Checked)
        Dim puser As New ReportParameter("user", user)

        Dim p As ReportParameter() = {param1, paramV1, param2, paramV2, param3, paramV3, param4, paramV4, photel, puser}
        lr.SetParameters(p)

        Response.ClearContent()
        Response.ClearHeaders()

        If cbExcel.Checked Then
            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "InvoiceSummary.xls" + """")
        Else
            bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/pdf"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "InvoiceSummary.pdf" + """")
        End If

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Sub dsFilteredInvoices_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles dsFilteredInvoices.Selecting
        Dim stateID As Nullable(Of Integer)
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
        Dim stateID As Nullable(Of Integer)
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
    Protected Sub FilterString()
        Dim strFilter As String = String.Empty
        Dim strFilterRev As String = String.Empty

        If ddlState.SelectedItem.Text = "Modified And Reviewed by CCI" Then
            strFilter = "State=5 OR State=6"
            'strFilter = "State=5"
        End If

        dsFilteredInvoices.FilterExpression = strFilter
        dsInvoiceReport.FilterExpression = strFilter

        Me.dsFilteredInvoices.Select()
        dsInvoiceReport.Select()

    End Sub
End Class
