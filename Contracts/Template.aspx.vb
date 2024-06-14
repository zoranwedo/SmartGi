
Partial Class Contracts_Template
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        dsFilteredContracts.Select()
        gvContracts.DataBind()
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        ddlHotel.SelectedIndex = 0
        ddlMarkets.SelectedIndex = 0
        fltName.Text = ""
        fltStart.Text = ""
        fltFinish.Text = ""
    End Sub

    Protected Sub btnSerch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSerch.Click
        Response.Redirect("~/Contracts/Wizard/Detail.aspx?ContractID=" + txtContID.Text)
    End Sub

    Protected Sub gvContracts_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvContracts.RowCommand
        If e.CommandName = "Details" Then
            Me.Response.Redirect("~/Contracts/Wizard/Detail.aspx?ContractID=" & e.CommandArgument)
        End If
    End Sub

    Protected Sub linkNew_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles linkNew.Click
        Response.Redirect("~/Contracts/Create/CreateTemplate.aspx")
    End Sub

    'Protected Sub ddlContracts_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlContracts.SelectedIndexChanged
    '    If (ddlContracts.SelectedValue = 0) Then
    '        txtContID.Text = Nothing
    '    Else
    '        txtContID.Text = ddlContracts.SelectedValue
    '    End If
    'End Sub

    'Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    'End Sub
End Class
