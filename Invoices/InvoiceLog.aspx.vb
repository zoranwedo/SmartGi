
Partial Class Invoices_InvoiceLog
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        LocalMenu.Items(0).NavigateUrl &= "?InvoiceID=" & Request.QueryString(0)
        LocalMenu.Items(1).NavigateUrl &= "?InvoiceID=" & Request.QueryString(0)
        LocalMenu.Items(2).NavigateUrl &= "?InvoiceID=" & Request.QueryString(0)

        If Not ModificationRights.RightsAdmin Then ddlLevel.Items.RemoveAt(2)

        Select Case ddlLevel.SelectedValue
            Case 1
                lblLogLevel.Text = "Actions Log"
            Case 2
                lblLogLevel.Text = "Full Log"
            Case Else
                lblLogLevel.Text = "Changes Log"
        End Select
    End Sub
End Class
