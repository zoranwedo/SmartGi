
Partial Class Maintenance_Admin_ResetPassword
    Inherits System.Web.UI.Page

    Protected Sub popShow(ByVal Title As String, ByVal Message As String)
        popMessage.Text = Message
        popLabel.Text = Title
        popExtender.Show()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        UserName.Text = Request.QueryString(0)
        If Not Me.IsPostBack Then pnSuccess.Visible = False
    End Sub

    Protected Sub ChangePasswordPushButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ChangePasswordPushButton.Click
        Dim u As MembershipUser = Membership.GetUser(Request.QueryString(0))
        Dim cp As String = u.ResetPassword()
        Dim np As String = NewPassword.Text
        Try
            u.ChangePassword(cp, np)
            pnButtons.Visible = False
            pnSuccess.Visible = True
        Catch ex As Exception
            popShow("Error changing password", ex.Message)
        End Try
    End Sub

    Protected Sub SuccessButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SuccessButton.Click, CancelPushButton.Click
        Response.Redirect("~/Maintenance/Admin/User.aspx?username=" & Request.QueryString(0))
    End Sub
End Class
