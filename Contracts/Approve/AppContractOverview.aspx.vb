Partial Class Contracts_Approve_AppContractOverview
    Inherits System.Web.UI.Page

    Protected Sub dsOvwCtr_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles dsOvwCtr.Selecting
        e.InputParameters(0) = My.User.Name
    End Sub

    'http://localhost:62117/SmartApp10/Contracts/Approve/AppContractOverview.aspx?ContractID=37308
End Class
