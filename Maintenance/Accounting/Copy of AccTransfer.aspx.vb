
Partial Class Maintenance_Accounting_AccTransfer
    Inherits System.Web.UI.Page

    Protected Sub gvApplyTo_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim gv As GridView = sender
        Dim fv As FormView = CType(sender, GridView).NamingContainer
        Dim flt As String = ""


        Dim gvr As GridViewRow = gv.SelectedRow

        Dim lblTrClass As Label = gvr.FindControl("lblTrClass")
        Dim lblDocClass As Label = gvr.FindControl("lblTrDocClass")
        Dim lblTypeClass As Label = gvr.FindControl("lblTrTypeClass")
        Dim lblAccTypeID As Label = gvr.FindControl("lblAccountTypeID")
        Dim lblAccType As Label = gvr.FindControl("lblAccountType")
        Dim lblTrSign As Label = gvr.FindControl("lblTrSign")
        Dim lblTrCode As Label = gvr.FindControl("lblTrCode")

        Dim txtApplyTo As TextBox = fv.FindControl("txtApplyTo")
        Dim txt As TextBox = fv.FindControl("txtClass")
        Dim txtDocClass As TextBox = fv.FindControl("txtDocClass")
        Dim txtTypeClass As TextBox = fv.FindControl("txtTypeClass")
        Dim txtAcTypeID As TextBox = fv.FindControl("txtAccTypeID")
        Dim txtAccType As TextBox = fv.FindControl("txtAccType")
        Dim ddlTrSgn As DropDownList = fv.FindControl("ddlTrSgn")
        Dim txtCode As TextBox = fv.FindControl("txtTrCode")

        Dim dsource As ObjectDataSource = CType(fv.FindControl("dsDebitCode"), ObjectDataSource)
        Dim csource As ObjectDataSource = CType(fv.FindControl("dsCreditCode"), ObjectDataSource)

       
        txt.Text = lblTrClass.Text
        txtDocClass.Text = lblDocClass.Text
        txtTypeClass.Text = lblTypeClass.Text
        txtCode.Text = lblTrCode.Text


        ddlTrSgn.SelectedValue = lblTrSign.Text
        ddlTrSgn.Enabled = False
        txtAcTypeID.Text = lblAccTypeID.Text    
        txtAccType.Text = lblAccType.Text


        flt = "AccountType = " + lblAccType.Text

        txtApplyTo.Text = gv.SelectedValue

        Dim pop As AjaxControlToolkit.PopupControlExtender
        pop = AjaxControlToolkit.PopupControlExtender.GetProxyForCurrentPopup(Page)
        pop.Commit(gv.SelectedValue)


        'Try
        '    If Not String.IsNullOrEmpty(lblTrSign.Text) Then
        '        If lblTrSign.Text = "C" Then
        '            'dsDebitCode.FilterExpression = flt
        '            'dsCreditCode.FilterExpression = ""
        '            'dsource.FilterExpression = flt
        '            'csource.FilterExpression = ""
        '        Else
        '            'dsDebitCode.FilterExpression = ""
        '            'dsCreditCode.FilterExpression = flt
        '            'dsource.FilterExpression = ""
        '            'csource.FilterExpression = flt
        '        End If
        '    End If
        'Catch ex As Exception

        '    popShow(False, "Error Updating", ex.InnerException.Message)

        'End Try


        'dsDebitCode.DataBind()
        'dsCreditCode.DataBind()

        


    End Sub

    Protected Sub newAccDocClass_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles newAccDocClass.ItemInserting

    End Sub

    Protected Sub newAccDocClass_ModeChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewModeEventArgs) Handles newAccDocClass.ModeChanging

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
