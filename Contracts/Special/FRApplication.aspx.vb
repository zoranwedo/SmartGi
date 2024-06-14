
Partial Class Contracts_Special_FRApplication
    Inherits System.Web.UI.Page

    Public Function IsFreeRate() As Boolean
        Return CType(Master, Contracts_Special_masterSpecial).IsFreeRate
    End Function

    Protected Sub popShow(ByVal Question As Boolean, ByVal Title As String, ByVal ex As Exception)
        If ex.InnerException IsNot Nothing Then
            popMessage.Text = ex.InnerException.Message
        Else
            popMessage.Text = ex.Message
        End If
        popLabel.Text = Title

        If Question Then
            btnYes.Visible = True
            btnNo.Text = "No"
        Else
            btnYes.Visible = False
            btnNo.Text = "OK"
        End If
        popExtender.Show()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim cmp As Contracts_Special_masterSpecial = CType(Master, Contracts_Special_masterSpecial)
        If Not IsNothing(cmp) Then
            AddHandler cmp.btnWizFinishMasterPage.Click, AddressOf btnWizFinishMasterPage_Click
        End If
        'hfuserName.Value = Membership.GetUser.UserName
        'Label1.Text = hfuserName.Value
    End Sub

    Protected Sub btnWizFinishMasterPage_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.Response.Redirect("~/Contracts/Specials.aspx", True)
    End Sub

    Protected Sub btSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btSearch.Click
        divContracts.Visible = True
        dsFilteredContracts.DataBind()
    End Sub

    Protected Sub btClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btClear.Click
        ddlMarkets.SelectedIndex = 0
        'ddlTO.SelectedIndex = 0
        fltName.Text = ""
    End Sub

    Protected Sub btnAttachAll_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim q As New ContractStatesTableAdapters.QueriesTableAdapter
        Dim uid As String = Membership.GetUser.UserName
        Dim sid As Integer = Int32.Parse(Request.QueryString("SpecialID"))
        Dim tid As Integer

        If IsFreeRate() Then
            Try
                tid = Int32.Parse(gvContracts.SelectedValue)
                q.Special2ContractAttachFR(sid, tid, uid)
                gvContracts.DataBind()
                gvAttached.DataBind()
                divContracts.Visible = False
            Catch ex As Exception
                popShow(False, "Error Attaching Special", ex)
            End Try
        Else
            popShow(False, "Error Special", New Exception("Can't attach special that is not free-rate to TTOO!"))
        End If
    End Sub

    Protected Sub gvContracts_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvContracts.DataBound
        If gvContracts.Rows.Count > 0 Then
            gvContracts.SelectedIndex = 0
        Else
            gvContracts.SelectedIndex = -1
        End If
    End Sub

    Protected Sub gvAttached_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvAttached.RowCommand
        Dim q As New ContractStatesTableAdapters.QueriesTableAdapter
        Dim uid As String = Membership.GetUser.UserName
        Dim sid As Integer = Int32.Parse(Request.QueryString("SpecialID"))
        Dim cid As Integer = Int32.Parse(e.CommandArgument.ToString)

        If e.CommandName = "Dettach" Then
            Try
                q.Special2ContractDettach(sid, cid, uid)
                gvContracts.DataBind()
                gvAttached.DataBind()
            Catch ex As Exception
                popShow(False, "Error Deattaching Special", ex)
            End Try
        ElseIf e.CommandName = "Suspend" Then
            Try
                q.Special2ContractSuspend(sid, cid, uid)
                gvContracts.DataBind()
                gvAttached.DataBind()
            Catch ex As Exception
                popShow(False, "Error Suspending Special", ex)
            End Try
        End If
    End Sub

    Protected Sub dsFilteredByUser_Selecting(sender As Object, e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles dsFilteredContracts.Selecting, dsAttachCnt.Selecting
        'e.Arguments("Usename") = Membership.GetUser.UserName
        e.InputParameters("UserName") = My.User.Name ' Membership.GetUser.UserName
    End Sub
End Class
