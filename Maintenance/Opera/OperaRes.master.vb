
Partial Class Maintenance_Opera_OperaRes
    Inherits System.Web.UI.MasterPage
    Protected Sub PageContent_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles PageContent.Load
        For Each i As MenuItem In LocalMenu.Items
            i.Selected = i.NavigateUrl.StartsWith(PageContent.Page.AppRelativeVirtualPath)
            i.Enabled = Not i.NavigateUrl.StartsWith(PageContent.Page.AppRelativeVirtualPath)
        Next
    End Sub
End Class

