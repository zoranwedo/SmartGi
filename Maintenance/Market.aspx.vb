
Partial Class Maintenance_Market
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
    Protected Sub gridMarket_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles gridMarket.RowUpdating
        e.Cancel = (e.NewValues(0) Is Nothing)
    End Sub

    Protected Sub dsMarket_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsMarket.Deleted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error deleting market", e.Exception.Message)
            e.ExceptionHandled = True
        Else
            Me.gridMarket.DataBind()
        End If
    End Sub

    Protected Sub dsMarket_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsMarket.Inserted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error inserting market", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            Me.gridMarket.DataBind()
        End If
    End Sub

    Protected Sub dsMarket_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsMarket.Updated
        If e.Exception IsNot Nothing Then
            popShow(False, "Error editing market", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            Me.gridMarket.DataBind()
        End If
    End Sub
End Class
