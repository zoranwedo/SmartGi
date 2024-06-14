
Partial Class Maintenance_SihotMap_MapRoom
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
    End Sub

    Protected Sub gvRoomTypes_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvRoomTypes.RowCommand
        If e.CommandName = "AddMapping" Then
            Dim ta As New dsSIHOTTableAdapters.RoomTypeMapTableAdapter
            Try
                Dim rtID As String = e.CommandArgument
                Dim r As GridViewRow = gvRoomTypes.Rows(gvRoomTypes.EditIndex)
                Dim shCD As String = CType(r.FindControl("txtCODE"), TextBox).Text
                Dim uID As String = My.User.Name
                ta.AddMapping(rtID, shCD, uID)
                gvRoomTypes.EditIndex = -1
                gvRoomTypes.DataBind()
            Catch ex As Exception
                popShow("Error Adding Room Type Mapping", ex)
            End Try
        ElseIf e.CommandName = "RemoveMapping" Then
            Dim ta As New dsSIHOTTableAdapters.RoomTypeMapTableAdapter
            Try
                Dim rtID As String = e.CommandArgument
                Dim uID As String = My.User.Name
                ta.RemoveMapping(rtID, uID)
                gvRoomTypes.DataBind()
            Catch ex As Exception
                popShow("Error Removing Room Type Mapping", ex)
            End Try
        End If
    End Sub
End Class
