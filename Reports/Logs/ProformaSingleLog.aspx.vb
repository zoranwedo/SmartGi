Imports App_UserControls_MessagePop

Partial Class Reports_Logs_ProformaSingleLog
    Inherits System.Web.UI.Page

    Protected Sub dsLog_ObjectCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceEventArgs) Handles dsLog.ObjectCreated
        Dim ta As LogReportsTableAdapters.LogRep_ProformaSingleTableAdapter
        ta = e.ObjectInstance
        ta.SetTimeout(ReportFilterClass.ReportTimeout("Reports_Invoices_InvoiceJournal_TO"))
    End Sub

    Protected Sub btClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btClear.Click
        ctrlHotel.ClearControl()
        ctrlTourOp.ClearControl()
        ctrlCheckIn.ClearControl()
        ctrlInvNum.ClearControl()
        ctrlInvDate.ClearControl()
        ddlState.SelectedIndex = 0
    End Sub

    Protected Sub btReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btReport.Click
        If Me.CheckParams() Then RenderReport()
    End Sub

    Protected Sub msgPop_MessageYes(ByVal sender As Object, ByVal e As MessagePopArgs) Handles msgPop.MessageYes
        Dim paramLog As String = Session("paramLog")
        Me.LogReport(LogApp.stateWarning, paramLog)
        Me.RenderReport()
    End Sub

    Protected Function CheckParams() As Boolean
        Dim errText As String = String.Empty
        Dim paramLog As String = String.Empty

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
        Dim pState As New ReportFilterClass(ddlState.SelectedItem.Text, ReportFilterClass.ValueType.valString)

        paramLog = "Hotel: " & pHotel.ValueStr & "; " & _
                   "HotelGroup: " & pHotelGroup.ValueStr & "; " & _
                   "TourOp: " & pTourOp.ValueStr & "; " & _
                   "TourOpGroup: " & pTourOpGroup.ValueStr & "; " & _
                   "Market: " & pMarket.ValueStr & "; " & _
                   "PayCond: " & pPayCond.ValueStr & "; " & _
                   "CkInFrom: " & pCkInFrom.ValueStr & "; " & _
                   "CkInTo: " & pCkInTo.ValueStr & "; " & _
                   "InvNumFrom: " & pInvNumFrom.ValueStr & "; " & _
                   "InvNumTo: " & pInvNumTo.ValueStr & "; " & _
                   "InvDateFrom: " & pInvDateFrom.ValueStr & "; " & _
                   "InvDateTo: " & pInvDateTo.ValueStr & "; " & _
                   "State: " & pState.ValueStr

        Dim rCkIn As Integer = pCkInFrom.Duration(pCkInTo, DateInterval.Month)
        Dim rInvNum As Integer = pInvNumFrom.Range(pInvNumTo)
        Dim rInvDate As Integer = pInvDateFrom.Duration(pInvDateTo, DateInterval.Month)

        If Not (pHotel.HasValue And pTourOp.HasValue) Or rCkIn > 1 Or rInvDate > 1 Or rInvNum > 100 Then
            If (pHotelGroup.HasValue And pTourOp.HasValue) Or (pHotel.HasValue And pTourOpGroup.HasValue) Then
                If rCkIn > 1 Or rInvDate > 1 Or rInvNum > 100 Then
                    errText = "Try set shorter periods or number range."
                End If
            ElseIf pHotel.HasValue Or pTourOp.HasValue Then
                If rCkIn > 1 Or rInvDate > 1 Or rInvNum > 100 Then
                    errText = "Try set shorter periods or number range."
                End If
            ElseIf pHotelGroup.HasValue Or pTourOpGroup.HasValue Then
                If rCkIn > 1 Or rInvDate > 1 Or rInvNum > 100 Then
                    errText = "Try set specific Hotel, Tour Operator or shorter periods or number range."
                End If
            Else
                errText = "Try set specific Hotel, Tour Operator or shorter periods or number range."
            End If
        End If

        Dim r As Boolean = String.IsNullOrEmpty(errText)
        If Not r Then
            errText = "<p style='font-weight: bold; border-bottom: solid 1px;'>" & _
                      "Report could last too long or consume too much resources.<br/>" & _
                      "This could decrease performance of the entire system <br/>and affect all users.</p>" & _
                      "<p style='padding-left: 50px; padding-right: 50px;' >" & errText & "</p>"
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
        lr.ReportPath = "Reports\Logs\ProformaSingleLog.rdlc"

        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("LogReports_LogRep_ProformaSingle", dsLog))

        Dim p_user As New ReportParameter("user", My.User.Name)
        Dim p_filterstring As New ReportParameter("filterstring", FilterParam(False))

        Dim p As ReportParameter() = {p_user, p_filterstring}
        lr.SetParameters(p)

        Try
            Response.ClearContent()
            Response.ClearHeaders()

            If cbExcel.Checked Then
                bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
                Response.ContentType = "application/excel"
                Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Single Proformas Log.xls" + """")
            Else
                bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
                Response.ContentType = "application/pdf"
                Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Single Proformas Log.pdf" + """")
            End If

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

    Protected Function FilterParam(ByVal ByBooking As Boolean) As String
        Dim pfc As New List(Of String)

        If ctrlHotel.SelectedHotel <> String.Empty Then
            pfc.Add("for hotel: " & ctrlHotel.SelectedHotelItem.Text)
        Else
            If ctrlHotel.SelectedHotelGroup <> String.Empty Then pfc.Add("for hotel group: " & ctrlHotel.SelectedHotelGroupItem.Text)
        End If
        If ctrlTourOp.SelectedTourOp <> String.Empty Then
            pfc.Add("for tour operator: " & ctrlTourOp.SelectedTourOpItem.Text)
        Else
            If ctrlTourOp.SelectedTourOpKind <> String.Empty Then pfc.Add("for " & ctrlTourOp.SelectedTourOpKindItem.Text & " tour operators")
            If ctrlTourOp.SelectedTourOpGroup <> String.Empty Then pfc.Add("for tour operator group: " & ctrlTourOp.SelectedTourOpGroupItem.Text)
            If ctrlTourOp.SelectedMarket <> String.Empty Then pfc.Add("for market: " & ctrlTourOp.SelectedMarketItem.Text)
            If ctrlTourOp.SelectedPayCond <> String.Empty Then pfc.Add("for pay condition: " & ctrlTourOp.SelectedPayCondItem.Text)
        End If
        If ctrlCheckIn.RangeString <> String.Empty Then pfc.Add("for check in: " & ctrlCheckIn.RangeString)
        If ctrlInvNum.RangeString <> String.Empty Then pfc.Add("for proforma numbers: " & ctrlInvNum.RangeString)
        If ctrlInvDate.RangeString <> String.Empty Then pfc.Add("for proforma date in: " & ctrlInvDate.RangeString)
        If ddlState.SelectedIndex > 0 Then pfc.Add("for states: " & ddlState.SelectedItem.Text)

        Dim pfs As String = String.Empty
        If pfc.Count > 0 Then
            pfs = Join(pfc.ToArray, " AND ")
            pfs = pfs.Substring(0, 1).ToUpper & pfs.Substring(1)
        End If

        Return pfs
    End Function

    Protected Sub LogReport(ByVal logState As String, ByVal logText As String)
        Dim l As New LogApp
        l.LogUserAction(My.User.Name, LogApp.objRpt, "Single Proformas Log", logState, logText)
    End Sub
End Class
