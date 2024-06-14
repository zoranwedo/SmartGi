
Partial Class Contracts_Special_FRSpecPeriod
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

    Protected Sub dsPeriods_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsPeriods.Inserted, dsPeriods.Updated, dsPeriods.Deleted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error Period", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            gridPeriods.DataBind()
        End If

    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim cmp As Contracts_Special_masterFRSpecial = CType(Master, Contracts_Special_masterFRSpecial)

        If Not IsNothing(cmp) Then
            AddHandler cmp.btnWizNextMasterPage.Click, AddressOf btnWizNextMasterPage_Click
        End If
    End Sub
    Protected Sub btnWizNextMasterPage_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Try
            If (gridPeriods.EditIndex >= 0) Then
                gridPeriods.UpdateRow(gridPeriods.EditIndex, False)
            End If

        Catch ex As Exception
            popShow(False, "Error while updating page", ex.InnerException.Message)
        End Try

    End Sub

    Protected Sub gridPeriods_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles gridPeriods.RowUpdated
        If e.Exception IsNot Nothing Then
            popShow(False, "Error Period", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            gridPeriods.DataBind()
        End If
    End Sub
End Class
