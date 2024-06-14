
Partial Class Contracts_Wizard_Policy
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

    Protected Sub dsPolicy_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsPolicy.Inserted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error Contract Policy", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub dsPolicy_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsPolicy.Updated
        If e.Exception IsNot Nothing Then
            popShow(False, "Error Contract Policy", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        End If
    End Sub
End Class
