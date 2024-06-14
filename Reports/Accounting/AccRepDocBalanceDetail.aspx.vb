Imports App_UserControls_MessagePop

Partial Class Reports_Accounting_AccRepDocBalanceDetail
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not (Page.IsPostBack) Then
            If ModificationRights.RightsHotel Then
                cbHotel.Checked = True
                cbHotel.Visible = False
                cbCCI.Checked = True
                cbCCI.Visible = False
            ElseIf ModificationRights.RightsOperatorReport Then
                cbHotel.Checked = False
                cbHotel.Visible = False
            Else
                cbHotel.Visible = True
            End If
        End If
    End Sub

    'Protected Sub dsBalance_ObjectCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceEventArgs) Handles dsBalance.ObjectCreated
    '    Dim ta As AccRepDocBalanceDetailTableAdapters.AccRepDocBalanceTableAdapter = e.ObjectInstance
    '    ta.SetTimeout(ReportFilterClass.ReportTimeout("Reports_Accounting_AccRepStatement"))
    'End Sub

    'Protected Sub dsBalanceDetail_ObjectCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceEventArgs) Handles dsBalanceDetail.ObjectCreated
    '    Dim ta As AccRepDocBalanceDetailTableAdapters.AccRepDocBalanceDetailTableAdapter = e.ObjectInstance
    '    ta.SetTimeout(ReportFilterClass.ReportTimeout("Reports_Accounting_AccRepStatement"))
    'End Sub

    Protected Sub dsBalanceNew_ObjectCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceEventArgs) Handles dsBalance_new.ObjectCreated
        Dim ta As AccRepDocBalanceDetailTableAdapters.AccRepDocBalance_newTableAdapter = e.ObjectInstance
        ta.SetTimeout(ReportFilterClass.ReportTimeout("Reports_Accounting_AccRepStatement"))
    End Sub

    Protected Sub dsBalanceDetailNew_ObjectCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceEventArgs) Handles dsBalanceDetail_new.ObjectCreated
        Dim ta As AccRepDocBalanceDetailTableAdapters.AccRepDocBalanceDetail_newTableAdapter = e.ObjectInstance
        ta.SetTimeout(ReportFilterClass.ReportTimeout("Reports_Accounting_AccRepStatement"))
    End Sub

    Protected Sub gvDocToApply_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvDocToApply.SelectedIndexChanged
        Dim pop As AjaxControlToolkit.PopupControlExtender
        Dim gv As GridView = sender

        ddlTrSearch.Text = gv.SelectedDataKey.Item(0)

        pop = AjaxControlToolkit.PopupControlExtender.GetProxyForCurrentPopup(Page)
        pop.Commit(ddlTrSearch.Text)
    End Sub

    Protected Sub btClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btClear.Click
        ctrlHotel.ClearControl()
        ctrlTourOp.ClearControl()
        fltDate.ClearControl()
        exDep.SelectedValue = ""
        exEmp.SelectedValue = ""
        fltDocFrom.ClearControl()
        ddlDocClass.SelectedIndex = 0
        ddlClass.SelectedIndex = 0
        ddlTrSearch.Text = Nothing
        ddlAccType.SelectedIndex = 0
        ddlTranType.SelectedIndex = 0
        ddlDocType.SelectedIndex = 0
        ddlSign.SelectedIndex = 0
        ddlOptions.SelectedIndex = 0
    End Sub

    Protected Sub tbReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles tbReport.Click
        msgPop.Action = "Report"
        If Me.CheckParams() Then RenderReport()
    End Sub

    Protected Sub btDetail_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btDetail.Click
        msgPop.Action = "Detail"
        If Me.CheckParams() Then RenderDetailReport()
    End Sub

    Protected Sub msgPop_MessageYes(ByVal sender As Object, ByVal e As MessagePopArgs) Handles msgPop.MessageYes
        Dim paramLog As String = Session("paramLog")
        Me.LogReport(LogApp.stateWarning, paramLog)
        If msgPop.Action = "Report" Then
            Me.RenderReport()
        Else
            Me.RenderDetailReport()
        End If
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
        Dim pDep As New ReportFilterClass(ddlDep.SelectedValue, ReportFilterClass.ValueType.valInteger)
        Dim pEmp As New ReportFilterClass(ddlEmp.SelectedValue, ReportFilterClass.ValueType.valInteger)
        Dim pDocFrom As New ReportFilterClass(fltDocFrom.TextValue, ReportFilterClass.ValueType.valDate)
        Dim pTrCode As New ReportFilterClass(ddlTrSearch.Text, ReportFilterClass.ValueType.valString)
        Dim pBalance As New ReportFilterClass(ddlOptions.SelectedValue, ReportFilterClass.ValueType.valInteger)

        paramLog = "Hotel group: " & pHotelGroup.ValueStr & _
                   "Hotel: " & pHotel.ValueStr & "; " & _
                   "TourOp group: " & pTourOpGroup.ValueStr & "; " & _
                   "Market: " & pMarket.ValueStr & "; " & _
                   "PayCond: " & pPayCond.ValueStr & "; " & _
                   "TourOp: " & pTourOp.ValueStr & "; " & _
                   "As of Date: " & IIf(fltDate.DateValue.HasValue, fltDate.DateValue.Value.ToShortDateString, "NULL") & "; " & _
                   "AccType: " & ddlAccType.SelectedValue & "; " & _
                   "Department: " & pDep.ValueStr & "; " & _
                   "Employee: " & pEmp.ValueStr & "; " & _
                   "DocFrom: " & pDocFrom.ValueStr & "; " & _
                   "DocClass/Class: " & ddlDocClass.SelectedValue & "/" & ddlClass.SelectedValue & "; " & _
                   "TrCode: " & pTrCode.ValueStr & "; " & _
                   "AccType/TranType/DocType/Sign: " & ddlAccType.SelectedValue & "/" & _
                        ddlTranType.SelectedValue & "/" & ddlDocType.SelectedValue & "/" & ddlSign.SelectedValue & "; " & _
                   "Balance: " & pBalance.ValueStr

        Dim r As Boolean = True
        If h >= 8 Or t >= 8 Then
            'Hotel or TourOp
            r = True
        ElseIf h >= 4 And t >= 1 Then
            'HotelGroup and any of TourOp filters
            r = True
        ElseIf h >= 4 And t = 0 Then
            'HotelGroup and none of TourOp filters
            r = pTrCode.HasValue
            errText = "Try setting Tour Operator or Document Code."
        ElseIf h = 0 And t >= 1 Then
            'None of Hotel filters and any of TourOp filters
            r = pTrCode.HasValue
            errText = "Try setting Hotel or Tour Operator or Document Code."
        Else
            'None of Hotel filters and none of TourOp filters
            r = False
            If pTrCode.HasValue Then
                errText = "Try setting Hotel or Tour Operator."
            ElseIf pDep.HasValue Or pEmp.HasValue Or ddlAccType.SelectedIndex > 0 Then
                errText = "Try setting Hotel or Tour Operator or Document Code."
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
        lr.ReportPath = "Reports\Accounting\RptAccBalanceRes.rdlc"
        lr.DataSources.Clear()
        'Dim ds = dsBalance_new.Select
        'lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("AccRepDocBalanceDetail_AccRepDocBalance_new", ds))
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("AccRepDocBalanceDetail_AccRepDocBalance_new", dsBalance_new))

        Dim puser As New ReportParameter("user", My.User.Name)
        Dim asoffdate As New ReportParameter("asoffdate", fltDate.DateValue)
        Dim photel As New ReportParameter("hotel", Me.cbHotel.Checked)
        Dim pnote As New ReportParameter("note", cbNote.Checked)
        Dim pdepartment As New ReportParameter("department", cbDepartment.Checked)
        Dim pfilter As New ReportParameter("filterstring", FilterParam(False))

        Dim p As ReportParameter() = {puser, photel, asoffdate, pfilter, pnote, pdepartment}
        lr.SetParameters(p)
        'FilterString()

        Try
            Response.ClearContent()
            Response.ClearHeaders()

            If cbExcel.Checked Then
                bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
                Response.ContentType = "application/excel"
                Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Document Balance.xls" + """")
            Else
                bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
                Response.ContentType = "application/pdf"
                Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Document Balance.pdf" + """")
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

    Protected Sub RenderDetailReport()
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
        lr.ReportPath = "Reports\Accounting\RptAccBalanceDetailRes.rdlc"
        lr.DataSources.Clear()
        Dim ds = dsBalanceDetail_new.Select
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("AccRepDocBalanceDetail_AccRepDocBalanceDetail_new", ds))

        Dim puser As New ReportParameter("user", My.User.Name)
        Dim asoffdate As New ReportParameter("asoffdate", fltDate.DateValue)
        Dim photel As New ReportParameter("hotel", Me.cbHotel.Checked)
        Dim pnote As New ReportParameter("note", cbNote.Checked)
        Dim pdepartment As New ReportParameter("department", cbDepartment.Checked)
        Dim pfilter As New ReportParameter("filterstring", FilterParam(True))

        Dim p As ReportParameter() = {puser, photel, asoffdate, pfilter, pnote, pdepartment}
        lr.SetParameters(p)
        'FilterString()

        Try
            Response.ClearContent()
            Response.ClearHeaders()

            If cbExcel.Checked Then
                bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
                Response.ContentType = "application/excel"
                Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Balance_Detail.xls" + """")
            Else
                bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
                Response.ContentType = "application/pdf"
                Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Balance_Detail.pdf" + """")
            End If

            Response.BinaryWrite(bytes)
            Response.Flush()
            'Response.Close()
            Response.End()
            Me.LogReport(LogApp.stateComplete, String.Format("Report Details rendering finished in {0} sec.", DateDiff(DateInterval.Second, tStart, Now)))
        Catch ex As Exception
            Me.LogReport(LogApp.stateError, String.Format("Report Details rendering error: {0}", ex.Message))
            msgPop.ShowError(ex)
        End Try
    End Sub


    'Helper
    Protected Sub LogReport(ByVal logState As String, ByVal logText As String)
        Dim l As New LogApp
        l.LogUserAction(My.User.Name, LogApp.objRpt, "Document Balance", logState, logText)
    End Sub

    Protected Function FilterParam(ByVal bDetail As Boolean) As String
        Dim pfc As New List(Of String)

        If ctrlHotel.SelectedHotelGroup <> String.Empty Then pfc.Add("for hotel group: " & ctrlHotel.SelectedHotelGroupItem.Text)
        If ctrlTourOp.SelectedTourOpKind <> String.Empty Then pfc.Add("for " & ctrlTourOp.SelectedTourOpKindItem.Text & " tour operators")
        If ctrlTourOp.SelectedTourOpGroup <> String.Empty Then pfc.Add("for tour operator group: " & ctrlTourOp.SelectedTourOpGroupItem.Text)
        If ctrlTourOp.SelectedMarket <> String.Empty Then pfc.Add("for market: " & ctrlTourOp.SelectedMarketItem.Text)
        If ctrlTourOp.SelectedPayCond <> String.Empty Then pfc.Add("for pay condition: " & ctrlTourOp.SelectedPayCondItem.Text)
        If ctrlTourOp.SelectedTourOp <> String.Empty Then pfc.Add("for tour operator: " & ctrlTourOp.SelectedTourOpItem.Text)
        If exDep.SelectedValue <> String.Empty Then pfc.Add("for department: " & ddlDep.SelectedItem.Text)
        If exEmp.SelectedValue <> String.Empty Then pfc.Add("for employee: " & ddlEmp.SelectedItem.Text)
        If fltDocFrom.HasValue Then pfc.Add("from date: " & fltDocFrom.TextValue)
        If ddlDocClass.SelectedValue <> String.Empty Then pfc.Add("for DocClass: " & ddlDocClass.SelectedItem.Text)
        If ddlClass.SelectedValue <> String.Empty Then pfc.Add("for Class: " & ddlClass.SelectedItem.Text)
        If ddlTrSearch.Text <> String.Empty Then pfc.Add("for TrCode: " & ddlTrSearch.Text)
        If ddlAccType.SelectedValue <> String.Empty Then pfc.Add("for AccType: " & ddlAccType.SelectedItem.Text)
        If ddlTranType.SelectedValue <> String.Empty Then pfc.Add("for TranType: " & ddlTranType.SelectedItem.Text)
        If ddlDocType.SelectedValue <> String.Empty Then pfc.Add("for DocType: " & ddlDocType.SelectedItem.Text)
        If ddlSign.SelectedValue <> String.Empty Then pfc.Add("for Sign: " & ddlSign.SelectedItem.Text)
        pfc.Add(ddlOptions.SelectedItem.Text)
        If bDetail Then pfc.Add(String.Format("{0} zero applications", IIf(cbZero.Checked, "with", "without")))
        Dim pfs As String = String.Empty
        If pfc.Count > 0 Then
            pfs = Join(pfc.ToArray, " AND ")
            pfs = pfs.Substring(0, 1).ToUpper & pfs.Substring(1)
        End If

        Return pfs
    End Function

    'Protected Sub FilterString()
    '    Dim fs As New List(Of String)

    '    If cbCCI.Checked Then fs.Add("HotelId NOT IN (49, 61, 63, 64, 65, 70)")
    '    If ctrlTourOp.SelectedTourOpKind = "1" Then fs.Add("TourOp NOT LIKE '%GROUPS%'")
    '    If ctrlTourOp.SelectedTourOpKind = "2" Then fs.Add("TourOp LIKE '%GROUPS%'")

    '    Dim f As String = String.Empty
    '    If fs.Count > 0 Then f = Join(fs.ToArray, " AND ")
    '    dsBalance.FilterExpression = f
    '    dsBalanceDetail.FilterExpression = f
    'End Sub
End Class
