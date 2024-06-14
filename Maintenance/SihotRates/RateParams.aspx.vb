
Partial Class Maintenance_SihotRates_RateParams
    Inherits System.Web.UI.Page

    Protected Sub dsRateParams_EditUser(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsRateParams.Deleting, dsRateParams.Inserting, dsRateParams.Updating
        e.InputParameters("editUser") = My.User.Name
    End Sub

End Class
