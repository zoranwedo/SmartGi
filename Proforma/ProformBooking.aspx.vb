
Partial Class Proforma_ProformBooking
    Inherits System.Web.UI.Page

#Region "Properties"
    'User:
    Private _IsHotel As Boolean
    Public ReadOnly Property IsHotel() As Boolean
        Get
            Return _IsHotel
        End Get
    End Property

    Public _IsAdmin As Boolean
    Public ReadOnly Property IsAdmin() As Boolean
        Get
            Return _IsAdmin
        End Get
    End Property

    'Proforma
    Public _HasBookings As Boolean
    Public ReadOnly Property HasBookings() As Boolean
        Get
            Return _HasBookings
        End Get
    End Property

    Public _AllCancelled As Boolean
    Public ReadOnly Property AllCancelled() As Boolean
        Get
            Return _AllCancelled
        End Get
    End Property

    Private _IsDefinitive As Boolean
    Public ReadOnly Property IsDefinitive() As Boolean
        Get
            Return _IsDefinitive
        End Get
    End Property

    Private _IsCancelled As Boolean
    Public ReadOnly Property IsCancelled() As Boolean
        Get
            Return _IsCancelled
        End Get
    End Property

    Private _IsGroup As Boolean
    Public ReadOnly Property IsGroup() As Boolean
        Get
            Return _IsGroup
        End Get
    End Property

    Private _SourcePMS As String
    Public ReadOnly Property SourcePMS() As String
        Get
            Return _SourcePMS
        End Get
    End Property
    Public ReadOnly Property IsSX() As Boolean
        Get
            Return _SourcePMS = "SX"
        End Get
    End Property


    Public Function GetCheckDates(ByVal chFrom As String, ByVal chTo As String) As String
        Dim b As Integer = 0
        Dim r As String
        If Not String.IsNullOrEmpty(chFrom) Then b = b + 1
        If Not String.IsNullOrEmpty(chTo) Then b = b + 10

        Select Case b
            Case 0 : r = "<i>any</i>"
            Case 1 : r = String.Format("from {0}", chFrom)
            Case 10 : r = String.Format("to {0}", chTo)
            Case 11 : r = String.Format("{0} - {1}", chFrom, chTo)
            Case Else : r = "error"
        End Select

        Return r
    End Function

    Public Function RateTypeNot9(ByVal RateType As Object) As Boolean
        If TypeOf RateType Is System.DBNull Then
            Return True
        Else
            Return RateType <> 9
        End If
    End Function

    Public Function RateType9Empty(ByVal AddOn As Object, ByVal RateCodeID As Object) As Boolean
        If TypeOf AddOn Is System.DBNull Then
            Return False
        ElseIf TypeOf RateCodeID Is System.DBNull Then
            Return AddOn
        End If
    End Function


    Public Function NotComplimentary(ByVal RateCodeID As Object) As Boolean
        If TypeOf RateCodeID Is System.DBNull Then
            Return False
            'Return True
        Else
            Return RateCodeID <> "COMPLIMENTARY"
        End If
    End Function

    Public Function NotNoRate(ByVal RateCodeID As Object) As Boolean
        If TypeOf RateCodeID Is System.DBNull Then
            Return False
        Else
            Return RateCodeID <> "NO-RATE"
        End If
    End Function

    Public Function BookingState(ByVal InHouseState As Object) As String
        If TypeOf InHouseState Is System.DBNull Then
            Return "Not Defined"
        Else
            Select Case InHouseState
                Case -2 : Return "Cancelled"
                Case -1 : Return "No-show"
                Case 0 : Return "Active"
                Case 1 : Return "Check-in"
                Case 2 : Return "Check-out"
                Case Else : Return "Unknown"
            End Select
        End If
    End Function

    Public Function BookingStateIcon(ByVal InHouseState As Object) As String
        If TypeOf InHouseState Is System.DBNull Then
            Return "~/Images/Unknown.png"
        Else
            Select Case InHouseState
                Case -2 : Return "~/Images/cancel.png"
                Case -1 : Return "~/Images/no-show.png"
                Case 0 : Return "~/Images/active.png"
                Case 1 : Return "~/Images/check_in.png"
                Case 2 : Return "~/Images/check_out.png"
                Case Else : Return "~/Images/Unknown.png"
            End Select
        End If
    End Function

    Public Function AmountShow(ByVal InHouseState As Object, ByVal Penalty As Object) As Boolean
        If TypeOf InHouseState Is System.DBNull Then
            Return True
        Else
            Select Case InHouseState
                Case -2 : Return CType(Penalty, Boolean)
                Case Else : Return True
            End Select
        End If
    End Function

    Public Function PenaltyColor(ByVal Penalty As Object) As Drawing.Color
        If Penalty Then Return Drawing.Color.Red Else Return Nothing
    End Function

    Public Function ShowSplitPopupText() As String
        Dim bId As Integer = Request.QueryString("BookingID")
        Dim r As String = String.Format("ProFormStaySplit.aspx?BookingID={0}", bId)
        Return r
    End Function

    Public Function RateCodeText(ByVal RateCodeID As String)
        If IsSX Then
            Return RateCodeID
        ElseIf RateCodeID.EndsWith("*") Then
            Return RateCodeID
        Else
            Return RateCodeID & "*"
        End If
    End Function

    Public Function CanEditRate(ByVal RateType As Object) As Boolean
        Return Not (_IsGroup Or _IsCancelled Or _IsDefinitive) And RateTypeNot9(RateType) 'And _SourcePMS = "SH"
    End Function

    Public Sub RefreshData()
        fvBooking.DataBind()
        dlBooking.DataBind()
        'System.Threading.Thread.Sleep(5000)
    End Sub
