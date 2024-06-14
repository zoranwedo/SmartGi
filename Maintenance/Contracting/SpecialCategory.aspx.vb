
Partial Class Maintenance_Contracting_SpecialCategory
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


    Protected Sub gridSpecCategory_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles gridSpecCategory.RowUpdating
        e.Cancel = (e.NewValues(0) Is Nothing)
    End Sub

    Protected Sub dsSpecCategory_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsSpecCategory.Deleted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error deleting Category", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            gridSpecCategory.DataBind()

        End If
    End Sub

    Protected Sub dsSpecCategory_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsSpecCategory.Inserted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error inserting Category", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            gridSpecCategory.DataBind()

        End If

    End Sub

    Protected Sub dsSpecCategory_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsSpecCategory.Updated
        'If e.Exception IsNot Nothing Then
        '    popShow(False, "Error editing Category", e.Exception.InnerException.Message)
        '    e.ExceptionHandled = True
        'Else
        '    gridSpecCategory.DataBind()

        'End If

        If e.Exception IsNot Nothing Then
            Dim msgError As String = ""

            If e.Exception.InnerException IsNot Nothing Then
                Dim inner As Exception = e.Exception.InnerException

                If TypeOf inner Is System.Data.Common.DbException Then
                    If inner.Message.Contains("FK_Special_SpecialCategory") Then
                        msgError &= "This Category is already used by Special and can't be changed!"
                    End If
                End If
            Else
                msgError = e.Exception.Message
            End If

            popShow(False, "Error Updating Category", msgError)

            e.ExceptionHandled = True
        End If
    End Sub
End Class
