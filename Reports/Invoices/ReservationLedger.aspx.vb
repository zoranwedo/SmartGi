
Partial Class Reports_Invoices_ReservationLedger
    Inherits System.Web.UI.Page

    Protected Sub popShow(ByVal Title As String, ByRef ex As Exception, Optional ByVal Message As String = "-")
        Dim _msg As String = ""
        Dim _ex As Exception

        If ex IsNot Nothing Then
            _ex = ex
            _msg = "<b>ERROR was reported: </b>" & "<br />"
            While _ex IsNot Nothing
                _msg &= _ex.Message & "<br />"
                _ex = _ex.InnerException
            End While
        Else
            _msg = Message
        End If

        popMessage.Text = _msg
        popLabel.Text = Title
        popExtender.Show()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If My.User.IsInRole("hotel") Or My.User.IsInRole("hotel_report") Then
            ckbHotel.Visible = False
            ckbHotel.Checked = True
        End If
    End Sub

    Protected Function ReportFilter() As String
        Dim fs As New StringCollection

        If Not String.IsNullOrEmpty(cbHotelHID.SelectedValue) Then fs.Add("Hotel Mapping: " & cbHotelHID.SelectedItem.Text)
        If Not String.IsNullOrEmpty(cbHotelGroup.SelectedValue) Then fs.Add("Hotel Group: " & cbHotelGroup.SelectedItem.Text)
        If Not String.IsNullOrEmpty(cbHotel.SelectedValue) Then fs.Add("Hotel: " & cbHotel.SelectedItem.Text)
        If Not String.IsNullOrEmpty(cbTTOOGroup.SelectedValue) Then fs.Add("Tour Op.Group: " & cbTTOOGroup.SelectedItem.Text)
        If Not String.IsNullOrEmpty(cbTTOO.SelectedValue) Then fs.Add("Tour Operator: " & cbTTOO.SelectedItem.Text)
        If Not String.IsNullOrEmpty(cbMarket.SelectedValue) Then fs.Add("Market: " & cbMarket.SelectedItem.Text)
        If Not String.IsNullOrEmpty(cbPayCond.SelectedValue) Then fs.Add("Payment Cond.:" & cbPayCond.SelectedItem.Text)
        If Not String.IsNullOrEmpty(txtName.Text) Then fs.Add("Res. Name: " & txtName.Text)
        If Not String.IsNullOrEmpty(txtFolio.Text) Then fs.Add("Res. Folio: " & txtFolio.Text)
        If Not String.IsNullOrEmpty(txtBkNumber.Text) Then fs.Add("Bk.Number: " & txtBkNumber.Text)
        If Not String.IsNullOrEmpty(txtResGroup.Text) Then fs.Add("Group Code. " & txtResGroup.Text)
        If Not String.IsNullOrEmpty(txtInvNumFrom.Text) Then fs.Add("Inv.Number from: " & txtInvNumFrom.Text)
        If Not String.IsNullOrEmpty(txtInvNumTo.Text) Then fs.Add("Inv.Number to: " & txtInvNumTo.Text)
        If Not String.IsNullOrEmpty(txtCkInFrom.Text) Then fs.Add("Res.Ck.In from: " & txtCkInFrom.Text)
        If Not String.IsNullOrEmpty(txtCkInTo.Text) Then fs.Add("Res.Ck.In to: " & txtCkInTo.Text)
        If Not String.IsNullOrEmpty(txtCkOutFrom.Text) Then fs.Add("Res.Ck.Out from: " & txtCkOutFrom.Text)
        If Not String.IsNullOrEmpty(txtCkOutTo.Text) Then fs.Add("Re.Ck.Out to: " & txtCkOutTo.Text)
        If Not String.IsNullOrEmpty(txtInvoicedFrom.Text) Then fs.Add("Invoiced from: " & txtInvoicedFrom.Text)
        If Not String.IsNullOrEmpty(txtInvoicedTo.Text) Then fs.Add("Invoiced to: " & txtInvoicedTo.Text)
        If Not String.IsNullOrEmpty(cbInvoiceState.SelectedValue) Then fs.Add("Inv.State: " & cbInvoiceState.SelectedItem.Text)
        If Not String.IsNullOrEmpty(cbResState.SelectedValue) Then fs.Add("Res.State: " & cbResState.SelectedItem.Text)
        If cbManual.Checked Then fs.Add("Manually invoiced")

        Dim sa(fs.Count - 1) As [String]
        fs.CopyTo(sa, 0)
        Return String.Join(" AND ", sa)
    End Function

    Protected Sub btClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btClear.Click
        cbHotelHID.SelectedIndex = 0
        cbHotelGroup.SelectedIndex = 0
        cbHotel.SelectedIndex = 0
        cbTTOOGroup.SelectedIndex = 0
        cbTTOO.SelectedIndex = 0
        cbMarket.SelectedIndex = 0
        cbPayCond.SelectedIndex = 0
        txtName.Text = Nothing
        txtFolio.Text = Nothing
        txtBkNumber.Text = Nothing
        txtResGroup.Text = Nothing
        txtInvNumFrom.Text = Nothing
        txtInvNumTo.Text = Nothing
        txtCkInFrom.Text = Nothing
        txtCkInTo.Text = Nothing
        txtCkOutFrom.Text = Nothing
        txtCkOutTo.Text = Nothing
        txtInvoicedFrom.Text = Nothing
        txtInvoicedTo.Text = Nothing
        cbInvoiceState.SelectedIndex = 0
        cbResState.SelectedIndex = 0
        cbManual.Checked = False
    End Sub

    Protected Sub btnReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReport.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()
        Dim user As String = Membership.GetUser.UserName

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport

        If cbManual.Checked Then
            lr.ReportPath = "Reports\Invoices\ReservationLedgerInvoice.rdlc"
            lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsRateFlow_InvLedger", dsInvLedger))
        Else
            lr.ReportPath = "Reports\Invoices\ReservationLedger.rdlc"
        End If

        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsRateFlow_ResLedger", dsResLedger))
        Dim pfilter As New ReportParameter("ReportFilter", ReportFilter())
        Dim photel As New ReportParameter("hotel", ckbHotel.Checked)
        Dim puser As New ReportParameter("user", My.User.Name)
        Dim pstate As New ReportParameter("showState", cbStates.Checked)
        Dim pcredit As New ReportParameter("showCreditDebit", cbCreditDebit.Checked)
        Dim prates As New ReportParameter("showRates", cbRates.Checked)
        Dim p As ReportParameter() = {pfilter, photel, puser, pstate, pcredit, prates}
        lr.SetParameters(p)

        'Try
        Response.ClearContent()
        Response.ClearHeaders()
        bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
        Response.ContentType = "application/excel"
        Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Guest vs City Ledger.xls" + """")

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
        'Catch ex As Exception
        '    'popShow("Error", ex)
        '    popShow("Timeout", Nothing, "<b>This report is taking too much time to execute.<br />Please try to narrow filter criteria.</b>")
        'End Try
    End Sub

    'Dim cName As String
    'Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    '    cName = Me.ToString & "_" & My.User.Name

    '    If Me.IsPostBack Then
    '        CookieSave()
    '    ElseIf (Request.Cookies(cName) IsNot Nothing) Then
    '        CookieLoad()
    '    End If
    'End Sub

    'Protected Sub CookieLoad()
    '    Try
    '        If (Request.Cookies(cName)("cbHotelHID") IsNot Nothing) Then cbHotelHID.SelectedIndex = Request.Cookies(cName)("cbHotelHID")
    '        If (Request.Cookies(cName)("cbHotelGroup") IsNot Nothing) Then cbHotelGroup.SelectedIndex = Request.Cookies(cName)("cbHotelGroup")
    '        If (Request.Cookies(cName)("cbHotel") IsNot Nothing) Then cbHotel.SelectedIndex = Request.Cookies(cName)("cbHotel")
    '        If (Request.Cookies(cName)("cbTTOOGroup") IsNot Nothing) Then cbTTOOGroup.SelectedIndex = Request.Cookies(cName)("cbTTOOGroup")
    '        If (Request.Cookies(cName)("cbTTOO") IsNot Nothing) Then cbTTOO.SelectedIndex = Request.Cookies(cName)("cbTTOO")
    '        If (Request.Cookies(cName)("cbMarket") IsNot Nothing) Then cbMarket.SelectedIndex = Request.Cookies(cName)("cbMarket")
    '        If (Request.Cookies(cName)("cbPayCond") IsNot Nothing) Then cbPayCond.SelectedIndex = Request.Cookies(cName)("cbPayCond")
    '        If (Request.Cookies(cName)("txtName") IsNot Nothing) Then txtName.Text = Request.Cookies(cName)("txtName")
    '        If (Request.Cookies(cName)("txtFolio") IsNot Nothing) Then txtFolio.Text = Request.Cookies(cName)("txtFolio")
    '        If (Request.Cookies(cName)("txtBkNumber") IsNot Nothing) Then txtBkNumber.Text = Request.Cookies(cName)("txtBkNumber")
    '        If (Request.Cookies(cName)("txtResGroup") IsNot Nothing) Then txtResGroup.Text = Request.Cookies(cName)("txtResGroup")
    '        If (Request.Cookies(cName)("txtInvNumFrom") IsNot Nothing) Then txtInvNumFrom.Text = Request.Cookies(cName)("txtInvNumFrom")
    '        If (Request.Cookies(cName)("txtInvNumTo") IsNot Nothing) Then txtInvNumTo.Text = Request.Cookies(cName)("txtInvNumTo")
    '        If (Request.Cookies(cName)("txtCkInFrom") IsNot Nothing) Then txtCkInFrom.Text = Request.Cookies(cName)("txtCkInFrom")
    '        If (Request.Cookies(cName)("txtCkInTo") IsNot Nothing) Then txtCkInTo.Text = Request.Cookies(cName)("txtCkInTo")
    '        If (Request.Cookies(cName)("txtCkOutFrom") IsNot Nothing) Then txtCkOutFrom.Text = Request.Cookies(cName)("txtCkOutFrom")
    '        If (Request.Cookies(cName)("txtCkOutTo") IsNot Nothing) Then txtCkOutTo.Text = Request.Cookies(cName)("txtCkOutTo")
    '        If (Request.Cookies(cName)("txtInvoicedFrom") IsNot Nothing) Then txtInvoicedFrom.Text = Request.Cookies(cName)("txtInvoicedFrom")
    '        If (Request.Cookies(cName)("txtInvoicedTo") IsNot Nothing) Then txtInvoicedTo.Text = Request.Cookies(cName)("txtInvoicedTo")
    '        If (Request.Cookies(cName)("cbInvoiceState") IsNot Nothing) Then cbInvoiceState.SelectedIndex = Request.Cookies(cName)("cbInvoiceState")
    '        If (Request.Cookies(cName)("cbResState") IsNot Nothing) Then cbResState.SelectedIndex = Request.Cookies(cName)("cbResState")
    '        If (Request.Cookies(cName)("cbManual") IsNot Nothing) Then cbManual.Checked = Request.Cookies(cName)("cbManual")
    '    Catch ex As Exception
    '        MsgBox(ex.Message)
    '    End Try
    'End Sub

    'Protected Sub CookieSave()
    '    Response.Cookies(cName)("cbHotelHID") = cbHotelHID.SelectedIndex.ToString
    '    Response.Cookies(cName)("cbHotelGroup") = cbHotelGroup.SelectedIndex.ToString
    '    Response.Cookies(cName)("cbHotel") = cbHotel.SelectedIndex.ToString
    '    Response.Cookies(cName)("cbTTOOGroup") = cbTTOOGroup.SelectedIndex.ToString
    '    Response.Cookies(cName)("cbTTOO") = cbTTOO.SelectedIndex.ToString
    '    Response.Cookies(cName)("cbMarket") = cbMarket.SelectedIndex.ToString
    '    Response.Cookies(cName)("cbPayCond") = cbPayCond.SelectedIndex.ToString
    '    If Not String.IsNullOrEmpty(txtName.Text) Then Response.Cookies(cName)("txtName") = txtName.Text Else Response.Cookies(cName)("txtName") = Nothing
    '    If Not String.IsNullOrEmpty(txtFolio.Text) Then Response.Cookies(cName)("txtFolio") = txtFolio.Text Else Response.Cookies(cName)("txtFolio") = Nothing
    '    If Not String.IsNullOrEmpty(txtBkNumber.Text) Then Response.Cookies(cName)("txtBkNumber") = txtBkNumber.Text Else Response.Cookies(cName)("txtBkNumber") = Nothing
    '    If Not String.IsNullOrEmpty(txtResGroup.Text) Then Response.Cookies(cName)("txtResGroup") = txtResGroup.Text Else Response.Cookies(cName)("txtResGroup") = Nothing
    '    If Not String.IsNullOrEmpty(txtInvNumFrom.Text) Then Response.Cookies(cName)("txtInvNumFrom") = txtInvNumFrom.Text Else Response.Cookies(cName)("txtInvNumFrom") = Nothing
    '    If Not String.IsNullOrEmpty(txtInvNumTo.Text) Then Response.Cookies(cName)("txtInvNumTo") = txtInvNumTo.Text Else Response.Cookies(cName)("txtInvNumTo") = Nothing
    '    If Not String.IsNullOrEmpty(txtCkInFrom.Text) Then Response.Cookies(cName)("txtCkInFrom") = txtCkInFrom.Text Else Response.Cookies(cName)("txtCkInFrom") = Nothing
    '    If Not String.IsNullOrEmpty(txtCkInTo.Text) Then Response.Cookies(cName)("txtCkInTo") = txtCkInTo.Text Else Response.Cookies(cName)("txtCkInTo") = Nothing
    '    If Not String.IsNullOrEmpty(txtCkOutFrom.Text) Then Response.Cookies(cName)("txtCkOutFrom") = txtCkOutFrom.Text Else Response.Cookies(cName)("txtCkInTo") = Nothing
    '    If Not String.IsNullOrEmpty(txtCkOutTo.Text) Then Response.Cookies(cName)("txtCkOutTo") = txtCkOutTo.Text Else Response.Cookies(cName)("txtCkOutTo") = Nothing
    '    If Not String.IsNullOrEmpty(txtInvoicedFrom.Text) Then Response.Cookies(cName)("txtInvoicedFrom") = txtInvoicedFrom.Text Else Response.Cookies(cName)("txtInvoicedFrom") = Nothing
    '    If Not String.IsNullOrEmpty(txtInvoicedTo.Text) Then Response.Cookies(cName)("txtInvoicedTo") = txtInvoicedTo.Text Else Response.Cookies(cName)("txtInvoicedTo") = Nothing
    '    Response.Cookies(cName)("cbInvoiceState") = cbInvoiceState.SelectedIndex.ToString
    '    Response.Cookies(cName)("cbResState") = cbResState.SelectedIndex.ToString
    '    Response.Cookies(cName)("cbManual") = cbManual.Checked.ToString

    '    Response.Cookies(cName).Expires = DateTime.Now.AddYears(1)
    'End Sub

End Class
