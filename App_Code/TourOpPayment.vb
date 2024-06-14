Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
<System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://tempuri.org/")> _
<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
 Public Class TourOpPayment
    Inherits System.Web.Services.WebService

    <WebMethod()> _
    Public Function GetPayCondId(ByVal knownCategoryValues As String) As CascadingDropDownNameValue()
        Dim PayConditions As New List(Of CascadingDropDownNameValue)
        Dim taPay As New dsTourOperatorTableAdapters.PayCondTableAdapter()
        Dim dsPay As dsTourOperator.PayCondDataTable = taPay.GetData()

        For Each r As dsTourOperator.PayCondRow In dsPay
            Dim t As String = String.Format("({0})", r.PayCondDisplay)
            PayConditions.Add(New CascadingDropDownNameValue(r.PayCondDisplay, r.PayCondID))
        Next

        Return PayConditions.ToArray()
    End Function


    <WebMethod()> _
    Public Function GetPayCondExtId(ByVal knownCategoryValues As String) As CascadingDropDownNameValue()
        Dim PayExtConditions As New List(Of CascadingDropDownNameValue)
        PayExtConditions.Add(New CascadingDropDownNameValue("not set", ""))

        Dim pay As String = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues)("PayCondId")
        Dim taPayExt As New dsTourOperatorTableAdapters.PayCondExtTableAdapter()
        Dim dsPayExt As dsTourOperator.PayCondExtDataTable = IIf(pay Is Nothing, taPayExt.GetData(), taPayExt.GetDataByPayCond(pay))

        For Each r As dsTourOperator.PayCondExtRow In dsPayExt
            PayExtConditions.Add(New CascadingDropDownNameValue(r.PayCondExt, r.PayCondExtID))
        Next

        Return PayExtConditions.ToArray()
    End Function

End Class