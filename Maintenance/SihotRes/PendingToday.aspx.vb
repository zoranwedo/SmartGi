
Partial Class Maintenance_SihotRes_PendingToday
    Inherits System.Web.UI.Page

    Protected Sub popShow(ByVal Title As String, ByRef ex As Exception, Optional ByVal Message As String = "-")
        If ex IsNot Nothing Then
            Try
                If ex.InnerException IsNot Nothing Then
                    popMessage.Text = ex.InnerException.Message
                Else
                    popMessage.Text = ex.Message
                End If
            Catch e As Exception
                popMessage.Text = ex.ToString
            End Try
        Else
            popMessage.Text = Message
        End If
        popLabel.Text = Title
        popExtender.Show()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            lblToday.Text = String.Format("Reservation Files Import Pending on {0}", Now)

            Dim q As New dsResImportTableAdapters.QueriesTableAdapter
            Dim p As Integer = q.ImportPending
            footerLabel.Text = IIf(p = 0, "No", p.ToString) & IIf(p = 1, " file", " files") & " pending for import"
        End If
    End Sub

    Protected Sub gvImported_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvImported.RowCommand
        If e.CommandName = "CancelImport" Then
            Dim q As New dsSIHOTTableAdapters.ResQueueTableAdapter
            Try
                Dim uid As New Guid(e.CommandArgument.ToString)
                q.CancelImport(uid)
                gvImported.DataBind()
                gvImported.EditIndex = -1
            Catch ex As Exception
                popShow("Error canceling import", ex)
            End Try

            Dim qp As New dsResImportTableAdapters.QueriesTableAdapter
            Dim p As Integer = qp.ImportPending
            footerLabel.Text = IIf(p = 0, "No", p.ToString) & IIf(p = 1, " file", " files") & " pending for import"
        End If
    End Sub

End Class
