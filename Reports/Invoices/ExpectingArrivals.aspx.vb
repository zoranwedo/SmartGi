Imports App_UserControls_MessagePop

Partial Class Reports_Invoices_ExpectingArrivals
    Inherits System.Web.UI.Page

    Protected Sub btClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btClear.Click
        ctrlHotel.ClearControl()
        ctrlTourOp.ClearControl()
        fltName.Text = String.Empty
        fltResGroup.Text = String.Empty
        fltBkNumber.Text = String.Empty
        ddlRoomType.SelectedIndex = 0
        ctrlFolioNum.ClearControl()
        ctrlCheckIn.ClearControl()
        ctrlBook.ClearControl()
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
        Dim pBkFrom As New ReportFilterClass(ctrlBook.DateFrom, ReportFilterClass.ValueType.valDate)
        Dim pBkTo As New ReportFilterClass(ctrlBook.DateTo, ReportFilterClass.ValueType.valDate)
        Dim pFolioFrom As New ReportFilterClass(ctrlFolioNum.IntegerFrom, ReportFilterClass.ValueType.valInteger)
        Dim pFolioTo As New ReportFilterClass(ctrlFolioNum.IntegerTo, ReportFilterClass.ValueType.valInteger)
        Dim pResGroup As New ReportFilterClass(fltResGroup.Text, ReportFilterClass.ValueType.valString)
        Dim pBkNum As New ReportFilterClass(fltBkNumber.Text, ReportFilterClass.ValueType.valString)
        Dim pName As New ReportFilterClass(fltName.Text, ReportFilterClass.ValueType.valString)
        Dim pRoom As New ReportFilterClass(ddlRoomType.SelectedValue, ReportFilterClass.ValueType.valString)

        paramLog = "Hotel group: " & pHotelGroup.ValueStr & _
                   "Hotel: " & pHotel.ValueStr & "; " & _
                   "TourOp group: " & pTourOpGroup.ValueStr & "; " & _
                   "Market: " & pMarket.ValueStr & "; " & _
                   "PayCond: " & pPayCond.ValueStr & "; " & _
                   "TourOp: " & pTourOp.ValueStr & "; " & _
                   "Check in: " & ctrlCheckIn.RangeString & "; " & _
                   "BkDate: " & ctrlBook.RangeString & "; " & _
                   "Folio: " & ctrlFolioNum.RangeString & "; " & _
                   "ResGroup: " & pResGroup.ValueStr & "; " & _
                   "BkNum: " & pBkNum.ValueStr & "; " & _
                   "Name: " & pName.ValueStr & "; " & _
                   "Room: " & pRoom.ValueStr

        Dim r As Boolean = True
        If pResGroup.HasValue Or pName.HasValue Or pBkNum.HasValue Or _
            Not ctrlCheckIn.Duration(3, DateInterval.Month) Or _
            Not ctrlBook.Duration(3, DateInterval.Month) Or _
            Not ctrlFolioNum.Duration(50000) Then
            r = True
        ElseIf h >= 8 And t >= 8 Then
            r = True
        ElseIf ctrlCheckIn.Duration(2, DateInterval.Year) And _
            ctrlBook.Duration(2, DateInterval.Year) Then
            errText = "<strong>Filter criteria too wide.</strong><br />" & _
                      "Try setting Hotel, Tour Operator,<br />" & _
                      "shorter date periods or number range."
            msgPop.ShowError(New Exception(errText))
            Return False
        ElseIf pRoom.HasValue Then
            r = True
        ElseIf h >= 1 Or t >= 1 Then
            r = Not (ctrlCheckIn.Duration(1, DateInterval.Year) And ctrlBook.Duration(1, DateInterval.Year) And ctrlFolioNum.Duration(50000))
            errText = "Try setting Tour Operator, shorter date periods or number range."
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
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()

        Dim tStart = Now
        Me.LogReport(LogApp.stateStart, "Report rendering started")

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Reports\Invoices\RptExpectingArrivals2.rdlc"

        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportsInvoice_Expecting_Arrivals", dsReservas))
        FilterString()

        Dim puser As New ReportParameter("user", My.User.Name)
        Dim pfilter As New ReportParameter("filterstring", FilterParam)

        Dim p As ReportParameter() = {puser, pfilter}
        lr.SetParameters(p)

        Try
            Response.ClearContent()
            Response.ClearHeaders()
            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Expecting_Arrivals.xls" + """")

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
        l.LogUserAction(My.User.Name, LogApp.objRpt, "Expecting Arrivals", logState, logText)
    End Sub

    Protected Function FilterParam() As String
        Dim pfc As New List(Of String)

        If ctrlTourOp.SelectedTourOpKind <> String.Empty Then pfc.Add("for " & ctrlTourOp.SelectedTourOpKindItem.Text & " tour operators")
        If ctrlTourOp.SelectedTourOpGroup <> String.Empty Then pfc.Add("for tour operator group: " & ctrlTourOp.SelectedTourOpGroupItem.Text)
        If ctrlTourOp.SelectedMarket <> String.Empty Then pfc.Add("for market: " & ctrlTourOp.SelectedMarketItem.Text)
        If ctrlTourOp.SelectedPayCond <> String.Empty Then pfc.Add("for pay condition: " & ctrlTourOp.SelectedPayCondItem.Text)
        If ctrlTourOp.SelectedTourOp <> String.Empty Then pfc.Add("for tour operator: " & ctrlTourOp.SelectedTourOpItem.Text)
        If ctrlCheckIn.RangeString <> String.Empty Then pfc.Add("for check in: " & ctrlCheckIn.RangeString)
        If ctrlBook.RangeString <> String.Empty Then pfc.Add("for bk.date in: " & ctrlBook.RangeString)
        If ctrlFolioNum.RangeString <> String.Empty Then pfc.Add("for folio in: " & ctrlFolioNum.RangeString)
        If fltName.Text <> String.Empty Then pfc.Add("for guest name like: " & fltName.Text)
        If fltResGroup.Text <> String.Empty Then pfc.Add("for group code or name like: " & fltResGroup.Text)
        If fltBkNumber.Text <> String.Empty Then pfc.Add("for bk.number like: " & fltBkNumber.Text)
        If ddlRoomType.SelectedIndex > 0 Then pfc.Add("for room type: " & ddlRoomType.SelectedValue)

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

        dsReservas.FilterExpression = f
    End Sub
End Class
