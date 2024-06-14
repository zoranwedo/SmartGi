
Partial Class Proforma_ProForm1
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
            _IsDefinitive = hf.Value = 2
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

    Public Function RateTypeNot9(ByVal RateType As Object) As Boolean
        If TypeOf RateType Is System.DBNull Then
            Return True
        Else
            Return RateType <> 9
        End If
    End Function

    Public Function NotComplimentary(ByVal RateCodeID As Object) As Boolean
        If TypeOf RateCodeID Is System.DBNull Then
            Return False
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

    Public Function ShowChargeModalText() As String
        Return "{" & String.Format(" ShowChargeModal({0}); return false;", Request.QueryString("ProformaID")) & "}"
    End Function

    Public Function ShowSplitModalText() As String
        Return "{" & String.Format(" ShowSplitModal({0}); return false;", hdBookingID.Value) & "}"
        'Return String.Format("ShowSplitModal({0});", hdBookingID.Value)
    End Function
#End Region

    Protected Function DisplayTag(ByVal b As Boolean) As String
        Return IIf(b, "inherit", "none")
    End Function

    Protected Sub popShow(ByVal Title As String, ByRef ex As Exception, Optional ByVal Message As String = "-")
        If ex IsNot Nothing Then
            Try
                If ex.InnerException IsNot Nothing Then
                    popMessage.Text = ex.Message & "<br />" & _
                                      ex.InnerException.Message
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

    Public Sub RefreshData()
        rptProforma.DataBind()
        fvBooking.DataBind()
        dlBooking.DataBind()
        RefreshLog()
    End Sub

    Public Sub RefreshLog()
        Dim id As Integer = Request.QueryString("ProformaID")
        Dim aLog As New dsProformaTableAdapters.LogTableTableAdapter
        'Dim tLog As dsProforma.LogTableDataTable
        Select Case dlLog.SelectedValue
            Case 1
                If dlProformaLog.SelectedValue = 1 Then
                    rptLog.DataSource = aLog.GetDataFull(id)
                Else
                    rptLog.DataSource = aLog.GetDataProforma(id)
                End If
            Case 2
                Dim bID As Integer = dlBookingLog.SelectedValue
                rptLog.DataSource = aLog.GetDataBooking(id, bID)
            Case 3
                Dim fID As String = dlReservationLog.SelectedValue
                rptLog.DataSource = aLog.GetDataFolio(fID)
        End Select
        rptLog.DataBind()
    End Sub

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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        _IsAdmin = My.User.IsInRole("admin") Or My.User.IsInRole("invoicing_admin")
        _IsHotel = My.User.IsInRole("hotel")

        cbHotel.Visible = False
        If Not IsPostBack Then
            RefreshLog()
            'If My.User.IsInRole("hotel") Then
            '    cbHotel.Checked = True
            '    cbHotel.Visible = False
            'End If
        End If
    End Sub

    Protected Sub dumyRefresh_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        RefreshData()
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
                If dlBooking.EditItemIndex > -1 Then dlBooking.EditItemIndex = -1
                RefreshData()
                If fvBooking.CurrentMode = FormViewMode.Edit Then fvBooking.ChangeMode(FormViewMode.ReadOnly)
            ElseIf e.CommandName = "ResetDefinitive" Then
                strTitle = "Definitive"
                Dim q As New dsProformaTableAdapters.InvDocumentTableAdapter
                q.DefinitiveClear(My.User.Name, iID)
                fvInvoiceHead.DataBind()
                RefreshData()
            ElseIf e.CommandName = "cRefresh" Then
                strTitle = "Refresh"
                Preinvoicing.Proforma.Refresh(iID)
                RefreshData()
            ElseIf e.CommandName = "cDelete" Then
                strTitle = "Delete"
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
                RefreshData()
            End If
        Catch ex As Exception
            popShow(strTitle, ex)
        End Try
    End Sub

    Protected Sub rptProforma_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles rptProforma.DataBinding
        Dim id As Integer = Request.QueryString("ProformaID")

        Dim ta As New dsProformaTableAdapters.InvDocumentStatTableAdapter
        Dim t As dsProforma.InvDocumentStatDataTable = ta.GetDataByID(id)

        hdProformaAmount.Value = String.Empty
        If t.Count > 0 Then
            If cbHotel.Checked Then
                If Not t(0).IsHAmountNull Then hdProformaAmount.Value = t(0).HAmount.ToString("N2")
            Else
                If Not t(0).IsAmountNull Then hdProformaAmount.Value = t(0).Amount.ToString("N2")
            End If
        End If
    End Sub

    Protected Sub rptProforma_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.RepeaterCommandEventArgs) Handles rptProforma.ItemCommand
        If e.CommandName = "Select" Then
            hdBookingID.Value = e.CommandArgument
            Session("SelectedBookingID") = e.CommandArgument
            fvBooking.DataBind()
            dlBooking.DataBind()
            tpInvResDetail.Visible = True
            tpInvResDetail.HeaderText = fvBooking.DataKey.Value
            tabProforma.ActiveTabIndex = 1
            dlBooking.EditItemIndex = -1
            dlBooking.DataBind()
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

    Protected Sub cbHotel_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbHotel.CheckedChanged
        RefreshData()
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
            _proforma.Update()
            fvInvoiceHead.ChangeMode(FormViewMode.ReadOnly)
        Catch ex As Exception
            popShow("Proforma Update", ex)
        End Try
    End Sub

    Protected Sub ProformaUpdateSingle(ByVal docID As Integer)
        'Dim docID As Integer = Request.QueryString("ProformaID")
        Dim _proforma As Preinvoicing.ProformaSingle
        Try
            Dim ckoutFrom As String = CType(fvInvoiceHead.FindControl("txtCheckOutFrom"), TextBox).Text
            Dim ckoutTo As String = CType(fvInvoiceHead.FindControl("txtCheckOutTo"), TextBox).Text
            Dim incCancel As Boolean = CType(fvInvoiceHead.FindControl("cbCancelled"), CheckBox).Checked
            _proforma = New Preinvoicing.ProformaSingle(docID, ckoutFrom, ckoutTo, incCancel)
            _proforma.Update()
            fvInvoiceHead.ChangeMode(FormViewMode.ReadOnly)
        Catch ex As Exception
            popShow("Proforma Update", ex)
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
            popShow("Booking Update", ex)
        End Try
    End Sub

