
Partial Class Contracts_Special_Wizard_Detail
    Inherits System.Web.UI.Page
    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        
        'If cbAllMP.Checked Then
        '    'Dim q As New dsSpecialTableAdapters.QueriesTableAdapter
        '    'q.DeleteSpecialMP(Int32.Parse(Master.hfSpecialIDMasterPage.Value))
        '    Dim q As New ContractsTableAdapters.QueriesTableAdapter
        '    Try
        '        q.DeleteContractMP(Int32.Parse(Request.QueryString(0)))
        '    Catch ex As Exception
        '        popShow(False, "Error deleting Special", ex.Message)
        '    End Try

        'Else
        For Each row As GridViewRow In gridMealPlan.Rows
            gridMealPlan.UpdateRow(row.RowIndex, False)
        Next
        '  End If
    End Sub

    Protected Sub btnUpdate0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate0.Click
        If cbAllRooms.Checked Then
            Dim q As New dsSpecialTableAdapters.QueriesTableAdapter
            q.DeleteSpecialRoom(Int32.Parse(Master.hfSpecialIDMasterPage.Value))
        Else
            For Each row As GridViewRow In gridRoomType.Rows
                gridRoomType.UpdateRow(row.RowIndex, False)
            Next
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

    Protected Sub dsContractDetail_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsContractDetail.Deleted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error deleting Special", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            Response.Redirect("~/Contracts/Specials.aspx")
        End If
    End Sub

    'Protected Sub dsRateType_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsRateType.Updated
    '    If e.Exception IsNot Nothing Then
    '        popShow(False, "Error editing Rate Type", e.Exception.InnerException.Message)
    '        e.ExceptionHandled = True
    '    End If
    'End Sub

    Protected Sub dsContractDetail_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsContractDetail.Updated, dsContractDetail.Inserted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error editing Special", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            fvContract.DataBind()
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim cmp As Contracts_Special_Wizard_masterWizard = CType(Master, Contracts_Special_Wizard_masterWizard)
        Dim q As New dsSpecialTableAdapters.QueriesTableAdapter

        If Not IsNothing(cmp) Then
            AddHandler cmp.btnWizNextMasterPage.Click, AddressOf btnWizNextMasterPage_Click
            'btnUpdate0.Visible = cmp.CanEdit
        End If

        'If Not (Page.IsPostBack) Then
        '    Master.hfSpecialIDMasterPage.Value = q.SpecialIDFromContract(Request.QueryString(0))
        'End If

    End Sub
    Protected Sub btnWizNextMasterPage_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If fvSpec.CurrentMode = DetailsViewMode.Edit Then
            fvSpec.UpdateItem(False)

            If Master.CanEdit() Then
                Try
                    btnUpdate_Click(sender, e)
                    btnUpdate0_Click(sender, e)
                Catch ex As Exception
                    popShow(False, "Error", ex.InnerException.Message)
                End Try
            End If
