Imports App_UserControls_MessagePop

Partial Class Reports_Invoices_InvoiceJournal_Rate
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

    Protected Sub dsFilteredInvoicesDet_ObjectCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceEventArgs) Handles dsFilteredInvoicesDet.ObjectCreated
        Dim ta As dsInvoiceJournalRateTableAdapters.InvoiceJournal_RateTableAdapter
        ta = e.ObjectInstance
        ta.SetTimeout(ReportFilterClass.ReportTimeout("Reports_Invoices_InvoiceJournal_Rate"))
    End Sub

    Protected Sub dsRecap_ObjectCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceEventArgs) Handles dsRecap.ObjectCreated
        Dim ta As dsInvoiceJournalRateTableAdapters.InvoiceJournal_Rate_RecapTableAdapter
        ta = e.ObjectInstance
        ta.SetTimeout(ReportFilterClass.ReportTimeout("Reports_Invoices_InvoiceJournal_Rate"))
    End Sub

    Protected Sub dsRecap1_ObjectCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceEventArgs) Handles dsRecap1.ObjectCreated
        Dim ta As dsInvoiceJournalRateTableAdapters.InvoiceJournal_Rate_RecapNCTableAdapter
        ta = e.ObjectInstance
        ta.SetTimeout(ReportFilterClass.ReportTimeout("Reports_Invoices_InvoiceJournal_Rate"))
    End Sub

    Protected Sub dsRecap1_DET_ObjectCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceEventArgs) Handles dsRcap1Det.ObjectCreated
        Dim ta As dsInvoiceJournalRateTableAdapters.InvoiceJournal_Rate_Recap1_DETTableAdapter
        ta = e.ObjectInstance
        ta.SetTimeout(ReportFilterClass.ReportTimeout("Reports_Invoices_InvoiceJournal_Rate"))
    End Sub

    Protected Sub btClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btClear.Click
        ctrlHotel.ClearControl()
        ctrlTourOp.ClearControl()
        ddlInvType.SelectedIndex = 0
        fltRate.Text = Nothing
        ctrlCheckIn.ClearControl()
        ctrlInvNum.ClearControl()
        ctrlInvDate.ClearControl()
        ddlState.SelectedIndex = 0
        ddlInv.SelectedIndex = 0
        pnlRecap.Visible = True
    End Sub

    Protected Sub btReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btReport.Click
        msgPop.Action = "Report"
        If Me.CheckParams() Then RenderReport()
    End Sub

    Protected Sub btRecap_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btRecap.Click
        msgPop.Action = "Recap"
        If Me.CheckParams() Then RenderRecap()
    End Sub

    Protected Sub btRecapNC_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btRecapNC.Click
        msgPop.Action = "Recap"
        If Me.CheckParams() Then RenderRecapNC()
    End Sub

    Protected Sub msgPop_MessageYes(ByVal sender As Object, ByVal e As MessagePopArgs) Handles msgPop.MessageYes
        Dim paramLog As String = Session("paramLog")
        Me.LogReport(LogApp.stateWarning, paramLog)
        If msgPop.Action = "Report" Then
            Me.RenderReport()
        Else
            Me.RenderRecap()
        End If
    End Sub

    Protected Function CheckParams() As Boolean
        Dim errText As String = String.Empty
        Dim paramLog As String = String.Empty

        Dim pHotelGroup As New ReportFilterClass(ctrlHotel.SelectedHotelGroup, ReportFilterClass.ValueType.valInteger)
        Dim pHotel As New ReportFilterClass(ctrlHotel.SelectedHotel, ReportFilterClass.ValueType.valInteger)
        Dim pTourOpGroup As New ReportFilterClass(ctrlTourOp.SelectedTourOpGroup, ReportFilterClass.ValueType.valInteger)
        Dim pTourOp As New ReportFilterClass(ctrlTourOp.SelectedTourOp, ReportFilterClass.ValueType.valInteger)
        Dim pStart As New ReportFilterClass(ctrlCheckIn.DateFrom, ReportFilterClass.ValueType.valDate)
        Dim pFinish As New ReportFilterClass(ctrlCheckIn.DateTo, ReportFilterClass.ValueType.valDate)
        Dim pDateFrom As New ReportFilterClass(ctrlInvDate.DateFrom, ReportFilterClass.ValueType.valDate)
        Dim pDateTo As New ReportFilterClass(ctrlInvDate.DateTo, ReportFilterClass.ValueType.valDate)

        paramLog = "Hotel: " & pHotel.ValueStr & "; " & _
                   "HotelGroup: " & pHotelGroup.ValueStr & "; " & _
                   "TourOp: " & pTourOp.ValueStr & "; " & _
                   "TourOpGroup: " & pTourOpGroup.ValueStr & "; " & _
                   "Start: " & pStart.ValueStr & "; " & _
                   "Finish: " & pFinish.ValueStr & "; " & _
                   "DateFrom: " & pDateFrom.ValueStr & "; " & _
                   "DateTo: " & pDateTo.ValueStr

        Dim r As Boolean = True
        If pHotel.NoValue And pHotelGroup.NoValue And pTourOp.NoValue And pStart.Duration(pFinish, DateInterval.Year) > 1 And pDateFrom.Duration(pDateTo, DateInterval.Year) > 1 Then
            errText = "<p style='font-weight: bold; border-bottom: solid 1px;'>" & _
                      "Report could last too long or consume too much resources.<br/>" & _
                      "This could decrease performance of the entire system and affect all users.</p>" & _
                      "<p style='padding-left: 50px; padding-right: 50px;' >" & errText & "</p>"
            Session.Add("paramLog", paramLog)
            msgPop.ShowPrompt(errText)
            r = False
        End If

        Return r
    End Function

    Protected Sub RenderReport()
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim fname As String = "InvoiceJournal RateBy"
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()
        Dim user As String = Membership.GetUser.UserName

        Dim tStart = Now
        Me.LogReport(LogApp.stateStart, "Report rendering started")

        'Report
        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Reports\Invoices\RptInvoiceJournalRate_Stay.rdlc"
        If rbStay.Checked Then
            lr.ReportPath = "Reports\Invoices\RptInvoiceJournalRate_Stay.rdlc"
            fname = fname & "Stay"
        ElseIf rbBilling.Checked Then
            lr.ReportPath = "Reports\Invoices\RptInvoiceJournalRate_Bill.rdlc"
            fname = fname & "Bill"
        End If

        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportsInvoice_InvoiceJournal_Rate", dsFilteredInvoicesDet))
        FilterString()

        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim photel As New ReportParameter("hotel", Me.cbHotel.Checked)
        Dim pHotelName As New ReportParameter("pHotelName", ctrlHotel.SelectedHotelItem.Text)
        Dim pdateFrom As ReportParameter = IIf(ctrlCheckIn.HasFromValue, New ReportParameter("dateFrom", ctrlCheckIn.DateFrom), New ReportParameter("dateFrom"))
        Dim pdateTo As ReportParameter = IIf(ctrlCheckIn.HasFromValue, New ReportParameter("dateTo", ctrlCheckIn.DateTo), New ReportParameter("dateTo"))
        Dim pfilter As New ReportParameter("filterstring", FilterParam())
        Dim p As ReportParameter() = {puser, photel, pdateFrom, pdateTo, pfilter, pHotelName}
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
            Me.LogReport(LogApp.stateComplete, String.Format("Report rendering finished in {0} sec.", DateDiff(DateInterval.Second, tStart, Now)))
        Catch ex As Exception
            Me.LogReport(LogApp.stateError, String.Format("Report rendering error: {0}", ex.Message))
            msgPop.ShowError(ex)
        End Try
    End Sub

    Protected Sub RenderRecap()
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim fname As String = "InvoiceJournal RateBy"
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()
        Dim user As String = Membership.GetUser.UserName

        Dim tStart = Now
        Me.LogReport(LogApp.stateStart, "Report rendering started")

        'Report
        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Reports\Invoices\RptInvoiceJournalRate_Recap.rdlc"

        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsInvoiceJournalRate_InvoiceJournal_Rate_Recap", dsRecap))
        FilterString()

        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim photel As New ReportParameter("hotel", Me.cbHotel.Checked)
        Dim pHotelName As New ReportParameter("pHotelName", ctrlHotel.SelectedHotelItem.Text)
        Dim pdateFrom As ReportParameter = IIf(ctrlCheckIn.HasFromValue, New ReportParameter("dateFrom", ctrlCheckIn.DateFrom), New ReportParameter("dateFrom"))
        Dim pdateTo As ReportParameter = IIf(ctrlCheckIn.HasFromValue, New ReportParameter("dateTo", ctrlCheckIn.DateTo), New ReportParameter("dateTo"))
        Dim pfilter As New ReportParameter("filterstring", FilterParam())
        Dim p As ReportParameter() = {puser, photel, pdateFrom, pdateTo, pfilter, pHotelName}
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
            Me.LogReport(LogApp.stateComplete, String.Format("Recap Report rendering finished in {0} sec.", DateDiff(DateInterval.Second, tStart, Now)))
        Catch ex As Exception
            Me.LogReport(LogApp.stateError, String.Format("Recap Report rendering error: {0}", ex.Message))
            msgPop.ShowError(ex)
        End Try
    End Sub

    Protected Sub RenderRecapNC()
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim fname As String = "InvoiceJournal Recap (NC)"
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()
        Dim user As String = Membership.GetUser.UserName

        Dim tStart = Now
        Me.LogReport(LogApp.stateStart, "Report rendering started")

        'Report
        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Reports\Invoices\RptInvoiceJournalRate_RecapNC.rdlc"

        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsInvoiceJournalRate_InvoiceJournal_Rate_RecapNC", dsRecapNC))
        FilterString()

        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim photel As New ReportParameter("hotel", Me.cbHotel.Checked)
        Dim pHotelName As New ReportParameter("pHotelName", ctrlHotel.SelectedHotelItem.Text)
        Dim pdateFrom As ReportParameter = IIf(ctrlCheckIn.HasFromValue, New ReportParameter("dateFrom", ctrlCheckIn.DateFrom), New ReportParameter("dateFrom"))
        Dim pdateTo As ReportParameter = IIf(ctrlCheckIn.HasFromValue, New ReportParameter("dateTo", ctrlCheckIn.DateTo), New ReportParameter("dateTo"))
        Dim pfilter As New ReportParameter("filterstring", FilterParam())
        Dim p As ReportParameter() = {puser, photel, pdateFrom, pdateTo, pfilter, pHotelName}
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
            Me.LogReport(LogApp.stateComplete, String.Format("Recap (NC) Report rendering finished in {0} sec.", DateDiff(DateInterval.Second, tStart, Now)))
        Catch ex As Exception
            Me.LogReport(LogApp.stateError, String.Format("Recap (NC) Report rendering error: {0}", ex.Message))
            msgPop.ShowError(ex)
        End Try
    End Sub

    'Render Recap
    Protected Sub btRecapShow_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btRecapShow.Click
        hfHotel.Value = 0
        pnlRecap.Visible = True
        FilterString()
        gvRecap.DataBind()
    End Sub

    Protected Sub gvRecap_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvRecap.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then

            ''Configure the datasource for the expanded details
            'Dim toID As Integer = DataBinder.Eval(e.Row.DataItem, "TourOpId") 'Get the unique ID for this record
            'Dim toParent As Boolean = DataBinder.Eval(e.Row.DataItem, "ParentTO")
            Dim htlID As Integer = DataBinder.Eval(e.Row.DataItem, "HotelId")

            ''Remove ParentID parameter from the datasource for the expanded details
            'Dim p_toID As Parameter = dsRcap1Det.SelectParameters("ParentID")
            'Dim p_htlID As Parameter = dsRcap1Det.SelectParameters("HotelId")
            'dsRcap1Det.SelectParameters.Remove(p_toID)
            'dsRcap1Det.SelectParameters.Remove(p_htlID)

            ''Add ParentID parameter from the datasource for the expanded details
            'dsRcap1Det.SelectParameters.Add("ParentID", toID)
            'dsRcap1Det.SelectParameters.Add("HotelId", htlID)

            ''Create a new GridView for displaying the expanded details
            'Dim gv As New GridView
            'gv.EmptyDataText = "Empty"
            'gv.BorderStyle = BorderStyle.None
            'gv.GridLines = GridLines.None
            'gv.RowStyle.CssClass = "GridRow1T"

            'gv.DataSource = dsRcap1Det
            ''Since a gridview is being created for each row they each need a unique ID, so append the row index
            'gv.ID = "gvRecapDetail" & e.Row.RowIndex
            'gv.AutoGenerateColumns = False
            'gv.ShowHeader = False
            ''AddHandler gv.RowDataBound, AddressOf grdOverLimitDetails_RowDataBound 

            ''Add fields to the expanded details GridView
            'Dim bf1 As New BoundField
            'bf1.DataField = "TourOp"
            'bf1.HeaderText = "TourOp"
            'bf1.ItemStyle.Width = 350
            'gv.Columns.Add(bf1)

            'Dim bf2 As New BoundField
            'bf2.DataField = "RateAmount"
            'bf2.HeaderText = "RateAmount"
            'bf2.ItemStyle.Width = 80
            'bf2.ItemStyle.HorizontalAlign = HorizontalAlign.Right
            'bf2.DataFormatString = "{0:N2}"
            'gv.Columns.Add(bf2)

            'Dim bf3 As New BoundField
            'bf3.DataField = "SuppAmount"
            'bf3.HeaderText = "SuppAmount"
            'bf3.ItemStyle.Width = 80
            'bf3.ItemStyle.HorizontalAlign = HorizontalAlign.Right
            'bf3.DataFormatString = "{0:N2}"
            'gv.Columns.Add(bf3)

            'Dim bf4 As New BoundField
            'bf4.DataField = "NC_CO_OI"
            'bf4.HeaderText = "Override NC_CO_OI"
            'bf4.ItemStyle.Width = 80
            'bf4.ItemStyle.HorizontalAlign = HorizontalAlign.Right
            'bf4.DataFormatString = "{0:N2}"
            'gv.Columns.Add(bf4)

            'Dim bf5 As New BoundField
            'bf4.DataField = "NC_AR_CM"
            'bf4.HeaderText = "CM NC_AR_CM"
            'bf4.ItemStyle.Width = 80
            'bf4.ItemStyle.HorizontalAlign = HorizontalAlign.Right
            'bf4.DataFormatString = "{0:N2}"
            'gv.Columns.Add(bf5)

            'Dim bf6 As New BoundField
            'bf4.DataField = "ncNetAmount"
            'bf4.HeaderText = "NetAmount"
            'bf4.ItemStyle.Width = 80
            'bf4.ItemStyle.HorizontalAlign = HorizontalAlign.Right
            'bf4.DataFormatString = "{0:N2}"
            'gv.Columns.Add(bf6)

            ''Create the show/hide button which will be displayed on each row of the main GridView
            'Dim btn As Web.UI.WebControls.Image = New Web.UI.WebControls.Image
            'btn.Visible = toParent
            'btn.ID = "btnDetail"
            'btn.ImageUrl = "~/Images/dwn.gif"

            ''Adds the javascript function to the show/hide button, passing the row to be toggled as a parameter
            'btn.Attributes.Add("onclick", "javascript: gvrowtoggle(" & e.Row.RowIndex + (e.Row.RowIndex + 2) & ")")

            ''Add the expanded details row after each record in the main GridView
            'Dim tbl As Table = DirectCast(e.Row.Parent, Table)
            'Dim tr As New GridViewRow(e.Row.RowIndex + 1, -1, DataControlRowType.EmptyDataRow, DataControlRowState.Normal)
            'tr.CssClass = "hidden"
            'tr.Cells.Add(New TableCell())
            'tr.Cells.Add(New TableCell())
            'Dim tc As New TableCell()
            'tc.ColumnSpan = gvRecap.Columns.Count - 1
            'tc.BorderStyle = BorderStyle.None
            'tc.BackColor = Drawing.Color.AliceBlue
            'tc.Controls.Add(gv)                 'Add the expanded details GridView to the newly-created cell
            'tr.Cells.Add(tc)                    'Add the newly-created cell to the newly-created row
            'tbl.Rows.Add(tr)                    'Add the newly-ccreated row to the main GridView
            'e.Row.Cells(1).Controls.Add(btn)    'Add the show/hide button to the main GridView row

            'Hotel row (data set is returning sum row per hotel)
            If htlID = hfHotel.Value Then
                e.Row.Cells(0).Text = ""
            Else
                hfHotel.Value = htlID
                e.Row.BackColor = Drawing.Color.FromArgb(0, 92, 153)   '005C99
                e.Row.ForeColor = Drawing.Color.White
                e.Row.Font.Bold = True
                e.Row.Cells(0).ColumnSpan = 3
                e.Row.Cells.RemoveAt(2)
                e.Row.Cells.RemoveAt(1)
            End If

            ''Bind the expanded details GridView to its datasource
            'If toParent Then gv.DataBind()
        End If
    End Sub


    'Helper
    Protected Sub LogReport(ByVal logState As String, ByVal logText As String)
        Dim l As New LogApp
        l.LogUserAction(My.User.Name, LogApp.objRpt, "Invoice Journal Rates", logState, logText)
    End Sub

    Protected Function FilterParam() As String
        Dim pfc As New List(Of String)

        If ctrlHotel.SelectedHotelGroup <> String.Empty Then pfc.Add("for hotel group: " & ctrlHotel.SelectedHotelGroupItem.Text)
        If ctrlTourOp.SelectedTourOpKind <> String.Empty Then pfc.Add("for " & ctrlTourOp.SelectedTourOpKindItem.Text & " tour operators")
        If ctrlTourOp.SelectedTourOpGroup <> String.Empty Then pfc.Add("for tour operator group: " & ctrlTourOp.SelectedTourOpGroupItem.Text)
        If ctrlTourOp.SelectedMarket <> String.Empty Then pfc.Add("for market: " & ctrlTourOp.SelectedMarketItem.Text)
        If ctrlTourOp.SelectedPayCond <> String.Empty Then pfc.Add("for pay condition: " & ctrlTourOp.SelectedPayCondItem.Text)
        If ctrlTourOp.SelectedTourOp <> String.Empty Then pfc.Add("for tour operator: " & ctrlTourOp.SelectedTourOpItem.Text)
        If ddlInvType.SelectedIndex > 0 Then pfc.Add("only " & ddlInvType.SelectedItem.Text & " Invoices")
        If Not String.IsNullOrEmpty(fltRate.Text) Then pfc.Add("Rate: " & fltRate.Text)
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

    Protected Sub FilterString()
        Dim fs As New List(Of String)

        If ctrlTourOp.SelectedTourOpKind = "1" Then fs.Add("TourOp NOT LIKE '%GROUPS%'")
        If ctrlTourOp.SelectedTourOpKind = "2" Then fs.Add("TourOp LIKE '%GROUPS%'")
        'If Not cbCancel.Checked Then fs.Add("State<>-3 AND State<>-7")

        Dim f As String = String.Empty
        If fs.Count > 0 Then f = Join(fs.ToArray, " AND ")

        dsRecap.FilterExpression = f
        dsRecap1.FilterExpression = f
        dsRecapNC.FilterExpression = f
        dsRcap1Det.FilterExpression = f
        dsFilteredInvoicesDet.FilterExpression = f
    End Sub
End Class
