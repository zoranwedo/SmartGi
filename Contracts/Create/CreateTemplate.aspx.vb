
Partial Class Contracts_Create_CreateTemplate
    Inherits System.Web.UI.Page

    Protected Sub popShow(ByVal Title As String, ByVal ex As Exception)
        popLabel.Text = Title
        If ex.InnerException IsNot Nothing Then
            popMessage.Text = ex.InnerException.Message
        Else
            popMessage.Text = ex.Message
        End If
        popExtender.Show()
    End Sub

    Protected Sub dsContract_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsContract.Inserted
        Dim str As String = e.OutputParameters.Item("NewID")
        If e.Exception IsNot Nothing Then
            popShow("Error inserting Template", e.Exception)
            e.ExceptionHandled = True
        Else
            If Not (String.IsNullOrEmpty(str)) Then
                Response.Redirect(String.Format("~/Contracts/Wizard/Detail.aspx?ContractID={0}", str))
            End If
        End If
    End Sub

End Class
