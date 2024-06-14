
Partial Class Maintenance_Accounting_AccTransfer
    Inherits System.Web.UI.Page
    'Dim WithEvents txtApplyTo As New TextBox
    'Dim WithEvents pnlApplyTO As New Panel


    Protected Sub gvApplyTo_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim gv As GridView = sender
        Dim gvr As GridViewRow = gv.SelectedRow
        Dim lblDocClass As Label = gvr.FindControl("lblTrDocClass")
        Dim lblTypeClass As Label = gvr.FindControl("lblTrTypeClass")
        Dim lblTrClass As Label = gvr.FindControl("lblTrClass")
        Dim lblTrCode As Label = gvr.FindControl("lblTrCode")
        Dim lblAccTypeID As Label = gvr.FindControl("lblAccountTypeID")
        Dim lblAccType As Label = gvr.FindControl("lblAccountType")
        Dim lblTrSign As Label = gvr.FindControl("lblTrSign")

        Dim fv As FormView = newAccDocClass   'CType(sender, GridView).NamingContainer
        Dim txtApplyTo As TextBox = fv.FindControl("txtApplyTo")
        Dim hfDocClass As HiddenField = fv.FindControl("hfDocClass")
        Dim hfTypeClass As HiddenField = fv.FindControl("hfTypeClass")
        Dim hfTrClass As HiddenField = fv.FindControl("hfTrClass")
        Dim hfTrCode As HiddenField = fv.FindControl("hfTrCode")
        Dim txtAccTypeID As TextBox = fv.FindControl("txtAccTypeID")
        Dim txtAccType As TextBox = fv.FindControl("txtAccType")
        Dim ddlTrSgn As DropDownList = fv.FindControl("ddlTrSgn")

        txtApplyTo.Text = gv.SelectedValue
        hfDocClass.Value = lblDocClass.Text
        hfTypeClass.Value = lblTypeClass.Text
        hfTrClass.Value = lblTrClass.Text
        hfTrCode.Value = lblTrCode.Text
        txtAccTypeID.Text = lblAccTypeID.Text
        txtAccType.Text = lblAccType.Text
        ddlTrSgn.SelectedValue = lblTrSign.Text

        Dim flt As String = lblAccType.Text

        Dim pop As AjaxControlToolkit.PopupControlExtender
        pop = AjaxControlToolkit.PopupControlExtender.GetProxyForCurrentPopup(Page)
        pop.Commit(gv.SelectedValue)

        Try
            If Not String.IsNullOrEmpty(lblTrSign.Text) Then
                If lblTrSign.Text = "C" Then
                    hfFilterD.Value = flt
                    hfFilterC.Value = ""
                    CType(fv.FindControl("txtDebitCode"), TextBox).Enabled = True
                    CType(fv.FindControl("txtCreditCode"), TextBox).Enabled = True
                Else
                    hfFilterC.Value = flt
                    hfFilterD.Value = ""
                    CType(fv.FindControl("txtDebitCode"), TextBox).Enabled = True
                    CType(fv.FindControl("txtCreditCode"), TextBox).Enabled = True
                End If
            End If
        Catch ex As Exception
            popShow(False, "Error Updating", ex.InnerException.Message)
        End Try
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

    Protected Sub gvDebitCode_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim gv As GridView = sender
        Dim gvr As GridViewRow = gv.SelectedRow
        Dim fv As FormView = CType(sender, GridView).NamingContainer

        Dim txt As TextBox = fv.FindControl("txtDebitCode")
        Dim txtAcc As TextBox = fv.FindControl("txtDebitAccount")
        Dim txtType As TextBox = fv.FindControl("txtDebitType")
        Dim txtTypeID As TextBox = fv.FindControl("txtDebitTypeID")

        txt.Text = gv.SelectedDataKey.Item(0)
        If (txtAcc IsNot Nothing) Then txtAcc.Text = gvr.Cells.Item(2).Text
        If (txtType IsNot Nothing) Then txtType.Text = gvr.Cells.Item(3).Text
        If (txtTypeID IsNot Nothing) Then txtTypeID.Text = gvr.Cells.Item(4).Text

        Dim pop As AjaxControlToolkit.PopupControlExtender
        pop = AjaxControlToolkit.PopupControlExtender.GetProxyForCurrentPopup(Page)
        pop.Commit(gv.SelectedValue)
    End Sub

    Protected Sub gvCreditCode_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim gv As GridView = sender
        Dim gvr As GridViewRow = gv.SelectedRow
        Dim fv As FormView = CType(sender, GridView).NamingContainer

        Dim txt As TextBox = fv.FindControl("txtCreditCode")
        Dim txtAcc As TextBox = fv.FindControl("txtCreditAccount")
        Dim txtType As TextBox = fv.FindControl("txtCreditType")
        Dim txtTypeID As TextBox = fv.FindControl("txtCreditTypeID")

        txt.Text = gv.SelectedDataKey.Item(0)
        If (txtAcc IsNot Nothing) Then txtAcc.Text = gvr.Cells.Item(2).Text
        If (txtType IsNot Nothing) Then txtType.Text = gvr.Cells.Item(3).Text
        If (txtTypeID IsNot Nothing) Then txtTypeID.Text = gvr.Cells.Item(4).Text

        Dim pop As AjaxControlToolkit.PopupControlExtender
        pop = AjaxControlToolkit.PopupControlExtender.GetProxyForCurrentPopup(Page)
        pop.Commit(gv.SelectedValue)
    End Sub

    Protected Sub gvDebitCode_SelectedIndexChanged1(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim gv As GridView = sender
        Dim gvr As GridViewRow = CType(sender, GridView).NamingContainer
        Dim gvrs As GridViewRow = CType(sender, GridView).SelectedRow

        Dim txt As TextBox = gvr.FindControl("txtDebitCode")
        Dim txtAcc As TextBox = gvr.FindControl("txtDebitAccount")
        Dim txtType As TextBox = gvr.FindControl("txtDebitType")
        Dim txtTypeID As TextBox = gvr.FindControl("txtDebitTypeID")

        txt.Text = gv.SelectedDataKey.Item(0)
        If (txtAcc IsNot Nothing) Then txtAcc.Text = gvrs.Cells.Item(2).Text
        If (txtType IsNot Nothing) Then txtType.Text = gvrs.Cells.Item(3).Text
        If (txtTypeID IsNot Nothing) Then txtTypeID.Text = gvrs.Cells.Item(4).Text

        Dim pop As AjaxControlToolkit.PopupControlExtender
        pop = AjaxControlToolkit.PopupControlExtender.GetProxyForCurrentPopup(Page)
        pop.Commit(gv.SelectedValue)
    End Sub

    Protected Sub gvCreditCode_SelectedIndexChanged1(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim gv As GridView = sender
        Dim gvr As GridViewRow = CType(sender, GridView).NamingContainer
        Dim gvrs As GridViewRow = CType(sender, GridView).SelectedRow

        Dim txt As TextBox = gvr.FindControl("txtCreditCode")
        Dim txtAcc As TextBox = gvr.FindControl("txtCreditAccount")
        Dim txtType As TextBox = gvr.FindControl("txtCreditType")
        Dim txtTypeID As TextBox = gvr.FindControl("txtCreditTypeID")

        txt.Text = gv.SelectedDataKey.Item(0)
        If (txtAcc IsNot Nothing) Then txtAcc.Text = gvrs.Cells.Item(2).Text
        If (txtType IsNot Nothing) Then txtType.Text = gvrs.Cells.Item(3).Text
        If (txtTypeID IsNot Nothing) Then txtTypeID.Text = gvrs.Cells.Item(4).Text

        Dim pop As AjaxControlToolkit.PopupControlExtender
        pop = AjaxControlToolkit.PopupControlExtender.GetProxyForCurrentPopup(Page)
        pop.Commit(gv.SelectedValue)
    End Sub

    Protected Sub gridAccClass_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles gridAccClass.RowEditing
        Dim gvr As GridViewRow = gridAccClass.Rows(e.NewEditIndex)
        Dim hfEAccType As HiddenField = gvr.FindControl("hfEAccTypeID")

        If gvr.Cells(3).Text = "C" Then
            hfFilterD.Value = hfEAccType.Value
            hfFilterC.Value = ""
        Else
            hfFilterD.Value = ""
            hfFilterC.Value = hfEAccType.Value
        End If

        'gvr.Cells(2).Enabled = False
        'gvr.Cells(5).Enabled = False

    End Sub

    Protected Sub dsAccTransfer_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccTransfer.Deleted
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

    Protected Sub dsAccTransfer_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccTransfer.Inserted
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

    Protected Sub dsAccTransfer_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccTransfer.Updated
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

    Protected Sub gvDebitCode_PreRender(ByVal sender As Object, ByVal e As System.EventArgs)
        If String.IsNullOrEmpty(hfFilterD.Value) Then
            dsDebitCode.FilterExpression = "AccountType<>'G'"
        Else
            dsDebitCode.FilterExpression = "AccountType='" + hfFilterD.Value + "'"
        End If
        dsDebitCode.DataBind()
    End Sub

    Protected Sub gvCreditCode_PreRender(ByVal sender As Object, ByVal e As System.EventArgs)
        If String.IsNullOrEmpty(hfFilterC.Value) Then
            dsCreditCode.FilterExpression = "AccountType<>'G'"
        Else
            dsCreditCode.FilterExpression = "AccountType='" + hfFilterC.Value + "'"
        End If
        dsCreditCode.DataBind()
    End Sub

    Protected Sub gridAccClass_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gridAccClass.RowCommand
        If e.CommandName = "Edit" Then
            Dim cSign As String = Left(e.CommandArgument, 1)
            Dim cAccType As String = Right(e.CommandArgument, Len(e.CommandArgument) - 2)

            If cSign = "C" Then
                dsCreditCode.FilterExpression = "AccountType<>'G'"
                dsDebitCode.FilterExpression = "AccountType='" + cAccType + "'"
            Else
                dsCreditCode.FilterExpression = "AccountType='" + cAccType + "'"
                dsDebitCode.FilterExpression = "AccountType<>'G'"
            End If

            newAccDocClass.Enabled = False
        Else
            newAccDocClass.Enabled = True
        End If
    End Sub

    Protected Sub newAccDocClass_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles newAccDocClass.ItemCommand
        If e.CommandName = "New" Then
            gridAccClass.Enabled = False
        Else
            gridAccClass.Enabled = True
        End If
    End Sub
End Class
