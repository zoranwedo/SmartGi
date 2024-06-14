Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Data.SqlClient
Imports System.Collections.Generic

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
<System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class AutoCompleteHotel
    Inherits System.Web.Services.WebService

    <WebMethod()> _
    Public Function SearchHotel(ByVal prefixText As String, ByVal count As Integer) As List(Of String)
        Dim conn As New SqlConnection
        Dim cmd As New SqlCommand

        Dim sql As String = _
            "SELECT TOP {0} h.HotelID, h.Hotel " & _
            "FROM Hotel h " & _
            "WHERE (h.[Active] = 1) " & _
            "AND h.HotelID NOT IN (49, 61, 63, 64, 65, 70) " & _
            "AND h.Hotel LIKE '%{1}%' " & _
            "ORDER BY h.Hotel "

        conn.ConnectionString = ConfigurationManager.ConnectionStrings("csSMART_SQL").ConnectionString
        cmd.CommandText = String.Format(sql, count, prefixText)
        cmd.Connection = conn
        conn.Open()

        Dim htl As New List(Of String)
        Dim sdr As SqlDataReader = cmd.ExecuteReader
        While sdr.Read
            Dim item As String = AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(sdr("Hotel").ToString, sdr("HotelID").ToString)
            htl.Add(item)
        End While

        conn.Close()
        Return htl
    End Function

End Class
