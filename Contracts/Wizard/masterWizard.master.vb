
Partial Class Contracts_Wizard_masterWizard
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            For Each i As MenuItem In LocalMenu.Items
                i.NavigateUrl &= "?ContractID=" & Request.QueryString(0)
            Next
        End If
    End Sub

    Protected Sub WizardContent_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles WizardContent.Load
        For Each i As MenuItem In LocalMenu.Items
            i.Selected = i.NavigateUrl.StartsWith(WizardContent.Page.AppRelativeVirtualPath)
            i.Enabled = Not i.NavigateUrl.StartsWith(WizardContent.Page.AppRelativeVirtualPath)
            If (LocalMenu.Items.IndexOf(i) = LocalMenu.Items.Count - 1 And CanEdit() = False) Then i.Enabled = False
            If i.Selected Then
                btnWizPrev.Visible = LocalMenu.Items.IndexOf(i) > 0
                btnWizNext.Visible = (LocalMenu.Items.IndexOf(i) < LocalMenu.Items.Count - 1 And CanEdit() = True) Or (LocalMenu.Items.IndexOf(i) < LocalMenu.Items.Count - 2 And CanEdit() = False)
                btnWizFinish.Visible = LocalMenu.Items.IndexOf(i) = LocalMenu.Items.Count - 1 Or (LocalMenu.Items.IndexOf(i) = LocalMenu.Items.Count - 2 And CanEdit() = False)
            End If
        Next
    End Sub

    Protected Sub btnWizPrev_Command(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs) Handles btnWizPrev.Command
        For Each i As MenuItem In LocalMenu.Items
            If i.Selected Then
                Me.Response.Redirect(LocalMenu.Items(LocalMenu.Items.IndexOf(i) - 1).NavigateUrl, True)
                Exit For
            End If
        Next
    End Sub

    Protected Sub btnWizNext_Command(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs) Handles btnWizNext.Command
        For Each i As MenuItem In LocalMenu.Items
            If i.Selected Then
                Me.Response.Redirect(LocalMenu.Items(LocalMenu.Items.IndexOf(i) + 1).NavigateUrl, True)
                Exit For
            End If
        Next
    End Sub

    Protected Sub btnWizFinish_Command(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs) Handles btnWizFinish.Command
        Me.Response.Redirect("~/Contracts/Contracts.aspx", True)
    End Sub

    Protected Sub fvContract_ItemCreated(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvContract.ItemCreated
        If fvContract.SelectedValue = True Then
            linkBack.Text = "<< Back to Templates"
            linkBack.NavigateUrl = "~/Contracts/Template.aspx"
        Else
            linkBack.Text = "<< Back to Contracts"
            linkBack.NavigateUrl = "~/Contracts/Contracts.aspx"
        End If
    End Sub
    Public ReadOnly Property btnWizNextMasterPage() As Button

        Get
            Return btnWizNext
        End Get

    End Property
    Public ReadOnly Property btnWizFinishMasterPage() As Button

        Get
            Return btnWizFinish
        End Get

    End Property
    Public ReadOnly Property fvContractMasterPage() As FormView

        Get
            Return fvContract
        End Get

    End Property
    Public Function CanEdit() As Boolean
        Dim sid As Int32 = 0
        'If Not String.IsNullOrEmpty(fvContract.DataKey.Item(1).ToString) Then
        'If Not String.IsNullOrEmpty(fvContract.DataKey.Item(1).ToString) Then
        '    sid = Int32.Parse(fvContract.DataKey.Item(1).ToString)
        'End If
        If fvContract.FindControl("lblState") IsNot Nothing Then
            sid = Int32.Parse(CType(fvContract.FindControl("lblState"), Label).Text)
            If (sid = 4) Then
                Return False
            Else
                Return True
            End If
        Else
            Return True
        End If
        
    End Function

    Public Function GetStart() As Date
        If fvContract.FindControl("lblStart") IsNot Nothing Then
            Return Date.Parse(CType(fvContract.FindControl("lblStart"), Label).Text)
        Else : Return Today()
        End If

    End Function
    Public Function GetStartT() As String
        If fvContract.FindControl("lblStart") IsNot Nothing Then
            Return (CType(fvContract.FindControl("lblStart"), Label).Text)
        Else : Return Today().ToString
        End If

    End Function
    Public Function GetFinish() As Date
        If fvContract.FindControl("lblFinish") IsNot Nothing Then
            Return Date.Parse(CType(fvContract.FindControl("lblFinish"), Label).Text)
        Else : Return Today()
        End If
    End Function
    Public Function GetFinishT() As String
        If fvContract.FindControl("lblFinish") IsNot Nothing Then
            Return CType(fvContract.FindControl("lblFinish"), Label).Text
        Else : Return Today().ToString
        End If
    End Function

End Class

