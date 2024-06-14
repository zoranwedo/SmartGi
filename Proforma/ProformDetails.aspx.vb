Imports App_UserControls_MessagePop
Imports App_UserControls_InputDateControl

Partial Class Proforma_ProformDetails
    Inherits System.Web.UI.Page

    'Update RefreshProforma so No-Show reservations are penalized by default!!!
    '                       to remove Penalize from reactivated reservations!!!

#Region "Properties"
    Public Const EditWarning As String = _
        "return confirm('" & _
        "Changing Booking date, Check In and Check Out date or Room Type \nwill completelly recalculate booking with default rate.\n" & _
        "Are you sure you want to update booking data?')"

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
            Dim hf As HiddenField = fvInvoiceHead.FindControl("hfInvDocState")
            _IsDefinitive = hf.Value = 10
            Return _IsDefinitive
        End Get
    End Property

    Private _IsCancelled As Boolean
    Public ReadOnly Property IsCancelled() As Boolean
        Get
            Dim hf As HiddenField = fvInvoiceHead.FindControl("hfInvDocState")
            _IsCancelled = hf.Value = -1
            Return _IsCancelled
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

    Public Function ShowChargeModalText() As String
        Return "{" & String.Format(" ShowChargeModal({0}); return false;", Request.QueryString("ProformaID")) & "}"
    End Function

    Public Function ShowBookingModalText(ByVal BookingID As Integer) As String
        Dim InvDocID As Integer = Request.QueryString("ProformaID")
        Return "{" & String.Format(" ShowBookingModal({0},{1}); return false;", InvDocID, BookingID) & "}"
    End Function

    Public Function SourceText(ByVal source As Integer)
        If source = 3 Then
            Return "SX"
        Else
            Return "SH"
        End If
    End Function

    Public Function CanReview(ByVal status As Integer) As Boolean
        Select Case status
            Case -1, 3, 5, 10
                Return False
            Case Else
                Return True
        End Select
    End Function

    Public Function CanUnreview(ByVal status As Integer) As Boolean
        Select Case status
            Case 3
                Return True
            Case Else
                Return False
        End Select
    End Function

    Public Function CanDeliver(ByVal status As Integer) As Boolean
        Select Case status
            Case 3
                Return True
            Case Else
                Return False
        End Select
    End Function

    Public Function CanUndeliver(ByVal status As Integer) As Boolean
        Select Case status
            Case 5
                Return True
            Case Else
                Return False
        End Select
    End Function
#End Region

