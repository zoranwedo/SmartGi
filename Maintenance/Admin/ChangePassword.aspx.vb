
Partial Class Maintenance_Admin_ChangePassword
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If ModificationRights.RightsAdmin And Membership.GetUser.UserName <> Request.QueryString(0) Then
            Response.Redirect("~/Maintenance/Admin/ResetPassword.aspx?username=" & Request.QueryString(0))
        Else
            Dim u As String = Membership.GetUser.UserName
            changepass.UserName = u
            lblPassword.Text = "User name:&nbsp;" + u
        End If
    End Sub

    Protected Sub ContinuePushButton_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("~/Maintenance/Admin/User.aspx?username=" & Request.QueryString(0))
    End Sub
End Class
