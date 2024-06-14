
Partial Class Maintenance_Accounting_AccPeriod
    Inherits System.Web.UI.MasterPage

    Protected Sub AccountContent_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles AccountContent.Load
        For Each i As MenuItem In LocalMenu.Items
            i.Selected = i.NavigateUrl.StartsWith(AccountContent.Page.AppRelativeVirtualPath)
            i.Enabled = Not i.NavigateUrl.StartsWith(AccountContent.Page.AppRelativeVirtualPath)
        Next
        If Not AccountContent.Page.AppRelativeVirtualPath.StartsWith("~/Maintenance/Accounting/AccPeriodCCIAll.aspx") Then
            If LocalMenu.Items(1).Value = "AAP" Then LocalMenu.Items.RemoveAt(1)
        End If
    End Sub
End Class

