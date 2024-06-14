Imports App_UserControls_MessagePop

Partial Class Reports_Accounting_AccRepDocTransfer
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

    Protected Sub btClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btClear.Click
        ctrlHotel.ClearControl()
        ctrlTourOp.ClearControl()
        fltDate.ClearControl()
        fltDocFrom.ClearControl()
        ddlFromAccType.SelectedIndex = 0
        ddlToAccType.SelectedIndex = 0
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
        Dim h As Integer = ctrlHotel.SelectionLevel
        Dim t As Integer = ctrlTourOp.SelectionLevel

        Dim pHotelGroup As New ReportFilterClass(ctrlHotel.SelectedHotelGroup, ReportFilterClass.ValueType.valInteger)
        Dim pHotel As New ReportFilterClass(ctrlHotel.SelectedHotel, ReportFilterClass.ValueType.valInteger)
        Dim pTourOpGroup As New ReportFilterClass(ctrlTourOp.SelectedTourOpGroup, ReportFilterClass.ValueType.valInteger)
        Dim pMarket As New ReportFilterClass(ctrlTourOp.SelectedMarket, ReportFilterClass.ValueType.valString)
        Dim pPayCond As New ReportFilterClass(ctrlTourOp.SelectedMarket, ReportFilterClass.ValueType.valString)
        Dim pTourOp As New ReportFilterClass(ctrlTourOp.SelectedTourOp, ReportFilterClass.ValueType.valInteger)
        Dim pDocFrom As New ReportFilterClass(fltDocFrom.TextValue, ReportFilterClass.ValueType.valDate)
        Dim pAccFrom As New ReportFilterClass(ddlFromAccType.SelectedValue, ReportFilterClass.ValueType.valString)
        Dim pAccTo As New ReportFilterClass(ddlToAccType.SelectedValue, ReportFilterClass.ValueType.valString)

        paramLog = "Hotel group: " & pHotelGroup.ValueStr & _
                   "Hotel: " & pHotel.ValueStr & "; " & _
                   "TourOp group: " & pTourOpGroup.ValueStr & "; " & _
                   "Market: " & pMarket.ValueStr & "; " & _
                   "PayCond: " & pPayCond.ValueStr & "; " & _
                   "TourOp: " & pTourOp.ValueStr & "; " & _
                   "As of Date: " & IIf(fltDate.DateValue.HasValue, fltDate.DateValue.Value.ToShortDateString, "NULL") & "; " & _
                   "DocFrom: " & pDocFrom.ValueStr & "; " & _
                   "From AccType: " & pAccFrom.ValueStr & "; " & _
                   "To AccType: " & pAccTo.ValueStr

        Dim r As Boolean = True
        If h >= 8 Or t >= 8 Then
            'Hotel or TourOp
            r = True
        ElseIf h >= 4 And t >= 1 Then
            'HotelGroup and any of TourOp filters
            r = True
        ElseIf h >= 4 And t = 0 Then
            'HotelGroup and none of TourOp filters
            r = pAccFrom.HasValue Or pAccTo.HasValue
            errText = "Try setting Tour Operator or From/To Account Type."
        ElseIf h = 0 And t >= 1 Then
            'None of Hotel filters and any of TourOp filters
            r = pAccFrom.HasValue Or pAccTo.HasValue
            errText = "Try setting Hotel or Tour Operator or From/To Account Type."
        Else
            'None of Hotel filters and none of TourOp filters
            If pDocFrom.HasValue Then
                r = False
                errText = "Try setting Hotel or Tour Operator."
            ElseIf pAccFrom.HasValue Or pAccTo.HasValue Then
                r = False
                errText = "Try setting Hotel or Tour Operator."
            Else
                errText = "<strong>Filter criteria too wide.</strong><br />" & _
                          "Try setting Hotel or Tour Operator."
                msgPop.ShowError(New Exception(errText))
                Return False
            End If
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
        lr.ReportPath = "Reports\Accounting\RptTransDetail.rdlc"

        lr.DataSources.Clear()
        lr.DataSources.Add(New ReportDataSource("ReportAccounting_AccRepTransferDetail", dsAccRepTransferDetail))

        Dim puser As New ReportParameter("user", My.User.Name)
        Dim photel As New ReportParameter("hotel", Me.cbHotel.Checked)
        Dim pasdate As New ReportParameter("asoffdate", fltDate.DateValue)
        Dim details As New ReportParameter("details", cbDetail.Checked)
        Dim pHotelName As New ReportParameter("pHotelName", ctrlHotel.SelectedHotelItem.Text)
        Dim pfilter As New ReportParameter("filterstring", FilterParam())

        Dim p As ReportParameter() = {puser, photel, pasdate, details, pfilter, pHotelName}
        lr.SetParameters(p)

        Try
            Response.ClearContent()
            Response.ClearHeaders()

            If cbExcel.Checked Then
                bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
                Response.ContentType = "application/excel"
                Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Documents Transfer.xls" + """")
            Else
                bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
                Response.ContentType = "application/pdf"
                Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Documents Transfer.pdf" + """")
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


    'Helper
    Protected Sub LogReport(ByVal logState As String, ByVal logText As String)
        Dim l As New LogApp
        l.LogUserAction(My.User.Name, LogApp.objRpt, "Documents Transfer", logState, logText)
    End Sub

    Protected Function FilterParam() As String
        Dim pfc As New List(Of String)

        If ctrlHotel.SelectedHotelGroup <> String.Empty Then pfc.Add("for hotel group: " & ctrlHotel.SelectedHotelGroupItem.Text)
        If ctrlTourOp.SelectedTourOpGroup <> String.Empty Then pfc.Add("for tour operator group: " & ctrlTourOp.SelectedTourOpGroupItem.Text)
        If ctrlTourOp.SelectedMarket <> String.Empty Then pfc.Add("for market: " & ctrlTourOp.SelectedMarketItem.Text)
        If ctrlTourOp.SelectedPayCond <> String.Empty Then pfc.Add("for pay condition: " & ctrlTourOp.SelectedPayCondItem.Text)
        If ctrlTourOp.SelectedTourOp <> String.Empty Then pfc.Add("for tour operator: " & ctrlTourOp.SelectedTourOpItem.Text)
        If fltDocFrom.HasValue Then pfc.Add("from date: " & fltDocFrom.TextValue)
        If ddlFromAccType.SelectedValue <> String.Empty Then pfc.Add("from account type: " & ddlFromAccType.SelectedItem.Text)
        If ddlToAccType.SelectedValue <> String.Empty Then pfc.Add("to account type: " & ddlToAccType.SelectedItem.Text)

        Dim pfs As String = String.Empty
        If pfc.Count > 0 Then
            pfs = Join(pfc.ToArray, " AND ")
            pfs = pfs.Substring(0, 1).ToUpper & pfs.Substring(1)
        End If

        Return pfs
    End Function
End Class
