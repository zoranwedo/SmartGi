
Partial Class Contracts_Specials
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        hfUsername.Value = My.User.Name
        SpecialCookie()
    End Sub

    Protected Sub btnSerch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSerch.Click
        If Not (String.IsNullOrEmpty(txtSpecID.Text)) Then
            Response.Redirect("~/Contracts/Special/DetailSpec.aspx?SpecialID=" & txtSpecID.Text)
        End If
    End Sub

    Protected Sub gvSpecials_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvSpecials.RowCommand
        If e.CommandName = "Details" Then Me.Response.Redirect("~/Contracts/Special/DetailSpec.aspx?SpecialID=" & e.CommandArgument)
    End Sub

    Protected Sub linkNew_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles linkNew.Click
        Response.Redirect("~/Contracts/Special/DetailSpec.aspx?SpecialID=0")
    End Sub

    Protected Sub btnFilter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnFilter.Click
        txtSpecID.Text = Nothing
        dsFilteredSpecials.Select()
        pnlCnt.Visible = True
    End Sub

    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        pnlCnt.Visible = False

        txtSpecID.Text = Nothing
        ddlHotel.SelectedIndex = 0
        fltRateCode.Text = Nothing
        ddlRateType.SelectedIndex = 0
        fltTitle.Text = Nothing
        fltStart.Text = Nothing
        fltFinish.Text = Nothing
        fltBkStart.Text = Nothing
        fltBkFinish.Text = Nothing
        fltBkCode.Text = Nothing
        ddlDiscount.SelectedIndex = 0
        ddlState.SelectedIndex = 0
        fltRateRecieved.Text = Nothing
        ddlTO.SelectedIndex = 0
    End Sub

    Protected Sub SpecialCookie()
        Dim cName As String = "Specials_" & My.User.Name
        If (Request.Cookies(cName) IsNot Nothing) Then
            If Not Me.IsPostBack Then
                Try
                    If (Request.Cookies(cName)("SpecHotel") IsNot Nothing) Then _
                        ddlHotel.SelectedIndex = Integer.Parse(Request.Cookies(cName)("SpecHotel"))
                    If (Request.Cookies(cName)("SpecRateCode") IsNot Nothing) Then _
                        fltRateCode.Text = Request.Cookies(cName)("SpecRateCode")
                    If (Request.Cookies(cName)("SpecRateType") IsNot Nothing) Then _
                        ddlRateType.SelectedIndex = Integer.Parse(Request.Cookies(cName)("SpecRateType"))
                    If (Request.Cookies(cName)("SpecTitle") IsNot Nothing) Then _
                        fltTitle.Text = Request.Cookies(cName)("SpecTitle")
                    If (Request.Cookies(cName)("SpecStart") IsNot Nothing) Then _
                        fltStart.Text = Request.Cookies(cName)("SpecStart")
                    If (Request.Cookies(cName)("SpecFinish") IsNot Nothing) Then _
                        fltFinish.Text = Request.Cookies(cName)("SpecFinish")
                    If (Request.Cookies(cName)("SpecBkStart") IsNot Nothing) Then _
                        fltBkStart.Text = Request.Cookies(cName)("SpecBkStart")
                    If (Request.Cookies(cName)("SpecBkFinish") IsNot Nothing) Then _
                        fltBkFinish.Text = Request.Cookies(cName)("SpecBkFinish")
                    If (Request.Cookies(cName)("SpecBook") IsNot Nothing) Then _
                        fltBkCode.Text = Request.Cookies(cName)("SpecBook")
                    If (Request.Cookies(cName)("SpecDiscount") IsNot Nothing) Then _
                        ddlDiscount.SelectedIndex = Integer.Parse(Request.Cookies(cName)("SpecDiscount"))
                    If (Request.Cookies(cName)("SpecState") IsNot Nothing) Then _
                      ddlState.SelectedIndex = Integer.Parse(Request.Cookies(cName)("SpecState"))
                    If (Request.Cookies(cName)("SpecRecieved") IsNot Nothing) Then _
                        fltRateRecieved.Text = Request.Cookies(cName)("SpecRecieved")
                    If (Request.Cookies(cName)("SpecTourOp") IsNot Nothing) Then _
                        ddlTO.SelectedIndex = Integer.Parse(Request.Cookies(cName)("SpecTourOp"))

                    If (Request.Cookies(cName)("SpecPage") IsNot Nothing) Then _
                        gvSpecials.PageIndex = Integer.Parse(Request.Cookies(cName)("SpecPage"))
                    If (Request.Cookies(cName)("SpecIndex") IsNot Nothing) Then _
                        gvSpecials.SelectedIndex = Integer.Parse(Request.Cookies(cName)("SpecIndex"))
                Catch ex As Exception
                End Try
            End If
        End If

        If Me.IsPostBack Then
            Response.Cookies(cName)("SpecHotel") = ddlHotel.SelectedIndex.ToString
            Response.Cookies(cName)("SpecRateCode") = fltRateCode.Text
            Response.Cookies(cName)("SpecRateType") = ddlRateType.SelectedIndex.ToString
            Response.Cookies(cName)("SpecTitle") = fltTitle.Text
            Response.Cookies(cName)("SpecStart") = fltStart.Text
            Response.Cookies(cName)("SpecFinish") = fltFinish.Text
            Response.Cookies(cName)("SpecBkStart") = fltBkStart.Text
            Response.Cookies(cName)("SpecBkFinish") = fltBkFinish.Text
            Response.Cookies(cName)("SpecBook") = fltBkCode.Text
            Response.Cookies(cName)("SpecDiscount") = ddlDiscount.SelectedIndex.ToString
            Response.Cookies(cName)("SpecState") = ddlState.SelectedIndex.ToString
            Response.Cookies(cName)("SpecRecieved") = fltRateRecieved.Text
            Response.Cookies(cName)("SpecTourOp") = ddlTO.SelectedIndex.ToString

            Response.Cookies(cName)("SpecPage") = gvSpecials.PageIndex.ToString
            Response.Cookies(cName)("SpecIndex") = gvSpecials.SelectedIndex.ToString
            Response.Cookies(cName).Expires = DateTime.Now.AddDays(1)
        End If
    End Sub
End Class
