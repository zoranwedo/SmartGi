
Partial Class Maintenance_Hotel_masterHotels
    Inherits System.Web.UI.MasterPage

    Protected Sub HotelContent_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles HotelContent.Load
        For Each i As MenuItem In LocalMenu.Items
            i.Selected = i.NavigateUrl.StartsWith(HotelContent.Page.AppRelativeVirtualPath)
            i.Enabled = Not i.NavigateUrl.StartsWith(HotelContent.Page.AppRelativeVirtualPath)
        Next
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            For Each i As MenuItem In LocalMenu.Items
                i.NavigateUrl &= "?HotelID=" & Request.QueryString(0)
            Next
        End If
    End Sub
End Class

