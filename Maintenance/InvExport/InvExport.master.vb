
Partial Class Maintenance_InvExport_InvExport
    Inherits System.Web.UI.MasterPage

    Protected Sub ExpContent_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles ExpContent.Load
        For Each i As MenuItem In LocalMenu.Items
            i.Selected = i.NavigateUrl.StartsWith(ExpContent.Page.AppRelativeVirtualPath)
            i.Enabled = Not i.NavigateUrl.StartsWith(ExpContent.Page.AppRelativeVirtualPath)
        Next
    End Sub
End Class

