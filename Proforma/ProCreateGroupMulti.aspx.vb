Imports System.Data.SqlClient
Imports Preinvoicing

Partial Class Proforma_ProCreateGroupMulti
    Inherits System.Web.UI.Page
    Dim _proforma As Preinvoicing.ProformaGroup

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

        Try
            _proforma = New Preinvoicing.ProformaGroup( _
                txtGroup.Text, _
                ctrlTourOp.SelectedTourOpKind, _
                ctrlTourOp.SelectedTourOpGroup, _
                ctrlTourOp.SelectedMarket, _
                ctrlTourOp.SelectedPayCond, _
                ctrlTourOp.SelectedTourOp, _
                ctrlCheckIn.DateFrom, _
                ctrlCheckIn.DateTo, _
                ctrlCheckOut.DateFrom, _
                ctrlCheckOut.DateTo, _
                ctrlBkDate.TextValue, _
                txtBkNumber.Text, _
                Hotels, _
                cbIncludeCancelled.Checked)

            Dim dtMulti As Data.DataTable = _proforma.Proformas()
            dlMulti.DataSource = dtMulti
            dlMulti.DataBind()

            pnlDetail.Visible = True
        Catch ex As Exception
            lblError.Text = ex.Message
            pnlError.Visible = True
        End Try
    End Sub

    Private toID = 0
    Protected Sub dlMulti_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles dlMulti.ItemDataBound
        If e.Item.ItemType = ListItemType.Header Then Return
        If e.Item.ItemType = ListItemType.Footer Then Return

        Dim pro As Preinvoicing.ProformaDataSet.MultiGroupRow = CType(e.Item.DataItem, Data.DataRowView).Row
        Dim pnlTourOp As Panel = e.Item.FindControl("pnlTourOp")
        Dim dlRes As DataList = e.Item.FindControl("dlRes")
        Dim lblAready As Label = e.Item.FindControl("lblAready")

        Dim _preinvoiced As Boolean
        Dim _reservations As Preinvoicing.ProformaDataSet.ResInProformaDataTable = _proforma.Reservations(pro.ResGroup, pro.TourOpID, _preinvoiced)

        hID = 0
        pnlTourOp.Visible = toID <> pro.TourOpID
        If pro.AlreadyExists Then
            dlRes.Visible = False
        Else
            lblAready.Visible = _preinvoiced
            dlRes.DataSource = _reservations
            dlRes.DataBind()
        End If
        toID = pro.TourOpID
    End Sub

    Private hID = 0
    Protected Sub dlRes_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs)
        If e.Item.ItemType = ListItemType.Header Then Return
        If e.Item.ItemType = ListItemType.Footer Then Return

        Dim pro As Preinvoicing.ProformaDataSet.ResInProformaRow = CType(e.Item.DataItem, Data.DataRowView).Row
        Dim pnlHotel As Panel = e.Item.FindControl("pnlHotel")
        Dim lblHotel As Label = e.Item.FindControl("lblHotel")

        pnlHotel.Visible = hID <> pro.HotelId
        'lblHotel.Text = pro.Hotel
        hID = pro.HotelId
    End Sub

    Protected Sub dlMulti_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles dlMulti.ItemCommand
        If e.CommandName = "CreateSingle" Then
            Dim s = Split(e.CommandArgument, ";")
            Dim tourOpID As Integer = Integer.Parse(s(0))
            Dim resGroup As String = s(1)

            Try
                _proforma = New Preinvoicing.ProformaGroup( _
                    txtGroup.Text, _
                    ctrlTourOp.SelectedTourOpKind, _
                    ctrlTourOp.SelectedTourOpGroup, _
                    ctrlTourOp.SelectedMarket, _
                    ctrlTourOp.SelectedPayCond, _
                    ctrlTourOp.SelectedTourOp, _
                    ctrlCheckIn.DateFrom, _
                    ctrlCheckIn.DateTo, _
                    ctrlCheckOut.DateFrom, _
                    ctrlCheckOut.DateTo, _
                    ctrlBkDate.TextValue, _
                    txtBkNumber.Text, _
                    Hotels, _
                    cbIncludeCancelled.Checked)

                Dim proformaID = _proforma.Create(resGroup, tourOpID)
                Response.Redirect(String.Format("ProformDetails.aspx?ProformaID={0}", proformaID))
            Catch ex As Exception
                lblError.Text = ex.Message
                pnlError.Visible = True
            End Try
        End If
    End Sub

    Protected Sub btnCreate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCreate.Click
        Try
            _proforma = New Preinvoicing.ProformaGroup( _
                txtGroup.Text, _
                ctrlTourOp.SelectedTourOpKind, _
                ctrlTourOp.SelectedTourOpGroup, _
                ctrlTourOp.SelectedMarket, _
                ctrlTourOp.SelectedPayCond, _
                ctrlTourOp.SelectedTourOp, _
                ctrlCheckIn.DateFrom, _
                ctrlCheckIn.DateTo, _
                ctrlCheckOut.DateFrom, _
                ctrlCheckOut.DateTo, _
                ctrlBkDate.TextValue, _
                txtBkNumber.Text, _
                Hotels, _
                cbIncludeCancelled.Checked)
        Catch ex As Exception
            lblError.Text = ex.Message
            pnlError.Visible = True
        End Try

        For Each i As DataListItem In dlMulti.Items
            Dim btCreateSingle As LinkButton = i.FindControl("btCreateSingle")
            Dim lnkProforma As HyperLink = i.FindControl("lnkProforma")
            Dim lblAready As Label = i.FindControl("lblAready")
            Dim dlRes As DataList = i.FindControl("dlRes")

            If btCreateSingle.Visible Then
                Try
                    Dim s = Split(btCreateSingle.CommandArgument, ";")
                    Dim tourOpID As Integer = Integer.Parse(s(0))
                    Dim resGroup As String = s(1)
                    btCreateSingle.Visible = False

                    Dim proformaID = _proforma.Create(resGroup, tourOpID)

                    lnkProforma.Visible = True
                    lnkProforma.Text = String.Format("PF {0} >>", proformaID)
                    lnkProforma.NavigateUrl = String.Format("ProformDetails.aspx?ProformaID={0}", proformaID)
                    dlRes.Visible = False
                Catch ex As Exception
                    lblAready.Visible = True
                    lblAready.Text = ex.Message
                End Try
            End If
        Next

        lblReservations.Text = "Created Proformas"
        dlMulti.ShowHeader = False
        btnCreate.Visible = False
        btnCheck.Enabled = False
    End Sub
End Class
