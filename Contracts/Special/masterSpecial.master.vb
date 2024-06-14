
Partial Class Contracts_Special_masterSpecial
    Inherits System.Web.UI.MasterPage

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

    Public ReadOnly Property menuLocalMenu() As Menu
        Get
            Return LocalMenu
        End Get
    End Property

    Public ReadOnly Property SpoDiscount() As Integer
        Get
            Dim h As HiddenField = fvSpecial.FindControl("hfFreeRate")
            If h Is Nothing Then Return 0 Else Return h.Value
        End Get
    End Property

    Public ReadOnly Property IsFreeRate() As Boolean
        Get
            Dim h As HiddenField = fvSpecial.FindControl("hfFreeRate")
            If h Is Nothing Then Return False
            'Return (h.Value = 6) Or (h.Value = 1) Or (h.Value = 2)
            Return (h.Value = 6)
        End Get
    End Property

    Public ReadOnly Property IsNewFreeRate() As Boolean
        Get
            'DA VIDIM ŠTA ĆE DA BUDE
            '=======================
            'Dim q As New dsSpecialTableAdapters.QueriesTableAdapter
            'Dim usr As String = Membership.GetUser.UserName
            'If Not (q.GetContractIDDForSpec(Request.QueryString(0)) Is Nothing) Then Return True
            'Return False
            Return IsFreeRate
        End Get
    End Property

    Public Function CanEdit() As Boolean
        Dim i As Integer = Int32.Parse(CType(fvSpecial.FindControl("lblState"), Label).Text)
        Return (i = 0)
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
                i.NavigateUrl &= "?SpecialID=" & Request.QueryString(0)
            Next i
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

    Protected Sub fvSpecial_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvSpecial.DataBound
        Select Case Me.SpoDiscount
            Case 3, 4, 5
                LocalMenu.Items.RemoveAt(3)
                LocalMenu.Items.RemoveAt(2)
            Case 1, 2
                LocalMenu.Items.RemoveAt(2)
            Case 6
                LocalMenu.Items.RemoveAt(4)
                LocalMenu.Items.RemoveAt(1)
        End Select

        WizardContent_Load(sender, e)
    End Sub

    Protected Sub fvSpecial_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles fvSpecial.ItemCommand
        Dim sid As Integer = Int32.Parse(Request.QueryString("SpecialID"))

        If e.CommandName = "GoToWizard" Then
            If (IsFreeRate() And CanEdit()) Then
                Dim q As New dsSpecialTableAdapters.QueriesTableAdapter
                Dim cid As Integer = q.GetContractIDDForSpec(sid).Value
                Me.Response.Redirect("~/Contracts/Special/Wizard/Detail.aspx?ContractID=" & cid, True)
            End If
        ElseIf e.CommandName = "MasterSuspend" Then
            Dim q As New ContractStatesTableAdapters.QueriesTableAdapter
            Dim uid As String = Membership.GetUser.UserName
            Try
                q.Special2Suspend(sid, uid)
                Me.Response.Redirect(Page.Request.Url.AbsoluteUri, True)
            Catch ex As Exception
                popShow("Error Suspending Special", ex)
            End Try
        End If
    End Sub

    'Public Function SpecialState() As Integer
    '    Dim i As Integer
    '    If (fvSpecial.FindControl("lblState") Is Nothing) Then
    '        i = 0
    '    Else
    '        i = Int32.Parse(CType(fvSpecial.FindControl("lblState"), Label).Text)
    '    End If

    '    Return i
    'End Function
 
End Class

