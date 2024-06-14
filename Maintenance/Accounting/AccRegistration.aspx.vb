
Partial Class Maintenance_Accounting_AccRegistration
    Inherits System.Web.UI.Page

    Protected Sub gvAccType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim gv As GridView = sender
        Dim gvr As GridViewRow = CType(sender, GridView).NamingContainer

        Dim txt As TextBox = gvr.FindControl("txtDebitCode")
        Dim txtAcc As TextBox = gvr.FindControl("txtDebitAccount")
        txt.Text = gv.SelectedDataKey.Item(0)
        If (txtAcc IsNot Nothing) Then txtAcc.Text = gv.SelectedDataKey.Item(1)
        Dim pop As AjaxControlToolkit.PopupControlExtender
        pop = AjaxControlToolkit.PopupControlExtender.GetProxyForCurrentPopup(Page)
        pop.Commit(gv.SelectedValue)
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

    Protected Sub gvCreditCode_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim gv As GridView = sender
        Dim gvr As GridViewRow = CType(sender, GridView).NamingContainer

        Dim txt As TextBox = gvr.FindControl("txtCreditCode")
        Dim txtAcc As TextBox = gvr.FindControl("txtCreditAccount")
        txt.Text = gv.SelectedDataKey.Item(0)
        If (txtAcc IsNot Nothing) Then txtAcc.Text = gv.SelectedDataKey.Item(1)
        Dim pop As AjaxControlToolkit.PopupControlExtender
        pop = AjaxControlToolkit.PopupControlExtender.GetProxyForCurrentPopup(Page)
        pop.Commit(gv.SelectedValue)
    End Sub

    Protected Sub txtCreditCode_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim txt As TextBox = CType(CType(sender, TextBox).NamingContainer, GridViewRow).FindControl("txtCreditAccount")
        If txt IsNot Nothing Then
            If CType(sender, TextBox).Text = "" Then txt.Text = ""
        End If

    End Sub

    Protected Sub txtDebitCode_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim txt As TextBox = CType(CType(sender, TextBox).NamingContainer, GridViewRow).FindControl("txtDebitAccount")
        If txt IsNot Nothing Then
            If CType(sender, TextBox).Text = "" Then txt.Text = ""
        End If
    End Sub

    Protected Sub dsAccRegDocument_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccRegDocument.Updated
        If e.Exception IsNot Nothing Then
            popShow(False, "Error Updating", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub gridAccClass_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles gridAccClass.RowEditing
        Dim gvr As GridViewRow = gridAccClass.Rows(e.NewEditIndex)

        If Not String.IsNullOrEmpty(gvr.Cells(6).Text) Then
            dsExtDoc.FilterExpression = "ExtSign = '" + gvr.Cells(6).Text + "'"
        End If

    End Sub
End Class
