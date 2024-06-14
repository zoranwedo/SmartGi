
Partial Class Contracts_Wizard_Detail
    Inherits System.Web.UI.Page

    Protected Sub btnMPUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMPUpdate.Click
        For Each row As GridViewRow In gridMealPlan.Rows
            gridMealPlan.UpdateRow(row.RowIndex, False)
        Next
    End Sub

    Protected Sub btnRTUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRTUpdate.Click 'btnUpdate0
        Dim cb As CheckBox
        Dim ta As New ContractsTableAdapters.SelectContractRateTypeTableAdapter
        Dim cid As Integer = Int32.Parse(Request.QueryString("ContractID"))
        Dim rid As String

        Try
            For Each row As GridViewRow In gridRateType.Rows
                cb = row.FindControl("cbRateTypeID")
                If cb IsNot Nothing Then
                    If cb.Checked Then
                        rid = row.Cells(2).Text
                        ta.ContractRateTypeUpdate(cid, rid)
                    End If
                End If
            Next
        Catch ex As Exception
            popShow("Error editing Rate Type", ex)
            gridRateType.DataBind()
        End Try
    End Sub

    Protected Sub popShow(ByVal Title As String, ByRef e As Exception)
        If e.InnerException IsNot Nothing Then
            popMessage.Text = e.InnerException.Message
        Else
            popMessage.Text = e.Message
        End If

        popLabel.Text = Title
        btnYes.Visible = False
        btnNo.Text = "OK"

        popExtender.Show()
    End Sub

    Protected Sub dsMealPlan_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsMealPlan.Updated
        If e.Exception IsNot Nothing Then
            popShow("Error editing MP", e.Exception)
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub dsContractDetail_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsContractDetail.Updated, dsContractDetail.Inserted
        If e.Exception IsNot Nothing Then
            popShow("Error editing Contract", e.Exception)
            e.ExceptionHandled = True
        Else
            dvContractDetail.DataBind()
        End If
    End Sub

    Protected Sub dvContractDetail_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) Handles dvContractDetail.ItemDeleted
        If e.Exception IsNot Nothing Then
            popShow("Error deleting Contract", e.Exception)
            e.ExceptionHandled = True
        Else
            Response.Redirect("~/Contracts/Contracts.aspx")
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim cmp As Contracts_Wizard_masterWizard = CType(Master, Contracts_Wizard_masterWizard)

        If Not IsNothing(cmp) Then
            AddHandler cmp.btnWizNextMasterPage.Click, AddressOf btnWizNextMasterPage_Click
            btnRTUpdate.Visible = cmp.CanEdit
            gridRateType.Enabled = cmp.CanEdit
            dvContractDetail.Visible = cmp.CanEdit
            dvContractDetailRO.Visible = Not cmp.CanEdit
        End If
    End Sub

    Protected Sub btnWizNextMasterPage_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If dvContractDetail.CurrentMode = DetailsViewMode.Edit Then
            dvContractDetail.UpdateItem(False)
        End If

        If Master.CanEdit() Then
            Try
                btnMPUpdate_Click(sender, e)
                btnRTUpdate_Click(sender, e)
            Catch ex As Exception
                popShow("Error", ex.InnerException)
            End Try
        End If

    End Sub

    Protected Sub gridMealPlan_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gridMealPlan.DataBound
        gridMealPlan.Enabled = (gridMealPlan.Rows.Count > 1)
        btnMPUpdate.Visible = (gridMealPlan.Rows.Count > 1) And Master.CanEdit()
    End Sub
End Class
