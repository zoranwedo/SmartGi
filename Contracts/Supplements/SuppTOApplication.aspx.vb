
Partial Class Contracts_Supplements_SuppTOApplication
    Inherits System.Web.UI.Page

    Public Function Attach2TO() As Boolean
        Return CType(Master, Contracts_Supplements_masterSupplement).Attach2TO
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
        If Not Page.IsPostBack Then
            If Not Attach2TO() Then Response.Redirect("~/Contracts/Supplements/SuppApplication.aspx?SupplementID=" & Request.QueryString(0))
        End If
    End Sub

    Protected Sub btSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btSearch.Click
        gvContracts.DataBind()
    End Sub

    Protected Sub btClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btClear.Click
        ddlMarkets.SelectedIndex = 0
        fltName.Text = ""
    End Sub

    Protected Sub btnAttachAll_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim q As New dsCoopMarketingTableAdapters.QueriesTableAdapter
        Dim uid As String = My.User.Name
        Dim sid As Integer = Int32.Parse(Request.QueryString("SupplementID"))
        Dim tid As Integer

        Try
            tid = Int32.Parse(gvContracts.SelectedValue)
            q.Supplement2TourOpAttach(sid, tid, uid)
            gvContracts.DataBind()
            gvAttachedTO.DataBind()
        Catch ex As Exception
            popShow(False, "Error Attaching Supplement", ex)
        End Try
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
        Dim sid As Integer = Int32.Parse(Request.QueryString("SupplementID"))
        Dim cid As Integer = Int32.Parse(e.CommandArgument.ToString)

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
                popShow(False, "Error Suspending Supplement Attachment", ex)
            End Try
        End If
    End Sub

    Protected Sub gvAttachedTO_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvAttachedTO.RowCommand
        Dim q As New dsCoopMarketingTableAdapters.QueriesTableAdapter
        Dim uid As String = My.User.Name
        Dim sid As Integer = Int32.Parse(Request.QueryString("SupplementID"))
        Dim tid As Integer = Int32.Parse(e.CommandArgument.ToString)

        If e.CommandName = "Dettach" Then
            Try
                q.Supplement2TourOpDettach(sid, tid, uid)
                gvContracts.DataBind()
                gvAttachedTO.DataBind()
            Catch ex As Exception
                popShow(False, "Error Deattaching Supplement", ex)
            End Try
        ElseIf e.CommandName = "Suspend" Then
            Try
                q.Supplement2TourOpSuspend(sid, tid, uid)
                gvContracts.DataBind()
                gvAttachedTO.DataBind()
            Catch ex As Exception
                popShow(False, "Error Suspending Supplement Attachment", ex)
            End Try
        End If
    End Sub
End Class
