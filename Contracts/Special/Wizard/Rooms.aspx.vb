
Partial Class Contracts_Special_Wizard_Rooms
    Inherits System.Web.UI.Page

    Private c As Contracts.ContractOccupancyRow = Nothing

    Private Function GetCategories() As Contracts.ContractOccupancyRow
        If c Is Nothing Then
            Dim p As New ContractsTableAdapters.ContractOccupancyTableAdapter
            c = p.GetDataByContractID(Int32.Parse(Request.QueryString(0))).Rows(0)
        End If

        Return c
    End Function

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
        For Each row As GridViewRow In gridRoom.Rows
            gridRoom.UpdateRow(row.RowIndex, False)
        Next
        gvRooms.DataBind()

    End Sub

    Protected Sub btnRoomToggle_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        For Each row As GridViewRow In gridRoom.Rows
            Dim cb As CheckBox = row.FindControl("cbRoomSel")
            cb.Checked = Not cb.Checked
        Next
    End Sub

    Protected Sub gvOccupancy_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvOccupancy.DataBinding
        Dim r As Contracts.ContractOccupancyRow = GetCategories()
        If r IsNot Nothing Then
            gvOccupancy.Columns(4).Visible = r.ChldCategories > 0
            If Not r.IsChld1ShLabelNull Then gvOccupancy.Columns(4).HeaderText = r.Chld1ShLabel
            If Not r.IsChld1AgShLabelNull Then gvOccupancy.Columns(4).FooterText = r.Chld1AgShLabel
            gvOccupancy.Columns(5).Visible = r.ChldCategories > 1
            If Not r.IsChld2ShLabelNull Then gvOccupancy.Columns(5).HeaderText = r.Chld2ShLabel
            If Not r.IsChld2AgShLabelNull Then gvOccupancy.Columns(5).FooterText = r.Chld2AgShLabel
            gvOccupancy.Columns(6).Visible = r.ChldCategories > 2
            If Not r.IsChld3ShLabelNull Then gvOccupancy.Columns(6).HeaderText = r.Chld3ShLabel
            If Not r.IsChld3AgShLabelNull Then gvOccupancy.Columns(6).FooterText = r.Chld3AgShLabel
            gvOccupancy.Columns(7).Visible = r.ChldCategories > 3
            If Not r.IsChld4ShLabelNull Then gvOccupancy.Columns(7).HeaderText = r.Chld4ShLabel
            If Not r.IsChld4AgShLabelNull Then gvOccupancy.Columns(7).FooterText = r.Chld4AgShLabel
        End If
    End Sub

    Protected Sub gvRooms_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvRooms.DataBinding
        Dim r As Contracts.ContractOccupancyRow = GetCategories()
        If r IsNot Nothing Then
            gvRooms.Columns(2).Visible = r.ChldCategories > 0
            gvRooms.Columns(9).Visible = r.ChldCategories > 0
            gvRooms.Columns(3).Visible = r.ChldCategories > 0
            If Not r.IsChld1LabelNull Then gvRooms.Columns(3).HeaderText = r.Chld1ShLabel
            If Not r.IsChld1AgLabelNull Then gvRooms.Columns(3).FooterText = r.Chld1AgShLabel
            gvRooms.Columns(4).Visible = r.ChldCategories > 1
            If Not r.IsChld2LabelNull Then gvRooms.Columns(4).HeaderText = r.Chld2ShLabel
            If Not r.IsChld2AgLabelNull Then gvRooms.Columns(4).FooterText = r.Chld2AgShLabel
            gvRooms.Columns(5).Visible = r.ChldCategories > 2
            If Not r.IsChld3LabelNull Then gvRooms.Columns(5).HeaderText = r.Chld3ShLabel
            If Not r.IsChld3AgLabelNull Then gvRooms.Columns(5).FooterText = r.Chld3AgShLabel
            gvRooms.Columns(6).Visible = r.ChldCategories > 3
            If Not r.IsChld4LabelNull Then gvRooms.Columns(6).HeaderText = r.Chld4ShLabel
            If Not r.IsChld4AgLabelNull Then gvRooms.Columns(6).FooterText = r.Chld4AgShLabel
        End If
    End Sub

    Protected Sub fvOccupancy_ItemCreated(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvOccupancy.ItemCreated
        If fvOccupancy.CurrentMode = FormViewMode.Insert Then
            Dim p As New ContractsTableAdapters.ContractOccupancyTableAdapter
            Dim r As Contracts.ContractOccupancyRow = p.GetDataByContractID(Int32.Parse(Request.QueryString(0))).Rows(0)
            Dim txt1 As TextBox = CType(fvOccupancy.FindControl("Chld1TextBox"), TextBox)
            Dim txt2 As TextBox = CType(fvOccupancy.FindControl("Chld2TextBox"), TextBox)
            Dim txt3 As TextBox = CType(fvOccupancy.FindControl("Chld3TextBox"), TextBox)
            Dim txt4 As TextBox = CType(fvOccupancy.FindControl("Chld4TextBox"), TextBox)

            If r IsNot Nothing Then
                txt1.Visible = r.ChldCategories > 0
                txt2.Visible = r.ChldCategories > 1
                txt3.Visible = r.ChldCategories > 2
                txt4.Visible = r.ChldCategories > 3
            End If
        End If
    End Sub

    Protected Sub fvOccupancy_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvOccupancy.DataBound
        Dim r As Contracts.ContractOccupancyRow = GetCategories()
        If r IsNot Nothing Then
            Dim l As Label = fvOccupancy.FindControl("lblEmpty")
            If l IsNot Nothing Then l.Width = (r.ChldCategories + 1) * 50
        End If
    End Sub

    Protected Sub dsRoomOccupancy_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsRoomOccupancy.Updated
        If e.Exception IsNot Nothing Then
            popShow(False, "Occupancy", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub gvOccupancy_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles gvOccupancy.RowUpdated
        If e.Exception IsNot Nothing Then
            popShow(False, "Occupancy", e.Exception.Message)
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub dsRooms_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsRooms.Updated
        If e.Exception IsNot Nothing Then
            popShow(False, "Rooms", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        End If
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
                If (gvRooms.EditIndex >= 0) Then
                    gvRooms.UpdateRow(gvRooms.EditIndex, False)
                End If

                If (gvOccupancy.EditIndex >= 0) Then
                    gvOccupancy.UpdateRow(gvOccupancy.EditIndex, False)
                End If

                btnUpdate0_Click(sender, e)
            Catch ex As Exception
                popShow(False, "Error while updating page", ex.InnerException.Message)
            End Try
        End If
    End Sub
End Class
