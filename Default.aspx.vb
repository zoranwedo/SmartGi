
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Panel1.Visible = ModificationRights.RightsAdmin
    End Sub
End Class
