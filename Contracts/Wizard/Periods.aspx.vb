
Partial Class Contracts_Wizard_Periods
    Inherits System.Web.UI.Page

    Protected Sub popShow(ByVal Title As String, ByVal ex As Exception)
        Dim Message As String = ex.Message

        If ex.InnerException IsNot Nothing Then Message = ex.InnerException.Message
        popMessage.Text = Message
        popLabel.Text = Title
        btnYes.Visible = False
        btnNo.Text = "OK"

        popExtender.Show()
    End Sub

    Protected Sub dsPeriods_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsPeriods.Inserted, dsPeriods.Updated, dsPeriods.Deleted
        If e.Exception IsNot Nothing Then
            popShow("Error Period", e.Exception)
            e.ExceptionHandled = True
        Else
            gridPeriods.DataBind()
        End If

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
                If (gridPeriods.EditIndex >= 0) Then
                    gridPeriods.UpdateRow(gridPeriods.EditIndex, False)
                End If

            Catch ex As Exception
                popShow("Error while updating page", ex)
            End Try
        End If
    End Sub

    Protected Sub gridPeriods_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles gridPeriods.RowUpdated
        If e.Exception IsNot Nothing Then
            popShow("Error Period", e.Exception)
            e.ExceptionHandled = True
        Else
            gridPeriods.DataBind()
        End If
    End Sub

    Protected Sub ibSplit_Command(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs)
        Dim pid As Integer = e.CommandArgument
        Dim uid As String = My.User.Name
        Dim q As New ContractsTableAdapters.QueriesTableAdapter
        Try
            q.ContractPeriodSplit(pid, uid)
            gridPeriods.DataBind()
        Catch ex As Exception
            popShow("Split Period", ex)
        End Try
    End Sub
End Class
