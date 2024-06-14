
Partial Class Invoices_ProFormas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        FormCookie()
    End Sub

    Protected Sub linkNew_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles linkNew.Click
        Response.Redirect("~/Invoices/ProFormaCreate.aspx?InvoiceID=0")
    End Sub

    Protected Sub btnGoTo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGoTo.Click
        If txtInvID.HasValue Then
            Dim q As New dsInvoicesTableAdapters.InvoiceTableAdapter
            Dim t As dsInvoices.InvoiceDataTable = q.GetDataByInvDocID(txtInvID.IntegerValue, "PRO")
            If t.Count > 0 Then
                Response.Redirect("~/Invoices/ProformaForm.aspx?InvoiceID=" & txtInvID.TextValue)
                Exit Sub
            Else
                txtInvID.ClearControl()
            End If
        End If
    End Sub

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        dsFilteredInvoices.FilterExpression = FilterString()
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
        ctrlInvNum.ClearControl()
        txtBkNum.Text = String.Empty
        ddlStates.SelectedIndex = 0
        cbCancel.Checked = False
    End Sub

    Protected Sub gvSearch_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvSearch.RowCommand
        If e.CommandName = "Details" Then Me.Response.Redirect("~/Invoices/ProformaForm.aspx?InvoiceID=" & e.CommandArgument)
    End Sub

    Protected Sub btFromRes_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btFromRes.Click
        Me.Response.Redirect("~/Invoices/ProFormaResCreate.aspx")
    End Sub

    Protected Sub btMultiple_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btMultiple.Click
        Me.Response.Redirect("~/Invoices/ProFormaResCreateAll.aspx")
    End Sub

    Protected Sub FormCookie()
        Dim cName As String = "Proformas$_" & Membership.GetUser.UserName
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
            Response.Cookies(cName).Expires = DateTime.Now.AddYears(1)
        End If
    End Sub

    Protected Function FilterString() As String
        Dim f As String = String.Empty

        If ctrlTourOp.SelectedTourOpKind = "1" Then f = "TourOp NOT LIKE '%GROUPS%'"
        If ctrlTourOp.SelectedTourOpKind = "2" Then f = "TourOp LIKE '%GROUPS%'"

        Return f
    End Function
End Class
