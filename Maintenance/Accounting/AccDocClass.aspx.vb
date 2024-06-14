
Partial Class Maintenance_Accounting_AccDocClass
    Inherits System.Web.UI.Page

    Protected Sub gvAccType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim gv As GridView = sender
        Dim gvr As GridViewRow = CType(sender, GridView).NamingContainer
        'Dim pop As AjaxControlToolkit.PopupControlExtender = newHotelRoom.FindControl("PopupControlExtender1")
        'If pop IsNot Nothing Then
        '    pop.Commit(gv.SelectedValue)
        'End If

        Dim txt As TextBox = gvr.FindControl("txtAccTypeID")
        txt.Text = gv.SelectedValue
        Dim pop As AjaxControlToolkit.PopupControlExtender
        pop = AjaxControlToolkit.PopupControlExtender.GetProxyForCurrentPopup(Page)
        pop.Commit(gv.SelectedValue)
    End Sub


    Protected Sub gvTranType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim gv As GridView = sender
        Dim gvr As GridViewRow = CType(sender, GridView).NamingContainer

        Dim txt As TextBox = gvr.FindControl("txtTranType")
        txt.Text = gv.SelectedValue
        Dim pop As AjaxControlToolkit.PopupControlExtender
        pop = AjaxControlToolkit.PopupControlExtender.GetProxyForCurrentPopup(Page)
        pop.Commit(gv.SelectedValue)
    End Sub

    Protected Sub gvDocType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim gv As GridView = sender
        Dim gvr As GridViewRow = CType(sender, GridView).NamingContainer

        Dim txt As TextBox = gvr.FindControl("txtDocType")
        txt.Text = gv.SelectedValue
        Dim pop As AjaxControlToolkit.PopupControlExtender
        pop = AjaxControlToolkit.PopupControlExtender.GetProxyForCurrentPopup(Page)
        pop.Commit(gv.SelectedValue)
    End Sub

    Protected Sub gvTranType_SelectedIndexChanged1(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim gv As GridView = sender
        Dim fv As FormView = CType(sender, GridView).NamingContainer

        Dim txt As TextBox = fv.FindControl("txtTranType")
        txt.Text = gv.SelectedValue
        Dim pop As AjaxControlToolkit.PopupControlExtender
        pop = AjaxControlToolkit.PopupControlExtender.GetProxyForCurrentPopup(Page)
        pop.Commit(gv.SelectedValue)
    End Sub

    Protected Sub gvAccType_SelectedIndexChanged1(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim gv As GridView = sender
        Dim fv As FormView = CType(sender, GridView).NamingContainer

        Dim txt As TextBox = fv.FindControl("txtAccTypeID")
        txt.Text = gv.SelectedValue
        Dim pop As AjaxControlToolkit.PopupControlExtender
        pop = AjaxControlToolkit.PopupControlExtender.GetProxyForCurrentPopup(Page)
        pop.Commit(gv.SelectedValue)
    End Sub

    Protected Sub gvDocType_SelectedIndexChanged1(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim gv As GridView = sender
        Dim fv As FormView = CType(sender, GridView).NamingContainer

        Dim txt As TextBox = fv.FindControl("txtDocType")
        txt.Text = gv.SelectedValue
        Dim pop As AjaxControlToolkit.PopupControlExtender
        pop = AjaxControlToolkit.PopupControlExtender.GetProxyForCurrentPopup(Page)
        pop.Commit(gv.SelectedValue)
    End Sub

    Protected Sub dsAccDocClass_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccDocClass.Deleted
        If e.Exception IsNot Nothing Then
            Dim msgError As String = ""
            If e.Exception.InnerException IsNot Nothing Then
                msgError = e.Exception.InnerException.Message
            Else
                msgError = e.Exception.Message
            End If
            popShow(False, "Error Deleting", msgError)
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub dsAccDocClass_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccDocClass.Inserted
        If e.Exception IsNot Nothing Then
            Dim msgError As String = ""
            If e.Exception.InnerException IsNot Nothing Then
                msgError = e.Exception.InnerException.Message
            Else
                msgError = e.Exception.Message
            End If
            popShow(False, "Error Inserting", msgError)
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub dsAccDocClass_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccDocClass.Updated
        If e.Exception IsNot Nothing Then
            Dim msgError As String = ""
            If e.Exception.InnerException IsNot Nothing Then
                msgError = e.Exception.InnerException.Message
            Else
                msgError = e.Exception.Message
            End If
            popShow(False, "Error Updating", msgError)
            e.ExceptionHandled = True
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

    Protected Sub newAccDocClass_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles newAccDocClass.ItemInserted

    End Sub

    Protected Sub newAccDocClass_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles newAccDocClass.ItemInserting

    End Sub

    Protected Sub gridAccClass_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gridAccClass.RowDataBound
        'If e.Row.RowType = DataControlRowType.DataRow Then
        '    If String.IsNullOrEmpty(e.Row.Cells(2).Text) Then
        '        e.Row.Style.Add(HtmlTextWriterStyle.BackgroundColor, "Yellow")
        '    Else
        '        e.Row.Style.Add(HtmlTextWriterStyle.BackgroundColor, "White")
        '    End If
        'End If

    End Sub

    Protected Sub gridAccClass_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles gridAccClass.RowUpdated

    End Sub

    Protected Sub gridAccClass_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gridAccClass.RowCreated
        
    End Sub
End Class
