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
Public Class HotelWebService
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

    Private Function CategoryToValue(ByVal value As Object) As String
        If value Is Nothing Then
            Return "0"
        Else
            Return value
        End If
    End Function

    Private Function BooleanToBit(ByVal value As String) As Integer
        Dim bValue As Boolean = False
        Boolean.TryParse(value, bValue)
        Return IIf(bValue, 1, 0)
    End Function

    <WebMethod()> _
    Public Function HotelGroups(ByVal knownCategoryValues As String, ByVal category As String, ByVal contextKey As String) As CascadingDropDownNameValue()
        Dim HotelGroupList As New List(Of CascadingDropDownNameValue)
        Try
            Dim q As String = _
            "SELECT DISTINCT " & _
                "HotelGroupID, " & _
                "HotelGroup " & _
                "FROM commonUserHotelsGroup('{0}',{1}) " & _
            "WHERE HotelGroupID IS NOT NULL " & _
            "ORDER BY HotelGroup"

            Dim pUsername As String = My.User.Name
            Dim c As StringDictionary = CascadingDropDown.ParseKnownCategoryValuesString(contextKey)
            Dim pNoCCI As Integer = BooleanToBit(c("NoCCI"))
            Dim t As DataTable = GetData(String.Format(q, pUsername, pNoCCI))

            HotelGroupList.Add(New CascadingDropDownNameValue("all", 0))
            For Each r As DataRow In t.Rows
                HotelGroupList.Add(New CascadingDropDownNameValue(r("HotelGroup"), r("HotelGroupID")))
            Next
        Catch ex As Exception
            HotelGroupList.Add(New CascadingDropDownNameValue(ex.Message, 0))
        End Try

        Return HotelGroupList.ToArray()
    End Function

    <WebMethod()> _
    Public Function Hotels(ByVal knownCategoryValues As String, ByVal category As String, ByVal contextKey As String) As CascadingDropDownNameValue()
        Dim HotelList As New List(Of CascadingDropDownNameValue)
        Dim all As String = "all"
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
                "FROM commonUserHotelsGroup('{0}',{1}) "

            Dim d As StringDictionary = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues)
            Dim gr As String = CategoryToValue(d("HotelGroupID"))
            If gr <> 0 Then
                q = q & String.Format("WHERE HotelGroupID = {0} ", gr)
                all = "all in group"
            End If
            q = q & "ORDER BY UserName, SortPriority"

            Dim pUsername As String = My.User.Name
            Dim c As StringDictionary = CascadingDropDown.ParseKnownCategoryValuesString(contextKey)
            Dim pNoCCI As Integer = BooleanToBit(c("NoCCI"))
            Dim pMandatory As Integer = BooleanToBit(c("Mandatory"))
            Dim t As DataTable = GetData(String.Format(q, pUsername, pNoCCI))

            If pMandatory = 0 Then HotelList.Add(New CascadingDropDownNameValue(all, 0))
            For Each r As DataRow In t.Rows
                HotelList.Add(New CascadingDropDownNameValue(r("Hotel"), r("HotelID")))
            Next
        Catch ex As Exception
            HotelList.Add(New CascadingDropDownNameValue(ex.Message, 0))
        End Try

        Return HotelList.ToArray()
    End Function

End Class
