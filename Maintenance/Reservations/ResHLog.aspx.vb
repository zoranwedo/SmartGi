
Partial Class Maintenance_Reservations_ResHLog
    Inherits System.Web.UI.Page

    Protected Sub btnSerch_Click(sender As Object, e As System.EventArgs) Handles btnSerch.Click
        Dim strFilter = "LogCodeGroup in ("
        For Each i As ListItem In cblLogCodes.Items
            If i.Selected Then strFilter &= i.Value.ToString & ","
        Next

        If strFilter <> "LogCodeGroup in (" Then
            strFilter = Left(strFilter, Len(strFilter) - 1) & ")"
            dsLog.FilterExpression = strFilter
        Else
            dsLog.FilterExpression = Nothing
        End If

        dsLog.DataBind()
    End Sub

    Protected Sub dsLog_Selecting(sender As Object, e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles dsLog.Selecting
        If (e.InputParameters("ProcFrom") Is Nothing) And (e.InputParameters("ProcTo") Is Nothing) Then
            e.Cancel = True
        End If
    End Sub
End Class
