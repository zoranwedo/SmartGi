
Partial Class Maintenance_Admin_Admin
    Inherits System.Web.UI.Page
    'Public uname As String = "admin"
    'Public upage As Integer = 0
    'Public uindex As Integer = 0

    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        fltName.Text = Nothing
    End Sub

    Protected Sub btnNew_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNew.Click
        Response.Redirect("~/Maintenance/Admin/CreateUser.aspx", True)
    End Sub

    Protected Sub gvUsers_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvUsers.RowCommand
        'MsgBox(e.CommandName)
        If e.CommandName = "Details" Then
            Me.Response.Redirect("~/Maintenance/Admin/User.aspx?username=" & e.CommandArgument)
        ElseIf e.CommandName = "DeleteUser" Then
            Try
                System.Web.Security.Membership.DeleteUser(e.CommandArgument, True)
                fltName.Text = Nothing
                gvUsers.DataBind()
            Catch ex As Exception
                popShow(False, "Error deleting User", ex.InnerException.Message)
            End Try
        ElseIf e.CommandName = "Enable" Then
            Dim userName As String = e.CommandArgument
            Dim SelectedUser As System.Web.Security.MembershipUser

            SelectedUser = System.Web.Security.Membership.GetUser(userName)
            SelectedUser.IsApproved = True
            System.Web.Security.Membership.UpdateUser(SelectedUser)
            gvUsers.DataBind()
        ElseIf e.CommandName = "Dissable" Then
            Dim userName As String = e.CommandArgument
            Dim SelectedUser As System.Web.Security.MembershipUser

            SelectedUser = System.Web.Security.Membership.GetUser(userName)
            SelectedUser.IsApproved = False
            System.Web.Security.Membership.UpdateUser(SelectedUser)
            gvUsers.DataBind()
        End If
    End Sub

    Protected Sub btReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReport.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim user As String = Membership.GetUser.UserName
        Dim bytes As Byte()

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Maintenance\Admin\UserReport.rdlc"
        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsUserReport_UserReport", dsUserReport))

        Response.ClearContent()
        Response.ClearHeaders()

        bytes = lr.Render("PDF", deviceInfo, mimeType, encoding, extension, streamids, warnings)
        Response.ContentType = "application/pdf"
        Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "User Report.pdf" + """")

        'bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
        'Response.ContentType = "application/excel"
        'Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "User Report.xls" + """")

        Response.BinaryWrite(bytes)
        Response.Flush()
        'Response.Close()
        Response.End()
    End Sub

    'Protected Sub gvUsers_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvUsers.DataBound
    '    If Not Me.IsPostBack Then
    '        If Request.QueryString("page") IsNot Nothing Then upage = Request.QueryString("page")
    '        If Request.QueryString("index") IsNot Nothing Then uindex = Request.QueryString("index")
    '        gvUsers.PageIndex = upage
    '        gvUsers.SelectedIndex = uindex
    '    Else
    '        If Me.gvUsers.SelectedValue Is Nothing Then gvUsers.SelectedIndex = 0
    '    End If

    'End Sub

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
