
Partial Class Invoices_ProFormaResCreateAll
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        FormCookie()
    End Sub

    Protected Sub FormCookie()
        Dim cName As String = "CreateProformaAll$_" & Membership.GetUser.UserName
        If (Request.Cookies(cName) IsNot Nothing) Then
            If Not Me.IsPostBack Then
                Try
                    ctrlHotel.CookieLoad(Request.Cookies(cName))
                    ctrlTourOp.CookieLoad(Request.Cookies(cName))
                    ctrlCheckIn.LoadCookie(cName)
                    ctrlCheckOut.LoadCookie(cName)
                    ctrlBooking.LoadCookie(cName)
                    If (Request.Cookies(cName)("txtBkNum") IsNot Nothing) Then txtBkNum.Text = Request.Cookies(cName)("txtBkNum")
                    If (Request.Cookies(cName)("txtResGroup") IsNot Nothing) Then txtResGroup.Text = Request.Cookies(cName)("txtResGroup")
                    If (Request.Cookies(cName)("cbOnProforma") IsNot Nothing) Then cbOnProforma.Checked = Request.Cookies(cName)("cbOnProforma")
                Catch ex As Exception
                End Try
            End If
        End If

        If Me.IsPostBack Then
            ctrlHotel.CookieSave(Response.Cookies(cName))
            ctrlTourOp.CookieSave(Response.Cookies(cName))
            ctrlCheckIn.SaveCookie(cName)
            ctrlCheckOut.SaveCookie(cName)
            ctrlBooking.SaveCookie(cName)
            Response.Cookies(cName)("txtBkNum") = txtBkNum.Text
            Response.Cookies(cName)("txtResGroup") = txtResGroup.Text
            Response.Cookies(cName)("cbOnProforma") = cbOnProforma.Checked.ToString
            Response.Cookies(cName).Expires = DateTime.Now.AddYears(1)
        End If

    End Sub

    Protected Sub btClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btClear.Click
        ctrlHotel.ClearControl()
        ctrlTourOp.ClearControl()
        ctrlCheckIn.ClearControl()
        ctrlCheckOut.ClearControl()
        ctrlBooking.ClearControl()
        txtBkNum.Text = String.Empty
        txtResGroup.Text = String.Empty
        cbOnProforma.Checked = False
        pnlCnt.Visible = False
    End Sub

    Protected Sub btFilter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btFilter.Click
        pnlCnt.Visible = True
        gvReservations.DataBind()
    End Sub

    Protected Sub dsFilteredReservation_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles dsFilteredReservation.Selecting
        Dim username As String = Membership.GetUser.UserName
        e.InputParameters("UserName") = username
    End Sub

    Protected Sub gvReservations_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvReservations.DataBound
        gvReservations.Columns(2).Visible = cbOnProforma.Checked
    End Sub

    Protected Sub btnCreate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btCreate.Click
        Dim qr As New dsPreInvoicesTableAdapters.QueriesTableAdapter
        qr.SetTimeout(2000)

        'Dim sessionID As String = Session.SessionID
        Dim sessionID As String = Guid.NewGuid().ToString()
        Dim userName As String = My.User.Name

        If (gvReservations.Rows.Count > 0) Then
            For Each grv As GridViewRow In gvReservations.Rows
                Dim cb As CheckBox = grv.FindControl("cbSelected")
                Dim hb As HiddenField = grv.FindControl("hbPreInvID")

                If cb.Checked Then
                    Try
                        qr.FillTmpProforma(sessionID, hb.Value, userName)
                    Catch ex As Exception
                        popShow(False, "Error Creating ProForma", ex.InnerException.Message)
                    End Try
                End If
            Next
            qr.ProFormaGenerateAll(sessionID, userName)
            Response.Redirect("~/Invoices/ProFormasGenerated.aspx?sessID=" & sessionID.ToString)
        End If
        'System.Threading.Thread.Sleep(10000)
    End Sub

    Protected Sub popShow(ByVal Question As Boolean, ByVal Title As String, ByVal Message As String)
        popMessage.Text = Message
        popLabel.Text = Title

        If Question Then
            btnYes.Visible = True
            btnNo.Text = "No"
        Else
            btnYes.Visible = False
            btnNo.Text = "OK"
        End If
        popExtender.Show()
    End Sub

End Class
