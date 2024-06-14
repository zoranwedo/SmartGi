
Partial Class Maintenance_Hotel_HotelContacts
    Inherits System.Web.UI.Page

    Protected Sub btnNew_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        dvContact.ChangeMode(DetailsViewMode.Insert)
    End Sub

    Protected Sub dvContact_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles dvContact.ItemInserted
        If e.Exception IsNot Nothing Then
            dvContact.ChangeMode(DetailsViewMode.ReadOnly)
        End If
    End Sub

    Protected Sub dvContact_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles dvContact.ItemInserting
        Me.lblErrorDetails.Visible = False
    End Sub

    Protected Sub dvContact_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles dvContact.ItemUpdating
        Me.lblErrorDetails.Visible = False
    End Sub

    Protected Sub dsContact_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsContact.Inserting
        e.InputParameters(0) = Request.QueryString(0)
    End Sub

    Protected Sub dsContact_Deleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsContact.Deleting
        e.InputParameters(0) = dvContact.SelectedValue
    End Sub

    Protected Sub dsContact_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsContact.Inserted
        ''dsHotelContacts.DataBind()
        'gwContacts.DataBind()
        ''dsContact.DataBind()
        'dvContact.DataBind()
        Response.Redirect("HotelContacts.aspx?HotelID=" & Request.QueryString(0))
    End Sub

    Protected Sub dsHotelContacts_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsHotelContacts.Inserted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error inserting Contact", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            'gwContacts.DataBind()
            'dvContact.DataBind()
            Response.Redirect("HotelContacts.aspx?HotelID=" & Request.QueryString(0))
        End If
    End Sub

    Protected Sub dsContact_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsContact.Deleted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error deleting Contact", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            'gwContacts.DataBind()
            'dvContact.DataBind()
            Response.Redirect("HotelContacts.aspx?HotelID=" & Request.QueryString(0))
        End If
    End Sub

    Protected Sub dsHotelContacts_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsHotelContacts.Deleted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error deleting Contact", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            gwContacts.DataBind()
            dvContact.DataBind()
            Response.Redirect("HotelContacts.aspx?HotelID=" & Request.QueryString(0))
        End If

    End Sub

    Protected Sub dsContact_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsContact.Updated
        ''dsHotelContacts.DataBind()
        'gwContacts.DataBind()
        ''dsContact.DataBind()
        'dvContact.DataBind()
    End Sub

    Protected Sub dsHotelContacts_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsHotelContacts.Updated
        If e.Exception IsNot Nothing Then
            popShow(False, "Error editing Contact", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            gwContacts.DataBind()
            dvContact.DataBind()
            Response.Redirect("HotelContacts.aspx?HotelID=" & Request.QueryString(0))
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

End Class
