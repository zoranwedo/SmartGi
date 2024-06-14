
Partial Class Contracts_Special_Wizard_Validate
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim cmp As Contracts_Special_Wizard_masterWizard = CType(Master, Contracts_Special_Wizard_masterWizard)

        If Not IsNothing(cmp) Then
            AddHandler cmp.btnWizFinishMasterPage.Click, AddressOf btnWizFinishMasterPage_Click

        End If
    End Sub
    Protected Sub btnWizFinishMasterPage_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        'Validation
        'Dim q As New ContractsTableAdapters.ContractTableAdapter
        'Dim proc As New dsCtrPrevTableAdapters.ContractValidateTableAdapter
        'Dim gr As dsCtrPrev.ContractValidateRow
        'gr = proc.GetData(Request.QueryString(0)).Last

        'If gr.Valid = 1 And cbActivate.Checked Then
        '    Try
        '        q.UpdateState(4, Request.QueryString(0))
        '    Catch ex As Exception
        '        popShow(False, "Error Activating Special", ex.InnerException.Message)
        '    End Try
        'End If

        Me.Response.Redirect("~/Contracts/Special/FRApplication.aspx?SpecialID=" & Master.hfSpecialIDMasterPage.Value)
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

    Protected Sub gvValidate_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvValidate.DataBound
        Dim q As New ContractsTableAdapters.ContractTableAdapter
        Dim proc As New dsCtrPrevTableAdapters.ContractValidateTableAdapter
        Dim gr As dsCtrPrev.ContractValidateRow
        gr = proc.GetData(Request.QueryString(0)).Last

        'cbActivate.Visible = (gr.Valid = 1)
        gvValidate.SelectedIndex = gvValidate.Rows.Count - 1
    End Sub
End Class
