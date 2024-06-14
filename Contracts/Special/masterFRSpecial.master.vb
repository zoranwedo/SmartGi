
Partial Class Contracts_Special_masterFRSpecial
    Inherits System.Web.UI.MasterPage
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            For Each i As MenuItem In LocalMenu.Items
                i.NavigateUrl &= "?SpecialID=" & Request.QueryString(0)
            Next
        End If
    End Sub

    Protected Sub WizardContent_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles WizardContent.Load
        For Each i As MenuItem In LocalMenu.Items
            i.Selected = i.NavigateUrl.StartsWith(WizardContent.Page.AppRelativeVirtualPath)
            i.Enabled = Not i.NavigateUrl.StartsWith(WizardContent.Page.AppRelativeVirtualPath)
            If i.Selected Then
                btnWizPrev.Visible = LocalMenu.Items.IndexOf(i) > 0
                btnWizNext.Visible = LocalMenu.Items.IndexOf(i) < LocalMenu.Items.Count - 1
                btnWizFinish.Visible = LocalMenu.Items.IndexOf(i) = LocalMenu.Items.Count - 1
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
        Me.Response.Redirect("~/Contracts/Specials.aspx", True)
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
    Public ReadOnly Property fvSpecialMasterPage() As FormView

        Get
            Return fvSpecial
        End Get

    End Property

    Protected Sub fvSpecial_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvSpecial.DataBound
        ''If Not (Int32.Parse(CType(fvSpecial.FindControl("lblDiscountType"), Label).Text) = 6) Then
        ''    'LocalMenu.Items.IndexOf(2)

        ''End If
    End Sub

    Protected Sub fvSpecial_ItemCreated(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvSpecial.ItemCreated
        If fvSpecial.SelectedValue = "0" Then
            LocalMenu.Items(LocalMenu.Items.Count - 1).Enabled = False
            LocalMenu.Items(LocalMenu.Items.Count - 2).Enabled = False

            'For Each i As MenuItem In LocalMenu.Items
            '    If i.Selected Then
            '        If LocalMenu.Items.IndexOf(i) = 1 Then
            '            btnWizNext.Visible = False
            '        Else
            '            btnWizNext.Visible = True
            '        End If
            '    End If
            'Next
        Else
            For Each i As MenuItem In LocalMenu.Items
                i.Enabled = True
            Next
        End If
    End Sub
End Class

