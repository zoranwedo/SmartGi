
Partial Class Maintenance_SihotRates_RateImported
    Inherits System.Web.UI.Page

    Protected Sub btFilterMode_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btFilterMode.Click
        If hfMode.Value = 1 Then
            hfMode.Value = 0
            simpleDiv.Visible = True
            advancedDiv.Visible = False
            fltDate.Text = ""
            btFilterMode.Text = "Advanced Filter"
            fltCFrom.Text = ""
            fltCTo.Text = ""
            fltFFrom.Text = ""
            fltFTo.Text = ""
            'fltHotel.SelectedValue = -1
        Else
            hfMode.Value = 1
            simpleDiv.Visible = False
            advancedDiv.Visible = True
            fltDate.Text = ""
            btFilterMode.Text = "Simple Filter"
            fltCFrom.Text = Now.ToShortDateString
            fltCTo.Text = Now.ToShortDateString
            fltFFrom.Text = ""
            fltFTo.Text = ""
            'fltHotel.SelectedValue = -1
        End If
    End Sub

    Protected Sub dsImported_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles dsImported.Selecting, dsLog.Selecting
        If hfMode.Value = 0 Then
            If e.InputParameters("ckDate") Is Nothing Then
                e.InputParameters("ckFrom") = DateAdd(DateInterval.Day, -7, Now)
            End If
        End If
    End Sub
End Class
