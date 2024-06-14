Imports App_UserControls_MessagePop

Partial Class Reports_Invoices_ResCount
    Inherits System.Web.UI.Page

    Protected Sub dsReservations_ObjectCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceEventArgs) Handles dsReservations.ObjectCreated
        Dim ta As dsReservationsTableAdapters.RptReservationCountTableAdapter
        ta = e.ObjectInstance
        ta.SetTimeout(ReportFilterClass.ReportTimeout("ReportTimeout"))
    End Sub

    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        ctrlHotel.ClearControl()
        ctrlTourOp.ClearControl()
        ctrlCheckIn.ClearControl()
        ctrlCheckOut.ClearControl()
        cbCancelled.Checked = False
    End Sub

    Protected Sub btnReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReport.Click
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

        Dim pHotel As New ReportFilterClass(ctrlHotel.SelectedHotel, ReportFilterClass.ValueType.valInteger, "0")
        Dim pTourOp As New ReportFilterClass(ctrlTourOp.SelectedTourOp, ReportFilterClass.ValueType.valInteger, "0")
        Dim pPavCond As New ReportFilterClass(ctrlTourOp.SelectedPayCond, ReportFilterClass.ValueType.valString, "all")
        Dim pCkInFrom As New ReportFilterClass(ctrlCheckIn.DateFrom, ReportFilterClass.ValueType.valDate)
        Dim pCkInTo As New ReportFilterClass(ctrlCheckIn.DateTo, ReportFilterClass.ValueType.valDate)
        Dim pCkOutFrom As New ReportFilterClass(ctrlCheckOut.DateFrom, ReportFilterClass.ValueType.valDate)
        Dim pCkOutTo As New ReportFilterClass(ctrlCheckOut.DateTo, ReportFilterClass.ValueType.valDate)

        paramLog = "Hotel: " & pHotel.ValueStr & "; " & _
                   "TourOp: " & pTourOp.ValueStr & "; " & _
                   "Check in from: " & pCkInFrom.ValueStr & "; " & _
                   "Check in to: " & pCkInTo.ValueStr & "; " & _
                   "Check out from: " & pCkOutFrom.ValueStr & "; " & _
                   "Check out to: " & pCkOutTo.ValueStr

        Dim r As Boolean = True
        If pHotel.NoValue And pTourOp.NoValue And pCkInFrom.NoValue And pCkInTo.NoValue And pCkOutFrom.NoValue And pCkOutTo.NoValue Then
            Dim ex As New Exception("Please input some filtering criteria to generate report.")
            msgPop.ShowError(ex)
            Return False
        ElseIf pHotel.HasValue And pTourOp.HasValue Then
            r = Not (pCkInFrom.Duration(pCkInTo, DateInterval.Month) > 12 And pCkOutFrom.Duration(pCkOutTo, DateInterval.Month) > 12)
            errText = "Try setting shorter check in or check out periods."
        ElseIf pHotel.NoValue And pTourOp.NoValue Then
            r = Not (pCkInFrom.Duration(pCkInTo, DateInterval.Month) > 3 And pCkOutFrom.Duration(pCkOutTo, DateInterval.Month) > 3)
            errText = "Try setting hotel, tour operator and/or shorter check in or check out periods."
        ElseIf pHotel.HasValue Then
            r = Not (pCkInFrom.Duration(pCkInTo, DateInterval.Month) > 6 And pCkOutFrom.Duration(pCkOutTo, DateInterval.Month) > 6)
            errText = "Try setting tour operator and/or shorter check in or check out periods."
        ElseIf pTourOp.HasValue Then
            r = Not (pCkInFrom.Duration(pCkInTo, DateInterval.Month) > 6 And pCkOutFrom.Duration(pCkOutTo, DateInterval.Month) > 6)
            errText = "Try setting hotel and/or shorter check in or check out periods."
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
        Dim fname As String = "Reservation Count"
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()
        Dim user As String = Membership.GetUser.UserName

        Dim tStart = Now
        Me.LogReport(LogApp.stateStart, "Report rendering started")

        'Report
        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Reports\Invoices\ResCountReport.rdlc"

        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsReservations_RptReservationCount", dsReservations))
        lr.Refresh()

        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim photel As New ReportParameter("hotel", False)
        Dim pfilter As New ReportParameter("filterstring", FilterParam)
        Dim p As ReportParameter() = {puser, photel, pfilter}
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
            Me.LogReport(LogApp.stateComplete, String.Format("Reservation Count Report rendering finished in {0} sec.", DateDiff(DateInterval.Second, tStart, Now)))
        Catch ex As Exception
            Me.LogReport(LogApp.stateError, String.Format("Reservation Count Report rendering error: {0}", ex.Message))
            msgPop.ShowError(ex)
        End Try

    End Sub

    Protected Sub LogReport(ByVal logState As String, ByVal logText As String)
        Dim l As New LogApp
        l.LogUserAction(My.User.Name, LogApp.objRpt, "Reservation Count", logState, logText)
    End Sub

    Protected Function FilterParam() As String
        Dim pfc As New List(Of String)

        If Not String.IsNullOrEmpty(ctrlHotel.SelectedHotel) Then
            pfc.Add("for hotel: " & ctrlHotel.SelectedHotelItem.Text)
        Else
            If Not String.IsNullOrEmpty(ctrlHotel.SelectedHotelGroup) Then pfc.Add("for hotel group: " & ctrlHotel.SelectedHotelGroupItem.Text)
        End If

        If Not String.IsNullOrEmpty(ctrlTourOp.SelectedTourOp) Then
            pfc.Add("for tour operator: " & ctrlTourOp.SelectedTourOpItem.Text)
        Else
            If Not String.IsNullOrEmpty(ctrlTourOp.SelectedTourOpKind) Then pfc.Add(String.Format("for {0} tour operators", ctrlTourOp.SelectedTourOpKindItem.Text))
            If Not String.IsNullOrEmpty(ctrlTourOp.SelectedTourOpGroup) Then pfc.Add("for tour operator group: " & ctrlTourOp.SelectedTourOpGroupItem.Text)
            If Not String.IsNullOrEmpty(ctrlTourOp.SelectedMarket) Then pfc.Add("for market: " & ctrlTourOp.SelectedMarketItem.Text)
            If Not String.IsNullOrEmpty(ctrlTourOp.SelectedPayCond) Then pfc.Add("for pay condition: " & ctrlTourOp.SelectedPayCondItem.Text)
        End If
        If Not String.IsNullOrEmpty(ctrlCheckIn.RangeString) Then pfc.Add("check in " & ctrlCheckIn.RangeString)
        If Not String.IsNullOrEmpty(ctrlCheckOut.RangeString) Then pfc.Add("check in " & ctrlCheckOut.RangeString)
        If cbCancelled.Checked Then pfc.Add("including cancelled")

        Dim pfs As String = Join(pfc.ToArray, " AND ")
        pfs = pfs.Substring(0, 1).ToUpper & pfs.Substring(1)

        Return pfs
    End Function

    Public Function DateRange(ByVal chFrom As String, ByVal chTo As String) As String
        Dim b As Integer = 0
        Dim r As String
        If Not String.IsNullOrEmpty(chFrom) Then b = b + 1
        If Not String.IsNullOrEmpty(chTo) Then b = b + 10

        Select Case b
            Case 0 : r = "on any date"
            Case 1 : r = String.Format("from {0}", chFrom)
            Case 10 : r = String.Format("to {0}", chTo)
            Case 11 : r = String.Format("{0} - {1}", chFrom, chTo)
            Case Else : r = "error"
        End Select

        Return r
    End Function
End Class
