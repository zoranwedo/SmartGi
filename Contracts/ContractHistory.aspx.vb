
Partial Class Contracts_ContractHistory
    Inherits System.Web.UI.Page
    Public UserOperator As Boolean
    Public UserHotel As Boolean

    Protected Sub popShow(ByVal Title As String, ByVal Message As String)
        popMessage.Text = Message
        popLabel.Text = Title
        popExtender.Show()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Membership.GetUser.UserName IsNot Nothing) Then
            UserHotel = Roles.IsUserInRole(Membership.GetUser.UserName, "hotel")
        End If

        Dim q As New ContractStatesTableAdapters.QueriesTableAdapter
        Dim stat As Integer = q.GetStateID(Request.QueryString(0))

        lnkActiv.Visible = (stat = 0) And ModificationRights.RightsOperatorAdmin
        lnkDeactiv.Visible = (stat = 4) And ModificationRights.RightsOperatorAdmin
        lnkSuspend.Visible = (stat = 4) And ModificationRights.RightsOperatorAdmin
    End Sub

    'Protected Sub gvNextState_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvNextState.RowCreated
    '    If e.Row.RowType = DataControlRowType.DataRow Then
    '        If gvNextState.DataKeys.Item(0).Value Is System.DBNull.Value Then
    '            Dim lnk As LinkButton = CType(e.Row.FindControl("btState"), LinkButton) 'CType(e.Row.Cells(0).Controls(0), LinkButton)
    '            lnk.CommandName = ""
    '        End If
    '    End If
    'End Sub

    Protected Sub lnkDeactiv_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkDeactiv.Click
        Dim CtrID As Integer = Request.QueryString(0)
        Dim UsrID As String = Membership.GetUser.UserName
        Dim q As New ContractStatesTableAdapters.QueriesTableAdapter
        Try
            q.ContractStateDeactivate(CtrID, UsrID)
            Me.Response.Redirect("~/Contracts/ContractHistory.aspx?ContractID=" & Request.QueryString(0))
        Catch ex As Exception
            popShow("Contract Deactivate", ex.Message)
        End Try
    End Sub

    Protected Sub lnkSuspend_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim CtrID As Integer = Request.QueryString(0)
        Dim UsrID As String = Membership.GetUser.UserName
        Dim q As New ContractStatesTableAdapters.QueriesTableAdapter
        Try
            q.ContractStateSuspend(CtrID, UsrID)
        Catch ex As Exception
            popShow("Contract Suspend", ex.Message)
        End Try
        Me.Response.Redirect("~/Contracts/ContractHistory.aspx?ContractID=" & Request.QueryString(0))
    End Sub

    Protected Sub lnkActiv_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkActiv.Click
        Dim CtrID As Integer = Request.QueryString(0)
        Dim UsrID As String = Membership.GetUser.UserName
        Dim q As New ContractStatesTableAdapters.QueriesTableAdapter
        Try
            q.ContractStateActivate(CtrID, UsrID)
        Catch ex As Exception
            popShow("Contract Activate", ex.Message)
        End Try
        Me.Response.Redirect("~/Contracts/ContractHistory.aspx?ContractID=" & Request.QueryString(0))
    End Sub
End Class
