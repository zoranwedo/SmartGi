Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
'Public Class dsInvoices

'End Class
Namespace dsInvoicesTableAdapters
    Partial Public Class QueriesTableAdapter

        Public Function GetReturnValue(ByVal commandIndex As Integer) As Object
            Return Me.CommandCollection(commandIndex).Parameters(0).Value
        End Function

    End Class
End Namespace

