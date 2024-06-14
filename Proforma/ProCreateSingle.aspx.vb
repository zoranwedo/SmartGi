
Partial Class Proforma_ProCreateSingle
    Inherits System.Web.UI.Page
    Dim _proforma As Preinvoicing.ProformaSingle

    Protected Function SelectedTourOp() As Integer
        If String.IsNullOrEmpty(ctrlTourOp.SelectedTourOp) Then
            Return 0
        Else
            Return Integer.Parse(ctrlTourOp.SelectedTourOp)
        End If
    End Function


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If String.IsNullOrEmpty(Request.QueryString("TourOpID")) Then Return
        If String.IsNullOrEmpty(Request.QueryString("HotelID")) Then Return
        If String.IsNullOrEmpty(Request.QueryString("CheckIn")) Then Return

        Dim TourOpID As Integer = Request.QueryString("TourOpID")
        Dim HotelID As Integer = Request.QueryString("HotelID")
        Dim CheckIn As DateTime = Request.QueryString("CheckIn")

        ctrlTourOp.SetTourOp(TourOpID)
        ctrlHotel.SetHotel(HotelID)
        ctrlCheckIn.SetDate(CheckIn)
    End Sub

    Protected Sub btnCheck_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCheck.Click
        pnlDetail.Visible = False
        pnlError.Visible = False
        lblError.Text = String.Empty
        btnCreate.Enabled = True

        Try
            _proforma = New Preinvoicing.ProformaSingle( _
                SelectedTourOp, _
                ctrlCheckIn.DateFrom, _
                ctrlCheckIn.DateTo, _
                ctrlCheckOut.DateFrom, _
                ctrlCheckOut.DateTo, _
                ctrlHotel.SelectedHotel, _
                cbIncludeCancelled.Checked)

            _proforma.BkDate = ctrlBkDate.DateValue
            _proforma.BkNumber = txtBkNumber.Text
            _proforma.TourOpKind = ctrlTourOp.SelectedTourOpKind
            _proforma.TourOpPayCondID = ctrlTourOp.SelectedPayCond
            _proforma.TourOpMarketID = ctrlTourOp.SelectedMarket
            _proforma.TourOpGroupID = ctrlTourOp.SelectedTourOpGroup

            Dim dtMulti As Data.DataTable = _proforma.Proformas()
            dlMulti.DataSource = dtMulti
            dlMulti.DataBind()

            pnlDetail.Visible = True
        Catch ex As Exception
            lblError.Text = ex.Message
            pnlError.Visible = True
        End Try
    End Sub

    Private hID = 0
    Private tID = 0
    Protected Sub dlMulti_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles dlMulti.ItemDataBound
        If e.Item.ItemType = ListItemType.Header Then Return
        If e.Item.ItemType = ListItemType.Footer Then Return

        Dim pro As Preinvoicing.ProformaDataSet.MultiSingleRow = CType(e.Item.DataItem, Data.DataRowView).Row
        Dim pnlHotel As Panel = e.Item.FindControl("pnlHotel")
        Dim dlRes As DataList = e.Item.FindControl("dlRes")
        Dim lblAready As Label = e.Item.FindControl("lblAready")

        Dim _preinvoiced As Boolean
        Dim _reservations As Preinvoicing.ProformaDataSet.ResInProformaDataTable = _proforma.Reservations(pro.TourOpId, pro.HotelId, pro.CheckIn, pro.Source, _preinvoiced)

        pnlHotel.Visible = hID <> pro.HotelId Or tID <> pro.TourOpId
        'If pro.AlreadyExists Then
        '    dlRes.Visible = False
        'Else
        lblAready.Visible = _preinvoiced
        dlRes.DataSource = _reservations
        dlRes.DataBind()
        'End If
        hID = pro.HotelId
        tID = pro.TourOpId
    End Sub

    Protected Sub dlMulti_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListCommandEventArgs) Handles dlMulti.ItemCommand
        If e.CommandName = "CreateSingle" Then
            Dim s = Split(e.CommandArgument, ";")
            Dim touropID As Integer = Integer.Parse(s(0))
            Dim hotelID As Integer = Integer.Parse(s(1))
            Dim checkIn As Date = Date.Parse(s(2))
            Dim source As String = s(3).Trim()

            Try
                _proforma = New Preinvoicing.ProformaSingle( _
                    SelectedTourOp, _
                    ctrlCheckIn.DateFrom, _
                    ctrlCheckIn.DateTo, _
                    ctrlCheckOut.DateFrom, _
                    ctrlCheckOut.DateTo, _
                    ctrlHotel.SelectedHotel, _
                    cbIncludeCancelled.Checked)

                Dim proformaID = _proforma.Create(touropID, hotelID, checkIn, source)
                Response.Redirect(String.Format("ProformDetails.aspx?ProformaID={0}", proformaID))
            Catch ex As Exception
                lblError.Text = ex.Message
                pnlError.Visible = True
            End Try
        End If
    End Sub

    Protected Sub btnCreate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCreate.Click
        For Each i As DataListItem In dlMulti.Items
            Dim lnkProforma As HyperLink = i.FindControl("lnkProforma")
            Dim hfTourOpID As HiddenField = i.FindControl("hfTourOpID")
            Dim hfHotelID As HiddenField = i.FindControl("hfHotelID")
            Dim hfCheckIn As HiddenField = i.FindControl("hfCheckIn")
            Dim hfSource As HiddenField = i.FindControl("hfSource")
            Dim hfAlreadyExists As HiddenField = i.FindControl("hfAlreadyExists")
            Dim btCreateSingle As LinkButton = i.FindControl("btCreateSingle")
            Dim lblAready As Label = i.FindControl("lblAready")
            Dim dlRes As DataList = i.FindControl("dlRes")

            If Not CType(hfAlreadyExists.Value, Boolean) Then
                Try
                    btCreateSingle.Visible = False

                    _proforma = New Preinvoicing.ProformaSingle( _
                        SelectedTourOp, _
                        ctrlCheckIn.DateFrom, _
                        ctrlCheckIn.DateTo, _
                        ctrlCheckOut.DateFrom, _
                        ctrlCheckOut.DateTo, _
                        ctrlHotel.SelectedHotel, _
                        cbIncludeCancelled.Checked)

                    Dim touropID As Integer = hfTourOpID.Value
                    Dim hotelID As Integer = hfHotelID.Value
                    Dim checkIn As Date = hfCheckIn.Value
                    Dim source As String = hfSource.Value
                    Dim proformaID = _proforma.Create(touropID, hotelID, checkIn, source)

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
