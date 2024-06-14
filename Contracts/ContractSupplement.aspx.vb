
Partial Class Contracts_ContractSupplement
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
                    sid = Int32.Parse(CType(grv.FindControl("lnkSupplement"), HyperLink).Text)
                    q.Supplement2ContractAttach(sid, cid, uid)
                Catch ex As Exception
                    popShow(False, "Error Attaching Supplement", ex)
                    Exit For
                End Try
            End If
        Next
        gvAttached.DataBind()
        gvContracts.DataBind()
    End Sub

    Protected Sub gvAttached_RowCommand(sender As Object, e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvAttached.RowCommand
        Dim q As New ContractStatesTableAdapters.QueriesTableAdapter
        Dim uid As String = Membership.GetUser.UserName
        Dim cid As Integer = Int32.Parse(Request.QueryString("ContractID"))
        Dim sid As Integer = Int32.Parse(e.CommandArgument)

        If e.CommandName = "Dettach" Then
            Try
                q.Supplement2ContractDettach(sid, cid, uid)
                gvContracts.DataBind()
                gvAttached.DataBind()
            Catch ex As Exception
                popShow(False, "Error Deattaching Supplement", ex)
            End Try
        ElseIf e.CommandName = "Suspend" Then
            Try
                q.Supplement2ContractSuspend(sid, cid, uid)
                gvContracts.DataBind()
                gvAttached.DataBind()
            Catch ex As Exception
                popShow(False, "Error Suspending Supplement", ex)
            End Try
        End If
    End Sub
End Class
