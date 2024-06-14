
Partial Class Contracts_masterNewCnt
    Inherits System.Web.UI.MasterPage

    Protected Sub CreateCntContent_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles CreateCntContent.Load
        For Each i As MenuItem In LocalMenu.Items
            i.Selected = i.NavigateUrl.StartsWith(CreateCntContent.Page.AppRelativeVirtualPath)
            i.Enabled = Not i.NavigateUrl.StartsWith(CreateCntContent.Page.AppRelativeVirtualPath)
        Next
    End Sub
End Class

