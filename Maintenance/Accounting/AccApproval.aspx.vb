
Partial Class Maintenance_Accounting_AccApproval
    Inherits System.Web.UI.Page

    Protected Sub dsProration_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsProration.Updating
        Dim p As TextBox = fvProration.Row.FindControl("txtProration")
        e.InputParameters("ProrationLimit") = p.Text
    End Sub
End Class
