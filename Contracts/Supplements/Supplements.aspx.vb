
Partial Class Contracts_Supplements
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        dsFilteredSupplements.Select()
        gvSpecials.DataBind()
        pnlCnt.Visible = True
    End Sub

    Protected Sub btnSerch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSerch.Click
        Response.Redirect("~/Contracts/Supplements/Detail.aspx?SupplementID=" + txtSuppID.Text)
    End Sub

    Protected Sub gvSpecials_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvSpecials.RowCommand
        Me.Response.Redirect("~/Contracts/Supplements/Detail.aspx?SupplementID=" & e.CommandArgument)
    End Sub

    Protected Sub linkNew_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles linkNew.Click
        Response.Redirect("~/Contracts/Supplements/Detail.aspx?SupplementID=0")

    End Sub

    'Protected Sub ddlSupplements_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlSupplements.SelectedIndexChanged
    '    If (String.IsNullOrEmpty(ddlSupplements.SelectedValue)) Then
    '        txtSuppID.Text = Nothing
    '        'btnSerch.Enabled = False
    '    Else
    '        txtSuppID.Text = ddlSupplements.SelectedValue
    '        'btnSerch.Enabled = True
    '    End If
    '    btnSerch_Click(sender, e)
    'End Sub

    Protected Sub txtSuppID_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtSuppID.TextChanged
        If txtSuppID.Text = Nothing Then
            btnSerch.Enabled = False
        Else
            btnSerch.Enabled = True
        End If
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        pnlCnt.Visible = False

        'ddlSupplements.SelectedValue = ""
        txtSuppID.Text = Nothing
        fltStart.Text = Nothing
        fltFinish.Text = Nothing
        ddlCategory.SelectedValue = ""
        ddlHotel.SelectedValue = ""
    End Sub
End Class
