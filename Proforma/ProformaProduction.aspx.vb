
Partial Class Proforma_ProformaProduction
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        FormCookie()

        Select Case rbType.SelectedIndex
            Case 1
                ctrlTourOp.FixKind = App_UserControls_TourOpExpanderControl.FixKindType.FixSingle
            Case 2
                ctrlTourOp.FixKind = App_UserControls_TourOpExpanderControl.FixKindType.FixGroup
            Case Else
                ctrlTourOp.FixKind = App_UserControls_TourOpExpanderControl.FixKindType.None
        End Select
    End Sub

    Protected Sub FormCookie()
        Dim cName As String = "ProformaProduction$_" & Membership.GetUser.UserName
        If (Request.Cookies(cName) IsNot Nothing) Then
            If Not Me.IsPostBack Then
                Try
                    If (Request.Cookies(cName)("rbType") IsNot Nothing) Then rbType.SelectedValue = Request.Cookies(cName)("rbType")
                    ctrlTourOp.CookieLoad(Request.Cookies(cName))
                    ctrlHotel.CookieLoad(Request.Cookies(cName))
                    If (Request.Cookies(cName)("txtGroup") IsNot Nothing) Then txtGroup.Text = Request.Cookies(cName)("txtGroup")
                    ctrlCheckIn.LoadCookie(cName)
                    ctrlCheckOut.LoadCookie(cName)
                    ctrlBkDate.LoadCookie(cName)
                    If (Request.Cookies(cName)("txtBkNumber") IsNot Nothing) Then txtBkNumber.Text = Request.Cookies(cName)("txtBkNumber")
                    If (Request.Cookies(cName)("cbIncludeCancelled") IsNot Nothing) Then cbIncludeCancelled.Checked = Request.Cookies(cName)("cbIncludeCancelled")
                    If (Request.Cookies(cName)("cbIncludePreinvoiced") IsNot Nothing) Then cbIncludePreinvoiced.Checked = Request.Cookies(cName)("cbIncludePreinvoiced")
                Catch ex As Exception
                End Try
            End If
        End If

        If Me.IsPostBack Then
            Response.Cookies(cName)("rbType") = rbType.SelectedValue
            ctrlTourOp.CookieSave(Response.Cookies(cName))
            ctrlHotel.CookieSave(Response.Cookies(cName))
            Response.Cookies(cName)("txtGroup") = txtGroup.Text
            ctrlCheckIn.SaveCookie(cName)
            ctrlCheckOut.SaveCookie(cName)
            ctrlBkDate.SaveCookie(cName)
            Response.Cookies(cName)("txtBkNumber") = txtBkNumber.Text
            Response.Cookies(cName)("cbIncludeCancelled") = cbIncludeCancelled.Checked
            Response.Cookies(cName)("cbIncludePreinvoiced") = cbIncludePreinvoiced.Checked
            Response.Cookies(cName).Expires = DateTime.Now.AddYears(1)
        End If
    End Sub

    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        pnlCnt.Visible = False

        ctrlTourOp.ClearControl()
        ctrlHotel.ClearControl()
        txtGroup.Text = String.Empty
        ctrlCheckIn.ClearControl()
        ctrlCheckOut.ClearControl()
        ctrlBkDate.ClearControl()
        txtBkNumber.Text = String.Empty
        cbIncludeCancelled.Checked = False
        cbIncludePreinvoiced.Checked = True
    End Sub

    Protected Sub rbType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbType.SelectedIndexChanged
        pnlGroup.Visible = rbType.SelectedValue <> 1
        If Not pnlGroup.Visible Then txtGroup.Text = String.Empty
        pnlCnt.Visible = False
    End Sub

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        pnlCnt.Visible = True
        rptBookings.DataBind()
    End Sub

    Protected Sub btnPrint_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btPrint.Click
        RenderReport()
    End Sub

    Protected Function FilterParam() As String
        Dim pfc As New List(Of String)

        If rbType.SelectedValue = 0 Then
            pfc.Add("All reservations")
        ElseIf rbType.SelectedValue = 1 Then
            pfc.Add("Single reservations")
        ElseIf rbType.SelectedValue = 1 Then
            pfc.Add("Group reservations")
        End If

        If String.IsNullOrEmpty(ctrlTourOp.SelectedTourOp) Then
            If ctrlTourOp.SelectedTourOpKind <> String.Empty Then pfc.Add("for " & ctrlTourOp.SelectedTourOpKindItem.Text & " tour operators")
            If ctrlTourOp.SelectedTourOpGroup <> String.Empty Then pfc.Add("for tour operator group: " & ctrlTourOp.SelectedTourOpGroupItem.Text)
            If ctrlTourOp.SelectedMarket <> String.Empty Then pfc.Add("for market: " & ctrlTourOp.SelectedMarketItem.Text)
            If ctrlTourOp.SelectedPayCond <> String.Empty Then pfc.Add("for pay condition: " & ctrlTourOp.SelectedPayCondItem.Text)
        Else
            pfc.Add("for tour operator: " & ctrlTourOp.SelectedTourOpItem.Text)
        End If

        If String.IsNullOrEmpty(ctrlHotel.SelectedHotel) Then
            If ctrlHotel.SelectedHotelGroup <> String.Empty Then pfc.Add("for hotel group: " & ctrlHotel.SelectedHotelGroupItem.Text)
        Else
            pfc.Add("for hotel: " & ctrlHotel.SelectedHotelItem.Text)
        End If

        If Not String.IsNullOrEmpty(txtGroup.Text) Then pfc.Add("for group code/name (contains): " & txtGroup.Text)

        If Not String.IsNullOrEmpty(ctrlCheckIn.RangeString) Then pfc.Add("for check in: " & ctrlCheckIn.RangeString)
        If Not String.IsNullOrEmpty(ctrlCheckOut.RangeString) Then pfc.Add("for check out: " & ctrlCheckOut.RangeString)
        If Not String.IsNullOrEmpty(ctrlBkDate.RangeString) Then pfc.Add("for bk.date: " & ctrlBkDate.RangeString)

        If Not String.IsNullOrEmpty(txtBkNumber.Text) Then pfc.Add("for bk.number (contains): " & txtBkNumber.Text)

        If cbIncludePreinvoiced.Checked Then
            pfc.Add("with preinvoiced reservations INCLUDED")
        Else
            pfc.Add("with preinvoiced reservations EXCLUDED")
        End If

        If cbIncludeCancelled.Checked Then
            pfc.Add("with canceled reservations INCLUDED")
        Else
            pfc.Add("with canceled reservations EXCLUDED")
        End If

        Dim pfs As String = String.Empty
        pfs = Join(pfc.ToArray, " AND ")

        Return pfs
    End Function

    Protected Sub LogReport(ByVal logState As String, ByVal logText As String)
        Dim l As New LogApp
        l.LogUserAction(My.User.Name, LogApp.objRpt, "Proforma Production Printout", logState, logText)
    End Sub

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
        lr.ReportPath = "Proforma/ProformaProduction.rdlc"

        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsProformaSearch_InvRes_Production", dsFiltered))

        Dim pUser As New ReportParameter("user", My.User.Name)
        Dim pFilter As New ReportParameter("filter", FilterParam())

        Dim p As ReportParameter() = {pUser, pFilter}
        lr.SetParameters(p)

        Try
            Response.ClearContent()
            Response.ClearHeaders()

            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Proforma Production.xls" + """")

            Response.BinaryWrite(bytes)
            Response.Flush()
            'Response.Close()
            Response.End()
            Me.LogReport(LogApp.stateComplete, String.Format("Report rendering finished in {0} sec.", DateDiff(DateInterval.Second, tStart, Now)))
        Catch ex As Exception
            Me.LogReport(LogApp.stateError, String.Format("Report rendering error: {0}", ex.Message))
            msgPop.ShowError(ex.InnerException)
        End Try
    End Sub

End Class
