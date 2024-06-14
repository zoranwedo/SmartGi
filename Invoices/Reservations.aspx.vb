
Partial Class Invoices_Reservations
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        FormCookie()
    End Sub

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        FilterString()
        Me.dsReservas.Select()
        pnlCnt.Visible = True
    End Sub

    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        pnlCnt.Visible = False

        ddlHotelMap.SelectedIndex = 0
        fltTOMap.Text = String.Empty
        ctrlTourOp.ClearControl()
        fltName.Text = String.Empty
        fltResGroup.Text = String.Empty
        fltBkNumber.Text = String.Empty
        fltRoomMap.Text = String.Empty
        ctrlFolioNum.ClearControl()
        ctrlCheckIn.ClearControl()
        ctrlBook.ClearControl()
        ctrlCreated.ClearControl()
        ctrlModified.ClearControl()
        ddlState.SelectedIndex = 0
        cbGroup.Checked = False
        'cbCancel.Checked = False
    End Sub

    Protected Sub btnReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) 'Handles btnReport.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()
        Dim user As String = Membership.GetUser.UserName
        Dim lr As New Microsoft.Reporting.WebForms.LocalReport

        lr.ReportPath = "Reports\Invoices\RptReservationsNew.rdlc"
        FilterString()
        dsReservas.DataBind()

        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsDTS_ReservationReport", dsReservas))
        lr.Refresh()

        Dim fs As String = PFilterString()
        Dim pfilter As New ReportParameter("filterstring", fs)
        Dim photel As New ReportParameter("hotel", ModificationRights.RightsHotel)
        Dim p As ReportParameter() = {pfilter, photel}
        lr.SetParameters(p)

        Response.ClearContent()
        Response.ClearHeaders()

        bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
        Response.ContentType = "application/excel"
        Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Reservations.xls" + """")

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Sub btnReportNew_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReport.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()
        Dim user As String = Membership.GetUser.UserName
        Dim lr As New Microsoft.Reporting.WebForms.LocalReport

        lr.ReportPath = "Reports\Invoices\RptReservationsNew1.rdlc"
        FilterString()
        'dsReservas.DataBind()

        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsDTS_ResReport_ResReport", dsReservasNew))
        lr.Refresh()

        Dim fs As String = PFilterString()
        Dim pfilter As New ReportParameter("filterstring", fs)
        Dim photel As New ReportParameter("hotel", ModificationRights.RightsHotel)
        Dim p As ReportParameter() = {pfilter, photel}
        lr.SetParameters(p)

        Response.ClearContent()
        Response.ClearHeaders()

        bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
        Response.ContentType = "application/excel"
        Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Reservations.xls" + """")

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Function PFilterString() As String
        Dim strFilter As New List(Of String)

        If Not String.IsNullOrEmpty(ddlHotelMap.SelectedValue) Then strFilter.Add(" for hotel mapping: " & ddlHotelMap.SelectedItem.Text)
        If Not String.IsNullOrEmpty(fltTOMap.Text) Then strFilter.Add("for tour operator mapping: " & fltTOMap.Text)
        If Not String.IsNullOrEmpty(ctrlTourOp.SelectedTourOp) Then strFilter.Add("for tour operator " & ctrlTourOp.SelectedTourOpItem.Text)
        If Not String.IsNullOrEmpty(ctrlTourOp.SelectedPayCond) Then strFilter.Add("for pay condition  " & ctrlTourOp.SelectedPayCondItem.Text)
        If Not String.IsNullOrEmpty(fltName.Text) Then strFilter.Add("for guest name like " & fltName.Text)
        If Not String.IsNullOrEmpty(fltResGroup.Text) Then strFilter.Add("for group code or name like: " & fltResGroup.Text)
        If Not String.IsNullOrEmpty(fltRoomMap.Text) Then strFilter.Add("for room type like: " & fltRoomMap.Text)
        If Not String.IsNullOrEmpty(ctrlFolioNum.RangeString) Then strFilter.Add("for folio in: " & ctrlFolioNum.RangeString)
        If Not String.IsNullOrEmpty(ctrlCheckIn.RangeString) Then strFilter.Add("for check in: " & ctrlCheckIn.RangeString)
        If Not String.IsNullOrEmpty(ctrlBook.RangeString) Then strFilter.Add("for bk.date: " & ctrlBook.RangeString)
        If Not String.IsNullOrEmpty(fltBkNumber.Text) Then strFilter.Add("for bk.number like: " & fltBkNumber.Text)
        If Not String.IsNullOrEmpty(ctrlCreated.RangeString) Then strFilter.Add("for created: " & ctrlCreated.RangeString)
        If Not String.IsNullOrEmpty(ctrlModified.RangeString) Then strFilter.Add("for modified: " & ctrlModified.RangeString)
        If Not String.IsNullOrEmpty(ddlState.SelectedValue) Then strFilter.Add("State: " & ddlState.SelectedItem.Text)
        If cbGroup.Checked Then strFilter.Add("only group reservations")
        'If Not cbCancel.Checked Then strFilter.Add("exclude cancelled reservations")

        Return String.Join(" and ", strFilter.ToArray)
    End Function

    Protected Sub FilterString()
        dsReservas.FilterExpression = Nothing
        dsReservasNew.FilterExpression = Nothing

        If ddlState.SelectedIndex > 0 Then
            Dim f As String = Nothing
            'Active:	ResType <> 'C' and 'S'
            'Canceled:	ResType = 'C'
            'Check In:	TipoReg = 'H' or 'O'
            'No Show:	ResType = 'S'
            Select Case ddlState.SelectedItem.Value
                Case "Active"
                    f = "StateText = 'Active'"
                Case "CheckIn"
                    f = "StateText = 'Check In'"
                Case "CheckOut"
                    f = "StateText = 'Check Out'"
                Case "NoShow"
                    f = "StateText = 'No Show'"
                Case "Cancelled"
                    f = "StateText = 'Cancelled'"
                Case "NotCancelled"
                    f = "StateText <> 'Cancelled'"
            End Select
            dsReservas.FilterExpression = f
            dsReservasNew.FilterExpression = f
        End If
    End Sub

    Protected Sub dsReservas_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles dsReservas.Selecting
        e.InputParameters("OnlyGroup") = IIf(cbGroup.Checked, 1, 0)
    End Sub

    Protected Sub dsReservasNew_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles dsReservasNew.Selecting
        e.InputParameters("OnlyGroup") = IIf(cbGroup.Checked, 1, 0)
    End Sub

    Protected Sub gvRates_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvReservas.DataBound
        If gvReservas.Rows.Count > 0 Then
            Dim ff As String = String.Empty

            For Each grv As GridViewRow In gvReservas.Rows
                If grv.Cells(1).Text = ff Then
                    For i = 0 To 16
                        grv.Cells(i).Text = String.Empty
                    Next
                    If grv.RowIndex > 0 Then
                        gvReservas.Rows(grv.RowIndex - 1).BorderColor = Drawing.Color.Silver
                    End If
                Else
                    ff = grv.Cells(1).Text
                    For i = 0 To 16
                        grv.Cells(i).HorizontalAlign = HorizontalAlign.Center
                    Next
                End If
            Next

        End If
    End Sub

    Protected Sub FormCookie()
        Dim cName As String = "Reservations$_" & Membership.GetUser.UserName
        If (Request.Cookies(cName) IsNot Nothing) Then
            If Not Me.IsPostBack Then
                Try
                    If (Request.Cookies(cName)("ddlHotelMap") IsNot Nothing) Then _
                        ddlHotelMap.SelectedValue = Request.Cookies(cName)("ddlHotelMap")
                    If (Request.Cookies(cName)("fltTOMap") IsNot Nothing) Then _
                        fltTOMap.Text = Request.Cookies(cName)("fltTOMap")
                    ctrlTourOp.LoadCookie(cName)
                    If (Request.Cookies(cName)("fltName") IsNot Nothing) Then _
                        fltName.Text = Request.Cookies(cName)("fltName")
                    If (Request.Cookies(cName)("fltResGroup") IsNot Nothing) Then _
                        fltResGroup.Text = Request.Cookies(cName)("fltResGroup")
                    If (Request.Cookies(cName)("fltBkNumber") IsNot Nothing) Then _
                        fltBkNumber.Text = Request.Cookies(cName)("fltBkNumber")
                    If (Request.Cookies(cName)("fltRoomMap") IsNot Nothing) Then _
                        fltRoomMap.Text = Request.Cookies(cName)("fltRoomMap")
                    ctrlCheckIn.LoadCookie(cName)
                    ctrlBook.LoadCookie(cName)
                    ctrlCreated.LoadCookie(cName)
                    ctrlModified.LoadCookie(cName)
                    If (Request.Cookies(cName)("ddlState") IsNot Nothing) Then _
                        ddlState.SelectedValue = Request.Cookies(cName)("ddlState")
                    If (Request.Cookies(cName)("cbGroup") IsNot Nothing) Then _
                        cbGroup.Checked = Request.Cookies(cName)("cbGroup")
                    'If (Request.Cookies(cName)("cbCancel") IsNot Nothing) Then _
                    '   cbCancel.Checked = Request.Cookies(cName)("cbCancel")
                Catch ex As Exception
                    MsgBox("!")
                End Try
            End If
        End If

        If Me.IsPostBack Then
            Response.Cookies(cName)("ddlHotelMap") = ddlHotelMap.SelectedValue
            Response.Cookies(cName)("fltTOMap") = fltTOMap.Text
            ctrlTourOp.SaveCookie(cName)
            Response.Cookies(cName)("fltName") = fltName.Text
            Response.Cookies(cName)("fltResGroup") = fltResGroup.Text
            Response.Cookies(cName)("fltBkNumber") = fltBkNumber.Text
            Response.Cookies(cName)("fltRoomMap") = fltRoomMap.Text
            ctrlCheckIn.SaveCookie(cName)
            ctrlBook.SaveCookie(cName)
            ctrlCreated.SaveCookie(cName)
            ctrlModified.SaveCookie(cName)
            Response.Cookies(cName)("ddlState") = ddlState.SelectedValue
            Response.Cookies(cName)("cbGroup") = cbGroup.Checked
            'Response.Cookies(cName)("cbCancel") = cbCancel.Checked
        End If
    End Sub

End Class
