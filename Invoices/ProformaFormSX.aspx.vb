Imports System.Data

Partial Class Invoices_ProformaFormSX
    Inherits System.Web.UI.Page

    Protected IsHotelUser As Boolean = False           ' User.Role in ("hotel")
    Protected IsCCIUser As Boolean = False             ' User.Role in ("admin", "invoicing", "invoicing_admin", "operator")
    Protected IsAdmin As Boolean = False               ' User.Role in ("admin", "invoicing_admin")
    Protected IsHotelState As Boolean = False          ' Invoice.State in (1,2)
    Protected IsCCIState As Boolean = False            ' Invoice.State in (4,5,6)
    Protected IsCCIReviewed As Boolean = False         ' CCIReviewed = False
    Protected IsApplied As Boolean = False             ' AppliedAmount = 0
    Protected IsAccounted As Boolean = True
    Protected IsDelivered As Boolean = False           ' DeliveryDate is not NULL
    Protected InvState As Integer = -1                 ' Invoice.State
    Protected InvHotelID As Integer = -1               ' Invoice.HotelID
    Protected ChLabel As String() = {"*", "*", "*", "*", "*"}
    Protected ChTTip As String() = {"Not supported by hotel policy.", "Not supported by hotel policy.", "Not supported by hotel policy.", "Not supported by hotel policy.", "Not supported by hotel policy."}
    Protected IsRecalcEnabled As Boolean = False

    Protected IsHotelView As Boolean = False           ' IsHotelUser OR cbHotel.Checked
    Protected IsUserInState As Boolean = False         ' (IsHotelUser AND IsHotelState) OR (IsCCIUser AND IsCCIState)
    Protected CanEdit As Boolean = False

    'Protected t As dsCoopMarketing.InvoiceSumDataTable

    Protected Sub popShow(ByVal Title As String, ByRef ex As Exception, Optional ByVal Message As String = "-")
        If ex IsNot Nothing Then
            Try
                If ex.InnerException IsNot Nothing Then
                    popMessage.Text = ex.InnerException.Message
                Else
                    popMessage.Text = ex.Message
                End If
            Catch e As Exception
                popMessage.Text = ex.ToString
            End Try
        Else
            popMessage.Text = Message
        End If
        popLabel.Text = Title
        popExtender.Show()
    End Sub

    Protected Function ExceptionText(ByRef ex As Exception) As String
        Dim result As String
        If ex.InnerException IsNot Nothing Then
            result = ex.InnerException.Message
        Else
            result = ex.Message
        End If

        Return result
    End Function

    Protected Sub SaveStateVariables()
        ViewState("IsHotelState") = IsHotelState
        ViewState("IsCCIState") = IsCCIState
        ViewState("IsCCIReviewed") = IsCCIReviewed
        ViewState("IsApplied") = IsApplied
        ViewState("IsAccounted") = IsAccounted
        ViewState("IsDelivered") = IsDelivered
        ViewState("InvState") = InvState
        ViewState("InvHotelID") = InvHotelID
        ViewState("ChLabel1") = ChLabel(1)
        ViewState("ChTTip1") = ChTTip(1)
        ViewState("ChLabel2") = ChLabel(2)
        ViewState("ChTTip2") = ChTTip(2)
        ViewState("ChLabel3") = ChLabel(3)
        ViewState("ChTTip3") = ChTTip(3)
        ViewState("ChLabel4") = ChLabel(4)
        ViewState("ChTTip4") = ChTTip(4)
    End Sub

    Protected Sub LoadStateVariables()
        IsHotelState = ViewState("IsHotelState")
        IsCCIState = ViewState("IsCCIState")
        IsCCIReviewed = ViewState("IsCCIReviewed")
        IsApplied = ViewState("IsApplied")
        IsAccounted = ViewState("IsAccounted")
        IsDelivered = ViewState("IsDelivered")
        InvState = ViewState("InvState")
        InvHotelID = ViewState("InvHotelID")
        ChLabel(1) = ViewState("ChLabel1")
        ChTTip(1) = ViewState("ChTTip1")
        ChLabel(2) = ViewState("ChLabel2")
        ChTTip(2) = ViewState("ChTTip2")
        ChLabel(3) = ViewState("ChLabel3")
        ChTTip(3) = ViewState("ChTTip3")
        ChLabel(4) = ViewState("ChLabel4")
        ChTTip(4) = ViewState("ChTTip4")

        IsHotelView = IsHotelUser Or cbHotel.Checked
        IsUserInState = (IsHotelUser And IsHotelState) Or (IsCCIUser And IsCCIState And Not cbHotel.Checked)
        CanEdit = (IsHotelUser And IsHotelState) Or (IsCCIUser And IsCCIState And Not IsCCIReviewed And Not IsApplied And Not IsDelivered And Not cbHotel.Checked)
    End Sub

    Protected Sub RefreshData()
        fvInvoiceHead.DataBind()
        fvInvoice.DataBind()
        dlStay.DataBind()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        IsHotelUser = My.User.IsInRole("hotel")
        IsCCIUser = My.User.IsInRole("admin") Or My.User.IsInRole("invoicing") Or My.User.IsInRole("invoicing_admin") Or My.User.IsInRole("operator")
        IsAdmin = My.User.IsInRole("admin") Or My.User.IsInRole("invoicing_admin")
        cbHotel.Visible = IsCCIUser

        'dlStay.SelectedIndex = 1
        If IsPostBack Then
            LoadStateVariables()
        Else
            Dim q As New dsInvoiceSXTableAdapters.QueriesTableAdapter
            Dim s As Object = q.InvSource(Request.QueryString("InvoiceID"))
            If s Is Nothing Then s = "SX"
            If s <> "SX" Then
                Response.Write("<h3>This is not an SX proforma</h3>")
                Response.Write(String.Format("<h3><a href='ProFormaForm.aspx?InvoiceID={0}'>Go to proforma</a> or go back.</h3>", Request.QueryString("InvoiceID")))
                Response.End()
            End If
        End If
    End Sub

    Protected Sub fvInvoiceHead_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvInvoiceHead.DataBound
        If Request.QueryString("InvoiceID") Is Nothing Then Return
        If fvInvoiceHead.DataKey("HotelId") Is Nothing Then
            UpdatePanelDetail.Visible = False
            Return
        End If

        Dim hf As HiddenField
        If fvInvoiceHead.DataKey("HotelId") IsNot Nothing Then InvHotelID = fvInvoiceHead.DataKey("HotelId")
        With fvInvoiceHead
            hf = CType(.FindControl("hfState"), HiddenField)
            If hf.Value IsNot Nothing Then InvState = hf.Value
            hf = CType(.FindControl("fhCCIReview"), HiddenField)
            If hf.Value IsNot Nothing Then IsCCIReviewed = hf.Value
            hf = CType(.FindControl("fhAppAmount"), HiddenField)
            If Not String.IsNullOrEmpty(hf.Value) Then IsApplied = (hf.Value > 0)
            IsAccounted = Not String.IsNullOrEmpty(hf.Value)
            hf = CType(.FindControl("hfDeliveryDate"), HiddenField)
            IsDelivered = Not String.IsNullOrEmpty(hf.Value)
            IsHotelState = (InvState = 1) Or (InvState = 2)
            IsCCIState = (InvState = 4) Or (InvState = 5) Or (InvState = 6)
        End With

        IsHotelView = IsHotelUser Or cbHotel.Checked
        IsUserInState = (IsHotelUser And IsHotelState) Or (IsCCIUser And IsCCIState And Not cbHotel.Checked)
        CanEdit = (IsHotelUser And IsHotelState) Or (IsCCIUser And IsCCIState And Not IsCCIReviewed And Not IsApplied And Not IsDelivered And Not cbHotel.Checked)

        Dim p As New dsInvoiceFormTableAdapters.HotelPolicyTableAdapter
        Dim t As dsInvoiceForm.HotelPolicyDataTable = p.GetData(InvHotelID)
        Dim r As dsInvoiceForm.HotelPolicyRow

        If t IsNot Nothing Then
            If t.Rows.Count > 0 Then
                r = t.Rows(0)

                'If Not r.IsChld1ShLabelNull Then
                If r.ChldCategories > 0 Then
                    ChLabel(1) = r.Chld1ShLabel
                    ChTTip(1) = r.Chld1Label & ": from " & r.Chld1From & " to less than " & r.Chld1Max
                End If
                'If Not r.IsChld2ShLabelNull Then
                If r.ChldCategories > 1 Then
                    ChLabel(2) = r.Chld2ShLabel
                    ChTTip(2) = r.Chld2Label & ": from " & r.Chld2From & " to less than " & r.Chld2Max
                End If
                'If Not r.IsChld3ShLabelNull Then
                If r.ChldCategories > 2 Then
                    ChLabel(3) = r.Chld3ShLabel
                    ChTTip(3) = r.Chld3Label & ": from " & r.Chld3From & " to less than " & r.Chld3Max
                End If
                'If Not r.IsChld4ShLabelNull Then
                If r.ChldCategories > 3 Then
                    ChLabel(4) = r.Chld4ShLabel
                    ChTTip(4) = r.Chld4Label & ": from " & r.Chld4From & " to less than " & r.Chld4Max
                End If
            End If
        End If

        SaveStateVariables()
    End Sub

    Protected Sub fvInvoice_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvInvoice.DataBinding
        LoadStateVariables()
    End Sub

    'Protected Sub CM_RowCreated(ByVal sender As Object, ByVal e As GridViewRowEventArgs)
    '    Dim ta As New dsCoopMarketingTableAdapters.InvoiceSumTableAdapter
    '    Dim t As dsCoopMarketing.InvoiceSumDataTable = ta.GetData(Request.QueryString("InvoiceID"))
    '    Dim r As Integer = 3    'Amount column index

    '    If e.Row.RowType = DataControlRowType.Header Then
    '        Dim cmAmount As String
    '        If IsHotelView Then cmAmount = t(0).HAmount.ToString("N2") Else cmAmount = t(0).Amount.ToString("N2")
    '        e.Row.Cells(r).Text = cmAmount
    '    ElseIf e.Row.RowType = DataControlRowType.Footer Then
    '        Dim cmTotal As String
    '        If IsHotelView Then cmTotal = (t(0).HAmount + t(0).HRabateSum).ToString("N2") Else cmTotal = (t(0).Amount + t(0).RabateSum).ToString("N2")
    '        e.Row.Cells(r).Text = cmTotal
    '    End If
    'End Sub

    Protected Sub cbHotel_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbHotel.CheckedChanged
        RefreshData()
    End Sub

    Protected Sub dsInvBill_Selecting(ByVal sender As Object, ByVal e As ObjectDataSourceSelectingEventArgs)
        e.InputParameters("HRate") = IsHotelView
    End Sub

    Protected Sub btnRefersh_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        RefreshData()
    End Sub

    '*  CHANGE TOUR OPERATOR
    Protected Sub btnTourOpChange_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim ddlTourOp As DropDownList = fvInvoiceHead.FindControl("ddlTourOpChange")
        Dim invID = Request.QueryString("InvoiceID")
        Dim toID = ddlTourOp.SelectedValue

        Dim q As New dsInvoiceSXTableAdapters.QueriesTableAdapter
        q.InvoiceChangeTourOp(invID, toID, My.User.Name)
        RefreshData()
        'Response.Redirect("InvoiceFormSX.aspx?InvoiceID=" & invID.ToString)
    End Sub

    '*  PRINT
    Protected Sub btnPrint_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        'fvInvoiceHead.Item.btnPrint()
        Dim l As New LogApp
        Dim logUSR As String = Membership.GetUser.UserName
        Dim logINV = Int32.Parse(Request.QueryString("InvoiceID"))
        Dim logTXT As String = "Invoice Printed "
        Dim sepCh As Boolean = CType(fvInvoiceHead.FindControl("cbSeparateCh"), CheckBox).Checked
        Dim excCm As Boolean = Not CType(fvInvoiceHead.FindControl("cbExcludeCM"), CheckBox).Checked

        logTXT &= "(" & IIf(IsHotelView, "HTL", "CCI") & "/PDF)"
        l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnPrint, LogApp.stateComplete, logINV, logTXT)

        Dim rep As String = "~/Reports/Invoices/InvoiceDetail.aspx?InvoiceID=" & logINV.ToString & _
                            "&HotelChecked=" & IsHotelView.ToString & _
                            "&SeparateChildren=" & sepCh.ToString & _
                            "&CM=" & excCm.ToString
        Response.Redirect(rep)
    End Sub

    '*  EXPORT TO EXCEL
    Protected Sub btnExcel_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        'fvInvoiceHead.Item.btnExcel
        Dim l As New LogApp
        Dim logUSR As String = Membership.GetUser.UserName
        Dim logINV = Int32.Parse(Request.QueryString("InvoiceID"))
        Dim logTXT As String = "Invoice Printed "
        Dim sepCh As Boolean = CType(fvInvoiceHead.FindControl("cbSeparateCh"), CheckBox).Checked
        Dim excCm As Boolean = Not CType(fvInvoiceHead.FindControl("cbExcludeCM"), CheckBox).Checked

        logTXT &= "(" & IIf(IsHotelView, "HTL", "CCI") & "/XLS)"
        l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnPrint, LogApp.stateComplete, logINV, logTXT)

        Dim rep As String = "~/Reports/Invoices/InvoiceDetail.aspx?InvoiceID=" & logINV.ToString & _
                            "&HotelChecked=" & IsHotelView.ToString & "&Excel=True" & _
                            "&SeparateChildren=" & sepCh.ToString & "&CM=" & excCm.ToString
        Response.Redirect(rep)
    End Sub

    '*  EXPORT TO XML
    Protected Sub btnXML_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        'fvInvoiceHead.Item.btnXML
        Dim rep As String = "~/Reports/Invoices/BavelInvoiceXML.aspx?InvoiceID=" + Request.QueryString("InvoiceID")
        Response.Redirect(rep)
    End Sub

    '*  SET DELIVERY DATE
    Protected Sub btnDeliv_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        'fvInvoice.Item.btnDeliv
        Dim delTXT As TextBox = fvInvoice.FindControl("txtDelivery")
        If Not String.IsNullOrEmpty(delTXT.Text) Then
            Dim logINV As Integer = Integer.Parse(Request.QueryString("InvoiceID"))
            Dim logUSR As String = My.User.Name
            Dim delDAT As Nullable(Of Date) = Date.Parse(delTXT.Text)

            Dim l As New LogApp
            Dim qa As New dsInvoiceFormTableAdapters.QueriesTableAdapter
            Try
                qa.UpdateDeliveredDate(delDAT, logUSR, Today(), logINV)
                l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnState, LogApp.stateComplete, logINV, "Invoice Delivery date set to " & delDAT.ToString)
                fvInvoiceHead.DataBind()
                fvInvoice.DataBind()
            Catch ex As Exception
                popShow("Set Delivery Date Error", ex)
            End Try
        Else
            popShow("Set Delivery Date Error", Nothing, "Delivery date not set!")
        End If
    End Sub

    '*  RESET DELIVERY DATE
    Protected Sub btnUnDeliv_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        'fvInvoice.Item.btnUnDeliv
        Dim logINV As Integer = Integer.Parse(Request.QueryString("InvoiceID"))
        Dim logUSR As String = My.User.Name

        Dim l As New LogApp
        Dim qa As New dsInvoiceFormTableAdapters.QueriesTableAdapter
        Try
            qa.UpdateDeliveredDate(Nothing, logUSR, Today(), logINV)
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnState, LogApp.stateComplete, logINV, "Invoice Delivery date reseted")
            fvInvoiceHead.DataBind()
            fvInvoice.DataBind()
        Catch ex As Exception
            popShow("Reset Delivery Date Error", ex)
        End Try
    End Sub

    '*  CANCEL
    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim logINV As Integer = Integer.Parse(Request.QueryString("InvoiceID"))
        Dim logUSR As String = My.User.Name
        Dim logTXT As String = "Invoice Cancel"
        Dim logBY As String = " by CCI"             ' Canceled by CCI (default)
        Dim newState As Integer = -7                ' Canceled by CCI (default)

        If IsHotelUser Then
            logBY = " by Hotel"
            newState = -3
        End If

        Dim l As New LogApp
        Dim q As New dsInvoiceFormTableAdapters.QueriesTableAdapter
        Try
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnState, LogApp.stateStart, logINV, logTXT & logBY)
            q.SetInvState(newState, logUSR, Today(), logINV)
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnState, LogApp.stateComplete, logINV, logTXT & "ed" & logBY)
            RefreshData()
        Catch ex As Exception
            logTXT += logBY & " ERROR: " & ExceptionText(ex)
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnState, LogApp.stateError, logINV, logTXT)
            popShow("Invoice Update State", ex)
        End Try
    End Sub

    '*  CHANGE HOTEL
    Protected Sub btnChangeHotel_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("~/Invoices/InvoiceHotel.aspx?InvoiceID=" & Request.QueryString("InvoiceID"), True)
    End Sub

    '*  Reviewed By CCI
    Protected Sub cbRVCci_CheckedChanged(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs)
        'fvInvoice.Item.cbRVCci
        Dim logINV As Integer = Integer.Parse(Request.QueryString("InvoiceID"))
        Dim logUSR As String = My.User.Name
        Dim logCHK As Integer = IIf(e.CommandArgument, 0, 1)
        Dim logTXT As String = "Invoice " & IIf(logCHK = 1, "Reviewed", "UNreviewed") & " by CCI"

        Dim l As New LogApp
        Dim q As New dsInvoiceFormTableAdapters.QueriesTableAdapter
        Try
            q.SetTimeout(6000)
            q.InvoiceReviewed(logINV, logCHK)
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnState, LogApp.stateComplete, logINV, logTXT)
            RefreshData()
        Catch ex As Exception
            logTXT = logTXT & " ERROR: " & ex.Message
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnState, LogApp.stateError, logINV, logTXT)
            popShow("Updating state", ex)
        End Try
    End Sub

    '*  Stay detail SELECT
    Protected Sub dlStay_SelectCommand(ByVal source As Object, ByVal e As EventArgs)
        dlStay.DataBind()
    End Sub

    '*  Add user comment
    Protected Sub Invoice_AddComment(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs)
        'dlStay.Footer.btnAddComment
        Dim txtComment As TextBox = CType(sender, ImageButton).Parent.FindControl("txCComment")
        If Not String.IsNullOrEmpty(txtComment.Text) Then
            dsInvComment.InsertParameters("Username").DefaultValue = My.User.Name
            dsInvComment.InsertParameters("Comment").DefaultValue = txtComment.Text
            dsInvComment.Insert()
            txtComment.Text = ""
            dsInvComment.DataBind()
        End If
    End Sub

    '*  Print invoice with user comment
    Protected Sub Invoice_PrintComments(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs)
        'btnCPrint 
        Dim idINV = Int32.Parse(Request.QueryString("InvoiceID"))
        Dim rep As String = "~/Reports/Invoices/InvoiceDetail.aspx?InvoiceID=" + idINV.ToString + "&HotelChecked=" + cbHotel.Checked.ToString + "&Comment=True"
        Response.Redirect(rep)
    End Sub

    '*  Log grid dropdown detail level setup
    Protected Sub ddlLevel_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim ddlLevel As DropDownList = sender
        If Not IsAdmin Then
            If ddlLevel.Items.Count > 2 Then ddlLevel.Items.RemoveAt(2)
        End If
    End Sub

    '*  Log grid dropdown detail level reload
    Protected Sub ddlLevel_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim ddlLevel As DropDownList = sender
        dsLog.SelectParameters("LogLevel").DefaultValue = ddlLevel.SelectedValue
        dsLog.Select()
    End Sub

    ''*  CM Supplement AddCM
    'Protected Sub AddCM_Command(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs)
    '    Dim pop As AjaxControlToolkit.PopupControlExtender = AjaxControlToolkit.PopupControlExtender.GetProxyForCurrentPopup(Page)
    '    Dim i As Integer = Request.QueryString("InvoiceID")
    '    Dim r As Integer = e.CommandArgument

    '    Dim ta As New dsCoopMarketingTableAdapters.QueriesTableAdapter
    '    ta.InvCMInsert(i, r)
    '    pop.Commit(Nothing)
    '    Response.Redirect(Request.Url.ToString)
    'End Sub

    ''*  CM Supplement DeleteCM
    'Protected Sub DeleteCM_Command(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs)
    '    Dim i As Integer = Request.QueryString("InvoiceID")
    '    Dim s As Integer = e.CommandArgument

    '    Dim ta As New dsCoopMarketingTableAdapters.QueriesTableAdapter
    '    ta.InvCMDelete(i, s)
    '    Response.Redirect(Request.Url.ToString)
    'End Sub

    Protected Sub dsInvStay_ObjectCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceEventArgs) Handles dsInvStayNew.ObjectCreated, dsInvStay.ObjectCreated
        CType(e.ObjectInstance, dsInvoiceFormTableAdapters.InvStayDetailTableAdapter).SetTimeout(2000)
    End Sub

End Class