#Region "Printing"

    Public Function ShowPrintModalText(ByVal group As Boolean) As String
        Dim iID As Integer = Request.QueryString("ProformaID")
        Dim h As Integer = 0
        If cbHotel.Checked Then h = 1

        Dim r As String = "ShowPrintModal{0}({1},{2}); return false;"
        If group Then
            r = String.Format(r, "Group", iID, h)
        Else
            r = String.Format(r, "Single", iID, h)
        End If
        Return "{ " & r & " }"
    End Function

    'Protected Sub btnWarningYes_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnWarningYes.Click
    '    PrintProforma(CType(sender, Button).CommandArgument)
    'End Sub

    'Protected Sub btnWarningNC_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnWarningNC.Click
    '    PrintProformaNC(CType(sender, Button).CommandArgument)
    'End Sub

    'Protected Sub PrintProforma(ByVal strNum As String)
    '    Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
    '    Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
    '    Dim streamids As String() = Nothing
    '    Dim mimeType As String = Nothing
    '    Dim encoding As String = Nothing
    '    Dim extension As String = Nothing
    '    Dim bytes As Byte()

    '    Dim lr As New Microsoft.Reporting.WebForms.LocalReport
    '    lr.ReportPath = "Proforma\Proforma.rdlc"

    '    Try
    '        Dim iID As Integer = Request.QueryString("ProformaID")
    '        Dim aHeader As New dsProformaPrintTableAdapters.PrtProformaHeaderTableAdapter
    '        Dim aDetail As New dsProformaPrintTableAdapters.PrtProformaRowsTableAdapter
    '        Dim aAded As New dsProformaPrintTableAdapters.PrtProformaAddedValueTableAdapter

    '        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsProformaPrint_PrtProformaHeader", aHeader.GetData(iID)))
    '        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsProformaPrint_PrtProformaRows", aDetail.GetData(iID)))
    '        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsProformaPrint_PrtProformaAddedValue", aAded.GetData(iID)))

    '        bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
    '        Response.ClearContent()
    '        Response.ClearHeaders()
    '        Response.ContentType = "application/excel"
    '        Response.AppendHeader("Content-Disposition", "attachment; filename=""" & strNum & ".xls" + """")
    '        Response.BinaryWrite(bytes)
    '        Response.Flush()
    '        Response.Close()
    '    Catch ex As Exception
    '        popShow("Report Rendering Error", ex)
    '    End Try
    'End Sub

    'Protected Sub PrintProformaNC(ByVal strNum As String)
    '    Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
    '    Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
    '    Dim streamids As String() = Nothing
    '    Dim mimeType As String = Nothing
    '    Dim encoding As String = Nothing
    '    Dim extension As String = Nothing
    '    Dim bytes As Byte()

    '    Dim lr As New Microsoft.Reporting.WebForms.LocalReport
    '    lr.ReportPath = "Proforma\ProformaNC.rdlc"

    '    Try
    '        Dim iID As Integer = Request.QueryString("ProformaID")
    '        Dim aHeader As New dsProformaPrintTableAdapters.PrtProformaHeaderTableAdapter
    '        Dim aDetail As New dsProformaPrintTableAdapters.PrtProformaDetailTableAdapter
    '        Dim aAded As New dsProformaPrintTableAdapters.PrtProformaAddedValueTableAdapter

    '        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsProformaPrint_PrtProformaHeader", aHeader.GetData(iID)))
    '        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsProformaPrint_PrtProformaDetail", aDetail.GetData(iID)))
    '        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsProformaPrint_PrtProformaAddedValue", aAded.GetData(iID)))

    '        bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
    '        Response.ClearContent()
    '        Response.ClearHeaders()
    '        Response.ContentType = "application/excel"
    '        Response.AppendHeader("Content-Disposition", "attachment; filename=""" & strNum & ".xls" + """")
    '        Response.BinaryWrite(bytes)
    '        Response.Flush()
    '        Response.Close()
    '    Catch ex As Exception
    '        popShow("Report Rendering Error", ex)
    '    End Try
    'End Sub

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
        If (IsDefinitive Or IsCancelled) Then Return String.Empty

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
            RefreshData()
        Catch ex As Exception
            popShow("Penalty", ex)
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
            popShow("Penalty", ex)
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

    Public Function ShowSuppModalText() As String
        Dim ssm As String = "ShowSuppModal({0}, {1});"
        Dim iID As Integer = Request.QueryString("ProformaID")
        'Dim bID As Integer = hdBookingID.Value
        Dim bID As Integer = Session("SelectedBookingID")
        Return String.Format(ssm, bID, iID)
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
            popShow("Remove Supplement", ex)
        End Try
    End Sub

