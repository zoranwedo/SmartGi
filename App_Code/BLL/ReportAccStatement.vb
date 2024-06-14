Namespace ReportAccStatementTableAdapters

    Partial Class AccRepStatementOfAccountTableAdapter

        Public Sub SetTimeout(ByVal value As Integer)
            For Each c As Global.System.Data.SqlClient.SqlCommand In Me.CommandCollection
                c.CommandTimeout = value
            Next
        End Sub
    End Class

    Partial Class AccRepStatementOfAccBookingTableAdapter

        Public Sub SetTimeout(ByVal value As Integer)
            For Each c As Global.System.Data.SqlClient.SqlCommand In Me.CommandCollection
                c.CommandTimeout = value
            Next
        End Sub
    End Class

    Partial Class AccStatementTableAdapter

        Public Sub SetTimeout(ByVal value As Integer)
            For Each c As Global.System.Data.SqlClient.SqlCommand In Me.CommandCollection
                c.CommandTimeout = value
            Next
        End Sub
    End Class
End Namespace