Imports App_UserControls_MessagePop

Partial Class Reports_Invoices_InvoiceJournal_CM
    Inherits System.Web.UI.Page

    Protected Sub btClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btClear.Click
        ctrlHotel.ClearControl()
        ctrlTourOp.ClearControl()
        ddlInvType.SelectedIndex = 0
        ctrlCheckIn.ClearControl()
        ctrlInvNum.ClearControl()
        ctrlInvDate.ClearControl()
        ddlState.SelectedIndex = 0
    End Sub

    Protected Sub btnReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btReport.Click
        If CheckParams() Then RenderReport()
    End Sub

    Protected Sub msgPop_MessageYes(ByVal sender As Object, ByVal e As MessagePopArgs) Handles msgPop.MessageYes
        Dim paramLog As String = Session("paramLog")
        Me.LogReport(LogApp.stateWarning, paramLog)
        RenderReport()
    End Sub

    Protected Function CheckParams() As Boolean
        Dim errText As String = String.Empty
        Dim paramLog As String = String.Empty
        Dim h As Integer = ctrlHotel.SelectionLevel
        Dim t As Integer = ctrlTourOp.SelectionLevel

        Dim pHotelGroup As New ReportFilterClass(ctrlHotel.SelectedHotelGroup, ReportFilterClass.ValueType.valInteger)
        Dim pHotel As New ReportFilterClass(ctrlHotel.SelectedHotel, ReportFilterClass.ValueType.valInteger)
        Dim pTourOpGroup As New ReportFilterClass(ctrlTourOp.SelectedTourOpGroup, ReportFilterClass.ValueType.valInteger)
        Dim pMarket As New ReportFilterClass(ctrlTourOp.SelectedMarket, ReportFilterClass.ValueType.valString)
        Dim pPayCond As New ReportFilterClass(ctrlTourOp.SelectedMarket, ReportFilterClass.ValueType.valString)
        Dim pTourOp As New ReportFilterClass(ctrlTourOp.SelectedTourOp, ReportFilterClass.ValueType.valInteger)
        Dim pCkInFrom As New ReportFilterClass(ctrlCheckIn.DateFrom, ReportFilterClass.ValueType.valDate)
        Dim pCkInTo As New ReportFilterClass(ctrlCheckIn.DateTo, ReportFilterClass.ValueType.valDate)
        Dim pInvNumFrom As New ReportFilterClass(ctrlInvNum.IntegerFrom, ReportFilterClass.ValueType.valInteger)
        Dim pInvNumTo As New ReportFilterClass(ctrlInvNum.IntegerTo, ReportFilterClass.ValueType.valInteger)
        Dim pInvDateFrom As New ReportFilterClass(ctrlInvDate.DateFrom, ReportFilterClass.ValueType.valDate)
        Dim pInvDateTo As New ReportFilterClass(ctrlInvDate.DateTo, ReportFilterClass.ValueType.valDate)

        paramLog = "Hotel group: " & pHotelGroup.ValueStr & _
                   "Hotel: " & pHotel.ValueStr & "; " & _
                   "TourOp group: " & pTourOpGroup.ValueStr & "; " & _
                   "Market: " & pMarket.ValueStr & "; " & _
                   "PayCond: " & pPayCond.ValueStr & "; " & _
                   "TourOp: " & pTourOp.ValueStr & "; " & _
                   "Check in from: " & pCkInFrom.ValueStr & "; " & _
                   "Check in to: " & pCkInTo.ValueStr & "; " & _
                   "InvNum from: " & pInvNumFrom.ValueStr & "; " & _
                   "InvNum to: " & pInvNumTo.ValueStr & "; " & _
                   "InvDate from: " & pInvDateFrom.ValueStr & "; " & _
                   "InvDate to: " & pInvDateTo.ValueStr

        Dim r As Boolean = True
        If h >= 8 And t >= 8 Then
            r = True
        ElseIf h >= 8 Then
            r = Not (ctrlCheckIn.Duration(2, DateInterval.Year) And ctrlInvDate.Duration(2, DateInterval.Year) And ctrlInvNum.Duration(50000))
            errText = "Try setting Tour Operator, shorter date periods or number range."
        ElseIf t >= 8 Then
            r = Not (ctrlCheckIn.Duration(2, DateInterval.Year) And ctrlInvDate.Duration(2, DateInterval.Year) And ctrlInvNum.Duration(50000))
            errText = "Try setting Hotel, shorter date periods or number range."
        ElseIf h >= 4 Then
            r = Not (ctrlCheckIn.Duration(1, DateInterval.Year) And ctrlInvDate.Duration(1, DateInterval.Year) And ctrlInvNum.Duration(10000))
            errText = "Try setting Tour Operator, shorter date periods or number range."
        ElseIf t >= 4 Then
            r = Not (ctrlCheckIn.Duration(1, DateInterval.Year) And ctrlInvDate.Duration(1, DateInterval.Year) And ctrlInvNum.Duration(10000))
            errText = "Try setting Hotel, shorter date periods or number range."
        ElseIf t > 0 Then
            r = Not (ctrlCheckIn.Duration(6, DateInterval.Month) And ctrlInvDate.Duration(6, DateInterval.Month) And ctrlInvNum.Duration(10000))
            errText = "Try setting Hotel, Tour Operator, shorter date periods or number range."
        ElseIf (ctrlCheckIn.Duration(3, DateInterval.Month) And ctrlInvDate.Duration(3, DateInterval.Month) And ctrlInvNum.Duration(10000)) Then
            errText = "<strong>Filter criteria too wide.</strong><br />" & _
                      "Try setting Hotel, Tour Operator,<br />" & _
                      "shorter date periods or number range."
            msgPop.ShowError(New Exception(errText))
            Return False
        Else

        End If

        If r = False Then
            errText = "<div style='font-weight: bold;'>" & _
                      "Report could last too long or consume too much resources.<br/>" & _
                      "This could decrease performance of the entire system and affect all users." & _
                      "<p style='padding: 5px; border: solid 1px; background-color: InfoBackground;' >" & errText & "</p>" & _
                      "Do you still want to generate this report?</div>"
            Session.Add("paramLog", paramLog)
            msgPop.ShowPrompt(errText)
        End If

        Return r
    End Function

    Protected Sub RenderReport()
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim fname As String = "InvoiceJournal CoopMarketing"
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()

        Dim tStart = Now
        Me.LogReport(LogApp.stateStart, "Report rendering started")

        'Report
        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Reports\Invoices\RptInvoiceJournalCM.rdlc"

        'FilterString()
        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsInvoiceJournalRate_InvoiceJournal_CM", dsJournal))
        FilterString()

        Dim puser As New ReportParameter("user", My.User.Name)
        Dim photel As New ReportParameter("hotel", False)
        Dim pHotelName As New ReportParameter("pHotelName", Me.ctrlHotel.SelectedHotelItem.Text)
        Dim pdateFrom As New ReportParameter("dateFrom")
        If Not String.IsNullOrEmpty(ctrlCheckIn.DateFrom) Then pdateFrom.Values.Add(ctrlCheckIn.DateFrom)
        Dim pdateTo As New ReportParameter("dateTo")
        If Not (String.IsNullOrEmpty(ctrlCheckIn.DateTo)) Then pdateTo.Values.Add(ctrlCheckIn.DateTo)
        Dim pfilter As New ReportParameter("filterstring", FilterParam)
        Dim p As ReportParameter() = {puser, photel, pdateFrom, pdateTo, pfilter, pHotelName}
        lr.SetParameters(p)

        Try
            Response.ClearContent()
            Response.ClearHeaders()
            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + fname + ".xls" + """")

            Response.BinaryWrite(bytes)
            Response.Flush()
            'Response.Close()
            Response.End()
            Me.LogReport(LogApp.stateComplete, String.Format("Report rendering finished in {0} sec.", DateDiff(DateInterval.Second, tStart, Now)))
        Catch ex As Exception
            Me.LogReport(LogApp.stateError, String.Format("Report rendering error: {0}", ex.Message))
            msgPop.ShowError(ex)
        End Try
    End Sub

    Protected Sub LogReport(ByVal logState As String, ByVal logText As String)
        Dim l As New LogApp
        l.LogUserAction(My.User.Name, LogApp.objRpt, "Invoice Journal CM", logState, logText)
    End Sub

    Protected Function FilterParam() As String
        Dim pfc As New List(Of String)

        If ctrlTourOp.SelectedTourOpKind <> String.Empty Then pfc.Add("for " & ctrlTourOp.SelectedTourOpKindItem.Text & " tour operators")
        If ctrlTourOp.SelectedTourOpGroup <> String.Empty Then pfc.Add("for tour operator group: " & ctrlTourOp.SelectedTourOpGroupItem.Text)
        If ctrlTourOp.SelectedMarket <> String.Empty Then pfc.Add("for market: " & ctrlTourOp.SelectedMarketItem.Text)
        If ctrlTourOp.SelectedPayCond <> String.Empty Then pfc.Add("for pay condition: " & ctrlTourOp.SelectedPayCondItem.Text)
        If ctrlTourOp.SelectedTourOp <> String.Empty Then pfc.Add("for tour operator: " & ctrlTourOp.SelectedTourOpItem.Text)
        If ddlInvType.SelectedIndex > 0 Then pfc.Add("only " & ddlInvType.SelectedItem.Text & " Invoices")
        If ctrlCheckIn.RangeString <> String.Empty Then pfc.Add("for check in: " & ctrlCheckIn.RangeString)
        If ctrlInvNum.RangeString <> String.Empty Then pfc.Add("for invoice numbers: " & ctrlInvNum.RangeString)
        If ctrlInvDate.RangeString <> String.Empty Then pfc.Add("for invoice date in: " & ctrlInvDate.RangeString)
        If ddlState.SelectedIndex > 0 Then pfc.Add("for states: " & ddlState.SelectedItem.Text)

        Dim pfs As String = String.Empty
        If pfc.Count > 0 Then
            pfs = Join(pfc.ToArray, " AND ")
            pfs = pfs.Substring(0, 1).ToUpper & pfs.Substring(1)
        End If

        Return pfs
    End Function

    Protected Sub FilterString()
        Dim f As String = String.Empty
        If ctrlTourOp.SelectedTourOpKind = "1" Then f = "TourOp NOT LIKE '%GROUPS%'"
        If ctrlTourOp.SelectedTourOpKind = "2" Then f = "TourOp LIKE '%GROUPS%'"

        dsJournal.FilterExpression = f
    End Sub

End Class
