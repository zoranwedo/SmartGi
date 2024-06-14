
Partial Class Maintenance_SihotRes_ImportOnDay
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If String.IsNullOrEmpty(fltDate.Text) Then
            lblToday.Text = String.Format("Reservation Files Import on {0:d}", Now)
        Else
            lblToday.Text = String.Format("Reservation Files Import on {0}", fltDate.Text)
        End If
    End Sub

    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        fltDate.Text = Nothing
        lblToday.Text = String.Format("Reservation Files Import on {0:d}", Now)
        dlToday.DataBind()
    End Sub

    Protected Sub dlToday_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles dlToday.ItemDataBound
        If e.Item.ItemType = ListItemType.Footer Then
            Dim p As Integer = dlToday.Items.Count
            Dim t As Label = e.Item.FindControl("footerLabel")
            t.Text = IIf(p = 0, "No", p.ToString) & IIf(p = 1, " file", " files") & " imported on selected date."
        End If
    End Sub
End Class
