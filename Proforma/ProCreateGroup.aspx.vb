Imports System.Data.SqlClient
Imports Preinvoicing

Partial Class Proforma_ProCreateGroup
    Inherits System.Web.UI.Page

    Public ReadOnly Property Hotels() As List(Of Integer)
        Get
            Dim hList As New List(Of Integer)
            For Each h As ListItem In listHotels().Items
                If h.Selected Then hList.Add(h.Value)
            Next

            Return hList
        End Get
    End Property

    Protected Sub btnCloseHotel_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnCloseHotel.Click
        Dim lbox As ListBox = lbHotel()

        lbox.Items.Clear()
        For Each c As ListItem In listHotels().Items
            If c.Selected Then lbox.Items.Add(c.Text)
        Next
        If lbox.Items.Count > 1 Then lbox.Rows = lbox.Items.Count Else lbox.Rows = 2
    End Sub

    Protected Sub btnCheck_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCheck.Click
        pnlDetail.Visible = False
        pnlError.Visible = False
        lblError.Text = String.Empty
        btnCreate.Enabled = True

        Dim _reservations As Preinvoicing.ProformaDataSet.ResInProformaDataTable
        Dim _proforma As Preinvoicing.Proforma
        Try
            Dim _preinvoiced As Boolean
            _proforma = New Preinvoicing.Proforma( _
                txtGroup.Text, _
                Integer.Parse(ctrlTourOp.SelectedTourOp), _
                ctrlCheckIn.DateFrom, _
                ctrlCheckIn.DateTo, _
                ctrlCheckOut.DateFrom, _
                ctrlCheckOut.DateTo, _
                Hotels, _
                cbIncludeCancelled.Checked)
            _reservations = _proforma.Reservations(_preinvoiced)

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

    Private hID = 0
    Protected Sub dlRes_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles dlRes.ItemDataBound
        If e.Item.ItemType = ListItemType.Header Then Return
        If e.Item.ItemType = ListItemType.Footer Then Return

        Dim pro As Preinvoicing.ProformaDataSet.ResInProformaRow = CType(e.Item.DataItem, Data.DataRowView).Row
        Dim pnlHotel As Panel = e.Item.FindControl("pnlHotel")
        pnlHotel.Visible = hID <> pro.HotelId
        hID = pro.HotelId
    End Sub

    Protected Sub btnCreate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCreate.Click
        pnlDetail.Visible = False
        pnlError.Visible = False
        lblError.Text = String.Empty
        btnCreate.Enabled = True

        Dim _proforma As Preinvoicing.Proforma
        Dim _proformaID As Integer
        Try
            _proforma = New Preinvoicing.Proforma( _
                txtGroup.Text, _
                Integer.Parse(ctrlTourOp.SelectedTourOp), _
                ctrlCheckIn.DateFrom, _
                ctrlCheckIn.DateTo, _
                ctrlCheckOut.DateFrom, _
                ctrlCheckOut.DateTo, _
                Hotels, _
                cbIncludeCancelled.Checked)
            _proformaID = _proforma.Create()
            Response.Redirect(String.Format("ProformDetails.aspx?ProformaID={0}", _proformaID))
        Catch ex As Exception
            lblError.Text = ex.Message
            pnlError.Visible = True
        End Try
    End Sub

    Protected Sub listHotels_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles listHotels.DataBound
        If String.IsNullOrEmpty(Request.QueryString("TourOpID")) Then Return
        If String.IsNullOrEmpty(Request.QueryString("ResGroup")) Then Return
        If String.IsNullOrEmpty(Request.QueryString("HotelID")) Then Return

        Dim TourOpID As Integer = Request.QueryString("TourOpID")
        Dim ResGroup As String = Request.QueryString("ResGroup")
        Dim HotelID As Integer = Request.QueryString("HotelID")

        ctrlTourOp.SetTourOp(TourOpID)
        txtGroup.Text = ResGroup

        For Each h As ListItem In listHotels().Items
            h.Selected = (h.Value = HotelID)
        Next
        btnCloseHotel_Click(btnCloseHotel, New System.Web.UI.ImageClickEventArgs(0, 0))
    End Sub
End Class
