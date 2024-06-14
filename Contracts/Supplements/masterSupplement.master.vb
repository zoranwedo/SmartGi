
Partial Class Contracts_Supplements_masterSupplement
    Inherits System.Web.UI.MasterPage

    Public ReadOnly Property btnWizNextMasterPage() As Button
        Get
            Return btnWizNext
        End Get
    End Property

    Public Function CanEdit() As Boolean
        Dim l As Label = fvSupplement.FindControl("lblState")
        Dim i As Integer = 0
        If l IsNot Nothing Then i = Int32.Parse(CType(fvSupplement.FindControl("lblState"), Label).Text)
        Return (i = 0)
    End Function

    Public Function Attach2TO() As Boolean
        Dim r As Boolean = True
        'Dim r As Boolean = False
        'Dim c As HiddenField = fvSupplement.FindControl("hfCategory")
        'If c IsNot Nothing Then
        '    If Not String.IsNullOrEmpty(c.Value) Then
        '        r = Not (c.Value = "GENERAL")
        '    End If
        'End If
        Return r
    End Function

    Protected Sub popShow(ByVal Title As String, ByVal ex As Exception)
        If ex.InnerException IsNot Nothing Then
            m_popMessage.Text = ex.InnerException.Message
        Else
            m_popMessage.Text = ex.Message
        End If
        m_popLabel.Text = Title
        m_popExtender.Show()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            For Each i As MenuItem In LocalMenu.Items
                i.NavigateUrl &= "?SupplementID=" & Request.QueryString(0)
            Next
        End If
    End Sub

    Protected Sub WizardContent_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles WizardContent.Load
        For Each i As MenuItem In LocalMenu.Items
            i.Selected = i.NavigateUrl.StartsWith(WizardContent.Page.AppRelativeVirtualPath)
            'i.Enabled = Not i.NavigateUrl.StartsWith(WizardContent.Page.AppRelativeVirtualPath)
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
        Me.Response.Redirect("~/Contracts/Supplements.aspx", True)
    End Sub

    Protected Sub fvSupplement_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvSupplement.DataBound
        If Me.Attach2TO Then
            LocalMenu.Items.RemoveAt(1)
        Else
            LocalMenu.Items.RemoveAt(2)
        End If

        WizardContent_Load(sender, e)
    End Sub

    Protected Sub fvSupplement_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles fvSupplement.ItemCommand
        Dim sid As Integer = Int32.Parse(Request.QueryString("SupplementID"))

        If e.CommandName = "MasterSuspend" Then
            Dim q As New ContractStatesTableAdapters.QueriesTableAdapter
            Dim uid As String = Membership.GetUser.UserName
            Try
                q.Supplement2Suspend(sid, uid)
                Me.Response.Redirect(Page.Request.Url.AbsoluteUri, True)
            Catch ex As Exception
                popShow("Error Suspending Supplement", ex)
            End Try
        End If
    End Sub
End Class

