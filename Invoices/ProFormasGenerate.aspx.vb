
Partial Class Invoices_ProFormasGenerate
    Inherits System.Web.UI.Page


    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView1.RowCommand
        If e.CommandName = "Details" Then Me.Response.Redirect("~/Invoices/ProformaForm.aspx?InvoiceID=" & e.CommandArgument)
    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridView1_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowCreated
        'CType(e.Row.FindControl("fvDetail"), FormView).DataBind()
    End Sub

    Protected Sub dsFilteredInvoices_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles dsFilteredInvoices.Selecting

    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        Response.Redirect(String.Format("..\Reports\Invoices\InvoiceSummarySel.aspx?HotelID={0}", dvProformas.SelectedValue))
    End Sub

    Protected Sub dsFilteredInvoices_ObjectCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceEventArgs) Handles dsFilteredInvoices.ObjectCreated
        CType(e.ObjectInstance, dsPreInvoicesTableAdapters.ProFormaGenerateTableAdapter).SetTimeout(2000)
    End Sub
End Class
