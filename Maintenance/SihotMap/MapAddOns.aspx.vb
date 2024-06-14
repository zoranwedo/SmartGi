
Partial Class Maintenance_SihotMap_MapAddOns
    Inherits System.Web.UI.Page

    Protected Sub fvAddOn_ItemCreated(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvAddOn.ItemCreated
        If fvAddOn.CurrentMode = FormViewMode.Insert Then
            CType(fvAddOn.FindControl("CommisionCheckBox"), CheckBox).Checked = True
        End If
    End Sub

    Protected Sub dsAddOn_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAddOn.Updated, dsAddOn.Inserted
        If e.Exception IsNot Nothing Then
            If e.Exception.InnerException IsNot Nothing Then
                If e.Exception.InnerException.Message.Contains("PK_AddOnTracking") Then
                    popShow("This tracking code is aready configured.<br />Duplicates are not allowed.")
                End If
            Else
                popShow(e.Exception.Message)
            End If
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub popShow(ByRef msg As String)
        popMessage.Text = msg
        popLabel.Text = "Tracking Code Mapping"
        popExtender.Show()
    End Sub

End Class