#Region "Event Handlers"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        _IsAdmin = My.User.IsInRole("admin") Or My.User.IsInRole("invoicing_admin")
        _IsHotel = My.User.IsInRole("hotel")
    End Sub

    Protected Sub refreshBooking_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles refreshBooking.Click
        'System.Threading.Thread.Sleep(5000)
        rptProforma.DataBind()
        fvInvoiceHead.DataBind()
        upHeader.Update()
    End Sub

    Protected Sub btnCloseHotel_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim lbox As ListBox = fvInvoiceHead.FindControl("lbHotel")
        Dim listHotels As CheckBoxList = fvInvoiceHead.FindControl("listHotels")

        lbox.Items.Clear()
        For Each c As ListItem In listHotels.Items
            If c.Selected Then lbox.Items.Add(c.Text)
        Next
        If lbox.Items.Count > 1 Then lbox.Rows = lbox.Items.Count Else lbox.Rows = 2
    End Sub

    Protected Sub dsProforma_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles dsProforma.DataBinding
        Dim id As Integer = Request.QueryString("ProformaID")

        Dim ta As New dsProformaTableAdapters.InvDocumentStatTableAdapter
        Dim t As dsProforma.InvDocumentStatDataTable = ta.GetDataByID(id)

        If t.Count > 0 Then
            _HasBookings = True
            _AllCancelled = (t(0).Canceled = t(0).Bookings)
            _IsDefinitive = (t(0).InvDocState = 2)
            _IsCancelled = (t(0).InvDocState = -1)
        Else
            _HasBookings = False
            _AllCancelled = True
            _IsDefinitive = False
            _IsCancelled = False
        End If
    End Sub

    'Header FormView commands
    '*  Definitive 
    '*  Not Definitive 
    '*  Delete
    '*  Refresh
    '*  Update
    Protected Sub fvInvoiceHead_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles fvInvoiceHead.ItemCommand
        Dim strTitle As String = "Message Title"
        Try
            Dim iID As Integer = Request.QueryString("ProformaID")
            If e.CommandName = "SetDefinitive" Then
                strTitle = "Definitive"
                Dim q As New dsProformaTableAdapters.InvDocumentTableAdapter
                q.DefinitiveSet(My.User.Name, iID)
                fvInvoiceHead.DataBind()
                rptProforma.DataBind()
            ElseIf e.CommandName = "ResetDefinitive" Then
                strTitle = "Definitive"
                Dim q As New dsProformaTableAdapters.InvDocumentTableAdapter
                q.DefinitiveClear(My.User.Name, iID)
                fvInvoiceHead.DataBind()
                rptProforma.DataBind()
            ElseIf e.CommandName = "cRefresh" Then
                strTitle = "Refresh"
                Preinvoicing.Proforma.Refresh(iID)
                Response.Redirect(HttpContext.Current.Request.Url.ToString(), True)
            ElseIf e.CommandName = "cDelete" Then
                strTitle = "Delete"
                Dim group As Boolean = e.CommandArgument
                Preinvoicing.Proforma.Delete(iID)
                Response.Redirect("Proformas.aspx")
            ElseIf e.CommandName = "cUpdate" Then
                strTitle = "Update"
                Dim group As Boolean = e.CommandArgument
                If group Then
                    ProformaUpdateGroup(iID)
                Else
                    ProformaUpdateSingle(iID)
                End If
                rptProforma.DataBind()
            End If
        Catch ex As Exception
            msgPopHead.Title = strTitle
            msgPopHead.ShowError(ex)
        End Try
    End Sub

    Protected Sub rptProforma_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles rptProforma.DataBinding
        Dim id As Integer = Request.QueryString("ProformaID")
        Dim ta As New dsProformaTableAdapters.InvDocumentStatTableAdapter
        Dim t As dsProforma.InvDocumentStatDataTable = ta.GetDataByID(id)

        hdProformaAmount.Value = String.Empty
        If t.Count > 0 Then
            If Not t(0).IsAmountNull Then hdProformaAmount.Value = t(0).Amount.ToString("N2")
        End If
    End Sub

    Protected Sub listHotels_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim id As Integer = Request.QueryString("ProformaID")

        Dim lbHotel As ListBox = fvInvoiceHead.FindControl("lbHotel")
        If lbHotel IsNot Nothing Then
            PopulateHotelsListBox(lbHotel, id)
            If lbHotel.Items.Count > 1 Then lbHotel.Rows = lbHotel.Items.Count Else lbHotel.Rows = 2

            Dim listHotels As CheckBoxList = fvInvoiceHead.FindControl("listHotels")
            If listHotels IsNot Nothing Then PopulateHotelsCheckBoxList(listHotels, id)
        End If
    End Sub

    Protected Sub lbPayments_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbPayments.Click
        Response.Redirect("ProformDetailPayments.aspx?ProformaID=" & Request.QueryString("ProformaID"))
    End Sub

    Protected Sub lbLog_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbLog.Click
        Response.Redirect("ProformDetailLog.aspx?ProformaID=" & Request.QueryString("ProformaID"))
    End Sub

    Protected Sub reviewOK_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim proformaID As Integer = Request.QueryString("ProformaID")
        Dim userName As String = My.User.Name
        Dim ctrlDate As App_UserControls_InputDateControl = fvInvoiceHead.FindControl("reviewDiv").FindControl("ctrlReviewDate")
        Dim reviewDate As Date = ctrlDate.DateValue

        Try
            Dim q As New dsProformaTableAdapters.InvDocumentTableAdapter
            q.ReviewSet(userName, proformaID, reviewDate)
            upHeader.Update()
            fvInvoiceHead.DataBind()
        Catch ex As Exception
            msgPopHead.Title = "Review"
            msgPopHead.ShowError(ex)
        End Try
    End Sub

    Protected Sub deliverOK_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim proformaID As Integer = Request.QueryString("ProformaID")
        Dim userName As String = My.User.Name
        Dim ctrlDate As App_UserControls_InputDateControl = CType(fvInvoiceHead.FindControl("deliverDiv").FindControl("ctrlDeliverDate"), App_UserControls_InputDateControl)
        Dim deliverDate As Date = ctrlDate.DateValue

        Try
            Dim q As New dsProformaTableAdapters.InvDocumentTableAdapter
            q.DeliverySet(userName, proformaID, deliverDate)
            upHeader.Update()
            fvInvoiceHead.DataBind()
        Catch ex As Exception
            msgPopHead.Title = "Delivery"
            msgPopHead.ShowError(ex)
        End Try
    End Sub

    Protected Sub btUnreview_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim proformaID As Integer = Request.QueryString("ProformaID")
        Dim userName As String = My.User.Name

        Dim q As New dsProformaTableAdapters.InvDocumentTableAdapter
        q.ReviewClear(userName, proformaID)
        upHeader.Update()
        fvInvoiceHead.DataBind()
    End Sub

    Protected Sub btUndelver_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim proformaID As Integer = Request.QueryString("ProformaID")
        Dim userName As String = My.User.Name

        Dim q As New dsProformaTableAdapters.InvDocumentTableAdapter
        q.DeliveryClear(userName, proformaID)
        upHeader.Update()
        fvInvoiceHead.DataBind()
    End Sub
