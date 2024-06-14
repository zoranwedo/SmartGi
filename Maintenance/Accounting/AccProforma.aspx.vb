
Partial Class Maintenance_Accounting_AccProforma
    Inherits System.Web.UI.Page

    Protected Sub gvAccAppDocument_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim gv As GridView = sender
        If gv.SelectedIndex > -1 Then
            Dim TrDocID As Integer = gv.SelectedDataKey.Item("TrDocID")
            Dim TrCode As String = gv.SelectedDataKey.Item("TrCode")
            Dim AccountType As String = gv.SelectedDataKey.Item("AccountType")

            Dim pop As PopupControlExtender = newDocProforma.Row.FindControl("popAccAppDocument")
            Dim hfTrDocID As HiddenField = newDocProforma.Row.FindControl("hfTrDocID")
            Dim txtTrCode As TextBox = newDocProforma.Row.FindControl("txtTrCode")
            Dim txtAccountType As TextBox = newDocProforma.Row.FindControl("txtAccountType")
            Dim ddlTransferID As DropDownList = newDocProforma.Row.FindControl("ddlTransferID")
            hfTrDocID.Value = TrDocID
            txtTrCode.Text = TrCode
            txtAccountType.Text = AccountType
            ddlTransferID.Visible = AccountType <> "AR"
            ddlTransferID.DataBind()

            If AccountType <> "AR" Then
                dsAccAppTransfer.SelectParameters.Item("TrDocID").DefaultValue = TrDocID
                ddlTransferID.DataBind()
            End If

            'pop.Cancel()
            pop.Commit(TrCode)
        End If

    End Sub

    Protected Sub dsAccAppTransfer_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles dsAccAppTransfer.Selecting
        Dim gv As GridView = newDocProforma.FindControl("gvAccAppDocument")
        If gv IsNot Nothing Then
            If gv.SelectedIndex > -1 Then
                Dim TrDocID As Integer = gv.SelectedDataKey.Item("TrDocID")
                e.InputParameters("TrDocID") = TrDocID
            End If
        End If
    End Sub

    Protected Sub dsAccDocProforma_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccDocProforma.Inserted
        If e.Exception IsNot Nothing Then
            msgPop.ShowError(e.Exception)
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub dsAccDocProforma_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsAccDocProforma.Inserting
        Dim ddlTransferID As DropDownList = newDocProforma.Row.FindControl("ddlTransferID")
        If ddlTransferID IsNot Nothing Then
            If ddlTransferID.SelectedItem IsNot Nothing Then e.InputParameters("TransferID") = ddlTransferID.SelectedValue
        End If
    End Sub

    Protected Sub gridDocProforma_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles gridDocProforma.RowDeleted
        If e.Exception IsNot Nothing Then
            msgPop.ShowError(e.Exception)
            e.ExceptionHandled = True
        End If
    End Sub
End Class
