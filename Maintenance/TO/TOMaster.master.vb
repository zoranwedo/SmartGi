
Partial Class Maintenance_TO_TOMaster
    Inherits System.Web.UI.MasterPage

    'Protected Sub TOMenu_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles TOMenu.Load
    '    If Not Page.IsPostBack Then
    '        For Each i As MenuItem In TOMenu.Items
    '            i.NavigateUrl &= "?TOID=" & Request.QueryString(0)
    '        Next
    '    End If
    'End Sub

    'Protected Sub TOContent_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles TOContent.Load
    '    For Each i As MenuItem In TOMenu.Items
    '        i.Selected = i.NavigateUrl.StartsWith(TOContent.Page.AppRelativeVirtualPath)
    '        i.Enabled = Not i.NavigateUrl.StartsWith(TOContent.Page.AppRelativeVirtualPath)
    '    Next
    'End Sub

    Protected Sub TOMenu_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        If Not Page.IsPostBack Then
            Dim TOMenu As Menu = fvMaster.FindControl("TOMenu")
            For Each i As MenuItem In TOMenu.Items
                i.NavigateUrl &= "?TOID=" & Request.QueryString(0)
            Next
        End If
    End Sub

    Protected Sub TOContent_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles TOContent.Load
        Dim TOMenu As Menu = fvMaster.FindControl("TOMenu")
        If Request.QueryString(0) <> 0 Then
            For Each i As MenuItem In TOMenu.Items
                i.Selected = i.NavigateUrl.StartsWith(TOContent.Page.AppRelativeVirtualPath)
                i.Enabled = Not i.NavigateUrl.StartsWith(TOContent.Page.AppRelativeVirtualPath)
            Next
        Else
            For Each i As MenuItem In TOMenu.Items
                i.Selected = i.NavigateUrl.StartsWith(TOContent.Page.AppRelativeVirtualPath)
                i.Enabled = False
            Next
        End If
    End Sub
End Class

