
Partial Class Maintenance_TO_TOContacts
    Inherits System.Web.UI.Page

    Protected Sub btnNew_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        dvContact.ChangeMode(DetailsViewMode.Insert)
    End Sub

    Protected Sub dvContact_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles dvContact.ItemInserted
        If e.Exception IsNot Nothing Then
            dvContact.ChangeMode(DetailsViewMode.ReadOnly)
        Else
            popShow(False, "Error adding contactc", e.Exception.Message)
            e.ExceptionHandled = True
            e.KeepInInsertMode = True
        End If
    End Sub

    Protected Sub dsContact_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsContact.Deleted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error deleting TO", e.Exception.Message)
            e.ExceptionHandled = True
        Else
            'dsTOContacts.DataBind()
            'Me.gwTourOp.DataBind()
            Response.Redirect("TOContacts.aspx?TOID=" & Request.QueryString(0))
        End If
    End Sub

    Protected Sub dsContact_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsContact.Inserted
        If e.OutputParameters.Item("NewID") IsNot Nothing Then
            Try
                Dim hc As New TourOperTableAdapters.TourOpContactTableAdapter
                hc.Insert(Int32.Parse(e.OutputParameters.Item("NewID")), Request.QueryString(0))
                'dsTOContacts.DataBind()
                'Me.gwTourOp.DataBind()
                Response.Redirect("TOContacts.aspx?TOID=" & Request.QueryString(0))
            Catch ex As Exception
                'popShow(False, "Error inserting TO", ex.InnerException.Message)
                e.ExceptionHandled = True
            End Try
        End If
    End Sub
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

    Protected Sub dsContact_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsContact.Updated
        If e.Exception IsNot Nothing Then
            popShow(False, "Error editing contact", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            Me.gwTourOp.DataBind()
        End If
    End Sub
End Class
