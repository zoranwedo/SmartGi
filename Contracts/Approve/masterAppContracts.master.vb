
Partial Class Contracts_Approve_masterAppContracts
    Inherits System.Web.UI.MasterPage

    Protected Sub LocalMenu_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles LocalMenu.Load
        If Not Page.IsPostBack Then
            For Each i As MenuItem In LocalMenu.Items
                i.NavigateUrl &= "?ContractID=" & Request.QueryString(0)
            Next
        End If
    End Sub

    Protected Sub ContractContent_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles ContractContent.Load
        For Each i As MenuItem In LocalMenu.Items
            i.Selected = i.NavigateUrl.StartsWith(ContractContent.Page.AppRelativeVirtualPath)
            i.Enabled = Not i.NavigateUrl.StartsWith(ContractContent.Page.AppRelativeVirtualPath)
        Next
    End Sub

    Public ReadOnly Property fvContractMasterPage() As FormView
        Get
            Return fvContract
        End Get
    End Property

    Protected Sub dsContractByID_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles dsContractByID.Selecting
        e.InputParameters(0) = My.User.Name
    End Sub
End Class

