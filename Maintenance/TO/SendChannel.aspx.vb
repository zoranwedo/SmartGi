Imports App_UserControls_MessagePop

Partial Class Maintenance_TO_SendChannel
    Inherits System.Web.UI.Page

    Protected Sub dsChannel_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsChannel.Inserting
        e.InputParameters("Active") = True
    End Sub

    Protected Sub dsChannel_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsChannel.Inserted
        If e.Exception IsNot Nothing Then
            msgPop.Title = "Error Inserting Channel"
            Dim ex As Exception = e.Exception
            If ExceptionMessage(ex).Contains("AK_InvoiceSendChannel") Then ex = New Exception("This channel already exists")
            msgPop.ShowError(ex)
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub dsChannel_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsChannel.Updated
        If e.Exception IsNot Nothing Then
            msgPop.Title = "Error Updating Channel"
            Dim ex As Exception = e.Exception
            If ExceptionMessage(ex).Contains("AK_InvoiceSendChannel") Then ex = New Exception("This channel already exists")
            msgPop.ShowError(ex)
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub dsChannel_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsChannel.Deleted
        If e.Exception IsNot Nothing Then
            msgPop.Title = "Error Deleting Channel"
            msgPop.ShowError(e.Exception)
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Function ExceptionMessage(ByVal ex As Exception) As String
        Dim s As String = ex.Message
        If ex.InnerException IsNot Nothing Then s = s + "; " + ExceptionMessage(ex.InnerException)
        Return s
    End Function
End Class
