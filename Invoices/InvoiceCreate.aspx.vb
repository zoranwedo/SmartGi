Imports System.Data
Partial Class Invoices_InvoiceCreate
    Inherits System.Web.UI.Page

    Dim logBillDet As String = "*"
    Dim logStayDet As String = "*"

    Protected Sub logBillDetSet(BillingID As Integer)
        Dim q As New LogAppTableAdapters.BillingSuppTableAdapter
        Dim b As LogApp.BillingSuppDataTable = q.GetData(BillingID)
        If b IsNot Nothing Then
            logBillDet = b.Rows(0).Item("RateID") & "/" & b.Rows(0).Item("Title")
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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        '**********************************************************
        'Handles:
        '   Page
        'Mode:
        '   fvInvoice
        '   fvNewDetail
        'Value:
        '   cbHotel
        'Visibility:
        '   fvNewBill
        '   cbHotel
        '   fvInvoice.ItemTemplate.hlSend
        '**********************************************************

        If Not (Page.IsPostBack) Then
            cbHotel.Checked = ModificationRights.RightsHotel
        End If

        If Request.QueryString(0) = "0" Then
            fvInvoice.DefaultMode = FormViewMode.Insert
            fvNewDetail.ChangeMode(FormViewMode.Insert)
            fvNewBill.Visible = False
            cbHotel.Visible = False
            LocalMenu.Visible = False
        Else
            LocalMenu.Items(0).NavigateUrl &= "?InvoiceID=" & Request.QueryString(0)
            LocalMenu.Items(1).NavigateUrl &= "?InvoiceID=" & Request.QueryString(0)
            LocalMenu.Items(2).NavigateUrl &= "?InvoiceID=" & Request.QueryString(0)

            Dim invrght As New InvoicesRights(Request.QueryString(0), cbHotel.Checked)
            cbHotel.Visible = invrght.HotelSel

            If (fvInvoice.CurrentMode = FormViewMode.ReadOnly) Then
                fvInvoice.FindControl("hlSend").Visible = invrght.SendSel
            End If
        End If

    End Sub

    Protected Sub ddlHotels_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
        '**********************************************************
        'Handles:
        '   fvInvoice.EditItemTemplate.DropDownList1
        '   fvInvoice.InsertItemTemplate.ddlHotels
        '   fvInvoice.ItemTemplate.ddlHotels
        'Value:
        '   hfHotel = HotelID
        '   hfCh1 = Chld1ShLabel
        '   hfCh2 = Chld2ShLabel
        '   hfCh3 = Chld3ShLabel
        '   hfCh4 = Chld4ShLabel
        'Binding:
        '   gvMix
        '**********************************************************

        hfHotel.Value = CType(sender, DropDownList).SelectedValue
        hfCh1.Value = ""
        hfCh2.Value = ""
        hfCh3.Value = ""
        hfCh4.Value = ""

        Dim p As New dsInvoicesTableAdapters.HotelOcuppancyTableAdapter
        Dim t As dsInvoices.HotelOcuppancyDataTable = p.GetData(Integer.Parse(hfHotel.Value.ToString))
        Dim r As dsInvoices.HotelOcuppancyRow

        If t IsNot Nothing Then
            If t.Rows.Count > 0 Then
                r = t.Rows(0)
                If Not String.IsNullOrEmpty(r.Chld1ShLabel) Then hfCh1.Value = r.Chld1ShLabel
                If Not String.IsNullOrEmpty(r.Chld2ShLabel) Then hfCh2.Value = r.Chld2ShLabel
                If Not String.IsNullOrEmpty(r.Chld3ShLabel) Then hfCh3.Value = r.Chld3ShLabel
                If Not String.IsNullOrEmpty(r.Chld4ShLabel) Then hfCh4.Value = r.Chld4ShLabel
                If Request.QueryString(0) = 0 Then gvMix.DataBind()
            End If
        End If
    End Sub

    Protected Sub ddlHotels_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        '**********************************************************
        'Handles:
        '   fvInvoice.EditItemTemplate.DropDownList1
        '   fvInvoice.InsertItemTemplate.ddlHotels
        '   fvInvoice.ItemTemplate.ddlHotels
        'Value:
        '   hfHotel = HotelID
        '**********************************************************

        hfHotel.Value = CType(sender, DropDownList).SelectedValue
    End Sub

    Protected Sub ddlRoomType_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
        '**********************************************************
        'Handles:
        '   fvNewDetail.InsertItemTemplate.ddlRoomType
        'Value:
        '   hfRoom = RoomTypeID
        '**********************************************************

        hfRoom.Value = CType(sender, DropDownList).SelectedValue
    End Sub

    Protected Sub ddlRoomType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        '**********************************************************
        'Handles:
        '   fvNewDetail.InsertItemTemplate.ddlRoomType
        'Value:
        '   hfRoom = RoomTypeID
        '**********************************************************

        hfRoom.Value = CType(sender, DropDownList).SelectedValue
    End Sub

    Protected Sub ddlInvType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        '**********************************************************
        'Handles:
        '   fvInvoice.InsertItemTemplate.ddlInvType
        'Value:
        '   hfInvType = InvType
        'Visibility:
        '   fvInvoice.InsertItemTemplate.txtInvType
        '**********************************************************

        hfInvType.Value = CType(sender, DropDownList).SelectedValue
        Dim c As Control = fvInvoice.FindControl("txtInvType")

        If c IsNot Nothing Then
            CType(c, TextBox).Visible = (hfInvType.Value = "1")
        End If
    End Sub

    Protected Sub cbRVHtl_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        '**********************************************************
        'Handles:
        '   fvInvoice.ItemTemplate.cbRVHtl
        'Binding:
        '   dsInvoice
        '   fvInvoice
        '**********************************************************

        Dim q As New dsInvoicesTableAdapters.QueriesTableAdapter
        Dim l As New LogApp
        Dim logINV As Integer = Integer.Parse(Request.QueryString(0))
        Dim logUSR As String = Membership.GetUser.UserName
        Dim logTXT As String

        If CType(sender, CheckBox).Checked Then
            Try
                logTXT = "Invoice Reviewed by hotel"
                q.SetInvState(2, logUSR, Today(), logINV)
                l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnState, LogApp.stateComplete, logINV, logTXT)
            Catch ex As Exception
                logTXT = "Invoice Review by hotel ERROR: " & ExceptionText(ex)
                l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnState, LogApp.stateError, logINV, logTXT)
                If ex.Message IsNot Nothing Then popShow("Updating state", ex)
            End Try
        Else
            Try
                logTXT = "Invoice UNreviewed by hotel"
                q.SetInvState(1, Membership.GetUser.UserName, Today(), Request.QueryString(0))
                l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnState, LogApp.stateComplete, logINV, logTXT)
            Catch ex As Exception
                logTXT = "Invoice UNreview by hotel ERROR: " & ExceptionText(ex)
                l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnState, LogApp.stateError, logINV, logTXT)
                If ex.Message IsNot Nothing Then popShow("Updating state", ex)
            End Try
        End If
        dsInvoice.DataBind()
        fvInvoice.DataBind()
    End Sub

    Protected Sub fvInvoice_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles fvInvoice.ItemCommand
        '**********************************************************
        'Handles:
        '   fvInvoice.Review
        '**********************************************************

        If e.CommandName = "Review" Then
            Dim q As New dsInvoicesTableAdapters.QueriesTableAdapter
            Dim l As New LogApp
            Dim logINV As Integer = Integer.Parse(Request.QueryString(0))
            Dim logUSR As String = Membership.GetUser.UserName
            Dim logTXT As String

            If e.CommandArgument = False Then
                Try
                    logTXT = "Invoice Reviewed by CCI"
                    q.InvoiceReviewed(Request.QueryString(0), 1)
                    l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnState, LogApp.stateComplete, logINV, logTXT)
                Catch ex As Exception
                    logTXT = "Invoice Review by CCI ERROR: " & ex.Message
                    l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnState, LogApp.stateError, logINV, logTXT)
                    If ex.Message IsNot Nothing Then popShow("Updating state", ex)
                End Try
            Else
                Try
                    logTXT = "Invoice UNreviewed by CCI"
                    q.InvoiceReviewed(Request.QueryString(0), 0)
                    l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnState, LogApp.stateComplete, logINV, logTXT)
                Catch ex As Exception
                    logTXT = "Invoice UNreview by CCI ERROR: " & ex.Message
                    l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnState, LogApp.stateError, logINV, logTXT)
                    If ex.Message IsNot Nothing Then popShow("Updating state", ex)
                End Try
            End If
            fvInvoice.DataBind()
            UpdatePanelMain.DataBind()
        End If
    End Sub

    Protected Sub cbRVCCI_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        '**********************************************************
        'Handles:
        '   fvInvoice.ItemTemplate.cbRVCCI
        '**********************************************************

        Dim q As New dsInvoicesTableAdapters.QueriesTableAdapter
        Dim l As New LogApp
        Dim logINV As Integer = Integer.Parse(Request.QueryString(0))
        Dim logUSR As String = Membership.GetUser.UserName
        Dim logTXT As String

        If CType(sender, CheckBox).Checked Then
            Try
                logTXT = "Invoice Reviewed by CCI"
                q.InvoiceReviewed(Request.QueryString(0), 1)
                l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnState, LogApp.stateComplete, logINV, logTXT)
            Catch ex As Exception
                logTXT = "Invoice Review by CCI ERROR: " & ex.Message
                l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnState, LogApp.stateError, logINV, logTXT)
                If ex.Message IsNot Nothing Then popShow("Updating state", ex)
            End Try
        Else
            Try
                logTXT = "Invoice UNreviewed by CCI"
                q.InvoiceReviewed(Request.QueryString(0), 0)
                l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnState, LogApp.stateComplete, logINV, logTXT)
            Catch ex As Exception
                logTXT = "Invoice UNreview by CCI ERROR: " & ex.Message
                l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnState, LogApp.stateError, logINV, logTXT)
                If ex.Message IsNot Nothing Then popShow("Updating state", ex)
            End Try
        End If
        fvInvoice.DataBind()
        UpdatePanelMain.DataBind()
    End Sub

    Protected Sub cbHotel_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbHotel.CheckedChanged
        '**********************************************************
        'Handles:
        '   cbHotel
        'Binding:
        '   fvInvoice
        '   UpdatePanelMain
        '**********************************************************

        fvInvoice.DataBind()
        UpdatePanelMain.DataBind()
    End Sub

    Protected Sub dsInvoice_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsInvoice.Inserting
        '**********************************************************
        'Handles:
        '   dsInvoice
        'Note:
        '   bname was provided by new instance of Queries...
        '**********************************************************

        Dim qr As New dsInvoicesTableAdapters.QueriesTableAdapter

        qr.NewInvoiceNum(Int32.Parse(hfHotel.Value))
        Dim invnum As Integer = qr.GetReturnValue(0)
        Dim bname As String = qr.TO_BillingName(Int32.Parse(CType(fvInvoice.FindControl("ddlTO"), DropDownList).SelectedValue))

        If Not IsNothing(invnum) Then
            e.InputParameters.Item("InvNumber") = invnum
            e.InputParameters.Item("BillingName") = bname
        End If
    End Sub

    Protected Sub dsInvoice_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsInvoice.Inserted
        '**********************************************************
        'Handles:
        '   dsInvoice
        'Binding:
        '   Page
        '**********************************************************

        Dim invid As Int32

        e.ExceptionHandled = True

        If Not IsNothing(e.OutputParameters.Item("NewID")) Then
            invid = e.OutputParameters.Item("NewID")
            Try
                dsMix.InsertParameters.Item("InvoiceId").DefaultValue = invid
                fvNewDetail.InsertItem(True)

                Dim l As New LogApp
                l.LogUserAction(Membership.GetUser.UserName, LogApp.objInv, LogApp.evnInset, LogApp.stateComplete, invid, "Invoice created")

                Response.Redirect("~/Invoices/InvoiceCreate.aspx?InvoiceID=" & invid)
            Catch ex As Exception
                If ex.Message IsNot Nothing Then popShow("Error Inserting", ex)
            End Try
        End If
    End Sub

    Protected Sub dsInvoice_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsInvoice.Updated
        '**********************************************************
        'Handles:
        '   dsInvoice
        '**********************************************************
        Dim l As New LogApp
        Dim logINV As Integer = Integer.Parse(Request.QueryString(0))
        Dim logUSR As String = Membership.GetUser.UserName

        e.ExceptionHandled = True

        If e.Exception IsNot Nothing Then
            Dim logTXT As String = "Invoice header update ERROR: " & ExceptionText(e.Exception)
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnUpdate, LogApp.stateError, logINV, logTXT)
            popShow("Error Editing", e.Exception)
        Else
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnUpdate, LogApp.stateComplete, logINV, "Invoice header updated")
        End If
    End Sub

    Protected Sub fvNewDetail_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles fvNewDetail.ItemCommand
        '**********************************************************
        'Handles:
        '   fvNewDetail.Insert (in invoice insert)
        '   fvNewDetail.Cancel (in invoice insert)
        '**********************************************************

        If Request.QueryString(0) = 0 Then
            If e.CommandName = "Insert" Then
                Try
                    fvInvoice.InsertItem(True)
                Catch ex As Exception
                    popShow("Error", ex)
                End Try
            End If
            If e.CommandName = "Cancel" Then
                Response.Redirect("~/Invoices/Invoices.aspx", True)
            End If
        End If

    End Sub

    Protected Sub fvNewDetail_ItemCreated(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvNewDetail.ItemCreated
        '**********************************************************
        'Handles:
        '   fvNewDetail
        'Visibility:
        '   fvNewDetail.InsertItemTemplate.txtChld1
        '   fvNewDetail.InsertItemTemplate.txtChld2
        '   fvNewDetail.InsertItemTemplate.txtChld3
        '   fvNewDetail.InsertItemTemplate.txtChld4
        '   fvNewDetail.ItemTemplate.btnNew
        'Enable:
        '   fvNewDetail.InsertItemTemplate.txtChld1
        '   fvNewDetail.InsertItemTemplate.txtChld2
        '   fvNewDetail.InsertItemTemplate.txtChld3
        '   fvNewDetail.InsertItemTemplate.txtChld4
        'Value:
        '   fvNewDetail.InsertItemTemplate.txtRoomsNum
        '**********************************************************

        If fvNewDetail.CurrentMode = FormViewMode.Insert Then
            If String.IsNullOrEmpty(hfHotel.Value) Then Exit Sub

            Dim ad As Boolean = Not Hotels.AdultsOnly(Int32.Parse(hfHotel.Value))
            Dim p As New dsInvoicesTableAdapters.InvoiceGetPolicyTableAdapter
            Dim r As dsInvoices.InvoiceGetPolicyRow
            If Int32.Parse(Request.QueryString(0)) = 0 Then
                r = p.GetHotelData(hfHotel.Value).Rows(0)
            Else
                r = p.GetData(Int32.Parse(Request.QueryString(0))).Rows(0)
            End If

            Dim t As TextBox
            For i = 1 To 4
                t = fvNewDetail.FindControl("txtChld" & i)
                If t IsNot Nothing Then
                    t.Visible = r.ChldCategories > i - 1
                    t.Enabled = ad
                End If
            Next

            t = fvNewDetail.FindControl("txtRoomsNum")
            If t IsNot Nothing Then
                t.Text = "1"
            End If
        ElseIf fvNewDetail.CurrentMode = FormViewMode.ReadOnly Then
            Dim invrght As New InvoicesRights(Request.QueryString(0), cbHotel.Checked)
            fvNewDetail.FindControl("btnNew").Visible = invrght.Rights
        End If
    End Sub

    Protected Sub gvMix_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvMix.DataBound
        '**********************************************************
        'Handles:
        '   gvMix
        'Visibility:
        '   gvMix.Columns(12)
        '   gvMix.Columns(13)
        '   gvMix.Columns(14)
        '   gvMix.Columns(15)
        '   gvMix.EmptyDataTemplate.lblCh1
        '   gvMix.EmptyDataTemplate.lblCh2
        '   gvMix.EmptyDataTemplate.lblCh3
        '   gvMix.EmptyDataTemplate.lblCh4
        'Value:
        '   gvMix.Columns(12).HeaderText
        '   gvMix.Columns(13).HeaderText
        '   gvMix.Columns(14).HeaderText
        '   gvMix.Columns(15).HeaderText
        '**********************************************************

        Dim p As New dsInvoicesTableAdapters.InvoiceGetPolicyTableAdapter
        Dim t As dsInvoices.InvoiceGetPolicyDataTable
        Dim r As dsInvoices.InvoiceGetPolicyRow

        If Int32.Parse(Request.QueryString(0)) = 0 Then
            t = p.GetHotelData(hfHotel.Value)
        Else
            t = p.GetData(Int32.Parse(Request.QueryString(0)))
        End If
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
                Dim tbl As Table = gvMix.Controls(0)
                Dim grv As GridViewRow = tbl.Controls(0)

                Dim l As Label
                For i = 1 To 4
                    l = grv.FindControl("lblCh" & i)
                    If l IsNot Nothing Then
                        l.Visible = r.ChldCategories > i - 1
                    End If
                Next
            End If

        End If
    End Sub

    Protected Sub dsMix_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsMix.Inserting
        '**********************************************************
        'Handles:
        '   dsMix
        'Value:
        '   dsMix.InputParameters.RoomTypeId
        '   dsMix.InputParameters.MealPlanId
        '   dsMix.InputParameters.InvoiceID
        '**********************************************************

        e.InputParameters.Item("RoomTypeId") = CType(fvNewDetail.FindControl("ddlRoomType"), DropDownList).SelectedValue
        e.InputParameters.Item("MealPlanId") = CType(fvNewDetail.FindControl("ddlMP"), DropDownList).SelectedValue
        If Not (Request.QueryString(0) = 0) Then e.InputParameters.Item("InvoiceID") = Integer.Parse(Request.QueryString(0).ToString)
    End Sub

    Protected Sub dsMix_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsMix.Inserted
        '**********************************************************
        'Handles:
        '   dsMix
        'Binding:
        '   fvInvoice
        '**********************************************************

        Dim l As New LogApp
        Dim logINV As Integer = Integer.Parse(Request.QueryString(0))
        Dim logUSR As String = Membership.GetUser.UserName
        Dim detID As Integer = e.ReturnValue
        Dim detName As String = CType(fvNewDetail.FindControl("txtName"), TextBox).Text
        Dim logTXT As String = "Invoice stay detail " & detID.ToString & "/" & detName & " insert"

        e.ExceptionHandled = True

        If e.Exception IsNot Nothing Then
            logTXT += " ERROR: " & ExceptionText(e.Exception)
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnInset, LogApp.stateError, logINV, logTXT)
            popShow("Error Inserting", e.Exception)
        Else
            logTXT += "ed"
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnInset, LogApp.stateComplete, logINV, logTXT)
            fvInvoice.DataBind()
        End If
    End Sub

    Protected Sub dsMix_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsMix.Updating
        '**********************************************************
        'Handles:
        '   dsMix
        'Value:
        '   dsMix.InputParameters.RoomTypeId
        '   dsMix.InputParameters.MealPlanId
        '**********************************************************

        e.InputParameters.Item("RoomTypeId") = CType(fvNewDetail.FindControl("ddlRoomType"), DropDownList).SelectedValue
        e.InputParameters.Item("MealPlanId") = CType(fvNewDetail.FindControl("ddlMP"), DropDownList).SelectedValue
    End Sub

    'Protected Sub fvNewDetail_ItemInserted(sender As Object, e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles fvNewDetail.ItemInserted
    '    Dim l As New LogApp
    '    Dim logINV As Integer = Integer.Parse(Request.QueryString(0))
    '    Dim logUSR As String = Membership.GetUser.UserName
    '    Dim detID As Integer = e.Values("DetailID")
    '    Dim detName As String = e.Values("DetText")
    '    Dim logTXT As String = "Invoice stay detail " & detID.ToString & "/" & detName & " Insert"

    '    e.ExceptionHandled = True

    '    If e.Exception IsNot Nothing Then
    '        logTXT += " ERROR: " & ExceptionText(e.Exception)
    '        l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnInset, LogApp.stateError, logINV, logTXT)
    '        popShow("Error Inserting", e.Exception)
    '    Else
    '        logTXT += "ed"
    '        l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnInset, LogApp.stateComplete, logINV, logTXT)
    '        fvInvoice.DataBind()
    '    End If
    'End Sub

    Protected Sub gvBill_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvBill.DataBound
        '**********************************************************
        'Handles:
        '   gvBill
        'Value:
        '   gvBill.Columns(19).HeaderText
        '   gvBill.Columns(20).HeaderText
        '   gvBill.Columns(21).HeaderText
        '   gvBill.Columns(22).HeaderText
        '   gvBill.Columns(8).HeaderStyle.ForeColor
        '   gvBill.Columns(9).HeaderStyle.ForeColor
        '   gvBill.Columns(10).HeaderStyle.ForeColor
        '   gvBill.Columns(11).HeaderStyle.ForeColor
        '   gvBill.Columns(12).HeaderStyle.ForeColor
        '   gvBill.Columns(13).HeaderStyle.ForeColor
        '   gvBill.Columns(14).HeaderStyle.ForeColor
        '   gvBill.Columns(15).HeaderStyle.ForeColor
        '   gvBill.Columns(16).HeaderStyle.ForeColor
        '   gvBill.Columns(17).HeaderStyle.ForeColor
        '**********************************************************

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
        '**********************************************************
        'Handles:
        '   gvBill
        'Visibility:
        '   gvStayRates
        '   gvSuppRates
        '   pnlPopup
        '   btnSaveIns
        '   btnSave
        '   fvChPolicy
        'Mode:
        '   _EditBillDate___
        '   gvBill.EditIndex
        'Value:
        '   _EditBillRate___
        '   hfBillID = e.CommandArgument
        '   *? ViewState("BillID") = e.CommandArgument
        '   dsGetSuppRate.SelectParameters.Start
        '   dsGetSuppRate.SelectParameters.Finish
        '   dsGetStayRate.SelectParameters.BillingId
        '   _Select___
        '   dsRateGetPolicy.SelectParameters.RateID = e.CommandArgument
        '   _Delete___
        '   dsBill.DeleteParameters.BillingId = e.CommandArgument
        'Binding:
        '   _Select___
        '   dsRateGetPolicy
        '   fvChPolicy
        '**********************************************************

        gvStayRates.Visible = False
        gvSuppRates.Visible = False
        pnlPopup.Visible = False

        If e.CommandName = "EditBillRate" Then
            Try
                Dim btnDetails As LinkButton = CType(e.CommandSource, LinkButton)
                Dim gv As GridView = CType(sender, GridView)
                Dim row As GridViewRow = CType(btnDetails.NamingContainer, GridViewRow)
                Dim grdPopUp As GridView

                gvBill.SelectedIndex = row.RowIndex
                hfBillID.Value = e.CommandArgument.ToString
                ViewState("BillID") = Int32.Parse(e.CommandArgument.ToString)

                If Not String.IsNullOrEmpty(CType(row.FindControl("lblRateType"), Label).Text) Then
                    Dim ratetype As Integer = Integer.Parse(CType(row.FindControl("lblRateType"), Label).Text)

                    pnlPopup.Visible = True

                    If ratetype = 9 Then
                        grdPopUp = gvSuppRates
                        dsGetSuppRate.SelectParameters("Start").DefaultValue = Date.Parse(row.Cells(1).Text)
                        dsGetSuppRate.SelectParameters("Finish").DefaultValue = Date.Parse(CType(row.FindControl("lnkEditDate"), LinkButton).Text)
                        gvSuppRates.Visible = True
                        gvStayRates.Visible = False
                    Else
                        grdPopUp = gvStayRates
                        dsGetStayRate.SelectParameters("BillingId").DefaultValue = Int32.Parse(e.CommandArgument.ToString)
                        gvSuppRates.Visible = False
                        gvStayRates.Visible = True
                    End If

                    If grdPopUp.Rows.Count > 0 Then
                        If ratetype = 9 Then
                            btnSaveIns.Visible = True
                            btnSave.Visible = False
                        Else
                            btnSaveIns.Visible = False
                            btnSave.Visible = True
                        End If
                    End If
                End If
            Catch ex As Exception
                popShow("Error on 'EditBillRate'", ex)
            End Try
        ElseIf e.CommandName = "EditBillDate" Then
            Try
                Dim row As GridViewRow = CType(e.CommandSource, Control).NamingContainer
                gvBill.EditIndex = row.RowIndex
            Catch ex As Exception
                popShow("Error on 'EditBillDate'", ex)
            End Try
        ElseIf e.CommandName = "Select" Then
            Try
                pnlPopup.Visible = False
                If Not String.IsNullOrEmpty(e.CommandArgument) Then
                    dsRateGetPolicy.SelectParameters("RateID").DefaultValue = e.CommandArgument
                    dsRateGetPolicy.Select()
                    fvChPolicy.DataBind()
                    fvChPolicy.Visible = True
                Else
                    fvChPolicy.Visible = False
                End If
            Catch ex As Exception
                popShow("Error on 'Select'", ex)
            End Try
        ElseIf e.CommandName = "Delete" Then
            Try
                If Not String.IsNullOrEmpty(e.CommandArgument) Then
                    dsBill.DeleteParameters("BillingId").DefaultValue = e.CommandArgument
                    logBillDetSet(e.CommandArgument)
                End If
            Catch ex As Exception
                popShow("Error 'Delete'", ex)
            End Try
        End If
    End Sub

    Protected Sub gvBill_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvBill.RowCreated
        '**********************************************************
        'Handles:
        '   gvBill
        'Depends:
        '   gvBill.Row.Cells(5) (RateID)
        '   gvBill.Row.Cells(6) (RateType)
        'Enable:
        '   gvBill.Row.lnkEditRate
        '   gvBill.Row.lnkEditDate
        'Visibility:
        '   gvBill.Row.ibBillDelete
        'Value:
        '   gvBill.Row.lnkEditRate.ToolTip
        '**********************************************************

        Dim invrght As New InvoicesRights(Request.QueryString(0), cbHotel.Checked)
        'Dim supp As Boolean = True
        'Dim q As New dsInvoicesTableAdapters.RateTableAdapter
        'Dim qr As dsInvoices.RateRow
        'Dim rateid As Integer = 0

        If e.Row.RowType = DataControlRowType.DataRow Then
            ''If e.Row.Cells(5) IsNot Nothing Then
            ''    If Not String.IsNullOrEmpty(CType(e.Row.Cells.Item(5).Controls(1), Label).Text) Then
            ''        rateid = Int32.Parse(CType(e.Row.Cells.Item(5).Controls(1), Label).Text)
            ''        qr = q.GetData(rateid).Rows(0)
            ''    End If
            ''End If
            'If e.Row.FindControl("lblRateID") IsNot Nothing Then
            '    rateid = Int32.Parse(CType(e.Row.FindControl("lblRateID"), Label).Text)
            '    qr = q.GetData(rateid).Rows(0)
            'End If

            ''If e.Row.Cells(6) IsNot Nothing Then
            ''If Not String.IsNullOrEmpty(CType(e.Row.Cells.Item(6).Controls(1), Label).Text) Then
            ''    If Int32.Parse(CType(e.Row.Cells.Item(6).Controls(1), Label).Text) = 9 Then
            ''        supp = True
            ''    Else
            ''        supp = False
            ''    End If
            ''End If
            ''End If
            'If e.Row.FindControl("lblRateType") IsNot Nothing Then
            '    supp = (Int32.Parse(CType(e.Row.FindControl("lblRateType"), Label).Text) = 9)
            'End If

            'Dim b As LinkButton = e.Row.FindControl("lnkEditRate")
            'If b IsNot Nothing Then
            '    b.Enabled = invrght.Rights And supp
            '    If supp Then
            '        If rateid <> 0 Then b.ToolTip = qr.Title
            '    End If
            'End If
            If e.Row.FindControl("lnkEditDate") IsNot Nothing Then CType(e.Row.FindControl("lnkEditDate"), LinkButton).Enabled = invrght.Rights
            If e.Row.FindControl("ibBillDelete") IsNot Nothing Then e.Row.FindControl("ibBillDelete").Visible = invrght.Rights 'And supp
        End If
    End Sub

    Protected Sub dsStay_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsStay.Updated
        '**********************************************************
        'Handles:
        '   dsStay
        '**********************************************************

        If e.Exception IsNot Nothing Then
            popShow("Error Editing", e.Exception)
        End If
    End Sub

    Protected Sub dsStay_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsStay.Inserted
        '**********************************************************
        'Handles:
        '   dsStay
        '**********************************************************

        If e.Exception IsNot Nothing Then
            popShow("Error Inserting", e.Exception)
        End If
    End Sub

    Protected Sub dsStay_Deleted(sender As Object, e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsStay.Deleted
        '**********************************************************
        'Handles:
        '   dsStay
        '**********************************************************

        If e.Exception IsNot Nothing Then
            popShow("Error Deleting", e.Exception)
        End If
    End Sub

    Protected Sub gvStay_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvStay.DataBound
        '**********************************************************
        'Handles:
        '   gvStay
        'Visibility:
        '   gvStay.Columns(6).Visible
        '   gvStay.Columns(7).Visible
        '   gvStay.Columns(8).Visible
        '   gvStay.Columns(9).Visible
        'Value:
        '   gvStay.Columns(6).HeaderText
        '   gvStay.Columns(7).HeaderText
        '   gvStay.Columns(8).HeaderText
        '   gvStay.Columns(9).HeaderText
        '**********************************************************

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

    Protected Sub gvStay_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvStay.RowCommand
        '**********************************************************
        'Handles:
        '   gvStay
        'Visibility:
        '   cbHotel
        '**********************************************************

        If e.CommandName = "Edit" Then
            cbHotel.Visible = False
        End If
    End Sub

    Protected Sub gvStay_RowDeleting(sender As Object, e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles gvStay.RowDeleting
        Dim l As New LogApp
        Dim logUSR As String = Membership.GetUser.UserName
        Dim logINV = Int32.Parse(Request.QueryString(0))
        Dim detID = e.Keys("DetailID")
        Dim detName As String = CType(gvStay.Rows(e.RowIndex).FindControl("Label12"), Label).Text
        logStayDet = detID & "/" & detName
        Dim logTXT As String = "Stay detail " & logStayDet & " delete"
        l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnDelete, LogApp.stateStart, logINV, logTXT)
    End Sub

    Protected Sub gvStay_RowDeleted(sender As Object, e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles gvStay.RowDeleted
        Dim l As New LogApp
        Dim logUSR As String = Membership.GetUser.UserName
        Dim logINV = Int32.Parse(Request.QueryString(0))
        Dim logTXT As String = "Stay detail " & logStayDet & " delete"

        e.ExceptionHandled = True

        If e.Exception IsNot Nothing Then
            logTXT += " ERROR: " & ExceptionText(e.Exception)
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnDelete, LogApp.stateError, logINV, logTXT)
            popShow("Error Deleting Stay Detail", e.Exception)
        Else
            logTXT += "d"
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnDelete, LogApp.stateComplete, logINV, logTXT)
            gvMix.DataBind()
            gvMix.SelectedIndex = 0
            gvBill.DataBind()
            fvInvoice.DataBind()
        End If
    End Sub

    Protected Sub gvStay_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles gvStay.RowUpdating
        '**********************************************************
        'Handles:
        '   gvStay
        'Value:
        '   dsStay.UpdateParameters.RoomTypeId
        '   dsStay.UpdateParameters.MealPlanId
        '**********************************************************

        dsStay.UpdateParameters.Item("RoomTypeId").DefaultValue = CType(gvStay.Rows(e.RowIndex).FindControl("ddlRoomType"), DropDownList).SelectedValue
        dsStay.UpdateParameters.Item("MealPlanId").DefaultValue = CType(gvStay.Rows(e.RowIndex).FindControl("ddlMPstay"), DropDownList).SelectedValue

        Dim l As New LogApp
        Dim logUSR As String = Membership.GetUser.UserName
        Dim logINV = Int32.Parse(Request.QueryString(0))
        Dim detID = e.Keys("DetailID")
        Dim detName As String = e.OldValues("DetText")
        Dim logTXT As String = "Stay detail " & detID.ToString & "/" & detName & " update"
        l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnUpdate, LogApp.stateStart, logINV, logTXT)
    End Sub

    Protected Sub gvStay_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles gvStay.RowUpdated
        '**********************************************************
        'Handles:
        '   gvStay
        'Binding:
        '   gvMix
        '   gvBill
        '   fvInvoice
        '**********************************************************

        Dim invrght As New InvoicesRights(Request.QueryString(0), cbHotel.Checked)
        cbHotel.Visible = invrght.HotelSel

        'Dim logOLD As String = "'" & e.OldValues("DetText") & "'/" & e.OldValues("BookingDate") & "/'" & e.OldValues("BookingVoucher") & "'/" & _
        '                        e.OldValues("RoomTypeId") & "/" & e.OldValues("MealPlanId") & "/" & e.OldValues("AdultNum") & "/" & _
        '                        e.OldValues("Chld1Num") & "/" & e.OldValues("Chld2Num") & "/" & e.OldValues("Chld3Num") & "/" & e.OldValues("Chld4Num") & "/" & _
        '                        e.OldValues("RoomsNum")

        'Dim logNEW As String = "'" & e.NewValues("DetText") & "'/" & e.NewValues("BookingDate") & "/'" & e.NewValues("BookingVoucher") & "'/" & _
        '                        e.NewValues("RoomTypeId") & "/" & e.NewValues("MealPlanId") & "/" & e.NewValues("AdultNum") & "/" & _
        '                        e.NewValues("Chld1Num") & "/" & e.NewValues("Chld2Num") & "/" & e.NewValues("Chld3Num") & "/" & e.NewValues("Chld4Num") & "/" & _
        '                        e.NewValues("RoomsNum")

        Dim l As New LogApp
        Dim logUSR As String = Membership.GetUser.UserName
        Dim logINV = Int32.Parse(Request.QueryString(0))
        Dim detID = e.Keys("DetailID")
        Dim detName As String = e.NewValues("DetText")
        Dim logTXT As String = "Stay detail " & detID.ToString & "/" & detName & " update"

        e.ExceptionHandled = True

        If e.Exception IsNot Nothing Then
            logTXT += " ERROR: " & ExceptionText(e.Exception)
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnUpdate, LogApp.stateError, logINV, logTXT)
            popShow("Error Updating Stay Detail", e.Exception)
        Else
            logTXT += "d"
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnUpdate, LogApp.stateComplete, logINV, logTXT)
            gvMix.DataBind()
            gvBill.DataBind()
            fvInvoice.DataBind()
        End If
    End Sub

    Protected Sub gvStay_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvStay.RowCreated
        '**********************************************************
        'Handles:
        '   gvStay
        'Enable:
        '   gvStay.Row.txtChld1E
        '   gvStay.Row.txtChld2E
        '   gvStay.Row.txtChld3E
        '   gvStay.Row.txtChld4E
        'Visibility:
        '   gvStay.Row.ibEdit
        '   gvStay.Row.ibDelete
        '**********************************************************

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

    Protected Sub fvNewBill_ItemCreated(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvNewBill.ItemCreated
        '**********************************************************
        'Handles:
        '   fvNewBill
        'Visibility:
        '   fvNewBill.btnNewBill
        '**********************************************************

        Dim invrght As New InvoicesRights(Request.QueryString(0), cbHotel.Checked)

        Dim cn As Control = fvNewBill.FindControl("btnNewBill")
        If cn IsNot Nothing Then
            If (fvNewBill.CurrentMode = FormViewMode.ReadOnly) Then
                cn.Visible = invrght.Rights
            End If
        End If
    End Sub

    Protected Sub gvStayRates_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvStayRates.DataBound
        '**********************************************************
        'Handles:
        '   gvStayRates
        'Depends:
        '   gvStayRates.Rows(0).Cells(1) (RateID)
        'Visibility:
        '   gvStayRates.Columns(25)
        '   gvStayRates.Columns(26)
        '   gvStayRates.Columns(27)
        '   gvStayRates.Columns(28)
        '   fvChildPolicyRates
        '   fvStayRatesDesc
        'Value:
        '   gvStayRates.Columns(25).HeaderText
        '   gvStayRates.Columns(26).HeaderText
        '   gvStayRates.Columns(27).HeaderText
        '   gvStayRates.Columns(28).HeaderText
        '   gvStayRates.Columns(14).HeaderStyle.ForeColor
        '   gvStayRates.Columns(15).HeaderStyle.ForeColor
        '   gvStayRates.Columns(16).HeaderStyle.ForeColor
        '   gvStayRates.Columns(17).HeaderStyle.ForeColor
        '   gvStayRates.Columns(18).HeaderStyle.ForeColor
        '   gvStayRates.Columns(19).HeaderStyle.ForeColor
        '   gvStayRates.Columns(20).HeaderStyle.ForeColor
        '   gvStayRates.Columns(21).HeaderStyle.ForeColor
        '   gvStayRates.Columns(22).HeaderStyle.ForeColor
        '   gvStayRates.Columns(23).HeaderStyle.ForeColor
        '   dsRateGetPolicy.SelectParameters.RateID
        'Binding:
        '   dsRateGetPolicy
        '**********************************************************

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
                        dsRateGetPolicy.SelectParameters("RateID").DefaultValue = gvStayRates.Rows(0).Cells(1).Text
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

    Protected Sub gvStayRates_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvStayRates.RowCommand, gvSuppRates.RowCommand
        '**********************************************************
        'Handles:
        '   gvStayRates
        '   gvSuppRates
        'Visibility:
        '   fvChildPolicyRates
        '   fvStayRatesDesc
        'Value:
        '   dsRateGetPolicy.SelectParameters.RateID
        'Binding:
        '   dsRateGetPolicy
        '**********************************************************

        If e.CommandName = "Select" Then
            If Not String.IsNullOrEmpty(e.CommandArgument) Then
                dsRateGetPolicy.SelectParameters("RateID").DefaultValue = e.CommandArgument
                dsRateGetPolicy.Select()
                fvChildPolicyRates.Visible = True
                fvStayRatesDesc.Visible = True
            Else
                fvChPolicy.Visible = False
                fvStayRatesDesc.Visible = False
            End If
        End If
    End Sub

    Protected Sub btnDeliv_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        '**********************************************************
        'Handles:
        '   fvInvoice.ItemTemplate.btnDeliv
        'Depends:
        '   fvInvoice.ItemTemplate.txtDelivery
        'Binding:
        '   fvInvoice
        '**********************************************************

        If Not String.IsNullOrEmpty(CType(fvInvoice.FindControl("txtDelivery"), TextBox).Text) Then
            Dim l As New LogApp
            Dim logINV As Integer = Integer.Parse(Request.QueryString(0))
            Dim logUSR As String = Membership.GetUser.UserName

            Dim qa As New dsInvoicesTableAdapters.QueriesTableAdapter
            Dim deldat As Nullable(Of Date)= Date.Parse(CType(fvInvoice.FindControl("txtDelivery"), TextBox).Text)
            qa.UpdateDeliveredDate(deldat, logUSR, Today(), logINV)
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnState, LogApp.stateComplete, logINV, "Invoice Delivery date set to " & deldat.ToString)

            fvInvoice.DataBind()
        Else
            popShow("Error", Nothing, "Must input delivery date!")
        End If
    End Sub

    Protected Sub btnPrint_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        '**********************************************************
        'Handles:
        '   fvInvoice.btnPrint
        'Depends:
        '   fvInvoice.cbExcel
        '**********************************************************

        Dim l As New LogApp
        Dim logUSR As String = Membership.GetUser.UserName
        Dim logINV = Int32.Parse(Request.QueryString("InvoiceID"))
        Dim logTXT As String = "Invoice Printed "

        Dim cbXLS As Boolean = False
        Dim cbHTL As Boolean = cbHotel.Checked
        If fvInvoice.FindControl("cbExcel") IsNot Nothing Then
            cbXLS = CType(fvInvoice.FindControl("cbExcel"), CheckBox).Checked
        End If

        logTXT &= "(" & IIf(cbHTL, "HTL", "CCI") & IIf(cbXLS, "/XLS", "/PDF") & ")"
        l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnPrint, LogApp.stateComplete, logINV, logTXT)

        Dim rep As String = "~/Reports/Invoices/InvoiceDetail.aspx?InvoiceID=" + logINV.ToString + "&HotelChecked=" + cbHTL.ToString
        If cbXLS Then rep &= "&Excel=True"
        Response.Redirect(rep)
    End Sub

    Protected Sub btnXML_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        '**********************************************************
        'Handles:
        '   fvInvoice.btnXML
        'Depends:
        '   
        '**********************************************************

        Dim rep As String = "~/Reports/Invoices/BavelInvoiceXML.aspx?InvoiceID=" + Request.QueryString("InvoiceID")
        Response.Redirect(rep)
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        '**********************************************************
        'Handles:
        '   fvInvoice.btnCancel (Cancel)
        'Value:
        '   fvInvoice.btnCancel.OnClientClick
        'Binding:
        '   dsInvoice
        '   fvInvoice
        '**********************************************************

        Dim q As New dsInvoicesTableAdapters.QueriesTableAdapter
        Dim butt As Button = CType(sender, Button)
        Dim l As New LogApp
        Dim logINV As Integer = Integer.Parse(Request.QueryString(0))
        Dim logUSR As String = Membership.GetUser.UserName
        Dim logTXT As String
        Dim logBY As String
        Dim newState As Integer

        If butt.Text = "Cancel" Then
            butt.Text = "Uncancel"
            logTXT = "Invoice Cancel"
            If ModificationRights.RightsHotel Then
                logBY = " by Hotel"
                newState = -3
            Else
                logBY = " by CCI"
                newState = -7
            End If
            butt.OnClientClick = "if (!confirm('Are you sure you want to cancel this invoice?')) return;"
        Else
            butt.Text = "Cancel"
            logTXT = "Invoice UNcancel"
            If ModificationRights.RightsHotel Then
                logBY = " by Hotel"
                newState = 1
            Else
                logBY = " by CCI"
                newState = 6
            End If
            butt.OnClientClick = "if (!confirm('Are you sure you want to uncancel this invoice?')) return;"
        End If

        Try
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnState, LogApp.stateStart, logINV, logTXT & logBY)
            q.SetInvState(newState, logUSR, Today(), logINV)
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnState, LogApp.stateComplete, logINV, logTXT & "ed" & logBY)
        Catch ex As Exception
            logTXT += logBY & " ERROR: " & ExceptionText(ex)
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnState, LogApp.stateError, logINV, logTXT)
            'If ex.Message IsNot Nothing Then popShow("Invoice Update State", ex)
            popShow("Invoice Update State", ex)
        End Try

        dsInvoice.DataBind()
        fvInvoice.DataBind()
    End Sub

    Protected Sub btnNew_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        '**********************************************************
        'Handles:
        '   fvNewDetail.ItemTemplate.btnNew
        'Note:
        '   Why is this not handling Empty.btnNew ????
        '**********************************************************

        fvNewDetail.ChangeMode(FormViewMode.Insert)
    End Sub

    Protected Sub btnNewBill_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        '**********************************************************
        'Handles:
        '   fvNewBill.ItemTemplate.btnNewBill
        'Depends:
        '   gvMix.SelectedRow.Cells(4) (EnterDate)
        '   gvMix.SelectedRow.Cells(5) (ExitDate)
        'Visibility:
        '   pnlPopup
        '   btnSave
        '   gvSuppRates
        '   gvStayRates
        'Value:
        '   dsGetSuppRate.SelectParameters.DetailID
        '   dsGetSuppRate.SelectParameters.Start
        '   dsGetSuppRate.SelectParameters.Finish
        'Binding:
        '   gvSuppRates
        '**********************************************************

        dsGetSuppRate.SelectParameters("DetailID").DefaultValue = gvMix.SelectedDataKey.Value
        dsGetSuppRate.SelectParameters("Start").DefaultValue = Date.Parse(gvMix.SelectedRow.Cells(4).Text)
        dsGetSuppRate.SelectParameters("Finish").DefaultValue = Date.Parse(gvMix.SelectedRow.Cells(5).Text)

        gvSuppRates.Visible = True
        gvSuppRates.DataBind()
        btnSaveIns.Visible = (gvSuppRates.Rows.Count > 0)

        gvStayRates.Visible = False
        btnSave.Visible = False

        pnlPopup.Visible = True
    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click
        '**********************************************************
        'Handles:
        '   pnlDetail.pnlPopup.btnSave
        'Visibility:
        '   pnlPopup
        'Binding:
        '   fvInvoice
        '   gvMix
        '   gvStay
        '   gvBill
        '**********************************************************

        Dim q As New dsInvoicesTableAdapters.QueriesTableAdapter
        Dim l As New LogApp
        Dim logUSR As String = Membership.GetUser.UserName
        Dim invID = Int32.Parse(Request.QueryString(0))
        Dim detID = Int32.Parse(gvMix.SelectedValue)
        Dim detName As String = gvMix.SelectedRow.Cells(1).Text
        Dim logTXT As String = " rate for invoice stay detail " & detID.ToString & "/" & detName & " update"
        Dim logTO As String

        Dim NewRateID As Int32

        If gvStayRates.Visible Then
            NewRateID = Int32.Parse(gvStayRates.SelectedDataKey.Value)
            gvStayRates.Visible = False
            logTXT = "Stay" & logTXT
            logTO = " from " & gvMix.SelectedRow.Cells(18).Text & " to " & NewRateID.ToString & "/" & gvStayRates.SelectedRow.Cells(5).Text
        Else
            NewRateID = Int32.Parse(gvSuppRates.SelectedDataKey.Value)
            gvSuppRates.Visible = False
            logTXT = "Supplement" & logTXT
            logTO = " to " & NewRateID.ToString & "/" & gvSuppRates.SelectedRow.Cells(6).Text
        End If

        Try
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnUpdate, LogApp.stateStart, invID, logTXT & logTO)
            q.InvBillUpdateRate(invID, detID, Int32.Parse(hfBillID.Value), NewRateID)
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnUpdate, LogApp.stateComplete, invID, logTXT & "ed" & logTO)
        Catch ex As Exception
            logTXT += logTO & " ERROR: " & ExceptionText(ex)
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnUpdate, LogApp.stateError, invID, logTXT)
            popShow("Invoice Update", ex)
        End Try

        pnlPopup.Visible = False

        fvInvoice.DataBind()
        gvMix.DataBind()
        gvStay.DataBind()
        gvBill.DataBind()
    End Sub

    Protected Sub btnSaveIns_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSaveIns.Click
        '**********************************************************
        'Handles:
        '   pnlDetail.pnlPopup.btnSaveIns
        'Visibility:
        '   pnlPopup
        '   gvSuppRates
        'Value:
        '   dsBill.InsertParameters.RateID
        'Binding:
        '   fvInvoice
        '   gvMix
        '   gvStay
        '   gvBill
        '**********************************************************

        Dim l As New LogApp
        Dim logUSR As String = Membership.GetUser.UserName
        Dim logINV = Int32.Parse(Request.QueryString(0))
        Dim detID = Int32.Parse(gvMix.SelectedValue)
        Dim detName As String = gvMix.SelectedRow.Cells(1).Text
        Dim suppID = Int32.Parse(gvSuppRates.SelectedDataKey.Value)
        Dim suppName = gvSuppRates.SelectedRow.Cells(6).Text
        Dim logTXT As String = "Supplement rate for invoice stay detail " & detID.ToString & "/" & detName & " added to " & suppID.ToString & "/" & suppName

        dsBill.InsertParameters("RateID").DefaultValue = suppID
        gvSuppRates.Visible = False
        pnlPopup.Visible = False

        Try
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnInset, LogApp.stateStart, logINV, logTXT)
            dsBill.Insert()
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnInset, LogApp.stateComplete, logINV, logTXT)
        Catch ex As Exception
            logTXT += " ERROR: " & ExceptionText(ex)
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnInset, LogApp.stateError, logINV, logTXT)
            popShow("Error Inserting Supplement Rate", ex)
        End Try

        fvInvoice.DataBind()
        gvMix.DataBind()
        gvStay.DataBind()
        gvBill.DataBind()
    End Sub

    Protected Sub btnClose_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClose.Click
        '**********************************************************
        'Handles:
        '   pnlDetail.pnlPopup.btnClose
        'Visibility:
        '   pnlPopup
        '**********************************************************

        pnlPopup.Visible = False
    End Sub

    Protected Sub btRecalc_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        '**********************************************************
        'Handles:
        '   fvInvoice.ItemTemplate.btRecalc
        'Data:
        '   dsInvoicesTableAdapters.QueriesTableAdapter.InvoiceRecalc
        '**********************************************************

        Dim l As New LogApp
        Dim logUSR As String = Membership.GetUser.UserName
        Dim logINV = Int32.Parse(Request.QueryString(0))
        Dim logTXT As String = "Invoice recalculated"

        Dim t As New dsInvoicesTableAdapters.QueriesTableAdapter
        Try
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnUpdate, LogApp.stateStart, logINV, logTXT)
            t.InvoiceRecalc(logINV)
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnUpdate, LogApp.stateComplete, logINV, logTXT)
        Catch ex As Exception
            logTXT += " ERROR: " & ExceptionText(ex)
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnUpdate, LogApp.stateError, logINV, logTXT)
            popShow("Error recalculating invoice", ex)
        End Try
        Response.Redirect("~/Invoices/InvoiceCreate.aspx?InvoiceID=" + Request.QueryString(0))
    End Sub

    Protected Sub dsBill_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsBill.Updated
        '**********************************************************
        'Handles:
        '   dsBill
        'Binding:
        '   gvMix
        '   gvStay
        '   gvBill
        '**********************************************************

        Dim l As New LogApp
        Dim logINV As Integer = Integer.Parse(Request.QueryString(0))
        Dim logUSR As String = Membership.GetUser.UserName
        Dim detID = Int32.Parse(gvMix.SelectedValue)
        Dim detName As String = gvMix.SelectedRow.Cells(1).Text
        Dim detSplit As String = CType(gvBill.Rows(gvBill.EditIndex).FindControl("txtExitDate"), TextBox).Text
        Dim logTXT As String = "Invoice stay detail " & detID.ToString & "/" & detName & " split on " & detSplit

        e.ExceptionHandled = True

        If e.Exception IsNot Nothing Then
            logTXT += " ERROR: " & ExceptionText(e.Exception)
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnUpdate, LogApp.stateError, logINV, logTXT)
            popShow("Error Editing Date", e.Exception)
        Else
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnUpdate, LogApp.stateComplete, logINV, logTXT)
            gvMix.DataBind()
            gvStay.DataBind()
            gvBill.DataBind()
        End If
    End Sub

    Protected Sub dsBill_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsBill.Inserted
        '**********************************************************
        'Handles:
        '   dsBill
        'Binding:
        '   gvMix
        '   gvStay
        '   gvBill
        '**********************************************************

        e.ExceptionHandled = True

        If e.Exception IsNot Nothing Then
            popShow("Error Inserting Date", e.Exception)
        Else
            gvMix.DataBind()
            gvStay.DataBind()
            gvBill.DataBind()
        End If
    End Sub

    Protected Sub dsBill_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsBill.Deleted
        '**********************************************************
        'Handles:
        '   dsBill
        'Binding:
        '   gvMix
        '   fvInvoice
        '   gvStay
        '**********************************************************

        Dim l As New LogApp
        Dim logINV As Integer = Integer.Parse(Request.QueryString(0))
        Dim logUSR As String = Membership.GetUser.UserName
        Dim detID = Int32.Parse(gvMix.SelectedValue)
        Dim detName As String = gvMix.SelectedRow.Cells(1).Text
        Dim supTXT As String = " " & logBillDet
        Dim logTXT As String = "Supplement rate for invoice stay detail " & detID.ToString & "/" & detName & " delete"

        e.ExceptionHandled = True

        If e.Exception IsNot Nothing Then
            logTXT += supTXT & " ERROR: " & ExceptionText(e.Exception)
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnDelete, LogApp.stateError, logINV, logTXT)
            popShow("Error Deleting", e.Exception)
        Else
            logTXT += "d" & supTXT
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnDelete, LogApp.stateComplete, logINV, logTXT)
            gvMix.DataBind()
            fvInvoice.DataBind()
            gvStay.DataBind()
        End If
    End Sub

    Protected Sub gvMix_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvMix.SelectedIndexChanged
        '**********************************************************
        'Handles:
        '   gvMix
        'Binding:
        '   pnlPopup
        '**********************************************************

        pnlPopup.Visible = False
    End Sub

    Protected Sub btStayRecalc_Command(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs)
        '**********************************************************
        'Handles:
        '   gvMix.Row.btStayRecalc (Recalculate)
        'Data:
        '   dsInvoicesTableAdapters.QueriesTableAdapter.InvoiceRecalcStay
        'Binding:
        '   gvMix
        '   gvStay
        '   gvBill
        '**********************************************************

        Dim proc As New dsInvoicesTableAdapters.QueriesTableAdapter
        Dim l As New LogApp
        Dim logUSR As String = Membership.GetUser.UserName
        Dim logINV = Int32.Parse(Request.QueryString(0))
        Dim detID = Int32.Parse(e.CommandArgument)
        Dim detBtn As LinkButton = CType(sender, LinkButton)
        Dim detRow As GridViewRow = CType(detBtn.NamingContainer, GridViewRow)
        Dim detName As String = detRow.Cells(1).Text
        Dim logTXT As String = "Invoice stay detail (" & detID.ToString & ")'" & detName & "' recalculated"

        Try
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnUpdate, LogApp.stateStart, logINV, logTXT)
            proc.InvoiceRecalcStay(logINV, detID)
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnUpdate, LogApp.stateComplete, logINV, logTXT)
            gvMix.DataBind()
            gvStay.DataBind()
            gvBill.DataBind()
        Catch ex As Exception
            logTXT += " ERROR: " & ExceptionText(ex)
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnUpdate, LogApp.stateError, logINV, logTXT)
            popShow("Error Recalculating Stay Detail", ex)
        End Try
    End Sub

    Protected Function AmountText(ByVal amount As Object) As String
        '**********************************************************
        'Used by:
        '   gvMix.Amount
        'Note:
        '   Maybe obsolete!!!
        '**********************************************************

        Dim amstr As String

        If Object.ReferenceEquals(amount, DBNull.Value) Then
            amstr = ""
        Else
            If Object.ReferenceEquals(amount, 0) Then amstr = "NO RATES" Else amstr = amount.ToString
        End If

        Return amstr

    End Function

    Protected Function ExceptionText(ByRef ex As Exception) As String
        Dim result As String
        If ex.InnerException IsNot Nothing Then
            result = ex.InnerException.Message
        Else
            result = ex.Message
        End If

        Return result
    End Function

    Protected Sub btCComment_Click(sender As Object, e As System.EventArgs) Handles btCComment.Click
        If Not String.IsNullOrEmpty(txCComment.Text) Then
            dsInvComment.InsertParameters("Username").DefaultValue = Membership.GetUser.UserName
            dsInvComment.Insert()
            txCComment.Text = ""
        End If
    End Sub

    Protected Sub btCPrint_Click(sender As Object, e As System.EventArgs) Handles btCPrint.Click
        '**********************************************************
        'Handles:
        '   fvInvoice.btCPrint
        'Depends:
        '   fvInvoice.cbExcel
        '**********************************************************

        Dim idINV = Int32.Parse(Request.QueryString("InvoiceID"))

        Dim cbXLS As Boolean = False
        Dim cbHTL As Boolean = cbHotel.Checked
        If fvInvoice.FindControl("cbExcel") IsNot Nothing Then
            cbXLS = CType(fvInvoice.FindControl("cbExcel"), CheckBox).Checked
        End If

        Dim rep As String = "~/Reports/Invoices/InvoiceDetail.aspx?InvoiceID=" + idINV.ToString + "&HotelChecked=" + cbHTL.ToString + "&Comment=True"
        If cbXLS Then rep &= "&Excel=True"
        Response.Redirect(rep)
    End Sub
End Class
