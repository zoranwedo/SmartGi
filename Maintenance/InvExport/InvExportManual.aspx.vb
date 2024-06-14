Imports BavelExport

Partial Class Maintenance_InvExport_InvExportManual
    Inherits System.Web.UI.Page

    Protected Sub btnExport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExport.Click
        Dim dtNow As Date = Now()

        dsExportLog.SelectParameters("LogDate").DefaultValue = Now
        Dim b As New BavelExport.xmlInvoiceBatch()
        b.ExportInvoiceXML(My.User.Name)

        gvExportLog.Visible = True
        dsExportLog.Select()
        gvExportLog.Sort("LogDate, LogID", SortDirection.Ascending)
    End Sub
End Class
