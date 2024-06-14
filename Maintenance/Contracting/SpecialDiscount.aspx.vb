
Partial Class Maintenance_Contracting_SpecialDiscount
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


    Protected Sub gridDiscValue_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles gridDiscValue.RowUpdating
        e.Cancel = (e.NewValues(0) Is Nothing)
    End Sub

    Protected Sub dsDiscValue_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsDiscValue.Inserted, dsDiscValue.Deleted, dsDiscValue.Updated
        If e.Exception IsNot Nothing Then
            popShow(False, "Error Discount Value", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            gridDiscValue.DataBind()
        End If
    End Sub

    Protected Sub dsDiscValue_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsDiscValue.Inserting
        e.InputParameters("DiscountTypeID") = gridSpcDisc.SelectedValue
    End Sub

    Protected Sub dsDiscValue_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsDiscValue.Updating
        e.InputParameters("DiscountTypeID") = gridSpcDisc.SelectedValue
    End Sub

    Protected Sub gridSpcDisc_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gridSpcDisc.SelectedIndexChanged
        If gridSpcDisc.SelectedDataKey.Value = 5 Or gridSpcDisc.SelectedDataKey.Value = 6 Then
            pnlDiscount.Visible = False
        Else
            pnlDiscount.Visible = True
        End If
    End Sub
End Class
