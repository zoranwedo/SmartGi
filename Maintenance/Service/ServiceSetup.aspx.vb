
Partial Class Maintenance_Service_ServiceSetup
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblTime.Text = Now.ToString
    End Sub

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

    Protected Sub gvSfsParams_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles gvSfsParams.RowUpdated
        If e.Exception IsNot Nothing Then
            popShow("Error Updating Service", e.Exception)
            'popShow("Error Updating Service", Nothing, "Date and time is not valid")
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub gvSfsParams_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles gvSfsParams.RowEditing
        gvSfsParams.SelectedIndex = e.NewEditIndex
        dvInfo.PageIndex = gvSfsParams.SelectedIndex
    End Sub

    Protected Sub gvSfsParams_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvSfsParams.SelectedIndexChanged
        dvInfo.PageIndex = gvSfsParams.SelectedIndex
    End Sub

    Protected Sub gvSfsParams_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles gvSfsParams.RowUpdating
        Try
            e.NewValues("StartingOn") = Date.ParseExact(e.NewValues("StartingOn"), "MM/dd/yyyy hh:mm:ss tt", Nothing)
        Catch ex As Exception
            popShow("Error Updating Service", ex)
            e.Cancel = True
        End Try
    End Sub
End Class