#End Region

#Region "Event Handlers"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        _IsAdmin = My.User.IsInRole("admin") Or My.User.IsInRole("invoicing_admin")
        _IsHotel = My.User.IsInRole("hotel")

        Dim id As Integer = Request.QueryString("ProformaID")

        Dim ta As New dsProformaTableAdapters.InvDocumentStatTableAdapter
        Dim t As dsProforma.InvDocumentStatDataTable = ta.GetDataByID(id)

        If t.Count > 0 Then
            _HasBookings = True
            _AllCancelled = (t(0).Canceled = t(0).Bookings)
            _IsDefinitive = (t(0).InvDocState = 10)
            _IsCancelled = (t(0).InvDocState = -1)
            _IsGroup = (t(0).ProformaType = "G")
            _SourcePMS = t(0).ProformaSource
        Else
            _HasBookings = False
            _AllCancelled = True
            _IsDefinitive = False
            _IsCancelled = False
            _IsGroup = False
            _SourcePMS = "SH"
        End If
    End Sub

    'Booking edit
    Protected Sub fvBooking_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles fvBooking.ItemCommand
        Try
            If e.CommandName = "BkUpdate" Then
                Dim pUser As String = My.User.Name
                Dim pInvDocID As Integer = Request.QueryString("ProformaID")
                Dim pBookingID As Integer = e.CommandArgument
                Dim pBkDate As Object = Nothing
                Dim pBkNumber As String = CType(fvBooking.FindControl("txtBkNumber"), TextBox).Text
                Dim pCheckIn As Date = Date.Parse(CType(fvBooking.FindControl("txtCheckIn"), TextBox).Text)
                Dim pCheckOut As Date = Date.Parse(CType(fvBooking.FindControl("txtCheckOut"), TextBox).Text)
                Dim pRoomTypeId As String = CType(fvBooking.FindControl("ddlRoomTypeID"), DropDownList).SelectedValue
                Dim pGuestName As String = CType(fvBooking.FindControl("txtGuestName"), TextBox).Text
                Dim pAdult As Integer = Integer.Parse(CType(fvBooking.FindControl("txtAdult"), TextBox).Text)
                Dim pInfant As Integer = Integer.Parse(CType(fvBooking.FindControl("txtInfant"), TextBox).Text)
                Dim pChild As Integer = Integer.Parse(CType(fvBooking.FindControl("txtChild"), TextBox).Text)
                Dim pJunior As Integer = Integer.Parse(CType(fvBooking.FindControl("txtJunior"), TextBox).Text)
                Dim pJunior2 As Integer = Integer.Parse(CType(fvBooking.FindControl("txtJunior2"), TextBox).Text)
                Dim pCompAdult As Integer = Integer.Parse(CType(fvBooking.FindControl("txtCompAdult"), TextBox).Text)
                Dim pCompChild As Integer = Integer.Parse(CType(fvBooking.FindControl("txtCompChild"), TextBox).Text)
                Dim pCompJunior As Integer = Integer.Parse(CType(fvBooking.FindControl("txtCompJunior"), TextBox).Text)

                Dim tBkDate As TextBox = fvBooking.FindControl("txtBkDate")
                If Not String.IsNullOrEmpty(tBkDate.Text) Then pBkDate = Date.Parse(tBkDate.Text)

                Dim q As New dsProformaTableAdapters.InvDocItemsTableAdapter
                q.PreinvoiceUpdate(pUser, pInvDocID, pBookingID, pBkDate, pBkNumber, pCheckIn, pCheckOut, pRoomTypeId, pGuestName, pAdult, pInfant, pChild, pJunior, pJunior2, pCompAdult, pCompChild, pCompJunior)
                RefreshData()
                fvBooking.ChangeMode(FormViewMode.ReadOnly)
            End If
        Catch ex As Exception
            msgPop.Title = "Booking Update"
            msgPop.ShowError(ex)
        End Try
    End Sub

    Protected Sub dumyRefresh_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles dumyRefresh.Click
        RefreshData()
    End Sub
