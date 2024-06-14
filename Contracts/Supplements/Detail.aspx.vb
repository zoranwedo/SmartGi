
Partial Class Contracts_Supplements_Detail
    Inherits System.Web.UI.Page

    Public Function RightsOnAmount() As Boolean
        Dim userName As String = Membership.GetUser.UserName
        Dim Right As Boolean = _
            Roles.IsUserInRole(userName, "sales") Or _
            Roles.IsUserInRole(userName, "operator") Or _
            Roles.IsUserInRole(userName, "admin")
        Return Right
    End Function

    Public Function RightsOnHAmount() As Boolean
        Dim userName As String = Membership.GetUser.UserName
        Dim Right As Boolean = _
            Roles.IsUserInRole(userName, "hotel") Or _
            Roles.IsUserInRole(userName, "operator")
        Return Right
    End Function

    Public Function EditBkStart() As Boolean
        Dim ta As New SupplementsTableAdapters.QueriesTableAdapter
        Dim sID As Integer = Request.QueryString(0)
        Return Not ta.SupplementUsed(sID)
    End Function

    Protected Function GetWeekDays() As String
        Dim wd As String = ""
        If fvSupp.CurrentMode = FormViewMode.Insert Then
            If CType(fvSupp.FindControl("cbiAll"), CheckBox).Checked Then
                wd = "YYYYYYY"
            Else
                If CType(fvSupp.FindControl("cbi1"), CheckBox).Checked Then wd = "Y" Else wd = "N"
                If CType(fvSupp.FindControl("cbi2"), CheckBox).Checked Then wd &= "Y" Else wd &= "N"
                If CType(fvSupp.FindControl("cbi3"), CheckBox).Checked Then wd &= "Y" Else wd &= "N"
                If CType(fvSupp.FindControl("cbi4"), CheckBox).Checked Then wd &= "Y" Else wd &= "N"
                If CType(fvSupp.FindControl("cbi5"), CheckBox).Checked Then wd &= "Y" Else wd &= "N"
                If CType(fvSupp.FindControl("cbi6"), CheckBox).Checked Then wd &= "Y" Else wd &= "N"
                If CType(fvSupp.FindControl("cbi7"), CheckBox).Checked Then wd &= "Y" Else wd &= "N"
            End If
        Else
            If CType(fvSupp.FindControl("cbAll"), CheckBox).Checked Then
                wd = "YYYYYYY"
            Else
                If CType(fvSupp.FindControl("cbE1"), CheckBox).Checked Then wd = "Y" Else wd = "N"
                If CType(fvSupp.FindControl("cbE2"), CheckBox).Checked Then wd &= "Y" Else wd &= "N"
                If CType(fvSupp.FindControl("cbE3"), CheckBox).Checked Then wd &= "Y" Else wd &= "N"
                If CType(fvSupp.FindControl("cbE4"), CheckBox).Checked Then wd &= "Y" Else wd &= "N"
                If CType(fvSupp.FindControl("cbE5"), CheckBox).Checked Then wd &= "Y" Else wd &= "N"
                If CType(fvSupp.FindControl("cbE6"), CheckBox).Checked Then wd &= "Y" Else wd &= "N"
                If CType(fvSupp.FindControl("cbE7"), CheckBox).Checked Then wd &= "Y" Else wd &= "N"
            End If
        End If

        Return wd
    End Function

    Private Function IsFlat() As Boolean
        Dim f As New SupplementsTableAdapters.QueriesTableAdapter
        Dim dStart As Date = Date.Parse("1900-1-1")
        Dim dEnd As Date = Date.Parse("2900-1-1")
        Dim iHotel As Integer = 0

        If fvSupp.CurrentMode = FormViewMode.ReadOnly Then
            Dim d As Label
            d = fvSupp.FindControl("txtStart")
            If d IsNot Nothing Then If Not String.IsNullOrEmpty(d.Text) Then dStart = d.Text
            d = fvSupp.FindControl("txtFinish")
            If d IsNot Nothing Then If Not String.IsNullOrEmpty(d.Text) Then dEnd = d.Text
            Dim h As HiddenField = fvSupp.FindControl("hfHotels")
            If h IsNot Nothing Then iHotel = h.Value
        Else
            Dim d As TextBox
            d = fvSupp.FindControl("txtStart")
            If d IsNot Nothing Then If Not String.IsNullOrEmpty(d.Text) Then dStart = d.Text
            d = fvSupp.FindControl("txtFinish")
            If d IsNot Nothing Then If Not String.IsNullOrEmpty(d.Text) Then dEnd = d.Text
            Dim h As DropDownList = fvSupp.FindControl("ddlHotels")
            If h IsNot Nothing Then iHotel = h.SelectedValue
        End If

        'fvSuppMD
        Dim md As Label
        md = fvSuppMD.FindControl("txtStart")
        If md IsNot Nothing Then If Not String.IsNullOrEmpty(md.Text) Then dStart = md.Text
        md = fvSuppMD.FindControl("txtFinish")
        If md IsNot Nothing Then If Not String.IsNullOrEmpty(md.Text) Then dEnd = md.Text
        Dim mh As HiddenField = fvSuppMD.FindControl("hfHotels")
        If mh IsNot Nothing Then iHotel = mh.Value

        Dim i As Integer = f.IsHotelFlatInterval(iHotel, dStart, dEnd).Value
        Return (i <> 0)
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim qs As String = Request.QueryString(0)

        If qs = 0 Then
            fvSupp.ChangeMode(DetailsViewMode.Insert)
            fvSupp.Visible = True
            fvSuppMD.Visible = False
            pnlRoom.Visible = False
            btCopy.Visible = False
        Else
            fvSupp.Visible = Master.CanEdit
            fvSuppMD.Visible = Not Master.CanEdit
        End If

        'Dim cmp As Contracts_Supplements_masterSupplement = CType(Master, Contracts_Supplements_masterSupplement)
        'If Not IsNothing(cmp) Then AddHandler cmp.btnWizNextMasterPage.Click, AddressOf btnWizNextMasterPage_Click

        AddHandler Master.btnWizNextMasterPage.Click, AddressOf btnWizNextMasterPage_Click
    End Sub

    Protected Sub cbAllRooms_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbAllRooms.CheckedChanged
        '    If cbAllRooms.Checked Then
        '        For Each c As Control In gridRoomType.Rows
        '            CType(c.FindControl("CheckBox3"), CheckBox).Checked = False
        '        Next
        '        gridRoomType.Enabled = False
        '    Else
        '        gridRoomType.Enabled = True
        '    End If
        'End Sub
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

    Protected Sub cbAll_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        CType(fvSupp.FindControl("pnlWeek"), Panel).Visible = Not CType(sender, CheckBox).Checked
    End Sub

    Protected Sub cbiAll_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        CType(fvSupp.FindControl("pnliWeek"), Panel).Visible = Not CType(sender, CheckBox).Checked
    End Sub

    Protected Sub cbAll_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        cbAll_CheckedChanged(sender, e)
    End Sub

    Protected Sub btnUpdate0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate0.Click
        If cbAllRooms.Checked Then
            Dim q As New SupplementsTableAdapters.QueriesTableAdapter
            q.SupplementRoomAll(Int32.Parse(Request.QueryString(0)))
        Else
            For Each row As GridViewRow In gridRoomType.Rows
                gridRoomType.UpdateRow(row.RowIndex, False)
            Next
        End If
    End Sub

    Protected Sub btCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("~/Contracts/Supplements.aspx")
    End Sub

    Protected Sub fvSupp_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvSupp.DataBound, fvSuppMD.DataBound
        Dim p As Panel = fvSupp.FindControl("pnFlat")
        If p IsNot Nothing Then p.Visible = IsFlat()

        If fvSupp.CurrentMode = FormViewMode.Edit Then
            If fvSupp.FindControl("ddlHotels") IsNot Nothing Then
                If Not String.IsNullOrEmpty(CType(fvSupp.FindControl("ddlHotels"), DropDownList).SelectedValue) Then
                    Dim ad As Boolean = Not Hotels.AdultsOnly(Int32.Parse(CType(fvSupp.FindControl("ddlHotels"), DropDownList).SelectedValue))

                    If fvSupp.FindControl("txtCh1") IsNot Nothing Then
                        CType(fvSupp.FindControl("txtCh1"), TextBox).Enabled = ad
                    End If
                End If
            End If
        End If
    End Sub

    Protected Sub fvSupp_ModeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvSupp.ModeChanged
        Dim b As Boolean = (fvSupp.CurrentMode = FormViewMode.Edit)
        pnlRoom.Enabled = b
        If b Then gridRoomType.Enabled = Not cbAllRooms.Checked
        'btnUpdate0.Visible = (fvSupp.CurrentMode = FormViewMode.Edit)
    End Sub

    Protected Sub fvSupp_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles fvSupp.ItemCommand
        Dim p As Panel = fvSupp.FindControl("pnFlat")
        If p IsNot Nothing Then
            Dim v As Boolean = p.Visible
            p.Visible = IsFlat()
            If (v = False) And (p.Visible = True) Then
                popShow(False, "Supplement Warning", "Hotel is flat in supplement's travel window." & vbNewLine & "Enter hotel rates.")
                Exit Sub
            End If
        End If
        If fvSupp.CurrentMode = FormViewMode.Insert Then fvSupp.InsertItem(True)
    End Sub

    Protected Sub fvSupp_ItemCreated(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvSupp.ItemCreated
        If fvSupp.CurrentMode = FormViewMode.Insert Then
            Dim cb As CheckBox = fvSupp.FindControl("cbiHVisible")
            If cb IsNot Nothing Then cb.Checked = True
            Dim txt As TextBox = fvSupp.FindControl("txtRateReceived")
            If txt IsNot Nothing Then txt.Text = Today
        End If
    End Sub

    Protected Sub fvSupp_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewDeletedEventArgs) Handles fvSupp.ItemDeleted
        If e.Exception IsNot Nothing Then
            If e.Exception.InnerException.Message.Contains("FK_ContractSupplement_Supplement") Then
                popShow(False, "Error deleting Supplement", "Supplement attached to contract(s).<br /> Action is canceled.")
            Else
                popShow(False, "Error deleting Supplement", e.Exception.InnerException.Message)
            End If
            e.ExceptionHandled = True
        Else
            Response.Redirect("~/Contracts/Supplements.aspx")
        End If
    End Sub

    Protected Sub dsSupp_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsSupp.Inserting, dsSupp.Updating
        e.InputParameters("WeekDays") = GetWeekDays()
    End Sub

    Protected Sub dsSupp_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsSupp.Inserted
        Dim str As String = e.OutputParameters.Item("NewID")

        If Not (String.IsNullOrEmpty(str)) Then
            Response.Redirect(String.Format("Detail.aspx?SupplementID={0}", str))
        End If
    End Sub

    Protected Sub dsSupp_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsSupp.Updated, dsSupp.Inserted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error Supplement", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            btnUpdate0_Click(sender, New System.EventArgs)
        End If
    End Sub

    Protected Sub dsSuppMD_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsSuppMD.Updated
        If e.Exception IsNot Nothing Then
            popShow(False, "Error Supplement", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            Dim l As New LogApp
            Dim sID As Integer = Request.QueryString(0)
            l.LogUserAction(My.User.Name, LogApp.objSup, LogApp.evnUpdate, LogApp.stateComplete, sID, "Supplement modified")
        End If
    End Sub

    Protected Sub gridRoomType_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gridRoomType.DataBound
        Dim q As New SupplementsTableAdapters.QueriesTableAdapter
        Dim i As Integer = q.SupplementRoomCount(Int32.Parse(Request.QueryString(0)))
        cbAllRooms.Checked = (i = 0)
        gridRoomType.Enabled = (i = 0)
    End Sub

    Protected Sub dsRoomType_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsRoomType.Updated
        If e.Exception IsNot Nothing Then
            popShow(False, "Error Supplement", e.Exception.InnerException.Message)
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

    Protected Sub btnWizNextMasterPage_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Try
            If fvSupp.CurrentMode = FormViewMode.Edit Then
                fvSupp.UpdateItem(False)
            End If
            btnUpdate0_Click(sender, e)
        Catch ex As Exception
            popShow(False, "Error updating Supplement", ex.InnerException.Message)
        End Try

    End Sub

    Protected Sub ddlHotels_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim ad As Boolean = Not Hotels.AdultsOnly(CType(sender, DropDownList).SelectedValue)

        If fvSupp.FindControl("txtCh1") IsNot Nothing Then
            CType(fvSupp.FindControl("txtCh1"), TextBox).Enabled = ad
        End If
    End Sub

    Protected Sub btCopy_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btCopy.Click
        pnlCopy.Visible = True
        btCopy.Visible = False
    End Sub

    Protected Sub btCopySave_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim txCTitle As TextBox = fvCopy.FindControl("txtCopyTitle")
        Dim cbCHotel As DropDownList = fvCopy.FindControl("ddlCopyHotels")
        Try
            Dim CTitle As String = txCTitle.Text
            Dim CHotel As Integer = cbCHotel.SelectedValue
            Dim CSupplement As Integer = Int32.Parse(Request.QueryString(0))
            Dim CUser As String = Membership.GetUser.UserName
            Dim Supplement As Integer

            Dim q As New SupplementsTableAdapters.QueriesTableAdapter
            q.SupplementCopy(CSupplement, CHotel, CTitle, CUser, Supplement)

            Response.Redirect(String.Format("Detail.aspx?SupplementID={0}", Supplement))
        Catch ex As Exception
            If ex.InnerException IsNot Nothing Then
                popShow(False, "Error updating Supplement", ex.InnerException.Message)
            Else
                popShow(False, "Error updating Supplement", ex.Message)

            End If
        End Try
    End Sub

    Protected Sub btCopyCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        pnlCopy.Visible = False
        btCopy.Visible = True
    End Sub

    Protected Sub cdCategory_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim cdCategory As DropDownList = sender
        Dim ddlMealPlan As DropDownList = fvSupp.FindControl("ddlMealPlan")
        Dim ddlPercent As DropDownList = fvSupp.FindControl("ddlPercent")
        Dim lblCh5 As Label = fvSupp.FindControl("lblCh5")
        Dim lblCh7 As Label = fvSupp.FindControl("lblCh7")
        Dim lblCh1 As Label = fvSupp.FindControl("lblCh1")
        Dim txtAdult1 As TextBox = fvSupp.FindControl("txtAdult1")
        Dim txtCh1 As TextBox = fvSupp.FindControl("txtCh1")
        Dim cbiHVisible As CheckBox = fvSupp.FindControl("cbiHVisible")
        Dim cbiAll As CheckBox = fvSupp.FindControl("cbiAll")
        Dim pnliWeek As Panel = fvSupp.FindControl("pnliWeek")
        Dim cbiMandatory As CheckBox = fvSupp.FindControl("cbiMandatory")
        Dim cbiResEBB As CheckBox = fvSupp.FindControl("cbiResEBB")
        Dim cbiResEBB0 As CheckBox = fvSupp.FindControl("cbiResEBB0")

        If cdCategory.SelectedItem.Text = "COOP MARKETING" Then
            ddlMealPlan.SelectedIndex = 0
            ddlMealPlan.Enabled = False
            ddlPercent.SelectedValue = True
            ddlPercent.Enabled = False
            lblCh5.Text = "Discount"
            lblCh7.Visible = False
            lblCh1.Visible = False
            txtAdult1.Text = Nothing
            txtAdult1.Visible = False
            txtCh1.Text = Nothing
            txtCh1.Visible = False
            cbiHVisible.Visible = False
            cbiAll.Checked = True
            cbiAll.Enabled = False
            pnliWeek.Visible = False
            cbiMandatory.Checked = True
            cbiMandatory.Enabled = False
            cbiResEBB.Checked = False
            cbiResEBB.Enabled = False
            cbiResEBB0.Checked = False
            cbiResEBB0.Enabled = False

        Else
            ddlMealPlan.Enabled = True
            ddlPercent.Enabled = True
            lblCh5.Text = "Adult"
            lblCh7.Visible = True
            lblCh1.Visible = True
            txtAdult1.Visible = True
            txtCh1.Visible = True
            cbiHVisible.Visible = True
            cbiAll.Enabled = True
            cbiMandatory.Enabled = True
            cbiResEBB.Enabled = True
            cbiResEBB0.Enabled = True

        End If
    End Sub

    Protected Sub cdCategory_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim cdCategory As DropDownList = sender
        Dim ddlMealPlan As DropDownList = fvSupp.FindControl("ddlMealPlan")
        Dim ddlPercent As DropDownList = fvSupp.FindControl("ddlPercent")
        Dim lblCh5 As Label = fvSupp.FindControl("lblCh5")
        Dim lblCh7 As Label = fvSupp.FindControl("lblCh7")
        Dim lblCh1 As Label = fvSupp.FindControl("lblCh1")
        Dim txtAdult1 As TextBox = fvSupp.FindControl("txtAdult1")
        Dim txtCh1 As TextBox = fvSupp.FindControl("txtCh1")
        Dim cbiHVisible As CheckBox = fvSupp.FindControl("cbHVisible")
        Dim cbiAll As CheckBox = fvSupp.FindControl("cbAll")
        Dim pnliWeek As Panel = fvSupp.FindControl("pnlWeek")
        Dim cbiMandatory As CheckBox = fvSupp.FindControl("cbMandatory")
        Dim cbiResEBB As CheckBox = fvSupp.FindControl("cbResEBB")
        Dim cbiResEBB0 As CheckBox = fvSupp.FindControl("cbResEBB0")

        cdCategory.Enabled = False
        'cbAllRooms.Enabled = False
        cbAllRooms.Enabled = (fvSupp.CurrentMode = FormViewMode.Edit)
        If cdCategory.SelectedItem.Text = "COOP MARKETING" Then
            ddlMealPlan.SelectedIndex = 0
            ddlMealPlan.Enabled = False
            ddlPercent.SelectedValue = True
            ddlPercent.Enabled = False
            lblCh5.Text = "Discount"
            lblCh7.Visible = False
            lblCh1.Visible = False
            txtAdult1.Text = Nothing
            txtAdult1.Visible = False
            txtCh1.Text = Nothing
            txtCh1.Visible = False
            cbiHVisible.Visible = False
            cbiAll.Checked = True
            cbiAll.Enabled = False
            pnliWeek.Visible = False
            cbiMandatory.Checked = True
            cbiMandatory.Enabled = False
            cbiResEBB.Checked = False
            cbiResEBB.Enabled = False
            cbiResEBB0.Checked = False
            cbiResEBB0.Enabled = False
        End If
    End Sub
End Class
