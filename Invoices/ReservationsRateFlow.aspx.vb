Imports System.Data
Imports System.Data.SqlClient

Partial Class Invoices_ReservationsRateFlow
    Inherits System.Web.UI.Page

    Protected Sub popShow(ByVal Title As String, ByVal Message As String)
        popLabel.Text = Title
        popMessage.Text = Message
        popExtender.Show()
    End Sub

    Protected Function AllEmpty() As Boolean
        Dim all As Boolean = True

        'If (ddlTO.SelectedValue <> "") Then all = False
        If Not (fltStart.Text = Nothing) Then all = False
        If Not (fltFinish.Text = Nothing) Then all = False
        If (cbHotel.SelectedValue <> "") Then all = False
        If (ddlRoomMap.SelectedValue <> "") Then all = False
        If Not (txtFolioFrom.Text = Nothing) Then all = False
        If Not (txtFolioTo.Text = Nothing) Then all = False
        If Not (txtName.Text = Nothing) Then all = False
        If Not (txtResGroup.Text = Nothing) Then all = False
        If Not (txtTO.Text = Nothing) Then all = False
        If Not (fltFinish.Text = Nothing) Then all = False
        If Not (fltStart.Text = Nothing) Then all = False
        If Not (fltBkDateFrom.Text = Nothing) Then all = False
        If Not (fltBkDateTo.Text = Nothing) Then all = False
        If Not (fltBkNumber.Text = Nothing) Then all = False

        Return all
    End Function

    Protected Sub btClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btClear.Click
        pnlCnt.Visible = False

        'ddlTO.SelectedValue = ""
        fltStart.Text = Nothing
        fltFinish.Text = Nothing

        cbHotel.SelectedValue = ""
        ddlRoomMap.SelectedValue = ""
        txtFolioFrom.Text = Nothing
        txtFolioTo.Text = Nothing
        txtName.Text = Nothing
        txtResGroup.Text = Nothing
        txtTO.Text = Nothing
        fltFinish.Text = Nothing
        fltStart.Text = Nothing
        fltBkDateFrom.Text = Nothing
        fltBkDateTo.Text = Nothing
        fltBkNumber.Text = Nothing
    End Sub

    Protected Sub btFilter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btFilter.Click
        If AllEmpty() Then
            popShow("Filter", "All parameters are empty!<br />Please,choose some of them!")
        Else
            Me.dsReservas.Select()
            DataList1.DataBind()
            If (DataList1.Items.Count > 0) Then
                pnlEmpty.Visible = False
                pnlCnt.Visible = True
            Else
                popShow("Filter", "No results for filter criteria or filter is too wide!")
            End If
        End If
    End Sub

    Protected Sub btnReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReport.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()
        Dim user As String = Membership.GetUser.UserName

        If AllEmpty() Then
            popShow("Report-layout", "All parameters are empty!<br />Please,choose some of them!")
        Else
            Try
                Dim lr As New Microsoft.Reporting.WebForms.LocalReport
                lr.ReportPath = "Reports\Invoices\RptResRateFlow.rdlc"
                lr.DataSources.Clear()
                'lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsRateFlow_SelectRateLogRes", dsReservas))
                lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsRateFlow_SelectRateLogRes", ReadData()))
                lr.Refresh()

                Dim fs As String = PFilterString()
                Dim pfilter As New ReportParameter("filterstring", fs)
                Dim photel As New ReportParameter("HRate", False)
                Dim p As ReportParameter() = {pfilter, photel}
                lr.SetParameters(p)
                bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)

                Response.ClearContent()
                Response.ClearHeaders()
                Response.ContentType = "application/excel"
                Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "ReservationsRateFlow.xls" + """")
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
        End If
    End Sub

    Protected Sub btnReportInOne_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReportInOne.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()
        Dim user As String = Membership.GetUser.UserName


        If AllEmpty() Then
            popShow("Report-layout", "All parameters are empty!<br />Please,choose some of them!")
        Else
            Try
                Dim lr As New Microsoft.Reporting.WebForms.LocalReport
                lr.ReportPath = "Reports\Invoices\RptResRateFlowInOne.rdlc"
                lr.DataSources.Clear()
                'lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsRateFlow_SelectRateLogRes", dsReservas))
                lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsRateFlow_SelectRateLogRes", ReadData()))
                lr.Refresh()

                Dim fs As String = PFilterString()
                Dim pfilter As New ReportParameter("filterstring", fs)
                Dim p As ReportParameter() = {pfilter}
                lr.SetParameters(p)
                bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)

                Response.ClearContent()
                Response.ClearHeaders()
                Response.ContentType = "application/excel"
                Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "ReservationsRateFlow.xls" + """")
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
                popShow("Report-rate match", m)
            End Try
        End If
    End Sub

    Protected Function ReadData() As DataTable
        Dim strSelect = "SELECT * FROM dbo.SelectRateLogRes(@HotelHID,@TourOpHID,@RoomTypeHID,@Name,@ResGroup,@CheckInFrom,@CheckInTo,@BkDateFrom,@BkDateTo,@BkNumber,@FolioFrom,@FolioTo) ORDER BY HotelHID, HotelID, TourOpHID, FolioFull"
        Dim p As String = "'"
        Dim pHotelHID As String = "NULL"
        Dim pTourOpHID As String = "NULL"
        Dim pRoomTypeHID As String = "NULL"
        Dim pName As String = "NULL"
        Dim pResGroup As String = "NULL"
        Dim pCheckInFrom As String = "NULL"
        Dim pCheckInTo As String = "NULL"
        Dim pBkDateFrom As String = "NULL"
        Dim pBkDateTo As String = "NULL"
        Dim pBkNumber As String = "NULL"
        Dim pFolioFrom As String = "NULL"
        Dim pFolioTo As String = "NULL"

        If cbHotel.SelectedValue <> "" Then pHotelHID = p & cbHotel.SelectedValue & p
        If txtTO.Text <> "" Then pTourOpHID = p & txtTO.Text & p
        If ddlRoomMap.SelectedValue <> "" Then pRoomTypeHID = p & ddlRoomMap.SelectedValue & p
        If txtName.Text <> "" Then pName = p & txtName.Text & p
        If txtResGroup.Text <> "" Then pResGroup = p & txtResGroup.Text & p
        If fltStart.Text <> "" Then pCheckInFrom = p & Format(Date.Parse(fltStart.Text), "yyyy-MM-dd") & p
        If fltFinish.Text <> "" Then pCheckInTo = p & Format(Date.Parse(fltFinish.Text), "yyyy-MM-dd") & p
        If fltBkDateFrom.Text <> "" Then pBkDateFrom = p & Format(Date.Parse(fltBkDateFrom.Text), "yyyy-MM-dd") & p
        If fltBkDateTo.Text <> "" Then pBkDateTo = p & Format(Date.Parse(fltBkDateTo.Text), "yyyy-MM-dd") & p
        If fltBkNumber.Text <> "" Then pBkNumber = p & fltBkNumber.Text & p
        If txtFolioFrom.Text <> "" Then pFolioFrom = txtFolioFrom.Text.Trim
        If txtFolioTo.Text <> "" Then pFolioTo = txtFolioTo.Text.Trim

        strSelect = strSelect.Replace("@HotelHID", pHotelHID)
        strSelect = strSelect.Replace("@TourOpHID", pTourOpHID)
        strSelect = strSelect.Replace("@RoomTypeHID", pRoomTypeHID)
        strSelect = strSelect.Replace("@Name", pName)
        strSelect = strSelect.Replace("@ResGroup", pResGroup)
        strSelect = strSelect.Replace("@CheckInFrom", pCheckInFrom)
        strSelect = strSelect.Replace("@CheckInTo", pCheckInTo)
        strSelect = strSelect.Replace("@BkDateFrom", pBkDateFrom)
        strSelect = strSelect.Replace("@BkDateTo", pBkDateTo)
        strSelect = strSelect.Replace("@BkNumber", pBkNumber)
        strSelect = strSelect.Replace("@FolioFrom", pFolioFrom)
        strSelect = strSelect.Replace("@FolioTo", pFolioTo)

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

    Protected Function PFilterString() As String
        Dim strFilter As String = ""

        If Not (cbHotel.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For hotel ", "/For hotel ") & cbHotel.SelectedItem.Text
        'If Not (ddlTO.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For tour operator ", "/For tour operator ") & ddlTO.SelectedItem.Text
        If Not (ddlRoomMap.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For Room map ", "/For Room map ") & ddlRoomMap.SelectedItem.Text
        If Not (txtResGroup.Text = Nothing) Then strFilter &= IIf(strFilter = "", "For res group ", "/For res group ") & txtResGroup.Text
        If Not (fltStart.Text = Nothing) Then strFilter &= IIf(strFilter = "", "Check In from ", "/Check In from ") & fltStart.Text
        If Not (fltFinish.Text = Nothing) Then strFilter &= IIf(strFilter = "", "Check In to ", "/Check In to ") & fltFinish.Text
        If Not (txtFolioFrom.Text = Nothing) Then strFilter &= IIf(strFilter = "", "From folio date ", "/From folio date ") & txtFolioFrom.Text
        If Not (txtFolioTo.Text = Nothing) Then strFilter &= IIf(strFilter = "", "To folio date ", "/To folio date ") & txtFolioTo.Text

        Return strFilter
    End Function
End Class
