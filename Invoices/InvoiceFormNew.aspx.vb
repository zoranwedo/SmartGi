Imports System.Data
Partial Class Invoices_InvoiceFormNew
    Inherits System.Web.UI.Page

    Protected ChLabel As String() = {"*", "*", "*", "*", "*"}
    Protected ChTTip As String() = {"Not supported by hotel policy.", "Not supported by hotel policy.", "Not supported by hotel policy.", "Not supported by hotel policy.", "Not supported by hotel policy."}

    '@HotelID INT,
    '@TourOpID INT,
    '@InvType INT,
    '@ResGroup VARCHAR(50),
    '@InvDate INT,
    '@CheckIn DATETIME,
    '@ChechOut DATETIME,
    '@InvRefText NVARCHAR(200),
    '@InvPrnText NVARCHAR(200),
    '@InvComment NVARCHAR(200),
    '@CreateUser NVARCHAR(250),
    '@DetText NVARCHAR(60),
    '@BookingDate DATETIME,
    '@BookingVoucher CHAR(20),
    '@MealPlanID CHAR(2),
    '@RoomTypeID CHAR(4),
    '@RoomsNum INT,
    '@AdultNum INT,
    '@Chld1Num INT,	
    '@Chld2Num INT,	
    '@Chld3Num INT,	
    '@Chld4Num INT	

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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        dsHotel.SelectParameters("UserName").DefaultValue = My.User.Name
        dsTO.SelectParameters("UserName").DefaultValue = My.User.Name
    End Sub

    Protected Sub fvInvoiceHead_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles fvInvoiceHead.ItemCommand
        If e.CommandName = "Create" Then
            Dim ddlHotel As DropDownList = fvInvoiceHead.FindControl("ddlHotel")
            Dim ddlTO As DropDownList = fvInvoiceHead.FindControl("ddlTO")
            Dim ddlInvType As DropDownList = fvInvoiceHead.FindControl("ddlInvType")
            Dim txtCheckIn As TextBox = fvInvoiceHead.FindControl("txtCheckIn")
            Dim txtCheckOut As TextBox = fvInvoiceHead.FindControl("txtCheckOut")

            hfHotelID.Value = ddlHotel.SelectedValue
            hfHotel.Value = Trim(ddlHotel.SelectedItem.Text)
            hfTourOpID.Value = ddlTO.SelectedValue
            hfTourOp.Value = Trim(ddlTO.SelectedItem.Text)
            hfInvType.Value = ddlInvType.SelectedValue
            hfCheckIn.Value = txtCheckIn.Text
            hfCheckOut.Value = txtCheckOut.Text
            hfNights.Value = DateDiff(DateInterval.Day, Date.Parse(hfCheckIn.Value), Date.Parse(hfCheckOut.Value))

            Dim i As New dsInvoiceForm.NewInvoiceDataTable
            Dim r As dsInvoiceForm.NewInvoiceRow = i.NewNewInvoiceRow()
            r.HotelID = hfHotelID.Value
            r.TourOpID = hfTourOpID.Value
            r.InvType = hfInvType.Value
            r.CheckIn = hfCheckIn.Value
            r.CheckOut = hfCheckOut.Value
            r.InvDate = hfCheckOut.Value
            r.CreateUser = My.User.Name
            r.RoomsNum = 1
            i.AddNewInvoiceRow(r)

            Dim p As New dsInvoiceFormTableAdapters.HotelPolicyTableAdapter
            Dim t As dsInvoiceForm.HotelPolicyDataTable = p.GetData(r.HotelID)
            Dim pr As dsInvoiceForm.HotelPolicyRow

            If t IsNot Nothing Then
                If t.Rows.Count > 0 Then
                    pr = t.Rows(0)

                    If pr.ChldCategories > 0 Then
                        ChLabel(1) = pr.Chld1ShLabel
                        ChTTip(1) = pr.Chld1Label & ": from " & pr.Chld1From & " to less than " & pr.Chld1Max
                    End If
                    If pr.ChldCategories > 1 Then
                        ChLabel(2) = pr.Chld2ShLabel
                        ChTTip(2) = pr.Chld2Label & ": from " & pr.Chld2From & " to less than " & pr.Chld2Max
                    End If
                    If pr.ChldCategories > 2 Then
                        ChLabel(3) = pr.Chld3ShLabel
                        ChTTip(3) = pr.Chld3Label & ": from " & pr.Chld3From & " to less than " & pr.Chld3Max
                    End If
                    If pr.ChldCategories > 3 Then
                        ChLabel(4) = pr.Chld4ShLabel
                        ChTTip(4) = pr.Chld4Label & ": from " & pr.Chld4From & " to less than " & pr.Chld4Max
                    End If
                End If
            End If

            fvInvoiceHead.DataSource = i
            fvInvoice.DataSource = i
            dlStayNew.DataSource = i
            dlStayNew.EditItemIndex = 0

            fvInvoiceHead.ChangeMode(FormViewMode.ReadOnly)
            fvInvoice.ChangeMode(FormViewMode.Edit)
            pnlDetail.Visible = True

            fvInvoiceHead.DataBind()
            fvInvoice.DataBind()
            dlStayNew.DataBind()
        ElseIf e.CommandName = "CancelCreate" Then
            Response.Redirect("~/Invoices/Invoices.aspx?")
        End If
    End Sub

    Protected Sub btnCreateInvoice_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCreateInvoice.Click
        Dim i As New dsInvoiceForm.NewInvoiceDataTable
        Dim r As dsInvoiceForm.NewInvoiceRow = i.NewNewInvoiceRow()
        r.HotelID = hfHotelID.Value
        r.TourOpID = hfTourOpID.Value
        r.InvType = hfInvType.Value
        r.CheckIn = hfCheckIn.Value
        r.CheckOut = hfCheckOut.Value
        r.InvDate = hfCheckOut.Value
        r.CreateUser = My.User.Name

        Dim txt As TextBox

        If r.InvType = 1 Then r.ResGroup = CType(fvInvoice.FindControl("txtGroupName"), TextBox).Text
        r.InvDate = CType(fvInvoice.FindControl("txtInvDate"), TextBox).Text
        txt = CType(fvInvoice.FindControl("txtInvRefText"), TextBox)
        If txt.Text <> "" Then r.InvRefText = txt.Text
        txt = CType(fvInvoice.FindControl("txtInvPrnText"), TextBox)
        If txt.Text <> "" Then r.InvPrnText = txt.Text
        txt = CType(fvInvoice.FindControl("txtInvComment"), TextBox)
        If txt.Text <> "" Then r.InvComment = txt.Text

        Dim dlr As DataListItem = dlStayNew.Items(0)
        r.DetText = CType(dlr.FindControl("sdn_DetText"), TextBox).Text
        r.RoomTypeID = CType(dlr.FindControl("sdn_RoomTypeId"), DropDownList).SelectedValue
        r.MealPlanID = CType(dlr.FindControl("sdn_MealPlanId"), DropDownList).SelectedValue

        txt = CType(dlr.FindControl("sdn_BookingDate"), TextBox)
        If txt.Text <> "" Then r.BookingDate = Date.Parse(txt.Text)
        txt = CType(dlr.FindControl("sdn_BookingVoucher"), TextBox)
        If txt.Text <> "" Then r.BookingVoucher = txt.Text
        txt = CType(dlr.FindControl("sdn_AdultNum"), TextBox)
        If txt.Text <> "" Then r.AdultNum = Int32.Parse(txt.Text) Else r.AdultNum = 0
        txt = CType(dlr.FindControl("sdn_Chld1Num"), TextBox)
        If txt.Text <> "" Then r.Chld1Num = Int32.Parse(txt.Text) Else r.Chld1Num = 0
        txt = CType(dlr.FindControl("sdn_Chld2Num"), TextBox)
        If txt.Text <> "" Then r.Chld2Num = Int32.Parse(txt.Text) Else r.Chld2Num = 0
        txt = CType(dlr.FindControl("sdn_Chld3Num"), TextBox)
        If txt.Text <> "" Then r.Chld3Num = Int32.Parse(txt.Text) Else r.Chld3Num = 0
        txt = CType(dlr.FindControl("sdn_Chld4Num"), TextBox)
        If txt.Text <> "" Then r.Chld4Num = Int32.Parse(txt.Text) Else r.Chld4Num = 0
        txt = CType(dlr.FindControl("sdn_RoomsNum"), TextBox)
        If txt.Text <> "" Then r.RoomsNum = Int32.Parse(txt.Text)

        i.AddNewInvoiceRow(r)

        Try
            Dim ta As New dsInvoiceFormTableAdapters.QueriesTableAdapter
            Dim InvoiceID As Integer = 0
            Dim BkDate

            If r.IsBookingDateNull Then BkDate = Nothing Else BkDate = r.BookingDate
            ta.InvoiceNew(r.HotelID, r.TourOpID, r.InvType, r.ResGroup, r.InvDate, r.CheckIn, r.CheckOut, _
                          r.InvRefText, r.InvPrnText, r.InvComment, r.CreateUser, r.DetText, BkDate, r.BookingVoucher, _
                          r.MealPlanID, r.RoomTypeID, r.RoomsNum, r.AdultNum, r.Chld1Num, r.Chld2Num, r.Chld3Num, r.Chld4Num, InvoiceID)

            Response.Redirect("~/Invoices/InvoiceForm.aspx?InvoiceID=" & InvoiceID)
        Catch ex As Exception
            Dim ErrMsg As String = "Error creating invoice:<br />" & ex.Message
            popShow("Error Creating Invoice", Nothing, ErrMsg)
        End Try
    End Sub

    Protected Sub btnCancelInvoice_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelInvoice.Click
        Response.Redirect("~/Invoices/InvoiceFormNew.aspx?")
    End Sub
End Class
