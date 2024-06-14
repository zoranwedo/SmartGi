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
Public Class DepEmp
    Inherits System.Web.Services.WebService

    <WebMethod()> _
    <Script.Services.ScriptMethod()> _
    Public Function GetDepID(ByVal knownCategoryValues As String, ByVal category As String, ByVal contextKey As String) As CascadingDropDownNameValue()
        Dim DepIDs As New List(Of CascadingDropDownNameValue)
        Dim taDep As New dsMaintBasicTableAdapters.DepartmentTableAdapter
        Dim dsDep As dsMaintBasic.DepartmentDataTable = taDep.GetData

        DepIDs.Add(New CascadingDropDownNameValue("-", contextKey))
        For Each r As dsMaintBasic.DepartmentRow In dsDep
            If r.IsActive Then DepIDs.Add(New CascadingDropDownNameValue(r.DepName, r.DepID.ToString))
        Next

        Return DepIDs.ToArray()
    End Function

    <WebMethod()> _
    Public Function GetEmpID(ByVal knownCategoryValues As String) As CascadingDropDownNameValue()
        Dim EmpIDs As New List(Of CascadingDropDownNameValue)
        Dim d As StringDictionary = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues)
        Dim taEmp As New dsMaintBasicTableAdapters.EmployeeTableAdapter
        Dim dsEmp As dsMaintBasic.EmployeeDataTable = taEmp.GetDataByDepID(Int32.Parse(d("DepID")))

        For Each r As dsMaintBasic.EmployeeRow In dsEmp
            If r.IsActive Then EmpIDs.Add(New CascadingDropDownNameValue(r.EmpName, r.EmpID))
        Next
        EmpIDs.Add(New CascadingDropDownNameValue("-", ""))

        Return EmpIDs.ToArray()
    End Function

    <WebMethod()> _
    Public Function GetUnitID(ByVal knownCategoryValues As String) As CascadingDropDownNameValue()
        Dim UnitsIDs As New List(Of CascadingDropDownNameValue)
        Dim d As StringDictionary = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues)
        Dim taUnits As New AccUnitsTableAdapters.AccBusinessUnitTableAdapter
        Dim dsUnits As AccUnits.AccBusinessUnitDataTable

        Dim strDepID As String = d("DepID")
        If strDepID <> "-1" Then
            dsUnits = taUnits.GetDataByDepID(Int32.Parse(strDepID))
        Else
            dsUnits = taUnits.GetDataByDepID(Nothing)
        End If

        If dsUnits.Count = 0 Then
            UnitsIDs.Add(New CascadingDropDownNameValue("-", ""))
        Else
            For Each r As AccUnits.AccBusinessUnitRow In dsUnits.Rows
                UnitsIDs.Add(New CascadingDropDownNameValue(r.AccBusinessUnitName, r.AccBusinessUnitID))
            Next
        End If

        Return UnitsIDs.ToArray()
    End Function
End Class
