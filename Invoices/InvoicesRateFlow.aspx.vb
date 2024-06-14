Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Data

Partial Class Invoices_InvoicesRateFlow
    Inherits System.Web.UI.Page

    Protected Sub popShow(ByVal Title As String, ByVal Message As String)
        popLabel.Text = Title
        popMessage.Text = Message
        popExtender.Show()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If My.User.IsInRole("hotel") Or My.User.IsInRole("hotel_report") Then
            cbHotel.Checked = True
            cbHotel.Visible = False
        End If
    End Sub

    Protected Sub btFilter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btFilter.Click
        'Me.dsReservas.Select()
        'DataList1.DataBind()
        Try
            pnlCnt.Visible = True
            DataList1.DataSource = ReadData()
            DataList1.DataBind()
        Catch ex As Exception
            Dim m As String = ""
            While ex IsNot Nothing
                m += ex.Message + "<br />"
                ex = ex.InnerException
            End While
            popShow("Report-layout", m)
        End Try
    End Sub

    Protected Function ReadData() As DataTable
        'Dim strSelect = "SELECT * FROM dbo.SelectRateLogInv(@HotelID,@TourOpID,@RoomTypeID,@Name,@ResGroup,@CheckInFrom,@CheckInTo,@CheckOutFrom,@CheckOutTo,@BkDateFrom,@BkDateTo,@BkNumber,@InvNumFrom,@InvNumTo) ORDER BY SortPriority, InvNumber, FolioFull"
        Dim strSelect = "SELECT * FROM dbo.SelectRateLogInv(@HotelID,@TourOpID,@RoomTypeID,@Name,@ResGroup,@CheckInFrom,@CheckInTo,@CheckOutFrom,@CheckOutTo,@BkDateFrom,@BkDateTo,@BkNumber,@InvNumFrom,@InvNumTo) "
        Dim p As String = "'"
        Dim pHotelID As String = "NULL"
        Dim pTourOpID As String = "NULL"
        Dim pRoomTypeID As String = "NULL"
        Dim pName As String = "NULL"
        Dim pResGroup As String = "NULL"
        Dim pCheckInFrom As String = "NULL"
        Dim pCheckInTo As String = "NULL"
        Dim pCheckOutFrom As String = "NULL"
        Dim pCheckOutTo As String = "NULL"
        Dim pBkDateFrom As String = "NULL"
        Dim pBkDateTo As String = "NULL"
        Dim pBkNumber As String = "NULL"
        Dim pInvNumFrom As String = "NULL"
        Dim pInvNumTo As String = "NULL"

        If ddlHotel.SelectedValue <> "" Then pHotelID = ddlHotel.SelectedValue
        If ddlTO.SelectedValue <> "" Then pTourOpID = ddlTO.SelectedValue
        If ddlRoomMap.SelectedValue <> "" Then pRoomTypeID = p & ddlRoomMap.SelectedValue & p
        If txtName.Text <> "" Then pName = p & txtName.Text & p
        If txtResGroup.Text <> "" Then pResGroup = p & txtResGroup.Text & p
        If fltStart.Text <> "" Then pCheckInFrom = p & Format(Date.Parse(fltStart.Text), "yyyy-MM-dd") & p
        If fltFinish.Text <> "" Then pCheckInTo = p & Format(Date.Parse(fltFinish.Text), "yyyy-MM-dd") & p
        If fltCkOutStart.Text <> "" Then pCheckOutFrom = p & Format(Date.Parse(fltCkOutStart.Text), "yyyy-MM-dd") & p
        If fltCkOutFinish.Text <> "" Then pCheckOutTo = p & Format(Date.Parse(fltCkOutFinish.Text), "yyyy-MM-dd") & p
        If fltStartBk.Text <> "" Then pBkDateFrom = p & Format(Date.Parse(fltStartBk.Text), "yyyy-MM-dd") & p
        If fltFinishBk.Text <> "" Then pBkDateTo = p & Format(Date.Parse(fltFinishBk.Text), "yyyy-MM-dd") & p
        If txtBkNum.Text <> "" Then pBkNumber = p & txtBkNum.Text & p
        If fltInvFrom.Text <> "" Then pInvNumFrom = fltInvFrom.Text.Trim
        If fltInvTo.Text <> "" Then pInvNumTo = fltInvTo.Text.Trim
        If cbSentFromHTL.Checked Then strSelect &= "WHERE [State]=4 "
        strSelect &= "ORDER BY SortPriority, InvNumber, FolioFull"

        strSelect = strSelect.Replace("@HotelID", pHotelID)
        strSelect = strSelect.Replace("@TourOpID", pTourOpID)
        strSelect = strSelect.Replace("@RoomTypeID", pRoomTypeID)
        strSelect = strSelect.Replace("@Name", pName)
        strSelect = strSelect.Replace("@ResGroup", pResGroup)
        strSelect = strSelect.Replace("@CheckInFrom", pCheckInFrom)
        strSelect = strSelect.Replace("@CheckInTo", pCheckInTo)
        strSelect = strSelect.Replace("@CheckOutFrom", pCheckOutFrom)
        strSelect = strSelect.Replace("@CheckOutTo", pCheckOutTo)
        strSelect = strSelect.Replace("@BkDateFrom", pBkDateFrom)
        strSelect = strSelect.Replace("@BkDateTo", pBkDateTo)
        strSelect = strSelect.Replace("@BkNumber", pBkNumber)
        strSelect = strSelect.Replace("@InvNumFrom", pInvNumFrom)
        strSelect = strSelect.Replace("@InvNumTo", pInvNumTo)

        'popShow("SELECT", strSelect)
        'MsgBox(strSelect)

        Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("csSMART_SQL").ConnectionString)
        Dim cmd As New SqlCommand
        Dim reader As SqlDataReader

        cmd.CommandText = strSelect
        cmd.CommandType = CommandType.Text
        cmd.Connection = conn

        conn.Open()

        reader = cmd.ExecuteReader()
        Dim dt As New DataTable
        dt.Load(reader)
        conn.Close()

        Return dt
    End Function

    Protected Sub btClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btClear.Click
        pnlCnt.Visible = False

        ddlHotel.SelectedIndex = 0
        ddlTO.SelectedIndex = 0
        ddlRoomMap.SelectedIndex = 0
        fltStart.Text = Nothing
        fltFinish.Text = Nothing
        fltCkOutStart.Text = Nothing
        fltCkOutFinish.Text = Nothing
        fltStartBk.Text = Nothing
        fltFinishBk.Text = Nothing
        txtName.Text = Nothing
        txtResGroup.Text = Nothing
    End Sub

    Protected Sub btnReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReport.Click
        Try
            Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
            Dim streamids As String() = Nothing
            Dim mimeType As String = Nothing
            Dim encoding As String = Nothing
            Dim extension As String = Nothing
            Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
            Dim bytes As Byte()
            Dim user As String = Membership.GetUser.UserName

            Dim lr As New Microsoft.Reporting.WebForms.LocalReport
            lr.ReportPath = "Reports\Invoices\RptResRateFlow.rdlc"

            lr.DataSources.Clear()
            lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsRateFlow_SelectRateLogRes", ReadData))
            lr.Refresh()

            Dim fs As String = PFilterString()
            Dim pfilter As New ReportParameter("filterstring", fs)
            Dim photel As New ReportParameter("HRate", cbHotel.Checked)
            Dim p As ReportParameter() = {pfilter, photel}
            lr.SetParameters(p)

            Response.ClearContent()
            Response.ClearHeaders()

            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "InvoicesRateFlow.xls" + """")
            Response.BinaryWrite(bytes)
            Response.Flush()
            'Response.Close()
            Response.End()
        Catch ex As Exception
            Dim m As String = ""
            While ex IsNot Nothing
                m += ex.Message + "<br />"
                ex = ex.InnerException
            End While
            popShow("Report-layout", m)
        End Try
    End Sub

    Protected Function PFilterString() As String
        Dim strFilter As String = ""

        strFilter &= "For " & IIf(ddlHotel.SelectedValue <> "", "hotel: " & ddlHotel.SelectedItem.Text, "all hotels")
        strFilter &= " AND for " & IIf(ddlTO.SelectedValue <> "", " tour operator: " & ddlTO.SelectedItem.Text, " all tour operators")
        strFilter &= " AND for " & IIf(ddlRoomMap.SelectedValue <> "", " room type: " & ddlRoomMap.SelectedItem.Text, " all room types")
        If txtName.Text <> "" Then strFilter &= " AND for guest name like: '" & txtName.Text & "'"
        If txtResGroup.Text <> "" Then strFilter &= " AND for reservation group like: '" & txtResGroup.Text & "'"
        If fltStart.Text <> "" Then strFilter &= " AND for check in from: " & Format(Date.Parse(fltStart.Text), "d")
        If fltFinish.Text <> "" Then strFilter &= " AND for check in to: " & Format(Date.Parse(fltFinish.Text), "d")
        If fltCkOutStart.Text <> "" Then strFilter &= " AND for check out from: " & Format(Date.Parse(fltCkOutStart.Text), "d")
        If fltCkOutFinish.Text <> "" Then strFilter &= " AND for check out to: " & Format(Date.Parse(fltCkOutFinish.Text), "d")
        If fltStartBk.Text <> "" Then strFilter &= " AND for booking date from: " & Format(Date.Parse(fltStartBk.Text), "d")
        If fltFinishBk.Text <> "" Then strFilter &= " AND for booking date to: " & Format(Date.Parse(fltFinishBk.Text), "d")
        If txtBkNum.Text <> "" Then strFilter &= " AND for booking number like: '" & txtBkNum.Text & "'"
        If fltInvFrom.Text <> "" Then strFilter &= " AND for invoice number from: " = fltInvFrom.Text.Trim
        If fltInvTo.Text <> "" Then strFilter &= " AND for invoice number to: " = fltInvTo.Text.Trim
        If cbSentFromHTL.Checked Then strFilter &= " AND for Sent from Hotel state only"

        Return strFilter
    End Function

    Protected Sub DataList1_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) 'Handles DataList1.PreRender
        Dim h As String = ""
        For Each r As DataListItem In DataList1.Items
            Dim l As Label = r.FindControl("lblHotelHead")
            If l IsNot Nothing Then
                If l.Text <> h Then
                    h = l.Text
                Else
                    l.Visible = False
                End If
            End If
        Next
    End Sub
End Class
