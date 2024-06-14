
Partial Class Reports_Accounting_HistoricalBatch
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not (Page.IsPostBack) Then
            If ModificationRights.RightsHotel Then
                cbHotel.Checked = True
                cbHotel.Visible = False
            ElseIf ModificationRights.RightsOperatorReport Then
                cbHotel.Checked = False
                cbHotel.Visible = False
            Else
                cbHotel.Visible = True
            End If

            fltStart.Text = Today.ToShortDateString
        End If
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()
        Dim user As String = Membership.GetUser.UserName
        Dim asdate As String = Nothing

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Reports\Accounting\RptHistoricalBatch.rdlc"

        'FilterString()


        'dsFilteredInvoices.Select()

        If Not (String.IsNullOrEmpty(fltStart.Text)) Then
            asdate = fltStart.Text
        End If

        lr.DataSources.Clear()

        ' If cbHotel.Checked Then
        'dsAccRepStatmentH.DataBind()
        'lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportAccounting_AccRepStatementOfAccount", dsAccRepStatmentH))
        'Else
        dsAccRepStatmentOld.DataBind()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportAccounting_AccRepStatementOfAccount", dsAccRepStatmentOld))
        ' End If

        dsAccAgedBalanceOld.DataBind()

        'lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportAccounting_AccRepAgingBalanceSum", dsAccAgedBalance))


        lr.Refresh()

        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim photel As New ReportParameter("hotel", Me.cbHotel.Checked)
        Dim pcanceled As New ReportParameter("canceled", Me.cbCancel.Checked)
        Dim ppayed As New ReportParameter("payed", Me.cbPayed.Checked)
        Dim pasdate As New ReportParameter("asoffdate", asdate)
        Dim fs As String = PFilterString(True)
        Dim pfilter As New ReportParameter("filterstring", fs)
        Dim par As New ReportParameter("ar", Me.cbAR.Checked)
        Dim pfl As New ReportParameter("fl", Me.cbFL.Checked)

        Dim p As ReportParameter() = {puser, photel, pcanceled, ppayed, pasdate, pfilter, par, pfl}
        lr.SetParameters(p)

        'Try
        Response.ClearContent()
        Response.ClearHeaders()

        If cbExcel.Checked Then
            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Account Statement.xls" + """")
        Else
            bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/pdf"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "Account Statement.pdf" + """")
        End If

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
        'Catch ex As Exception

        ' End Try

    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        pnlCnt.Visible = False

        fltStart.Text = Nothing
        ddlMarkets.SelectedValue = ""
        ddlHotel.SelectedValue = ""
        ddlTO.SelectedValue = ""
        ddlHotelGroup.SelectedValue = ""
        ddlTOGroup.SelectedValue = ""
        ddlPay.SelectedValue = ""
    End Sub

    Protected Sub ddlHotel_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlHotel.SelectedIndexChanged

    End Sub

    Protected Sub ddlTO_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlTO.SelectedIndexChanged


    End Sub

    Protected Function PFilterString(ByRef basic As Boolean) As String
        Dim strFilter As String = ""

        'If Not (ddlHotel.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For hotel ", "|For hotel ") & ddlHotel.SelectedItem.Text & Chr(10) & Chr(13)
        If Not (ddlMarkets.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For market ", "|For market ") & ddlMarkets.SelectedItem.Text
        If Not (ddlTO.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For tour operator ", "|For tour operator ") & ddlTO.SelectedItem.Text & Chr(10) & Chr(13)
        If Not (ddlHotelGroup.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For hotel group ", "|For hotel group ") & ddlHotelGroup.SelectedItem.Text
        If Not (ddlTOGroup.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For TO group ", "|For TO group ") & ddlTOGroup.SelectedItem.Text
        If basic Then
            If Not (ddlAccType.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For acc type ", "|For acc type ") & ddlAccType.SelectedValue
            If (cbAR.Checked) Then strFilter &= IIf(strFilter = "", " With AR", "|With AR")
            If (cbFL.Checked) Then
                If (cbAR.Checked) Then
                    strFilter &= " And FL"
                Else : strFilter &= IIf(strFilter = "", " With FL", "|With FL")
                End If
            End If

        End If

        'If Not (ddlOptions.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For option ", "/For option ") & ddlOptions.SelectedItem.Text

        If Not (ddlPay.SelectedValue = "") Then strFilter &= IIf(strFilter = "", "For pay ", "|For pay ") & ddlPay.SelectedItem.Text

        Return strFilter
    End Function

    Protected Sub FilterString()
        'Dim strFilter As String = String.Empty

        'If ddlAccType.SelectedValue <> Nothing And Not String.IsNullOrEmpty(ddlAccType.SelectedValue) Then
        '    strFilter = "AccountTypeID =  '" & ddlAccType.SelectedValue & "'"
        'End If

        'If Not String.IsNullOrEmpty(strFilter) Then
        '    dsAccRepStatment.FilterExpression = strFilter
        '    dsAccRepStatmentBk.FilterExpression = strFilter
        'End If

    End Sub

End Class
