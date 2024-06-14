
Partial Class Maintenance_RoomType
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

    Protected Sub dsRoomTypes_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsRoomTypes.Inserted, dsRoomTypes.Updated, dsRoomTypes.Deleted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error!", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        End If
    End Sub
End Class
