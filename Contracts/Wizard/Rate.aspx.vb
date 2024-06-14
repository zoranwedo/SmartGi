
Partial Class Contracts_Wizard_Rate
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Dim cmp As Contracts_Wizard_masterWizard = CType(Master, Contracts_Wizard_masterWizard)

        'If Not IsNothing(cmp) Then
        '    AddHandler cmp.btnWizNextMasterPage.Click, AddressOf btnWizNextMasterPage_Click
        '    dvContractRate.Visible = Not cmp.CanEdit
        '    dvContractRateMD.Visible = cmp.CanEdit

        '    'If Not cmp.CanEdit Then dvContractRate.DefaultMode = DetailsViewMode.ReadOnly
        'End If

        AddHandler Master.btnWizNextMasterPage.Click, AddressOf btnWizNextMasterPage_Click
        dvContractRate.Visible = Master.CanEdit
        dvContractRateMD.Visible = Not Master.CanEdit

    End Sub

    Protected Sub dvContractRate_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles dvContractRate.DataBinding, dvContractRateMD.DataBinding
        Dim dv As DetailsView = CType(sender, DetailsView)
        Dim cID As Integer = Int32.Parse(Request.QueryString(0))

        If gvRates.Rows.Count > 0 Then
            Dim p As New ContractsTableAdapters.ContractOccupancyTableAdapter
            Dim pr As New ContractsTableAdapters.ContractMaxRoomOccupamcyTableAdapter

            Dim r As Contracts.ContractOccupancyRow = p.GetDataByContractID(cID).Rows(0)
            Dim rr As Contracts.ContractMaxRoomOccupamcyRow = pr.GetData(cID, gvRates.SelectedDataKey.Item(3)).Rows(0)
            Dim ddl As DropDownList = dv.FindControl("ddlRateExtra")

            Dim maxocc As Integer = r.MaxOccupancy
            Dim occroom As Integer = rr.MaxROccupancy

            Dim adonly As Boolean = False

            If r IsNot Nothing Then
                Dim i As Integer
                For i = 1 To 10
                    If i > occroom Then
                        dv.Fields(i + 4).HeaderStyle.ForeColor = Drawing.Color.Silver
                        dv.Fields(i + 4).Visible = False
                    Else
                        dv.Fields(i + 4).HeaderStyle.ForeColor = dv.Fields(1).HeaderStyle.ForeColor
                        dv.Fields(i + 4).Visible = True
                    End If
                Next

                If r.ChldCategories = 0 Then
                    Dim cb As CheckBox = dv.FindControl("cbLock")
                    If cb IsNot Nothing Then cb.Checked = False
                End If

                If Not String.IsNullOrEmpty(gvRates.SelectedDataKey.Item(2)) Then
                    adonly = Hotels.AdultsOnly(Int32.Parse(gvRates.SelectedDataKey.Item(1)))
                End If

                If adonly Then
                    For i = 16 To 20
                        dv.Fields(i).Visible = False
                    Next
                Else
                    dv.Fields(16).Visible = r.ChldCategories > 0    'LockChRates
                    dv.Fields(17).Visible = r.ChldCategories > 0    'Chld1
                    If r.ChldCategories > 0 Then If Not r.IsChld1ShLabelNull Then dv.Fields(17).HeaderText = r.Chld1ShLabel & " (" & r.Chld1AgShLabel & ")"
                    dv.Fields(18).Visible = r.ChldCategories > 1    'Chld2
                    If r.ChldCategories > 1 Then If Not r.IsChld2ShLabelNull Then dv.Fields(18).HeaderText = r.Chld2ShLabel & " (" & r.Chld2AgShLabel & ")"
                    dv.Fields(19).Visible = r.ChldCategories > 2    'Chld3
                    If r.ChldCategories > 2 Then If Not r.IsChld3ShLabelNull Then dv.Fields(19).HeaderText = r.Chld3ShLabel & " (" & r.Chld3AgShLabel & ")"
                    dv.Fields(20).Visible = r.ChldCategories > 3    'Chld4
                    If r.ChldCategories > 3 Then If Not r.IsChld4ShLabelNull Then dv.Fields(20).HeaderText = r.Chld4ShLabel & " (" & r.Chld4AgShLabel & ")"
                End If
            End If
        End If
    End Sub

    Protected Sub dvContractRate_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles dvContractRate.DataBound
        If gvRates.Rows.Count > 0 And dvContractRate.CurrentMode = DetailsViewMode.Edit Then
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


            CType(dvContractRate.FindControl("ddlRateOption"), DropDownList).Enabled = Master.CanEdit
            ' CType(dvContractRate.FindControl("ddlRateExtra"), DropDownList).Enabled = Master.CanEdit
            CType(dvContractRate.FindControl("txtAllotment"), TextBox).Enabled = Master.CanEdit
            CType(dvContractRate.FindControl("txtCutOff"), TextBox).Enabled = Master.CanEdit

        End If
    End Sub

    Protected Sub cbLock_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        If CType(sender, CheckBox).Checked Then
            For i = 1 To 4
                If dvContractRate.Fields(i + 16).Visible Then
                    dvContractRate.Rows(i + 16).Enabled = False
                End If
            Next
        Else
            For i = 1 To 4
                If dvContractRate.Fields(i + 16).Visible Then
                    dvContractRate.Rows(i + 16).Enabled = True
                End If
            Next
        End If
    End Sub

    Protected Sub popShow(ByVal Title As String, ByVal Message As String)
        popMessage.Text = Message
        popLabel.Text = Title
        popExtender.Show()
    End Sub

    Protected Sub dsRateDetail_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsRateDetail.Updated, dsRateDetailMD.Updated
        If e.Exception IsNot Nothing Then
            popShow("Error editing Rates", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            dvContractRate.DataBind()
        End If
    End Sub

    Protected Sub btnCopyCutOff_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim conid As Int32 = Int32.Parse(Request.QueryString(0))
        Dim dv As DetailsView = CType(sender, LinkButton).NamingContainer
        Dim cutoff As Int32 = Nothing

        Dim perid As String = gvRates.SelectedDataKey(5)

        If dv.FindControl("txtCutOff") Is Nothing Then
            With CType(dv.FindControl("lblCutOff"), Label)
                If Not String.IsNullOrEmpty(.Text) Then cutoff = Int32.Parse(.Text)
            End With
        Else
            With CType(dv.FindControl("txtCutOff"), TextBox)
                If Not String.IsNullOrEmpty(.Text) Then cutoff = Int32.Parse(.Text)
            End With
        End If

        Try
            Dim cont As New ContractsTableAdapters.ContractRateTableAdapter
            cont.Copy_CutOff(cutoff, conid, perid)
        Catch ex As Exception
            popShow("Error Copy CutOff", ex.InnerException.Message)
        End Try
        
    End Sub

    Protected Sub btnCopyAllot_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim conid As Int32 = Int32.Parse(Request.QueryString(0))
        Dim dv As DetailsView = CType(sender, LinkButton).NamingContainer
        Dim allot As Int32 = Nothing
        Dim nullv As Boolean = False

        Dim rtid As String = gvRates.SelectedDataKey(3)

        If dv.FindControl("txtAllotment") Is Nothing Then
            With CType(dv.FindControl("lblAllotment"), Label)
                If Not String.IsNullOrEmpty(.Text) Then
                    allot = Int32.Parse(.Text)
                Else
                    nullv = True
                End If

            End With
        Else
            With CType(dv.FindControl("txtAllotment"), TextBox)
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
            popShow("Error Copy Allotment", ex.InnerException.Message)
        End Try
        
    End Sub

    Protected Sub cbLock_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        cbLock_CheckedChanged(sender, e)
    End Sub

    Protected Sub btnWizNextMasterPage_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If Master.CanEdit Then
            Try
                dvContractRate.UpdateItem(False)
            Catch ex As Exception
                popShow("Error editing rates", ex.Message)
            End Try
        End If
    End Sub

    Protected Sub dvContractRate_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewCommandEventArgs) Handles dvContractRate.ItemCommand
        If e.CommandName = "Next" Then
            dvContractRate.UpdateItem(False)
            gvRates.SelectedIndex = gvRates.SelectedIndex + 1
        ElseIf e.CommandName = "Prev" Then
            dvContractRate.UpdateItem(False)
            gvRates.SelectedIndex = gvRates.SelectedIndex - 1
        End If

        'If e.CommandName = "EditRate" Then
        '    Dim q As New ContractsTableAdapters.QueriesTableAdapter
        '    Dim canedit As Integer
        '    Dim cond As Nullable(Of Date)
        '    Dim rateID As Int32 = Int32.Parse(gvRates.SelectedDataKey.Value)  'CType(CType(sender, Button).NamingContainer, DetailsView).SelectedValue
        '    Dim msg As String = ""

        '    Try
        '        q.ContractRateCanEdit(rateID, canedit, cond)

        '        Select Case (canedit)
        '            Case 0
        '                msg = "You can't edit this rate"
        '                popShow("Edit Rates", msg)
        '            Case 1
        '                msg = "Rate can be freely editing."
        '                q.ContractRateEdit(rateID, cond)
        '                dvContractRate.ChangeMode(DetailsViewMode.Edit)
        '            Case 2
        '                msg = "Rate can be edit but has to be split to date: " + cond.ToString
        '                popShow("Edit Rates", msg)
        '                q.ContractRateEdit(rateID, cond)
        '                gvRates.DataBind()
        '                gvRates.SelectedIndex += 1
        '                dvContractRate.ChangeMode(DetailsViewMode.Edit)
        '        End Select

        '    Catch ex As Exception
        '        popShow("Edit Rates", ex.Message)
        '    End Try

        'End If

    End Sub

    Protected Sub dvContractRate_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles dvContractRate.ItemUpdated

        If e.Exception Is Nothing And Master.CanEdit = False Then
            Dim q As New ContractsTableAdapters.QueriesTableAdapter

            Try
                q.ContractRateEndEdit(Int32.Parse(Request.QueryString(0)))
            Catch ex As Exception
                popShow("Finish Editing Rates", ex.Message)
            End Try

        End If
    End Sub

    Protected Sub btnNo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNo.Click

    End Sub
End Class
