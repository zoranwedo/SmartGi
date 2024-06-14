
Partial Class Maintenance_Opera_OperaImport
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        gvTasks.DataBind()
        If gvTasks.Rows.Count > 0 And gvTasks.SelectedIndex = -1 Then gvTasks.SelectedIndex = 0
    End Sub

    Protected Sub btnFilter_Click(sender As Object, e As EventArgs) Handles btnFilter.Click
        If Not String.IsNullOrEmpty(fltDate.Text) Then
            gvTasks.DataSourceID = "dsTasksByDate"
            gvTasks.DataBind()
        End If
    End Sub

    Protected Sub btnClear_Click(sender As Object, e As EventArgs) Handles btnClear.Click
        fltDate.Text = String.Empty
        gvTasks.DataSourceID = "dsTasks"
        gvTasks.DataBind()
    End Sub
End Class
