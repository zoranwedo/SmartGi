
Partial Class Proforma_ProformasNew
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        FormCookie()
    End Sub

    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        pnlCnt.Visible = False

        txtGroup.Text = String.Empty
        ctrlHotel.ClearControl()
        ctrlTourOp.ClearControl()
        ddlStates.SelectedIndex = 0
    End Sub

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        pnlCnt.Visible = True
        gvSearch.DataBind()
    End Sub

    Protected Sub btnGoTo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGoTo.Click
        If txtInvID.HasValue Then
            Dim q As New dsProformaTableAdapters.ProformaSearchTableAdapter
            Dim t As dsProforma.ProformaSearchDataTable = q.GetDataByID(txtInvID.IntegerValue)
            If t.Count > 0 Then
                Response.Redirect("~/Proforma/ProForm.aspx?ProformaID=" & txtInvID.TextValue)
            Else
                txtInvID.ClearControl()
            End If
        End If
    End Sub

    Protected Sub btnNew_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNew.Click
        Response.Redirect("~/Proforma/ProCreate.aspx")
    End Sub

    Protected Sub btmMulti_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btmMulti.Click
        Response.Redirect("~/Proforma/ProCreateGroupMulti.aspx")
    End Sub

    Protected Sub gvSearch_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvSearch.RowCommand
        If e.CommandName = "Details" Then Me.Response.Redirect("~/Invoices/ProformaForm.aspx?InvoiceID=" & e.CommandArgument)
    End Sub

    Public Function GetCheckDates(ByVal chFrom As String, ByVal chTo As String) As String
        Dim b As Integer = 0
        Dim r As String
        If Not String.IsNullOrEmpty(chFrom) Then b = b + 1
        If Not String.IsNullOrEmpty(chTo) Then b = b + 10

        Select Case b
            Case 0 : r = "<i>any</i>"
            Case 1 : r = String.Format("from {0}", chFrom)
            Case 10 : r = String.Format("to {0}", chTo)
            Case 11 : r = String.Format("{0} - {1}", chFrom, chTo)
            Case Else : r = "error"
        End Select

        Return r
    End Function

    Protected Sub FormCookie()
        Dim cName As String = "ProformasNew$_" & Membership.GetUser.UserName
        If (Request.Cookies(cName) IsNot Nothing) Then
            If Not Me.IsPostBack Then
                Try
                    If (Request.Cookies(cName)("txtGroup") IsNot Nothing) Then _
                        txtGroup.Text = Request.Cookies(cName)("txtGroup")
                    ctrlHotel.LoadCookie(cName)
                    ctrlTourOp.LoadCookie(cName)
                    If (Request.Cookies(cName)("ddlStates") IsNot Nothing) Then _
                        ddlStates.SelectedValue = Request.Cookies(cName)("ddlStates")
                Catch ex As Exception
                End Try
            End If
        End If

        If Me.IsPostBack Then
            Response.Cookies(cName)("txtGroup") = txtGroup.Text
            ctrlHotel.SaveCookie(cName)
            ctrlTourOp.SaveCookie(cName)
            Response.Cookies(cName)("ddlStates") = ddlStates.SelectedValue
            Response.Cookies(cName).Expires = DateTime.Now.AddYears(1)
        End If
    End Sub
End Class
