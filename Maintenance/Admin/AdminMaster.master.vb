
Partial Class Maintenance_Admin_AdminMaster
    Inherits System.Web.UI.MasterPage

    Protected Sub dsUser_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles dsUser.Selecting
        ' e.InputParameters(0) = Membership.GetUser.UserName
        e.InputParameters(0) = Request.QueryString(0)
    End Sub

    Protected Sub LocalMenu_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles LocalMenu.Load
        
        LocalMenu.Items(0).NavigateUrl = "User.aspx?username=" & Request.QueryString(0)

        LocalMenu.Items(1).NavigateUrl = "UserHotels.aspx?username=" & Request.QueryString(0)

        LocalMenu.Items(2).NavigateUrl = "UserTO.aspx?username=" & Request.QueryString(0)

    End Sub

    Protected Sub LocalMenu_MenuItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles LocalMenu.MenuItemDataBound
        
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
End Class