End If


    End Sub

    'Protected Sub dsContractDetail_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsContractDetail.Updating
    '    Dim CntYear As Nullable(Of Integer) = Nothing
    '    Dim CntTitle As String = Nothing
    '    Dim res As Int32

    '    CntYear = Int32.Parse(CType(dvContractDetail.FindControl("YearTextBox"), TextBox).Text)
    '    CntTitle = (CType(dvContractDetail.FindControl("ddlTitle"), DropDownList).SelectedValue)

    '        Dim p As New ContractsTableAdapters.ContractTitleTableAdapter
    '        res = p.IsValidTitleForYear(CntTitle, CntYear)
    '        If res = 0 Then
    '            popShow(False, "Error", "Title is not corresponding with year!")
    '            e.Cancel = True
    '        End If

    'End Sub



    'Protected Sub gridMealPlan_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gridMealPlan.DataBound
    '    gridMealPlan.Enabled = (gridMealPlan.Rows.Count > 1)
    '    btnUpdate.Visible = (gridMealPlan.Rows.Count > 1) And Master.CanEdit()
    'End Sub



    Protected Sub fvContract_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewDeletedEventArgs) Handles fvContract.ItemDeleted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error deleting Special", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            Response.Redirect("~/Contracts/Specials.aspx")
        End If
    End Sub
    '  Protected Sub cbAllMP_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbAllMP.CheckedChanged
    'If cbAllMP.Checked Then
    '    For Each c As Control In gridMealPlan.Rows
    '        CType(c.FindControl("CheckBox1"), CheckBox).Checked = False
    '    Next
    '    gridMealPlan.Enabled = False
    'Else
    '    gridMealPlan.Enabled = True
    'End If
    '  End Sub

    Protected Sub cbAllRooms_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbAllRooms.CheckedChanged
        If cbAllRooms.Checked Then
            For Each c As Control In gridRoomType.Rows
                CType(c.FindControl("CheckBox3"), CheckBox).Checked = False
            Next
            gridRoomType.Enabled = False
        Else
            gridRoomType.Enabled = True
        End If
    End Sub
    Protected Sub gridMealPlan_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gridMealPlan.DataBound
        'Dim q As New dsSpecialTableAdapters.QueriesTableAdapter
        'Dim i As Integer = q.SpecialMPCount(Int32.Parse(Master.hfSpecialIDMasterPage.Value))
        'Dim q As New ContractsTableAdapters.QueriesTableAdapter
        'Dim i As Integer = q.ContractMPCount(Int32.Parse(Request.QueryString(0)))

        'cbAllMP.Checked = (i = 0)
        'gridMealPlan.Enabled = (i = 0)
    End Sub

    Protected Sub gridRoomType_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gridRoomType.DataBound
        Dim q As New dsSpecialTableAdapters.QueriesTableAdapter
        Dim i As Integer = q.SpecialRoomCount(Int32.Parse(Master.hfSpecialIDMasterPage.Value))
        cbAllRooms.Checked = (i = 0)
        gridRoomType.Enabled = (i = 0)
    End Sub
    Protected Sub fvSpec_ModeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvContract.ModeChanged
        Dim b As Boolean = (fvContract.CurrentMode = FormViewMode.Edit)
        pnlRoom.Enabled = b
        pnlMP.Enabled = b
        If b Then
            gridRoomType.Enabled = Not cbAllRooms.Checked
            ' gridMealPlan.Enabled = Not cbAllMP.Checked
            fvSpec.ChangeMode(FormViewMode.Edit)
        Else
            fvSpec.ChangeMode(FormViewMode.ReadOnly)
        End If

        'btnUpdate0.Visible = (fvSpec.CurrentMode = FormViewMode.Edit)
        'btnUpdate.Visible = (fvSpec.CurrentMode = FormViewMode.Edit)
    End Sub

    Protected Sub fvSpec_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvContract.DataBound
        Dim b As Button = fvSpec.FindControl("btEdit")
        Dim d As Button = fvSpec.FindControl("btnDelete")

        If b IsNot Nothing Then b.Visible = (ModificationRights.RightsAdmin Or (Int32.Parse(b.CommandArgument) < 1)) And Master.CanEdit()
        If d IsNot Nothing Then d.Visible = (ModificationRights.RightsAdmin Or (Int32.Parse(b.CommandArgument) < 1)) And Master.CanEdit()
    End Sub

    Protected Sub dsSpec_Changed(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsContractDetail.Updated
        If e.Exception IsNot Nothing Then
            popShow(False, "Error Special", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            btnUpdate_Click(sender, New System.EventArgs)
            btnUpdate0_Click(sender, New System.EventArgs)
        End If
    End Sub

    Protected Sub dsMealPlan_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsMealPlan.Updated
        If e.Exception IsNot Nothing Then
            popShow(False, "Error editing MP", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub dsRoomType_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsRoomType.Updated
        If e.Exception IsNot Nothing Then
            popShow(False, "Error editing Room Type", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        End If
    End Sub

    'Protected Sub btnWizNextMasterPage_Click(ByVal sender As Object, ByVal e As System.EventArgs)
    '    If fvSpec.CurrentMode = DetailsViewMode.Edit Then
    '        fvSpec.UpdateItem(False)

    '        Try
    '            btnUpdate_Click(sender, e)
    '            btnUpdate0_Click(sender, e)
    '        Catch ex As Exception
    '            popShow(False, "Error", ex.InnerException.Message)
    '        End Try
    '    End If
    'End Sub
    Protected Sub fvSpec_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles fvSpec.ItemCommand
        'If e.CommandName = "Deactivate" Then
        '    Dim q As New dsSpecialTableAdapters.QueriesTableAdapter
        '    q.SpecialDeactivate(Int32.Parse(Request.QueryString("SpecialID")))
        '    Response.Redirect("~/Contracts/Special/DetailSpec.aspx?SpecialID=" & Request.QueryString("SpecialID"))
        'ElseIf e.CommandName = "Activate" Then
        '    Dim q As New dsSpecialTableAdapters.QueriesTableAdapter
        '    q.SpecialActivate(Int32.Parse(Request.QueryString("SpecialID")))
        '    Response.Redirect("~/Contracts/Special/DetailSpec.aspx?SpecialID=" & Request.QueryString("SpecialID"))

        'End If
    End Sub

    Protected Sub fvContract_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles fvContract.ItemUpdated
        fvSpec.UpdateItem(False)
    End Sub
End Class
