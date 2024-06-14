Imports App_UserControls_MessagePop

Partial Class Maintenance_CRS_CrsExcludedServices
    Inherits System.Web.UI.Page

    Protected Sub dsExcluded_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsExcluded.Inserting
        e.InputParameters("ChangeUser") = My.User.Name
    End Sub

    Protected Sub gridExcluded_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gridExcluded.RowCommand
        If e.CommandName = "DeleteService" Then
            Dim sID As String = e.CommandArgument
            Dim q As New dsCRSTableAdapters.crsExcludedServicesTableAdapter
            q.DeleteQuery(My.User.Name, sID)
            gridExcluded.DataBind()
        End If
    End Sub

    Protected Sub dsExcluded_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsExcluded.Inserted
        If e.Exception IsNot Nothing Then
            Dim ex As Exception = e.Exception
            If e.Exception.InnerException IsNot Nothing Then
                If e.Exception.InnerException.Message.Contains("PK_crsExcludedServices") Then
                    ex = New Exception("That service already exists in exclusion list.")
                End If
            End If
            msgPop.ShowError(ex)
            e.ExceptionHandled = True
        End If
    End Sub

End Class
