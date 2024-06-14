
Partial Class Reports_Contracts_Supplements
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()

        Dim photel As New ReportParameter("hotel", Me.cbHotel.Checked)
        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Reports\Contracts\RptSupplements.rdlc"
        lr.DataSources.Clear()



        If cbHotel.Checked Then
            dsFilteredSupplementsH.Select()
            lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("CntReports_FilterSupplementRate1", dsFilteredSupplementsH))
        Else
            dsFilteredSupplements.Select()
            lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("CntReports_FilterSupplementRate1", dsFilteredSupplements))
        End If

        FilterString()


        Dim fs As String = PFilterString()
        Dim pfilter As New ReportParameter("filterstring", fs)
        Dim p As ReportParameter() = {photel, puser, pfilter}
        lr.SetParameters(p)

        'lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("Reports_SupplementDataReport", dsSupplement))

        lr.Refresh()

        If cbExcel.Checked Then
            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ClearContent()
            Response.ClearHeaders()
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Supplements List.xls" + """")

        Else
            bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ClearContent()
            Response.ClearHeaders()
            Response.ContentType = "application/pdf"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Supplements List.pdf" + """")
        End If

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        ddlHotel.SelectedValue = ""
        ddlMarkets.SelectedValue = ""
        ddlMealPlan.SelectedValue = ""
        ddlCategory.SelectedValue = ""
        ddlRateOption.SelectedValue = ""
        ddlRateTypeId.SelectedValue = ""
        ddlTO.SelectedValue = ""
        ddlRateType.SelectedValue = ""
        ddlRoomType.SelectedValue = ""
        fltStart.Text = Nothing
        fltFinish.Text = Nothing
        fltBkStart.Text = Nothing
        fltBkEnd.Text = Nothing
        fltTitle.Text = Nothing

    End Sub
    Protected Sub FilterString()
        Dim strFilter As String = String.Empty
        Dim strF1 As String = String.Empty
        Dim strF2 As String = String.Empty


        If Not cblReceived.Items(0).Selected Then
            If cblReceived.Items(1).Selected Then strF1 = "Created > RateRecieved"
            If cblReceived.Items(2).Selected Then strF2 = "RateRecieved > Start "

            If Not strF1 = String.Empty Then strFilter = strF1
            If Not strF2 = String.Empty Then strFilter &= IIf(strFilter = String.Empty, "", " AND ") & strF2

            Me.dsFilteredSupplements.FilterExpression = strFilter
        End If

    End Sub
    Protected Sub cblReceived_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cblReceived.SelectedIndexChanged
        'If cblReceived.Items(1).Selected Or cblReceived.Items(2).Selected Then
        '    cblReceived.Items(0).Selected = False
        'End If
        'pnlReceived.Update()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not (Page.IsPostBack) Then
            If ModificationRights.RightsHotel Then
                cbHotel.Checked = True
                cbHotel.Visible = False
            End If

            If ModificationRights.RightsOperatorReport Then
                cbHotel.Checked = False
                cbHotel.Visible = False
            End If
        End If
    End Sub
    Protected Function PFilterString() As String
        Dim strFilter As String = ""

        If Not (ddlHotel.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For hotel ", "|For hotel ") & ddlHotel.SelectedItem.Text & Chr(10) & Chr(13)
        If Not (ddlTO.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For tour operator ", "|For tour operator ") & ddlTO.SelectedItem.Text & Chr(10) & Chr(13)
        If Not (ddlMarkets.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For market ", "|For market ") & ddlMarkets.SelectedValue
        If Not (ddlMealPlan.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For meal plan  ", "|For meal plan  ") & ddlMealPlan.SelectedValue
        If Not (ddlRateOption.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For rate option ", "|For rate option ") & ddlRateOption.SelectedItem.Text
        If Not (ddlRateTypeId.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For rate code ", "|For rate code ") & ddlRateTypeId.SelectedItem.Text
        If Not (ddlRateType.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For rate type ", "|For rate type ") & ddlRateType.SelectedItem.Text
        If Not (ddlRoomType.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For room type ", "|For room type ") & ddlRoomType.SelectedItem.Text
        'If Not (ddlState.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For state ", "/For state ") & ddlState.SelectedItem.Text
        'If Not (ddlContract.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For contract ", "/For contract ") & ddlContract.SelectedValue

        If Not (fltStart.Text = Nothing) Then strFilter &= IIf(strFilter = "", "From date ", "|From date ") & fltStart.Text
        If Not (fltFinish.Text = Nothing) Then strFilter &= IIf(strFilter = "", "To date ", "|To date ") & fltFinish.Text
        If Not (fltBkStart.Text = Nothing) Then strFilter &= IIf(strFilter = "", "From booking date ", "|From booking date ") & fltBkStart.Text
        If Not (fltBkEnd.Text = Nothing) Then strFilter &= IIf(strFilter = "", "To booking date ", "|To booking date ") & fltBkEnd.Text
        If Not (fltCreated.Text = Nothing) Then strFilter &= IIf(strFilter = "", "For created date ", "|For created date ") & fltCreated.Text
        If Not (fltRateReceived.Text = Nothing) Then strFilter &= IIf(strFilter = "", "For rate received ", "|For rate received ") & fltRateReceived.Text
        'If Not (txtDescription.Text = Nothing) Then strFilter &= IIf(strFilter = "", "For description ", "/For description ") & txtDescription.Text

        Return strFilter
    End Function
End Class
