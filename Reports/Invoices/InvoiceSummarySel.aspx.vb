
Partial Class Reports_Invoices_InvoiceSummarySel
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
            If Request.QueryString.Count > 0 Then
                ddlHotel.SelectedValue = Integer.Parse(Request.QueryString(0))
                ddlInv.SelectedIndex = 1
            End If
        End If
        
    End Sub

    Protected Sub FilterString()
        Dim strFilter As String = String.Empty
        Dim strFilterRev As String = String.Empty

        If ddlState.SelectedItem.Text = "Modified And Reviewed by CCI" Then
            strFilter = "State=5 OR State=6"
        End If

        dsSelectInvoice.FilterExpression = strFilter
        dsInvoiceReport.FilterExpression = strFilter

        Me.dsSelectInvoice.Select()
        dsInvoiceReport.Select()
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        FilterString()
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

    Protected Sub lnkSelect_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim headerTab As ReportsInvoice.Invoice_Print_GroupHeaderSelDataTable
        Dim invoiceTab As ReportsInvoice.Invoice_Print_GroupSelDataTable

        headerTab = CType(dsSelectInvoice.Select(), System.Data.DataView).Table
        invoiceTab = CType(dsInvoiceReport.Select(), System.Data.DataView).Table

        For Each grv As GridViewRow In gvInvoicesSel.Rows
            If Not CType(grv.Cells(0).Controls(1), CheckBox).Checked Then
                Dim invID = Integer.Parse(CType(grv.Cells(1).FindControl("lblInvID"), Label).Text)
                For Each h As ReportsInvoice.Invoice_Print_GroupHeaderSelRow In headerTab.Rows
                    If h.InvoiceID = invID Then h.SelectInv = 0
                Next
                For Each i As ReportsInvoice.Invoice_Print_GroupSelRow In invoiceTab.Rows
                    If i.InvoiceID = invID Then i.SelectInv = 0
                Next
            End If
        Next

        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()
        Dim user As String = Membership.GetUser.UserName

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Reports\Invoices\RptInvoiceSummarySelNew.rdlc"

        lr.DataSources.Clear()
        lr.DataSources.Add(New ReportDataSource("ReportsInvoice_Invoice_Print_GroupSel", CType(invoiceTab, Data.DataTable)))
        lr.DataSources.Add(New ReportDataSource("ReportsInvoice_Invoice_Print_GroupHeaderSel", CType(headerTab, Data.DataTable)))

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

        Try
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
        Catch ex As Exception

        End Try

    End Sub

    Protected Sub lnkSelect_Click_Old(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim ta As New ReportsInvoice.Invoice_Print_GroupHeaderSelDataTable
        Dim grv As GridViewRow
        Dim row As ReportsInvoice.Invoice_Print_GroupSelRow
        Dim rowh As ReportsInvoice.Invoice_Print_GroupHeaderSelRow
        Dim dr As Data.DataRowView
        Dim drh As Data.DataRowView
        Dim roh As System.Data.DataView = CType(dsSelectInvoice.Select(), System.Data.DataView)
        Dim ro As System.Data.DataView = CType(dsInvoiceReport.Select(), System.Data.DataView)

        Dim i As Integer = 0
        Dim j As Integer = 0

        dr = CType(ro.Item(j), Data.DataRowView)
        row = CType(dr.Row, ReportsInvoice.Invoice_Print_GroupSelRow)

        For Each grv In gvInvoicesSel.Rows
            drh = CType(roh.Item(i), Data.DataRowView)
            rowh = CType(drh.Row, ReportsInvoice.Invoice_Print_GroupHeaderSelRow)

            If CType(grv.Cells(0).Controls(1), CheckBox).Checked Then
                rowh.SelectInv = 1

                Do While (row.InvoiceID = rowh.InvoiceID)
                    row.SelectInv = 1
                    j = j + 1
                    If (j < ro.Count) Then
                        dr = CType(ro.Item(j), Data.DataRowView)
                        row = CType(dr.Row, ReportsInvoice.Invoice_Print_GroupSelRow)
                    Else : Exit Do
                    End If
                Loop
            Else
                rowh.SelectInv = 0
                Do While (row.InvoiceID = rowh.InvoiceID)
                    row.SelectInv = 0
                    j = j + 1
                    If (j < ro.Count) Then
                        dr = CType(ro.Item(j), Data.DataRowView)
                        row = CType(dr.Row, ReportsInvoice.Invoice_Print_GroupSelRow)
                    Else : Exit Do
                    End If
                Loop
            End If

            rowh.AcceptChanges()
            row.AcceptChanges()

            i = i + 1
        Next

        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()
        Dim user As String = Membership.GetUser.UserName

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Reports\Invoices\RptInvoiceSummarySelNew.rdlc"

        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportsInvoice_Invoice_Print_GroupSel", ro))
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportsInvoice_Invoice_Print_GroupHeaderSel", roh))

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

        Try
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
        Catch ex As Exception

        End Try

    End Sub

    Protected Sub lnkSelectAll_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim grv As GridViewRow
        Dim tc As DataControlFieldCell
        For Each grv In gvInvoicesSel.Rows
            tc = grv.Cells(0)
            CType(tc.Controls(1), CheckBox).Checked = True
        Next
    End Sub

    Protected Sub lnkDeselectAll_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim grv As GridViewRow
        Dim tc As DataControlFieldCell
        For Each grv In gvInvoicesSel.Rows
            tc = grv.Cells(0)
            CType(tc.Controls(1), CheckBox).Checked = False
        Next
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

    Protected Sub dsSelectInvoice_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles dsSelectInvoice.Selecting
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
        dsSelectInvoice.FilterExpression = strFilter
    End Sub
End Class
