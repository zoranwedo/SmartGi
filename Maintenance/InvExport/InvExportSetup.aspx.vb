
Partial Class Maintenance_InvExport_InvExportSetup
    Inherits System.Web.UI.Page

    Protected Sub dsTTOO_Deleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsTTOO.Deleting
        e.InputParameters("TourOpID") = e.InputParameters("original_TourOpID")
        e.InputParameters.Remove("original_TourOpID")
    End Sub
End Class
