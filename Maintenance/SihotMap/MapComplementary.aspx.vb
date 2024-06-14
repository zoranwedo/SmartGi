
Partial Class Maintenance_SihotMap_MapComplementary
    Inherits System.Web.UI.Page

    Protected Sub dsComplementary_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsComplementary.Inserting
        e.InputParameters("Deleted") = False
        e.InputParameters("ChangeUser") = My.User.Name
    End Sub

    Protected Sub dsComplementary_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsComplementary.Updating
        e.InputParameters("Deleted") = False
        e.InputParameters("ChangeUser") = My.User.Name
    End Sub
End Class
