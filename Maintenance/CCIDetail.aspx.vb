
Partial Class Maintenance_CCIDetail
    Inherits System.Web.UI.Page

    Protected Sub dwHotelDetail_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) 'Handles dwHotelDetail.ItemUpdated
        If e.Exception IsNot Nothing Then
            popShow(False, "Hotel Detail", ExceptionMess.GetExceptionMessUpdate(e))
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
