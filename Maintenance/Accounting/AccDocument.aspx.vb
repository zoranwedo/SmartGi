
Partial Class Maintenance_Accounting_AccDocument
    Inherits System.Web.UI.Page

    Protected Sub gvAccType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim gv As GridView = sender
        Dim gvr As GridViewRow = CType(sender, GridView).NamingContainer

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

    Protected Sub dsAccDocument_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccDocument.Deleted
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

    Protected Sub dsAccDocument_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccDocument.Inserted
        If e.Exception IsNot Nothing Then
            Dim msgError As String = ""
            If e.Exception.InnerException IsNot Nothing Then
                msgError = e.Exception.InnerException.Message
            Else
                msgError = e.Exception.Message
            End If
            If msgError.Contains("AK_AccDocument_Code") Then msgError = "Document code have to be unique!"
            If msgError.Contains("AK_AccDocument_Account") Then msgError = "Document account have to be unique. <br />(try changing ord number)!"
            popShow(False, "Error Inserting", msgError)
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub dsAccDocument_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccDocument.Updated
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
        popExtender.Show()
    End Sub

    Protected Sub gvClass_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim gv As GridView = sender
        Dim gvr As GridViewRow = gv.SelectedRow
        Dim fv As FormView = CType(sender, GridView).NamingContainer

        Dim txtDocClass As TextBox = fv.FindControl("txtDocClass")
        Dim txtTypeClass As TextBox = fv.FindControl("txtTypeClass")
        Dim txtClass As TextBox = fv.FindControl("txtClass")
        Dim txtAcTypeID As TextBox = fv.FindControl("txtAccTypeID")
        Dim txtTranTypeID As TextBox = fv.FindControl("txtTranType")
        Dim txtDocTypeID As TextBox = fv.FindControl("txtDocType")
        Dim ddlTrSgn As DropDownList = fv.FindControl("ddlTrSgn")
        Dim cbStatic As CheckBox = fv.FindControl("cbStatic")
        Dim cbApprovable As CheckBox = fv.FindControl("cbApprovable")

        'Dim txtOrd As TextBox = fv.FindControl("txtOrd")
        'Dim txtCode As TextBox = fv.FindControl("txtCode")

        'Dim ord As Integer = 1
        'Dim qo As New dsAccountTableAdapters.QueriesTableAdapter
        'If Not String.IsNullOrEmpty(qo.SelectTrOrdClass(gvr.Cells(2).Text, gvr.Cells(3).Text, gvr.Cells(4).Text)) Then
        '   ord = Int32.Parse(qo.SelectTrOrdClass(gvr.Cells(2).Text, gvr.Cells(3).Text, gvr.Cells(4).Text)) + 1
        'End If

        'TrDocClass,TrTypeClass,TrClass,AccountTypeID,TranTypeID,DocTypeID,TrSign
        txtDocClass.Text = gv.SelectedDataKey("TrDocClass")
        txtTypeClass.Text = gv.SelectedDataKey("TrTypeClass")
        txtClass.Text = gv.SelectedDataKey("TrClass")
        txtAcTypeID.Text = gv.SelectedDataKey("AccountTypeID").ToString
        txtAcTypeID.Enabled = String.IsNullOrEmpty(txtAcTypeID.Text)
        txtTranTypeID.Text = gv.SelectedDataKey("TranTypeID").ToString
        txtTranTypeID.Enabled = String.IsNullOrEmpty(txtTranTypeID.Text)
        txtDocTypeID.Text = gv.SelectedDataKey("DocTypeID").ToString
        txtDocTypeID.Enabled = String.IsNullOrEmpty(txtDocTypeID.Text)
        If String.IsNullOrEmpty(gv.SelectedDataKey("TrSign").ToString) Then
            ddlTrSgn.Enabled = True
        Else
            ddlTrSgn.SelectedValue = gv.SelectedDataKey("TrSign")
            ddlTrSgn.Enabled = False
        End If

        If String.IsNullOrEmpty(txtTranTypeID.Text) Then
            cbStatic.Visible = False
        Else
            cbStatic.Visible = IIf(txtTranTypeID.Text = "01", True, False)
        End If

        cbApprovable.Checked = txtDocClass.Text = "ND" Or txtDocClass.Text = "NC"

        Dim pop As AjaxControlToolkit.PopupControlExtender
        pop = AjaxControlToolkit.PopupControlExtender.GetProxyForCurrentPopup(Page)
        pop.Commit(gv.SelectedValue)
    End Sub

    Protected Sub txtTranType_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim gv As GridView = sender
        Dim gvr As GridViewRow = gv.SelectedRow
        Dim fv As FormView = CType(sender, GridView).NamingContainer
        Dim cbStatic As CheckBox = fv.FindControl("cbStatic")
        Dim txtTranTypeID As TextBox = fv.FindControl("txtTranType")

        If String.IsNullOrEmpty(txtTranTypeID.Text) Then
            cbStatic.Visible = False
        Else
            cbStatic.Visible = IIf(txtTranTypeID.Text = "01", True, False)
        End If
    End Sub

    'Protected Sub gridAccClass_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles gridAccClass.RowUpdated

    'End Sub

    'Protected Sub gridAccClass_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles gridAccClass.RowUpdating

    'End Sub

    'Protected Sub gridAccClass_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gridAccClass.RowCommand
    '    'If e.CommandName = "Edit" Then
    '    '    Dim gv As GridView = sender
    '    '    Dim gvr As GridViewRow = gv.SelectedRow
    '    '    'e.CommandSource
    '    '    ' Dim fv As FormView = CType(sender, GridView).NamingContainer
    '    '    Dim cbStatic As CheckBox = gvr.FindControl("cbStatic")
    '    '    Dim txtTranTypeID As TextBox = gvr.FindControl("txtTranType")

    '    '    If String.IsNullOrEmpty(txtTranTypeID.Text) Then
    '    '        cbStatic.Visible = False
    '    '    Else
    '    '        cbStatic.Visible = IIf(txtTranTypeID.Text = "01", True, False)
    '    '    End If

    '    'End If

    'End Sub
End Class
