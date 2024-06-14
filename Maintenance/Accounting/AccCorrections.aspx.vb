
Partial Class Maintenance_Accounting_AccCorrections
    Inherits System.Web.UI.Page

    Protected Sub btFilter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btFilter.Click
        gvNoCorrections.DataBind()
    End Sub

    Protected Sub gvCorrections_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvCorrections.RowCommand
        If e.CommandName = "RemoveCorrection" Then
            Dim q As New dsAccCorrectionTableAdapters.QueriesTableAdapter
            Dim d As Integer = e.CommandArgument
            q.AccCorrection(d, False)
            gvCorrections.DataBind()
            gvNoCorrections.DataBind()
        End If
    End Sub

    Protected Sub gvNoCorrections_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvNoCorrections.RowCommand
        If e.CommandName = "AddCorrection" Then
            Dim q As New dsAccCorrectionTableAdapters.QueriesTableAdapter
            Dim d As Integer = e.CommandArgument
            q.AccCorrection(d, True)
            gvCorrections.DataBind()
            gvNoCorrections.DataBind()
        End If
    End Sub
End Class
