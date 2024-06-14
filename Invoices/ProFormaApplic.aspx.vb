
Partial Class Invoices_ProFormaApplic
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not (Page.IsPostBack) Then
            cbHotel.Checked = ModificationRights.RightsHotel
        End If
    End Sub

    Protected Sub fvInvoice_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles fvInvoice.DataBound
        dsPrePay.SelectParameters.Item("HotelID").DefaultValue = fvInvoice.DataKey.Item(0)
        dsPrePay.SelectParameters.Item("TourOpID").DefaultValue = fvInvoice.DataKey.Item(1)
        dsPrePay.Select()
    End Sub

    Protected Sub gvMix_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles gvMix.RowUpdated

    End Sub

    Protected Sub gvMix_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles gvMix.RowUpdating
        'Dim grv As GridView sender,
        'dsMix.UpdateParameters.Item("DetailID").DefaultValue = gvMix.DataKeys.Item(0).Value
        ''dsMix.UpdateParameters.Item("DetailID").DefaultValue = gvMix.Rows.Item(e.RowIndex)
        'dsMix.UpdateParameters.Item("Date").DefaultValue = Today()

        'If CType(gvMix.Rows.Item(e.RowIndex).FindControl("cbAllAm"), CheckBox).Checked Then

        'Else
        '    dsMix.UpdateParameters.Item("Part").DefaultValue = Int32.Parse(CType(gvMix.Rows.Item(e.RowIndex).FindControl("txtAmount"), TextBox).Text)
        'End If

        'dsMix.UpdateParameters.Item("Full").DefaultValue = CType(gvMix.Rows.Item(e.RowIndex).FindControl("cbAllAm"), CheckBox).Checked

    End Sub

    Protected Sub gvMix_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvMix.RowCommand
        Dim q As New ProFormaApliicTableAdapters.QueriesTableAdapter

        If e.CommandName = "Applic" Then

            Dim btnDetails As Button = CType(e.CommandSource, Button)

            Dim row As GridViewRow = CType(btnDetails.NamingContainer, GridViewRow)

            Dim full As Boolean = CType(row.FindControl("cbAllAm"), CheckBox).Checked

            Dim part As Decimal
            Dim ppleft As Decimal = 0
            Dim proleft As Decimal = 0

            If Not String.IsNullOrEmpty(CType(row.FindControl("txtAmount"), TextBox).Text) Then
                part = Decimal.Parse(CType(row.FindControl("txtAmount"), TextBox).Text)
            End If

            If full Or Not String.IsNullOrEmpty(CType(row.FindControl("txtAmount"), TextBox).Text) Then


                Try
                    q.ProFormaPpApp(Int32.Parse(e.CommandArgument), Int32.Parse(GridView1.SelectedValue), Today(), full, part, ppleft, proleft, Membership.GetUser.UserName)

                Catch ex As Exception
                    'popShow(False, "Error", ex.InnerException.Message)
                End Try

                GridView1.DataBind()
                gvMix.DataBind()
                'UpdatePanel3.Update()
                'gvMix.EnableViewState = False
                'UpdatePanel1.Update()
            Else
                popShow(False, "Warning", "You must check AllAm or input amount for application!")

            End If

        End If


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
