
Partial Class Maintenance_Accounting_AccTransfer2
    Inherits System.Web.UI.Page
    Dim WithEvents txtApplyTo As New TextBox
    Dim WithEvents pnlApplyTO As New Panel


    Protected Sub gvApplyTo_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim gv As GridView = sender
        Dim fv As FormView = newAccDocClass   'CType(sender, GridView).NamingContainer
        Dim flt As String = ""


        Dim gvr As GridViewRow = gv.SelectedRow
        Dim lblTrClass As Label = gvr.FindControl("lblTrClass")
        Dim lblDocClass As Label = gvr.FindControl("lblTrDocClass")
        Dim lblTypeClass As Label = gvr.FindControl("lblTrTypeClass")
        Dim lblAccTypeID As Label = gvr.FindControl("lblAccountTypeID")
        Dim lblAccType As Label = gvr.FindControl("lblAccountType")
        Dim lblTrSign As Label = gvr.FindControl("lblTrSign")
        Dim lblTrCode As Label = gvr.FindControl("lblTrCode")

        'Dim txtApplyTo As TextBox = fv.FindControl("txtApplyTo")
        Dim txt As TextBox = fv.FindControl("txtClass")
        Dim txtDocClass As TextBox = fv.FindControl("txtDocClass")
        Dim txtTypeClass As TextBox = fv.FindControl("txtTypeClass")
        Dim txtAcTypeID As TextBox = fv.FindControl("txtAccTypeID")
        Dim txtAccType As TextBox = fv.FindControl("txtAccType")
        Dim ddlTrSgn As DropDownList = fv.FindControl("ddlTrSgn")
        Dim txtCode As TextBox = fv.FindControl("txtTrCode")

        'Dim dsource As ObjectDataSource = CType(fv.FindControl("dsDebitCode"), ObjectDataSource)
        'Dim csource As ObjectDataSource = CType(fv.FindControl("dsCreditCode"), ObjectDataSource)


        txt.Text = lblTrClass.Text
        txtDocClass.Text = lblDocClass.Text
        txtTypeClass.Text = lblTypeClass.Text
        txtCode.Text = lblTrCode.Text


        ddlTrSgn.SelectedValue = lblTrSign.Text
        ddlTrSgn.Enabled = False
        txtAcTypeID.Text = lblAccTypeID.Text
        txtAccType.Text = lblAccType.Text


        'flt = "AccountType = " + lblAccType.Text

        flt = lblAccType.Text

        txtApplyTo.Text = gv.SelectedValue

        Dim pop As AjaxControlToolkit.PopupControlExtender
        pop = AjaxControlToolkit.PopupControlExtender.GetProxyForCurrentPopup(Page)
        pop.Commit(gv.SelectedValue)


        Try
            If Not String.IsNullOrEmpty(lblTrSign.Text) Then
                If lblTrSign.Text = "C" Then
                    'dsDebitCode.FilterExpression = flt
                    'dsCreditCode.FilterExpression = ""
                    hfFilterD.Value = flt
                    hfFilterC.Value = ""
                    'dsource.FilterExpression = flt
                    'csource.FilterExpression = ""
                Else
                    'dsDebitCode.FilterExpression = ""
                    'dsCreditCode.FilterExpression = flt
                    hfFilterC.Value = flt
                    hfFilterD.Value = ""
                    'dsource.FilterExpression = ""
                    'csource.FilterExpression = flt
                End If
            End If
        Catch ex As Exception

            popShow(False, "Error Updating", ex.InnerException.Message)

        End Try


        ' dsDebitCode.DataBind()
        'dsCreditCode.DataBind()




    End Sub

    Protected Sub newAccDocClass_ModeChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewModeEventArgs) Handles newAccDocClass.ModeChanging
        If e.NewMode = FormViewMode.Insert Then
            pnlApplyTo.Visible = True
            txtApplyTo.Text = ""
        Else
            pnlApplyTo.Visible = False
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

    Protected Sub dsCreditCode_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles dsCreditCode.DataBinding
        If String.IsNullOrEmpty(hfFilterC.Value) Then
            dsCreditCode.FilterExpression = ""
        Else
            dsCreditCode.FilterExpression = "AccountType" + hfFilterC.Value
        End If
    End Sub

    Protected Sub dsDebitCode_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles dsDebitCode.DataBinding
        If String.IsNullOrEmpty(hfFilterD.Value) Then
            dsDebitCode.FilterExpression = ""
        Else
            dsDebitCode.FilterExpression = "AccountType" + hfFilterD.Value
        End If
    End Sub

    Protected Sub gvCreditCode_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
        If String.IsNullOrEmpty(hfFilterC.Value) Then
            dsCreditCode.FilterExpression = ""
        Else
            dsCreditCode.FilterExpression = "AccountType" + hfFilterC.Value
        End If
    End Sub

    Protected Sub gridAccClass_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles gridAccClass.RowEditing
        Dim gvr As GridViewRow = gridAccClass.Rows(e.NewEditIndex)

        'If gvr.Cells(4).Text = "C" Then
        '    dsDebitCode.FilterExpression = "AccountType" + gvr.Cells(2).Text
        '    dsDebitCode.FilterExpression = ""
        'Else
        '    dsDebitCode.FilterExpression = ""
        '    dsDebitCode.FilterExpression = "AccountType" + gvr.Cells(2).Text
        'End If

        'CType(gvr.FindControl("gvCreditCode"), GridView).DataBind()
        'CType(gvr.FindControl("gvDebitCode"), GridView).DataBind()

        If gvr.Cells(4).Text = "C" Then
            hfFilterD.Value = gvr.Cells(2).Text
            hfFilterC.Value = ""
        Else
            hfFilterD.Value = ""
            hfFilterC.Value = gvr.Cells(2).Text
        End If

        gvr.Cells(2).Enabled = False
        gvr.Cells(5).Enabled = False


    End Sub

    Protected Sub gvDebitCode_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)

        'If String.IsNullOrEmpty(hfFilterD.Value) Then
        '    dsDebitCode.FilterExpression = ""
        'Else
        '    dsDebitCode.FilterExpression = "AccountType" + hfFilterD.Value
        'End If

        'CType(sender, GridView).DataBind()
    End Sub

    Protected Sub gvDebitCode_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        'If String.IsNullOrEmpty(hfFilterD.Value) Then
        '    dsDebitCode.FilterExpression = ""
        'Else
        '    dsDebitCode.FilterExpression = "AccountType" + hfFilterD.Value
        'End If

        'CType(sender, GridView).DataBind()
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
            dsDebitCode.FilterExpression = ""
        Else
            dsDebitCode.FilterExpression = "AccountType='" + hfFilterD.Value + "'"
        End If

        'CType(sender, GridView).DataBind()
    End Sub

    Protected Sub gvCreditCode_PreRender(ByVal sender As Object, ByVal e As System.EventArgs)

        If String.IsNullOrEmpty(hfFilterC.Value) Then
            dsCreditCode.FilterExpression = ""
        Else
            dsCreditCode.FilterExpression = "AccountType='" + hfFilterC.Value + "'"
        End If
    End Sub
End Class
