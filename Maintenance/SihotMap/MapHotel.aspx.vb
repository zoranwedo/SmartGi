
Partial Class Maintenance_SihotMap_MapHotel
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

    Protected Sub gvHotels_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvHotels.DataBinding
        gvHotels.Columns(0).Visible = Not fltActive.Checked
    End Sub

    Protected Sub gvHotels_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvHotels.RowCommand
        If e.CommandName = "AddMapping" Then
            Dim ta As New dsSIHOTTableAdapters.HotelMapTableAdapter
            Try
                Dim r As GridViewRow = gvHotels.Rows(gvHotels.EditIndex)
                Dim hID As Integer = e.CommandArgument
                Dim shNO As Integer = CType(r.FindControl("txtHOTEL_NO"), TextBox).Text
                Dim shCC As String = CType(r.FindControl("txtCOMPLEX_CODE"), TextBox).Text
                Dim uID As String = My.User.Name
                If String.IsNullOrEmpty(shCC) Then shCC = "*"
                ta.AddMapping(hID, shNO, shCC, uID)
                gvHotels.EditIndex = -1
                gvHotels.DataBind()
            Catch ex As Exception
                popShow("Error Adding Hotel Mapping", ex)
            End Try
        ElseIf e.CommandName = "RemoveMapping" Then
            Dim ta As New dsSIHOTTableAdapters.HotelMapTableAdapter
            Try
                Dim arg As String() = e.CommandArgument.ToString.Split(",")
                Dim hID As Integer = arg(0)
                Dim shNO As Integer = arg(1)
                Dim shCC As String = arg(2)
                Dim uID As String = My.User.Name
                ta.RemoveMapping(hID, shNO, shCC, uID)
                gvHotels.DataBind()
            Catch ex As Exception
                popShow("Error Removing Hotel Mapping", ex)
            End Try
        End If
    End Sub

    Protected Sub fvHotel_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles fvHotel.ItemCommand
        If e.CommandName = "AddMapping" Then
            Dim ta As New dsSIHOTTableAdapters.HotelMapTableAdapter
            Try
                Dim hID As Integer = CType(fvHotel.FindControl("cbHotel"), DropDownList).SelectedValue
                Dim shNO As Integer = CType(fvHotel.FindControl("txtHOTEL_NO"), TextBox).Text
                Dim shCC As String = CType(fvHotel.FindControl("txtCOMPLEX_CODE"), TextBox).Text
                Dim uID As String = My.User.Name
                If String.IsNullOrEmpty(shCC) Then shCC = "*"
                ta.AddMapping(hID, shNO, shCC, uID)
                fvHotel.ChangeMode(FormViewMode.ReadOnly)
                gvHotels.DataBind()
            Catch ex As Exception
                popShow("Error Adding Hotel Mapping", ex)
            End Try
        End If
    End Sub
End Class
