Imports SHOT_Rates

Partial Class Maintenance_SihotRates_RateImport
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

    Protected Sub gvImported_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvImported.RowCommand
        If e.CommandName = "CancelImport" Then
            Dim q As New dsSIHOTTableAdapters.RateQueueTableAdapter
            Try
                Dim uid As New Guid(e.CommandArgument.ToString)
                q.CancelImport(uid)
                gvImported.DataBind()
                gvImported.EditIndex = -1
            Catch ex As Exception
                popShow("Error canceling import", ex)
            End Try
        ElseIf e.CommandName = "Import" Then
            Try
                Dim uid As New Guid(e.CommandArgument.ToString)
                Dim rate As New RateProcess
                rate.ProcessFromQueue(uid)
                popShow("Import", Nothing, "Import succeded")
            Catch ex As Exception
                popShow("Import Error", ex)
            End Try
            gvImported.DataBind()
        End If
    End Sub

    Protected Sub btImportAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btImportAll.Click
        Try
            Dim rate As New RateProcess
            'rate.MaxQueryTime = 30000           'CHANGE TO EXTEND QUERY TIMEOUT
            rate.ProcessQueue()
            popShow("Import", Nothing, "Import succeded")
        Catch ex As Exception
            popShow("Import Error", ex)
        End Try
        gvImported.DataBind()
    End Sub

    Protected Sub btImportFile_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btImportFile.Click
        'Dim sRates As New SIHOTRates
        If FileImport.HasFile Then
            Dim rate As RateProcess
            Dim fln As String
            Dim fID As Integer
            Try
                rate = New RateProcess
                'rate.MaxQueryTime = 30000           'CHANGE TO EXTEND QUERY TIMEOUT
                fln = Server.MapPath("../../Uploaded/" & FileImport.FileName)
                FileImport.SaveAs(fln)
                fID = rate.ProcessFile(fln)
            Catch ex As Exception
                popShow("Import Error", ex)
                Exit Sub
            End Try
            Try
                FileImport.Enabled = False
                btImportFile.Visible = False
                btDone.Visible = True
                popShow("Import", Nothing, "Import finished")
                gvCtr.DataSource = rate.ImportedContracts(fID)
                gvFrs.DataSource = rate.ImportedFreeRates(fID)
                gvSpo.DataSource = rate.ImportedSpecials(fID)
                gvSupp.DataSource = rate.ImportedSuplementsGeneral(fID)
                gvChgSupp.DataSource = rate.ImportedSuplementsCharging(fID)
                gvCtr.DataBind()
                gvFrs.DataBind()
                gvSpo.DataBind()
                gvSupp.DataBind()
                gvChgSupp.DataBind()
            Catch ex As Exception

            End Try
        Else
            popShow("Import", Nothing, "Please select a file")
        End If
    End Sub

    Protected Sub btDone_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btDone.Click
        FileImport.Enabled = True
        btImportFile.Visible = True
        btDone.Visible = False
    End Sub
End Class
