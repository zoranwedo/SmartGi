
Partial Class Contracts_Create_CreateFromContractChgYear
    Inherits System.Web.UI.Page

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        'Dim cnt As New ContractsTableAdapters.QueriesTableAdapter

        'If (String.IsNullOrEmpty(gvContracts.SelectedValue)) Or (String.IsNullOrEmpty(txtYear.Text)) Or String.IsNullOrEmpty(ddlTitle.SelectedValue) Or String.IsNullOrEmpty(txtRateChange.Text) Then
        '    popShow(False, "Error parameters", "Some of parameters are missing!")
        '    Exit Sub
        'End If

        'Try
        '    cnt.ContractChangeYear(Int32.Parse(gvContracts.SelectedValue), ddlTitle.SelectedValue, Int16.Parse(txtYear.Text), Decimal.Parse(txtRateChange.Text))
        '    popShow(False, "Notify", "Contract " & ddlTitle.SelectedValue & " is created")
        'Catch ex As Exception
        '    popShow(False, "Error creating contract", ex.InnerException.Message)
        'End Try
        If Not String.IsNullOrEmpty(ddlTitle.SelectedValue) Then
            txtContID.Text = ddlTitle.SelectedValue
        End If

        gvContracts.DataBind()
    End Sub

    Protected Sub txtYear_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtYear.TextChanged
        ddlTitle.DataBind()
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

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim cnt As New ContractsTableAdapters.QueriesTableAdapter

        If (String.IsNullOrEmpty(gvContracts.SelectedValue)) Or (String.IsNullOrEmpty(txtYear.Text)) Or String.IsNullOrEmpty(ddlTitle.SelectedValue) Or String.IsNullOrEmpty(txtRateChange.Text) Then
            popShow(False, "Error parameters", "Some of parameters are missing!")
            Exit Sub
        End If

        Try
            cnt.ContractChangeYear(Int32.Parse(gvContracts.SelectedValue), ddlTitle.SelectedValue, Int16.Parse(txtYear.Text), Decimal.Parse(txtRateChange.Text), Membership.GetUser.UserName)
            popShow(False, "Notify", "Contract " & ddlTitle.SelectedValue & " is created")
        Catch ex As Exception
            popShow(False, "Error creating contract", ex.InnerException.Message)
        End Try
    End Sub

    Protected Sub ddlContracts_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlContracts.SelectedIndexChanged
        ' txtContID.Text = ddlContracts.SelectedValue
    End Sub
End Class
