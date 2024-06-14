Imports App_UserControls_MessagePop

Partial Class Reports_Accounting_AccAgedBalance
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not (Page.IsPostBack) Then
            If ModificationRights.RightsHotel Then
                cbHotel.Checked = True
                cbHotel.Visible = False
                cbCCI.Checked = True
                cbCCI.Visible = False
                ctrlHotel.NoCCI = True
            ElseIf ModificationRights.RightsOperatorReport Then
                cbHotel.Checked = False
                cbHotel.Visible = False
            Else
                cbHotel.Visible = True
            End If
        End If
    End Sub

    Protected Sub ddlAccType_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlAccType.DataBound
        AccTypeClearControl()
    End Sub

    Protected Sub dsAgedBalance_ObjectCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceEventArgs) Handles dsAgedBalance.ObjectCreated
        Dim ta As AgingBalanceTableAdapters.GetAccAgingBalanceReportTableAdapter = e.ObjectInstance
        ta.SetTimeout(ReportFilterClass.ReportTimeout("Reports_Accounting_AccRepStatement"))
    End Sub

    Protected Sub dsAgedBalance_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles dsAgedBalance.Selecting
        e.InputParameters("AccType") = AccTypeReadControl()
    End Sub

    Protected Sub btClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btClear.Click
        ctrlHotel.ClearControl()
        ctrlTourOp.ClearControl()
        AccTypeClearControl()
        ddlInvType.SelectedIndex = 0
        fltDate.ClearControl()
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

        paramLog = "Hotel group: " & pHotelGroup.ValueStr & _
                   "Hotel: " & pHotel.ValueStr & "; " & _
                   "TourOp group: " & pTourOpGroup.ValueStr & "; " & _
                   "Market: " & pMarket.ValueStr & "; " & _
                   "PayCond: " & pPayCond.ValueStr & "; " & _
                   "TourOp: " & pTourOp.ValueStr & "; " & _
                   "As of Date: " & IIf(fltDate.DateValue.HasValue, fltDate.DateValue.Value.ToShortDateString, "NULL") & "; " & _
                   "AccType: " & AccTypeReadControl()

        Dim r As Boolean = True
        If String.IsNullOrEmpty(AccTypeReadControl()) Then
            'No AccTypes selected
            errText = "<strong>All Account Types are excluded.</strong><br />" & _
                      "Please select at least one."
            msgPop.ShowError(New Exception(errText))
            Return False
        ElseIf h >= 8 Or t >= 8 Then
            'Hotel or TourOp
            r = True
        ElseIf h >= 4 And t >= 1 Then
            'HotelGroup and any of TourOp filters
            r = True
        ElseIf h >= 4 And t = 0 Then
            'HotelGroup and none of TourOp filters
            r = False
            errText = "Try setting Tour Operator."
        ElseIf h = 0 And t >= 1 Then
            'None of Hotel filters and any of TourOp filters
            r = False
            errText = "Try setting Hotel or Tour Operator."
        Else
            'None of Hotel filters and none of TourOp filters
            r = False
            errText = "<strong>Filter criteria too wide.</strong><br />" & _
                      "Try setting Hotel or Tour Operator."
            'msgPop.ShowError(New Exception(errText))
            'Return False
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
        Dim fname As String = "Aged Balance"
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()

        Dim tStart = Now
        Me.LogReport(LogApp.stateStart, "Report rendering started")

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Reports\Accounting\AccAgedBalanceSeparate" & IIf(cbExcel.Checked, "_xls.rdlc", ".rdlc")

        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("AgingBalance_GetAccAgingBalanceReport", dsAgedBalance))
        'dsAgedBalance = 
        '   GetAccAgingBalanceReport
        '       FROM GetAccDebitAging
        '               FROM GetAccDebitAge
        '       FULL OUTER JOIN GetAccCreditBalance

        Dim puser As New ReportParameter("user", My.User.Name)
        Dim photel As New ReportParameter("hotel", Me.cbHotel.Checked)
        Dim psort As New ReportParameter("hsort", cbSortL.SelectedValue)
        Dim pasdate As New ReportParameter("asoffdate", fltDate.DateValue)
        Dim pfl As New ReportParameter("FL", cbFL.Checked)
        Dim par As New ReportParameter("AR", cbAR.Checked)
        Dim pcc As New ReportParameter("CC", cbCC.Checked)
        Dim pmc As New ReportParameter("MC", cbMC.Checked)
        Dim pic As New ReportParameter("IC", cbIC.Checked)
        Dim pacc As New ReportParameter("AccTypes", AccTypeReadControl())
        Dim pfilter As New ReportParameter("filterstring", FilterParam())

        Dim p As ReportParameter() = {puser, photel, pasdate, psort, pfl, par, pcc, pmc, pic, pfilter, pacc}
        lr.SetParameters(p)
        FilterString()

        Try
            Response.ClearContent()
            Response.ClearHeaders()

            If cbExcel.Checked Then
                bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
                Response.ContentType = "application/excel"
                Response.AppendHeader("Content-Disposition", "attachment; filename=""" + fname + ".xls" + """")
            Else
                bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
                Response.ContentType = "application/pdf"
                Response.AppendHeader("Content-Disposition", "attachment; filename=""" + fname + ".pdf" + """")
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


    'Helpers
    Private Sub AccTypeClearControl()
        For Each i As ListItem In ddlAccType.Items
            i.Selected = i.Text.StartsWith("AR")
        Next
    End Sub

    Private Function AccTypeReadControl() As String
        Dim atc As New List(Of String)
        For Each i As ListItem In ddlAccType.Items
            If i.Selected Then atc.Add(i.Value)
        Next

        Dim ats As String = String.Empty
        If atc.Count > 0 Then
            ats = Join(atc.ToArray, ", ")
        End If

        Return ats
    End Function

    Protected Sub LogReport(ByVal logState As String, ByVal logText As String)
        Dim l As New LogApp
        l.LogUserAction(My.User.Name, LogApp.objRpt, "Aged Balance", logState, logText)
    End Sub

    Protected Function FilterParam() As String
        Dim pfc As New List(Of String)

        If ctrlHotel.SelectedHotelGroup <> String.Empty Then pfc.Add("for hotel group: " & ctrlHotel.SelectedHotelGroupItem.Text)
        If ctrlTourOp.SelectedTourOpKind <> String.Empty Then pfc.Add("for " & ctrlTourOp.SelectedTourOpKindItem.Text & " tour operators")
        If ctrlTourOp.SelectedTourOpGroup <> String.Empty Then pfc.Add("for tour operator group: " & ctrlTourOp.SelectedTourOpGroupItem.Text)
        If ctrlTourOp.SelectedMarket <> String.Empty Then pfc.Add("for market: " & ctrlTourOp.SelectedMarketItem.Text)
        If ctrlTourOp.SelectedPayCond <> String.Empty Then pfc.Add("for pay condition: " & ctrlTourOp.SelectedPayCondItem.Text)
        If ctrlTourOp.SelectedTourOp <> String.Empty Then pfc.Add("for tour operator: " & ctrlTourOp.SelectedTourOpItem.Text)
        pfc.Add(vbNewLine & "for account types: " & AccTypeReadControl())
        Dim a As String = ReportAccTypes()
        If Not String.IsNullOrEmpty(a) Then pfc.Add("with credits in " & a)

        Dim pfs As String = String.Empty
        If pfc.Count > 0 Then
            pfs = Join(pfc.ToArray, " AND ")
            pfs = pfs.Substring(0, 1).ToUpper & pfs.Substring(1)
        End If

        Return pfs
    End Function

    Protected Sub FilterString()
        Dim fs As New List(Of String)

        If cbCCI.Checked Then fs.Add("HotelId NOT IN (49, 61, 63, 64, 65, 70)")
        If ctrlTourOp.SelectedTourOpKind = "1" Then fs.Add("TourOp NOT LIKE '%GROUPS%'")
        If ctrlTourOp.SelectedTourOpKind = "2" Then fs.Add("TourOp LIKE '%GROUPS%'")

        Dim f As String = String.Empty
        If fs.Count > 0 Then f = Join(fs.ToArray, " AND ")
        dsAgedBalance.FilterExpression = f
    End Sub

    Protected Function ReportAccTypes() As String
        Dim r As String = String.Empty
        Dim s As New List(Of String)
        If cbAR.Checked Then s.Add("AR")
        If cbFL.Checked Then s.Add("FL")
        If cbCC.Checked Then s.Add("CC")
        If cbMC.Checked Then s.Add("MC")
        If cbIC.Checked Then s.Add("IC")
        If s.Count > 0 Then r = Join(s.ToArray(), ", ")
        Return r
    End Function

End Class
