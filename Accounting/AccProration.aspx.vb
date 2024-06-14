
Partial Class Accounting_AccProration
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim cName As String = "AccProration$_" & Membership.GetUser.UserName
        If Not Me.IsPostBack Then
            Dim q As New dsAccProrationTableAdapters.QueriesTableAdapter
            hfUser.Value = My.User.Name
            hfProLimit.Value = q.ProrationLimit
            hfProrationID.Value = (New Guid).ToString
            ctr_transDate.DateValue = q.TransDate(My.User.Name)

            If Request.Cookies(cName) IsNot Nothing Then
                ctrlHotel.CookieLoad(Request.Cookies(cName))
                ctrlTourOp.CookieLoad(Request.Cookies(cName))
                ctrlCheckIn.LoadCookie(cName)
                ctrlInvNum.LoadCookie(cName)
                ctrlFolio.LoadCookie(cName)
                txtBkNum.Text = Request.Cookies(cName)(txtBkNum.ID & "BkNum")
            End If

            'hfProrationID.Value = "26CE6F7A-99FA-4DD5-BA94-4947F6629462"
            'pnlReport.Visible = True

        End If
    End Sub

    Protected Function ProLimit(ByVal stayBalance As Decimal) As Decimal
        Dim v As Decimal = hfProLimit.Value
        If stayBalance < v Then v = stayBalance
        Return v
    End Function

    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        ctrlHotel.ClearControl()
        ctrlTourOp.ClearControl()
        ctrlCheckIn.ClearControl()
        ctrlInvNum.ClearControl()
        ctrlFolio.ClearControl()
        txtBkNum.Text = String.Empty
        pnlApplication.Visible = False

    End Sub

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        Dim cName As String = "AccProration$_" & Membership.GetUser.UserName
        ctrlHotel.CookieSave(Response.Cookies(cName))
        ctrlTourOp.CookieSave(Response.Cookies(cName))
        ctrlCheckIn.SaveCookie(cName)
        ctrlInvNum.SaveCookie(cName)
        ctrlFolio.SaveCookie(cName)
        Response.Cookies(cName)(txtBkNum.ID & "BkNum") = txtBkNum.Text

        pnlApplication.Visible = True
        lblPrHotel.Text = ctrlHotel.SelectedHotelItem.Text
        lblPrTourOp.Text = ctrlTourOp.SelectedTourOpItem.Text
        dsProration.DataBind()
    End Sub

    Protected Sub dsBookings_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles dsBookings.ItemDataBound
        Dim r As DataListItem = e.Item
        Dim l As RangeValidator = r.FindControl("rng_txt_detailAmount")
        If l IsNot Nothing Then
            Dim txtAmount As TextBox = r.FindControl("txt_detailAmount")
            Dim imgSet As ImageButton = r.FindControl("btSetAmount")
            Dim imgRSet As ImageButton = r.FindControl("btResetAmount")

            Dim m As Decimal = l.MaximumValue
            txtAmount.Attributes.Add("onchange", "changedText(this)")
            imgSet.OnClientClick = String.Format("amountSet('{0}','{1}'); return false;", txtAmount.ClientID, m.ToString("F2"))
            imgRSet.OnClientClick = String.Format("amountSet('{0}','0.00'); return false;", txtAmount.ClientID)

            Dim hfPm As HiddenField = r.FindControl("hfPayMode")
            Dim dlPm As DropDownList = r.FindControl("dlPayMode")
            Dim txtRef As TextBox = r.FindControl("txt_detailRef")
            hfPm.Value = String.Format("({0})", dlPm.SelectedValue.Trim)
            txtRef.Text = String.Format("({0}) {1}", dlPm.SelectedValue.Trim, txtRef.Text)
            dlPm.Attributes.Add("onchange", String.Format("changePayMode(this,'{0}','{1}')", txtRef.ClientID, hfPm.ClientID))
        End If
    End Sub

    Protected Sub btnApply_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnApply.Click
        Dim DepID As Integer? = Nothing
        Dim EmpID As Integer? = Nothing
        Dim ProID As Guid = Guid.NewGuid
        Dim TransDate As Date = ctr_transDate.DateValue
        Dim q As New dsAccProrationTableAdapters.QueriesTableAdapter

        If Not String.IsNullOrEmpty(ddlDep.SelectedValue) Then DepID = ddlDep.SelectedValue
        If Not String.IsNullOrEmpty(ddlEmp.SelectedValue) Then EmpID = ddlEmp.SelectedValue

        For Each i As DataListItem In dsBookings.Items
            Dim DetailAmount = CType(i.FindControl("txt_detailAmount"), TextBox).Text
            If DetailAmount > 0 Then
                Dim FtID = CType(i.FindControl("hfFtID"), HiddenField).Value
                Dim DetailID = CType(i.FindControl("hfDetailID"), HiddenField).Value
                Dim PayModeID As String = CType(i.FindControl("dlPayMode"), DropDownList).SelectedValue
                Dim DetailRef As String = CType(i.FindControl("txt_detailRef"), TextBox).Text

                q.AccApplicationProrate(ProID, My.User.Name, FtID, DetailID, TransDate, PayModeID, DetailRef, DetailAmount, DepID, EmpID)
            End If
        Next
        hfProrationID.Value = ProID.ToString
        btnClear.Enabled = False
        btnSearch.Enabled = False
        pnlApplication.Visible = False
        pnlReport.Visible = True
    End Sub

    Protected Sub btnPrint_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrint.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()
        Dim user As String = Membership.GetUser.UserName
        Dim asdate As String = Nothing
        Dim lr As New Microsoft.Reporting.WebForms.LocalReport

        lr.ReportPath = "Reports\Accounting\RptProrateBatchBooking.rdlc"
        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsAccProration_SelectAccProrateBatchBooking", dsBatchReport))

        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim photel As New ReportParameter("hotel", False)
        Dim p As ReportParameter() = {puser, photel}
        lr.SetParameters(p)

        bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)

        Response.ClearContent()
        Response.ClearHeaders()
        Response.ContentType = "application/pdf"
        Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Prorate Batch.pdf" + """")
        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Sub btnNew_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNew.Click
        Response.Redirect("~/Accounting/AccProration.aspx")
    End Sub
End Class
