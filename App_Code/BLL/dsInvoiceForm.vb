Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
'Public Class dsInvoices

'End Class
Namespace dsInvoiceFormTableAdapters

    Partial Public Class QueriesTableAdapter

        Public Sub SetTimeout(ByVal value As Integer)
            For Each c As Global.System.Data.SqlClient.SqlCommand In Me.CommandCollection
                c.CommandTimeout = value
            Next
        End Sub

    End Class

    Partial Public Class InvStayDetailTableAdapter

        Public Sub SetTimeout(ByVal value As Integer)
            For Each c As Global.System.Data.SqlClient.SqlCommand In Me.CommandCollection
                c.CommandTimeout = value
            Next
        End Sub

    End Class
End Namespace