#End Region

#Region "Charging Nights"
    'Edit
    Protected Sub dlBooking_EditCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles dlBooking.EditCommand
        dlBooking.EditItemIndex = e.Item.ItemIndex
        dlBooking.DataBind()
    End Sub

    'Cancel
    Protected Sub dlBooking_CancelCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles dlBooking.CancelCommand
        dlBooking.EditItemIndex = -1
        dlBooking.DataBind()
    End Sub

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
            RefreshData()
        Catch ex As Exception
            popShow("Charging Nights", ex)
        End Try
    End Sub

#End Region

#Region "Log"
    Protected Sub dlLog_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles dlLog.SelectedIndexChanged
        dlProformaLog.Visible = dlLog.SelectedValue = 1
        dlBookingLog.Visible = dlLog.SelectedValue = 2
        dlReservationLog.Visible = dlLog.SelectedValue = 3
    End Sub

    Protected Sub btLogGo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btLogGo.Click
        RefreshLog()
    End Sub
#End Region

#Region "Payments"

    Public Function ShowPaymentModalText() As String
        Dim iID As Integer = Request.QueryString("ProformaID")
        Dim r As String = String.Format("ShowPaymentModal({0}); return false;", iID)
        Return "{ " & r & " }"
    End Function

    Public Function ShowPaymentModalText(ByVal DocumentID As Integer) As String
        Dim iID As Integer = Request.QueryString("ProformaID")
        Dim r As String = String.Format("ShowPaymentModalEdit({0},{1}); return false;", iID, DocumentID)
        Return "{ " & r & " }"
    End Function

    Protected Sub dummyPayment_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        fvInvoiceHead.DataBind()
        rptPayments.DataBind()
        RefreshLog()
    End Sub

#End Region
End Class
