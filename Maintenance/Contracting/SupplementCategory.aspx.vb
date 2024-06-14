
Partial Class Maintenance_Contracting_SupplementCategory
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


    Protected Sub gridSupCategory_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles gridSupCategory.RowUpdating
        e.Cancel = (e.NewValues(0) Is Nothing)
    End Sub

    Protected Sub dsSupCategory_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsSupCategory.Deleted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error deleting Category", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            gridSupCategory.DataBind()

        End If
    End Sub

    Protected Sub dsSupCategory_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsSupCategory.Inserted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error inserting Category", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            gridSupCategory.DataBind()

        End If

    End Sub

    Protected Sub dsSupCategory_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsSupCategory.Updated
        If e.Exception IsNot Nothing Then
            popShow(False, "Error editing Category", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            gridSupCategory.DataBind()

        End If

    End Sub
End Class
