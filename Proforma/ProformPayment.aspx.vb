Imports App_UserControls_MessagePop

Partial Class Proforma_ProformPayment
    Inherits System.Web.UI.Page

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

    Dim ta As dsProformaApplicationTableAdapters.AccDocReservationTableAdapter

    Protected Sub rptPayments_DataBound(ByVal sender As Object, ByVal e As RepeaterItemEventArgs) Handles rptPayments.ItemDataBound
        If e.Item.ItemType = ListItemType.Footer Then Return

        If e.Item.ItemType = ListItemType.Header Then
            Dim ta As New dsProformaApplicationTableAdapters.AccVwDocEfectiveTableAdapter
            Dim dt As dsProformaApplication.AccVwDocEfectiveDataTable = ta.GetData(Request.QueryString("AccDocID"))
            Dim r As dsProformaApplication.AccVwDocEfectiveRow = dt.Rows(0)
            If dt IsNot Nothing Then
                Dim lblDocument As Label = e.Item.FindControl("lblDocument")
                Dim lblBalance As Label = e.Item.FindControl("lblBalance")
                Dim lblHotelName As Label = e.Item.FindControl("lblHotelName")
                lblDocument.Text = String.Format("{0} {1}", r.DocCode, r.DocNumber)
                lblBalance.Text = String.Format("{0:N2}", r.EfectiveAmount)
                lblHotelName.Text = r.Hotel
            End If
        Else
            Dim r As dsProformaApplication.ProformaPaymentRow = CType(e.Item.DataItem, System.Data.DataRowView).Row
            If r IsNot Nothing Then
                Dim fvPayment As FormView = e.Item.FindControl("fvPayment")
                Dim dsPayment As ObjectDataSource = e.Item.FindControl("dsPayment")
                Dim bookingID = r.BookingID
                dsPayment.SelectParameters("BookingID").DefaultValue = bookingID
                dsPayment.InsertParameters("BookingID").DefaultValue = bookingID
            End If
        End If
    End Sub

    Protected Sub fvPayment_ItemCommand(ByVal sender As Object, ByVal e As FormViewCommandEventArgs)
        Dim fvPayment As FormView = sender
        If e.CommandName = "payInsert" Then
            'Dim hfBooking As HiddenField = CType(fvPayment.Parent.FindControl("hfBooking"), HiddenField)
            Dim amount As Decimal = Decimal.Parse(CType(fvPayment.FindControl("txtAmount"), TextBox).Text)
            Dim bookingID As Integer = CType(fvPayment.Parent.FindControl("hfBooking"), HiddenField).Value
            Dim documentID As Integer = Request.QueryString("AccDocID")
            Try
                Dim ta As New dsProformaApplicationTableAdapters.AccDocReservationTableAdapter
                ta.Insert(documentID, bookingID, amount, My.User.Name)
                fvPayment.ChangeMode(FormViewMode.ReadOnly)
                rptPayments.DataBind()
            Catch ex As Exception
                msgPop.ShowError(ex)
            End Try
        ElseIf e.CommandName = "payUpdate" Then
            Dim amount As Decimal = Decimal.Parse(CType(fvPayment.FindControl("txtAmount"), TextBox).Text)
            Dim id As Integer = e.CommandArgument

            Try
                Dim ta As New dsProformaApplicationTableAdapters.AccDocReservationTableAdapter
                ta.Update(id, amount, My.User.Name)
                fvPayment.ChangeMode(FormViewMode.ReadOnly)
                rptPayments.DataBind()
            Catch ex As Exception
                msgPop.ShowError(ex)
            End Try
        ElseIf e.CommandName = "payDelete" Then
            Dim id As Integer = e.CommandArgument

            Try
                Dim ta As New dsProformaApplicationTableAdapters.AccDocReservationTableAdapter
                ta.Delete(id, Nothing, My.User.Name)
                fvPayment.ChangeMode(FormViewMode.ReadOnly)
                rptPayments.DataBind()
            Catch ex As Exception
                msgPop.ShowError(ex)
            End Try
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim doc As Boolean = Request.QueryString("AccDocID") IsNot Nothing

        lblPlease.Visible = Not doc
        rptAccDocuments.Visible = Not doc
        rptPayments.Visible = doc
    End Sub
End Class
