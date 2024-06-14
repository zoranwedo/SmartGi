
Partial Class Invoices_Invoices
    Inherits System.Web.UI.Page

    'Protected Sub linkNew_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles linkNew.Click
    '    Response.Redirect("~/Invoices/InvoiceCreate.aspx?InvoiceID=0")
    'End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Me.dsFilteredInvoices.Select()
        pnlCnt.Visible = True
    End Sub

    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView1.RowCommand
        'Me.Response.Redirect("~/Invoices/InvoiceCreate.aspx?InvoiceID=" & e.CommandArgument)
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        'pnlCnt.Visible = False

        ddlTO.SelectedValue = ""
        ddlHotel.SelectedValue = ""
        txtGroup.Text = Nothing
        fltStart.Text = Nothing
        fltFinish.Text = Nothing
        txtFolio.Text = Nothing
        fltBkDateFrom.Text = Nothing
        fltBkDateFrom.Text = Nothing
        fltCreatedFrom.Text = Nothing
        fltCreatedFrom.Text = Nothing
    
    End Sub
End Class
