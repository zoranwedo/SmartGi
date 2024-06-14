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
Public Class TOGroup
    Inherits System.Web.Services.WebService

    <WebMethod()> _
    Public Function GetTOGroups(ByVal knownCategoryValues As String) As CascadingDropDownNameValue()
        Dim TOGroups As New List(Of CascadingDropDownNameValue)
        Dim q As String = "SELECT TourOpGroupID, TourOpGroup FROM TourOpGroup ORDER BY TourOpGroupID"

        TOGroups.Add(New CascadingDropDownNameValue("all", 0))
        Dim t As DataTable = GetData(q)
        For Each r As DataRow In t.Rows
            TOGroups.Add(New CascadingDropDownNameValue(r("TourOpGroup"), r("TourOpGroupID")))
        Next

        Return TOGroups.ToArray()
    End Function

    <WebMethod()> _
    Public Function GetTTOOs(ByVal knownCategoryValues As String) As CascadingDropDownNameValue()
        Dim TTOOs As New List(Of CascadingDropDownNameValue)
        Dim q As String

        Try
            Dim d As StringDictionary = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues)
            If d("TourOpGroupID") <> 0 Then
                TTOOs.Add(New CascadingDropDownNameValue("all in group", 0))
                q = "SELECT t.TourOpID, t.TourOp " & _
                    "FROM TourOp t INNER JOIN TourOpGroupMember g ON g.TourOpID = t.TourOpID " & _
                    "WHERE t.[Active] = 1 AND g.TourOpGroupId = {0} " & _
                    "ORDER BY t.TourOp"
                q = String.Format(q, d("TourOpGroupID"))
            Else
                TTOOs.Add(New CascadingDropDownNameValue("all", 0))
                q = "SELECT t.TourOpID, t.TourOp " & _
                    "FROM TourOp t " & _
                    "WHERE t.[Active] = 1 " & _
                    "ORDER BY t.TourOp"
            End If

            Dim t As DataTable = GetData(q)
            For Each r As DataRow In t.Rows
                TTOOs.Add(New CascadingDropDownNameValue(r("TourOp"), r("TourOpID")))
            Next
        Catch ex As Exception
            TTOOs.Add(New CascadingDropDownNameValue(ex.Message, 0))
        End Try

        Return TTOOs.ToArray()
    End Function

    <WebMethod()> _
    Public Function GetGroupTTOOs(ByVal knownCategoryValues As String) As CascadingDropDownNameValue()
        Dim TTOOs As New List(Of CascadingDropDownNameValue)
        Dim q As String

        Try
            q = "SELECT t.TourOpID, t.TourOp " & _
                "FROM TourOp t " & _
                "WHERE t.[Active] = 1 AND t.TourOp LIKE '%GROUPS%'" & _
                "ORDER BY t.TourOp"
            Dim t As DataTable = GetData(q)
            For Each r As DataRow In t.Rows
                TTOOs.Add(New CascadingDropDownNameValue(r("TourOp"), r("TourOpID")))
            Next
        Catch ex As Exception
            TTOOs.Add(New CascadingDropDownNameValue(ex.Message, 0))
        End Try

        Return TTOOs.ToArray()
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
