
Partial Class Maintenance_SihotRes_ResParams
    Inherits System.Web.UI.Page

    Protected Sub dsResParams_EditUser(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsResParams.Deleting, dsResParams.Inserting, dsResParams.Updating
        e.InputParameters("editUser") = My.User.Name
    End Sub

End Class
