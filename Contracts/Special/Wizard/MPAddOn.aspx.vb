
Partial Class Contracts_Special_Wizard_MPAddOn
    Inherits System.Web.UI.Page
    Protected Sub dsHotelMPAdd_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsHotelMPAdd.Deleted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error deleting MPAddOn", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        End If
    End Sub
    Protected Sub dsHotelMPAdd_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsHotelMPAdd.Updated
        If e.Exception IsNot Nothing Then
            popShow(False, "Error editing MPAddOn", e.Exception.InnerException.Message)
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
    Protected Sub btnUpdate0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate0.Click
        For Each row As GridViewRow In gridAddOn.Rows
            gridAddOn.UpdateRow(row.RowIndex, False)
        Next
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim cmp As Contracts_Special_Wizard_masterWizard = CType(Master, Contracts_Special_Wizard_masterWizard)

        If Not IsNothing(cmp) Then
            AddHandler cmp.btnWizNextMasterPage.Click, AddressOf btnWizNextMasterPage_Click
        End If
        btnUpdate0.Visible = Master.CanEdit

    End Sub
    Protected Sub btnWizNextMasterPage_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If Master.CanEdit Then
            Try
                btnUpdate0_Click(sender, e)
            Catch ex As Exception
                popShow(False, "Error", ex.InnerException.Message)
            End Try
        End If
    End Sub
End Class
