
Partial Class Contracts_Special_ExtendSpec
    Inherits System.Web.UI.Page

    Protected ReadOnly Property spoType() As Integer
        Get
            Dim h As HiddenField = fvSpecial.FindControl("hfFreeRate")
            If h Is Nothing Then
                Return 0
            Else
                Return h.Value
            End If
        End Get
    End Property

    Protected Sub fvSpecial_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvSpecial.DataBound
        If spoType > 2 And spoType < 6 Then LocalMenu.Items.RemoveAt(2)
    End Sub

    Protected Sub fvSpec_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles fvSpec.ItemCommand
        If e.CommandName = "ExtUpdate" Then
            Dim q As New dsSpecialTableAdapters.QueriesTableAdapter
            Dim s As Integer = Int32.Parse(Request.QueryString("SpecialID"))
            Dim c As TextBox
            Dim f As Nullable(Of Date)
            Dim n As String

            c = fvSpec.FindControl("txtBkFinish")
            If c.Text = "" Then f = Nothing Else f = Date.Parse(c.Text)

            c = fvSpec.FindControl("txtDescription")
            If c.Text = "" Then n = Nothing Else n = c.Text

            'Try
            q.SpecialExtend_Booking(s, f, n)
            fvSpec.ChangeMode(FormViewMode.ReadOnly)
            'Catch ex As Exception
            'End Try

        End If
    End Sub

    Protected Sub gridPeriods_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gridPeriods.RowCommand
        If e.CommandName = "ExpUpdate" Then
            Dim q As New dsSpecialTableAdapters.QueriesTableAdapter
            Dim s As Integer = Int32.Parse(Request.QueryString("SpecialID"))
            Dim p As Integer = e.CommandArgument
            Dim c As TextBox
            Dim n As String

            c = gridPeriods.Rows(gridPeriods.EditIndex).FindControl("txtNote")
            If c.Text = "" Then n = Nothing Else n = c.Text

            'Try
            q.SpecialExtend_Notes(s, p, n)
            gridPeriods.EditIndex = -1
            'Catch ex As Exception
            'End Try

        End If
    End Sub

    Protected Sub fvSpecial_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles fvSpecial.ItemCommand
        If e.CommandName = "CloseExtend" Then
            Response.Redirect("~/Contracts/Special/DetailSpec.aspx?SpecialID=" & Request.QueryString("SpecialID"))
        End If
    End Sub

    Protected Sub cmdWizClose_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles cmdWizClose.Click
        Response.Redirect("~/Contracts/Special/DetailSpec.aspx?SpecialID=" & Request.QueryString("SpecialID"))
    End Sub

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
End Class
