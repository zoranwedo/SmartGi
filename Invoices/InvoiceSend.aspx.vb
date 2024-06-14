
Partial Class Reports_Invoices_InvoiceSend
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Me.dsFilteredInvoices.Select()
        pnlCnt.Visible = True
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        pnlCnt.Visible = False

        ddlTO.SelectedValue = ""
        fltStart.Text = Nothing
        fltFinish.Text = Nothing
        fltInvFrom.Text = Nothing
        fltInvTo0.Text = Nothing
        ddlInvType.SelectedValue = ""
        ddlHotel.SelectedValue = ""
    End Sub

    Protected Sub lbSelect_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim grv As GridViewRow
        Dim tc As DataControlFieldCell
        For Each grv In gvInvoices.Rows
            tc = grv.Cells(0)
            CType(tc.Controls(1), CheckBox).Checked = True
        Next
    End Sub

    Protected Sub lbDeselect_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim grv As GridViewRow
        Dim tc As DataControlFieldCell
        For Each grv In gvInvoices.Rows
            tc = grv.Cells(0)
            CType(tc.Controls(1), CheckBox).Checked = False
        Next
    End Sub

    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim qa As New dsInvoicesTableAdapters.QueriesTableAdapter
        Dim grv As GridViewRow
        Dim l As New LogApp
        Dim logUSR As String = Membership.GetUser.UserName
        Dim logTXT As String

        For Each grv In gvInvoices.Rows
            'InvoiceID
            'Dim iid As Integer = Int32.Parse(grv.Cells(1).Text)
            Dim iid As Integer = CType(grv.Cells(1).Controls(1), HyperLink).Text
            Dim hrb As Boolean = CType(grv.Cells(0).Controls(1), CheckBox).Checked

            If hrb Then
                Try
                    qa.SetInvState(4, logUSR, Today(), iid)
                    logTXT = "Invoice sent from hotel"
                    l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnState, LogApp.stateComplete, iid, logTXT)
                Catch ex As Exception
                    logTXT = "Invoice send from hotel ERROR: "
                    If ex.InnerException IsNot Nothing Then
                        logTXT += ex.InnerException.Message
                    Else
                        logTXT += ex.Message
                    End If
                    l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnState, LogApp.stateError, iid, logTXT)
                End Try
            End If
        Next
        gvInvoices.DataBind()
    End Sub
End Class
