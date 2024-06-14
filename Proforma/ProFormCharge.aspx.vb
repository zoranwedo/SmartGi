Imports System.Data.SqlClient

Partial Class Proforma_ProFormCharge
    Inherits System.Web.UI.Page

    Public Function TotalSign(ByVal total As Decimal) As String
        Dim sgn As String
        If total = 0 Then
            sgn = "Balance"
        ElseIf total > 0 Then
            sgn = "Debit"
        Else
            sgn = "Credit"
        End If

        Return sgn
    End Function

    Protected Sub fvCharge_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles fvCharge.ItemCommand
        If e.CommandName = "AddNew" Then
            Dim ProformaID As Integer = Request.QueryString("ProformaID")
            Dim DateText As String = CType(fvCharge.FindControl("insDateText"), TextBox).Text
            Dim Amount As Decimal = CType(fvCharge.FindControl("insAmount"), TextBox).Text
            Dim HotelText As String = CType(fvCharge.FindControl("insHotelText"), TextBox).Text

            Dim q As New dsProformaTableAdapters.InvDocumentChargingTableAdapter
            q.Insert(ProformaID, DateText, Amount, HotelText)
            fvCharge.ChangeMode(FormViewMode.ReadOnly)
        End If
    End Sub

    Protected Sub gvCharge_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs)
        fvCharge.DataBind()
    End Sub

    Protected Sub gvCharge_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs)
        fvCharge.DataBind()
    End Sub
End Class
