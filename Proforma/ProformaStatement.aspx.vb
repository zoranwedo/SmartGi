
Partial Class Proforma_ProformaStatement
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
    End Sub

    Protected Sub btClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btClear.Click
        ctrlTourOp.ClearControl()
        ctrlHotel.ClearControl()
        txtGroup.Text = String.Empty
        ctrlNum.ClearControl()
        ctrlCheckIn.ClearControl()
    End Sub

    Protected Sub btReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btReport.Click
        SaveCookie()
        RenderReport()
    End Sub

    Protected Sub FormCookie()
        Dim cName As String = "ProformaStatement$_" & Membership.GetUser.UserName
        If (Request.Cookies(cName) IsNot Nothing) Then
            If Not Me.IsPostBack Then
                Try
                    If (Request.Cookies(cName)("rbType") IsNot Nothing) Then rbType.SelectedValue = Request.Cookies(cName)("rbType")
                    ctrlTourOp.CookieLoad(Request.Cookies(cName))
                    ctrlHotel.CookieLoad(Request.Cookies(cName))
                    If (Request.Cookies(cName)("txtGroup") IsNot Nothing) Then txtGroup.Text = Request.Cookies(cName)("txtGroup")
                    ctrlNum.LoadCookie(cName)
                    ctrlCheckIn.LoadCookie(cName)
                    If (Request.Cookies(cName)("cbDetail") IsNot Nothing) Then cbDetail.Checked = Request.Cookies(cName)("cbDetail")
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
            Response.Cookies(cName)("cbDetail") = cbDetail.Checked
            Response.Cookies(cName).Expires = DateTime.Now.AddYears(1)
        End If
    End Sub

    Protected Sub SaveCookie()
        Dim cName As String = "ProformaStatement$_" & Membership.GetUser.UserName
        Response.Cookies(cName)("rbType") = rbType.SelectedValue
        ctrlTourOp.CookieSave(Response.Cookies(cName))
        ctrlHotel.CookieSave(Response.Cookies(cName))
        Response.Cookies(cName)("txtGroup") = txtGroup.Text
        ctrlNum.SaveCookie(cName)
        ctrlCheckIn.SaveCookie(cName)
        Response.Cookies(cName)("cbDetail") = cbDetail.Checked
        Response.Cookies(cName).Expires = DateTime.Now.AddYears(1)
    End Sub

    Protected Sub RenderReport()
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()

        Dim rName = "Proforma\ProformaStatement{0}{1}.rdlc"
        Dim rDetail As String
        Dim rType As String

        If cbDetail.Checked Then
            rDetail = "Detail"
            rType = IIf(rbType.SelectedValue = 0, "All", IIf(rbType.SelectedValue = 1, "Single", "Group"))
        Else
            rDetail = ""
            rType = IIf(rbType.SelectedValue = 0, "All", IIf(rbType.SelectedValue = 1, "Single", "Group"))
        End If

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = String.Format(rName, rDetail, rType)

        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsProformaApplication_InvDocStatementDetail", dsFilteredProforma))

        Dim p_user As New ReportParameter("user", My.User.Name)
        Dim p_filter As New ReportParameter("filter", FilterParam)
        Dim p As ReportParameter() = {p_user, p_filter}
        lr.SetParameters(p)

        Try
            Response.ClearContent()
            Response.ClearHeaders()

            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Proforma Payment Statement.xls" + """")

            Response.BinaryWrite(bytes)
            Response.Flush()
            'Response.Close()
            Response.End()
        Catch ex As Exception
            msgPop.ShowError(ex)
        End Try
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

        If ctrlTourOp.SelectedTourOp <> String.Empty Then
            pfc.Add("for tour operator: " & ctrlTourOp.SelectedTourOpItem.Text)
        Else
            If ctrlTourOp.SelectedTourOpKind <> String.Empty Then pfc.Add("for " & ctrlTourOp.SelectedTourOpKindItem.Text & " tour operators")
            If ctrlTourOp.SelectedTourOpGroup <> String.Empty Then pfc.Add("for tour operator group: " & ctrlTourOp.SelectedTourOpGroupItem.Text)
            If ctrlTourOp.SelectedMarket <> String.Empty Then pfc.Add("for market: " & ctrlTourOp.SelectedMarketItem.Text)
            If ctrlTourOp.SelectedPayCond <> String.Empty Then pfc.Add("for pay condition: " & ctrlTourOp.SelectedPayCondItem.Text)
        End If
        If ctrlHotel.SelectedHotel <> String.Empty Then
            pfc.Add("for hotel: " & ctrlHotel.SelectedHotelItem.Text)
        Else
            If ctrlHotel.SelectedHotelGroup <> String.Empty Then pfc.Add("for hotel group: " & ctrlHotel.SelectedHotelGroupItem.Text)
        End If
        If Not String.IsNullOrEmpty(txtGroup.Text) Then pfc.Add(String.Format("for group codes contains: {0}", txtGroup.Text))
        If Not String.IsNullOrEmpty(ctrlNum.RangeString) Then pfc.Add(String.Format("for proforma numbers: {0}", ctrlNum.RangeString))
        If Not String.IsNullOrEmpty(ctrlCheckIn.RangeString) Then pfc.Add(String.Format("for check ins: {0}", ctrlCheckIn.RangeString))

        Dim pfs As String = String.Empty
        If pfc.Count > 0 Then
            pfs = Join(pfc.ToArray, " AND ")
            pfs = pfs.Substring(0, 1).ToUpper & pfs.Substring(1)
        End If

        Return pfs
    End Function

    Protected Sub dsFilteredProforma_ObjectCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceEventArgs) Handles dsFilteredProforma.ObjectCreated
        Dim ta As dsProformaApplicationTableAdapters.InvDocStatementDetailTableAdapter
        ta = e.ObjectInstance
        ta.SetTimeout(ReportFilterClass.ReportTimeout("Reports_Invoices_InvoiceJournal_Rate"))
    End Sub

End Class
