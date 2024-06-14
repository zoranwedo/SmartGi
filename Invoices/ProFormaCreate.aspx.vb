Imports System.Data
Partial Class Invoices_InvoiceCreate
    Inherits System.Web.UI.Page
    Protected Sub dsInvoice_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsInvoice.Inserted
        Dim invid As Int32
        e.ExceptionHandled = True
        If Not IsNothing(e.OutputParameters.Item("NewID")) Then
            invid = e.OutputParameters.Item("NewID")
            Try
                dsMix.InsertParameters.Item("InvoiceId").DefaultValue = invid
                fvNewDetail.InsertItem(True)
                'Response.Redirect(String.Format("InvoiceCreate.aspx?InvoiceID={0}", invid))
                Response.Redirect("~/Invoices/ProFormaCreate.aspx?InvoiceID=" & invid)
            Catch ex As Exception
                'dsInvoice.DeleteParameters("InvoiceID").DefaultValue = invid
                'dsInvoice.Delete()
                If ex.Message IsNot Nothing Then popShow("Error Deleting", ex)
            End Try

        End If
    End Sub

    Protected Sub dsInvoice_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsInvoice.Inserting
        Dim qr As New dsInvoicesTableAdapters.QueriesTableAdapter
        Dim qr1 As New dsInvoicesTableAdapters.QueriesTableAdapter

        qr.NewInvoiceNum(Int32.Parse(hfHotel.Value))

        Dim invnum As Integer = qr.GetReturnValue(0)
        Dim bname As String = qr1.TO_BillingName(Int32.Parse(CType(fvInvoice.FindControl("ddlTO"), DropDownList).SelectedValue))

        If Not IsNothing(invnum) Then
            e.InputParameters.Item("InvNumber") = invnum
            e.InputParameters.Item("BillingName") = bname
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not (Page.IsPostBack) Then
            cbHotel.Checked = ModificationRights.RightsHotel
            If ModificationRights.RightsOperator Then
                'Dim setprint As New InvoicesTableAdapters.InvoiceQueries
                'setprint.Invoice_SetOpen(Request.QueryString("InvoiceID"), Membership.GetUser.UserName)
            End If
        End If


        If Request.QueryString(0) = "0" Then
            fvInvoice.DefaultMode = FormViewMode.Insert
            fvNewDetail.ChangeMode(FormViewMode.Insert)
            fvNewBill.Visible = False
            cbHotel.Visible = False
        Else
            Dim invrght As New InvoicesRights(Request.QueryString(0), cbHotel.Checked)
            cbHotel.Visible = invrght.HotelSel

            If (fvInvoice.CurrentMode = FormViewMode.ReadOnly) Then
                fvInvoice.FindControl("hlSend").Visible = invrght.SendSel
            End If

        End If

       
    End Sub


    Protected Sub DropDownList2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        hfInvType.Value = CType(sender, DropDownList).SelectedValue

        If fvInvoice.FindControl("txtInvType") IsNot Nothing Then
            If hfInvType.Value = "1" Then
                CType(fvInvoice.FindControl("txtInvType"), TextBox).Visible = True
            Else
                CType(fvInvoice.FindControl("txtInvType"), TextBox).Visible = False
            End If
        End If

    End Sub
    Protected Sub popShow(ByVal Title As String, ByRef ex As Exception, Optional ByVal Message As String = "-")
        If ex IsNot Nothing Then
            If ex.InnerException IsNot Nothing Then
                popMessage.Text = ex.InnerException.Message
            Else
                popMessage.Text = ex.Message
            End If
        Else
            popMessage.Text = Message
        End If
        popLabel.Text = Title
        popExtender.Show()
    End Sub

    Protected Sub ddlHotels_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim p As New dsInvoicesTableAdapters.HotelOcuppancyTableAdapter
        Dim r As dsInvoices.HotelOcuppancyRow

        hfHotel.Value = CType(sender, DropDownList).SelectedValue
        r = p.GetData(Integer.Parse(hfHotel.Value.ToString)).Rows(0)

        If Not String.IsNullOrEmpty(r.Chld1ShLabel) Then
            hfCh1.Value = r.Chld1ShLabel
        Else
            hfCh1.Value = ""
        End If
        hfCh2.Value = r.Chld2ShLabel
        hfCh3.Value = r.Chld3ShLabel
        hfCh4.Value = r.Chld4ShLabel
        If Request.QueryString(0) = 0 Then
            gvMix.DataBind()
        End If
    End Sub

    Protected Sub ddlHotels_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        hfHotel.Value = CType(sender, DropDownList).SelectedValue
    End Sub

    Protected Sub cbRVHtl_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim q As New dsInvoicesTableAdapters.QueriesTableAdapter
        If CType(sender, CheckBox).Checked Then
            Try
                q.SetInvState(2, Membership.GetUser.UserName, Today(), Request.QueryString(0))
            Catch ex As Exception

            End Try
        Else
            Try
                q.SetInvState(1, Membership.GetUser.UserName, Today(), Request.QueryString(0))
            Catch ex As Exception

            End Try
        End If
        dsInvoice.DataBind()
        fvInvoice.DataBind()
    End Sub

    Protected Sub cbRVCCI_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim q As New dsInvoicesTableAdapters.QueriesTableAdapter
        If CType(sender, CheckBox).Checked Then
            Try
                q.SetInvState(5, Membership.GetUser.UserName, Today(), Request.QueryString(0))
            Catch ex As Exception

            End Try
        Else
            Try
                q.SetInvState(4, Membership.GetUser.UserName, Today(), Request.QueryString(0))
            Catch ex As Exception

            End Try
        End If
        fvInvoice.DataBind()
    End Sub

    Protected Sub fvInvoice_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles fvInvoice.ItemInserted

    End Sub

    Protected Sub fvInvoice_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles fvInvoice.ItemUpdated

    End Sub

    Protected Function CheckOcc(ByVal sender As Object) As Boolean
        ' Dim _txtrtid As Label = fvInvStayDet.FindControl("RoomTypeIdTextBox")
        ' Dim drv As System.Data.DataRowView
        ' drv = CType(CType(sender, FormView).DataItem, System.Data.DataRowView)

        Dim proc As New dsInvoicesTableAdapters.QueriesTableAdapter
        Dim did As Nullable(Of Integer) = Nothing
        Dim hid As Nullable(Of Integer) = Nothing
        Dim toid As Nullable(Of Integer) = Nothing
        Dim rtid As String = Nothing
        Dim start As Nullable(Of Date) = Nothing
        Dim adnum As Nullable(Of Integer) = Nothing
        Dim ch1num As Nullable(Of Integer) = 0
        Dim ch2num As Nullable(Of Integer) = 0
        Dim ch3num As Nullable(Of Integer) = 0
        Dim ch4num As Nullable(Of Integer) = 0

        If Request.QueryString(0) = 0 Then
            'Dim _hfHotel As HiddenField
            'Dim _hfRoom As HiddenField
            Dim _toid As DropDownList = fvInvoice.FindControl("ddlTO")
            Dim _txtstart As TextBox = fvNewDetail.FindControl("txtStart")
            Dim _txtadnum As TextBox = fvNewDetail.FindControl("txtAdult")
            Dim _txtch1num As TextBox = fvNewDetail.FindControl("txtChld1")
            Dim _txtch2num As TextBox = fvNewDetail.FindControl("txtChld2")
            Dim _txtch3num As TextBox = fvNewDetail.FindControl("txtChld3")
            Dim _txtch4num As TextBox = fvNewDetail.FindControl("txtChld4")

            If Not String.IsNullOrEmpty(hfHotel.Value) Then hid = Int32.Parse(hfHotel.Value)
            If Not String.IsNullOrEmpty(hfRoom.Value) Then rtid = hfRoom.Value
            If Not String.IsNullOrEmpty(_toid.SelectedValue) Then toid = Int32.Parse(_toid.SelectedValue)
            If Not String.IsNullOrEmpty(_txtstart.Text) Then start = Date.Parse(_txtstart.Text)
            If Not String.IsNullOrEmpty(_txtadnum.Text) Then adnum = Int32.Parse(_txtadnum.Text)
            If Not String.IsNullOrEmpty(_txtch1num.Text) Then ch1num = Int32.Parse(_txtch1num.Text)
            If Not String.IsNullOrEmpty(_txtch2num.Text) Then ch2num = Int32.Parse(_txtch2num.Text)
            If Not String.IsNullOrEmpty(_txtch3num.Text) Then ch3num = Int32.Parse(_txtch3num.Text)
            If Not String.IsNullOrEmpty(_txtch4num.Text) Then ch4num = Int32.Parse(_txtch4num.Text)
        Else
            If Not String.IsNullOrEmpty(gvMix.SelectedDataKey.Value) Then did = Integer.Parse(gvMix.SelectedDataKey.Value)
        End If

        'Try
        '    Return proc.InvOccTest(did, hid, toid, rtid, start, adnum, ch1num, ch2num, ch3num, ch4num)
        'Catch ex As Exception
        '    Return True
        'End Try
    End Function

    Protected Sub fvNewDetail_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles fvNewDetail.ItemCommand
        If Request.QueryString(0) = 0 Then
            If e.CommandName = "Insert" Then
                Try
                    fvInvoice.InsertItem(True)
                Catch ex As Exception
                    popShow("Error", ex)
                End Try
            End If
            If e.CommandName = "Cancel" Then
                Response.Redirect("~/Invoices/ProFormas.aspx", True)
            End If

        End If

    End Sub

    Protected Sub fvNewDetail_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles fvNewDetail.ItemInserting
        'e.Cancel = Not CheckOcc(sender)
        'Dim ad As Boolean = Hotels.AdultsOnly(Int32.Parse(hfHotel.Value))

        'If fvNewDetail.FindControl("txtRoomsNum") IsNot Nothing Then
        '    CType(fvNewDetail.FindControl("txtRoomsNum"), TextBox).Text = "1"
        'End If

        'If fvNewDetail.FindControl("txtChld1") IsNot Nothing Then
        '    CType(fvNewDetail.FindControl("txtChld1"), TextBox).Enabled = ad
        'End If
        'If fvNewDetail.FindControl("txtChld2") IsNot Nothing Then
        '    CType(fvNewDetail.FindControl("txtChld2"), TextBox).Enabled = ad
        'End If
        'If fvNewDetail.FindControl("txtCh3d1") IsNot Nothing Then
        '    CType(fvNewDetail.FindControl("txtChld3"), TextBox).Enabled = ad
        'End If
        'If fvNewDetail.FindControl("txtChld4") IsNot Nothing Then
        '    CType(fvNewDetail.FindControl("txtChld4"), TextBox).Enabled = ad
        'End If
    End Sub

    Protected Sub dsMix_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsMix.Inserting
        e.InputParameters.Item("RoomTypeId") = CType(fvNewDetail.FindControl("ddlRoomType"), DropDownList).SelectedValue
        e.InputParameters.Item("MealPlanId") = CType(fvNewDetail.FindControl("ddlMP"), DropDownList).SelectedValue
        If Not (Request.QueryString(0) = 0) Then
            e.InputParameters.Item("InvoiceID") = Integer.Parse(Request.QueryString(0).ToString)
        End If
    End Sub

    Protected Sub ddlRoomType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        hfRoom.Value = CType(sender, DropDownList).SelectedValue
    End Sub

    Protected Sub dsMix_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsMix.Updating
        e.InputParameters.Item("RoomTypeId") = CType(fvNewDetail.FindControl("ddlRoomType"), DropDownList).SelectedValue
        e.InputParameters.Item("MealPlanId") = CType(fvNewDetail.FindControl("ddlMP"), DropDownList).SelectedValue
    End Sub

    Protected Sub gvBill_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvBill.DataBound
        Dim p As New dsInvoicesTableAdapters.InvoiceGetPolicyTableAdapter
        Dim t As dsInvoices.InvoiceGetPolicyDataTable
        Dim r As dsInvoices.InvoiceGetPolicyRow

        t = p.GetData(Int32.Parse(Request.QueryString(0)))
        If t.Count > 0 Then
            r = t.Rows(0)
            If gvBill.Rows.Count > 0 Then
                Dim i As Integer

                If Not r.IsMaxOccupancyNull Then
                    For i = 8 + r.MaxOccupancy To 17
                        gvBill.Columns(i).HeaderStyle.ForeColor = Drawing.Color.Gray
                        gvBill.Columns(i).ItemStyle.ForeColor = Drawing.Color.Gray
                    Next

                    gvBill.Columns(19).Visible = r.ChldCategories > 0
                    If Not r.IsChld1ShLabelNull Then gvBill.Columns(19).HeaderText = r.Chld1ShLabel
                    gvBill.Columns(20).Visible = r.ChldCategories > 1
                    If Not r.IsChld2ShLabelNull Then gvBill.Columns(20).HeaderText = r.Chld2ShLabel
                    gvBill.Columns(21).Visible = r.ChldCategories > 2
                    If Not r.IsChld3ShLabelNull Then gvBill.Columns(21).HeaderText = r.Chld3ShLabel
                    gvBill.Columns(22).Visible = r.ChldCategories > 3
                    If Not r.IsChld4ShLabelNull Then gvBill.Columns(22).HeaderText = r.Chld4ShLabel
                End If

            End If
        End If
       
    End Sub

    Protected Sub gvBill_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvBill.RowCommand
        gvStayRates.Visible = False
        gvSuppRates.Visible = False
        pnlPopup.Visible = False



        Try
            If e.CommandName = "EditBillRate" Then
                Dim btnDetails As LinkButton = CType(e.CommandSource, LinkButton)
                Dim gv As GridView = CType(sender, GridView)
                Dim row As GridViewRow = CType(btnDetails.NamingContainer, GridViewRow)
                Dim grdpopUp As GridView

                gvBill.SelectedIndex = row.RowIndex
                'Dim drv As System.Data.DataRowView
                'drv = CType(row.DataItem, System.Data.DataRowView)

                'dsBill.UpdateParameters("DetailID").DefaultValue = gvMix.SelectedDataKey.Value
                'dsBill.UpdateParameters("InvoiceId").DefaultValue = Request.QueryString(0)
                'dsBill.UpdateParameters("BillingID").DefaultValue = Int32.Parse(e.CommandArgument.ToString)
                hfBillID.Value = e.CommandArgument.ToString
                ViewState("BillID") = Int32.Parse(e.CommandArgument.ToString)

                'If Not String.IsNullOrEmpty(row.Cells(3).Text) Then
                If Not String.IsNullOrEmpty(CType(row.FindControl("lblRateType"), Label).Text) Then
                    Dim ratetype As Integer = Integer.Parse(CType(row.FindControl("lblRateType"), Label).Text)

                    pnlPopup.Visible = True

                    If ratetype = 9 Then

                        grdpopUp = gvSuppRates
                        'dsGetSuppRate.SelectParameters("DetailID").DefaultValue = gvMix.SelectedDataKey.Value
                        dsGetSuppRate.SelectParameters("Start").DefaultValue = Date.Parse(row.Cells(1).Text)
                        dsGetSuppRate.SelectParameters("Finish").DefaultValue = Date.Parse(CType(row.FindControl("lnkEditDate"), LinkButton).Text)
                        gvSuppRates.Visible = True
                        gvStayRates.Visible = False
                    Else
                        grdpopUp = gvStayRates
                        dsGetStayRate.SelectParameters("BillingId").DefaultValue = Int32.Parse(e.CommandArgument.ToString)
                        'dsGetStayRate.SelectParameters("Start").DefaultValue = Date.Parse(row.Cells(1).Text)          'CType(row.FindControl("lblEnter"), Label).Text 'gv.SelectedPersistedDataKey.Item(1).ToString
                        'dsGetStayRate.SelectParameters("Finish").DefaultValue = Date.Parse(CType(row.FindControl("lnkEditDate"), LinkButton).Text)    'CType(row.FindControl("lblExit"), Label).Text 'gv.SelectedPersistedDataKey.Item(2).ToString
                        gvSuppRates.Visible = False
                        gvStayRates.Visible = True
                    End If

                    'pnlPopup.Visible = True
                    'grdpopUp.Visible = True
                    '''''''''''''
                    'grdpopUp.DataBind()

                    'updPnlRateDetail.Update()
                    'updPnlRateDetail.DataBind()
                    ''''''''''''''''''
                    If grdpopUp.Rows.Count > 0 Then
                        If ratetype = 9 Then
                            btnSaveIns.Visible = True
                            btnSave.Visible = False
                        Else
                            btnSaveIns.Visible = False
                            btnSave.Visible = True
                        End If
                    End If
                End If
            End If
        Catch ex As Exception
            popShow("Error Editing", ex)
        End Try



        Try
            If e.CommandName = "EditBillDate" Then
                Dim btnDetails As LinkButton = CType(e.CommandSource, LinkButton)
                Dim gv As GridView = CType(sender, GridView)
                Dim row As GridViewRow = CType(btnDetails.NamingContainer, GridViewRow)

                gvBill.EditIndex = row.RowIndex

            End If
        Catch ex As Exception
            popShow("Error Editing", ex)
        End Try


        Try
            If e.CommandName = "Select" Then
                pnlPopup.Visible = False
                If Not String.IsNullOrEmpty(e.CommandArgument) Then
                    dsRateGetPolicy.SelectParameters.Item(0).DefaultValue = e.CommandArgument
                    dsRateGetPolicy.Select()
                    fvChPolicy.DataBind()
                    fvChPolicy.Visible = True
                Else
                    fvChPolicy.Visible = False
                End If
            End If

        Catch ex As Exception
            popShow("Error Editing", ex)
        End Try




        Try
            If e.CommandName = "Delete" Then

                If Not String.IsNullOrEmpty(e.CommandArgument) Then
                    dsBill.DeleteParameters("BillingId").DefaultValue = e.CommandArgument

                End If
                ' End If
            End If
        Catch ex As Exception
            popShow("Error Editing", ex)
        End Try

    End Sub

    'Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click
    '    If (Page.IsValid) Then
    '        If gvStayRates.Visible Then
    '            dsBill.UpdateParameters("NewRateID").DefaultValue = gvStayRates.SelectedDataKey.Value
    '            gvStayRates.Visible = False
    '        Else
    '            dsBill.UpdateParameters("NewRateID").DefaultValue = gvSuppRates.SelectedDataKey.Value
    '            gvSuppRates.Visible = False
    '        End If

    '        dsBill.UpdateParameters("BillingID").DefaultValue = ViewState("BillID")

    '        dsBill.Update()
    '        mdlPopup.Hide()
    '        gvBill.DataBind()
    '        fvInvoice.DataBind()


    '        gvMix.DataBind()
    '        gvStay.DataBind()
    '    End If

    'End Sub

    Protected Sub btnNewBill_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim grdpopUp As GridView

        grdpopUp = gvSuppRates

        dsGetSuppRate.SelectParameters("DetailID").DefaultValue = gvMix.SelectedDataKey.Value
        dsGetSuppRate.SelectParameters("Start").DefaultValue = Date.Parse(gvMix.SelectedRow.Cells(4).Text)    'Date.Parse(CType(gvMix.SelectedRow.FindControl("txtStart"), Label).Text)
        dsGetSuppRate.SelectParameters("Finish").DefaultValue = Date.Parse(gvMix.SelectedRow.Cells(5).Text)   'Date.Parse(CType(gvMix.SelectedRow.FindControl("txtFinish"), Label).Text)

        grdpopUp.Visible = True
        grdpopUp.DataBind()
        gvStayRates.Visible = False
        btnSave.Visible = False
        'updPnlRateDetail.Update()
        'updPnlRateDetail.DataBind()

        If grdpopUp.Rows.Count > 0 Then btnSaveIns.Visible = True
        'mdlPopup.Show()
        pnlPopup.Visible = True
    End Sub

    Protected Sub btnClose_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClose.Click
        pnlPopup.Visible = False
    End Sub

    Protected Sub gvBill_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvBill.RowCreated
        Dim invrght As New InvoicesRights(Request.QueryString(0), cbHotel.Checked)
        Dim supp As Boolean = True
        Dim q As New dsInvoicesTableAdapters.RateTableAdapter
        Dim qr As dsInvoices.RateRow
        Dim rateid As Integer = 0

        If e.Row.RowType = DataControlRowType.DataRow Then
            If e.Row.Cells.Item(5) IsNot Nothing Then
                If Not String.IsNullOrEmpty(CType(e.Row.Cells.Item(5).Controls(1), Label).Text) Then
                    rateid = Int32.Parse(CType(e.Row.Cells.Item(5).Controls(1), Label).Text)
                    'e.Row.FindControl("lblRateID")
                    qr = q.GetData(rateid).Rows(0)
                End If

            End If

            If e.Row.Cells.Item(6) IsNot Nothing Then
                If Not String.IsNullOrEmpty(CType(e.Row.Cells.Item(6).Controls(1), Label).Text) Then
                    If Int32.Parse(CType(e.Row.Cells.Item(6).Controls(1), Label).Text) = 9 Then
                        supp = True
                    Else
                        supp = False
                    End If
                End If
            End If

            If e.Row.FindControl("lnkEditRate") IsNot Nothing Then
                CType(e.Row.FindControl("lnkEditRate"), LinkButton).Enabled = invrght.Rights And supp
                If supp Then
                    If rateid <> 0 Then CType(e.Row.FindControl("lnkEditRate"), LinkButton).ToolTip = qr.Title
                End If
            End If
            If e.Row.FindControl("lnkEditDate") IsNot Nothing Then CType(e.Row.FindControl("lnkEditDate"), LinkButton).Enabled = invrght.Rights And supp
            If e.Row.FindControl("ibBillDelete") IsNot Nothing Then e.Row.FindControl("ibBillDelete").Visible = invrght.Rights
        End If
    End Sub

    Protected Sub gvBill_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles gvBill.RowUpdated

    End Sub

    Protected Sub gvStay_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvStay.RowCommand
        If e.CommandName = "Edit" Then
            cbHotel.Visible = False
        End If
    End Sub

    Protected Sub gvStay_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvStay.RowCreated
        Dim invrght As New InvoicesRights(Request.QueryString(0), cbHotel.Checked)

        If e.Row.FindControl("ibEdit") IsNot Nothing Then e.Row.FindControl("ibEdit").Visible = invrght.Rights
        If e.Row.FindControl("ibDelete") IsNot Nothing Then e.Row.FindControl("ibDelete").Visible = invrght.Rights

        If gvStay.EditIndex > 0 Then
            Dim ad As Boolean = Not Hotels.AdultsOnly(Int32.Parse(hfHotel.Value))

            If e.Row.FindControl("txtChld1E") IsNot Nothing Then
                CType(e.Row.FindControl("txtChld1E"), TextBox).Enabled = ad
            End If
            If e.Row.FindControl("txtChld2E") IsNot Nothing Then
                CType(e.Row.FindControl("txtChld2E"), TextBox).Enabled = ad
            End If
            If e.Row.FindControl("txtCh3d1E") IsNot Nothing Then
                CType(e.Row.FindControl("txtChld3E"), TextBox).Enabled = ad
            End If
            If e.Row.FindControl("txtChld4E") IsNot Nothing Then
                CType(e.Row.FindControl("txtChld4E"), TextBox).Enabled = ad
            End If

        End If
    End Sub

    Protected Sub gvStay_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles gvStay.RowUpdated
        Dim invrght As New InvoicesRights(Request.QueryString(0), cbHotel.Checked)
        cbHotel.Visible = invrght.HotelSel

        gvMix.DataBind()
        gvBill.DataBind()
        fvInvoice.DataBind()
    End Sub

    Protected Sub gvStay_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles gvStay.RowUpdating
        dsStay.UpdateParameters.Item("RoomTypeId").DefaultValue = CType(gvStay.Rows(e.RowIndex).FindControl("ddlRoomType"), DropDownList).SelectedValue
        dsStay.UpdateParameters.Item("MealPlanId").DefaultValue = CType(gvStay.Rows(e.RowIndex).FindControl("ddlMP"), DropDownList).SelectedValue
        ' e.Cancel = Not CheckOcc(sender)

    End Sub

    Protected Sub dsBill_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsBill.Inserted
        e.ExceptionHandled = True

        If e.Exception IsNot Nothing Then
            popShow("Error Inserting Date", e.Exception)
        Else
            gvMix.DataBind()
            gvStay.DataBind()
            gvBill.DataBind()
        End If
    End Sub

    Protected Sub dsBill_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsBill.Inserting

    End Sub

    Protected Sub dsBill_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsBill.Updated

        e.ExceptionHandled = True

        If e.Exception IsNot Nothing Then
            popShow("Error Editing Date", e.Exception)
        Else
            gvMix.DataBind()
            gvStay.DataBind()
            gvBill.DataBind()
        End If
    End Sub

    Protected Sub btnSaveIns_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSaveIns.Click
        dsBill.InsertParameters("RateID").DefaultValue = gvSuppRates.SelectedDataKey.Value

        gvSuppRates.Visible = False
        pnlPopup.Visible = False


        Try
            dsBill.Insert()
        Catch ex As Exception
            popShow("Error Inserting Supplement Rate", ex)
        End Try

        gvBill.DataBind()
        fvInvoice.DataBind()

        gvMix.DataBind()
        gvStay.DataBind()
    End Sub

    Protected Sub dsStay_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsStay.Inserted
        If e.Exception.InnerException.Message IsNot Nothing Then
            popShow("Error Inserting", e.Exception)
        End If
    End Sub

    Protected Sub dsStay_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsStay.Updating

    End Sub
    Protected Sub fvNewDetail_ItemCreated(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvNewDetail.ItemCreated

        If fvNewDetail.CurrentMode = FormViewMode.Insert Then
            Dim p As New dsInvoicesTableAdapters.HotelOcuppancyTableAdapter
            Dim r As dsInvoices.HotelOcuppancyRow

            Dim l As Label
            Dim t As TextBox

            If Not String.IsNullOrEmpty(hfHotel.Value) Then

                r = p.GetData(Integer.Parse(hfHotel.Value.ToString)).Rows(0)
                For i = 1 To 4
                    t = fvNewDetail.FindControl("txtChld" & i)
                    If t IsNot Nothing Then t.Visible = r.ChldCategories > i - 1
                Next

                If gvMix.Rows.Count < 1 Then
                    For i = 1 To 4
                        l = gvMix.FindControl("lblCh" & i)
                        If l IsNot Nothing Then l.Visible = r.ChldCategories > i - 1
                    Next

                    If Not String.IsNullOrEmpty(r.Chld1ShLabel) Then
                        If gvMix.FindControl("lblCh1") IsNot Nothing Then CType(gvMix.FindControl("lblCh1"), Label).Text = r.Chld1ShLabel
                    End If
                    If Not String.IsNullOrEmpty(r.Chld2ShLabel) Then
                        If gvMix.FindControl("lblCh2") IsNot Nothing Then CType(gvMix.FindControl("lblCh2"), Label).Text = r.Chld2ShLabel
                    End If
                    If Not String.IsNullOrEmpty(r.Chld3ShLabel) Then
                        If gvMix.FindControl("lblCh3") IsNot Nothing Then CType(gvMix.FindControl("lblCh3"), Label).Text = r.Chld3ShLabel
                    End If
                    If Not String.IsNullOrEmpty(r.Chld4ShLabel) Then
                        If gvMix.FindControl("lblCh4") IsNot Nothing Then CType(gvMix.FindControl("lblCh4"), Label).Text = r.Chld4ShLabel
                    End If
                End If

                Dim ad As Boolean = Not Hotels.AdultsOnly(Int32.Parse(hfHotel.Value))

                If fvNewDetail.FindControl("txtRoomsNum") IsNot Nothing Then
                    CType(fvNewDetail.FindControl("txtRoomsNum"), TextBox).Text = "1"
                End If

                If fvNewDetail.FindControl("txtChld1") IsNot Nothing Then
                    CType(fvNewDetail.FindControl("txtChld1"), TextBox).Enabled = ad
                End If
                If fvNewDetail.FindControl("txtChld2") IsNot Nothing Then
                    CType(fvNewDetail.FindControl("txtChld2"), TextBox).Enabled = ad
                End If
                If fvNewDetail.FindControl("txtCh3d1") IsNot Nothing Then
                    CType(fvNewDetail.FindControl("txtChld3"), TextBox).Enabled = ad
                End If
                If fvNewDetail.FindControl("txtChld4") IsNot Nothing Then
                    CType(fvNewDetail.FindControl("txtChld4"), TextBox).Enabled = ad
                End If

            End If
        ElseIf fvNewDetail.CurrentMode = FormViewMode.ReadOnly Then
            Dim invrght As New InvoicesRights(Request.QueryString(0), cbHotel.Checked)
            fvNewDetail.FindControl("btnNew").Visible = invrght.Rights
        End If
    End Sub

    Protected Sub gvMix_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvMix.DataBound
        Dim p As New dsInvoicesTableAdapters.InvoiceGetPolicyTableAdapter
        Dim t As dsInvoices.InvoiceGetPolicyDataTable
        Dim r As dsInvoices.InvoiceGetPolicyRow

        t = p.GetData(Int32.Parse(Request.QueryString(0)))
        If t.Count > 0 Then
            r = t.Rows(0)
            If gvMix.Rows.Count > 0 Then
                gvMix.Columns(12).Visible = r.ChldCategories > 0
                If Not r.IsChld1ShLabelNull Then gvMix.Columns(12).HeaderText = r.Chld1ShLabel
                gvMix.Columns(13).Visible = r.ChldCategories > 1
                If Not r.IsChld2ShLabelNull Then gvMix.Columns(13).HeaderText = r.Chld2ShLabel
                gvMix.Columns(14).Visible = r.ChldCategories > 2
                If Not r.IsChld3ShLabelNull Then gvMix.Columns(14).HeaderText = r.Chld3ShLabel
                gvMix.Columns(15).Visible = r.ChldCategories > 3
                If Not r.IsChld4ShLabelNull Then gvMix.Columns(15).HeaderText = r.Chld4ShLabel
            Else
                Dim l As Label
                For i = 1 To 4
                    l = gvMix.FindControl("lblCh" & i)
                    If l IsNot Nothing Then l.Visible = r.ChldCategories > i - 1
                Next

                If Not String.IsNullOrEmpty(r.Chld1ShLabel) Then
                    If gvMix.FindControl("lblCh1") IsNot Nothing Then CType(gvMix.FindControl("lblCh1"), Label).Text = r.Chld1ShLabel
                End If
                If Not String.IsNullOrEmpty(r.Chld2ShLabel) Then
                    If gvMix.FindControl("lblCh2") IsNot Nothing Then CType(gvMix.FindControl("lblCh2"), Label).Text = r.Chld2ShLabel
                End If
                If Not String.IsNullOrEmpty(r.Chld3ShLabel) Then
                    If gvMix.FindControl("lblCh3") IsNot Nothing Then CType(gvMix.FindControl("lblCh3"), Label).Text = r.Chld3ShLabel
                End If
                If Not String.IsNullOrEmpty(r.Chld4ShLabel) Then
                    If gvMix.FindControl("lblCh4") IsNot Nothing Then CType(gvMix.FindControl("lblCh4"), Label).Text = r.Chld4ShLabel
                End If
            End If
        End If
    End Sub

    Protected Sub gvMix_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvMix.DataBinding

    End Sub

    Protected Sub gvStay_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvStay.DataBound
        Dim p As New dsInvoicesTableAdapters.InvoiceGetPolicyTableAdapter
        Dim t As dsInvoices.InvoiceGetPolicyDataTable
        Dim r As dsInvoices.InvoiceGetPolicyRow

        t = p.GetData(Int32.Parse(Request.QueryString(0)))
        If t.Count > 0 Then
            r = t.Rows(0)
            If gvStay.Rows.Count > 0 Then
                gvStay.Columns(6).Visible = r.ChldCategories > 0
                If Not r.IsChld1ShLabelNull Then gvStay.Columns(6).HeaderText = r.Chld1ShLabel
                gvStay.Columns(7).Visible = r.ChldCategories > 1
                If Not r.IsChld2ShLabelNull Then gvStay.Columns(7).HeaderText = r.Chld2ShLabel
                gvStay.Columns(8).Visible = r.ChldCategories > 2
                If Not r.IsChld3ShLabelNull Then gvStay.Columns(8).HeaderText = r.Chld3ShLabel
                gvStay.Columns(9).Visible = r.ChldCategories > 3
                If Not r.IsChld4ShLabelNull Then gvStay.Columns(9).HeaderText = r.Chld4ShLabel
            End If
        End If
    End Sub

    Protected Sub ddlRoomType_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
        hfRoom.Value = CType(sender, DropDownList).SelectedValue
    End Sub

    Protected Sub fvNewDetail_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles fvNewDetail.ItemInserted

    End Sub

    Protected Sub dsBill_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsBill.Updating

    End Sub

    'Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
    '    'Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
    '    'Dim streamids As String() = Nothing
    '    'Dim mimeType As String = Nothing
    '    'Dim encoding As String = Nothing
    '    'Dim extension As String = Nothing
    '    'Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
    '    'Dim bytes As Byte()
    '    'Dim user As String = Membership.GetUser.UserName

    '    ''If ModificationRights.RightsOperator Then
    '    ''    Dim setprint As New InvoicesTableAdapters.InvoiceQueries
    '    ''    setprint.Invoice_SetPrint(Request.QueryString("InvoiceID"), user)
    '    ''End If


    '    'Dim lr As New Microsoft.Reporting.WebForms.LocalReport
    '    'lr.ReportPath = "Reports\Invoices\RptProFormaDetNew.rdlc"

    '    'lr.DataSources.Clear()
    '    'lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportsInvoice_Invoice_Print", dsRptInvoice))
    '    'lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportsInvoice_InvoiceDetail_Print", dsInvoiceDetail))
    '    'lr.Refresh()


    '    'Dim pr As New dsMaintHotelTableAdapters.HotelOcuppancyTableAdapter
    '    'Dim hp As dsMaintHotel.HotelOcuppancyRow

    '    'hp = pr.GetData(Integer.Parse(hfHotel.Value.ToString)).Rows(0)

    '    'Dim param1 As New ReportParameter("ch1Label", hp.Chld1ShLabel)
    '    'Dim paramV1 As New ReportParameter("ch1Visible", hp.ChldCategories > 0)
    '    'Dim param2 As New ReportParameter("ch2Label", hp.Chld2ShLabel)
    '    'Dim paramV2 As New ReportParameter("ch2Visible", hp.ChldCategories > 1)
    '    'Dim param3 As New ReportParameter("ch3Label", hp.Chld3ShLabel)
    '    'Dim paramV3 As New ReportParameter("ch3Visible", hp.ChldCategories > 2)
    '    'Dim param4 As New ReportParameter("ch4Label", hp.Chld4ShLabel)
    '    'Dim paramV4 As New ReportParameter("ch4Visible", hp.ChldCategories > 3)
    '    'Dim photel As New ReportParameter("hotel", Me.cbHotel.Checked)
    '    'Dim puser As New ReportParameter("user", user)

    '    'Dim p As ReportParameter() = {param1, paramV1, param2, paramV2, param3, paramV3, param4, paramV4, photel, puser}
    '    'lr.SetParameters(p)
    '    'bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)

    '    'Response.ClearContent()
    '    'Response.ClearHeaders()
    '    'Response.ContentType = "application/pdf"
    '    'Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Proforma.pdf" + """")
    '    'Response.BinaryWrite(bytes)
    '    'Response.Flush()
    '    'Response.Close()
    '    Response.Redirect("~/Reports/Invoices/InvoiceDetail.aspx?InvoiceID=" + Request.QueryString(0) + "&HotelID=" + hfHotel.Value.ToString + "&HotelChecked=" + cbHotel.Checked.ToString)

    '    'Response.Redirect("~/Reports/Invoices/ProInvoiceDetail.aspx?InvoiceID=" + Request.QueryString(0) + "&HotelID=" + hfHotel.Value.ToString + "&HotelChecked=" + cbHotel.Checked.ToString)

    'End Sub

    'Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs)
    '    Dim q As New dsInvoicesTableAdapters.QueriesTableAdapter
    '    Dim butt As Button = CType(sender, Button)

    '    If butt.Text = "Cancel" Then
    '        q.SetInvState(-7, Membership.GetUser.UserName, Today(), Request.QueryString(0))
    '        butt.Text = "Uncancel"
    '        butt.OnClientClick = "if (!confirm('Are you sure you want to cancel this proforma?')) return;"
    '    Else
    '        q.SetInvState(6, Membership.GetUser.UserName, Today(), Request.QueryString(0))
    '        butt.Text = "Cancel"
    '        butt.OnClientClick = "if (!confirm('Are you sure you want to uncancel this proforma?')) return;"

    '    End If

    '    dsInvoice.DataBind()
    '    fvInvoice.DataBind()
    '    UpdatePanelMain.DataBind()

    'End Sub

    Protected Sub fvNewBill_ItemCreated(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvNewBill.ItemCreated
        Dim invrght As New InvoicesRights(Request.QueryString(0), cbHotel.Checked)

        Dim cn As Control = fvNewBill.FindControl("btnNewBill")
        If cn IsNot Nothing Then
            If (fvNewBill.CurrentMode = FormViewMode.ReadOnly) Then
                cn.Visible = invrght.Rights
            End If
        End If
    End Sub

    'Protected Sub btnDeliv_Click(ByVal sender As Object, ByVal e As System.EventArgs)
    '    Dim qa As New dsInvoicesTableAdapters.QueriesTableAdapter
    '    Dim deldat As Nullable(Of Date)

    '    If Not String.IsNullOrEmpty(CType(fvInvoice.FindControl("txtDelivery"), TextBox).Text) Then
    '        deldat = Date.Parse(CType(fvInvoice.FindControl("txtDelivery"), TextBox).Text)
    '        qa.UpdateDeliveredDate(deldat, Membership.GetUser.UserName, Today(), Int32.Parse(Request.QueryString(0)))
    '        fvInvoice.DataBind()
    '        UpdatePanelMain.DataBind()
    '    Else
    '        popShow(False, "Error", "Must input delivery date!")
    '    End If

    'End Sub

    Protected Sub dsStay_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsStay.Deleted
        If e.Exception Is Nothing Then
            gvMix.DataBind()
            fvInvoice.DataBind()
        Else
            popShow("Error Deleting", e.Exception)
        End If
    End Sub

    Protected Sub dsBill_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsBill.Deleted
        e.ExceptionHandled = True

        If e.Exception Is Nothing Then
            gvMix.DataBind()
            fvInvoice.DataBind()
            gvStay.DataBind()
        Else
            popShow("Error Deleting", e.Exception)
        End If
    End Sub

    Protected Sub dsInvoice_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsInvoice.Updated
        e.ExceptionHandled = True

        If e.Exception IsNot Nothing Then
            popShow("Error Editing", e.Exception)
        End If
    End Sub

    Protected Sub dsStay_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsStay.Updated
        If e.Exception IsNot Nothing Then
            popShow("Error Editing", e.Exception)
        End If
    End Sub

    Protected Sub gvStay_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles gvStay.RowEditing
        'Dim ad As Boolean = Hotels.AdultsOnly(Int32.Parse(hfHotel.Value))

        'If gvStay.Rows(e.NewEditIndex).FindControl("txtRoomsNum") IsNot Nothing Then
        '    CType(gvStay.Rows(e.NewEditIndex).FindControl("txtRoomsNum"), TextBox).Text = "1"
        'End If

        'If gvStay.Rows(e.NewEditIndex).FindControl("txtChld1E") IsNot Nothing Then
        '    CType(gvStay.Rows(e.NewEditIndex).FindControl("txtChld1E"), TextBox).Enabled = ad
        'End If
        'If gvStay.Rows(e.NewEditIndex).FindControl("txtChld2E") IsNot Nothing Then
        '    CType(gvStay.Rows(e.NewEditIndex).FindControl("txtChld2E"), TextBox).Enabled = ad
        'End If
        'If gvStay.Rows(e.NewEditIndex).FindControl("txtCh3d1E") IsNot Nothing Then
        '    CType(gvStay.Rows(e.NewEditIndex).FindControl("txtChld3E"), TextBox).Enabled = ad
        'End If
        'If gvStay.Rows(e.NewEditIndex).FindControl("txtChld4E") IsNot Nothing Then
        '    CType(gvStay.Rows(e.NewEditIndex).FindControl("txtChld4E"), TextBox).Enabled = ad
        'End If
    End Sub

    Protected Sub cbHotel_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbHotel.CheckedChanged
        'dsInvoice.DataBind()
        fvInvoice.DataBind()
        'UpdatePanelMain.DataBind()
    End Sub

    'Protected Sub gvSuppRates_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvSuppRates.DataBound
    '    Dim p As New dsInvoicesTableAdapters.HotelOcuppancyTableAdapter
    '    Dim r As dsInvoices.HotelOcuppancyRow

    '    If Not String.IsNullOrEmpty(hfHotel.Value.ToString) Then
    '        r = p.GetData((hfHotel.Value.ToString)).Rows(0)

    '        If r IsNot Nothing Then
    '            If gvSuppRates.Rows.Count > 0 Then
    '                Dim i As Integer

    '                For i = 10 + r.MaxOccupancy To 19
    '                    'gvBill.Columns(i).Visible = False
    '                    gvSuppRates.Columns(i).HeaderStyle.ForeColor = Drawing.Color.Gray
    '                    gvSuppRates.Columns(i).ItemStyle.ForeColor = Drawing.Color.Gray
    '                Next

    '                gvSuppRates.Columns(21).Visible = r.ChldCategories > 0
    '                If Not r.IsChld1ShLabelNull Then gvSuppRates.Columns(21).HeaderText = r.Chld1ShLabel
    '                'If Not r.IsChld1AgShLabelNull Then gvMix.Columns(10).FooterText = r.Chld1AgShLabel
    '                gvSuppRates.Columns(22).Visible = r.ChldCategories > 1
    '                If Not r.IsChld2ShLabelNull Then gvSuppRates.Columns(22).HeaderText = r.Chld2ShLabel
    '                'If Not r.IsChld2AgShLabelNull Then gvMix.Columns(18).FooterText = r.Chld2AgShLabel
    '                gvSuppRates.Columns(23).Visible = r.ChldCategories > 2
    '                If Not r.IsChld3ShLabelNull Then gvSuppRates.Columns(23).HeaderText = r.Chld3ShLabel
    '                'If Not r.IsChld3AgShLabelNull Then gvMix.Columns(19).FooterText = r.Chld3AgShLabel
    '                gvSuppRates.Columns(24).Visible = r.ChldCategories > 3
    '                If Not r.IsChld4ShLabelNull Then gvSuppRates.Columns(24).HeaderText = r.Chld4ShLabel

    '            End If
    '        End If
    '    End If
    'End Sub

    Protected Sub gvStayRates_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvStayRates.DataBound
        Dim p As New dsInvoicesTableAdapters.InvoiceGetPolicyTableAdapter
        Dim t As dsInvoices.InvoiceGetPolicyDataTable
        Dim r As dsInvoices.InvoiceGetPolicyRow

        t = p.GetData(Int32.Parse(Request.QueryString(0)))
        If t.Count > 0 Then
            r = t.Rows(0)
            If gvStayRates.Rows.Count > 0 Then
                Dim i As Integer
                For i = 14 + r.MaxOccupancy To 23
                    gvStayRates.Columns(i).HeaderStyle.ForeColor = Drawing.Color.Gray
                    gvStayRates.Columns(i).ItemStyle.ForeColor = Drawing.Color.Gray
                Next

                gvStayRates.Columns(25).Visible = r.ChldCategories > 0
                If Not r.IsChld1ShLabelNull Then gvStayRates.Columns(25).HeaderText = r.Chld1ShLabel
                gvStayRates.Columns(26).Visible = r.ChldCategories > 1
                If Not r.IsChld2ShLabelNull Then gvStayRates.Columns(26).HeaderText = r.Chld2ShLabel
                gvStayRates.Columns(27).Visible = r.ChldCategories > 2
                If Not r.IsChld3ShLabelNull Then gvStayRates.Columns(27).HeaderText = r.Chld3ShLabel
                gvStayRates.Columns(28).Visible = r.ChldCategories > 3
                If Not r.IsChld4ShLabelNull Then gvStayRates.Columns(28).HeaderText = r.Chld4ShLabel

                If gvStayRates.SelectedIndex = 0 Then
                    If Not String.IsNullOrEmpty(gvStayRates.Rows(0).Cells(1).Text) Then
                        dsRateGetPolicy.SelectParameters.Item(0).DefaultValue = gvStayRates.Rows(0).Cells(1).Text
                        dsRateGetPolicy.Select()
                        fvChildPolicyRates.Visible = True
                        fvStayRatesDesc.Visible = True
                    Else
                        fvChPolicy.Visible = False
                        fvStayRatesDesc.Visible = False
                    End If
                End If
            End If
        End If
    End Sub
    'End Sub

    Protected Sub gvStayRates_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvStayRates.RowCommand, gvSuppRates.RowCommand

        If e.CommandName = "Select" Then

            If Not String.IsNullOrEmpty(e.CommandArgument) Then
                dsRateGetPolicy.SelectParameters.Item(0).DefaultValue = e.CommandArgument
                dsRateGetPolicy.Select()
                fvChildPolicyRates.Visible = True
                fvStayRatesDesc.Visible = True
                'fvChildPolicyRates.DataBind()
            Else
                fvChPolicy.Visible = False
                fvStayRatesDesc.Visible = False
            End If
        End If
    End Sub

    Protected Sub btnDeliv_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim qa As New dsInvoicesTableAdapters.QueriesTableAdapter
        Dim deldat As Nullable(Of Date)

        If Not String.IsNullOrEmpty(CType(fvInvoice.FindControl("txtDelivery"), TextBox).Text) Then
            deldat = Date.Parse(CType(fvInvoice.FindControl("txtDelivery"), TextBox).Text)
            qa.UpdateDeliveredDate(deldat, Membership.GetUser.UserName, Today(), Int32.Parse(Request.QueryString(0)))
            fvInvoice.DataBind()
            'UpdatePanelMain.DataBind()
        Else
            popShow("Error", Nothing, "Must input delivery date!")
        End If

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
       
        Dim cbexcel As Boolean = False

        If fvInvoice.FindControl("cbExcel") IsNot Nothing Then
            cbexcel = CType(fvInvoice.FindControl("cbExcel"), CheckBox).Checked
        End If

        If cbexcel Then
            Response.Redirect("~/Reports/Invoices/InvoiceDetailExcel.aspx?InvoiceID=" + Request.QueryString(0) + "&HotelID=" + hfHotel.Value.ToString + "&HotelChecked=" + cbHotel.Checked.ToString)
        Else
            Response.Redirect("~/Reports/Invoices/InvoiceDetail.aspx?InvoiceID=" + Request.QueryString(0) + "&HotelID=" + hfHotel.Value.ToString + "&HotelChecked=" + cbHotel.Checked.ToString)

        End If

    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim q As New dsInvoicesTableAdapters.QueriesTableAdapter
        Dim butt As Button = CType(sender, Button)

        If butt.Text = "Cancel" Then
            butt.Text = "Uncancel"
            If ModificationRights.RightsHotel Then
                q.SetInvState(-3, Membership.GetUser.UserName, Today(), Request.QueryString(0))
            Else
                q.SetInvState(-7, Membership.GetUser.UserName, Today(), Request.QueryString(0))
            End If
            butt.OnClientClick = "if (!confirm('Are you sure you want to cancel this invoice?')) return;"
        Else
            butt.Text = "Cancel"
            If ModificationRights.RightsHotel Then
                q.SetInvState(1, Membership.GetUser.UserName, Today(), Request.QueryString(0))
            Else
                q.SetInvState(6, Membership.GetUser.UserName, Today(), Request.QueryString(0))
            End If
            butt.OnClientClick = "if (!confirm('Are you sure you want to uncancel this invoice?')) return;"
        End If

        dsInvoice.DataBind()
        fvInvoice.DataBind()

    End Sub

    Protected Sub btnNew_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        fvNewDetail.ChangeMode(FormViewMode.Insert)
    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click
        'If (Page.IsValid) Then
        Dim q As New dsInvoicesTableAdapters.QueriesTableAdapter
        Dim invID, detID, NewRateID As Int32

        invID = Int32.Parse(Request.QueryString(0))
        detID = Int32.Parse(gvMix.SelectedValue)

        If gvStayRates.Visible Then
            'dsBill.UpdateParameters("NewRateID").DefaultValue = gvStayRates.SelectedDataKey.Value
            NewRateID = Int32.Parse(gvStayRates.SelectedDataKey.Value)
            gvStayRates.Visible = False
        Else
            'dsBill.UpdateParameters("NewRateID").DefaultValue = gvSuppRates.SelectedDataKey.Value
            NewRateID = Int32.Parse(gvSuppRates.SelectedDataKey.Value)
            gvSuppRates.Visible = False
        End If

        'dsBill.UpdateParameters("BillingID").DefaultValue = ViewState("BillID")
        'mdlPopup.Hide()

        Try
            'dsBill.Update()

            q.InvBillUpdateRate(invID, detID, Int32.Parse(hfBillID.Value), NewRateID)  'ViewState("BillID")

        Catch ex As Exception
            popShow("Invoice Update", ex)
        End Try

        pnlPopup.Visible = False

        fvInvoice.DataBind()
        gvMix.DataBind()
        gvStay.DataBind()
        gvBill.DataBind()
        'UpdatePanelMain.DataBind()
        ' End If
    End Sub

    Protected Sub btRecalc_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim t As New dsInvoicesTableAdapters.QueriesTableAdapter
        t.InvoiceRecalc(Int32.Parse(Request.QueryString(0)))
        Response.Redirect("~/Invoices/InvoiceCreate.aspx?InvoiceID=" + Request.QueryString(0))
    End Sub

    Protected Sub gvMix_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvMix.SelectedIndexChanged
        pnlPopup.Visible = False
    End Sub

End Class
