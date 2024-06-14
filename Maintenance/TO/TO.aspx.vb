
Partial Class Maintenance_TO_TO
    Inherits System.Web.UI.Page

    Protected Function HasNewRights() As Boolean
        Return My.User.IsInRole("admin") _
                Or My.User.IsInRole("tourop_admin") _
                Or My.User.IsInRole("mnt_ttoo") _
                Or My.User.IsInRole("mnt_ttoo_group")
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Button4.Visible = HasNewRights()
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        dsTOSearch.DataBind()
        gvTO.DataBind()
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        fltName.Text = Nothing
        fltCity.Text = Nothing
        fltCountry.Text = Nothing
        ddlMarkets.SelectedIndex = 0
        ddlPay.SelectedIndex = 0
        fltCreated.Text = Nothing
        fltActive.Checked = True
    End Sub

    Protected Sub btnSerch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSerch.Click
        Me.Response.Redirect("~/Maintenance/TO/TtOoDetail.aspx?TOID=" & ddlTO.SelectedValue.ToString)
    End Sub

    Protected Sub gvTO_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvTO.RowCommand
        If e.CommandName = "Details" Then
            Me.Response.Redirect("~/Maintenance/TO/TtOoDetail.aspx?TOID=" & e.CommandArgument)
        End If
    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
        Response.Redirect("~/Maintenance/TO/TtOoDetail.aspx?TOID=0")
    End Sub
End Class
