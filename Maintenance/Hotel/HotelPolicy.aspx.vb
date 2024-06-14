
Partial Class Maintenance_Hotel_HotelPolicy
    Inherits System.Web.UI.Page

    Protected Sub gridPolicy_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles gridPolicy.RowUpdated
        If e.Exception IsNot Nothing Then
            popShow(False, "Error editing Policy", e.Exception.InnerException.Message)
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
