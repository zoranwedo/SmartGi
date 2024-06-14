
Partial Class Contracts_Groups
    Inherits System.Web.UI.Page

    Protected Sub SpecialCookie()
        Dim cName As String = "Groups_" & Membership.GetUser.UserName
        If (Request.Cookies(cName) IsNot Nothing) Then
            If Not Me.IsPostBack Then
                Try
                    If (Request.Cookies(cName)("GroupHotel") IsNot Nothing) Then _
                        ddlHotel.SelectedIndex = Integer.Parse(Request.Cookies(cName)("GroupHotel"))
                    If (Request.Cookies(cName)("GroupTitle") IsNot Nothing) Then _
                        fltTitle.Text = Request.Cookies(cName)("GroupTitle")
                    If (Request.Cookies(cName)("GroupBook") IsNot Nothing) Then _
                        Me.fltBookingCode.Text = Request.Cookies(cName)("GroupBook")
                    If (Request.Cookies(cName)("GroupBkStart") IsNot Nothing) Then _
                        fltStart.Text = Request.Cookies(cName)("GroupBkStart")
                    If (Request.Cookies(cName)("GroupBkFinish") IsNot Nothing) Then _
                        fltFinish.Text = Request.Cookies(cName)("GroupBkFinish")

                    'If (Request.Cookies(cName)("SpecPage") IsNot Nothing) Then _
                    '    gvSpecials.PageIndex = Integer.Parse(Request.Cookies(cName)("SpecPage"))
                    'If (Request.Cookies(cName)("SpecIndex") IsNot Nothing) Then _
                    '    gvSpecials.SelectedIndex = Integer.Parse(Request.Cookies(cName)("SpecIndex"))
                Catch ex As Exception
                End Try
            End If
        End If

        If Me.IsPostBack Then
            Response.Cookies(cName)("GroupHotel") = ddlHotel.SelectedIndex.ToString
            Response.Cookies(cName)("GroupTitle") = fltTitle.Text
            Response.Cookies(cName)("GroupBook") = fltBookingCode.Text
            Response.Cookies(cName)("GroupBkStart") = fltStart.Text
            Response.Cookies(cName)("GroupBkFinish") = fltFinish.Text

            'Response.Cookies(cName)("SpecPage") = gvSpecials.PageIndex.ToString
            'Response.Cookies(cName)("SpecIndex") = gvSpecials.SelectedIndex.ToString
            Response.Cookies(cName).Expires = DateTime.Now.AddDays(1)
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        hfUsername.Value = Membership.GetUser.UserName
        SpecialCookie()
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        dsFilteredGroups.Select()
        pnlGroups.Visible = True
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        pnlGroups.Visible = False
        txtGroupID.Text = Nothing
        fltStart.Text = Nothing
        fltFinish.Text = Nothing
        fltBookingCode.Text = Nothing
        fltTitle.Text = Nothing
        ddlHotel.SelectedValue = ""
    End Sub

    Protected Sub gvSpecGroup_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvSpecGroup.RowCommand
        If e.CommandName = "Details" Then
            Me.Response.Redirect("~/Contracts/Special/SpecialGroup.aspx?SpecGroupID=" & e.CommandArgument)
        End If
    End Sub

    Protected Sub btnSerch_Click(sender As Object, e As System.EventArgs) Handles btnSerch.Click
        Dim Str As String = txtGroupID.Text()
        If Not String.IsNullOrEmpty(Str) Then
            Dim q As New dsSpecAssociationTableAdapters.QueriesTableAdapter
            Dim t As Integer = q.GroupExists(Str).Value

            If t <> 0 Then
                Response.Redirect("~/Contracts/Special/SpecialGroup.aspx?SpecGroupID=" & Str)
            End If
        End If
    End Sub
End Class
