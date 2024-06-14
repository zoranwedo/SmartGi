
Partial Class Maintenance_SihotRes_ResImportReport
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
            fltHotel.SelectedValue = -1
        Else
            hfMode.Value = 1
            simpleDiv.Visible = False
            advancedDiv.Visible = True
            fltDate.Text = ""
            btFilterMode.Text = "Simple Filter"
            fltCFrom.Text = Today.AddHours(-11).ToString
            fltCTo.Text = Today.AddDays(1).AddHours(-11).ToString
            fltHotel.SelectedValue = -1
        End If

    End Sub

    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        fltDate.Text = ""
        fltCFrom.Text = ""
        fltCTo.Text = ""
        fltHotel.SelectedValue = -1
    End Sub

    Protected Sub btnFilter_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnFilter.Click
        dsImported.DataBind()
    End Sub

    Protected Sub dsImported_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles dsImported.Selecting
        '<asp:Parameter Name="HotelHID" Type="Int32" />
        '<asp:Parameter Name="OnDate" Type="DateTime" />
        '<asp:Parameter Name="FromDate" Type="DateTime" />
        '<asp:Parameter Name="ToDate" Type="DateTime" />
        If hfMode.Value = 0 Then
            'Simple filter
            If String.IsNullOrEmpty(fltDate.Text) Then
                e.InputParameters("OnDate") = Today
            Else
                Dim d As Date
                If Not Date.TryParse(fltDate.Text, d) Then
                    btnClear_Click(sender, e)
                Else
                    e.InputParameters("OnDate") = d
                End If
                e.InputParameters("HotelHID") = Nothing
                e.InputParameters("FromDate") = Nothing
                e.InputParameters("ToDate") = Nothing
            End If
        End If
    End Sub
End Class
