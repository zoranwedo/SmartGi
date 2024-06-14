
Partial Class Maintenance_Pay_masterPay
    Inherits System.Web.UI.MasterPage

    Protected Sub PayContent_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles PayContent.Load
        For Each i As MenuItem In LocalMenu.Items
            i.Selected = i.NavigateUrl.StartsWith(PayContent.Page.AppRelativeVirtualPath)
            i.Enabled = Not i.NavigateUrl.StartsWith(PayContent.Page.AppRelativeVirtualPath)
        Next

    End Sub
End Class

