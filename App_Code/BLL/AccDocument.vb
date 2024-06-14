Imports Microsoft.VisualBasic
Imports System.Data.SqlClient

Namespace AccDocumentTableAdapters
    Partial Public Class QueriesTableAdapter

        Public ReadOnly Property QueryConnection() As SqlConnection
            Get
                Return Me.CommandCollection(0).Connection
            End Get
        End Property

        Public Sub SetTransaction(ByVal t As SqlTransaction)
            For Each cmd As SqlCommand In Me.CommandCollection
                cmd.Connection = t.Connection
                cmd.Transaction = t
            Next
        End Sub
    End Class

End Namespace
