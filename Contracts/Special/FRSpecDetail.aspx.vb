
Partial Class Contracts_Special_FRSpecDetail
    Inherits System.Web.UI.Page
    Protected Sub fvSpec_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles fvSpec.ItemUpdating
        Dim cb As DropDownList
        cb = fvSpec.FindControl("cbPrType")
        If cb IsNot Nothing Then e.NewValues(17) = cb.SelectedValue

        cb = fvSpec.FindControl("cbPrOn")
        If cb IsNot Nothing Then e.NewValues(18) = cb.SelectedValue

        cb = fvSpec.FindControl("cbPrDisc")
        If cb IsNot Nothing Then e.NewValues(19) = cb.SelectedValue

        cb = fvSpec.FindControl("cbScType")
        If cb IsNot Nothing Then e.NewValues(21) = cb.SelectedValue

        cb = fvSpec.FindControl("cbScOn")
        If cb IsNot Nothing Then e.NewValues(22) = cb.SelectedValue

        cb = fvSpec.FindControl("cbScDisc")
        If cb IsNot Nothing Then e.NewValues(23) = cb.SelectedValue

        Dim pID As Integer
        Dim pOn As String
        Dim sID As Integer
        Dim sOn As String

        pID = Integer.Parse(e.NewValues(17))
        If String.IsNullOrEmpty(e.NewValues(18)) Then pOn = "-" Else pOn = e.NewValues(18)
        If String.IsNullOrEmpty(e.NewValues(21)) Then sID = 0 Else sID = Integer.Parse(e.NewValues(21))
        If String.IsNullOrEmpty(e.NewValues(22)) Then sOn = "-" Else sOn = e.NewValues(22)

        Dim p As New dsSpecialTableAdapters.QueriesTableAdapter
        Dim chk As Boolean = p.IsValid(pID, pOn, sID, sOn)
        e.Cancel = Not chk

        If Not chk Then MsgBox("Discount combinatin not allowed!")
    End Sub

    'Protected Sub fvSpec_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles fvSpec.ItemInserting
    '    Dim cb As DropDownList
    '    cb = fvSpec.FindControl("cbPrType")
    '    If cb IsNot Nothing Then e.Values(15) = cb.SelectedValue

    '    cb = fvSpec.FindControl("cbPrOn")
    '    If cb IsNot Nothing Then e.Values(16) = cb.SelectedValue

    '    cb = fvSpec.FindControl("cbPrDisc")
    '    If cb IsNot Nothing Then e.Values(17) = cb.SelectedValue

    '    cb = fvSpec.FindControl("cbScType")
    '    If cb IsNot Nothing Then e.Values(19) = cb.SelectedValue

    '    cb = fvSpec.FindControl("cbScOn")
    '    If cb IsNot Nothing Then e.Values(20) = cb.SelectedValue

    '    cb = fvSpec.FindControl("cbScDisc")
    '    If cb IsNot Nothing Then e.Values(21) = cb.SelectedValue

    '    Dim pID As Integer
    '    Dim pOn As String
    '    Dim sID As Integer
    '    Dim sOn As String

    '    pID = Integer.Parse(e.Values(15))
    '    If String.IsNullOrEmpty(e.Values(16)) Then pOn = "-" Else pOn = e.Values(16)
    '    If String.IsNullOrEmpty(e.Values(19)) Then sID = 0 Else sID = Integer.Parse(e.Values(19))
    '    If String.IsNullOrEmpty(e.Values(20)) Then sOn = "-" Else sOn = e.Values(20)

    '    Dim p As New dsSpecialTableAdapters.QueriesTableAdapter
    '    Dim chk As Boolean = p.IsValid(pID, pOn, sID, sOn)
    '    e.Cancel = Not chk

    '    If Not chk Then MsgBox("Discount combinatin not allowed!")
    'End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim qs As String = Request.QueryString(0)
        Dim cmp As Contracts_Special_masterFRSpecial = CType(Master, Contracts_Special_masterFRSpecial)

        If Not IsNothing(cmp) Then
            AddHandler cmp.btnWizNextMasterPage.Click, AddressOf btnWizNextMasterPage_Click
        End If

    End Sub

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        For Each row As GridViewRow In gridMealPlan.Rows
            gridMealPlan.UpdateRow(row.RowIndex, False)
        Next
    End Sub

    Protected Sub btnUpdate0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate0.Click
        For Each row As GridViewRow In gridRoomType.Rows
            gridRoomType.UpdateRow(row.RowIndex, False)
        Next
    End Sub
    Protected Sub btnWizNextMasterPage_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        If fvSpec.CurrentMode = DetailsViewMode.Edit Then
            fvSpec.UpdateItem(False)

            Try
                btnUpdate_Click(sender, e)
                btnUpdate0_Click(sender, e)
            Catch ex As Exception
                popShow(False, "Error", ex.InnerException.Message)
            End Try
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
        Else
            'gridRateType.DataBind()
        End If
    End Sub

    Protected Sub fvSpec_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewDeletedEventArgs) Handles fvSpec.ItemDeleted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error deleting Special", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            Response.Redirect("~/Contracts/Specials.aspx")
        End If
    End Sub

    Protected Sub fvSpec_ModeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvSpec.ModeChanged
        pnlRoom.Enabled = (fvSpec.CurrentMode = FormViewMode.Edit)
        btnUpdate0.Visible = (fvSpec.CurrentMode = FormViewMode.Edit)
        pnlMP.Enabled = (fvSpec.CurrentMode = FormViewMode.Edit)
        btnUpdate.Visible = (fvSpec.CurrentMode = FormViewMode.Edit)
    End Sub
    Protected Sub fvSpec_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvSpec.DataBound
        Dim b As Button = fvSpec.FindControl("btEdit")
        Dim d As Button = fvSpec.FindControl("btnDelete")

        If b IsNot Nothing Then b.Visible = ModificationRights.RightsAdmin Or (Int32.Parse(b.CommandArgument) < 1)
        If d IsNot Nothing Then d.Visible = ModificationRights.RightsAdmin Or (Int32.Parse(b.CommandArgument) < 1)
    End Sub

    Protected Sub fvSpec_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles fvSpec.ItemCommand
        If e.CommandName = "Edit" Then

            If Int32.Parse(e.CommandArgument) > 0 Then
                Try
                    Dim q As New dsSpecialTableAdapters.QueriesTableAdapter
                    q.SpecialDeactivate(Request.QueryString(0))
                Catch ex As Exception
                    popShow(False, "Error Special Deactivate", ex.InnerException.Message)
                End Try
            End If
        End If
    End Sub
End Class
