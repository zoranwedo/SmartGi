
Partial Class Proforma_ProformasSingle
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        FormCookie()
    End Sub

    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        pnlCnt.Visible = False

        ctrlHotel.ClearControl()
        ctrlTourOp.ClearControl()
        ctrlCheckIn.ClearControl()
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
                Response.Redirect("~/Proforma/ProformDetails.aspx?ProformaID=" & txtInvID.TextValue)
            Else
                txtInvID.ClearControl()
            End If
        End If
    End Sub

    Protected Sub btnNew_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNew.Click
        Response.Redirect("~/Proforma/ProCreateSingle.aspx")
    End Sub

    Protected Sub gvSearch_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvSearch.RowCommand
        If e.CommandName = "Details" Then Me.Response.Redirect("~/Invoices/ProformDetails.aspx?InvoiceID=" & e.CommandArgument)
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
        Dim cName As String = "ProformasSingle$_" & Membership.GetUser.UserName
        If (Request.Cookies(cName) IsNot Nothing) Then
            If Not Me.IsPostBack Then
                Try
                    ctrlHotel.CookieLoad(Request.Cookies(cName))
                    ctrlTourOp.CookieLoad(Request.Cookies(cName))
                    ctrlCheckIn.LoadCookie(cName)
                    If (Request.Cookies(cName)("ddlStates") IsNot Nothing) Then _
                        ddlStates.SelectedValue = Request.Cookies(cName)("ddlStates")
                Catch ex As Exception
                End Try
            End If
        End If

        If Me.IsPostBack Then
            ctrlHotel.CookieSave(Response.Cookies(cName))
            ctrlTourOp.CookieSave(Response.Cookies(cName))
            ctrlCheckIn.SaveCookie(cName)
            Response.Cookies(cName)("ddlStates") = ddlStates.SelectedValue
            Response.Cookies(cName).Expires = DateTime.Now.AddYears(1)
        End If
    End Sub

End Class
