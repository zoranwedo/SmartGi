Partial Class Maintenance_Pay_PayCondition
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


    Protected Sub gridPayCond_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles gridPayCond.RowUpdating
        e.Cancel = (e.NewValues(0) Is Nothing)
    End Sub

    Protected Sub gridPayExtra_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles gridPayExtra.RowUpdating
        e.Cancel = (e.NewValues(0) Is Nothing)
    End Sub

    Protected Sub dsPayExtra_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsPayExtra.Deleted, dsPayExtra.Inserted, dsPayExtra.Updated
        If e.Exception IsNot Nothing Then
            popShow(False, "Error Pay Condition Extra", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            gridPayExtra.DataBind()
        End If
    End Sub

    Protected Sub dsPayExtra_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsPayExtra.Updating
        e.InputParameters("PayCondId") = gridPayCond.SelectedValue
    End Sub

    Protected Sub dsPayExtra_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsPayExtra.Inserting
        e.InputParameters("PayCondId") = gridPayCond.SelectedValue
    End Sub

    Protected Sub dsPayCond_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsPayCond.Deleted, dsPayCond.Inserted, dsPayCond.Updated
        If e.Exception IsNot Nothing Then
            popShow(False, "Error Pay Condition", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            gridPayCond.DataBind()
        End If
    End Sub
End Class
