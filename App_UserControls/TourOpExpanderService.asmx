<%@ WebService Language="VB" Class="TourOpExpanderService" %>

Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Web.Script.Services
Imports System.Configuration
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
Public Class TourOpExpanderService
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
    Public Function TourOpKinds(ByVal knownCategoryValues As String, ByVal category As String, ByVal contextKey As String) As CascadingDropDownNameValue()
        Dim TourOpGroupList As New List(Of CascadingDropDownNameValue)
        Dim c As StringDictionary = CascadingDropDown.ParseKnownCategoryValuesString(contextKey)
        If c("Kind") = 0 Then
            Try
                Dim q As String = _
                    "SELECT q.Kind, COUNT(q.TourOpID) cnt " & _
                    "FROM (" & _
                        "SELECT TourOpID, CASE WHEN TourOp LIKE '%GROUPS%' THEN 'Group' ELSE 'Single' END AS Kind " & _
                    "FROM commonUserTourOpsGroup('{0}',{1})) q " & _
                    "GROUP BY q.Kind"

                Dim pUsername As String = My.User.Name
                Dim pNoLocal As Integer = BooleanToBit(c("NoLocal"))
                Dim t As DataTable = GetData(String.Format(q, pUsername, pNoLocal))

                TourOpGroupList.Add(New CascadingDropDownNameValue("all", 0))
                For Each r As DataRow In t.Rows
                    TourOpGroupList.Add(New CascadingDropDownNameValue(r("Kind"), IIf(r("Kind") = "Single", 1, 2)))
                Next
            Catch ex As Exception
                TourOpGroupList.Add(New CascadingDropDownNameValue(ex.Message, 0))
            End Try
        Else
            TourOpGroupList.Add(New CascadingDropDownNameValue(IIf(c("Kind") = 1, "Single", "Group"), c("Kind")))
        End If

        Return TourOpGroupList.ToArray()
    End Function

    <WebMethod()> _
    Public Function TourOpGroups(ByVal knownCategoryValues As String, ByVal category As String, ByVal contextKey As String) As CascadingDropDownNameValue()
        Dim TourOpGroupList As New List(Of CascadingDropDownNameValue)
        Dim all As String = "all"
        Try
            Dim q As String = _
            "SELECT DISTINCT " & _
                "TourOpGroupID, " & _
                "TourOpGroup " & _
                "FROM commonUserTourOpsGroup('{0}',{1}) " & _
            "WHERE TourOpGroupID IS NOT NULL "

            Dim d As StringDictionary = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues)
            Dim k As String = CategoryToValue(d("Kind"))
            If k <> 0 Then
                q = q & "AND TourOp" & IIf(k = 1, " NOT ", " ") & "LIKE '%GROUP%'"
                all &= IIf(k = 1, " single", " group")
            End If
            q = q & "ORDER BY TourOpGroup"

            Dim pUsername As String = My.User.Name
            Dim c As StringDictionary = CascadingDropDown.ParseKnownCategoryValuesString(contextKey)
            Dim pNoLocal As Integer = BooleanToBit(c("NoLocal"))
            Dim t As DataTable = GetData(String.Format(q, pUsername, pNoLocal))

            TourOpGroupList.Add(New CascadingDropDownNameValue(all, 0))
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
            Dim k As String = CategoryToValue(d("Kind"))
            Dim gr As String = CategoryToValue(d("TourOpGroupID"))
            
            Dim wc As New List(Of String)
            If k <> 0 Then wc.Add("TourOp" & IIf(k = 1, " NOT ", " ") & "LIKE '%GROUP%' ")
            If gr <> 0 Then wc.Add(String.Format("TourOpGroupID = {0} ", gr))
            If wc.Count > 0 Then
                q &= "WHERE " & Join(wc.ToArray, "AND ")
                wc.Clear()
                If k <> 0 Then wc.Add(IIf(k = 1, " single", " group"))
                If gr <> 0 Then wc.Add(" in group")
                all &= Join(wc.ToArray, " and")
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
            Dim k As String = CategoryToValue(d("Kind"))
            Dim gr As String = CategoryToValue(d("TourOpGroupID"))
            Dim mk As String = CategoryToValue(d("MarketID"))

            Dim wc As New List(Of String)
            If k <> 0 Then wc.Add("TourOp" & IIf(k = 1, " NOT ", " ") & "LIKE '%GROUPS%' ")
            If gr <> 0 Then wc.Add(String.Format("TourOpGroupID = {0} ", gr))
            If mk <> "0" Then wc.Add(String.Format("MarketId = '{0}' ", mk))
            If wc.Count > 0 Then
                q &= "WHERE " & Join(wc.ToArray, "AND ")
                wc.Clear()
                If k <> 0 Then wc.Add(IIf(k = 1, " single", " group"))
                If gr <> 0 Then wc.Add(" in group")
                If mk <> "0" Then wc.Add(" in market")
                all &= Join(wc.ToArray, " and")
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
            Dim k As String = CategoryToValue(d("Kind"))
            Dim gr As String = CategoryToValue(d("TourOpGroupID"))
            Dim mk As String = CategoryToValue(d("MarketID"))
            Dim pc As String = CategoryToValue(d("PayCondID"))
            
            Dim wc As New List(Of String)
            If k <> 0 Then wc.Add("TourOp" & IIf(k = 1, " NOT ", " ") & "LIKE '%GROUPS%' ")
            If gr <> 0 Then wc.Add(String.Format("TourOpGroupID = {0} ", gr))
            If mk <> "0" Then wc.Add(String.Format("MarketId = '{0}' ", mk))
            If pc <> "0" Then wc.Add(String.Format("PayCondId = '{0}' ", pc))
            If wc.Count > 0 Then
                q &= "WHERE " & Join(wc.ToArray, "AND ")
                wc.Clear()
                If k <> 0 Then wc.Add(IIf(k = 1, " single", " group"))
                If gr <> 0 Then wc.Add(" in group")
                If mk <> "0" Then wc.Add(" in market")
                If pc <> "0" Then wc.Add(" for pay condition")
                all &= Join(wc.ToArray, " and")
            End If
            q &= "ORDER BY TourOp"

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