#End Region

#Region "Penalty"
    'fvPenalty
    'Penalty state
    Public Function PenaltyStateIcon(ByVal bPenalty As Boolean) As String
        If bPenalty Then
            Return "~/Images/cbChecked.png"
        Else
            Return "~/Images/cbUnchecked.png"
        End If
    End Function

    Public Function PenaltyChangeText(ByVal bPenalty As Boolean) As String
        If (IsDefinitive Or IsCancelled Or IsSX) Then Return String.Empty

        Dim c As String = "return confirm('Are you sure you want to {0} penalty?')"
        If bPenalty Then
            Return String.Format(c, "remove")
        Else
            Return String.Format(c, "set")
        End If
    End Function

    Protected Sub lbPenalty_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim param As String() = CType(sender, LinkButton).CommandArgument.Split(";")
        btnPenalty_Click(param)
    End Sub

    Protected Sub ibPenalty_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim param As String() = CType(sender, ImageButton).CommandArgument.Split(";")
        btnPenalty_Click(param)
    End Sub

    Protected Sub btnPenalty_Click(ByVal param As String())
        Try
            Dim iID As Integer = Request.QueryString("ProformaID")
            Dim bID As Integer = param(0)
            Dim bPen As Boolean = param(1)
            Dim q As New dsProformaTableAdapters.InvDocItemsTableAdapter
            q.PenaltySet(My.User.Name, iID, bID, Not bPen)

            CType(fvBooking.FindControl("fvPenalty"), FormView).DataBind()
            dlBooking.DataBind()
        Catch ex As Exception
            msgPop.ShowError(ex)
        End Try
    End Sub

    'Penalty text
    Protected Sub fvPenalty_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs)
        Try
            If e.CommandName = "PenUpdate" Then
                Dim fvPen As FormView = sender
                Dim txPen As String = CType(fvPen.FindControl("txtPenaltyConcept"), TextBox).Text
                Dim bID As Integer = e.CommandArgument
                Dim q As New dsProformaTableAdapters.InvDocItemsTableAdapter

                If String.IsNullOrEmpty(txPen) Then
                    q.PenaltyConceptSet(Nothing, bID)
                Else
                    q.PenaltyConceptSet(txPen, bID)
                End If
                fvPen.ChangeMode(FormViewMode.ReadOnly)
            End If
        Catch ex As Exception
            msgPop.ShowError(ex)
        End Try
    End Sub
#End Region

