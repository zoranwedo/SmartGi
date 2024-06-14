
Partial Class Reports_Accounting_RepSeniorFilter
    Inherits System.Web.UI.Page
    Private Const cGross As String = "Gross Turnover"
    Private Const cAdjustments As String = "Adjustments"
    Private Const cNet As String = "Net Turnover"

    Private TotalHotels As Decimal() = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}

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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not (Page.IsPostBack) Then
            hfReport.Value = 0
            btPrint.Visible = False
            pnlRpt.Visible = False
            btGross.Text = cGross
            btAdjustments.Text = cAdjustments
            btNet.Text = cNet
        End If
    End Sub

    Protected Sub btGross_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btGross.Click
        gvSeniorFilter.DataBind()
        hfReport.Value = 1
        pnlRpt.Visible = True
        btPrint.Text = "Print " & cGross
        btPrint.Visible = True
        lbSenior.Text = cGross
        gvSeniorFilter.DataSourceID = "dsFilterGross"
        dsFilterGross.DataBind()
    End Sub

    Protected Sub btAdjustments_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btAdjustments.Click
        hfReport.Value = 2
        pnlRpt.Visible = True
        btPrint.Text = "Print " & cAdjustments
        btPrint.Visible = True
        lbSenior.Text = cAdjustments
        gvSeniorFilter.DataSourceID = "dsFilterAdjustments"
        dsFilterAdjustments.DataBind()
    End Sub

    Protected Sub btNet_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btNet.Click
        hfReport.Value = 3
        pnlRpt.Visible = True
        btPrint.Text = "Print " & cNet
        btPrint.Visible = True
        lbSenior.Text = cNet
        gvSeniorFilter.DataSourceID = "dsFilterNet"
        dsFilterNet.DataBind()
    End Sub

    Protected Sub gvSeniorFilter_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvSeniorFilter.RowDataBound
        If e.Row.RowType = DataControlRowType.Header Then
            TotalHotels = New Decimal() {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
        ElseIf e.Row.RowType = DataControlRowType.DataRow Then
            For i = 1 To 24
                If DataBinder.Eval(e.Row.DataItem, i.ToString) IsNot DBNull.Value Then
                    TotalHotels(i) += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, i.ToString))
                End If
            Next
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            ' If row type is footer, show calculated total value
            ' Since this example uses sales in dollars, I formatted output as currency
            For i = 1 To 24 Step 2
                e.Row.Cells(i).Text = String.Format("{0:N2}", TotalHotels((i + 1) / 2))
                e.Row.Cells(i + 1).Text = String.Format("{0:N2}", TotalHotels((i + 1) / 2 + 12))
            Next
        End If
    End Sub

    Protected Sub btPrint_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btPrint.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()
        Dim user As String = Membership.GetUser.UserName
        Dim fname As String = "Senior.xls"

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        Select Case hfReport.Value
            Case 1
                lr.ReportPath = "Reports\Accounting\RptSeniorGross.rdlc"
                lr.DataSources.Clear()
                lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsSeniorRpt_AccRptSeniorGross", dsFilterGross))
                lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsSeniorRpt_AccRptSeniorGrossDet", dsFilterGrossDet))
                fname = cGross & IIf(cbCompare.Checked, "(compared)", "") & ".xls"
            Case 2
                lr.ReportPath = "Reports\Accounting\RptSeniorAdjustments.rdlc"
                lr.DataSources.Clear()
                lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsSeniorRpt_AccRptSeniorAdjustments", dsFilterAdjustments))
                lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsSeniorRpt_AccRptSeniorAdjInGross", dsFilteAdjInGross))
                lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsSeniorRpt_AccRptSeniorAdjustmentsDet", dsFilterAdjustmentsDet))
                fname = cAdjustments & " " & IIf(cbCompare.Checked, "(compared)", "") & ".xls"
            Case 3
                lr.ReportPath = "Reports\Accounting\RptSeniorNet.rdlc"
                lr.DataSources.Clear()
                lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsSeniorRpt_AccRptSeniorNet", dsFilterNet))
                fname = cNet & IIf(cbCompare.Checked, "(compared)", "") & ".xls"
        End Select

        Dim pUser As New ReportParameter("pUser", Membership.GetUser.UserName)
        Dim pYear As New ReportParameter("pYear", Year(txtDocDateTo.Text))
        Dim pCompare As New ReportParameter("pCompare", Me.cbCompare.Checked)
        Dim pFilter As New ReportParameter("pFilter", pFilterString)
        Dim p As ReportParameter() = {pUser, pYear, pCompare, pFilter}
        lr.SetParameters(p)

        Response.ClearContent()
        Response.ClearHeaders()

        bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
        Response.ContentType = "application/excel"
        Response.AppendHeader("Content-Disposition", "attachment; filename=""" & fname & "")

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Sub dsFilter_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles dsFilterGross.Selecting, dsFilterAdjustments.Selecting, dsFilteAdjInGross.Selecting, dsFilterNet.Selecting, dsFilterGrossDet.Selecting, dsFilterAdjustmentsDet.Selecting
        If e.InputParameters("HotelGroupId") = 0 Then e.InputParameters("HotelGroupId") = Nothing
        If e.InputParameters("HotelID") = 0 Then e.InputParameters("HotelID") = Nothing
        If e.InputParameters("TourOpGroupId") = 0 Then e.InputParameters("TourOpGroupId") = Nothing
        If e.InputParameters("TourOpId") = 0 Then e.InputParameters("TourOpId") = Nothing

        If Year(txtDocDateFrom.Text) <> Year(txtDocDateTo.Text) Then
            popShow("Seniro Reports Filter", Nothing, "Document dates have to be in the same year.")
            pnlRpt.Visible = False
            btPrint.Visible = False
            e.Cancel = True
        End If
    End Sub

    Protected Function pFilterString() As String
        Dim strFilter As String = ""

        strFilter = "For " & IIf(ddlHotelGroup.SelectedItem.Text = "all", "all hotel groups", "hotel group: " & ddlHotelGroup.SelectedItem.Text)
        strFilter &= " AND for " & IIf(ddlHotel.SelectedItem.Text = "all", "all hotels", "hotel: " & ddlHotel.SelectedItem.Text)
        strFilter &= " AND for " & IIf(ddlTOGroup.SelectedItem.Text = "all", "all tour operator groups", "tour operator groups: " & ddlTOGroup.SelectedItem.Text)
        strFilter &= " AND for " & IIf(ddlTO.SelectedItem.Text = "all", "all tour operators", "tour operator: " & ddlTO.SelectedItem.Text)
        strFilter &= " AND for " & IIf(ddlMarket.SelectedItem.Text = "all", "all markets", "markets: " & ddlMarket.SelectedItem.Text)
        strFilter &= " AND for " & IIf(ddlPayCond.SelectedItem.Text = "all", "all pay conditions", "pay condition:" & ddlPayCond.SelectedItem.Text)
        strFilter &= " AND for documents between " & txtDocDateFrom.Text & " AND  " & txtDocDateTo.Text

        Return strFilter
    End Function

End Class
