
Partial Class Reports_Accounting_RepSenior
    Inherits System.Web.UI.Page
    Private Const cGross As String = "Gross Turnover"
    Private Const cAdjustments As String =  "Adjustments"
    Private Const cNet As String= "Net Turnover"

    Private TotalAzules As Decimal() = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
    Private TotalDorados As Decimal() = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not (Page.IsPostBack) Then
            For i = Year(Now) To 2011 Step -1
                Dim y As New ListItem(i.ToString, i)
                ddlYear.Items.Add(y)
            Next
            hfReport.Value = 0
            btPrint.Visible = False
            pnlRpt.Visible = False
            btGross.Text = cGross
            btAdjustments.Text = cAdjustments
            btNet.Text = cNet
        End If
    End Sub

    Protected Sub btGross_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btGross.Click
        gvAzules.DataSourceID = "dsGrossAzules"
        gvDorados.DataSourceID = "dsGrossDorados"
        dsGrossAzules.DataBind()
        dsGrossDorados.DataBind()
        hfReport.Value = 1
        pnlRpt.Visible = True
        btPrint.Text = "Print " & cGross
        btPrint.Visible = True
        lbSenior.Text = cGross & " for " & ddlYear.SelectedValue.ToString
    End Sub

    Protected Sub btAdjustments_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btAdjustments.Click
        gvAzules.DataSourceID = "dsAdjustmentAzules"
        gvDorados.DataSourceID = "dsAdjustmentDorados"
        dsAdjustmentAzules.DataBind()
        dsAdjustmentDorados.DataBind()
        hfReport.Value = 2
        pnlRpt.Visible = True
        btPrint.Text = "Print " & cAdjustments
        btPrint.Visible = True
        lbSenior.Text = cAdjustments & " for " & ddlYear.SelectedValue.ToString
    End Sub

    Protected Sub btNet_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btNet.Click
        gvAzules.DataSourceID = "dsNetAzules"
        gvDorados.DataSourceID = "dsNetDorados"
        dsNetAzules.DataBind()
        dsNetDorados.DataBind()
        hfReport.Value = 3
        pnlRpt.Visible = True
        btPrint.Text = "Print " & cNet
        btPrint.Visible = True
        lbSenior.Text = cNet & " for " & ddlYear.SelectedValue.ToString
    End Sub

    Protected Sub gvAzules_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvAzules.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            For i = 1 To 24
                If DataBinder.Eval(e.Row.DataItem, i.ToString) IsNot DBNull.Value Then
                    TotalAzules(i) += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, i.ToString))
                End If
            Next
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            ' If row type is footer, show calculated total value
            ' Since this example uses sales in dollars, I formatted output as currency
            For i = 1 To 24 Step 2
                e.Row.Cells(i).Text = String.Format("{0:N2}", TotalAzules((i + 1) / 2))
                e.Row.Cells(i + 1).Text = String.Format("{0:N2}", TotalAzules((i + 1) / 2 + 12))
            Next
        End If
    End Sub

    Protected Sub gvDorados_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvDorados.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            For i = 1 To 24
                If DataBinder.Eval(e.Row.DataItem, i.ToString) IsNot DBNull.Value Then
                    TotalDorados(i) += Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, i.ToString))
                End If
            Next
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            ' If row type is footer, show calculated total value
            ' Since this example uses sales in dollars, I formatted output as currency
            For i = 1 To 24 Step 2
                e.Row.Cells(i).Text = String.Format("{0:N2}", TotalDorados((i + 1) / 2))
                e.Row.Cells(i + 1).Text = String.Format("{0:N2}", TotalDorados((i + 1) / 2 + 12))
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
                lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsSeniorRpt_AccRptSeniorGross", dsGross))
                lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsSeniorRpt_AccRptSeniorGrossDet", dsGrossDet))
                fname = cGross & " " & ddlYear.SelectedValue.ToString & IIf(cbCompare.Checked, "(compared)", "") & ".xls"
            Case 2
                lr.ReportPath = "Reports\Accounting\RptSeniorAdjustments.rdlc"
                lr.DataSources.Clear()
                lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsSeniorRpt_AccRptSeniorAdjustments", dsAdjustment))
                lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsSeniorRpt_AccRptSeniorAdjInGross", dsAdjInGross))
                lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsSeniorRpt_AccRptSeniorAdjustmentsDet", dsAdjustmentDet))
                fname = cAdjustments & " " & ddlYear.SelectedValue.ToString & IIf(cbCompare.Checked, "(compared)", "") & ".xls"
            Case 3
                lr.ReportPath = "Reports\Accounting\RptSeniorNet.rdlc"
                lr.DataSources.Clear()
                lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsSeniorRpt_AccRptSeniorNet", dsNet))
                fname = cNet & " " & ddlYear.SelectedValue.ToString & IIf(cbCompare.Checked, "(compared)", "") & ".xls"
        End Select

        Dim pUser As New ReportParameter("pUser", Membership.GetUser.UserName)
        Dim pYear As New ReportParameter("pYear", Me.ddlYear.SelectedValue)
        Dim pCompare As New ReportParameter("pCompare", Me.cbCompare.Checked)
        Dim pFilter As New ReportParameter("pFilter", "January - December")
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
End Class
