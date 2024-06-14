Imports Microsoft.VisualBasic

Namespace dsReservationsTableAdapters

    Partial Public Class RptReservationCountTableAdapter

        Public Sub SetTimeout(ByVal value As Integer)
            For Each c As Global.System.Data.SqlClient.SqlCommand In Me.CommandCollection
                c.CommandTimeout = value
            Next
        End Sub
    End Class

End Namespace
