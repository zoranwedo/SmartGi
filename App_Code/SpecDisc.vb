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
Public Class SpecDisc
    Inherits System.Web.Services.WebService

    <WebMethod()> _
    Public Function GetTypeID(ByVal knownCategoryValues As String, ByVal category As String, ByVal contextKey As String) As CascadingDropDownNameValue()
        Dim DiscountTypes As New List(Of CascadingDropDownNameValue)

        If contextKey = "Sc" Then DiscountTypes.Add(New CascadingDropDownNameValue("-", ""))
        DiscountTypes.Add(New CascadingDropDownNameValue("Percentage", "1"))
        DiscountTypes.Add(New CascadingDropDownNameValue("Amount", "2"))
        DiscountTypes.Add(New CascadingDropDownNameValue("Free pax", "3"))
        DiscountTypes.Add(New CascadingDropDownNameValue("Free nights", "4"))
        DiscountTypes.Add(New CascadingDropDownNameValue("Room upgrade", "5"))
        If contextKey <> "Sc" Then DiscountTypes.Add(New CascadingDropDownNameValue("Free rates", "6"))

        Return DiscountTypes.ToArray()
    End Function

    <WebMethod()> _
    Public Function GetEdTypeID(ByVal knownCategoryValues As String, ByVal category As String, ByVal contextKey As String) As CascadingDropDownNameValue()
        Dim DiscountTypes As New List(Of CascadingDropDownNameValue)

        If contextKey = "Sc" Then DiscountTypes.Add(New CascadingDropDownNameValue("-", ""))
        DiscountTypes.Add(New CascadingDropDownNameValue("Percentage", "1"))
        DiscountTypes.Add(New CascadingDropDownNameValue("Amount", "2"))
        DiscountTypes.Add(New CascadingDropDownNameValue("Free pax", "3"))
        DiscountTypes.Add(New CascadingDropDownNameValue("Free nights", "4"))
        DiscountTypes.Add(New CascadingDropDownNameValue("Room upgrade", "5"))

        Return DiscountTypes.ToArray()
    End Function

    <WebMethod()> _
    Public Function GetOn(ByVal knownCategoryValues As String, ByVal category As String, ByVal contextKey As String) As CascadingDropDownNameValue()
        Dim DiscountTypes As New List(Of CascadingDropDownNameValue)
        Dim d As StringDictionary = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues)
        Dim t As Integer

        If (Not (d.ContainsKey(contextKey & "TypeID")) Or Not (Int32.TryParse(d(contextKey & "TypeID"), t))) Then
            DiscountTypes.Add(New CascadingDropDownNameValue("-", ""))
        Else
            If t > 3 Then DiscountTypes.Add(New CascadingDropDownNameValue("-", ""))
            If t < 3 Then DiscountTypes.Add(New CascadingDropDownNameValue("all", "F"))
            If t < 4 Then
                DiscountTypes.Add(New CascadingDropDownNameValue("adult", "A"))
                DiscountTypes.Add(New CascadingDropDownNameValue("extra pax", "E"))
                DiscountTypes.Add(New CascadingDropDownNameValue("children", "C"))
            End If
        End If

        Return DiscountTypes.ToArray()
    End Function

    <WebMethod()> _
    Public Function GetDiscount(ByVal knownCategoryValues As String, ByVal category As String, ByVal contextKey As String) As CascadingDropDownNameValue()
        Dim Discount As New List(Of CascadingDropDownNameValue)
        Dim d As StringDictionary = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues)
        Dim t As Integer
        Dim bSevLal As Boolean
        Dim dSevLal As Decimal
        Dim bHasSel As Boolean = False

        bSevLal = Decimal.TryParse(category, dSevLal)

        If (Not (d.ContainsKey(contextKey & "TypeID")) Or Not (Int32.TryParse(d(contextKey & "TypeID"), t))) Then
            Discount.Add(New CascadingDropDownNameValue("-", ""))
            Return Discount.ToArray()
        Else
            Dim p As New dsSpecialTableAdapters.SpecialDiscountValueTableAdapter
            Dim v As DataTable

            v = p.GetData(t)
            For Each r As DataRow In v.Rows
                Discount.Add(New CascadingDropDownNameValue(r("DiscountValue").ToString, r("DiscountValue").ToString))
                If bSevLal And (dSevLal = r("DiscountValue")) Then bHasSel = True
            Next

            If Not bHasSel Then
                Discount.Add(New CascadingDropDownNameValue(dSevLal.ToString, dSevLal.ToString))
            End If
        End If

        Return Discount.ToArray()
    End Function

End Class
