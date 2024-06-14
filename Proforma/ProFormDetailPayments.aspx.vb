Imports App_UserControls_MessagePop

Partial Class Proforma_ProFormDetailPayments
    Inherits System.Web.UI.Page

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
#End Region

#Region "Event Handlers"
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        _IsAdmin = My.User.IsInRole("admin") Or My.User.IsInRole("invoicing_admin")
        _IsHotel = My.User.IsInRole("hotel")

        Dim btBatch = fvInvoiceHead.FindControl("btBatch")
        ScriptManager.GetCurrent(Page).RegisterPostBackControl(btBatch)
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

    Protected Sub lbDetails_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbDetails.Click
        Response.Redirect("ProformDetails.aspx?ProformaID=" & Request.QueryString("ProformaID"))
    End Sub

    Protected Sub lbLog_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbLog.Click
        Response.Redirect("ProformDetailLog.aspx?ProformaID=" & Request.QueryString("ProformaID"))
    End Sub

    Protected Sub btBatch_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()

        Dim pfa As New dsProformaApplicationTableAdapters.InvDocBatch_ProformaTableAdapter
        Dim pya As New dsProformaApplicationTableAdapters.InvDocBatch_PaymentsTableAdapter

        Dim InvDocID As Integer = Request.QueryString("ProformaID")
        Dim pf As Data.DataTable = pfa.GetData(InvDocID)
        Dim py As Data.DataTable = pya.GetData(InvDocID)

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Proforma\ProformPaymentBatch.rdlc"
        lr.DataSources.Clear()
        lr.DataSources.Add(New ReportDataSource("dsProformaApplication_InvDocBatch_Proforma", pf))
        lr.DataSources.Add(New ReportDataSource("dsProformaApplication_InvDocBatch_Payments", py))

        Dim puser As New ReportParameter("user", My.User.Name)
        Dim p As ReportParameter() = {puser}
        lr.SetParameters(p)
        Try
            bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

        Response.ClearContent()
        Response.ClearHeaders()
        Response.ContentType = "application/pdf"
        Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Proforma Payment Batch.pdf" + """")
        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
        'upHeader.Update()
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
    End Sub
#End Region

    Protected Sub showCanc_CheckChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim showCanc As CheckBox = sender
        If (showCanc.Checked) Then
            dsPayments.FilterExpression = "InHouseState<>-2 or InvResTotal<>0"
        Else
            dsPayments.FilterExpression = String.Empty
        End If
        rptPayments.DataBind()
    End Sub
End Class
