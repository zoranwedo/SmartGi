
Partial Class Reports_Contracts_NewContaractRate
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not (Page.IsPostBack) Then
            If ModificationRights.RightsHotel Then
                'btSwitchReport.Visible = False
                cbHotel.Checked = True
                cbHotel.Visible = False
            End If
        End If
    End Sub

    Protected Sub btClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btClear.Click
        'ddlHotel.SelectedValue = String.Empty
        ddlHotel.ClearControl()
        ddlTO.SelectedValue = String.Empty
        ddlMarkets.SelectedValue = String.Empty
        ddlPayCond.SelectedValue = String.Empty
        ddlRType.SelectedValue = String.Empty
        fltStart.Text = String.Empty
        fltFinish.Text = String.Empty
        fltBkStart.Text = String.Empty
        fltBkEnd.Text = String.Empty
        fltBkCode.Text = String.Empty
        fltRateCode.Text = String.Empty
        fltName.Text = String.Empty
        ddlState.SelectedValue = String.Empty
    End Sub

    Protected Sub btReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btReport.Click
        If Me.CheckParams() Then RenderReport()
    End Sub

    Protected Sub btnWarningYes_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnWarningYes.Click
        Dim paramLog As String = Session("paramLog")
        Me.LogReport(LogApp.stateWarning, paramLog)
        Me.RenderReport()
    End Sub

    Protected Sub RenderReport()
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim bytes As Byte()

        Dim tStart = Now
        Me.LogReport(LogApp.stateStart, "Report rendering started")

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        Select Case ddlOptions.SelectedValue
            Case 1
                lr.ReportPath = "Reports\Contracts\NewContractRateV01.rdlc"
            Case 2
                lr.ReportPath = "Reports\Contracts\NewContractRateSummaryV01.rdlc"
            Case 3
                lr.ReportPath = "Reports\Contracts\NewContractRateDetailsV01.rdlc"
        End Select

        Dim p_user As New ReportParameter("user", My.User.Name)
        Dim p_hotel As New ReportParameter("hotel", cbHotel.Checked)
        Dim p_filterstring As New ReportParameter("filterString", pFilterString)
        Dim p_comments As New ReportParameter("comments", cbComments.Checked)
        Dim p_summary As New ReportParameter("summary", ddlOptions.SelectedValue <> 3)
        Dim p_detail As New ReportParameter("detail", ddlOptions.SelectedValue <> 2)
        Dim p_excel As New ReportParameter("excel", cbExcel.Checked)
        Dim p As ReportParameter() = {p_user, p_hotel, p_filterstring, p_comments, p_summary, p_detail, p_excel}
        lr.SetParameters(p)

        Try
            lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsNewRateReport_ReportRatesDetailAll", GetDatasource()))

            If cbExcel.Checked Then
                bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
                Response.ClearContent()
                Response.ClearHeaders()
                Response.ContentType = "application/excel"
                Response.AppendHeader("Content-Disposition", "attachment; filename=""" & GetReportName() & ".xls" + """")
            Else
                bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
                Response.ClearContent()
                Response.ClearHeaders()
                Response.ContentType = "application/pdf"
                Response.AppendHeader("Content-Disposition", "attachment; filename=""" & GetReportName() & ".pdf" + """")
            End If

            Response.BinaryWrite(bytes)
            Response.Flush()
            'Response.Close()
            Response.End()
            Me.LogReport(LogApp.stateComplete, String.Format("Report rendering finished in {0} sec.", DateDiff(DateInterval.Second, tStart, Now)))
        Catch ex As Exception
            Me.LogReport(LogApp.stateError, String.Format("Report rendering error: {0}", ex.Message))
            popShow("Report Rendering Error", ex)
        End Try
    End Sub

    Protected Function pFilterString_old() As String
        Dim strFilter As String = " Applicable from " & fltStart.Text & " to " & fltFinish.Text
        If Not (ddlTO.SelectedValue = "") Then strFilter &= " AND For tour operator " & ddlTO.SelectedItem.Text
        If Not (ddlMarkets.SelectedValue = "") Then strFilter &= " AND For market " & ddlMarkets.SelectedValue
        If Not (ddlPayCond.SelectedValue = "") Then strFilter &= " AND For " & ddlPayCond.SelectedItem.Text & " payments"
        If Not (ddlRType.SelectedValue = "") Then strFilter &= " AND For rate type " & ddlRType.SelectedItem.Text
        If Not (fltRateCode.Text = "") Then strFilter &= " AND For rate code like " & fltRateCode.Text
        If Not (fltName.Text = "") Then strFilter &= " AND For title like " & fltName.Text
        If Not (fltBkCode.Text = "") Then strFilter &= " AND For Booking code like " & fltBkCode.Text
        If Not (fltBkStart.Text = "" And fltBkEnd.Text = "") Then strFilter &= " AND For Booking period"
        If Not (fltBkStart.Text = "") Then strFilter &= " from " & fltBkStart.Text
        If Not (fltBkEnd.Text = "") Then strFilter &= " to " & fltBkEnd.Text
        If Not (ddlState.SelectedValue = "") Then strFilter &= " AND In " & ddlState.SelectedItem.Text & " states"

        'MsgBox(strFilter)
        Return strFilter
    End Function

    Protected Function pFilterString() As String
        Dim strFilter As New List(Of String)
        Dim strTravel As String = ReportFilterClass.ReportPeriod(fltStart.Text, fltFinish.Text)
        Dim strBooking As String = ReportFilterClass.ReportPeriod(fltBkStart.Text, fltBkEnd.Text)

        'If Not String.IsNullOrEmpty(ddlHotel.SelectedValue) Then strFilter.Add("Hotel: " & ddlHotel.SelectedItem.Text)
        If Not String.IsNullOrEmpty(ddlTO.SelectedValue) Then strFilter.Add("Tour Operator " & ddlTO.SelectedItem.Text)
        If Not String.IsNullOrEmpty(ddlMarkets.SelectedValue) Then strFilter.Add("Market: " & ddlMarkets.SelectedValue)
        If Not String.IsNullOrEmpty(ddlPayCond.SelectedValue) Then strFilter.Add("Pay.Condition: " & ddlPayCond.SelectedItem.Text)
        If Not String.IsNullOrEmpty(ddlRType.SelectedValue) Then strFilter.Add("Rate Type: " & ddlRType.SelectedItem.Text)
        If Not String.IsNullOrEmpty(fltRateCode.Text) Then strFilter.Add("Rate Code: " & fltRateCode.Text)
        If Not String.IsNullOrEmpty(fltName.Text) Then strFilter.Add("Title: " & fltName.Text)
        If Not String.IsNullOrEmpty(strTravel) Then strFilter.Add("Travel Start-End: " & strTravel)
        If Not String.IsNullOrEmpty(fltBkCode.Text) Then strFilter.Add("Bk.Code: " & fltBkCode.Text)
        If Not String.IsNullOrEmpty(strBooking) Then strFilter.Add("Bk. Start-End: " & strBooking)
        If Not String.IsNullOrEmpty(ddlState.SelectedValue) Then strFilter.Add("State: " & ddlState.SelectedItem.Text)

        Return String.Join(" and ", strFilter.ToArray)
    End Function

    Protected Function GetReportName() As String
        Return "NewRateReport"
    End Function

    Protected Function GetDatasource() As Object
        Dim ta As New dsNewRateReportTableAdapters.ReportRatesDetailAllTableAdapter
        Dim tb As dsNewRateReport.ReportRatesDetailAllDataTable

        Dim pHotelID = Nothing
        Dim pTourOpID = Nothing
        Dim pMarketID = Nothing
        Dim pPayCondID = Nothing
        Dim pRType = Nothing
        Dim pStart = Nothing
        Dim pFinish = Nothing
        Dim pBkStart = Nothing
        Dim pBkFinish = Nothing
        Dim pBkCode = Nothing
        Dim pRateCodeID = Nothing
        Dim pTitle = Nothing
        Dim pStateID = Nothing

        'If Not String.IsNullOrEmpty(ddlHotel.SelectedValue) Then pHotelID = Integer.Parse(ddlHotel.SelectedValue)
        If Not String.IsNullOrEmpty(ddlHotel.SelectedHotelValue) Then pHotelID = Integer.Parse(ddlHotel.SelectedHotelValue)
        If Not String.IsNullOrEmpty(ddlTO.SelectedValue) Then pTourOpID = Integer.Parse(ddlTO.SelectedValue)
        If Not String.IsNullOrEmpty(ddlMarkets.SelectedValue) Then pMarketID = ddlMarkets.SelectedValue
        If Not String.IsNullOrEmpty(ddlPayCond.SelectedValue) Then pPayCondID = ddlPayCond.SelectedValue
        If Not String.IsNullOrEmpty(ddlRType.SelectedValue) Then pRType = Integer.Parse(ddlRType.SelectedValue)
        If Not String.IsNullOrEmpty(fltStart.Text) Then pStart = Date.Parse(fltStart.Text)
        If Not String.IsNullOrEmpty(fltFinish.Text) Then pFinish = Date.Parse(fltFinish.Text)
        If Not String.IsNullOrEmpty(fltBkStart.Text) Then pBkStart = Date.Parse(fltBkStart.Text)
        If Not String.IsNullOrEmpty(fltBkEnd.Text) Then pBkFinish = Date.Parse(fltBkEnd.Text)
        If Not String.IsNullOrEmpty(fltBkCode.Text) Then pBkCode = fltBkCode.Text
        If Not String.IsNullOrEmpty(fltRateCode.Text) Then pRateCodeID = fltRateCode.Text
        If Not String.IsNullOrEmpty(fltName.Text) Then pTitle = fltName.Text
        If Not String.IsNullOrEmpty(ddlState.SelectedValue) Then pStateID = Integer.Parse(ddlState.SelectedValue)

        ta.SetTimeout(ReportFilterClass.ReportTimeout("Reports_Contracts_NewContaractRate"))
        If cbHotel.Checked Then
            tb = ta.GetDataHTL(pHotelID, pTourOpID, pMarketID, pPayCondID, pRType, pStart, pFinish, pBkStart, pBkFinish, pBkCode, pRateCodeID, pTitle, pStateID)
        Else
            tb = ta.GetData(pHotelID, pTourOpID, pMarketID, pPayCondID, pRType, pStart, pFinish, pBkStart, pBkFinish, pBkCode, pRateCodeID, pTitle, pStateID)
        End If

        Return tb
    End Function

    'Protected Function CheckGetDatasource() As Object
    '    Dim errText As String
    '    Dim ta As New dsNewRateReportTableAdapters.ReportRatesDetailAllTableAdapter
    '    Dim tb As dsNewRateReport.ReportRatesDetailAllDataTable

    '    If Not String.IsNullOrEmpty(errText) Then
    '        errText = "<p style='font-weight: bold; border-bottom: solid 1px;'>Report could last too long or consume too much resources.</p>" & _
    '                  "<p style='padding-left: 50px; padding-right: 50px;' >" & errText & "</p>"
    '        Throw New ApplicationException(errText)
    '    Else
    '        ta.SetTimeout(ReportFilterClass.ReportTimeout("Reports_Contracts_NewContaractRate"))
    '        Try
    '            If cbHotel.Checked Then
    '                tb = ta.GetDataHTL( _
    '                    pHotelID.Value, pTourOpID.Value, pMarketID.Value, pPayCondID.Value, pRType.Value, _
    '                    pStart.Value, pFinish.Value, pBkStart.Value, pBkFinish.Value, pBkCode.Value, _
    '                    pRateCodeID.Value, pTitle.Value, pStateID.Value)
    '            Else
    '                tb = ta.GetData( _
    '                    pHotelID.Value, pTourOpID.Value, pMarketID.Value, pPayCondID.Value, pRType.Value, _
    '                    pStart.Value, pFinish.Value, pBkStart.Value, pBkFinish.Value, pBkCode.Value, _
    '                    pRateCodeID.Value, pTitle.Value, pStateID.Value)
    '            End If
    '        Catch ex As Exception
    '            errText = "<b>Retreaving report data lasts too long or consumes too much resources</b><br />Please try with more specific filter criteria"
    '            Throw New ApplicationException(errText)
    '        End Try
    '    End If

    '    Return tb
    'End Function

    Protected Function CheckParams() As Boolean
        Dim errText As String = String.Empty
        Dim paramLog As String = String.Empty

        'Dim pHotelID As New ReportFilterClass(ddlHotel.SelectedValue, ReportFilterClass.ValueType.valInteger)
        Dim pHotelID As New ReportFilterClass(ddlHotel.SelectedHotelValue, ReportFilterClass.ValueType.valInteger)
        Dim pTourOpID As New ReportFilterClass(ddlTO.SelectedValue, ReportFilterClass.ValueType.valInteger)
        Dim pMarketID As New ReportFilterClass(ddlMarkets.SelectedValue, ReportFilterClass.ValueType.valString)
        Dim pPayCondID As New ReportFilterClass(ddlPayCond.SelectedValue, ReportFilterClass.ValueType.valString)
        Dim pRType As New ReportFilterClass(ddlRType.SelectedValue, ReportFilterClass.ValueType.valInteger)
        Dim pStart As New ReportFilterClass(fltStart.Text, ReportFilterClass.ValueType.valDate)
        Dim pFinish As New ReportFilterClass(fltFinish.Text, ReportFilterClass.ValueType.valDate)
        Dim pBkStart As New ReportFilterClass(fltBkStart.Text, ReportFilterClass.ValueType.valDate)
        Dim pBkFinish As New ReportFilterClass(fltBkEnd.Text, ReportFilterClass.ValueType.valDate)
        Dim pBkCode As New ReportFilterClass(fltBkCode.Text, ReportFilterClass.ValueType.valString)
        Dim pRateCodeID As New ReportFilterClass(fltRateCode.Text, ReportFilterClass.ValueType.valString)
        Dim pTitle As New ReportFilterClass(fltName.Text, ReportFilterClass.ValueType.valString)
        Dim pStateID As New ReportFilterClass(ddlState.SelectedValue, ReportFilterClass.ValueType.valInteger)

        paramLog = "HotelID: " & pHotelID.ValueStr & "; " & _
                   "TourOpID: " & pTourOpID.ValueStr & "; " & _
                   "MarketID: " & pMarketID.ValueStr & "; " & _
                   "PayCondID: " & pPayCondID.ValueStr & "; " & _
                   "RType: " & pRType.ValueStr & "; " & _
                   "Start: " & pStart.ValueStr & "; " & _
                   "Finish: " & pFinish.ValueStr & "; " & _
                   "BkStart: " & pBkStart.ValueStr & "; " & _
                   "BkFinish: " & pBkFinish.ValueStr & "; " & _
                   "RateCodeID: " & pRateCodeID.ValueStr & "; " & _
                   "Title: " & pTitle.ValueStr & "; " & _
                   "BkCode: " & pBkCode.ValueStr & "; " & _
                   "StateID: " & pStateID.ValueStr

        If Not pRateCodeID.LastDigits(4) And pTitle.Len < 6 And pBkCode.Len < 3 Then
            If pHotelID.HasValue And pTourOpID.HasValue Then
                If Not pRateCodeID.LastDigits(1) And pTitle.Len < 4 And pBkCode.Len < 2 And pStart.Duration(pFinish, DateInterval.Month) > 3 Then
                    errText = "Try set longer criteria for Rate Code, Title or Bk.Code or shorter travel period."
                End If
            ElseIf pHotelID.HasValue And (pMarketID.HasValue Or pPayCondID.HasValue) Then
                If Not pRateCodeID.LastDigits(1) And pTitle.Len < 4 And pBkCode.Len < 2 And pStart.Duration(pFinish, DateInterval.Month) > 1 Then
                    errText = "Try set specific Tour Operator, longer criteria for Rate Code, Title or Bk.Code or shorter travel period."
                End If
            ElseIf pHotelID.HasValue Then
                If Not pRateCodeID.LastDigits(2) And pTitle.Len < 5 And pBkCode.Len < 3 And pStart.Duration(pFinish, DateInterval.Day) > 7 Then
                    errText = "Try set specific Tour Operator, Market or Pay Condition, longer criteria for Rate Code, Title or Bk.Code or shorter travel period."
                End If
            ElseIf (pTourOpID.HasValue Or pMarketID.HasValue Or pPayCondID.HasValue) Then
                If Not pRateCodeID.LastDigits(3) And pTitle.Len < 5 And pBkCode.Len < 3 Then
                    errText = "Try set specific Hotel or longer criteria for Rate Code, Title or Bk.Code."
                End If
            ElseIf pRateCodeID.LastDigits(2) Then
                If pTitle.Len < 4 And pBkCode.Len < 2 Then
                    errText = "Try set specific Hotel or Tour Operator or longer criteria for Rate Code, Title or Bk.Code."
                End If
            ElseIf pTitle.Len < 5 Or pBkCode.Len < 2 Then
                errText = "Try set specific Hotel or Tour Operator or longer criteria for Rate Code, Title or Bk.Code."
            End If
        End If

        Dim r As Boolean = String.IsNullOrEmpty(errText)
        If Not r Then
            errText = "<p style='font-weight: bold; border-bottom: solid 1px;'>" & _
                      "Report could last too long or consume too much resources.<br/>" & _
                      "This could decrease performance of the entire system <br/>and affect all users.</p>" & _
                      "<p style='padding-left: 50px; padding-right: 50px;' >" & errText & "</p>"
            Session.Add("paramLog", paramLog)
            Me.ParamWarning(errText)
        End If

        Return r
    End Function

    Protected Sub popShow(ByVal Title As String, ByRef ex As Exception, Optional ByVal Message As String = "-")
        If ex IsNot Nothing Then
            Try
                If ex.InnerException IsNot Nothing Then
                    popMessage.Text = ex.InnerException.Message
                Else
                    popMessage.Text = ex.Message
                End If
            Catch e As Exception
                popMessage.Text = ex.ToString
            End Try
        Else
            popMessage.Text = Message
        End If
        popLabel.Text = Title
        popExtender.Show()
    End Sub

    Protected Sub ParamWarning(ByVal msg As String)
        lblWarning.Text = msg & "<p style='font-weight: bold;'>Are you sure you want to proceed with report anyway?</p>"
        popWarning.Show()
    End Sub

    Protected Sub LogReport(ByVal logState As String, ByVal logText As String)
        Dim l As New LogApp
        l.LogUserAction(My.User.Name, LogApp.objRpt, "Daily Journal", logState, logText)
    End Sub

End Class
