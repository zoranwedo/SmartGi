
Partial Class Reports_Accounting_AccRepStatement_Old
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

            fltStart.Text = Today.ToShortDateString
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
        Dim asdate As String = Nothing

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Reports\Accounting\RptAccRepStatement.rdlc"

        'FilterString()
        

        'dsFilteredInvoices.Select()
        If cbCancel.Checked Then
            AddHandler lr.SubreportProcessing, AddressOf RptAgingBalanceSubreportProc
        End If

        If Not (String.IsNullOrEmpty(fltStart.Text)) Then
            asdate = fltStart.Text
        End If

        lr.DataSources.Clear()
  
        If cbHotel.Checked Then
            dsAccRepStatmentH.DataBind()
            lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportAccounting_AccRepStatementOfAccount", dsAccRepStatmentH))
        Else
            dsAccRepStatment.DataBind()
            lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportAccounting_AccRepStatementOfAccount", dsAccRepStatment))
        End If

        dsAccAgedBalance.DataBind()
        lr.Refresh()

        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim photel As New ReportParameter("hotel", Me.cbHotel.Checked)
        Dim pHotelName As New ReportParameter("pHotelName", Me.ddlHotel.SelectedItem.Text)
        Dim pcanceled As New ReportParameter("canceled", Me.cbCancel.Checked)
        Dim ppayed As New ReportParameter("payed", Me.cbPayed.Checked)
        Dim pasdate As New ReportParameter("asoffdate", asdate)
        Dim fs As String = PFilterString(True)
        Dim pfilter As New ReportParameter("filterstring", fs)
        Dim par As New ReportParameter("ar", Me.cbAR.Checked)
        Dim pfl As New ReportParameter("fl", Me.cbFL.Checked)
        Dim pnote As New ReportParameter("note", Me.cbNote.Checked)

        Dim p As ReportParameter() = {puser, photel, pcanceled, ppayed, pasdate, pfilter, par, pfl, pnote, pHotelName}
        lr.SetParameters(p)

        'Try
        Response.ClearContent()
        Response.ClearHeaders()

        If cbExcel.Checked Then
            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Account Statement.xls" + """")
        Else
            bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/pdf"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Account Statement.pdf" + """")
        End If

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
        ' Catch ex As Exception

        ' End Try

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Me.dsAccRepStatment.Select()
        pnlCnt.Visible = True
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        pnlCnt.Visible = False

        ddlHotel.SelectedValue = ""
        ddlHotelGroup.SelectedValue = ""
        ddlTO.SelectedValue = ""
        ddlTOGroup.SelectedValue = ""
        ddlMarkets.SelectedValue = ""
        ddlPay.SelectedValue = ""
        ddlAccType.SelectedValue = "AR"
        fltStart.Text = Today.ToShortDateString

        cbCancel.Checked = False
        cbPayed.Checked = False
        cbAR.Checked = True
        cbFL.Checked = True
        cbNote.Checked = False
    End Sub

    Protected Sub ddlHotel_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlHotel.SelectedIndexChanged
        'If Not String.IsNullOrEmpty(ddlHotel.SelectedValue) Then
        '    If Int32.Parse(ddlHotel.SelectedValue) = -1 Then
        '        ddlHotelGroup.Enabled = True
        '    Else
        '        ddlHotelGroup.Enabled = False
        '    End If
        'Else
        '    ddlHotelGroup.Enabled = False
        'End If
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

    Protected Sub Button5_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button5.Click
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
        lr.ReportPath = "Reports\Accounting\RptAccRepStatementByBook.rdlc"

        'FilterString()
        dsAccRepStatmentBk.DataBind()
        'dsFilteredInvoices.Select()

        If Not (String.IsNullOrEmpty(fltStart.Text)) Then
            asdate = fltStart.Text
        End If

        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("AccStatement_AccRepStatementOfAccBook", dsAccRepStatmentBk))
        lr.Refresh()

        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim photel As New ReportParameter("hotel", Me.cbHotel.Checked)
        Dim pHotelName As New ReportParameter("pHotelName", Me.ddlHotel.SelectedItem.Text)
        Dim pcanceled As New ReportParameter("canceled", Me.cbCancel.Checked)
        Dim ppayed As New ReportParameter("payed", Me.cbPayed.Checked)
        Dim pasdate As New ReportParameter("asoffdate", asdate)
        Dim fs As String = PFilterString(False)
        Dim pfilter As New ReportParameter("filterstring", fs)

        Dim p As ReportParameter() = {puser, photel, pcanceled, ppayed, pasdate, pfilter, pHotelName}
        lr.SetParameters(p)

        Response.ClearContent()
        Response.ClearHeaders()

        If cbExcel.Checked Then
            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Account of Statement by Booking.xls" + """")
        Else
            bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/pdf"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Account of Statement by Booking.pdf" + """")
        End If

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub
    Protected Function PFilterString(ByRef basic As Boolean) As String
        Dim strFilter As String = ""

        'If Not (ddlHotel.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For hotel ", "|For hotel ") & ddlHotel.SelectedItem.Text & Chr(10) & Chr(13)
        If Not (ddlMarkets.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For market ", "|For market ") & ddlMarkets.SelectedItem.Text
        If Not (ddlTO.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For tour operator ", "|For tour operator ") & ddlTO.SelectedItem.Text & Chr(10) & Chr(13)
        If Not (ddlHotelGroup.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For hotel group ", "|For hotel group ") & ddlHotelGroup.SelectedItem.Text
        If Not (ddlTOGroup.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For TO group ", "|For TO group ") & ddlTOGroup.SelectedItem.Text
        If basic Then
            If Not (ddlAccType.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For acc type ", "|For acc type ") & ddlAccType.SelectedValue
            If (cbAR.Checked) Then strFilter &= IIf(strFilter = "", " With AR", "|With AR")
            If (cbFL.Checked) Then
                If (cbAR.Checked) Then
                    strFilter &= " And FL"
                Else : strFilter &= IIf(strFilter = "", " With FL", "|With FL")
                End If
            End If

        End If

        If Not (ddlPay.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For pay ", "|For pay ") & ddlPay.SelectedItem.Text

        If (cbAR.Checked) Then strFilter &= IIf(strFilter = "", "PAYMENT APPLIED TO THE BOOKING ", "|PAYMENT APPLIED TO THE BOOKING ")


        Return strFilter
    End Function

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
        'Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        'Dim streamids As String() = Nothing
        'Dim mimeType As String = Nothing
        'Dim encoding As String = Nothing
        'Dim extension As String = Nothing
        'Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        'Dim bytes As Byte()
        'Dim user As String = Membership.GetUser.UserName
        'Dim asdate As String = Nothing

        'Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        'lr.ReportPath = "Reports\Accounting\RptAccRepStatement_OldTest.rdlc"

        ''FilterString()
        'dsAccRepStatmentBk.DataBind()
        ''dsFilteredInvoices.Select()

        'If Not (String.IsNullOrEmpty(fltStart.Text)) Then
        '    asdate = fltStart.Text
        'End If

        'lr.DataSources.Clear()
        'lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportAccounting_AccRepAgingBalanceSum", dsAccAgedBalance))


        'lr.Refresh()

        'Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        'Dim photel As New ReportParameter("hotel", Me.cbHotel.Checked)
        'Dim pcanceled As New ReportParameter("canceled", Me.cbCancel.Checked)
        'Dim ppayed As New ReportParameter("payed", Me.cbPayed.Checked)
        'Dim pasdate As New ReportParameter("asoffdate", asdate)
        'Dim fs As String = PFilterString(False)
        'Dim pfilter As New ReportParameter("filterstring", fs)



        'Dim p As ReportParameter() = {puser, photel, pcanceled, ppayed, pasdate, pfilter}
        'lr.SetParameters(p)

        'Response.ClearContent()
        'Response.ClearHeaders()

        'If cbExcel.Checked Then
        '    bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
        '    Response.ContentType = "application/excel"
        '    Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Account of Statement by Booking.xls" + """")
        'Else
        '    bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
        '    Response.ContentType = "application/pdf"
        '    Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Account of Statement by Booking.pdf" + """")
        'End If

        'Response.BinaryWrite(bytes)
        'Response.Flush()
        'Response.Close()
    End Sub
    Protected Sub FilterString()
        'Dim strFilter As String = String.Empty

        'If ddlAccType.SelectedValue <> Nothing And Not String.IsNullOrEmpty(ddlAccType.SelectedValue) Then
        '    strFilter = "AccountTypeID =  '" & ddlAccType.SelectedValue & "'"
        'End If

        'If Not String.IsNullOrEmpty(strFilter) Then
        '    dsAccRepStatment.FilterExpression = strFilter
        '    dsAccRepStatmentBk.FilterExpression = strFilter
        'End If

    End Sub
    Public Sub RptAgingBalanceSubreportProc(ByVal sender As Object, ByVal e As SubreportProcessingEventArgs)
        If e.ReportPath.Contains("subRptAgingBalance") Then
            dsAccAgedBalance.DataBind()
            Try
                e.DataSources.Add(New ReportDataSource("ReportAccounting_AccRepAgingBalanceSum", dsAccAgedBalance))
            Catch ex As Exception

            End Try
            'e.DataSources.Add(New ReportDataSource("ReportAccounting_AccRepAgingBalanceSum", dsAccAgedBalance))
        End If
    End Sub

    Protected Sub Button6_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button6.Click
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
        lr.ReportPath = "Reports\Accounting\RptAccRepStatementBooking.rdlc"

        'FilterString()
        'ORDER BY HotelID, TourOpID, DebitCode, DebitNumber,SortField,DetText,TransDate,TransID

        'dsFilteredInvoices.Select()
        If cbCancel.Checked Then
            AddHandler lr.SubreportProcessing, AddressOf RptAgingBalanceSubreportProc
        End If

        If Not (String.IsNullOrEmpty(fltStart.Text)) Then
            asdate = fltStart.Text
        End If

        lr.DataSources.Clear()

        'If cbHotel.Checked Then
        dsAccRepStatmentH.DataBind()
        dsAccRepStatmentBooking.DataBind()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("AccStatement_AccRepStatementOfAccBooking", dsAccRepStatmentBooking))
        'Else
        '    dsAccRepStatment.DataBind()
        '    lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("AccStatement_AccRepStatementOfAccBooking", dsAccRepStatment))
        'End If

        dsAccAgedBalance.DataBind()

        'lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportAccounting_AccRepAgingBalanceSum", dsAccAgedBalance))


        lr.Refresh()

        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim photel As New ReportParameter("hotel", Me.cbHotel.Checked)
        Dim pHotelName As New ReportParameter("pHotelName", Me.ddlHotel.SelectedItem.Text)
        Dim pcanceled As New ReportParameter("canceled", Me.cbCancel.Checked)
        Dim ppayed As New ReportParameter("payed", Me.cbPayed.Checked)
        Dim pasdate As New ReportParameter("asoffdate", asdate)
        Dim fs As String = PFilterString(True)
        Dim pfilter As New ReportParameter("filterstring", fs)
        Dim par As New ReportParameter("ar", Me.cbAR.Checked)
        Dim pfl As New ReportParameter("fl", Me.cbFL.Checked)
        Dim pnote As New ReportParameter("note", Me.cbNote.Checked)

        Dim p As ReportParameter() = {puser, photel, pcanceled, ppayed, pasdate, pfilter, par, pfl, pnote, pHotelName}
        lr.SetParameters(p)

        'Try
        Response.ClearContent()
        Response.ClearHeaders()

        If cbExcel.Checked Then
            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Account Statement By Booking.xls" + """")
        Else
            bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/pdf"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Account Statement By Booking.pdf" + """")
        End If

        Response.BinaryWrite(bytes)
        Response.Flush()
        Response.Close()
    End Sub
End Class