#End Region

#Region "Helpers"
    Public Sub PopulateHotelsCheckBoxList(ByVal listHotels As CheckBoxList, ByVal id As Integer)
        Dim ta As New dsProformaTableAdapters.HotelTableAdapter
        Dim t As dsProforma.HotelDataTable = ta.GetDataByID(id)

        listHotels.Items.Clear()
        For Each h As dsProforma.HotelRow In t.Rows
            Dim c As New ListItem(h.Hotel, h.HotelID)
            c.Selected = h.Checked
            listHotels.Items.Add(c)
        Next
    End Sub

    Public Sub PopulateHotelsListBox(ByVal listHotels As ListBox, ByVal id As Integer)
        Dim ta As New dsProformaTableAdapters.InvDocumentHotelTableAdapter
        Dim t As dsProforma.InvDocumentHotelDataTable = ta.GetDataByID(id)

        listHotels.Items.Clear()
        For Each h As dsProforma.InvDocumentHotelRow In t.Rows
            Dim c As New ListItem(h.Hotel, h.HotelID)
            listHotels.Items.Add(c)
        Next
    End Sub

    'Proforma edit
    Protected Sub ProformaUpdateGroup(ByVal docID As Integer)
        'Dim docID As Integer = Request.QueryString("ProformaID")
        Dim _proforma As Preinvoicing.Proforma
        Try
            Dim operatorID As Integer = CType(fvInvoiceHead.FindControl("ddlTO"), DropDownList).SelectedValue
            Dim ckinFrom As String = CType(fvInvoiceHead.FindControl("txtCheckInFrom"), TextBox).Text
            Dim ckinTo As String = CType(fvInvoiceHead.FindControl("txtCheckInTo"), TextBox).Text
            Dim ckoutFrom As String = CType(fvInvoiceHead.FindControl("txtCheckOutFrom"), TextBox).Text
            Dim ckoutTo As String = CType(fvInvoiceHead.FindControl("txtCheckOutTo"), TextBox).Text
            Dim htl As List(Of Integer) = Hotels()
            Dim incCancel As Boolean = CType(fvInvoiceHead.FindControl("cbCancelled"), CheckBox).Checked
            _proforma = New Preinvoicing.Proforma(docID, operatorID, ckinFrom, ckinTo, ckoutFrom, ckoutTo, htl, incCancel)
            _proforma.InvDocComment = CType(fvInvoiceHead.FindControl("txtComment"), TextBox).Text
            _proforma.Update()
            fvInvoiceHead.ChangeMode(FormViewMode.ReadOnly)
        Catch ex As Exception
            msgPopHead.Title = "Proforma Update"
            msgPopHead.ShowError(ex)
        End Try
    End Sub

    Protected Function Hotels() As List(Of Integer)
        Dim hList As New List(Of Integer)
        Dim listHotels As CheckBoxList = fvInvoiceHead.FindControl("listHotels")
        For Each h As ListItem In listHotels.Items
            If h.Selected Then hList.Add(h.Value)
        Next

        Return hList
    End Function

    Protected Sub ProformaUpdateSingle(ByVal docID As Integer)
        Dim _proforma As Preinvoicing.ProformaSingle
        Try
            Dim ckoutFrom As String = CType(fvInvoiceHead.FindControl("txtCheckOutFrom"), TextBox).Text
            Dim ckoutTo As String = CType(fvInvoiceHead.FindControl("txtCheckOutTo"), TextBox).Text
            Dim incCancel As Boolean = CType(fvInvoiceHead.FindControl("cbCancelled"), CheckBox).Checked
            _proforma = New Preinvoicing.ProformaSingle(docID, ckoutFrom, ckoutTo, incCancel)
            Dim pfDate As String = CType(fvInvoiceHead.FindControl("txtProformaDate"), TextBox).Text
            Dim pfComment As String = CType(fvInvoiceHead.FindControl("txtComment"), TextBox).Text

            If Not String.IsNullOrEmpty(pfDate) Then _proforma.InvDocDate = Date.Parse(pfDate)
            _proforma.InvDocComment = CType(fvInvoiceHead.FindControl("txtComment"), TextBox).Text
            _proforma.Update()
            fvInvoiceHead.ChangeMode(FormViewMode.ReadOnly)
        Catch ex As Exception
            msgPopHead.ShowError(ex)
        End Try
    End Sub
#End Region

#Region "Printing"
    Public Function ShowPrintModalText(ByVal group As Boolean) As String
        Dim iID As Integer = Request.QueryString("ProformaID")
        Dim h As Integer = 0

        Dim r As String = "ShowPrintModal{0}({1},{2}); return false;"
        If group Then
            r = String.Format(r, "Group", iID, h)
        Else
            r = String.Format(r, "Single", iID, h)
        End If
        Return "{ " & r & " }"
    End Function

#End Region
End Class
