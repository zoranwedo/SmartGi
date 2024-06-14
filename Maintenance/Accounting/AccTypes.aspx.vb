
Partial Class Maintenance_Accounting_AccTypes
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

    Protected Sub dsAccTranType_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccTranType.Deleted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error Deleting Trascation Type", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub dsAccTranType_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccTranType.Inserted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error Inserting Trascation Type", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub dsAccDocType_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccDocType.Deleted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error Deleting Acc. Document Type", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub dsAccDocType_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccDocType.Inserted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error Inserting Acc. Document Type", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub dsAccType_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccType.Deleted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error Deleting Account Type", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub dsAccType_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccType.Inserted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error Inserting Account Type", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        End If
    End Sub
End Class
