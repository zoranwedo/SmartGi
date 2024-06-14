
Partial Class Maintenance_RateTransfer_RTransfSetup
    Inherits System.Web.UI.Page

    Protected Sub popShow(ByVal Title As String, ByRef ex As Exception)
        If ex.InnerException IsNot Nothing Then
            popMessage.Text = ex.InnerException.Message
        Else
            popMessage.Text = ex.Message
        End If
        popLabel.Text = Title
        popExtender.Show()
    End Sub

    Protected Sub dsInTransfer_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsInTransfer.Deleted
        If e.Exception IsNot Nothing Then
            popShow("Error", e.Exception)
            e.ExceptionHandled = True
        Else
            gvTransf.DataBind()
        End If
    End Sub

    Protected Sub dsInTransfer_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsInTransfer.Inserted
        If e.Exception IsNot Nothing Then
            popShow("Error", e.Exception)
            e.ExceptionHandled = True
        Else
            gvTransf.DataBind()
        End If
    End Sub
End Class