#Region "Supplement"
    Public Function ShowSuppLink() As Boolean
        'BookingID,InHouseState,Penalty,InvResID
        If fvBooking.SelectedValue IsNot Nothing Then
            Dim InHouseState As Integer = fvBooking.DataKey(1)
            Dim Penalty As Boolean = fvBooking.DataKey(2)

            If InHouseState = -2 Then
                Return Penalty
            Else
                Return True
            End If
        Else
            Return False
        End If
    End Function

    Public Function ShowSuppPopupText(ByVal bAll As Boolean) As String
        Dim pId As Integer = Request.QueryString("ProformaID")
        Dim bId As Integer = Request.QueryString("BookingID")
        Dim r As String = String.Format("ProFormPGrid.aspx?InvoiceID={0}&DetailID={1}&All={2}", pId, bId, bAll)
        Return r
    End Function

    'Remove supplement
    Protected Sub dlBooking_DeleteCommand(ByVal sender As Object, ByVal e As DataListCommandEventArgs) Handles dlBooking.DeleteCommand
        Try
            Dim iID As Integer = Request.QueryString("ProformaID")
            Dim bID As Integer = dlBooking.DataKeys(0)
            Dim rID As Integer = e.CommandArgument

            Dim q As New dsProformaTableAdapters.InvDocDetailTableAdapter
            q.SupplementDelete(My.User.Name, iID, bID, rID)
            RefreshData()
        Catch ex As Exception
            msgPop.ShowError(ex)
        End Try
    End Sub

#End Region

#Region "Edit Charge Item"
    'Edit
    Protected Sub dlBooking_EditCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles dlBooking.EditCommand
        dlBooking.EditItemIndex = e.Item.ItemIndex
        dlBookingEdit.Value = "Rate"
        If e.CommandArgument = 0 Then dlBookingEdit.Value = "Nights"
        dlBooking.DataBind()
    End Sub

    'Cancel
    Protected Sub dlBooking_CancelCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles dlBooking.CancelCommand
        dlBooking.EditItemIndex = -1
        dlBookingEdit.Value = ""
        dlBooking.DataBind()
    End Sub

#Region "Charging Nights"
    'Populate dropdown
    Protected Sub ddlChgNts_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim ddlChgNts As DropDownList = sender
        Dim ddi As DataListItem = ddlChgNts.Parent
        Dim txtNts As Label = ddi.FindControl("TravelNightsLabel")
        Dim m As Integer = txtNts.Text
        For i As Integer = 1 To m
            ddlChgNts.Items.Add(i.ToString)
        Next
    End Sub

    'Update
    Protected Sub ddlChgNts_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Try
            Dim ddlChgNts As DropDownList = sender
            Dim hfResID As HiddenField = dlBooking.Items(dlBooking.EditItemIndex).FindControl("hfResID")

            Dim iChgNts As Integer = ddlChgNts.SelectedValue
            Dim iID As Integer = Request.QueryString("ProformaID")
            Dim bID As Integer = dlBooking.DataKeys(0)
            Dim rID As Integer = hfResID.Value

            Dim q As New dsProformaTableAdapters.InvDocDetailTableAdapter
            q.ChgNightsSet(My.User.Name, iID, bID, rID, iChgNts)

            dlBooking.EditItemIndex = -1
            dlBookingEdit.Value = ""
            RefreshData()
        Catch ex As Exception
            msgPop.ShowError(ex)
        End Try
    End Sub
#End Region

#Region "Amount Edit"
    Protected Sub dlBooking_UpdateCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles dlBooking.UpdateCommand
        Try
            Dim hfResID As HiddenField = dlBooking.Items(dlBooking.EditItemIndex).FindControl("hfResID")
            Dim txtStayRate As TextBox = dlBooking.Items(dlBooking.EditItemIndex).FindControl("txtStayRate")
            Dim txtBillAmount As TextBox = dlBooking.Items(dlBooking.EditItemIndex).FindControl("txtBillAmount")

            Dim iID As Integer = Request.QueryString("ProformaID")
            Dim bID As Integer = dlBooking.DataKeys(0)
            Dim rID As Integer = hfResID.Value
            Dim newRateCode As String = txtStayRate.Text
            Dim newAmount As Decimal = Decimal.Parse(txtBillAmount.Text)

            Dim q As New dsProformaTableAdapters.InvDocDetailTableAdapter
            q.AmountSHSet(My.User.Name, iID, bID, rID, newRateCode, newAmount)

            dlBooking.EditItemIndex = -1
            dlBookingEdit.Value = ""
            RefreshData()
        Catch ex As Exception
            msgPop.ShowError(ex)
        End Try
    End Sub
#End Region

#End Region

End Class
