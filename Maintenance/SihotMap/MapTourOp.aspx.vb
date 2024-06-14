
Partial Class Maintenance_SihotMap_MapTourOp
    Inherits System.Web.UI.Page

    Protected Sub popShow(ByVal Title As String, ByRef ex As Exception, Optional ByVal Message As String = "-")
        If ex IsNot Nothing Then
            Try
                If ex.InnerException IsNot Nothing Then
                    popMessage.Text = ex.InnerException.Message
                Else
                    popMessage.Text = ex.Message
                End If
            Catch e As Exception
                popMessage.Text = ex.ToString
            End Try
        Else
            popMessage.Text = Message
        End If
        popLabel.Text = Title
        popExtender.Show()
    End Sub

    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        fltName.Text = Nothing
        fltActive.Checked = True
    End Sub

    Protected Sub gvTourOps_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvTourOps.DataBinding
        gvTourOps.Columns(0).Visible = Not fltActive.Checked
    End Sub

    Protected Sub gvTourOps_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvTourOps.RowCommand
        If e.CommandName = "AddMapping" Then
            Dim ta As New dsSIHOTTableAdapters.TourOpMapTableAdapter
            Try
                Dim hID As Integer = e.CommandArgument
                Dim r As GridViewRow = gvTourOps.Rows(gvTourOps.EditIndex)
                Dim shID As Long = CType(r.FindControl("txtPROFILE_CENTRAL_ID"), TextBox).Text
                Dim uID As String = My.User.Name
                ta.AddMapping(hID, shID, uID)
                gvTourOps.EditIndex = -1
                gvTourOps.DataBind()
            Catch ex As Exception
                popShow("Error Adding Tour Operator Mapping", ex)
            End Try
        ElseIf e.CommandName = "RemoveMapping" Then
            Dim ta As New dsSIHOTTableAdapters.TourOpMapTableAdapter
            Try
                Dim hID As Integer = e.CommandArgument
                Dim uID As String = My.User.Name
                ta.RemoveMapping(hID, uID)
                gvTourOps.DataBind()
            Catch ex As Exception
                popShow("Error Removing Tour Opeartor Mapping", ex)
            End Try
        End If
    End Sub
End Class
