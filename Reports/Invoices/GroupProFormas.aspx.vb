
Partial Class Reports_Invoices_GroupProFormas
    Inherits System.Web.UI.Page

    Protected Sub btnClear_Click(sender As Object, e As EventArgs) Handles btnClear.Click
        ddlHotel.SelectedIndex = 0
        ddlTO.SelectedIndex = 0
        ddlInvType.SelectedIndex = 0
        fltCkInStart.Text = String.Empty
        fltCkInFinish.Text = String.Empty
        fltCkOutStart.Text = String.Empty
        fltCkOutFinish.Text = String.Empty
        fltInvFrom.Text = String.Empty
        fltInvTo.Text = String.Empty
        fltResGroup.Text = String.Empty
        txtBkNum.Text = String.Empty
    End Sub

    Protected Sub btnReport_Click(sender As Object, e As EventArgs) Handles btnReport.Click
        pnlCnt.Visible = True
        dsFilteredProinvoice.Select()
    End Sub

    'Protected Sub ddlHotel_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlHotel.DataBound
    '    ddlHotel.SelectedValue = 32
    'End Sub

    'Protected Sub ddlTO_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlTO.DataBound
    '    ddlTO.SelectedValue = 9
    'End Sub

    Protected Sub GroupProformasCookie()
        Dim cName As String = "GroupProforma_" & Membership.GetUser.UserName
        If (Request.Cookies(cName) IsNot Nothing) Then
            If Not Me.IsPostBack Then
                Try
                    If (Request.Cookies(cName)("GroupProHotel") IsNot Nothing) Then _
                        ddlHotel.SelectedValue = Integer.Parse(Request.Cookies(cName)("GroupProHotel"))
                    If (Request.Cookies(cName)("GroupProTTOO") IsNot Nothing) Then _
                        ddlTO.SelectedValue = Integer.Parse(Request.Cookies(cName)("GroupProTTOO"))
                    If (Request.Cookies(cName)("GroupProInvType") IsNot Nothing) Then _
                        ddlInvType.SelectedValue = Request.Cookies(cName)("GroupProInvType")

                    If (Request.Cookies(cName)("GroupProFrom") IsNot Nothing) Then _
                        fltCkInStart.Text = Request.Cookies(cName)("GroupProFrom")
                    If (Request.Cookies(cName)("GroupProTo") IsNot Nothing) Then _
                        fltCkInFinish.Text = Request.Cookies(cName)("GroupProTo")
                    If (Request.Cookies(cName)("GroupProNumFrom") IsNot Nothing) Then _
                        fltInvFrom.Text = Request.Cookies(cName)("GroupProNumFrom")
                    If (Request.Cookies(cName)("GroupProNumTo") IsNot Nothing) Then _
                        fltInvTo.Text = Request.Cookies(cName)("GroupProNumTo")

                    If (Request.Cookies(cName)("GroupProResGoup") IsNot Nothing) Then _
                        fltResGroup.Text = Request.Cookies(cName)("GroupProResGoup")
                    If (Request.Cookies(cName)("GroupProResNum") IsNot Nothing) Then _
                        txtBkNum.Text = Request.Cookies(cName)("GroupProResNum")
                Catch ex As Exception
                End Try
            End If
        End If

        If Me.IsPostBack Then
            Try
                Response.Cookies(cName)("GroupProHotel") = ddlHotel.SelectedValue
                Response.Cookies(cName)("GroupProTTOO") = ddlTO.SelectedValue
                Response.Cookies(cName)("GroupProInvType") = ddlInvType.SelectedValue

                Response.Cookies(cName)("GroupProFrom") = fltCkInStart.Text
                Response.Cookies(cName)("GroupProTo") = fltCkInFinish.Text
                Response.Cookies(cName)("GroupProNumFrom") = fltInvFrom.Text
                Response.Cookies(cName)("GroupProNumTo") = fltInvTo.Text

                Response.Cookies(cName)("GroupProResGoup") = fltResGroup.Text
                Response.Cookies(cName)("GroupProResNum") = txtBkNum.Text

                Response.Cookies(cName).Expires = DateTime.Now.AddYears(1)
            Catch ex As Exception
            End Try
        End If
    End Sub


    Protected Sub lbSelect_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbSelect.Click
        Dim cbSelect As CheckBox
        For Each r As GridViewRow In gvProformas.Rows
            cbSelect = r.FindControl("cbSelect")
            If cbSelect IsNot Nothing Then cbSelect.Checked = True
        Next
    End Sub

    Protected Sub lbDeselect_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbDeselect.Click
        Dim cbSelect As CheckBox
        For Each r As GridViewRow In gvProformas.Rows
            cbSelect = r.FindControl("cbSelect")
            If cbSelect IsNot Nothing Then cbSelect.Checked = False
        Next
    End Sub

    Protected Sub btnExport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExport.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        Dim datasrc As Data.DataView = GetDataSource()

        If datasrc.Count = 0 Then Exit Sub

        Dim p As ReportParameter() = {New ReportParameter("HotelPercent", GetHotelPercent(datasrc))}
        lr.ReportPath = "Reports\Invoices\GroupProformas.rdlc"
        lr.SetParameters(p)

        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsPreInvoices_GroupProforma", datasrc))
        bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)

        Response.ClearContent()
        Response.ClearHeaders()

        Response.ContentType = "application/excel"
        Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "GroupFroformas.xls" + """")

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Function GetDataSource() As Data.DataView
        Dim t As Data.DataView = dsFilteredProinvoice.Select

        Dim cbSelect As CheckBox
        Dim hfID As HiddenField
        For Each gr As GridViewRow In gvProformas.Rows
            cbSelect = gr.FindControl("cbSelect")
            hfID = gr.FindControl("hfID")
            If cbSelect.Checked = False Then
                For Each r As Data.DataRowView In t
                    If r.Item("BillingId") = hfID.Value Then
                        r.Delete()
                        Exit For
                    End If
                Next
            End If
        Next

        Return t
    End Function

    Protected Function GetHotelPercent(ByRef t As Data.DataView) As Decimal
        Dim minDate As Date = t(0).Item("EnterDate")

        For Each r As Data.DataRowView In t
            If minDate > r.Item("EnterDate") Then minDate = r.Item("EnterDate")
        Next

        Dim a As New dsPreInvoicesTableAdapters.QueriesTableAdapter
        Dim p As Decimal = a.HotelPercent(ddlHotel.SelectedValue, minDate) / 100

        Return p
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        GroupProformasCookie()
    End Sub
End Class
