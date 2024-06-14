
Partial Class Maintenance_Service_ServiceLog
    Inherits System.Web.UI.Page

    Protected Sub btFilterMode_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btFilterMode.Click
        If hfMode.Value = 1 Then
            hfMode.Value = 0
            simpleDiv.Visible = True
            advancedDiv.Visible = False
            fltDate.Text = ""
            btFilterMode.Text = "Advanced Filter"
            fltFrom.Text = ""
            fltTo.Text = ""
            fltSerevice.SelectedValue = -1
        Else
            hfMode.Value = 1
            simpleDiv.Visible = False
            advancedDiv.Visible = True
            fltDate.Text = ""
            btFilterMode.Text = "Simple Filter"
            fltFrom.Text = Now.ToShortDateString
            fltTo.Text = Now.ToShortDateString
            fltSerevice.SelectedValue = -1
        End If
    End Sub

    Protected Sub dsServiceLog_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles dsServiceLog.Selecting
        If hfMode.Value = 0 Then
            If e.InputParameters("LogOn") Is Nothing Then e.InputParameters("LogOn") = Now
        End If
    End Sub
End Class
