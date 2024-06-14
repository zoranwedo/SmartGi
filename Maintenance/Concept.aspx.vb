Imports App_UserControls_MessagePop

Partial Class Maintenance_Concept
    Inherits System.Web.UI.Page

    Protected Sub dsConcept_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsConcept.Deleted
        If e.Exception IsNot Nothing Then
            msgPop.ShowError(ErrorMsg(e.Exception))
            e.ExceptionHandled = True
        Else
            Me.gridConcept.DataBind()
        End If
    End Sub

    Protected Sub dsConcept_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsConcept.Inserted
        If e.Exception IsNot Nothing Then
            msgPop.ShowError(ErrorMsg(e.Exception))
            e.ExceptionHandled = True
        Else
            Me.gridConcept.DataBind()
        End If
    End Sub

    Protected Sub dsConcept_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsConcept.Updated
        If e.Exception IsNot Nothing Then
            msgPop.ShowError(ErrorMsg(e.Exception))
            e.ExceptionHandled = True
        Else
            Me.gridConcept.DataBind()
        End If
    End Sub

    Private Function ErrorMsg(ByVal ex As Exception) As Exception
        Dim msg As String = ex.Message
        If ex.InnerException IsNot Nothing Then msg = ex.InnerException.Message

        If msg.Contains("AK_ConceptCode") Then
            msg = "Concept Code has to be unique"
        ElseIf msg.Contains("AK_ConceptShName") Then
            msg = "Concept Short Name has to be unique"
        ElseIf msg.Contains("AK_ConceptName") Then
            msg = "Concept Name has to be unique"
        ElseIf msg.Contains("FK_InvStayConcept_Concept") Then
            msg = "Can't delete concept that is already used in invoices"
        End If

        Return New Exception(msg)
    End Function
End Class
