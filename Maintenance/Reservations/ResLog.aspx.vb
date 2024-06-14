
Partial Class Maintenance_Reservations_ResLog
    Inherits System.Web.UI.Page

    Protected Sub btnSerch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSerch.Click
        dsImportLog.DataBind()
    End Sub

    Protected Sub dsImportLog_Selecting(sender As Object, e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles dsImportLog.Selecting
        If (e.InputParameters("date_run") Is Nothing) Then
            If Now.Hour > 9 Then
                e.InputParameters("date_run") = Now.Date
            Else
                e.InputParameters("date_run") = Now.AddDays(-1).Date
            End If
        End If
    End Sub
End Class
