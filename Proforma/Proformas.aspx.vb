
Partial Class Proforma_Proformas
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

    Protected Sub rbType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rbType.SelectedIndexChanged
        pnlGroup.Visible = rbType.SelectedValue <> 1
        If Not pnlGroup.Visible Then txtGroup.Text = String.Empty
        pnlCnt.Visible = False
    End Sub

    Protected Sub btnGoTo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGoTo.Click
        If txtInvID.HasValue Then
            Dim q As New dsProformaTableAdapters.ProformaSearchTableAdapter
            Dim t As dsProforma.ProformaSearchDataTable = q.GetDataByID(txtInvID.IntegerValue)
            If t.Count > 0 Then
                Response.Redirect("~/Proforma/ProformDetails.aspx?ProformaID=" & txtInvID.TextValue)
            Else
                txtInvID.ClearControl()
            End If
        End If
    End Sub

    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        pnlCnt.Visible = False

        txtInvID.ClearControl()
        ctrlTourOp.ClearControl()
        ctrlHotel.ClearControl()
        txtGroup.Text = String.Empty
        ctrlNum.ClearControl()
        ctrlCheckIn.ClearControl()
        ctrlCheckOut.ClearControl()
        ctrlBkDate.ClearControl()
        txtBkNumber.Text = String.Empty
        ddlStates.SelectedIndex = 0
    End Sub

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        'MsgBox("BANG!")
        pnlCnt.Visible = True
        rptProforma.DataBind()
    End Sub

    Protected Sub FormCookie()
        Dim cName As String = "Proforma$_" & Membership.GetUser.UserName
        If (Request.Cookies(cName) IsNot Nothing) Then
            If Not Me.IsPostBack Then
                Try
                    If (Request.Cookies(cName)("rbType") IsNot Nothing) Then rbType.SelectedValue = Request.Cookies(cName)("rbType")
                    ctrlTourOp.CookieLoad(Request.Cookies(cName))
                    ctrlHotel.CookieLoad(Request.Cookies(cName))
                    If (Request.Cookies(cName)("txtGroup") IsNot Nothing) Then txtGroup.Text = Request.Cookies(cName)("txtGroup")
                    ctrlNum.LoadCookie(cName)
                    ctrlCheckIn.LoadCookie(cName)
                    ctrlCheckOut.LoadCookie(cName)
                    If (Request.Cookies(cName)("ctrlBkDate") IsNot Nothing) Then ctrlBkDate.TextValue = Request.Cookies(cName)("ctrlBkDate")
                    If (Request.Cookies(cName)("txtBkNumber") IsNot Nothing) Then txtBkNumber.Text = Request.Cookies(cName)("txtBkNumber")
                    If (Request.Cookies(cName)("ddlStates") IsNot Nothing) Then ddlStates.SelectedValue = Request.Cookies(cName)("ddlStates")
                Catch ex As Exception
                End Try
            End If
        End If

        If Me.IsPostBack Then
            Response.Cookies(cName)("rbType") = rbType.SelectedValue
            ctrlTourOp.CookieSave(Response.Cookies(cName))
            ctrlHotel.CookieSave(Response.Cookies(cName))
            Response.Cookies(cName)("txtGroup") = txtGroup.Text
            ctrlNum.SaveCookie(cName)
            ctrlCheckIn.SaveCookie(cName)
            ctrlCheckOut.SaveCookie(cName)
            Response.Cookies(cName)("ctrlBkDate") = ctrlBkDate.TextValue
            Response.Cookies(cName)("txtBkNumber") = txtBkNumber.Text
            Response.Cookies(cName)("ddlStates") = ddlStates.SelectedValue
            Response.Cookies(cName).Expires = DateTime.Now.AddYears(1)
        End If
    End Sub

    Public Function GetCheckDates(ByVal chFrom As String, ByVal chTo As String) As String
        Dim b As Integer = 0
        Dim r As String
        If Not String.IsNullOrEmpty(chFrom) Then b = b + 1
        If Not String.IsNullOrEmpty(chTo) Then b = b + 10

        Select Case b
            Case 0 : r = "any"
            Case 1 : r = String.Format("from {0}", chFrom)
            Case 10 : r = String.Format("to {0}", chTo)
            Case 11 : r = String.Format("{0} - {1}", chFrom, chTo)
            Case Else : r = "error"
        End Select

        Return r
    End Function

    Protected Sub btSingle_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btSingle.Click
        Response.Redirect("~/Proforma/ProCreateSingleNew.aspx")
    End Sub

    Protected Sub btGroup_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btGroup.Click
        Response.Redirect("~/Proforma/ProCreateGroup.aspx")
    End Sub

    Protected Sub btGroupMulti_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btGroupMulti.Click
        Response.Redirect("~/Proforma/ProCreateGroupMulti.aspx")
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

        If Not String.IsNullOrEmpty(ctrlNum.RangeString) Then pfc.Add("for numbers: " & ctrlNum.RangeString)
        If Not String.IsNullOrEmpty(ctrlCheckIn.RangeString) Then pfc.Add("for check in: " & ctrlCheckIn.RangeString)
        If Not String.IsNullOrEmpty(ctrlCheckOut.RangeString) Then pfc.Add("for check out: " & ctrlCheckOut.RangeString)
        If ctrlBkDate.HasValue Then pfc.Add("for bk.date: " & ctrlBkDate.TextValue)
        If Not String.IsNullOrEmpty(txtBkNumber.Text) Then pfc.Add("for bk.number (contains): " & txtBkNumber.Text)

        If ddlStates.SelectedIndex > 0 Then
            If ddlStates.SelectedValue = 0 Then
                pfc.Add("only 'Created'")
            ElseIf ddlStates.SelectedValue = 1 Then
                pfc.Add("only 'Modified'")
            ElseIf ddlStates.SelectedValue = 2 Then
                pfc.Add("only 'Definitive'")
            ElseIf ddlStates.SelectedValue = 3 Then
                pfc.Add("only 'Not Definitive'")
            End If
        End If

        Dim pfs As String = String.Empty
        pfs = Join(pfc.ToArray, " AND ")

        Return pfs
    End Function

    Protected Sub LogReport(ByVal logState As String, ByVal logText As String)
        Dim l As New LogApp
        l.LogUserAction(My.User.Name, LogApp.objRpt, "Proformas Printout", logState, logText)
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
        lr.ReportPath = "Proforma/Proformas.rdlc"

        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsProformaSearch_InvDocSearch", dsFiltered))

        Dim pUser As New ReportParameter("user", My.User.Name)
        Dim pFilter As New ReportParameter("filter", FilterParam())

        Dim p As ReportParameter() = {pUser, pFilter}
        lr.SetParameters(p)

        Try
            Response.ClearContent()
            Response.ClearHeaders()

            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Proformas.xls" + """")

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
