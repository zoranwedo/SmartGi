Imports App_UserControls_MessagePop

Partial Class Reports_Invoices_InvoiceJournalDetailComp
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
        End If
    End Sub

    Protected Sub dsFilteredInvoicesDet_ObjectCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceEventArgs) 'Handles dsFilteredInvoicesDet.ObjectCreated
        Dim ta As dsInvoiceJournalRateTableAdapters.InvoiceJournal_Detail_GRPTableAdapter
        ta = e.ObjectInstance
        ta.SetTimeout(ReportFilterClass.ReportTimeout("Reports_Invoices_InvoiceJournal_TO"))
    End Sub

    Protected Sub btClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btClear.Click
        ctrlHotel.ClearControl()
        ctrlTourOp.ClearControl()
        ddlInvType.SelectedIndex = 0
        ctrlCheckIn.ClearControl()
        ctrlInvNum.ClearControl()
        ctrlInvDate.ClearControl()
        ddlState.SelectedIndex = 0
        'ddlInv.SelectedIndex = 0
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
        Dim pStart As New ReportFilterClass(ctrlCheckIn.DateFrom, ReportFilterClass.ValueType.valDate)
        Dim pFinish As New ReportFilterClass(ctrlCheckIn.DateTo, ReportFilterClass.ValueType.valDate)
        Dim pNumFrom As New ReportFilterClass(ctrlInvNum.IntegerFrom, ReportFilterClass.ValueType.valInteger)
        Dim pNumTo As New ReportFilterClass(ctrlInvNum.IntegerTo, ReportFilterClass.ValueType.valInteger)
        Dim pDateFrom As New ReportFilterClass(ctrlInvDate.DateFrom, ReportFilterClass.ValueType.valDate)
        Dim pDateTo As New ReportFilterClass(ctrlInvDate.DateTo, ReportFilterClass.ValueType.valDate)

        paramLog = "Hotel: " & pHotel.ValueStr & "; " & _
                   "HotelGroup: " & pHotelGroup.ValueStr & "; " & _
                   "TourOp: " & pTourOp.ValueStr & "; " & _
                   "TourOpGroup: " & pTourOpGroup.ValueStr & "; " & _
                   "Market: " & pMarket.ValueStr & "; " & _
                   "PayCond: " & pPayCond.ValueStr & "; " & _
                   "Start: " & pStart.ValueStr & "; " & _
                   "Finish: " & pFinish.ValueStr & "; " & _
                   "NumFrom: " & pNumFrom.ValueStr & "; " & _
                   "NumTo: " & pNumTo.ValueStr & "; " & _
                   "DateFrom: " & pDateFrom.ValueStr & "; " & _
                   "DateTo: " & pDateTo.ValueStr

        If Not (pHotel.HasValue And pTourOp.HasValue) Or pStart.Duration(pFinish, DateInterval.Month) > 3 Or pNumFrom.Range(pNumTo) > 1000 Or pDateFrom.Duration(pDateTo, DateInterval.Month) > 3 Then
            If (pHotelGroup.HasValue And pTourOp.HasValue) Or (pHotel.HasValue And pTourOpGroup.HasValue) Then
                If pStart.Duration(pFinish, DateInterval.Year) > 2 And pNumFrom.Range(pNumTo) > 10000 And pDateFrom.Duration(pDateTo, DateInterval.Year) > 2 Then
                    errText = "Try set shorter periods or number range."
                End If
            ElseIf pHotel.HasValue Or pTourOp.HasValue Then
                If pStart.Duration(pFinish, DateInterval.Year) > 1 And pNumFrom.Range(pNumTo) > 5000 And pDateFrom.Duration(pDateTo, DateInterval.Year) > 1 Then
                    errText = "Try set shorter periods or number range."
                End If
            ElseIf pHotelGroup.HasValue Or pTourOpGroup.HasValue Then
                If pStart.Duration(pFinish, DateInterval.Month) > 6 And pNumFrom.Range(pNumTo) > 3000 And pDateFrom.Duration(pDateTo, DateInterval.Month) > 6 Then
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
        CompareReport()
    End Sub

    Protected Sub CompareReport()
        'Those filters are ignored for Compare Report
        'ddlState.SelectedIndex = 0

        Dim tStart = Now
        Me.LogReport(LogApp.stateStart, "Compare Report rendering started")

        'Report
        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Reports\Invoices\InvoiceJournalDetailComp2.rdlc"
        lr.DataSources.Clear()
        lr.DataSources.Add(New ReportDataSource("dsConcept_Invoice_DetailCompare", dsFilteredInvoicesCompConcept))

        'Report parameters
        Dim photel As New ReportParameter("hotel", cbHotel.Checked)
        Dim puser As New ReportParameter("user", My.User.Name)
        Dim pfilter As New ReportParameter("filter", FilterParam())
        Dim p As ReportParameter() = {puser, photel, pfilter}
        lr.SetParameters(p)

        'FilterString()

        Try
            'Rendering
            Dim bytes As Byte()
            Dim mimeType As String = Nothing
            Dim encoding As String = Nothing
            Dim extension As String = Nothing
            Dim streamids As String() = Nothing
            Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
            Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"

            Response.ClearContent()
            Response.ClearHeaders()

            'If cbExcel.Checked Or Not cbHotel.Checked Then
            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "InvoiceJournalCompare.xls" + """")
            'Else
            '    bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            '    Response.ContentType = "application/pdf"
            '    Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "InvoiceJournalCompare.pdf" + """")
            'End If

            Response.BinaryWrite(bytes)
            Response.Flush()
            'Response.Close()
            Response.End()
            Me.LogReport(LogApp.stateComplete, String.Format("Compare Report rendering finished in {0} sec.", DateDiff(DateInterval.Second, tStart, Now)))
        Catch ex As Exception
            Me.LogReport(LogApp.stateError, String.Format("Compare Report rendering error: {0}", ex.Message))
            msgPop.ShowError(ex)
        End Try
    End Sub


    'Helper
    Protected Sub LogReport(ByVal logState As String, ByVal logText As String)
        Dim l As New LogApp
        l.LogUserAction(My.User.Name, LogApp.objRpt, "Invoice Journal", logState, logText)
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

    'Protected Sub FilterString()
    '    Dim fs As New List(Of String)

    '    If ctrlTourOp.SelectedTourOpKind = "1" Then fs.Add("TourOp NOT LIKE '%GROUPS%'")
    '    If ctrlTourOp.SelectedTourOpKind = "2" Then fs.Add("TourOp LIKE '%GROUPS%'")
    '    'If Not cbCancel.Checked Then fs.Add("State<>-3 AND State<>-7")

    '    Dim f As String = String.Empty
    '    If fs.Count > 0 Then f = Join(fs.ToArray, " AND ")

    '    dsFilteredInvoices.FilterExpression = f
    '    dsFilteredInvoicesComp.FilterExpression = f
    '    dsFilteredInvoicesDet.FilterExpression = f
    '    dsInvoiceReport.FilterExpression = f
    'End Sub
End Class
