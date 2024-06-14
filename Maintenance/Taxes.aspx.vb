
Partial Class Maintenance_Taxes
    Inherits System.Web.UI.Page
    Protected Sub dsHotelMPAdd_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsHotelMPAdd.Updated, dsHotelMPAdd.Inserted, dsHotelMPAdd.Deleted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error Taxes and Fees", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
            'Else
            'Me.gridMPAdd.DataBind()
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
