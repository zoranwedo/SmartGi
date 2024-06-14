Imports Microsoft.VisualBasic
Namespace ContractsTableAdapters

    Partial Public Class QueriesTableAdapter

        Public Function GetReturnValue(ByVal commandIndex As Integer) As Object

            Return Me.CommandCollection(commandIndex).Parameters(0).Value

        End Function

    End Class

End Namespace
