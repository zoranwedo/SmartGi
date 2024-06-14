
Partial Class Contracts_ContractSpecial
    Inherits System.Web.UI.Page

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

    Protected Sub btnAttachAll_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim q As New ContractStatesTableAdapters.QueriesTableAdapter
        Dim uid As String = Membership.GetUser.UserName
        Dim cid As Integer = Int32.Parse(Request.QueryString("ContractID"))
        Dim sid As Integer = Nothing

        For Each grv As GridViewRow In gvContracts.Rows
            Dim hrb As Boolean = CType(grv.Cells(1).Controls(1), CheckBox).Checked
            If (hrb) Then
                Try
                    sid = Int32.Parse(CType(grv.FindControl("lnkSpecial"), HyperLink).Text)
                    q.Special2ContractAttach(sid, cid, uid)
                Catch ex As Exception
                    popShow(False, "Error Attaching Special", ex)
                    Exit For
                End Try
            End If
        Next
        gvContracts.DataBind()
        gvSpecials.DataBind()
    End Sub

    Protected Sub gvSpecials_RowCommand(sender As Object, e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvSpecials.RowCommand
        Dim q As New ContractStatesTableAdapters.QueriesTableAdapter
        Dim uid As String = Membership.GetUser.UserName
        Dim cid As Integer = Int32.Parse(Request.QueryString("ContractID"))
        Dim sid As Integer = Int32.Parse(e.CommandArgument)

        If e.CommandName = "Dettach" Then
            Try
                q.Special2ContractDettach(sid, cid, uid)
                gvContracts.DataBind()
                gvSpecials.DataBind()
            Catch ex As Exception
                popShow(False, "Error Deattaching Special", ex)
            End Try
        ElseIf e.CommandName = "Suspend" Then
            Try
                q.Special2ContractSuspend(sid, cid, uid)
                gvContracts.DataBind()
                gvSpecials.DataBind()
            Catch ex As Exception
                popShow(False, "Error Suspending Special", ex)
            End Try
        End If
    End Sub
End Class
