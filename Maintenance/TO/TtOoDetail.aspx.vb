Imports App_UserControls_MessagePop

Partial Class Maintenance_TO_TtOoDetail
    Inherits System.Web.UI.Page

    Protected Function HasNewRights() As Boolean
        Return My.User.IsInRole("admin") _
                Or My.User.IsInRole("tourop_admin") _
                Or My.User.IsInRole("mnt_ttoo") _
                Or My.User.IsInRole("mnt_ttoo_group")
    End Function

    Protected Function DaysLabel(ByVal PayCondId As Object) As String
        If PayCondId Is Nothing Then Return Nothing
        If PayCondId Is DBNull.Value Then Return Nothing
        Dim p As String = PayCondId
        If p.StartsWith("PP") Then
            Return "Prepayment Days"
        Else
            Return "Credit Days"
        End If
    End Function

    Protected Function DocumentLabel(ByVal BillingDoc As Object) As String
        If BillingDoc Is Nothing Then Return Nothing
        If BillingDoc Is DBNull.Value Then Return Nothing
        Dim d As String = BillingDoc
        Select Case d
            Case "FT"
                Return "Final Invoice - Individual"
            Case "FT-GR"
                Return "Final Invoice - Group"
            Case "PF"
                Return "Proforma - Individual"
            Case "PF-GR"
                Return "Proforma - Group"
            Case Else
                Return "*"
        End Select
    End Function


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim qs As String = Request.QueryString(0)

        If qs = 0 Then
            If Not (HasNewRights()) Then
                Response.Redirect("~/Maintenance/TO/TO.aspx")
            Else
                fvTourOp.ChangeMode(FormViewMode.Insert)
            End If
        End If
    End Sub

    Protected Sub dsTourOp_Inserting(ByVal sender As Object, ByVal e As ObjectDataSourceMethodEventArgs) Handles dsTourOp1.Inserting
        e.InputParameters("Active") = True
        e.InputParameters("Created") = Now()

        Dim ddlParentTourOp As DropDownList = fvTourOp.FindControl("ddlParentTourOp")
        If ddlParentTourOp.SelectedValue = String.Empty Then
            e.InputParameters("BillingParent") = False
        End If

        Dim txtCommisionRate As TextBox = fvTourOp.FindControl("txtCommisionRate")
        If txtCommisionRate.Text = String.Empty Then
            e.InputParameters("Commision") = False
        End If

        Dim ddlCountryCode As DropDownList = fvTourOp.FindControl("ddlCountryCode")
        If ddlCountryCode.SelectedValue <> String.Empty Then
            Dim cc As String() = ddlCountryCode.SelectedItem.Text.Split(") ")
            e.InputParameters("Country") = cc(1)
        Else
            e.InputParameters("Country") = Nothing
        End If

        Dim ddlPayCondId As DropDownList = fvTourOp.FindControl("ddlPayCondId")
        e.InputParameters("PayCondId") = ddlPayCondId.SelectedValue

        Dim ddlPayCondExtId As DropDownList = fvTourOp.FindControl("ddlPayCondExtId")
        e.InputParameters("PayCondExtId") = IIf(ddlPayCondExtId.SelectedValue = "", Nothing, ddlPayCondExtId.SelectedValue)
    End Sub

    Protected Sub dsTourOp_Inserted(ByVal sender As Object, ByVal e As ObjectDataSourceStatusEventArgs) Handles dsTourOp1.Inserted
        If e.Exception IsNot Nothing Then
            msgPop.Title = "Tour Operator Insert Error"
            msgPop.ShowError(e.Exception)
        Else
            Dim id As Integer = e.OutputParameters("NewID")
            Response.Redirect(String.Format("TtOoDetail.aspx?TOID={0}", id))
        End If
    End Sub

    Protected Sub fvTourOp_ItemUpdating(ByVal sender As Object, ByVal e As FormViewUpdateEventArgs) Handles fvTourOp.ItemUpdating
        Dim ddlDeliveryChannelId As DropDownList = fvTourOp.FindControl("ddlDeliveryChannelId")
        If ddlDeliveryChannelId.SelectedValue = String.Empty Then
            e.Cancel = True
            msgPop.ShowError(New Exception("You have to select a <b>Delivery Chanel</b>"))
        End If
    End Sub

    Protected Sub dsTourOp_Updating(ByVal sender As Object, ByVal e As ObjectDataSourceMethodEventArgs) Handles dsTourOp1.Updating
        Dim ddlParentTourOp As DropDownList = fvTourOp.FindControl("ddlParentTourOp")
        If ddlParentTourOp.SelectedValue = String.Empty Then
            e.InputParameters("BillingParent") = False
        End If

        Dim txtCommisionRate As TextBox = fvTourOp.FindControl("txtCommisionRate")
        If txtCommisionRate.Text = String.Empty Then
            e.InputParameters("Commision") = False
        End If

        Dim ddlCountryCode As DropDownList = fvTourOp.FindControl("ddlCountryCode")
        If ddlCountryCode.SelectedValue <> String.Empty Then
            Dim cc As String() = ddlCountryCode.SelectedItem.Text.Split(") ")
            e.InputParameters("Country") = cc(1).Substring(1)
        Else
            e.InputParameters("Country") = Nothing
        End If

        Dim ddlPayCondId As DropDownList = fvTourOp.FindControl("ddlPayCondId")
        e.InputParameters("PayCondId") = ddlPayCondId.SelectedValue

        Dim ddlPayCondExtId As DropDownList = fvTourOp.FindControl("ddlPayCondExtId")
        e.InputParameters("PayCondExtId") = IIf(ddlPayCondExtId.SelectedValue = "", Nothing, ddlPayCondExtId.SelectedValue)
    End Sub

    Protected Sub dsTourOp_Updated(ByVal sender As Object, ByVal e As ObjectDataSourceStatusEventArgs) Handles dsTourOp1.Updated
        If e.Exception IsNot Nothing Then
            msgPop.Title = "Tour Operator Update Error"
            msgPop.ShowError(e.Exception)
        End If
    End Sub

    Protected Sub dsTourOp_Deleted(ByVal sender As Object, ByVal e As ObjectDataSourceStatusEventArgs) Handles dsTourOp1.Deleted
        If e.Exception IsNot Nothing Then
            msgPop.Title = "Tour Operator Delete Error"
            msgPop.ShowError(e.Exception)
        Else
            Response.Redirect("~/Maintenance/TO/TO.aspx")
        End If
    End Sub

    Protected Sub fvTourOp_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles fvTourOp.ItemCommand
        If e.CommandName = "Add" Then
            Response.Redirect("~/Maintenance/TO/TtOoDetail.aspx?TOID=0")
        ElseIf e.CommandName = "Back" Then
            Response.Redirect("~/Maintenance/TO/TO.aspx")
        End If
    End Sub

    Protected Sub ddlPayCondId_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim ddlPayCondId As DropDownList = sender
        Dim ddlBillDoc As DropDownList = fvTourOp.FindControl("ddlBillDoc")
        Dim lblPayDays As Label = fvTourOp.FindControl("lblPayDays")
        If ddlPayCondId.Text.StartsWith("PP") Then
            ddlBillDoc.SelectedIndex = 2
            lblPayDays.Text = "Prepayment Days"
        Else
            ddlBillDoc.SelectedIndex = 0
            lblPayDays.Text = "Credit Days"
        End If
    End Sub

    Protected Sub fvTourOp_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvTourOp.DataBound
        If fvTourOp.CurrentMode = FormViewMode.Insert Then
            Dim ddlPayCondId As DropDownList = fvTourOp.FindControl("ddlPayCondId")
            Dim ddlBillDoc As DropDownList = fvTourOp.FindControl("ddlBillDoc")
            Dim lblPayDays As Label = fvTourOp.FindControl("lblPayDays")
            If ddlPayCondId.Text.StartsWith("PP") Then
                ddlBillDoc.SelectedIndex = 2
                lblPayDays.Text = "Prepayment Days"
            Else
                ddlBillDoc.SelectedIndex = 0
                lblPayDays.Text = "Credit Days"
            End If
        End If
    End Sub
End Class
