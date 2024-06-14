
Partial Class Maintenance_Reservations_masterRes
    Inherits System.Web.UI.MasterPage

    Protected Sub ResContent_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles ResContent.Load
        For Each i As MenuItem In LocalMenu.Items
            i.Selected = i.NavigateUrl.StartsWith(ResContent.Page.AppRelativeVirtualPath)
            i.Enabled = Not i.NavigateUrl.StartsWith(ResContent.Page.AppRelativeVirtualPath)
        Next
    End Sub
End Class

