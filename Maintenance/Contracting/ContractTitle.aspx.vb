
Partial Class Maintenance_Contracting_ContractTitle
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
    Protected Sub gridCtrTitle_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles gridCtrTitle.RowUpdating
        e.Cancel = (e.NewValues(0) Is Nothing) Or (e.NewValues(1) Is Nothing)
    End Sub

    Protected Sub dsCtrTitle_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsCtrTitle.Deleted, dsCtrTitle.Inserted, dsCtrTitle.Updated
        If e.Exception IsNot Nothing Then
            popShow(False, "Error Contract Title", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
            'Else
            '    gridCtrTitle.DataBind()

        End If
    End Sub
End Class
