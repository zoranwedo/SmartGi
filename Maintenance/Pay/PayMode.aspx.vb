
Partial Class Maintenance_Pay_PayMode
    Inherits System.Web.UI.Page

    Protected Sub popShow(ByVal Question As Boolean, ByVal Title As String, ByVal Message As String)
        popMessage.Text = Message
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

    Protected Sub gridPayMode_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles gridPayMode.RowUpdating
        e.Cancel = (e.NewValues(0) Is Nothing)
    End Sub

    Protected Sub dsPayMode_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsPayMode.Deleted, dsPayMode.Inserted, dsPayMode.Updated
        If e.Exception IsNot Nothing Then
            popShow(False, "Error Pay Mode", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            gridPayMode.DataBind()
        End If
    End Sub
End Class
