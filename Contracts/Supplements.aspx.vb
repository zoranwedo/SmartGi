
Partial Class Contracts_Supplements
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        hfUsername.Value = My.User.Name
        SupplementCookie()
    End Sub

    Protected Sub btnSerch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSerch.Click
        If Not String.IsNullOrEmpty(txtSuppID.Text) Then
            Response.Redirect("~/Contracts/Supplements/Detail.aspx?SupplementID=" + txtSuppID.Text)
        End If
    End Sub

    Protected Sub gvSupplements_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvSupplements.RowCommand
        If e.CommandName = "Details" Then Me.Response.Redirect("~/Contracts/Supplements/Detail.aspx?SupplementID=" & e.CommandArgument)
    End Sub

    Protected Sub linkNew_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles linkNew.Click
        Response.Redirect("~/Contracts/Supplements/Detail.aspx?SupplementID=0")
    End Sub

    Protected Sub btnFilter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnFilter.Click
        txtSuppID.Text = Nothing
        dsFilteredSupplements.Select()
        pnlCnt.Visible = True
    End Sub

    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        pnlCnt.Visible = False

        txtSuppID.Text = Nothing
        ddlHotel.SelectedIndex = 0
        fltRateCode.Text = Nothing
        ddlCategory.SelectedIndex = 0
        fltTitle.Text = Nothing
        fltStart.Text = Nothing
        fltFinish.Text = Nothing
        fltBkStart.Text = Nothing
        fltBkFinish.Text = Nothing
        fltBkCode.Text = Nothing
        fltIsPercent.SelectedIndex = 0
        fltPerPax.SelectedIndex = 0
        fltPerDay.SelectedIndex = 0
        ddlState.SelectedIndex = 0
        fltRateRecieved.Text = Nothing
        ddlTO.SelectedIndex = 0
    End Sub

    Protected Sub SupplementCookie()
        Dim cName As String = "Supplements_" & My.User.Name
        If (Request.Cookies(cName) IsNot Nothing) Then
            If Not Me.IsPostBack Then
                Try
                    If (Request.Cookies(cName)("SuppHotel") IsNot Nothing) Then _
                        ddlHotel.SelectedIndex = Integer.Parse(Request.Cookies(cName)("SuppHotel"))
                    If (Request.Cookies(cName)("SuppRateCode") IsNot Nothing) Then _
                        fltRateCode.Text = Request.Cookies(cName)("SuppRateCode")
                    If (Request.Cookies(cName)("SuppCategory") IsNot Nothing) Then _
                        ddlCategory.SelectedIndex = Integer.Parse(Request.Cookies(cName)("SuppCategory"))
                    If (Request.Cookies(cName)("SuppTitle") IsNot Nothing) Then _
                        fltTitle.Text = Request.Cookies(cName)("SuppTitle")
                    If (Request.Cookies(cName)("SuppStart") IsNot Nothing) Then _
                        fltStart.Text = Request.Cookies(cName)("SuppStart")
                    If (Request.Cookies(cName)("SuppFinish") IsNot Nothing) Then _
                        fltFinish.Text = Request.Cookies(cName)("SuppFinish")
                    If (Request.Cookies(cName)("SuppBkStart") IsNot Nothing) Then _
                        fltBkStart.Text = Request.Cookies(cName)("SuppBkStart")
                    If (Request.Cookies(cName)("SuppBkFinish") IsNot Nothing) Then _
                        fltBkFinish.Text = Request.Cookies(cName)("SuppBkFinish")
                    If (Request.Cookies(cName)("SuppBook") IsNot Nothing) Then _
                        fltBkCode.Text = Request.Cookies(cName)("SuppBook")
                    If (Request.Cookies(cName)("SuppIsPercent") IsNot Nothing) Then _
                        fltIsPercent.SelectedIndex = Integer.Parse(Request.Cookies(cName)("SuppIsPercent"))
                    If (Request.Cookies(cName)("SuppPerPax") IsNot Nothing) Then _
                        fltPerPax.SelectedIndex = Integer.Parse(Request.Cookies(cName)("SuppPerPax"))
                    If (Request.Cookies(cName)("SuppPerDay") IsNot Nothing) Then _
                        fltPerDay.SelectedIndex = Integer.Parse(Request.Cookies(cName)("SuppPerDay"))
                    If (Request.Cookies(cName)("SuppState") IsNot Nothing) Then _
                      ddlState.SelectedIndex = Integer.Parse(Request.Cookies(cName)("SuppState"))
                    If (Request.Cookies(cName)("SuppRecieved") IsNot Nothing) Then _
                        fltRateRecieved.Text = Request.Cookies(cName)("SuppRecieved")
                    If (Request.Cookies(cName)("SuppTourOp") IsNot Nothing) Then _
                        ddlTO.SelectedIndex = Integer.Parse(Request.Cookies(cName)("SuppTourOp"))

                    If (Request.Cookies(cName)("SuppPage") IsNot Nothing) Then _
                        gvSupplements.PageIndex = Integer.Parse(Request.Cookies(cName)("SuppPage"))
                    If (Request.Cookies(cName)("SuppIndex") IsNot Nothing) Then _
                        gvSupplements.SelectedIndex = Integer.Parse(Request.Cookies(cName)("SuppIndex"))
                Catch ex As Exception
                End Try
            End If
        End If

        If Me.IsPostBack Then
            Response.Cookies(cName)("SuppHotel") = ddlHotel.SelectedIndex.ToString
            Response.Cookies(cName)("SuppRateCode") = fltRateCode.Text
            Response.Cookies(cName)("SuppCategory") = ddlCategory.SelectedIndex.ToString
            Response.Cookies(cName)("SuppTitle") = fltTitle.Text
            Response.Cookies(cName)("SuppStart") = fltStart.Text
            Response.Cookies(cName)("SuppFinish") = fltFinish.Text
            Response.Cookies(cName)("SuppBkStart") = fltBkStart.Text
            Response.Cookies(cName)("SuppBkFinish") = fltBkFinish.Text
            Response.Cookies(cName)("SuppBook") = fltBkCode.Text
            Response.Cookies(cName)("SuppIsPercent") = fltIsPercent.SelectedIndex.ToString
            Response.Cookies(cName)("SuppPerPax") = fltPerPax.SelectedIndex.ToString
            Response.Cookies(cName)("SuppPerDay") = fltPerDay.SelectedIndex.ToString
            Response.Cookies(cName)("SuppState") = ddlState.SelectedIndex.ToString
            Response.Cookies(cName)("SuppRecieved") = fltRateRecieved.Text
            Response.Cookies(cName)("SuppTourOp") = ddlTO.SelectedIndex.ToString

            Response.Cookies(cName)("SuppPage") = gvSupplements.PageIndex.ToString
            Response.Cookies(cName)("SuppIndex") = gvSupplements.SelectedIndex.ToString
            Response.Cookies(cName).Expires = DateTime.Now.AddDays(1)
        End If
    End Sub
End Class
