Imports Microsoft.VisualBasic

Public Class Hotels
    Public Shared Function AdultsOnly(ByVal HotelID As Integer) As Boolean
        Dim q As New dsMaintHotelTableAdapters.HotelTableAdapter
        Dim qr As dsMaintHotel.HotelRow = q.GetDataByHotelID(HotelID).Rows(0)

        Return (qr.AdultOnly)

    End Function
End Class
