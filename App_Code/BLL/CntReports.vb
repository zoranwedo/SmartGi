Imports Microsoft.VisualBasic

Namespace CntReportsTableAdapters

    Partial Public Class FilterContractRate1TableAdapter

        Public Sub SetTimeout(ByVal value As Integer)
            For Each c As Global.System.Data.SqlClient.SqlCommand In Me.CommandCollection
                c.CommandTimeout = value
            Next
        End Sub

    End Class

    Partial Public Class FilterContractLeadReportTableAdapter

        Public Sub SetTimeout(ByVal value As Integer)
            For Each c As Global.System.Data.SqlClient.SqlCommand In Me.CommandCollection
                c.CommandTimeout = value
            Next
        End Sub
    End Class

End Namespace
