Imports App_UserControls_MessagePop

Partial Class Reports_Accounting_AccTransferHotel
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not (Page.IsPostBack) Then
            fltFromDate.DateValue = fltDate.DateValue.Value.AddMonths(-1)
        End If
    End Sub

    Protected Sub dsRecap_ObjectCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceEventArgs) Handles dsRecap.ObjectCreated
        Dim ta As dsAccTransferHotelTableAdapters.AccTransferHotelRecapTableAdapter = e.ObjectInstance
        ta.SetTimeout(ReportFilterClass.ReportTimeout("Reports_Accounting_AccTransferHotel"))
    End Sub

    Protected Sub dsDetail_ObjectCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceEventArgs) Handles dsDetail.ObjectCreated
        Dim ta As dsAccTransferHotelTableAdapters.AccTransferHotelDetailTableAdapter = e.ObjectInstance
        ta.SetTimeout(ReportFilterClass.ReportTimeout("Reports_Accounting_AccTransferHotel"))
    End Sub

    Protected Sub btClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btClear.Click
        ctrlHotelFrom.ClearControl()
        ctrlHotelTo.ClearControl()
        fltDate.ClearControl()
        fltFromDate.DateValue = fltDate.DateValue.Value.AddMonths(-1)
        ctrlTourOperator.ClearControl()
        ddlAccType.SelectedIndex = 0
        cbSeparate.Checked = False
    End Sub


    Protected Sub btReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btReport.Click
        msgPop.Action = "Report"
        If Me.CheckParams() Then RenderReport()
    End Sub


    Protected Sub btDetail_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btDetail.Click
        RenderDetail()
        'msgPop.Action = "Detail"
        'If Me.CheckParams() Then RenderDetail()
    End Sub

    Protected Sub msgPop_MessageYes(ByVal sender As Object, ByVal e As MessagePopArgs) Handles msgPop.MessageYes
        Dim paramLog As String = Session("paramLog")
        Me.LogReport(LogApp.stateWarning, paramLog)
        If msgPop.Action = "Report" Then
            Me.RenderReport()
        Else
            Me.RenderDetail()
        End If
    End Sub

    Protected Function CheckParams() As Boolean
        Dim errText As String = String.Empty
        Dim paramLog As String = String.Empty

        Dim pHotelFrom As New ReportFilterClass(ctrlHotelFrom.SelectedHotel, ReportFilterClass.ValueType.valInteger)
        Dim pHotelTo As New ReportFilterClass(ctrlHotelTo.SelectedHotel, ReportFilterClass.ValueType.valInteger)
        Dim pDateFrom As New ReportFilterClass(fltFromDate.DateValue, ReportFilterClass.ValueType.valDate)
        Dim pDateTo As New ReportFilterClass(fltDate.DateValue, ReportFilterClass.ValueType.valDate)
        Dim pTourOp As New ReportFilterClass(ctrlTourOperator.SelectedTourOp, ReportFilterClass.ValueType.valInteger)
        Dim pAccType As New ReportFilterClass(ddlAccType.SelectedValue, ReportFilterClass.ValueType.valString)

        paramLog = "Hotel from: " & pHotelFrom.ValueStr & _
                   "Hotel to: " & pHotelTo.ValueStr & "; " & _
                   "From: " & pDateFrom.ValueStr & "; " & _
                   "As of Date: " & pDateTo.ValueStr & "; " & _
                   "Tour Operator: " & pTourOp.ValueStr & "; " & _
                   "AccType: " & pAccType.ValueStr

        Dim r As Boolean = True
        If pHotelFrom.HasValue And pHotelTo.HasValue And pHotelFrom.ValueStr = pHotelTo.ValueStr Then
            errText = "<strong>Source (From) and destination (To) hotels are the same.</strong><br />" & _
                      "Report won't produce any data."
            msgPop.ShowError(New Exception(errText))
            Return False
        ElseIf ctrlHotelFrom.SelectionLevel >= 8 Or ctrlHotelTo.SelectionLevel >= 8 Then
            r = True
        Else
            'None of Hotel filters and none of TourOp filters
            If pDateFrom.Duration(pDateTo, DateInterval.Year) <= 2 Then
                r = pDateFrom.Duration(pDateTo, DateInterval.Year) <= 1
                errText = "Try setting source and/or destination Hotel or shorter date range."
            Else
                errText = "<strong>Filter criteria too wide.</strong><br />" & _
                          "Try setting source and/or destination Hotel or shorter date range."
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
        lr.ReportPath = "Reports\Accounting\AccTransferHotelRecap.rdlc"

        lr.DataSources.Clear()
        lr.DataSources.Add(New ReportDataSource("dsAccTransferHotel_AccTransferHotelRecap", dsRecap))

        Dim puser As New ReportParameter("user", My.User.Name)
        Dim photel As New ReportParameter("hotel", False)
        Dim pseparate As New ReportParameter("separate", cbSeparate.Checked)
        Dim photels As New ReportParameter("hotel_param", FilterParamHotel)
        Dim pperiod As New ReportParameter("period_param", FilterParamPeriod)

        Dim p As ReportParameter() = {puser, photel, pseparate, photels, pperiod}
        lr.SetParameters(p)

        Try
            Response.ClearContent()
            Response.ClearHeaders()

            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Hotel Transfer Recap.xls" + """")

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

    Protected Sub RenderDetail()
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
        lr.ReportPath = "Reports\Accounting\AccTransferHotelDetail.rdlc"

        lr.DataSources.Clear()
        lr.DataSources.Add(New ReportDataSource("dsAccTransferHotel_AccTransferHotelDetail", dsDetail))

        Dim puser As New ReportParameter("user", My.User.Name)
        Dim photel As New ReportParameter("hotel", False)
        Dim pseparate As New ReportParameter("separate", cbSeparate.Checked)
        Dim pnote As New ReportParameter("note", cbNote.Checked)
        Dim photels As New ReportParameter("hotel_param", FilterParamHotel)
        Dim pperiod As New ReportParameter("period_param", FilterParamPeriod)

        Dim p As ReportParameter() = {puser, photel, pseparate, photels, pperiod, pnote}
        lr.SetParameters(p)

        Try
            Response.ClearContent()
            Response.ClearHeaders()

            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Hotel Transfer Detail.xls" + """")

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
        l.LogUserAction(My.User.Name, LogApp.objRpt, "Monthly Transactions Accounting", logState, logText)
    End Sub

    Protected Function FilterParamHotel() As String
        Dim fs As String = "Hotels: from {0}{1}to {2}"
        Dim sFrom As String = IIf(ctrlHotelFrom.SelectionLevel > 0, ctrlHotelFrom.SelectedHotelItem.Text, "any")
        Dim sTo As String = IIf(ctrlHotelTo.SelectionLevel > 0, ctrlHotelTo.SelectedHotelItem.Text, "any other")
        'Dim sSep As String = IIf(ctrlHotelFrom.SelectionLevel > 0 Or ctrlHotelTo.SelectionLevel > 0, vbCrLf, " ")
        Dim sSep As String = " "
        Dim hotel As String = String.Format(fs, sFrom, sSep, sTo)
        If (ctrlTourOperator.SelectionLevel > 0) Then hotel &= vbCrLf & String.Format("Tour Operator: {0}", ctrlTourOperator.SelectedTourOpItem.Text)

        Return hotel
    End Function

    Protected Function FilterParamPeriod() As String
        Dim fs As String = "Period: {0:d} - {1:d}"
        Dim period As String = String.Format(fs, fltFromDate.DateValue, fltDate.DateValue)
        If Not String.IsNullOrEmpty(ddlAccType.SelectedValue) Then period &= String.Format(" ({0} only)", ddlAccType.SelectedValue)

        Return period
    End Function

End Class
