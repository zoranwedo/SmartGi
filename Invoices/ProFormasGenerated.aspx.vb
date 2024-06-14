
Partial Class Invoices_ProFormasGenerated
    Inherits System.Web.UI.Page

    Protected Sub dsSessions_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles dsSessions.Selecting
        e.InputParameters("UserName") = My.User.Name
    End Sub

    Protected Sub gvProformas_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvProformas.DataBinding
        gvProformas.Columns(5).Visible = cbGroup.Checked
    End Sub

    Protected Sub cbGroup_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbGroup.CheckedChanged
        gvProformas.DataBind()
    End Sub
End Class
