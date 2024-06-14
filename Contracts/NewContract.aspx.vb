
Partial Class Contracts_NewContract
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If Not String.IsNullOrEmpty(ddlMarkets.SelectedValue) Then
            dsTOSearch.Select()
            gvTO.DataBind()
            gvTO.Visible = True
        Else
            popShow(False, "Warning", "You must select Market. It's required!")
            gvTO.Visible = False
        End If
    End Sub
    Protected Sub popShow(ByVal Question As Boolean, ByVal Title As String, ByVal Message As String)
        popMessage.Text = Message
        popLabel.Text = Title

        If Question Then
            btnYes.Visible = True
            btnNo.Text = "No"
        Else
            btnYes.Visible = False
            btnNo.Text = "OK"
        End If
        popExtender.Show()
    End Sub

    Protected Sub linkNew_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles linkNew.Click
        'Response.Redirect()
    End Sub
End Class
