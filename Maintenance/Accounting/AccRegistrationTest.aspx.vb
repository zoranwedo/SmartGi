
Partial Class Maintenance_Accounting_AccRegistrationTest
    Inherits System.Web.UI.Page

    Protected Sub gvAccType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim gv As GridView = sender
        Dim gvr As GridViewRow = CType(sender, GridView).NamingContainer

        Dim txt As TextBox = gvr.FindControl("txtDebitCode")
        Dim txtAcc As TextBox = gvr.FindControl("txtDebitAccount")
        'txt.Text = gv.SelectedValue
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
        txt.Text = gv.SelectedValue
        If (txtAcc IsNot Nothing) Then txtAcc.Text = gv.SelectedDataKey.Item(1)
        Dim pop As AjaxControlToolkit.PopupControlExtender
        pop = AjaxControlToolkit.PopupControlExtender.GetProxyForCurrentPopup(Page)
        pop.Commit(gv.SelectedValue)
    End Sub

End Class
