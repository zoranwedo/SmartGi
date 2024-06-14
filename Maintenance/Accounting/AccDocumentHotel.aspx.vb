
Partial Class Maintenance_Accounting_AccDocumentHotel
    Inherits System.Web.UI.Page

    Protected Sub dsAccDocumentHotel_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccDocumentHotel.Inserted
        If e.Exception IsNot Nothing Then
            Dim msgError As String = ""
            If e.Exception.InnerException IsNot Nothing Then
                msgError = e.Exception.InnerException.Message
            Else
                msgError = e.Exception.Message
            End If
            popShow(False, "Error Inserting", msgError)
            e.ExceptionHandled = True
        End If
    End Sub

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

End Class
