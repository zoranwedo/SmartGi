
Partial Class Invoices_InvoiceFormPGrid
    Inherits System.Web.UI.Page
    Protected IsActive As Boolean = False

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        IsActive = Request.QueryString("Edit") = 1
        btnApply.Visible = IsActive

        For Each r As GridViewRow In gvSuppRates.Rows
            Dim cb As CheckBox = r.FindControl("cbRate")
            If cb IsNot Nothing Then
                cb.Attributes("onclick") = "CheckMe(this);"
            End If
        Next

    End Sub

    Protected Function ExceptionText(ByRef ex As Exception) As String
        Dim result As String
        If ex.InnerException IsNot Nothing Then
            result = ex.InnerException.Message
        Else
            result = ex.Message
        End If

        Return result
    End Function

    Protected Sub dsSuppRate_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles dsSuppRate.Selecting
        e.InputParameters("HRate") = My.User.IsInRole("hotel")
    End Sub

    Protected Sub SuppInsert_Command(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs)
        Dim DetailID As Integer = Request.QueryString("DetailID")
        Dim newRateID As Int64 = e.CommandArgument
        Dim newRateCD As String = e.CommandName

        Dim stayQ As New dsInvoiceFormTableAdapters.LogRateUpdateTableAdapter
        Dim stayT As dsInvoiceForm.LogRateUpdateDataTable = stayQ.GetDataByDetail(DetailID)
        Dim stayR As dsInvoiceForm.LogRateUpdateRow = stayT.Rows(0)

        Dim logUSR As String = My.User.Name
        Dim logTXT As String = "Supplement rate for invoice stay detail " & stayR.DetailID.ToString & "/" & stayR.DetText & " add"
        Dim logTO As String = " to " & newRateID.ToString & "/" & newRateCD

        Dim l As New LogApp
        Dim q As New dsInvoiceFormTableAdapters.QueriesTableAdapter

        Try
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnUpdate, LogApp.stateStart, stayR.InvoiceId, logTXT & logTO)
            q.InvBillInsert(stayR.InvoiceId, DetailID, newRateID)
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnUpdate, LogApp.stateComplete, stayR.InvoiceId, logTXT & "ed" & logTO)
            ClientScript.RegisterStartupScript(Me.GetType(), "onload", "okay();", True)
        Catch ex As Exception
            logTXT += logTO & " ERROR: " & ExceptionText(ex)
            l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnUpdate, LogApp.stateError, stayR.InvoiceId, logTXT)
            lblError.Visible = True
            gvSuppRates.Visible = False
            fvInfo.Visible = False
        End Try
    End Sub

    Protected Sub btnApply_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnApply.Click
        Dim DetailID As Integer = Request.QueryString("DetailID")

        Dim stayQ As New dsInvoiceFormTableAdapters.LogRateUpdateTableAdapter
        Dim stayT As dsInvoiceForm.LogRateUpdateDataTable = stayQ.GetDataByDetail(DetailID)
        Dim stayR As dsInvoiceForm.LogRateUpdateRow = stayT.Rows(0)

        Dim logUSR As String = My.User.Name

        Dim l As New LogApp
        Dim q As New dsInvoiceFormTableAdapters.QueriesTableAdapter

        Dim appError As Boolean = False
        Dim appErrorMsg As String = "Supplement application errors:<br />"

        For Each r As GridViewRow In gvSuppRates.Rows
            Dim cb As CheckBox = r.FindControl("cbRate")
            If cb IsNot Nothing Then
                If cb.Checked Then
                    Dim newRateID As Int64 = CType(r.FindControl("hfRateID"), HiddenField).Value
                    Dim newRateCD As String = CType(r.FindControl("hfRateCodeID"), HiddenField).Value

                    Dim logTXT As String = "Supplement rate for invoice stay detail " & stayR.DetailID.ToString & "/" & stayR.DetText & " add"
                    Dim logTO As String = " to " & newRateID.ToString & "/" & newRateCD

                    Try
                        l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnUpdate, LogApp.stateStart, stayR.InvoiceId, logTXT & logTO)
                        q.InvBillInsert(stayR.InvoiceId, DetailID, newRateID)
                        l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnUpdate, LogApp.stateComplete, stayR.InvoiceId, logTXT & "ed" & logTO)
                    Catch ex As Exception
                        appErrorMsg += ExceptionText(ex) & "<br />"
                        logTXT += logTO & " ERROR: " & ExceptionText(ex)
                        l.LogUserAction(logUSR, LogApp.objInv, LogApp.evnUpdate, LogApp.stateError, stayR.InvoiceId, logTXT)
                    End Try
                End If
            End If
        Next

        If Not appError Then
            ClientScript.RegisterStartupScript(Me.GetType(), "onload", "okay();", True)
        Else
            lblError.Text = appErrorMsg
            lblError.Visible = True
            gvSuppRates.Visible = False
            fvInfo.Visible = False
        End If
    End Sub

    Protected Sub gvSuppRates_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvSuppRates.SelectedIndexChanged
        For Each r As GridViewRow In gvSuppRates.Rows
            Dim cb As CheckBox = r.FindControl("cbRate")
            If cb IsNot Nothing Then
                If cb.Checked Then r.Cells(1).CssClass = "CheckedRow" Else r.Cells(1).CssClass = Nothing
            End If
        Next
    End Sub
End Class
