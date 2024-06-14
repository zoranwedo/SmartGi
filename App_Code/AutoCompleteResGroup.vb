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
Public Class AutoCompleteResGroup
    Inherits System.Web.Services.WebService

    <WebMethod()> _
    Public Function SearchGroup(ByVal prefixText As String, ByVal count As Integer) As List(Of String)
        Dim conn As New SqlConnection
        Dim cmd As New SqlCommand

        Dim sql As String = _
            "SELECT DISTINCT TOP {0} r.ResGroup FROM Reservation r " & _
            "WHERE(r.CheckIn > DateAdd(Month, -1, GETDATE())) " & _
            "AND r.ResGroup LIKE '%{1}%' " & _
            "ORDER BY r.ResGroup"

        conn.ConnectionString = ConfigurationManager.ConnectionStrings("csSMART_SQL").ConnectionString
        cmd.CommandText = String.Format(sql, count, prefixText)
        cmd.Connection = conn
        conn.Open()

        Dim resgrp As New List(Of String)
        Dim sdr As SqlDataReader = cmd.ExecuteReader
        While sdr.Read
            resgrp.Add(sdr("ResGroup"))
        End While

        conn.Close()
        Return resgrp
    End Function

End Class
