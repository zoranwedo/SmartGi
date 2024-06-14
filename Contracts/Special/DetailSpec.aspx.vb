
Partial Class Contracts_Special_DetailSpec
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim qs As String = Request.QueryString(0)
        Dim cmp As Contracts_Special_masterSpecial = CType(Master, Contracts_Special_masterSpecial)

        If Not IsNothing(cmp) Then
            AddHandler cmp.btnWizNextMasterPage.Click, AddressOf btnWizNextMasterPage_Click
            pnlMP.Visible = Not cmp.IsFreeRate
            pnlRoom.Visible = Not cmp.IsNewFreeRate
        End If

        If qs = 0 Then
            fvSpec.ChangeMode(DetailsViewMode.Insert)
            pnlMP.Visible = False
            pnlRoom.Visible = False
            gvBlackoutsRO.Visible = False
            gvBlackouts.Visible = False
            fvBlackouts.Visible = False
        Else
            Dim b As Boolean = (fvSpec.CurrentMode = FormViewMode.Edit)
            gvBlackoutsRO.Visible = Not b
            gvBlackouts.Visible = b
            fvBlackouts.Visible = b
        End If
    End Sub

    Protected Sub cbAllMP_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbAllMP.CheckedChanged
        If cbAllMP.Checked Then
            For Each c As Control In gridMealPlan.Rows
                CType(c.FindControl("CheckBox1"), CheckBox).Checked = False
            Next
            gridMealPlan.Enabled = False
        Else
            gridMealPlan.Enabled = True
        End If
    End Sub

    Protected Sub cbAllRooms_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbAllRooms.CheckedChanged
        If cbAllRooms.Checked Then
            For Each row As GridViewRow In gridRoomType.Rows
                Dim cb As CheckBox = row.FindControl("cbRoomSel")
                cb.Checked = False
            Next
            gridRoomType.Enabled = False
        Else
            gridRoomType.Enabled = True
        End If
    End Sub

    Protected Sub btnRoomToggle_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        For Each row As GridViewRow In gridRoomType.Rows
            Dim cb As CheckBox = row.FindControl("cbRoomSel")
            cb.Checked = Not cb.Checked
        Next
    End Sub

    Protected Sub gridMealPlan_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gridMealPlan.DataBound
        Dim q As New dsSpecialTableAdapters.QueriesTableAdapter
        Dim i As Integer = q.SpecialMPCount(Int32.Parse(Request.QueryString(0)))
        cbAllMP.Checked = (i = 0)
        gridMealPlan.Enabled = (i = 0)
    End Sub

    Protected Sub gridRoomType_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gridRoomType.DataBound
        Dim q As New dsSpecialTableAdapters.QueriesTableAdapter
        Dim i As Integer = q.SpecialRoomCount(Int32.Parse(Request.QueryString(0)))
        cbAllRooms.Checked = (i = 0)
        gridRoomType.Enabled = (i = 0)
    End Sub

    Protected Sub fvSpec_ItemCreated(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvSpec.ItemCreated
        Dim cb As CheckBox = fvSpec.FindControl("cbPropagate")
        If cb IsNot Nothing Then cb.Checked = True
    End Sub

    Protected Sub fvSpec_ModeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvSpec.ModeChanged
        Dim b As Boolean = (fvSpec.CurrentMode = FormViewMode.Edit)
        pnlRoom.Enabled = b
        pnlMP.Enabled = b
        gvBlackoutsRO.Visible = Not b
        gvBlackouts.Visible = b
        fvBlackouts.Visible = b
        If b Then
            gridRoomType.Enabled = Not cbAllRooms.Checked
            gridMealPlan.Enabled = Not cbAllMP.Checked
        End If
        'btnUpdate0.Visible = (fvSpec.CurrentMode = FormViewMode.Edit)
        'btnUpdate.Visible = (fvSpec.CurrentMode = FormViewMode.Edit)
    End Sub

    Protected Sub fvSpec_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvSpec.DataBound
        Dim b As Button = fvSpec.FindControl("btEdit")
        Dim d As Button = fvSpec.FindControl("btnDelete")

        'If b IsNot Nothing Then b.Visible = (ModificationRights.RightsAdmin Or (Int32.Parse(b.CommandArgument) < 1)) And Master.CanEdit()
        'If d IsNot Nothing Then d.Visible = (ModificationRights.RightsAdmin Or (Int32.Parse(b.CommandArgument) < 1)) And Master.CanEdit()
    End Sub

    Protected Sub fvSpec_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles fvSpec.ItemUpdating
        Dim cb As DropDownList
        cb = fvSpec.FindControl("cbPrType")
        If cb IsNot Nothing Then e.NewValues("PrDiscountTypeId") = cb.SelectedValue

        cb = fvSpec.FindControl("cbPrOn")
        If cb IsNot Nothing Then e.NewValues("PrDiscountOn") = cb.SelectedValue

        cb = fvSpec.FindControl("cbPrDisc")
        If cb IsNot Nothing Then e.NewValues("PrDiscount") = cb.SelectedValue

        cb = fvSpec.FindControl("cbScType")
        If cb IsNot Nothing Then e.NewValues("ScDiscountTypeId") = cb.SelectedValue

        cb = fvSpec.FindControl("cbScOn")
        If cb IsNot Nothing Then e.NewValues("ScDiscountOn") = cb.SelectedValue

        cb = fvSpec.FindControl("cbScDisc")
        If cb IsNot Nothing Then e.NewValues("ScDiscount") = cb.SelectedValue

        Dim pID As Integer
        Dim pOn As String
        Dim sID As Integer
        Dim sOn As String


        If String.IsNullOrEmpty(e.NewValues("PrDiscountTypeId")) Then
            pID = 6
            dsSpec.UpdateParameters("PrDiscountTypeId").DefaultValue = 6
        Else
            pID = Integer.Parse(e.NewValues("PrDiscountTypeId"))
            If String.IsNullOrEmpty(e.NewValues("PrDiscountOn")) Then pOn = "-" Else pOn = e.NewValues("PrDiscountOn")
            If String.IsNullOrEmpty(e.NewValues("ScDiscountTypeId")) Then sID = 0 Else sID = Integer.Parse(e.NewValues("ScDiscountTypeId"))
            If String.IsNullOrEmpty(e.NewValues("ScDiscountOn")) Then sOn = "-" Else sOn = e.NewValues("ScDiscountOn")

            Dim p As New dsSpecialTableAdapters.QueriesTableAdapter
            Dim chk As Boolean = p.IsValid(pID, pOn, sID, sOn)
            e.Cancel = Not chk

            If Not chk Then popShow(False, "Error", New Exception("Discount combinatin not allowed!"))

            If (pOn <> "-") And String.IsNullOrEmpty(e.NewValues("PrDiscount")) Then
                popShow(False, "Error", New Exception("Primary discount is required!"))
                e.Cancel = True
            End If

            If (sOn <> "-") And String.IsNullOrEmpty(e.NewValues("ScDiscount")) Then
                popShow(False, "Error", New Exception("Secondary discount is required!"))
                e.Cancel = True
            End If

            If (pID = 4) And String.IsNullOrEmpty(e.NewValues("StayCriteriaMin")) Then
                popShow(False, "Error", New Exception("For Free Nights discount Min.Stay is required!"))
                e.Cancel = True
            End If
        End If
    End Sub

    Protected Sub fvSpec_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles fvSpec.ItemInserting
        Dim cb As DropDownList
        cb = fvSpec.FindControl("cbPrType")
        If cb IsNot Nothing Then e.Values("PrDiscountTypeId") = cb.SelectedValue

        cb = fvSpec.FindControl("cbPrOn")
        If cb IsNot Nothing Then e.Values("PrDiscountOn") = cb.SelectedValue

        cb = fvSpec.FindControl("cbPrDisc")
        If cb IsNot Nothing Then e.Values("PrDiscount") = cb.SelectedValue

        cb = fvSpec.FindControl("cbScType")
        If cb IsNot Nothing Then e.Values("ScDiscountTypeId") = cb.SelectedValue

        cb = fvSpec.FindControl("cbScOn")
        If cb IsNot Nothing Then e.Values("ScDiscountOn") = cb.SelectedValue

        cb = fvSpec.FindControl("cbScDisc")
        If cb IsNot Nothing Then e.Values("ScDiscount") = cb.SelectedValue

        Dim pID As Integer
        Dim pOn As String
        Dim sID As Integer
        Dim sOn As String

        pID = Integer.Parse(e.Values("PrDiscountTypeId"))
        If String.IsNullOrEmpty(e.Values("PrDiscountOn")) Then pOn = "-" Else pOn = e.Values("PrDiscountOn")
        If String.IsNullOrEmpty(e.Values("ScDiscountTypeId")) Then sID = 0 Else sID = Integer.Parse(e.Values("ScDiscountTypeId"))
        If String.IsNullOrEmpty(e.Values("ScDiscountOn")) Then sOn = "-" Else sOn = e.Values("ScDiscountOn")

        Dim p As New dsSpecialTableAdapters.QueriesTableAdapter
        Dim chk As Boolean = p.IsValid(pID, pOn, sID, sOn)
        e.Cancel = Not chk

        If Not chk Then popShow(False, "Error", New Exception("Discount combinatin not allowed!"))

        If (pOn <> "-") And String.IsNullOrEmpty(e.Values("PrDiscount")) Then
            popShow(False, "Error", New Exception("Primary discount is required!"))
            e.Cancel = True
        End If

        If (sOn <> "-") And String.IsNullOrEmpty(e.Values("ScDiscount")) Then
            popShow(False, "Error", New Exception("Secondary discount is required!"))
            e.Cancel = True
        End If

        If (pID = 4) And String.IsNullOrEmpty(e.Values("StayCriteriaMin")) Then
            popShow(False, "Error", New Exception("For Free Nights discount Min.Stay is required!"))
            e.Cancel = True
        End If
    End Sub

    Protected Sub fvSpec_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewDeletedEventArgs) Handles fvSpec.ItemDeleted
        If e.Exception IsNot Nothing Then
            If e.Exception.InnerException.Message.Contains("FK_ContractSpecial_Special") Then
                popShow(False, "Error deleting Special", New Exception("Special attached to contract(s).<br /> Action is canceled."))
            Else
                popShow(False, "Error deleting Special", e.Exception)
            End If
            e.ExceptionHandled = True
        Else
            Response.Redirect("~/Contracts/Specials.aspx")
        End If
    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        If cbAllMP.Checked Then
            Dim q As New dsSpecialTableAdapters.QueriesTableAdapter
            q.DeleteSpecialMP(Int32.Parse(Request.QueryString(0)))
        Else
            For Each row As GridViewRow In gridMealPlan.Rows
                gridMealPlan.UpdateRow(row.RowIndex, False)
            Next
        End If
    End Sub

    Protected Sub btnUpdate0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate0.Click
        If cbAllRooms.Checked Then
            Dim q As New dsSpecialTableAdapters.QueriesTableAdapter
            q.DeleteSpecialRoom(Int32.Parse(Request.QueryString(0)))
        Else
            For Each row As GridViewRow In gridRoomType.Rows
                gridRoomType.UpdateRow(row.RowIndex, False)
            Next
        End If
    End Sub

    Protected Sub btCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("~/Contracts/Specials.aspx")
    End Sub

    Protected Sub dsSpec_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsSpec.Inserted, dsCategory.Updated
        If e.Exception IsNot Nothing Then
            popShow(False, "Error Special", e.Exception)
            e.ExceptionHandled = True
        Else
            Dim q As New dsSpecialTableAdapters.QueriesTableAdapter
            Dim cid As Integer = 0
            If Not (q.GetContractIDDForSpec(e.OutputParameters.Item("NewID")) Is Nothing) Then
                cid = q.GetContractIDDForSpec(e.OutputParameters.Item("NewID")).Value
                Me.Response.Redirect("~/Contracts/Special/Wizard/Detail.aspx?ContractID=" & cid, True)
            Else
                Response.Redirect("DetailSpec.aspx?SpecialID=" & e.OutputParameters.Item("NewID"))
            End If
        End If
    End Sub

    Protected Sub dsSpec_Changed(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsSpec.Updated, dsSpec.Inserted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error Special", e.Exception)
            e.ExceptionHandled = True
        Else
            btnUpdate_Click(sender, New System.EventArgs)
            btnUpdate0_Click(sender, New System.EventArgs)
        End If
    End Sub

    Protected Sub dsMealPlan_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsMealPlan.Updated
        If e.Exception IsNot Nothing Then
            popShow(False, "Error editing MP", e.Exception)
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub dsRoomType_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsRoomType.Updated
        If e.Exception IsNot Nothing Then
            popShow(False, "Error editing Room Type", e.Exception)
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub btnWizNextMasterPage_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If fvSpec.CurrentMode = DetailsViewMode.Edit Then
            fvSpec.UpdateItem(False)

            Try
                btnUpdate_Click(sender, e)
                btnUpdate0_Click(sender, e)
            Catch ex As Exception
                popShow(False, "Error", ex)
            End Try
        End If
    End Sub

    Protected Sub popShow(ByVal Question As Boolean, ByVal Title As String, ByRef ex As Exception)
        If ex.InnerException IsNot Nothing Then
            popMessage.Text = ex.InnerException.Message
        Else
            popMessage.Text = ex.Message
        End If
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

    Protected Sub fvSpec_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles fvSpec.ItemCommand
        If e.CommandName = "Extend" Then
            Response.Redirect("~/Contracts/Special/ExtendSpec.aspx?SpecialID=" & Request.QueryString("SpecialID"))
        ElseIf e.CommandName = "Cancel" Then
            gvBlackoutsRO.DataBind()
        End If
    End Sub

    Protected Sub btCopy_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btCopy.Click
        pnlCopy.Visible = True
        btCopy.Visible = False
    End Sub

    Protected Sub btCopySave_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim txCTitle As TextBox = fvCopy.FindControl("txtCopyTitle")
        Dim cbCHotel As DropDownList = fvCopy.FindControl("ddlCopyHotels")
        Dim txtCModify As TextBox = fvCopy.FindControl("txtCopyModify")
        Try
            Dim CTitle As String = txCTitle.Text
            Dim CHotel As Integer = cbCHotel.SelectedValue
            Dim CSpecial As Integer = Int32.Parse(Request.QueryString(0))
            Dim CModify As Decimal = txtCModify.Text
            Dim CUser As String = Membership.GetUser.UserName
            Dim Special As Integer

            Dim q As New dsSpecialTableAdapters.QueriesTableAdapter
            q.SpecialCopy(CSpecial, CHotel, CTitle, CModify, CUser, Special)

            If cbCHotel.Enabled Then
                Response.Redirect(String.Format("DetailSpec.aspx?SpecialID={0}", Special))
            Else
                Response.Redirect(String.Format("Wizard/Detail.aspx?ContractID={0}", Special))
            End If
        Catch ex As Exception
            popShow(False, "Error copying Special", ex)
        End Try
    End Sub

    Protected Sub btCopyCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        pnlCopy.Visible = False
        btCopy.Visible = True
    End Sub

    Protected Sub dsBlackouts_Inserted(sender As Object, e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsBlackouts.Inserted
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            popShow(False, "Error adding new blackout period", e.Exception)
        End If
    End Sub

    Protected Sub dsBlackouts_Updated(sender As Object, e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsBlackouts.Updated
        If e.Exception IsNot Nothing Then
            popShow(False, "Error editing blackout period", e.Exception)
            e.ExceptionHandled = True
        End If
    End Sub

    'Protected Sub dsBlackouts_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsBlackouts.Inserting
    '    MsgBox(e.InputParameters(0))
    '    MsgBox(e.InputParameters(1))
    '    MsgBox(e.InputParameters(2))
    'End Sub
End Class
