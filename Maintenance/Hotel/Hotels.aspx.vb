
Partial Class Maintenance_Hotel_Hotels
    Inherits System.Web.UI.Page

    Protected Sub btnSerch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSerch.Click
        Me.Response.Redirect("~/Maintenance/Hotel/HotelDetail.aspx?HotelID=" & ddlHotels.SelectedValue)
    End Sub

    Protected Sub gvHotels_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvHotels.RowCommand
        Me.Response.Redirect("~/Maintenance/Hotel/HotelDetail.aspx?HotelID=" & e.CommandArgument)
    End Sub

    Protected Sub linkNew_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles linkNew.Click
        Response.Redirect("~/Maintenance/Hotel/HotelDetail.aspx?HotelID=0")
    End Sub
End Class
