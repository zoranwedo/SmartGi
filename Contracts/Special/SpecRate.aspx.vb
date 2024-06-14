﻿Partial Class Contracts_Special_SpecRate
    Inherits System.Web.UI.Page

    'Protected Sub DetailsView1_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles dvContractRate.DataBinding
    '    Dim cmp As Contracts_Special_masterSpecial = CType(Master, Contracts_Special_masterSpecial)
    '    Dim pr As New dsMaintHotelTableAdapters.HotelRoomTypeTableAdapter
    '    Dim p As New dsMaintHotelTableAdapters.HotelOcuppancyTableAdapter
    '    Try
    '        Dim r As dsMaintHotel.HotelOcuppancyRow = p.GetData(cmp.fvSpecialMasterPage.DataKey.Item(1).ToString).Rows(0)
    '        Dim rr As dsMaintHotel.HotelRoomTypeRow = pr.GetDataByHotelAndRoom(cmp.fvSpecialMasterPage.DataKey.Item(1).ToString, gvRates.SelectedDataKey.Item(3).ToString).Rows(0)
    '        Dim ddl As DropDownList = CType(sender, DetailsView).FindControl("ddlRateExtra")
    '        'Dim maxocc As Integer
    '        Dim occroom As Integer = rr.MaxOccupancy
    '        Dim adonly As Boolean = False


    '        If r IsNot Nothing Then

    '            If Not rr.MaxOccupancy = Nothing Then
    '                occroom = rr.MaxOccupancy

    '                Dim i As Integer
    '                For i = 1 To 10
    '                    If i > occroom Then
    '                        dvContractRate.Fields(i + 3).HeaderStyle.ForeColor = Drawing.Color.Silver
    '                        dvContractRate.Fields(i + 3).Visible = False
    '                    Else
    '                        dvContractRate.Fields(i + 3).HeaderStyle.ForeColor = dvContractRate.Fields(0).HeaderStyle.ForeColor
    '                        dvContractRate.Fields(i + 3).Visible = True
    '                    End If
    '                Next

    '                If r.ChldCategories = 0 Then
    '                    Dim cb As CheckBox = dvContractRate.FindControl("cbLock")
    '                    If cb IsNot Nothing Then cb.Checked = False
    '                End If


    '                If Not String.IsNullOrEmpty(gvRates.SelectedDataKey.Item(2)) Then
    '                    adonly = Hotels.AdultsOnly(Int32.Parse(gvRates.SelectedDataKey.Item(1)))
    '                End If

    '                If adonly Then
    '                    For i = 15 To 19
    '                        dvContractRate.Fields(i).Visible = False
    '                    Next
    '                Else
    '                    dvContractRate.Fields(15).Visible = r.ChldCategories > 0
    '                    If Not r.IsChld1ShLabelNull Then dvContractRate.Fields(16).HeaderText = r.Chld1ShLabel & " (" & r.Chld1AgShLabel & ")"
    '                    dvContractRate.Fields(16).Visible = r.ChldCategories > 0
    '                    If Not r.IsChld2ShLabelNull Then dvContractRate.Fields(17).HeaderText = r.Chld2ShLabel & " (" & r.Chld2AgShLabel & ")"
    '                    dvContractRate.Fields(17).Visible = r.ChldCategories > 1
    '                    If Not r.IsChld3ShLabelNull Then dvContractRate.Fields(18).HeaderText = r.Chld3ShLabel & " (" & r.Chld3AgShLabel & ")"
    '                    dvContractRate.Fields(18).Visible = r.ChldCategories > 2
    '                    If Not r.IsChld4ShLabelNull Then dvContractRate.Fields(19).HeaderText = r.Chld4ShLabel & " (" & r.Chld4AgShLabel & ")"
    '                    dvContractRate.Fields(19).Visible = r.ChldCategories > 3
    '                End If

    '            End If
    '        End If
    '    Catch ex As Exception

    '    End Try
    'End Sub

    Protected Sub DetailsView1_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles dvContractRate.DataBinding
        Try
            Dim p As New ContractsTableAdapters.ContractOccupancyTableAdapter
            Dim t As Contracts.ContractOccupancyDataTable = p.GetDataByContractID(ddlContract.SelectedValue)
            Dim r As Contracts.ContractOccupancyRow = Nothing

            Dim ddl As DropDownList = CType(sender, DetailsView).FindControl("ddlRateExtra")

            If t.Count > 0 Then r = t.Rows(0)

            If r IsNot Nothing Then
                Dim maxocc As Integer = r.MaxOccupancy
                Dim i As Integer
                For i = 1 To 10
                    If i > maxocc Then
                        dvContractRate.Fields(i + 3).HeaderStyle.ForeColor = Drawing.Color.Silver
                        dvContractRate.Fields(i + 3).Visible = False
                    Else
                        dvContractRate.Fields(i + 3).HeaderStyle.ForeColor = dvContractRate.Fields(0).HeaderStyle.ForeColor
                        dvContractRate.Fields(i + 3).Visible = True
                    End If
                Next

                If r.ChldCategories = 0 Then
                    Dim cb As CheckBox = dvContractRate.FindControl("cbLock")
                    If cb IsNot Nothing Then cb.Checked = False
                End If
                dvContractRate.Fields(15).Visible = r.ChldCategories > 0
                If Not r.IsChld1ShLabelNull Then dvContractRate.Fields(16).HeaderText = r.Chld1ShLabel & " (" & r.Chld1AgShLabel & ")"
                dvContractRate.Fields(16).Visible = r.ChldCategories > 0
                If Not r.IsChld2ShLabelNull Then dvContractRate.Fields(17).HeaderText = r.Chld2ShLabel & " (" & r.Chld2AgShLabel & ")"
                dvContractRate.Fields(17).Visible = r.ChldCategories > 1
                If Not r.IsChld3ShLabelNull Then dvContractRate.Fields(18).HeaderText = r.Chld3ShLabel & " (" & r.Chld3AgShLabel & ")"
                dvContractRate.Fields(18).Visible = r.ChldCategories > 2
                If Not r.IsChld4ShLabelNull Then dvContractRate.Fields(19).HeaderText = r.Chld4ShLabel & " (" & r.Chld4AgShLabel & ")"
                dvContractRate.Fields(19).Visible = r.ChldCategories > 3
            End If
        Catch ex As Exception
        End Try
    End Sub

    Protected Sub cbLock_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        If CType(sender, CheckBox).Checked Then
            For i = 1 To 4
                If dvContractRate.Fields(i + 15).Visible Then
                    dvContractRate.Rows(i + 15).Enabled = False
                End If
            Next
        Else
            For i = 1 To 4
                If dvContractRate.Fields(i + 15).Visible Then
                    dvContractRate.Rows(i + 15).Enabled = True
                End If
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

    Protected Sub dsRateDetail_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsRateDetail.Updated
        If e.Exception IsNot Nothing Then
            popShow(False, "Error editing Rates", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            dvContractRate.DataBind()
        End If
    End Sub

    Protected Sub btnCopyCutOff_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim conid As Int32 = Int32.Parse(Request.QueryString(0))
        Dim cutoff As Int32 = Nothing

        Dim perid As String = CType(dvContractRate.FindControl("lblPeriodId"), Label).Text

        If dvContractRate.FindControl("txtCutOff") Is Nothing Then
            With CType(dvContractRate.FindControl("lblCutOff"), Label)
                If Not String.IsNullOrEmpty(.Text) Then cutoff = Int32.Parse(.Text)
            End With
        Else
            With CType(dvContractRate.FindControl("txtCutOff"), TextBox)
                If Not String.IsNullOrEmpty(.Text) Then cutoff = Int32.Parse(.Text)
            End With
        End If

        Try
            Dim cont As New ContractsTableAdapters.ContractRateTableAdapter
            cont.Copy_CutOff(cutoff, conid, perid)
        Catch ex As Exception
            popShow(False, "Error Copy CutOff", ex.InnerException.Message)
        End Try
    End Sub

    Protected Sub btnCopyAllot_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim conid As Int32 = Int32.Parse(Request.QueryString(0))
        Dim allot As Int32 = Nothing
        Dim nullv As Boolean = False

        Dim rtid As String = CType(dvContractRate.FindControl("lblRoomTID"), Label).Text

        If dvContractRate.FindControl("txtAllotment") Is Nothing Then
            With CType(dvContractRate.FindControl("lblAllotment"), Label)
                If Not String.IsNullOrEmpty(.Text) Then
                    allot = Int32.Parse(.Text)
                Else
                    nullv = True
                End If

            End With
        Else
            With CType(dvContractRate.FindControl("txtAllotment"), TextBox)
                If Not String.IsNullOrEmpty(.Text) Then
                    allot = Int32.Parse(.Text)
                Else
                    nullv = True
                End If

            End With
        End If

        Dim cont As New ContractsTableAdapters.ContractRateTableAdapter
        Try
            If nullv Then
                cont.Copy_Allotment(Nothing, conid, rtid)
            Else
                cont.Copy_Allotment(allot, conid, rtid)
            End If
        Catch ex As Exception
            popShow(False, "Error Copy Allotment", ex.InnerException.Message)
        End Try

    End Sub

    Protected Sub cbLock_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        cbLock_CheckedChanged(sender, e)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim cmp As Contracts_Special_masterSpecial = CType(Master, Contracts_Special_masterSpecial)

        If Not IsNothing(cmp) Then
            AddHandler cmp.btnWizFinishMasterPage.Click, AddressOf btnWizFinishMasterPage_Click
        End If

        If Not Master.CanEdit Then
            dvContractRate.DefaultMode = DetailsViewMode.ReadOnly
        End If
        
    End Sub

    Protected Sub btnWizFinishMasterPage_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        'Dim q As New dsSpecialTableAdapters.SpecialTableAdapter
        Dim q As New dsSpecialTableAdapters.QueriesTableAdapter

        Try
            dvContractRate.UpdateItem(False)
        Catch ex As Exception
            popShow(False, "Error editing rates", ex.InnerException.Message)
        End Try

        If cbActivate.Checked Then
            Try
                'q.UpdateState(1, Request.QueryString(0))
                q.SpecialActivate(Request.QueryString(0))
            Catch ex As Exception
                popShow(False, "Error Activating Special", ex.InnerException.Message)
            End Try
        End If

        Me.Response.Redirect("~/Contracts/Specials.aspx", True)
    End Sub

    Protected Sub dvContractRate_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewCommandEventArgs) Handles dvContractRate.ItemCommand
        If e.CommandName = "Next" Then
            dvContractRate.UpdateItem(False)
            gvRates.SelectedIndex = gvRates.SelectedIndex + 1
        ElseIf e.CommandName = "Prev" Then
            dvContractRate.UpdateItem(False)
            gvRates.SelectedIndex = gvRates.SelectedIndex - 1
        End If
    End Sub

    Protected Sub dvContractRate_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles dvContractRate.DataBound
        If gvRates.Rows.Count > 1 And dvContractRate.CurrentMode = DetailsViewMode.Edit Then
            If gvRates.SelectedIndex = gvRates.Rows.Count - 1 Then
                dvContractRate.FindControl("btnNext").Visible = False
                dvContractRate.FindControl("btnNext1").Visible = False
            Else
                dvContractRate.FindControl("btnNext").Visible = True
                dvContractRate.FindControl("btnNext1").Visible = True
            End If

            If gvRates.SelectedIndex = 0 Then
                dvContractRate.FindControl("btnPrev").Visible = False
                dvContractRate.FindControl("btnPrev1").Visible = False
            Else
                dvContractRate.FindControl("btnPrev").Visible = True
                dvContractRate.FindControl("btnPrev1").Visible = True
            End If
        Else
            cbActivate.Visible = False
        End If
    End Sub

    Protected Sub dvContractRate_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles dvContractRate.ItemInserted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error editing Rates", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub ddlContract_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlContract.SelectedIndexChanged
        gvRates.SelectedIndex = 0
    End Sub
End Class