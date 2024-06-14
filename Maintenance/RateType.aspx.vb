
Partial Class Maintenance_RateType
    Inherits System.Web.UI.Page

    Protected Sub popShow(ByVal Question As Boolean, ByVal Title As String, ByVal Message As String)
        popMessage.Text = Message
        popLabel.Text = Title

        If Question Then
            btnYes.Visible = True
            btnNo.Text = "No"
        Else
            btnYes.Visible = False
            btnNo.Text = "OK"
        End If
        popExtender.Show()
    End Sub

    Protected Sub dsRateTypes_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsRateTypes.Deleted, dsRateTypes.Inserted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error Rate Type", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            gridRateTypes.DataBind()
        End If
    End Sub

    Protected Sub gridRateTypes_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gridRateTypes.RowCommand
        Select e.CommandName
            Case "prUp"
                Dim p As New dsMaintBasicTableAdapters.QueriesTableAdapter
                p.RateType_UP(e.CommandArgument)
                gridRateTypes.DataBind()
                UpdatePanel1.Update()
            Case "prDwn"
                Dim p As New dsMaintBasicTableAdapters.QueriesTableAdapter
                p.RateType_Dwn(e.CommandArgument)
                gridRateTypes.DataBind()
                UpdatePanel1.Update()
        End Select
    End Sub
End Class
