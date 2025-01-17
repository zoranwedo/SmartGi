﻿Imports SIHOT_Reservations

Partial Class Maintenance_SihotRes_ResImport
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
            Dim q As New dsSIHOTTableAdapters.ResQueueTableAdapter
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
                Dim res As New ReservationProcess()
                res.MaxQueryTime = 10000        'CHANGE TO EXTEND QUERY TIMEOUT
                res.ProcessFromQueue(uid)
                popShow("Import", Nothing, "Import succeded")
            Catch ex As Exception
                popShow("Import Error", ex)
            End Try
            gvImported.DataBind()
        End If
    End Sub

    Protected Sub btImportAll_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Try
            Dim res As New ReservationProcess()
            res.MaxQueryTime = 10000            'CHANGE TO EXTEND QUERY TIMEOUT
            res.ProcessQueue()
            popShow("Import", Nothing, "Import succeded")
        Catch ex As Exception
            popShow("Import Error", ex)
        End Try
        gvImported.DataBind()
    End Sub

    'Protected Sub btImportFile_Click(ByVal sender As Object, ByVal e As System.EventArgs)
    '    If FileImport.HasFile Then
    '        Try
    '            Dim fln = Server.MapPath("../../Uploaded/" & FileImport.FileName)
    '            FileImport.SaveAs(fln)
    '            'Dim res As New ReservationProcess()
    '            Using res As New ReservationProcess()
    '                'res.MaxQueryTime = 10000        'CHANGE TO EXTEND QUERY TIMEOUT
    '                Dim log As List(Of String) = res.ProcessFile(fln)
    '                For Each l As String In log : lbImport.Items.Add(l) : Next
    '            End Using
    '            FileImport.Enabled = False
    '            btImportFile.Visible = False
    '            lbImport.Visible = True
    '            btDone.Visible = True
    '            popShow("Import", Nothing, "Import succeded")
    '        Catch ex As Exception
    '            popShow("Import Error", ex)
    '        End Try
    '    Else
    '        popShow("Import", Nothing, "Please select a file")
    '    End If
    'End Sub

    'Protected Sub btDone_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btDone.Click
    '    FileImport.Enabled = True
    '    btImportFile.Visible = True
    '    lbImport.Visible = False
    '    btDone.Visible = False
    'End Sub
End Class
