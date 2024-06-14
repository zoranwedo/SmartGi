
Partial Class Contracts_Special_Wizard_ManageRate
    Inherits System.Web.UI.Page

    Protected Sub btnNew_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNew.Click
        Dim gen As New ContractsTableAdapters.ContractRateOptionTableAdapter

        Try
            gen.ContractRateGenerate(Request.QueryString(0))
            gridPeriods1.DataBind()
        Catch ex As Exception
            popShow(False, "Error generate rates", ex.InnerException.Message)
        End Try

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

    Protected Sub btnNew0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNew0.Click
        Try
            For Each row As GridViewRow In gridPeriods1.Rows
                gridPeriods1.UpdateRow(row.RowIndex, False)
            Next
            'dsRateOption.DataBind()
            ' Me.gridPeriods1.DataBind()
        Catch ex As Exception
            popShow(False, "Error editing periods", ex.InnerException.Message)
        End Try
        ' btnNew.Visible = True
    End Sub

    Protected Sub ObjectDataSource1_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ObjectDataSource1.Updated
        If e.Exception IsNot Nothing Then
            popShow(False, "Error editing rate option", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            ' Me.gridPeriods.DataBind()
        End If
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim cmp As Contracts_Special_Wizard_masterWizard = CType(Master, Contracts_Special_Wizard_masterWizard)

        If Not IsNothing(cmp) Then
            AddHandler cmp.btnWizNextMasterPage.Click, AddressOf btnWizNextMasterPage_Click
            gridPeriods1.Enabled = cmp.CanEdit()
            btnNew.Visible = cmp.CanEdit()
            btnNew0.Visible = cmp.CanEdit()
        End If

    End Sub
    Protected Sub btnWizNextMasterPage_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim gen As New ContractsTableAdapters.ContractRateOptionTableAdapter

        If Master.CanEdit Then
            Try
                btnNew0_Click(sender, e)
                gen.ContractRateGenerate(Request.QueryString(0))
                '  btnNew.Visible = False
            Catch ex As Exception
                popShow(False, "Error generate rates", ex.InnerException.Message)
            End Try
        End If

    End Sub

    'Protected Sub gridPeriods1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gridPeriods1.RowDataBound
    '    If e.Row.RowType = DataControlRowType.DataRow Then
    '        Dim q As New ContractsTableAdapters.QueriesTableAdapter
    '        Dim mid As String
    '        Dim cnst As Int16

    '        mid = CType(e.Row.FindControl("lblMP"), Label).Text
    '        cnst = q.MPConbtrain(mid)
    '        CType(e.Row.FindControl("rblRateOption"), RadioButtonList).Enabled = ((cnst) = 0)
    '    End If
    'End Sub

    Protected Sub gridPeriods1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gridPeriods1.DataBound
        Dim cmp As Contracts_Special_Wizard_masterWizard = CType(Master, Contracts_Special_Wizard_masterWizard)
        Dim p As New ContractsTableAdapters.QueriesTableAdapter
        btnNew.Visible = p.CanGenerateContractRates(Request.QueryString(0)) And cmp.CanEdit()
    End Sub
End Class
