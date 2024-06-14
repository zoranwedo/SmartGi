Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Data
Imports System.Data.SqlClient

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
<System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class HotelRooms
    Inherits System.Web.Services.WebService

    Private Function GetData(ByVal query As String) As DataTable
        Dim conn As New SqlConnection(ConfigurationManager.ConnectionStrings("csSMART_SQL").ConnectionString)
        Dim cmd As New SqlCommand
        Dim reader As SqlDataReader

        cmd.CommandText = query
        cmd.CommandType = CommandType.Text
        cmd.Connection = conn

        conn.Open()

        reader = cmd.ExecuteReader()
        Dim dt As New DataTable
        dt.Load(reader)
        conn.Close()

        Return dt
    End Function

    <WebMethod()> _
    Public Function GetHotel(ByVal knownCategoryValues As String) As CascadingDropDownNameValue()
        Dim HotelList As New List(Of CascadingDropDownNameValue)
        Try
            Dim q As String = _
                "SELECT DISTINCT " & _
                    "UserId, " & _
                    "UserName, " & _
                    "AllHotels, " & _
                    "HotelID, " & _
                    "HotelHID, " & _
                    "Hotel, " & _
                    "SortPriority " & _
                "FROM commonUserHotels('{0}',1) " & _
                "ORDER BY UserName, SortPriority"

            Dim t As DataTable = GetData(String.Format(q, My.User.Name))
            HotelList.Add(New CascadingDropDownNameValue("", ""))
            For Each r As DataRow In t.Rows
                HotelList.Add(New CascadingDropDownNameValue(r("Hotel"), r("HotelID")))
            Next
        Catch ex As Exception
            HotelList.Add(New CascadingDropDownNameValue(ex.Message, 0))
        End Try

        Return HotelList.ToArray()
    End Function

    <WebMethod()> _
    Public Function GetHotelRooms(ByVal knownCategoryValues As String) As CascadingDropDownNameValue()
        Dim RoomList As New List(Of CascadingDropDownNameValue)
        RoomList.Add(New CascadingDropDownNameValue("", ""))

        Dim hotelId As String = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues)("HotelID")
        If hotelId IsNot Nothing Then
            Try
                Dim q As String = _
                    "SELECT " & _
                        "RoomTypeID, " & _
                        "RoomType " & _
                    "FROM HotelRoomType " & _
                    "WHERE Active = 1 " & _
                        "AND HotelId = {0} " & _
                    "ORDER BY RoomTypeID"

                q = String.Format(q, hotelId)
                Dim t As DataTable = GetData(q)
                For Each r As DataRow In t.Rows
                    RoomList.Add(New CascadingDropDownNameValue(r("RoomTypeID"), r("RoomTypeID")))
                Next
            Catch ex As Exception
                RoomList.Add(New CascadingDropDownNameValue(ex.Message, 0))
            End Try
        End If
        Return RoomList.ToArray()
    End Function

End Class