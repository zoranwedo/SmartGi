Imports App_UserControls_MessagePop

Partial Class Maintenance_Opera_OperaImportSetup
    Inherits System.Web.UI.Page

    Protected Sub gvHotels_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gvHotels.RowCommand
        If e.CommandName = "Enable" Then
            Dim q = New dsOperaTableAdapters.OperaHotelTableAdapter()
            q.UpdateEnabled(True, e.CommandArgument)
            gvHotels.DataBind()
        ElseIf e.CommandName = "Dissable" Then
            Dim q = New dsOperaTableAdapters.OperaHotelTableAdapter()
            q.UpdateEnabled(False, e.CommandArgument)
            gvHotels.DataBind()
        End If
    End Sub
End Class
