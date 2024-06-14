Imports System
Imports System.Configuration
Imports System.Web
Imports System.Web.Script.Services
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Collections
Imports System.Collections.Generic
Imports System.Collections.Specialized
Imports System.Data
Imports System.Data.SqlClient
Imports AjaxControlToolkit

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
<System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class HtlGroup
    Inherits System.Web.Services.WebService

    <WebMethod()> _
    Public Function GetHotelGroups(ByVal knownCategoryValues As String) As CascadingDropDownNameValue()
        Dim HGroups As New List(Of CascadingDropDownNameValue)
        Dim q As String = "SELECT HotelGroupID, HotelGroup FROM HotelGroup ORDER BY HotelGroupID"
        Dim t As DataTable = GetData(q)

        HGroups.Add(New CascadingDropDownNameValue("all", 0))
        For Each r As DataRow In t.Rows
            HGroups.Add(New CascadingDropDownNameValue(r("HotelGroup"), r("HotelGroupID")))
        Next

        Return HGroups.ToArray()
    End Function

    <WebMethod()> _
    Public Function GetHotels(ByVal knownCategoryValues As String) As CascadingDropDownNameValue()
        Dim Hotels As New List(Of CascadingDropDownNameValue)
        Dim q As String

        Try
            Dim d As StringDictionary = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues)
            If d("HotelGroupID") <> 0 Then
                Hotels.Add(New CascadingDropDownNameValue("all in group", 0))
                q = "SELECT h.HotelID, h.Hotel " & _
                    "FROM dbo.SelectUserHotel('{0}') h LEFT OUTER JOIN HotelGroupMember g ON g.HotelId = h.HotelID " & _
                    "WHERE h.[Active] = 1 AND g.HotelGroupId = {1} " & _
                    "ORDER BY h.SortPriority"
                q = String.Format(q, My.User.Name, d("HotelGroupID"))
            Else
                Hotels.Add(New CascadingDropDownNameValue("all", 0))
                q = "SELECT HotelID, Hotel " & _
                    "FROM dbo.SelectUserHotel('{0}') h " & _
                    "WHERE Active = 1 AND HotelID > 0 " & _
                    "ORDER BY SortPriority"
                q = String.Format(q, My.User.Name)
            End If

            Dim t As DataTable = GetData(q)
            For Each r As DataRow In t.Rows
                Hotels.Add(New CascadingDropDownNameValue(r("Hotel"), r("HotelID")))
            Next
        Catch ex As Exception
            Hotels.Add(New CascadingDropDownNameValue(ex.Message, 0))
        End Try

        Return Hotels.ToArray()
    End Function

    <WebMethod()> _
    Public Function GetRooms(ByVal knownCategoryValues As String) As CascadingDropDownNameValue()
        Dim Rooms As New List(Of CascadingDropDownNameValue)
        Dim d As StringDictionary = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues)
        Dim q As String = "SELECT r.RoomTypeID, r.RoomType FROM HotelRoomType r WHERE r.[Active] = 1 AND r.HotelId = @HotelID ORDER BY r.RoomTypeID"
        q = q.Replace("@HotelID", d("HotelID"))
        Dim t As DataTable = GetData(q)

        Rooms.Add(New CascadingDropDownNameValue("all", "0"))
        For Each r As DataRow In t.Rows
            Rooms.Add(New CascadingDropDownNameValue(r("RoomTypeID"), r("RoomTypeID")))
        Next

        Return Rooms.ToArray()
    End Function

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

End Class
