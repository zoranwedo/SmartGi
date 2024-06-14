Imports SIHOT_Reservations

Partial Class Maintenance_SihotRes_ResHistoryImport
    Inherits System.Web.UI.Page

    Protected Sub btCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btCancel.Click
        hfStep.Value = 0
        FileImport.Visible = True
        btImportFile.Visible = True
        lblPrompt.Visible = False
        btCancel.Visible = False
        gvImport.Visible = False
        btCancel.Text = "Cancel"
    End Sub

    Protected Sub btImportFile_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btImportFile.Click
        Dim strSpace = "&nbsp;&nbsp;&nbsp;&nbsp;"
        Dim div As String = "<b>{0}</b><br />"
        Dim divI As String = "<div style=""padding-left: 25px;"" >{0}</div>"
        Dim divIRed As String = "<div style=""padding-left: 25px; color: Red;"" >{0}</div>"
        Dim t As String

        If hfStep.Value = 0 Then
            If FileImport.HasFile Then
                FileImport.Visible = False
                lblPrompt.Visible = True
                btCancel.Visible = True

                Try
                    hfStep.Value = 1
                    hfFile.Value = FileImport.FileName
                    hfFileUpload.Value = Server.MapPath("../../Uploaded/" & hfFile.Value)
                    FileImport.SaveAs(hfFileUpload.Value)

                    Dim cs As String() = ReservationProcess.dllConnection()
                    t = hfFile.Value
                    lblPrompt.Text = String.Format(div, "Import from file:") & String.Format(divI, t)
                    t = cs(0) & "<br />" & cs(1)
                    lblPrompt.Text &= String.Format(div, "Databases:") & String.Format(divI, t)
                Catch ex As Exception
                    hfStep.Value = 2
                    lblPrompt.Visible = True
                    FileImport.Visible = False
                    btImportFile.Visible = False
                    btCancel.Visible = True
                    btCancel.Text = "Run new import"
                    lblPrompt.Text &= String.Format(div, "Import error:") & String.Format(divIRed, ex.Message)
                End Try
            Else
                lblPrompt.Visible = True
                lblPrompt.Text = String.Format(div, "Import file is not selected!")
            End If
        ElseIf hfStep.Value = 1 Then
            If Not String.IsNullOrEmpty(hfFile.Value) Then
                hfStep.Value = 2
                lblPrompt.Visible = True
                FileImport.Visible = False
                btImportFile.Visible = False
                btCancel.Visible = True
                btCancel.Text = "Run new import"

                lblPrompt.Text = String.Format(div, "Importing from file:") & String.Format(divI, hfFile.Value)
                lblPrompt.Text &= String.Format(div, "File transfered to:") & String.Format(divI, hfFileUpload.Value)
                Try
                    Dim res As New ReservationProcess
                    res.MaxQueryTime = 10000
                    Dim log As Data.DataTable = res.ImportCkIns(hfFileUpload.Value)

                    gvImport.Visible = True
                    gvImport.DataSource = log
                    gvImport.DataBind()

                    lblPrompt.Text &= String.Format(div, "Import succeded!")
                Catch ex As Exception
                    lblPrompt.Text &= String.Format(div, "Import error:") & String.Format(divIRed, ex.Message)
                End Try
            Else
                hfStep.Value = 0
                lblPrompt.Visible = True
                lblPrompt.Text = String.Format(div, "Import file is not selected!")
            End If
        End If
    End Sub
End Class
