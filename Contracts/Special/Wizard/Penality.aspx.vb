
Partial Class Contracts_Special_Wizard_Penality
    Inherits System.Web.UI.Page

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
        Dim cmp As Contracts_Special_Wizard_masterWizard = CType(Master, Contracts_Special_Wizard_masterWizard)

        If Not IsNothing(cmp) Then
            AddHandler cmp.btnWizNextMasterPage.Click, AddressOf btnWizNextMasterPage_Click
        End If
    End Sub

    Protected Sub btnWizNextMasterPage_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If Master.CanEdit Then
            Try

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

    Protected Sub dsCancelation_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsCancelation.Deleted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error deleting", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            gvCancel.DataBind()
        End If
    End Sub

    Protected Sub dsCancelation_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsCancelation.Inserted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error inserting", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            gvCancel.DataBind()
        End If
    End Sub

    Protected Sub dsNoShow_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsNoShow.Deleted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error deleting", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            gvNoShow.DataBind()
        End If
    End Sub

    Protected Sub dsNoShow_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsNoShow.Inserted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error inserting", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            gvNoShow.DataBind()
        End If
    End Sub

    Protected Sub btnNsNew_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        'Dim ins As Integer
        'ins = dsNoShow.Insert()
        Dim q As New ContractsTableAdapters.QueriesTableAdapter
        Try
            q.ContractNoShowCreate(Int32.Parse(Request.QueryString(0)))
            gvNoShow.DataBind()
        Catch ex As Exception
            popShow(False, "Error while updating page", ex.InnerException.Message)
        End Try
        
    End Sub

    Protected Sub btCancNew_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        dsCancelation.Insert()
    End Sub

    Protected Sub dsNoShow_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsNoShow.Updated
        If e.Exception IsNot Nothing Then
            popShow(False, "Error editing", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            gvNoShow.DataBind()
        End If
    End Sub

    Protected Sub dsCancelation_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsCancelation.Updated
        If e.Exception IsNot Nothing Then
            popShow(False, "Error editing", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            gvCancel.DataBind()
        End If
    End Sub

    Protected Sub btnNsDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim q As New ContractsTableAdapters.QueriesTableAdapter
        Try
            q.ContractNoShowRemove(Int32.Parse(Request.QueryString(0)))
            gvNoShow.DataBind()
        Catch ex As Exception
            popShow(False, "Error deleting", ex.InnerException.Message)
        End Try
        
    End Sub

    Protected Sub gvNoShow_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvNoShow.DataBound
        If gvNoShow.Rows.Count > 0 Then
            fvOccupancy.Visible = True
        Else
            fvOccupancy.Visible = False
        End If
    End Sub

    Protected Sub btnNsNew1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim q As New ContractsTableAdapters.QueriesTableAdapter
        Try
            q.ContractCancelationCreate(Int32.Parse(Request.QueryString(0)))
            gvCancel.DataBind()
        Catch ex As Exception
            popShow(False, "Error creating", ex.InnerException.Message)
        End Try
    End Sub

    Protected Sub btCancDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim q As New ContractsTableAdapters.QueriesTableAdapter
        Try
            q.ContractCancelationRemove(Int32.Parse(Request.QueryString(0)))
            gvCancel.DataBind()
        Catch ex As Exception
            popShow(False, "Error deleting", ex.InnerException.Message)
        End Try
    End Sub

    Protected Sub gvCancel_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvCancel.DataBound
        If gvCancel.Rows.Count > 0 Then
            fvCancelation.Visible = True
        Else
            fvCancelation.Visible = False
        End If
    End Sub
End Class
