﻿Imports Microsoft.VisualBasic

Namespace dsAccTransferHotelTableAdapters

    Partial Public Class AccTransferHotelDetailTableAdapter

        Public Sub SetTimeout(ByVal value As Integer)
            For Each c As Global.System.Data.SqlClient.SqlCommand In Me.CommandCollection
                c.CommandTimeout = value
            Next
        End Sub
    End Class

    Partial Public Class AccTransferHotelRecapTableAdapter

        Public Sub SetTimeout(ByVal value As Integer)
            For Each c As Global.System.Data.SqlClient.SqlCommand In Me.CommandCollection
                c.CommandTimeout = value
            Next
        End Sub
    End Class
End Namespace