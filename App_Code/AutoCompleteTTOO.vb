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
Public Class AutoCompleteTTOO
    Inherits System.Web.Services.WebService

    <WebMethod()> _
    Public Function SearchTTOO(ByVal prefixText As String, ByVal count As Integer) As List(Of String)
        Dim conn As New SqlConnection
        Dim cmd As New SqlCommand

        Dim sql As String = _
            "SELECT TOP {0} t.TourOpID, t.TourOp " & _
            "FROM TourOp t " & _
            "WHERE(t.[Active] = 1) " & _
            "AND t.TourOp LIKE '%{1}%' " & _
            "ORDER BY t.TourOp "

        conn.ConnectionString = ConfigurationManager.ConnectionStrings("csSMART_SQL").ConnectionString
        cmd.CommandText = String.Format(sql, count, prefixText)
        cmd.Connection = conn
        conn.Open()

        Dim ttoo As New List(Of String)
        Dim sdr As SqlDataReader = cmd.ExecuteReader
        While sdr.Read
            Dim item As String = AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(sdr("TourOp").ToString, sdr("TourOpID").ToString)
            ttoo.Add(item)
        End While

        conn.Close()
        Return ttoo
    End Function

    <WebMethod()> _
    Public Function SearchGroupTTOO(ByVal prefixText As String, ByVal count As Integer) As List(Of String)
        Dim conn As New SqlConnection
        Dim cmd As New SqlCommand

        Dim sql As String = _
            "SELECT TOP {0} t.TourOpID, t.TourOp " & _
            "FROM TourOp t " & _
            "WHERE(t.[Active] = 1) " & _
            "AND t.TourOp LIKE '%{1}%GROUP%' " & _
            "ORDER BY t.TourOp "

        conn.ConnectionString = ConfigurationManager.ConnectionStrings("csSMART_SQL").ConnectionString
        cmd.CommandText = String.Format(sql, count, prefixText)
        cmd.Connection = conn
        conn.Open()

        Dim ttoo As New List(Of String)
        Dim sdr As SqlDataReader = cmd.ExecuteReader
        While sdr.Read
            Dim item As String = AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem(sdr("TourOp").ToString, sdr("TourOpID").ToString)
            ttoo.Add(item)
        End While

        conn.Close()
        Return ttoo
    End Function

End Class
