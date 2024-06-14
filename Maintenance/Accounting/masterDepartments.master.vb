
Partial Class Maintenance_Accounting_masterDepartments
    Inherits System.Web.UI.MasterPage

    Protected Sub AccountContent_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles AccountContent.Load
        For Each i As MenuItem In LocalMenu.Items
            i.Selected = i.NavigateUrl.StartsWith(AccountContent.Page.AppRelativeVirtualPath)
            i.Enabled = Not i.NavigateUrl.StartsWith(AccountContent.Page.AppRelativeVirtualPath)
        Next
    End Sub
End Class

