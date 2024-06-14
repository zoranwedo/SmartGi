
Partial Class Contracts_Wizard_Penality
    Inherits System.Web.UI.Page

    Protected Sub dsCancelation_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsCancelation.Inserted, dsCancelation.Updated, dsCancelation.Deleted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error with Cancelation Policy", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            gvCancel.DataBind()
        End If
    End Sub

    Protected Sub dsNoShow_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsNoShow.Inserted, dsNoShow.Deleted, dsNoShow.Updated
        If e.Exception IsNot Nothing Then
            popShow(False, "Error with NoShow Policy", e.Exception.InnerException.Message)
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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim cmp As Contracts_Wizard_masterWizard = CType(Master, Contracts_Wizard_masterWizard)

        If Not IsNothing(cmp) Then
            AddHandler cmp.btnWizNextMasterPage.Click, AddressOf btnWizNextMasterPage_Click
        End If
    End Sub

    Protected Sub btnWizNextMasterPage_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If Master.CanEdit Then
            Try
                If (gvNoShow.EditIndex >= 0) Then
                    gvNoShow.UpdateRow(gvNoShow.EditIndex, False)
                End If

                If (gvCancel.EditIndex >= 0) Then
                    gvCancel.UpdateRow(gvCancel.EditIndex, False)
                End If

                If (gridPolicy.EditIndex >= 0) Then
                    gridPolicy.UpdateRow(gridPolicy.EditIndex, False)
                End If

            Catch ex As Exception
                popShow(False, "Error while updating page", ex.InnerException.Message)
            End Try
        End If
    End Sub

    Protected Sub cbNsChargeType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim gvr As GridViewRow = CType(CType(sender, DropDownList).NamingContainer, GridViewRow)
        Dim ddl As DropDownList = CType(sender, DropDownList)

        If gvr.FindControl("txtNsCharge") IsNot Nothing Then
            If ddl.SelectedValue = "2" Then
                CType(gvr.FindControl("txtNsCharge"), TextBox).Text = "0"
                CType(gvr.FindControl("txtNsCharge"), TextBox).Enabled = False
            Else
                CType(gvr.FindControl("txtNsCharge"), TextBox).Enabled = True
            End If
        End If
    End Sub

    Protected Sub cbCancCancelType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim gvr As GridViewRow = CType(CType(sender, DropDownList).NamingContainer, GridViewRow)
        Dim ddl As DropDownList = CType(sender, DropDownList)

        If gvr.FindControl("txtCancCharge") IsNot Nothing Then
            If ddl.SelectedValue = "2" Then
                CType(gvr.FindControl("txtCancCharge"), TextBox).Text = "0"
                CType(gvr.FindControl("txtCancCharge"), TextBox).Enabled = False
            Else
                CType(gvr.FindControl("txtCancCharge"), TextBox).Enabled = True
            End If
        End If
    End Sub

    Protected Sub cbINsChargeType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim fv As FormView = CType(CType(sender, DropDownList).NamingContainer, FormView)
        Dim ddl As DropDownList = CType(sender, DropDownList)

        If fv.FindControl("txtINsCharge") IsNot Nothing Then
            If ddl.SelectedValue = "2" Then
                CType(fv.FindControl("txtINsCharge"), TextBox).Text = "0"
                CType(fv.FindControl("txtINsCharge"), TextBox).Enabled = False
            Else
                CType(fv.FindControl("txtINsCharge"), TextBox).Enabled = True
            End If
        End If
    End Sub
End Class
