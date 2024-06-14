
Partial Class Contracts_Wizard_Validate
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim cmp As Contracts_Wizard_masterWizard = CType(Master, Contracts_Wizard_masterWizard)

        If Not IsNothing(cmp) Then
            AddHandler cmp.btnWizFinishMasterPage.Click, AddressOf btnWizFinishMasterPage_Click
        End If
    End Sub

    Protected Sub btnWizFinishMasterPage_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        'Validation
        Dim CtrID As Integer = Request.QueryString(0)
        Dim UsrID As String = Membership.GetUser.UserName

        Dim qAct As New ContractStatesTableAdapters.QueriesTableAdapter
        Dim qVal As New dsCtrPrevTableAdapters.ContractValidateTableAdapter
        Dim rVal As dsCtrPrev.ContractValidateRow
        rVal = qVal.GetData(Request.QueryString(0)).Last

        If rVal.Valid = 1 And cbActivate.Checked Then
            Try
                qAct.ContractStateActivate(CtrID, UsrID)
                Me.Response.Redirect("~/Contracts/Contracts.aspx", True)
            Catch ex As Exception
                If (ex.InnerException IsNot Nothing) Then
                    popShow(False, "Error Activating Contract", ex.InnerException.Message)
                Else
                    popShow(False, "Error Activating Contract", ex.Message)
                End If
            End Try
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

    Protected Sub gvValidate_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvValidate.DataBound
        Dim q As New ContractsTableAdapters.ContractTableAdapter
        Dim proc As New dsCtrPrevTableAdapters.ContractValidateTableAdapter
        Dim gr As dsCtrPrev.ContractValidateRow
        gr = proc.GetData(Request.QueryString(0)).Last

        cbActivate.Visible = (gr.Valid = 1)
        gvValidate.SelectedIndex = gvValidate.Rows.Count - 1
    End Sub
End Class
