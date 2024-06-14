Imports Microsoft.VisualBasic

Namespace ReportAccountingTableAdapters

    Partial Public Class AccRepDocBalanceTableAdapter

        Public Sub SetTimeout(ByVal value As Integer)
            For Each c As Global.System.Data.SqlClient.SqlCommand In Me.CommandCollection
                c.CommandTimeout = value
            Next
        End Sub
    End Class

    Partial Public Class AccRepDocBalanceDetailTableAdapter

        Public Sub SetTimeout(ByVal value As Integer)
            For Each c As Global.System.Data.SqlClient.SqlCommand In Me.CommandCollection
                c.CommandTimeout = value
            Next
        End Sub
    End Class
End Namespace
