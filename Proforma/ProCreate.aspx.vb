Imports System.Data.SqlClient
Imports Preinvoicing

Partial Class Proforma_ProCreate
    Inherits System.Web.UI.Page


    Public ReadOnly Property lbHotel() As ListBox
        Get
            Return fvInvoiceHead.FindControl("lbHotel")
        End Get
    End Property

    Public ReadOnly Property listHotels() As CheckBoxList
        Get
            Return fvInvoiceHead.FindControl("listHotels")
        End Get
    End Property

    Public ReadOnly Property txtCheckInFrom() As TextBox
        Get
            Return fvInvoiceHead.FindControl("txtCheckInFrom")
        End Get
    End Property

    Public ReadOnly Property txtCheckInTo() As TextBox
        Get
            Return fvInvoiceHead.FindControl("txtCheckInTo")

        End Get
    End Property

    Public ReadOnly Property txtCheckOutFrom() As TextBox
        Get
            Return fvInvoiceHead.FindControl("txtCheckOutFrom")
        End Get
    End Property

    Public ReadOnly Property txtCheckOutTo() As TextBox
        Get
            Return fvInvoiceHead.FindControl("txtCheckOutTo")
        End Get
    End Property

    Public ReadOnly Property TourOpID() As Integer
        Get
            Return CType(fvInvoiceHead.FindControl("ddlTO"), DropDownList).SelectedValue
        End Get
    End Property

    Public ReadOnly Property ResGroup() As String
        Get
            Return CType(fvInvoiceHead.FindControl("txtGroup"), TextBox).Text.Trim()
        End Get
    End Property

    Public ReadOnly Property Hotels() As List(Of Integer)
        Get
            Dim hList As New List(Of Integer)
            For Each h As ListItem In listHotels().Items
                If h.Selected Then hList.Add(h.Value)
            Next

            Return hList
        End Get
    End Property

    Public ReadOnly Property CheckInFrom() As String
        Get
            Return CType(fvInvoiceHead.FindControl("txtCheckInFrom"), TextBox).Text
        End Get
    End Property

    Public ReadOnly Property CheckInTo() As String
        Get
            Return CType(fvInvoiceHead.FindControl("txtCheckInTo"), TextBox).Text
        End Get
    End Property

    Public ReadOnly Property CheckOutFrom() As String
        Get
            Return CType(fvInvoiceHead.FindControl("txtCheckOutFrom"), TextBox).Text
        End Get
    End Property

    Public ReadOnly Property CheckOutTo() As String
        Get
            Return CType(fvInvoiceHead.FindControl("txtCheckOutTo"), TextBox).Text
        End Get
    End Property

    Public ReadOnly Property Cancelled() As Boolean
        Get
            Return CType(fvInvoiceHead.FindControl("cbIncludeCancelled"), CheckBox).Checked
        End Get
    End Property


    Protected Sub btnCloseHotel_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim lbox As ListBox = lbHotel()

        lbox.Items.Clear()
        For Each c As ListItem In listHotels().Items
            If c.Selected Then lbox.Items.Add(c.Text)
        Next
        If lbox.Items.Count > 1 Then lbox.Rows = lbox.Items.Count Else lbox.Rows = 2
    End Sub

    Protected Sub btnCheck_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        pnlDetail.Visible = False
        pnlError.Visible = False
        lblError.Text = String.Empty
        btnCreate.Enabled = True

        'Page.ClientScript.RegisterStartupScript(Me.GetType(), "Call_adjustDivs", "adjustDivs()", True)
        'Threading.Thread.Sleep(15000) ' 500 milliseconds = 0.5 seconds
        'Return

        Dim _reservations As Preinvoicing.ProformaDataSet.ResInProformaDataTable
        Dim _proforma As Preinvoicing.Proforma
        Try
            Dim _preinvoiced As Boolean
            _proforma = New Preinvoicing.Proforma(ResGroup, TourOpID, CheckInFrom, CheckInTo, CheckOutFrom, CheckOutTo, Hotels, Cancelled)
            _reservations = _proforma.Reservations(_preinvoiced)

            'If _preinvoiced Then
            '    lblError.Text = "One or more reservations are already preinvoiced!"
            '    pnlError.Visible = True
            '    btnCreate.Enabled = False
            'End If

            lblAready.Visible = _preinvoiced
            btnCreate.Visible = Not _preinvoiced

            dlRes.DataSource = _reservations
            dlRes.DataBind()
            pnlDetail.Visible = True
        Catch ex As Exception
            lblError.Text = ex.Message
            pnlError.Visible = True
        End Try
    End Sub

    Protected Sub btnCreate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCreate.Click
        pnlDetail.Visible = False
        pnlError.Visible = False
        lblError.Text = String.Empty
        btnCreate.Enabled = True

        Dim _proforma As Preinvoicing.Proforma
        Dim _proformaID As Integer
        Try
            _proforma = New Preinvoicing.Proforma(ResGroup, TourOpID, CheckInFrom, CheckInTo, CheckOutFrom, CheckOutTo, Hotels, Cancelled)
            _proformaID = _proforma.Create()
            Response.Redirect(String.Format("Proform.aspx?ProformaID={0}", _proformaID))
        Catch ex As Exception
            lblError.Text = ex.Message
            pnlError.Visible = True
        End Try
    End Sub
End Class
