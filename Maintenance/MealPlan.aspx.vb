Imports System.Windows.Forms

Partial Class Maintenance_MealPlan
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

    Protected Sub gridMealPlan_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles gridMealPlan.RowUpdating
        e.Cancel = (e.NewValues(0) Is Nothing)
    End Sub

    Protected Sub dsMealPlan_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsMealPlan.Deleted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error deleting MP", e.Exception.Message)
            e.ExceptionHandled = True
        Else
            gridMealPlan.DataBind()
        End If
    End Sub

    Protected Sub dsMealPlan_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsMealPlan.Inserted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error inserting MP", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
            'Else
            '    gridMealPlan.DataBind()

        End If
    End Sub

    Protected Sub dsMealPlan_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsMealPlan.Updated
        If e.Exception IsNot Nothing Then
            popShow(False, "Error editing MP", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
            'Else
            '    gridMealPlan.DataBind()

        End If
    End Sub
End Class
