
Partial Class Maintenance_SihotRes_ImportedToday
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            lblToday.Text = String.Format("Reservation Files Import Overview on {0}", Now)
        End If
    End Sub

    Protected Sub dlToday_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles dlToday.ItemDataBound
        If e.Item.ItemType = ListItemType.Footer Then
            Dim q As New dsResImportTableAdapters.QueriesTableAdapter
            Dim p As Integer = q.ImportPending
            Dim t As Label = e.Item.FindControl("footerLabel")
            t.Text = IIf(p = 0, "No", p.ToString) & IIf(p = 1, " file", " files") & " pending for import."
        End If
    End Sub
End Class
