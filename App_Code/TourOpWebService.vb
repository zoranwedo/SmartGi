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
Public Class TourOpWebService
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
    Public Function TourOpGroups(ByVal knownCategoryValues As String, ByVal category As String, ByVal contextKey As String) As CascadingDropDownNameValue()
        Dim TourOpGroupList As New List(Of CascadingDropDownNameValue)
        Try
            Dim q As String = _
            "SELECT DISTINCT " & _
                "TourOpGroupID, " & _
                "TourOpGroup " & _
                "FROM commonUserTourOpsGroup('{0}',{1}) " & _
            "WHERE TourOpGroupID IS NOT NULL " & _
            "ORDER BY TourOpGroup"

            Dim pUsername As String = My.User.Name
            Dim c As StringDictionary = CascadingDropDown.ParseKnownCategoryValuesString(contextKey)
            Dim pNoLocal As Integer = BooleanToBit(c("NoLocal"))
            Dim t As DataTable = GetData(String.Format(q, pUsername, pNoLocal))

            TourOpGroupList.Add(New CascadingDropDownNameValue("all", 0))
            For Each r As DataRow In t.Rows
                TourOpGroupList.Add(New CascadingDropDownNameValue(r("TourOpGroup"), r("TourOpGroupID")))
            Next
        Catch ex As Exception
            TourOpGroupList.Add(New CascadingDropDownNameValue(ex.Message, 0))
        End Try

        Return TourOpGroupList.ToArray()
    End Function

    <WebMethod()> _
    Public Function Markets(ByVal knownCategoryValues As String, ByVal category As String, ByVal contextKey As String) As CascadingDropDownNameValue()
        Dim MarketList As New List(Of CascadingDropDownNameValue)
        Dim all As String = "all"
        Try
            Dim q As String = _
                "SELECT DISTINCT " & _
                    "m.MarketId, " & _
                    "m.Market " & _
                "FROM commonUserTourOpsGroup('{0}',{1}) c " & _
                "INNER JOIN Market m " & _
                    "ON m.MarketId = c.MarketId "

            Dim d As StringDictionary = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues)
            Dim gr As String = CategoryToValue(d("TourOpGroupID"))
            If gr <> 0 Then
                q = q & String.Format("WHERE c.TourOpGroupID = {0} ", gr)
                all = "all in group"
            End If
            q = q & "ORDER BY m.Market"

            Dim pUsername As String = My.User.Name
            Dim c As StringDictionary = CascadingDropDown.ParseKnownCategoryValuesString(contextKey)
            Dim pNoLocal As Integer = BooleanToBit(c("NoLocal"))
            Dim t As DataTable = GetData(String.Format(q, pUsername, pNoLocal))

            MarketList.Add(New CascadingDropDownNameValue(all, 0))
            For Each r As DataRow In t.Rows
                MarketList.Add(New CascadingDropDownNameValue(r("MarketId") & vbTab & "(" & r("Market") & ")", r("MarketId")))
            Next
        Catch ex As Exception
            MarketList.Add(New CascadingDropDownNameValue(ex.Message, 0))
        End Try

        Return MarketList.ToArray()
    End Function

    <WebMethod()> _
    Public Function PayConditions(ByVal knownCategoryValues As String, ByVal category As String, ByVal contextKey As String) As CascadingDropDownNameValue()
        Dim PayCondList As New List(Of CascadingDropDownNameValue)
        Dim all As String = "all"
        Try
            Dim q As String = _
                "SELECT DISTINCT " & _
                    "p.PayCondId, " & _
                    "p.PayCond " & _
                "FROM commonUserTourOpsGroup('{0}',{1}) c " & _
                "INNER JOIN PayCond p " & _
                    "ON p.PayCondId = c.PayCondId "

            Dim d As StringDictionary = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues)
            Dim gr As String = CategoryToValue(d("TourOpGroupID"))
            Dim mk As String = CategoryToValue(d("MarketID"))

            If gr <> "0" And mk <> "0" Then
                q = q & String.Format("WHERE c.TourOpGroupID = {0} ", gr)
                q = q & String.Format("AND c.MarketId = '{0}' ", mk)
                all = "all in group and market"
            ElseIf gr <> "0" Then
                q = q & String.Format("WHERE c.TourOpGroupID = {0} ", gr)
                all = "all in group"
            ElseIf mk <> "0" Then
                q = q & String.Format("WHERE c.MarketId = '{0}' ", mk)
                all = "all in market"
            End If
            q = q & "ORDER BY p.PayCond"

            Dim pUsername As String = My.User.Name
            Dim c As StringDictionary = CascadingDropDown.ParseKnownCategoryValuesString(contextKey)
            Dim pNoLocal As Integer = BooleanToBit(c("NoLocal"))
            Dim t As DataTable = GetData(String.Format(q, pUsername, pNoLocal))

            PayCondList.Add(New CascadingDropDownNameValue(all, 0))
            For Each r As DataRow In t.Rows
                PayCondList.Add(New CascadingDropDownNameValue(r("PayCondId") & vbTab & "(" & r("PayCond") & ")", r("PayCondId")))
            Next
        Catch ex As Exception
            PayCondList.Add(New CascadingDropDownNameValue(ex.Message, 0))
        End Try

        Return PayCondList.ToArray()
    End Function

    <WebMethod()> _
    Public Function TourOps(ByVal knownCategoryValues As String, ByVal category As String, ByVal contextKey As String) As CascadingDropDownNameValue()
        Dim TourOpList As New List(Of CascadingDropDownNameValue)
        Dim all As String = "all"
        Try
            Dim q As String = _
                "SELECT DISTINCT " & _
                    "UserId, " & _
                    "UserName, " & _
                    "AllTO, " & _
                    "TourOpID, " & _
                    "TourOp " & _
                "FROM commonUserTourOpsGroup('{0}',{1}) "

            Dim d As StringDictionary = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues)
            Dim gr As String = CategoryToValue(d("TourOpGroupID"))
            Dim mk As String = CategoryToValue(d("MarketID"))
            Dim pc As String = CategoryToValue(d("PayCondID"))

            If gr <> "0" And mk <> "0" And pc <> "0" Then
                q = q & String.Format("WHERE TourOpGroupID = {0} ", gr)
                q = q & String.Format("AND MarketId = '{0}' ", mk)
                q = q & String.Format("AND PayCondId = '{0}' ", pc)
                all = "all in group and market and for pay condition"
            ElseIf gr <> "0" And mk <> "0" Then
                q = q & String.Format("WHERE TourOpGroupID = {0} ", gr)
                q = q & String.Format("AND MarketId = '{0}' ", mk)
                all = "all in group and market"
            ElseIf gr <> "0" And pc <> "0" Then
                q = q & String.Format("WHERE TourOpGroupID = {0} ", gr)
                q = q & String.Format("AND PayCondId = '{0}' ", pc)
                all = "all in group and for pay condition"
            ElseIf mk <> "0" And pc <> "0" Then
                q = q & String.Format("WHERE MarketId = '{0}' ", mk)
                q = q & String.Format("AND PayCondId = '{0}' ", pc)
                all = "all in market and for pay condition"
            ElseIf gr <> "0" Then
                q = q & String.Format("WHERE TourOpGroupID = {0} ", gr)
                all = "all in group"
            ElseIf mk <> "0" Then
                q = q & String.Format("WHERE MarketId = '{0}' ", mk)
                all = "all in market"
            ElseIf pc <> "0" Then
                q = q & String.Format("WHERE PayCondId = '{0}' ", pc)
                all = "all for pay condition"
            End If
            q = q & "ORDER BY TourOp"

            Dim pUsername As String = My.User.Name
            Dim c As StringDictionary = CascadingDropDown.ParseKnownCategoryValuesString(contextKey)
            Dim pNoLocal As Integer = BooleanToBit(c("NoLocal"))
            Dim pMandatory As Integer = BooleanToBit(c("Mandatory"))
            Dim t As DataTable = GetData(String.Format(q, pUsername, pNoLocal))

            If pMandatory = 0 Then TourOpList.Add(New CascadingDropDownNameValue(all, 0))
            For Each r As DataRow In t.Rows
                TourOpList.Add(New CascadingDropDownNameValue(r("TourOp"), r("TourOpID")))
            Next
        Catch ex As Exception
            TourOpList.Add(New CascadingDropDownNameValue(ex.Message, 0))
        End Try

        Return TourOpList.ToArray()
    End Function

End Class
