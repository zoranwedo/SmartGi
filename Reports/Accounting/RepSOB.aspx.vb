
Partial Class Reports_Accounting_RepSOB
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

            fltFinish.Text = Today.ToShortDateString
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

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Reports\Accounting\RptAccSOB_Mp_Mk_To.rdlc"
        dsSOB_Mp_Mk_To.DataBind()

        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("AgingBalance_AccRepSOB", dsSOB_Mp_Mk_To))
        lr.Refresh()

        Dim pdateFrom
        Dim pdateTo
        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim photel As New ReportParameter("hotel", Me.cbHotel.Checked)
        Dim fs As String = PFilterString()
        Dim pfilter As New ReportParameter("filterstring", fs)

        If Not (String.IsNullOrEmpty(fltStart.Text)) Then
            pdateFrom = New ReportParameter("dateFrom", Date.Parse(fltStart.Text))
        Else
            pdateFrom = New ReportParameter("dateFrom")
        End If

        If Not (String.IsNullOrEmpty(fltFinish.Text)) Then
            pdateTo = New ReportParameter("dateTo", Date.Parse(fltFinish.Text))
        Else
            pdateTo = New ReportParameter("dateTo")
        End If

        Dim p As ReportParameter() = {pdateFrom, pdateTo, puser, photel, pfilter}
        lr.SetParameters(p)

        Response.ClearContent()
        Response.ClearHeaders()

        If cbExcel.Checked Then
            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "SourceOfBussines.xls" + """")
        Else
            bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/pdf"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "SourceOfBussines.pdf" + """")
        End If

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Me.dsSOB_Mp_Mk_To.Select()
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        'pnlCnt.Visible = False
        fltStart.Text = Nothing
        fltFinish.Text = Nothing

        ddlMarkets.SelectedValue = ""
        ddlHotel.SelectedValue = ""
        ddlTO.SelectedValue = ""
        ddlHotelGroup.SelectedValue = ""
        ddlTOGroup.SelectedValue = ""
        ddlPay.SelectedValue = ""
    End Sub

    'Protected Sub ddlHotel_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlHotel.SelectedIndexChanged
    'If Not String.IsNullOrEmpty(ddlHotel.SelectedValue) Then
    '    If Int32.Parse(ddlHotel.SelectedValue) = -1 Then
    '        ddlHotelGroup.Enabled = True
    '    Else
    '        ddlHotelGroup.Enabled = False
    '    End If
    'Else
    '    ddlHotelGroup.Enabled = False
    'End If
    'End Sub

    'Protected Sub ddlTO_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlTO.SelectedIndexChanged
    'If Not String.IsNullOrEmpty(ddlTO.SelectedValue) Then
    '    Select Case Int32.Parse(ddlTO.SelectedValue)
    '        Case -1
    '            ddlTOGroup.Enabled = True
    '            ddlMarkets.Enabled = False
    '            ddlPay.Enabled = False
    '        Case -2
    '            ddlMarkets.Enabled = True
    '            ddlTOGroup.Enabled = False
    '            ddlPay.Enabled = False
    '        Case -3
    '            ddlPay.Enabled = True
    '            ddlTOGroup.Enabled = False
    '            ddlMarkets.Enabled = False
    '    End Select
    'Else
    '    ddlPay.Enabled = False
    '    ddlTOGroup.Enabled = False
    '    ddlMarkets.Enabled = False
    'End If
    'End Sub

    'Protected Sub cbHotel_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbHotel.CheckedChanged
    'dsSOB.DataBind()
    'GridView1.DataBind()
    'End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()
        Dim user As String = Membership.GetUser.UserName

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport

        If ddlHotel.SelectedValue = "" Then
            lr.ReportPath = "Reports\Accounting\RptAccSOB_TO.rdlc"
        Else
            lr.ReportPath = "Reports\Accounting\RptAccSOB_HTO.rdlc"
        End If

        dsSOB_Mp_Mk_To.DataBind()
        'dsFilteredInvoices.Select()
        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("ReportAccounting_AccRepSOB", dsSOB_Mp_Mk_To))
        lr.Refresh()

        Dim pdateFrom
        Dim pdateTo
        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim photel As New ReportParameter("hotel", Me.cbHotel.Checked)
        Dim fs As String = PFilterString()
        Dim pfilter As New ReportParameter("filterstring", fs)

        If Not (String.IsNullOrEmpty(fltStart.Text)) Then
            pdateFrom = New ReportParameter("dateFrom", Date.Parse(fltStart.Text))
        Else
            pdateFrom = New ReportParameter("dateFrom")
        End If

        If Not (String.IsNullOrEmpty(fltFinish.Text)) Then
            pdateTo = New ReportParameter("dateTo", Date.Parse(fltFinish.Text))
        Else
            pdateTo = New ReportParameter("dateTo")
        End If

        Dim p As ReportParameter() = {pdateFrom, pdateTo, puser, photel, pfilter}
        lr.SetParameters(p)

        Response.ClearContent()
        Response.ClearHeaders()

        If cbExcel.Checked Then
            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "SourceOfBussines.xls" + """")
        Else
            bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/pdf"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "SourceOfBussines.pdf" + """")
        End If

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Function PFilterString() As String
        Dim strFilter As String = ""

        strFilter = "Hotel: " & ddlHotel.SelectedItem.Text & " | " & _
                    "Hotel Group: " & ddlHotelGroup.SelectedItem.Text & " | " & _
                    "Tour Operator: " & ddlTO.SelectedItem.Text & " | " & _
                    "Tour Operator Group: " & ddlTOGroup.SelectedItem.Text & " | " & _
                    "Market: " & ddlMarkets.SelectedItem.Text & " | " & _
                    "Pay Condition: " & ddlPay.SelectedItem.Text

        If (cbPenalty.Checked) Then strFilter &= " | " & Chr(10) & Chr(13) & "Include Penalty"
        If (cbCorrections.Checked) Then strFilter &= " | " & Chr(10) & Chr(13) & "Include Corrections"

        Return strFilter
    End Function

    Protected Sub Button6_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button6.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()
        Dim user As String = Membership.GetUser.UserName

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Reports\Accounting\RptAccSOB_Mp_Htl_Mk.rdlc"
        dsSOB_Mp_Htl_Mk.DataBind()

        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("AgingBalance_AccRepSOB", dsSOB_Mp_Htl_Mk))
        lr.Refresh()

        Dim pdateFrom
        Dim pdateTo
        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim photel As New ReportParameter("hotel", Me.cbHotel.Checked)
        Dim fs As String = PFilterString()
        Dim pfilter As New ReportParameter("filterstring", fs)

        If Not (String.IsNullOrEmpty(fltStart.Text)) Then
            pdateFrom = New ReportParameter("dateFrom", Date.Parse(fltStart.Text))
        Else
            pdateFrom = New ReportParameter("dateFrom")
        End If

        If Not (String.IsNullOrEmpty(fltFinish.Text)) Then
            pdateTo = New ReportParameter("dateTo", Date.Parse(fltFinish.Text))
        Else
            pdateTo = New ReportParameter("dateTo")
        End If

        Dim p As ReportParameter() = {pdateFrom, pdateTo, puser, photel, pfilter}
        lr.SetParameters(p)

        Response.ClearContent()
        Response.ClearHeaders()

        If cbExcel.Checked Then
            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "SourceOfBussines.xls" + """")
        Else
            bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/pdf"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "SourceOfBussines.pdf" + """")
        End If

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Sub Button5_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button5.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()
        Dim user As String = Membership.GetUser.UserName

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Reports\Accounting\RptAccSOB_Mp_TO_HtlNew.rdlc"
        dsSOB_Mp_To_Htl.DataBind()

        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("AgingBalance_AccRepSOB", dsSOB_Mp_To_Htl))
        lr.Refresh()

        Dim pdateFrom
        Dim pdateTo
        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim photel As New ReportParameter("hotel", Me.cbHotel.Checked)
        Dim fs As String = PFilterString()
        Dim pfilter As New ReportParameter("filterstring", fs)

        If Not (String.IsNullOrEmpty(fltStart.Text)) Then
            pdateFrom = New ReportParameter("dateFrom", Date.Parse(fltStart.Text))
        Else
            pdateFrom = New ReportParameter("dateFrom")
        End If

        If Not (String.IsNullOrEmpty(fltFinish.Text)) Then
            pdateTo = New ReportParameter("dateTo", Date.Parse(fltFinish.Text))
        Else
            pdateTo = New ReportParameter("dateTo")
        End If

        Dim p As ReportParameter() = {pdateFrom, pdateTo, puser, photel, pfilter}
        lr.SetParameters(p)

        Response.ClearContent()
        Response.ClearHeaders()

        If cbExcel.Checked Then
            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "SourceOfBussines.xls" + """")
        Else
            bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/pdf"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "SourceOfBussines.pdf" + """")
        End If

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Sub Button7_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button7.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()
        Dim user As String = Membership.GetUser.UserName

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Reports\Accounting\RptAccSOB_Mp_Mk_HtlNew.rdlc"
        dsSOB_Mp_Mk_Htl.DataBind()

        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("AgingBalance_AccRepSOB", dsSOB_Mp_Mk_Htl))
        lr.Refresh()

        Dim pdateFrom
        Dim pdateTo
        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim photel As New ReportParameter("hotel", Me.cbHotel.Checked)
        Dim fs As String = PFilterString()
        Dim pfilter As New ReportParameter("filterstring", fs)

        If Not (String.IsNullOrEmpty(fltStart.Text)) Then
            pdateFrom = New ReportParameter("dateFrom", Date.Parse(fltStart.Text))
        Else
            pdateFrom = New ReportParameter("dateFrom")
        End If

        If Not (String.IsNullOrEmpty(fltFinish.Text)) Then
            pdateTo = New ReportParameter("dateTo", Date.Parse(fltFinish.Text))
        Else
            pdateTo = New ReportParameter("dateTo")
        End If

        Dim p As ReportParameter() = {pdateFrom, pdateTo, puser, photel, pfilter}
        lr.SetParameters(p)

        Response.ClearContent()
        Response.ClearHeaders()

        If cbExcel.Checked Then
            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "SourceOfBussines.xls" + """")
        Else
            bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/pdf"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "SourceOfBussines.pdf" + """")
        End If

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    Protected Sub Button8_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button8.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()
        Dim user As String = Membership.GetUser.UserName

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Reports\Accounting\RptAccSOB_CntRate.rdlc"
        dsSOB_Mp_Htl_Mk.DataBind()

        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("AgingBalance_AccRepSOB", dsSOB_CntRate))
        lr.Refresh()

        Dim pdateFrom
        Dim pdateTo
        Dim puser As New ReportParameter("user", Membership.GetUser.UserName)
        Dim photel As New ReportParameter("hotel", Me.cbHotel.Checked)
        Dim fs As String = PFilterString()
        Dim pfilter As New ReportParameter("filterstring", fs)

        If Not (String.IsNullOrEmpty(fltStart.Text)) Then
            pdateFrom = New ReportParameter("dateFrom", Date.Parse(fltStart.Text))
        Else
            pdateFrom = New ReportParameter("dateFrom")
        End If

        If Not (String.IsNullOrEmpty(fltFinish.Text)) Then
            pdateTo = New ReportParameter("dateTo", Date.Parse(fltFinish.Text))
        Else
            pdateTo = New ReportParameter("dateTo")
        End If

        Dim p As ReportParameter() = {pdateFrom, pdateTo, puser, photel, pfilter}
        lr.SetParameters(p)

        Response.ClearContent()
        Response.ClearHeaders()

        If cbExcel.Checked Then
            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "SourceOfBussines.xls" + """")
        Else
            bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/pdf"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "SourceOfBussines.pdf" + """")
        End If

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub
End Class
