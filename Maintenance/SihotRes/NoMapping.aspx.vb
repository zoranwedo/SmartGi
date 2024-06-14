
Partial Class Maintenance_SihotRes_NoMapping
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
        dlFiles.DataBind()
    End Sub

End Class
