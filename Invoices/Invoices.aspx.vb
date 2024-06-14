Imports System.Data
Imports App_UserControls_MessagePop

Partial Class Invoices_Invoices
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        FormCookie()

        If ModificationRights.RightsHotel Then
            cbHotel.Checked = True
            cbHotel.Visible = False
        Else
            cbHotel.Visible = True
        End If
    End Sub

    Protected Sub linkNew_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles linkNew.Click
        Response.Redirect("~/Invoices/InvoiceFormNew.aspx")
    End Sub

    Protected Sub btnGoTo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGoTo.Click
        If txtInvID.HasValue Then
            Dim q As New dsCRSTableAdapters.QueriesTableAdapter
            Dim s = q.CheckInvoice(txtInvID.IntegerValue)
            If s = "SH" Then
                Response.Redirect("~/Invoices/InvoiceForm.aspx?InvoiceID=" & txtInvID.TextValue)
            ElseIf s = "SX" Or s = "OP" Then
                Response.Redirect("~/Invoices/InvoiceFormSX.aspx?InvoiceID=" & txtInvID.TextValue)
            Else
                txtInvID.ClearControl()
            End If
        End If
    End Sub

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        'dsFilteredInvoices.FilterExpression = FilterString()
        dsFilteredInvoices.Select()
        pnlCnt.Visible = True
    End Sub

    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        pnlCnt.Visible = False

        txtInvID.ClearControl()
        ctrlHotel.ClearControl()
        ctrlTourOp.ClearControl()
        ddlInvType.SelectedIndex = 0
        ctrlCheckIn.ClearControl()
        ctrlCheckOut.ClearControl()
        ctrlInvNum.ClearControl()
        txtBkNum.Text = String.Empty
        ddlStates.SelectedIndex = 0
        cbCancel.Checked = False
        cbDelivered.Checked = True
    End Sub

    Protected Sub gvSearch_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvSearch.RowCommand
        If e.CommandName = "DetailsSH" Then Me.Response.Redirect("~/Invoices/InvoiceForm.aspx?InvoiceID=" & e.CommandArgument)
        If e.CommandName = "DetailsSX" Then Me.Response.Redirect("~/Invoices/InvoiceFormSX.aspx?InvoiceID=" & e.CommandArgument)
    End Sub

    Protected Sub cbHotel_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbHotel.CheckedChanged
        gvSearch.DataBind()
    End Sub

    Protected Sub FormCookie()
        Dim cName As String = "Invoices$_" & Membership.GetUser.UserName
        If (Request.Cookies(cName) IsNot Nothing) Then
            If Not Me.IsPostBack Then
                Try
                    ctrlHotel.CookieLoad(Request.Cookies(cName))
                    ctrlTourOp.CookieLoad(Request.Cookies(cName))
                    If (Request.Cookies(cName)("ddlInvType") IsNot Nothing) Then ddlInvType.SelectedValue = Request.Cookies(cName)("ddlInvType")
                    ctrlCheckIn.LoadCookie(cName)
                    ctrlInvNum.LoadCookie(cName)
                    If (Request.Cookies(cName)("txtBkNum") IsNot Nothing) Then txtBkNum.Text = Request.Cookies(cName)("txtBkNum")
                    If (Request.Cookies(cName)("ddlStates") IsNot Nothing) Then ddlStates.SelectedValue = Request.Cookies(cName)("ddlStates")
                    If (Request.Cookies(cName)("cbCancel") IsNot Nothing) Then cbCancel.Checked = Request.Cookies(cName)("cbCancel")
                    If (Request.Cookies(cName)("cbDelivered") IsNot Nothing) Then cbDelivered.Checked = Request.Cookies(cName)("cbDelivered")
                Catch ex As Exception
                End Try
            End If
        End If

        If Me.IsPostBack Then
            ctrlHotel.CookieSave(Response.Cookies(cName))
            ctrlTourOp.CookieSave(Response.Cookies(cName))
            Response.Cookies(cName)("ddlInvType") = ddlInvType.SelectedValue
            ctrlCheckIn.SaveCookie(cName)
            ctrlInvNum.SaveCookie(cName)
            Response.Cookies(cName)("txtBkNum") = txtBkNum.Text
            Response.Cookies(cName)("ddlStates") = ddlStates.SelectedValue
            Response.Cookies(cName)("cbCancel") = cbCancel.Checked.ToString
            Response.Cookies(cName)("cbDelivered") = cbDelivered.Checked.ToString
            Response.Cookies(cName).Expires = DateTime.Now.AddYears(1)
        End If
    End Sub

    Protected Function FilterString() As String
        Dim f As New List(Of String)

        If ctrlTourOp.SelectedTourOpKind = "1" Then f.Add("TourOp NOT LIKE '%GROUP%'")
        If ctrlTourOp.SelectedTourOpKind = "2" Then f.Add("TourOp LIKE '%GROUP%'")
        If Not String.IsNullOrEmpty(ctrlCheckOut.DateFrom) Then f.Add(String.Format("CheckOut >= '{0:yyyy-MM-dd}'", Date.Parse(ctrlCheckOut.DateFrom)))
        If Not String.IsNullOrEmpty(ctrlCheckOut.DateTo) Then f.Add(String.Format("CheckOut <= '{0:yyyy-MM-dd}'", Date.Parse(ctrlCheckOut.DateTo)))

        Return String.Join(" AND ", f.ToArray)
    End Function

    Protected Function FilterParam() As DataTable
        Dim pt As New dsParams.ParamTableDataTable

        If ctrlHotel.SelectedHotel <> String.Empty Then
            pt.AddParamTableRow("Hotel", ctrlHotel.SelectedHotelItem.Text)
        ElseIf ctrlHotel.SelectedHotelGroup <> String.Empty Then
            pt.AddParamTableRow("Hotel Group", ctrlHotel.SelectedHotelGroupItem.Text)
        End If

        If ctrlTourOp.SelectedTourOp <> String.Empty Then
            pt.AddParamTableRow("Tour Operator", ctrlTourOp.SelectedTourOpItem.Text)
        Else
            If ctrlTourOp.SelectedTourOpKind <> String.Empty Then pt.AddParamTableRow("Tour Op. Kind", ctrlTourOp.SelectedTourOpKindItem.Text)
            If ctrlTourOp.SelectedTourOpGroup <> String.Empty Then pt.AddParamTableRow("Tour Op. Group", ctrlTourOp.SelectedTourOpGroupItem.Text)
            If ctrlTourOp.SelectedMarket <> String.Empty Then pt.AddParamTableRow("Market", ctrlTourOp.SelectedMarketItem.Text)
            If ctrlTourOp.SelectedPayCond <> String.Empty Then pt.AddParamTableRow("Pay Condition", ctrlTourOp.SelectedPayCondItem.Text)
        End If

        If ddlInvType.SelectedIndex > 0 Then pt.AddParamTableRow("Invoice Type", ddlInvType.SelectedItem.Text)
        If ctrlCheckIn.DateFrom <> String.Empty Then pt.AddParamTableRow("Checkin From", ctrlCheckIn.DateFrom)
        If ctrlCheckIn.DateTo <> String.Empty Then pt.AddParamTableRow("Checkin To", ctrlCheckIn.DateTo)
        If ctrlCheckOut.DateFrom <> String.Empty Then pt.AddParamTableRow("Checkout From", ctrlCheckOut.DateFrom)
        If ctrlCheckOut.DateTo <> String.Empty Then pt.AddParamTableRow("Checkout To", ctrlCheckOut.DateTo)
        If ctrlInvNum.IntegerFrom <> String.Empty Then pt.AddParamTableRow("No. From", ctrlInvNum.IntegerFrom)
        If ctrlInvNum.IntegerTo <> String.Empty Then pt.AddParamTableRow("No. To", ctrlInvNum.IntegerTo)
        If txtBkNum.Text <> String.Empty Then pt.AddParamTableRow("Bk. Num contains", txtBkNum.Text)
        If ddlStates.SelectedIndex > 0 Then pt.AddParamTableRow("Invoice State", ddlStates.SelectedItem.Text)
        pt.AddParamTableRow("", IIf(cbCancel.Checked, "Include ", "Exclude ") & "cancelled")
        pt.AddParamTableRow("", IIf(cbDelivered.Checked, "Include ", "Exclude ") & "delivered")
        pt.AcceptChanges()

        Return pt
    End Function

    Protected Sub btReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btReport.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Invoices\Invoices.rdlc"
        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsParams_ParamTable", FilterParam()))
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsCRS_FilterUserInvoiceNew", dsFilteredInvoices))
        dsFilteredInvoices.FilterExpression = FilterString()

        Dim p As ReportParameter() = {New ReportParameter("user", My.User.Name), New ReportParameter("hotel", cbHotel.Checked)}
        lr.SetParameters(p)

        Try
            Response.ClearContent()
            Response.ClearHeaders()

            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""Invoices.xls""")

            Response.BinaryWrite(bytes)
            Response.Flush()
            'Response.Close()
            Response.End()
        Catch ex As Exception
            msgPop.ShowError(ex)
        End Try

    End Sub
End Class
