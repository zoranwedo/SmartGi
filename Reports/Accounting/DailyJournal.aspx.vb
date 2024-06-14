Imports App_UserControls_MessagePop

Partial Class Reports_Accounting_DailyJournal
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not (Page.IsPostBack) Then
            If ModificationRights.RightsHotel Then
                cbHotel.Checked = True
                cbHotel.Visible = False
                cbCCI.Checked = True
                cbCCI.Visible = False
            'ElseIf ModificationRights.RightsOperatorReport Then
            '    cbHotel.Checked = False
            '    cbHotel.Visible = False
            Else
                cbHotel.Visible = True
            End If

            FillDocuments()
        End If
    End Sub

    Protected Sub dsDailyJournal_ObjectCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceEventArgs) Handles dsDailyJournal.ObjectCreated
        Dim ta As dsCoopMarketingTableAdapters.AccRepDocJournalTableAdapter
        ta = e.ObjectInstance
        ta.SetTimeout(ReportFilterClass.ReportTimeout("Reports_Accounting_DailyJournal"))
    End Sub

    Protected Sub btnCloseTV_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCloseTV.Click
        Dim pop As AjaxControlToolkit.PopupControlExtender = AjaxControlToolkit.PopupControlExtender.GetProxyForCurrentPopup(Page)
        Dim sDocs As String = TrCodeList("; ")
        fltDocuments.Text = sDocs
        pop.Commit(sDocs)
    End Sub


    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        ctrlHotel.ClearControl()
        ctrlTourOp.ClearControl()
        fltDate.ClearControl()
        exDep.SelectedValue = ""
        exEmp.SelectedValue = ""
        fltDocFrom.ClearControl()
        ddlDocClass.SelectedIndex = 0
        ddlClass.SelectedIndex = 0
        fltDocuments.Text = Nothing
        ddlAccType.SelectedIndex = 0
        ddlTranType.SelectedIndex = 0
        ddlDocType.SelectedIndex = 0
        ddlSign.SelectedIndex = 0
        ddlInvType.SelectedIndex = 0

        For Each nD As TreeNode In tvDocuments.Nodes
            For Each nC As TreeNode In nD.ChildNodes
                For Each nDoc As TreeNode In nC.ChildNodes
                    nDoc.Checked = False
                Next
            Next
        Next
    End Sub

    Protected Sub btnReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReport.Click
        fltDocuments.Text = TrCodeList("; ")
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
        Dim pStart As New ReportFilterClass(fltDocFrom.TextValue, ReportFilterClass.ValueType.valDate)
        Dim pFinish As New ReportFilterClass(fltDate.TextValue, ReportFilterClass.ValueType.valDate)
        Dim pDocClass As New ReportFilterClass(ddlDocClass.SelectedValue, ReportFilterClass.ValueType.valString)
        Dim pClass As New ReportFilterClass(ddlClass.SelectedValue, ReportFilterClass.ValueType.valString)

        paramLog = "Hotel: " & pHotel.ValueStr & "; " & _
                   "HotelGroup: " & pHotelGroup.ValueStr & "; " & _
                   "TourOp: " & pTourOp.ValueStr & "; " & _
                   "TourOpGroup: " & pTourOpGroup.ValueStr & "; " & _
                   "Market: " & pMarket.ValueStr & "; " & _
                   "PayCond: " & pPayCond.ValueStr & "; " & _
                   "Start: " & pStart.ValueStr & "; " & _
                   "Finish: " & pFinish.ValueStr & "; " & _
                   "DocClass: " & pDocClass.ValueStr & "; " & _
                   "Class: " & pClass.ValueStr

        If pStart.Duration(pFinish, DateInterval.Month) > 1 Then
            If pHotel.HasValue And (pTourOp.HasValue Or pTourOpGroup.HasValue Or pMarket.HasValue Or pPayCond.HasValue) Then
                If pStart.Duration(pFinish, DateInterval.Year) > 1 And pDocClass.NoValue And pClass.NoValue Then
                    errText = "Try with shorter period or set Doc Class or Class."
                End If
            ElseIf pHotelGroup.HasValue And (pTourOp.HasValue Or pTourOpGroup.HasValue Or pMarket.HasValue Or pPayCond.HasValue) Then
                If pStart.Duration(pFinish, DateInterval.Year) > 1 Then
                    errText = "Try set specific Hotel or shorter period."
                ElseIf pStart.Duration(pFinish, DateInterval.Month) > 6 And pDocClass.NoValue And pClass.NoValue Then
                    errText = "Try set specific Hotel or shorter period."
                End If
            ElseIf pHotelGroup.HasValue Or pTourOp.HasValue Or pTourOpGroup.HasValue Or pMarket.HasValue Or pPayCond.HasValue Then
                If pStart.Duration(pFinish, DateInterval.Month) > 6 Then
                    errText = "Try set specific Hotel or shorter period."
                ElseIf pStart.Duration(pFinish, DateInterval.Month) > 3 And pDocClass.NoValue And pClass.NoValue Then
                    errText = "Try set specific Hotel or shorter period."
                End If
            ElseIf pStart.Duration(pFinish, DateInterval.Month) > 3 Or pDocClass.NoValue Or pClass.NoValue Then
                errText = "Try set specific Hotel or Tour Operator or shorter period."
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
        Dim user As String = Membership.GetUser.UserName
        Dim bytes As Byte()

        Dim tStart = Now
        Me.LogReport(LogApp.stateStart, "Report rendering started")

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        If (cbSort.Checked) Then
            lr.ReportPath = "Reports\Accounting\RptDailyJournalTO.rdlc"
        Else
            lr.ReportPath = "Reports\Accounting\RptDailyJournal.rdlc"
        End If

        lr.DataSources.Clear()
        'lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsCoopMarketing_AccRepDocJournal", dsDailyJournal))
        Dim ds = dsDailyJournal.Select()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsCoopMarketing_AccRepDocJournal", ds))

        Dim puser As New ReportParameter("user", My.User.Name)
        Dim photel As New ReportParameter("hotel", Me.cbHotel.Checked)
        Dim pHotelName As New ReportParameter("pHotelName", ctrlHotel.SelectedHotelItem.Text)
        Dim pnote As New ReportParameter("note", Me.cbNote.Checked)
        Dim psort As New ReportParameter("psort", cbSort.Checked)
        Dim pfilter As New ReportParameter("filterstring", FilterParam())
        Dim pdateFrom As New ReportParameter("dateFrom", fltDocFrom.TextValue)
        Dim pdateTo As New ReportParameter("dateTo", fltDate.TextValue)
        Dim pResp As New ReportParameter("Resp", cbResp.Checked)
        Dim pCM As New ReportParameter("CM", cbCM.Checked)

        Dim p As ReportParameter() = {pdateFrom, pdateTo, puser, photel, pfilter, pnote, psort, pHotelName, pResp, pCM}
        lr.SetParameters(p)
        FilterString()

        Try
            Response.ClearContent()
            Response.ClearHeaders()

            If cbExcel.Checked Then
                bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
                Response.ContentType = "application/excel"
                Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "DailyJournal.xls" + """")
            Else
                bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
                Response.ContentType = "application/pdf"
                Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "DailyJournal.pdf" + """")
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
        l.LogUserAction(My.User.Name, LogApp.objRpt, "Daily Journal", logState, logText)
    End Sub

    Protected Function FilterParam() As String
        Dim pfc As New List(Of String)

        If ctrlHotel.SelectedHotelGroup <> String.Empty Then pfc.Add("for hotel group: " & ctrlHotel.SelectedHotelGroupItem.Text)
        If ctrlTourOp.SelectedTourOpKind <> String.Empty Then pfc.Add("for " & ctrlTourOp.SelectedTourOpKindItem.Text & " tour operators")
        If ctrlTourOp.SelectedTourOpGroup <> String.Empty Then pfc.Add("for tour operator group: " & ctrlTourOp.SelectedTourOpGroupItem.Text)
        If ctrlTourOp.SelectedMarket <> String.Empty Then pfc.Add("for market: " & ctrlTourOp.SelectedMarketItem.Text)
        If ctrlTourOp.SelectedPayCond <> String.Empty Then pfc.Add("for pay condition: " & ctrlTourOp.SelectedPayCondItem.Text)
        If ctrlTourOp.SelectedTourOp <> String.Empty Then pfc.Add("for tour operator: " & ctrlTourOp.SelectedTourOpItem.Text)
        If exDep.SelectedValue <> String.Empty Then pfc.Add("for department: " & ddlDep.SelectedItem.Text)
        If exEmp.SelectedValue <> String.Empty Then pfc.Add("for employee: " & ddlEmp.SelectedItem.Text)
        pfc.Add("From-To Date: " & ReportFilterClass.ReportPeriod(fltDocFrom.TextValue, fltDate.TextValue))
        If ddlDocClass.SelectedValue <> String.Empty Then pfc.Add("for DocClass: " & ddlDocClass.SelectedItem.Text)
        If ddlClass.SelectedValue <> String.Empty Then pfc.Add("for Class: " & ddlClass.SelectedItem.Text)
        If fltDocuments.Text <> String.Empty Then pfc.Add("for TrCodes: " & fltDocuments.Text)
        If ddlAccType.SelectedValue <> String.Empty Then pfc.Add("for AccType: " & ddlAccType.SelectedItem.Text)
        If ddlTranType.SelectedValue <> String.Empty Then pfc.Add("for TranType: " & ddlTranType.SelectedItem.Text)
        If ddlDocType.SelectedValue <> String.Empty Then pfc.Add("for DocType: " & ddlDocType.SelectedItem.Text)
        If ddlSign.SelectedValue <> String.Empty Then pfc.Add("for Sign: " & ddlSign.SelectedItem.Text)
        If ddlInvType.SelectedValue <> String.Empty Then pfc.Add("for Inv.Type: " & ddlInvType.SelectedItem.Text)

        Dim pfs As String = String.Empty
        If pfc.Count > 0 Then
            pfs = Join(pfc.ToArray, " AND ")
            pfs = pfs.Substring(0, 1).ToUpper & pfs.Substring(1)
        End If

        Return pfs
    End Function

    Protected Sub FilterString()
        Dim fs As New List(Of String)
        Dim strTrCode As String = TrCodeList("','")

        If Not String.IsNullOrEmpty(ddlDep.SelectedValue) Then fs.Add("DepID = " + ddlDep.SelectedValue)
        If Not String.IsNullOrEmpty(ddlEmp.SelectedValue) Then fs.Add("EmpID = " + ddlEmp.SelectedValue)
        If Not String.IsNullOrEmpty(strTrCode) Then fs.Add("DocCode IN ('" & strTrCode & "')")
        If cbCCI.Checked Then fs.Add("(HotelId NOT IN (49, 61, 63, 64, 65, 70))")
        If ctrlTourOp.SelectedTourOpKind = "1" Then fs.Add("TourOp NOT LIKE '%GROUPS%'")
        If ctrlTourOp.SelectedTourOpKind = "2" Then fs.Add("TourOp LIKE '%GROUPS%'")

        Dim f As String = String.Empty
        If fs.Count > 0 Then f = Join(fs.ToArray, " AND ")
        dsDailyJournal.FilterExpression = f
    End Sub

    Sub FillDocuments()
        Dim ds As New AccDaily
        Dim tD As New AccDailyTableAdapters.AccDocClassTableAdapter
        Dim tC As New AccDailyTableAdapters.AccClassTableAdapter
        Dim tDoc As New AccDailyTableAdapters.AccDocumentTableAdapter

        tD.Fill(ds.AccDocClass)
        tC.Fill(ds.AccClass)
        tDoc.Fill(ds.AccDocument)

        For Each rD As AccDaily.AccDocClassRow In ds.AccDocClass
            Dim sD As String = "<b>" & rD.TrDocClass & "</b> <i>" & rD.TrDescription & "</i>"
            Dim nD As New TreeNode(sD)
            nD.SelectAction = TreeNodeSelectAction.Expand

            Dim cD As AccDaily.AccClassRow() = rD.GetChildRows("AccDocClass_AccClass")
            For Each rC As AccDaily.AccClassRow In cD
                Dim sC As String = "<b>" & rC.TrClass & "</b> <i>" & rC.TrDescription & "</i>"
                Dim nC As New TreeNode(sC)
                nC.SelectAction = TreeNodeSelectAction.Expand
                nD.ChildNodes.Add(nC)

                Dim cDoc As AccDaily.AccDocumentRow() = rC.GetChildRows("AccClass_AccDocument")
                For Each rDoc As AccDaily.AccDocumentRow In cDoc
                    Dim sDoc As String = "<b>" & rDoc.TrCode & "</b> <i>" & rDoc.TrDescription & "</i>"
                    Dim nDoc As New TreeNode(sDoc, rDoc.TrCode)
                    nDoc.ShowCheckBox = True
                    nDoc.SelectAction = TreeNodeSelectAction.None
                    nC.ChildNodes.Add(nDoc)
                Next
            Next
            tvDocuments.Nodes.Add(nD)
        Next
    End Sub

    Protected Function TrCodeList(ByVal sep As String) As String
        Dim strList As New List(Of String)
        For Each nD As TreeNode In tvDocuments.Nodes
            For Each nC As TreeNode In nD.ChildNodes
                For Each nDoc As TreeNode In nC.ChildNodes
                    If nDoc.Checked Then strList.Add(nDoc.Value)
                Next
            Next
        Next

        Return String.Join(sep, strList.ToArray)
    End Function

    Protected Sub dsDailyJournal_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles dsDailyJournal.Selecting
        If Not String.IsNullOrEmpty(fltDocuments.Text) Then e.InputParameters("TrCode") = fltDocuments.Text
    End Sub
End Class
