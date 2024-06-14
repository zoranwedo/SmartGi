
Partial Class Contracts_masterContract
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

    Protected Sub fvContract_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvContract.DataBound
        Dim b As Button = fvContract.FindControl("btnEditHeader")
        If b IsNot Nothing Then
            Dim s As Integer = Int32.Parse(b.CommandArgument)
            'b.Visible = (ModificationRights.RightsAdmin Or (s < 1)) And (s <> 6)
            b.Visible = ((s < 1) Or (s = 4))
            If s = 4 Then b.Text = "Modify"
        End If
    End Sub

    Protected Sub fvContract_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles fvContract.ItemCommand
        If e.CommandName = "GoToWizard" Then
            Me.Response.Redirect("~/Contracts/Wizard/Detail.aspx?ContractID=" & Request.QueryString(0), True)
        ElseIf (e.CommandName = "GoToNew") Then
            Me.Response.Redirect("~/Contracts/NewContract.aspx", True)
        End If
    End Sub

    Public ReadOnly Property fvContractMasterPage() As FormView
        Get
            Return fvContract
        End Get
    End Property

End Class

