
Partial Class Maintenance_InvExport_InvExportLog
    Inherits System.Web.UI.Page

    Protected Sub btnSerch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSerch.Click
        dsExportLog.DataBind()
    End Sub


    Protected Sub dsExportLog_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles dsExportLog.Selecting
        If (e.InputParameters("LogDate") Is Nothing) Then e.InputParameters("LogDate") = Now.Date
    End Sub
End Class
