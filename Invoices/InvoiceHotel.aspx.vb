Imports System.Data
Partial Class Invoices_InvoiceHotel
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

        IsHotelView = IsHotelUser
        IsUserInState = (IsHotelUser And IsHotelState) Or (IsCCIUser And IsCCIState)
        CanEdit = (IsHotelUser And IsHotelState) Or (IsCCIUser And IsCCIState And Not IsCCIReviewed And Not IsApplied And Not IsDelivered)
    End Sub

    Protected Sub RefreshData()
        fvInvoiceHead.DataBind()
        fvInvoice.DataBind()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        IsHotelUser = My.User.IsInRole("hotel")
        IsCCIUser = My.User.IsInRole("admin") Or My.User.IsInRole("invoicing") Or My.User.IsInRole("invoicing_admin") Or My.User.IsInRole("operator")
        IsAdmin = My.User.IsInRole("admin") Or My.User.IsInRole("invoicing_admin")

        'dlStay.SelectedIndex = 1
        If IsPostBack Then
            LoadStateVariables()
        Else
            Dim hAdapther As New dsInvoiceFormTableAdapters.InvChHotelTableAdapter
            Dim hTable As dsInvoiceForm.InvChHotelDataTable = hAdapther.GetData(Request.QueryString("InvoiceID"))
            If hTable.Count > 0 Then
                sHotelLabel1.Text = hTable(0).sHotel
                sHotelLabel2.Text = hTable(0).sHotel
                ddlHotels.DataSource = hTable
                ddlHotels.DataTextField = "dHotel"
                ddlHotels.DataValueField = "dHotelID"
                ddlHotels.DataBind()
            Else
                pnlHotels.Visible = False
                pnlEmpty.Visible = True
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

        IsHotelView = IsHotelUser
        IsUserInState = (IsHotelUser And IsHotelState) Or (IsCCIUser And IsCCIState)
        CanEdit = (IsHotelUser And IsHotelState) Or (IsCCIUser And IsCCIState And Not IsCCIReviewed And Not IsApplied And Not IsDelivered)

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

    Protected Sub btnRefersh_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        RefreshData()
    End Sub

    Protected Sub btHotelSet_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        dHotelID.Value = ddlHotels.SelectedValue
        dHotelLabel.Text = ddlHotels.SelectedItem.Text
        pnlHotels.Visible = False
        pnlRooms.Visible = True
    End Sub

    Protected Sub btHotelBack_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        pnlHotels.Visible = True
        pnlRooms.Visible = False
    End Sub

    Protected Sub btHotelFinish_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim s As String = ""
        Dim h As Integer = dHotelID.Value
        Dim sid As Integer = Request.QueryString("InvoiceID")
        Dim uid As String = My.User.Name
        Dim did As Integer

        For Each r As GridViewRow In gvRooms.Rows
            Dim sRoom As HiddenField = r.FindControl("sRoomID")
            Dim dRoom As DropDownList = r.FindControl("ddlSelectRoom")
            If Not String.IsNullOrEmpty(s) Then s &= "|"
            s &= sRoom.Value & "|" & dRoom.SelectedValue
        Next

        'popShow("Params", Nothing, sid & "|" & h & "|" & s & "|" & uid & "|" & did)
        'MsgBox(sid & "|" & h & "|" & s & "|" & uid & "|" & did)
        If Not String.IsNullOrEmpty(s) Then
            Try
                Dim q As New dsInvoiceFormTableAdapters.QueriesTableAdapter
                q.SetTimeout(20000)
                q.InvoiceChangeHotel(sid, h, s, uid, did)
                Response.Redirect("~/Invoices/InvoiceForm.aspx?InvoiceID=" & did.ToString)
            Catch ex As Exception
                'MsgBox(ex.Message)
                popShow("Invoice Change Hotel", ex)
            End Try
        End If
    End Sub

    Protected Sub btHotelCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Response.Redirect("~/Invoices/InvoiceForm.aspx?InvoiceID=" & Request.QueryString("InvoiceID"), True)
    End Sub
End Class
