
Partial Class Reports_Contracts_RptContractRate
    Inherits System.Web.UI.Page

    Private bHotel As Boolean
    Private dsSupp As Data.DataView
    Private dsRate As Data.DataView

    Public Sub RptContractRateSubreportProc(ByVal sender As Object, ByVal e As SubreportProcessingEventArgs)
        'If e.ReportPath.Contains("aRatesSupp") Then
        'If ModificationRights.RightsHotel Or cbHotel.Checked Then
        If bHotel Then
            'dsFilteredSupplementsH.Select()
            e.DataSources.Add(New ReportDataSource("CntReports_FilterSupplementRate1", dsFilteredSupplementsH))
        Else
            'dsFilteredSupplements.DataBind()
            'Dim ie As Data.DataView = dsFilteredSupplements.Select()
            'e.DataSources.Add(New ReportDataSource("CntReports_FilterSupplementRate1", dsFilteredSupplements))
            e.DataSources.Add(New ReportDataSource("CntReports_FilterSupplementRate1", dsSupp))
        End If
        'End If
    End Sub

    Protected Sub lbCntRates_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbCntRates.Click
        If Me.CheckParams() Then RenderReport()
    End Sub

    Protected Sub btnWarningYes_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnWarningYes.Click
        Dim paramLog As String = Session("paramLog")
        Me.LogReport(LogApp.stateWarning, paramLog)
        Me.RenderReport()
    End Sub

    Protected Sub RenderReport()
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>False</SimplePageHeaders></DeviceInfo>"
        Dim render As String
        Dim content As String
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        bHotel = ModificationRights.RightsHotel Or cbHotel.Checked
        bHotel = cbHotel.Checked Or My.User.IsInRole("hotel") Or My.User.IsInRole("hotel_report")

        Dim tStart = Now
        Me.LogReport(LogApp.stateStart, "Report rendering started")

        Dim bytes As Byte()
        Dim lr As New Microsoft.Reporting.WebForms.LocalReport

        If cbExcel.Checked Then
            render = "Excel"
            content = "application/excel"
            lr.ReportPath = "Reports\Contracts\RptContractRateV03_xls.rdlc"
        Else
            render = "PDF"
            content = "application/pdf"
            lr.ReportPath = "Reports\Contracts\RptContractRateV03.rdlc"
        End If

        If cbSupp.Checked Then
            dsSupp = dsFilteredSupplements.Select()
            AddHandler lr.SubreportProcessing, AddressOf RptContractRateSubreportProc
        End If

        Dim psupp As New ReportParameter("supp", cbSupp.Checked)
        Dim photel As New ReportParameter("hotel", bHotel)
        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)

        Dim fs As String = PFilterString()
        Dim fs1 As String = ""

        If Not (ddlHotel.SelectedValue = "") Then fs1 = "For " & ddlHotel.SelectedItem.Text.Trim & " hotel"
        If Not (ddlTO.SelectedValue = "") Then fs1 &= IIf(fs1 = "For ", "", " AND ") & ddlTO.SelectedItem.Text.Trim & " tour operator"

        Dim pfilter As New ReportParameter("filterstringDet", fs)
        Dim pfilterDet As New ReportParameter("filterstring", fs1)
        Dim pallhotel As New ReportParameter("pallhotel", ddlHotel.SelectedValue = "")
        Dim pallto As New ReportParameter("pallto", ddlTO.SelectedValue = "")

        Dim p As ReportParameter() = {psupp, photel, pfilter, pallhotel, pallto, pfilterDet, puser}
        lr.SetParameters(p)

        FilterString()
        Try
            If bHotel Then
                dsRate = dsCntHRates.Select()
            Else
                dsRate = dsCntRates.Select()
            End If
            lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("CntReports_FilterContractRate1", dsRate))

            bytes = lr.Render(render, deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ClearContent()
            Response.ClearHeaders()
            Response.ContentType = content
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" & GetReportName() & "." & extension & """")

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

    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        ddlHotel.SelectedValue = ""
        ddlMarkets.SelectedValue = ""
        ddlMealPlan.SelectedValue = ""
        ddlRateOption.SelectedValue = ""
        ddlRateTypeId.SelectedValue = ""
        ddlTO.SelectedValue = ""
        ddlRateType.SelectedValue = ""
        ddlRoomType.SelectedValue = ""
        ddlState.SelectedValue = ""
        'ddlContract.SelectedValue = ""
        fltName.Text = ""
        fltStart.Text = Nothing
        fltFinish.Text = Nothing
        fltBkStart.Text = Nothing
        fltBkEnd.Text = Nothing
        fltCreated.Text = Nothing
        fltRateReceived.Text = Nothing
        txtDescription.Text = Nothing

    End Sub

    Protected Sub ddlRateTypeId_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlRateTypeId.DataBinding
        ddlRateTypeId.ClearSelection()
    End Sub

    Protected Sub FilterString()
        Dim strFilter As String = String.Empty
        Dim strF1 As String = String.Empty
        Dim strF2 As String = String.Empty
        Dim strDesc As String = String.Empty


        If Not cblReceived.Items(0).Selected Then
            If cblReceived.Items(1).Selected Then strF1 = "Created > RateRecieved"
            If cblReceived.Items(2).Selected Then strF2 = "RateRecieved > Start "

            If Not strF1 = String.Empty Then strFilter = strF1
            If Not strF2 = String.Empty Then strFilter &= IIf(strFilter = String.Empty, "", " AND ") & strF2
        End If

        If Not txtDescription.Text = String.Empty Then
            strFilter &= IIf(strFilter = String.Empty, "", " AND ") & "Desctiption LIKE " + "'%" + txtDescription.Text + "%'"
        End If

        If Not String.IsNullOrEmpty(strFilter) Then dsCntRates.FilterExpression = strFilter
        If Not String.IsNullOrEmpty(strFilter) Then dsCntHRates.FilterExpression = strFilter
    End Sub

    Protected Sub cblReceived_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cblReceived.SelectedIndexChanged
        If cblReceived.Items(1).Selected Or cblReceived.Items(2).Selected Then
            cblReceived.Items(0).Selected = False
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not (Page.IsPostBack) Then
            If ModificationRights.RightsHotel Then
                cbHotel.Checked = True
                cbHotel.Visible = False
                dsCntState.FilterExpression = "ContractStateID = 4"
                ddlState.SelectedValue = 4
                ddlState.Enabled = False
                'btSwitchReport.Visible = False
            End If
        End If

        CType(Master.FindControl("tkScriptManager"), ScriptManager).RegisterPostBackControl(lbCntRates)
    End Sub

    Protected Function PFilterString_old() As String
        Dim strFilter As String = ""

        'If Not (ddlHotel.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For hotel ", "/For hotel ") & ddlHotel.SelectedItem.Text
        'If Not (ddlTO.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For tour operator ", "/For tour operator ") & ddlTO.SelectedItem.Text & Chr(10) & Chr(13)

        'If Not (ddlContract.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For ", " AND ") & ddlContract.SelectedValue & " contract "
        If Not (fltName.Text = "") Then strFilter &= IIf(strFilter = "", "For ", " AND ") & fltName.Text & " contract "
        If Not (ddlMarkets.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For ", " AND ") & ddlMarkets.SelectedValue & " market "
        If Not (ddlMealPlan.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For ", " AND ") & ddlMealPlan.SelectedValue & " meal plan "
        If Not (ddlRateOption.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For ", " AND ") & ddlRateOption.SelectedItem.Text & " rate option "
        If Not (ddlRateTypeId.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For ", " AND ") & ddlRateTypeId.SelectedItem.Text & " rate code "
        If Not (ddlRateType.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For ", " AND ") & ddlRateType.SelectedItem.Text & " rate type "
        If Not (ddlRoomType.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For ", " AND ") & ddlRoomType.SelectedItem.Text & " room type "
        If Not (ddlState.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For ", " AND ") & ddlState.SelectedItem.Text & " rate state "

        If Not (String.IsNullOrEmpty(fltStart.Text) And String.IsNullOrEmpty(fltFinish.Text)) Then
            strFilter &= IIf(strFilter = "", "For travel window ", " AND travel window ")
            If Not (fltStart.Text = Nothing) Then strFilter &= "from " & fltStart.Text
            If Not (fltFinish.Text = Nothing) Then strFilter &= " to " & fltFinish.Text
        End If

        If Not (String.IsNullOrEmpty(fltBkStart.Text) And String.IsNullOrEmpty(fltBkEnd.Text)) Then
            strFilter &= IIf(strFilter = "", "For booking ", " AND booking ")
            If Not (fltBkStart.Text = Nothing) Then strFilter &= " from " & fltBkStart.Text
            If Not (fltBkEnd.Text = Nothing) Then strFilter &= " to " & fltBkEnd.Text
        End If

        If Not (fltCreated.Text = Nothing) Then strFilter &= IIf(strFilter = "", "Created on ", " AND created on ") & fltCreated.Text
        If Not (fltRateReceived.Text = Nothing) Then strFilter &= IIf(strFilter = "", "Rate received on ", " AND rate received on") & fltRateReceived.Text
        If Not (txtDescription.Text = Nothing) Then strFilter &= IIf(strFilter = "", "With description ", "AND with description ") & txtDescription.Text

        Return strFilter
    End Function

    Protected Function PFilterString() As String
        Dim strFilter As New List(Of String)
        Dim strTravel As String = ReportFilterClass.ReportPeriod(fltStart.Text, fltFinish.Text)
        Dim strBooking As String = ReportFilterClass.ReportPeriod(fltBkStart.Text, fltBkEnd.Text)

        If Not String.IsNullOrEmpty(fltName.Text) Then strFilter.Add("Title: " & fltName.Text)
        If Not String.IsNullOrEmpty(txtDescription.Text) Then strFilter.Add("Description: " & txtDescription.Text)
        If Not String.IsNullOrEmpty(ddlMarkets.SelectedValue) Then strFilter.Add("Market: " & ddlMarkets.SelectedItem.Text)
        If Not String.IsNullOrEmpty(ddlHotel.SelectedValue) Then strFilter.Add("Hotel: " & ddlHotel.SelectedItem.Text)
        If Not String.IsNullOrEmpty(ddlTO.SelectedValue) Then strFilter.Add("Tour Operator: " & ddlTO.SelectedItem.Text)
        If Not String.IsNullOrEmpty(ddlMealPlan.SelectedValue) Then strFilter.Add("Meal Plan; " & ddlMealPlan.SelectedItem.Text)
        If Not String.IsNullOrEmpty(ddlRateTypeId.SelectedValue) Then strFilter.Add("Rate Type: " & ddlRateTypeId.SelectedItem.Text)
        If Not String.IsNullOrEmpty(ddlRateType.SelectedValue) Then strFilter.Add("Rate Type Sub Category: " & ddlRateType.SelectedItem.Text)
        If Not String.IsNullOrEmpty(ddlRateOption.SelectedValue) Then strFilter.Add("Rate Option: " & ddlRateOption.SelectedItem.Text)
        If Not String.IsNullOrEmpty(fltRateCode.Text) Then strFilter.Add("Rate Code: " & fltRateCode.Text)
        If Not String.IsNullOrEmpty(ddlRoomType.SelectedValue) Then strFilter.Add("Room Type: " & ddlRoomType.SelectedItem.Text)
        If Not String.IsNullOrEmpty(fltCreated.Text) Then strFilter.Add("Created on " & fltCreated.Text)
        If Not String.IsNullOrEmpty(strTravel) Then strFilter.Add("Travel Start-End: " & strTravel)
        If Not String.IsNullOrEmpty(strBooking) Then strFilter.Add("Booking Start-End: " & strBooking)
        If Not String.IsNullOrEmpty(ddlState.SelectedValue) Then strFilter.Add("State: " & ddlState.SelectedItem.Text)
        If cbSupp.Checked Then strFilter.Add("Print with supplements")

        Return String.Join(" and ", strFilter.ToArray)
    End Function

    Protected Sub Supp_Click(ByVal sender As Object, ByVal e As System.EventArgs) 'Handles lbCntRates.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim allhotel As Boolean = IIf(ddlHotel.SelectedValue = "", True, False)
        Dim allto As Boolean = IIf(ddlTO.SelectedValue = "", True, False)


        Dim bytes As Byte()
        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        Dim sublr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Reports\Contracts\aRatesSuppV01.rdlc"

        Dim cid As New ReportParameter("cid", 46539)
        Dim photel As New ReportParameter("hotel", False)
        Dim p As ReportParameter() = {cid, photel}
        lr.SetParameters(p)

        dsFilteredSupplements.Select()
        lr.DataSources.Add(New ReportDataSource("CntReports_FilterSupplementRate1", dsFilteredSupplements))

        If cbExcel.Checked Then
            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ClearContent()
            Response.ClearHeaders()
            Response.ContentType = "application/excel"
            'Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Rate List.xls" + """")
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" & GetReportName() & ".xls" + """")
        Else
            bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ClearContent()
            Response.ClearHeaders()
            Response.ContentType = "application/pdf"
            'Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Rate List.pdf" + """")
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" & GetReportName() & ".pdf" + """")
        End If

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Function GetReportName() As String
        Dim rptHotel As String = Trim(ddlHotel.SelectedItem.Text)
        Dim rptTTOO As String = Trim(ddlTO.SelectedItem.Text)
        Dim rptName As String = "RateReport " & rptHotel & " for " & rptTTOO
        rptName = rptName.Replace("\", "")
        rptName = rptName.Replace("/", "")
        rptName = rptName.Replace(":", "")
        rptName = rptName.Replace("*", "")
        rptName = rptName.Replace("?", "")
        rptName = rptName.Replace("""", "")
        rptName = rptName.Replace("<", "")
        rptName = rptName.Replace(">", "")
        rptName = rptName.Replace("|", "")

        Return rptName
    End Function

    Protected Sub dsCntRates_ObjectCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceEventArgs) Handles dsCntRates.ObjectCreated, dsCntHRates.ObjectCreated
        Dim ta As CntReportsTableAdapters.FilterContractRate1TableAdapter
        ta = e.ObjectInstance
        ta.SetTimeout(ReportFilterClass.ReportTimeout("Reports_Contracts_RptContractRate"))
    End Sub

    Protected Function CheckParams() As Boolean
        Dim errText As String = String.Empty
        Dim paramLog As String = String.Empty

        Dim pHotel As New ReportFilterClass(ddlHotel.SelectedValue, ReportFilterClass.ValueType.valInteger)
        Dim pTourOp As New ReportFilterClass(ddlTO.SelectedValue, ReportFilterClass.ValueType.valInteger)
        Dim pMarket As New ReportFilterClass(ddlMarkets.SelectedValue, ReportFilterClass.ValueType.valString)
        Dim pRateType As New ReportFilterClass(ddlRateType.SelectedValue, ReportFilterClass.ValueType.valInteger)
        Dim pRateSub As New ReportFilterClass(ddlRateTypeId.SelectedValue, ReportFilterClass.ValueType.valString)
        Dim pRateCode As New ReportFilterClass(fltRateCode.Text, ReportFilterClass.ValueType.valString)
        Dim pTitle As New ReportFilterClass(fltName.Text, ReportFilterClass.ValueType.valString)
        Dim pStart As New ReportFilterClass(fltStart.Text, ReportFilterClass.ValueType.valDate)
        Dim pFinish As New ReportFilterClass(fltFinish.Text, ReportFilterClass.ValueType.valString)
        Dim pCreated As New ReportFilterClass(fltCreated.Text, ReportFilterClass.ValueType.valDate)

        paramLog = "Hotel: " & pHotel.ValueStr & "; " & _
                   "TourOp: " & pTourOp.ValueStr & "; " & _
                   "Market: " & pMarket.ValueStr & "; " & _
                   "RateType: " & pRateType.ValueStr & "; " & _
                   "RateSub: " & pRateSub.ValueStr & "; " & _
                   "RateCode: " & pRateCode.ValueStr & "; " & _
                   "Title: " & pTitle.ValueStr & "; " & _
                   "Start: " & pStart.ValueStr & "; " & _
                   "Finish: " & pFinish.ValueStr & "; " & _
                   "Created: " & pCreated.ValueStr

        If Not pRateCode.LastDigits(4) And pTitle.Len < 6 Then
            If pHotel.HasValue And pTourOp.HasValue Then
                If (pRateType.NoValue Or pRateSub.NoValue Or pStart.Duration(pFinish, DateInterval.Month) > 6) And _
                    Not pRateCode.LastDigits(1) And pTitle.Len < 4 And pCreated.NoValue And _
                    pStart.Duration(pFinish, DateInterval.Month) > 3 Then
                    errText = "Try set Rate Type and Subtype, longer criteria for Rate Code or Title or shorter travel period."
                End If
            ElseIf pHotel.HasValue And pMarket.HasValue Then
                If (pRateType.NoValue Or pRateSub.NoValue Or pStart.Duration(pFinish, DateInterval.Month) > 3) And _
                    Not pRateCode.LastDigits(1) And pTitle.Len < 4 And pCreated.NoValue And _
                    pStart.Duration(pFinish, DateInterval.Month) > 1 Then
                    errText = "Try set specific Tour Operator or Rate Type and Subtype, longer criteria for Rate Code or Title or shorter travel period."
                End If
            ElseIf pHotel.HasValue Then
                If (pRateType.NoValue Or pRateSub.NoValue Or pStart.Duration(pFinish, DateInterval.Month) > 1) And _
                    Not pRateCode.LastDigits(2) And pTitle.Len < 5 And pCreated.NoValue And _
                    pStart.Duration(pFinish, DateInterval.Day) > 7 Then
                    errText = "Try set specific Tour Operator, Market or Rate Type and Subtype, longer criteria for Rate Code or Title or shorter travel period."
                End If
            ElseIf pTourOp.HasValue Or pMarket.HasValue Then
                If (pRateType.NoValue Or pRateSub.NoValue Or pStart.Duration(pFinish, DateInterval.Day) > 7) And _
                    Not pRateCode.LastDigits(3) And pTitle.Len < 5 And pCreated.NoValue Then
                    errText = "Try set specific Hotel or Rate Type and Subtype, longer criteria for Rate Code or Title or shorter travel period."
                End If
            ElseIf pRateCode.LastDigits(2) Then
                If pTitle.Len < 4 Or pCreated.NoValue Then
                    errText = "Try set specific Hotel or Tour Operator or longer criteria for Rate Code or Title."
                End If
            ElseIf pTitle.Len < 5 Or pCreated.NoValue Then
                errText = "Try set specific Hotel or Tour Operator or longer criteria for Rate Code or Title."
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
        l.LogUserAction(My.User.Name, LogApp.objRpt, "Old Rate Report", logState, logText)
    End Sub
End Class
