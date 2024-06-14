
Partial Class Contracts_Special_FRSpecApplication
    Inherits System.Web.UI.Page
    Protected Sub btnAttachAll_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim grv As GridViewRow
        Dim ta As New dsSpecialTableAdapters.QueriesTableAdapter
        Dim cid As Int32

        For Each grv In gvContracts.Rows

            Dim hrb As Boolean = CType(grv.Cells(0).Controls(1), CheckBox).Checked
            If (hrb) Then
                cid = Int32.Parse(CType(grv.FindControl("txtContID"), Label).Text)

                Try
                    ta.SpecialContractAttach(Int32.Parse(Request.QueryString("SpecialID")), cid, Membership.GetUser.UserName)
                    gvContracts.DataBind()
                    gvAttached.DataBind()
                Catch ex As Exception
                    popShow(False, "Error Special", ex.InnerException.Message)
                End Try
            End If
        Next
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        dsFilteredContracts.DataBind()
    End Sub

    Protected Sub gvAttached_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles gvAttached.RowDeleted
        If e.Exception IsNot Nothing Then
            popShow(False, "Error Special", e.Exception.InnerException.Message)
            e.ExceptionHandled = True
        Else
            gvContracts.DataBind()
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

    Protected Sub gvAttached_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvAttached.DataBound
        Dim cmp As Contracts_Special_masterFRSpecial = CType(Master, Contracts_Special_masterFRSpecial)

        If gvAttached.Rows.Count > 0 Then
            cmp.btnWizNextMasterPage.Visible = True
        Else
            cmp.btnWizNextMasterPage.Visible = False
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim cmp As Contracts_Special_masterFRSpecial = CType(Master, Contracts_Special_masterFRSpecial)

        If Not IsNothing(cmp) Then
            AddHandler cmp.btnWizNextMasterPage.Click, AddressOf btnWizNextMasterPage_Click
        End If
    End Sub
    Protected Sub btnWizNextMasterPage_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        'Try
        '    dvContractRate.UpdateItem(False)
        'Catch ex As Exception
        '    popShow(False, "Error editing rates", ex.InnerException.Message)
        'End Try

    End Sub

End Class
