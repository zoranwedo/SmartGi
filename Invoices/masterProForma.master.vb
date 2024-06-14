
Partial Class Invoices_masterProForma
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            For Each i As MenuItem In LocalMenu.Items
                i.NavigateUrl &= "?InvoiceID=" & Request.QueryString(0)
            Next
        End If
    End Sub
End Class

