Imports Microsoft.VisualBasic

Namespace ReportsInvoiceTableAdapters

    Partial Public Class InvoiceJournal_DetailTableAdapter

        Public Sub SetTimeout(ByVal value As Integer)
            For Each c As Global.System.Data.SqlClient.SqlCommand In Me.CommandCollection
                c.CommandTimeout = value
            Next
        End Sub
    End Class

    Partial Public Class InvoiceJournal_RateTableAdapter

        Public Sub SetTimeout(ByVal value As Integer)
            For Each c As Global.System.Data.SqlClient.SqlCommand In Me.CommandCollection
                c.CommandTimeout = value
            Next
        End Sub
    End Class
End Namespace
