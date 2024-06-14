
Partial Class Maintenance_Hotel_HotelDetail
    Inherits System.Web.UI.Page
    Private InsHotelID As Integer = 0

    Protected Sub btnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        For Each row As GridViewRow In gridMealPlan.Rows
            gridMealPlan.UpdateRow(row.RowIndex, False)
        Next
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If fileUpload.PostedFile Is Nothing OrElse String.IsNullOrEmpty(fileUpload.PostedFile.FileName) OrElse fileUpload.PostedFile.InputStream Is Nothing Then
            popShow(False, "Hotel Logo", "No file specified.")
            Exit Sub
        Else
            Dim fileName As String = fileUpload.PostedFile.FileName
            Dim tmp As Integer = (fileName.ToString()).LastIndexOf("\")
            Dim tmpT As Integer = (fileName.ToString()).LastIndexOf(".")
            Dim fileurl As String = ""
            Dim ext As String = fileName.Substring(fileName.LastIndexOf("."))
            ext = ext.ToLower

            Dim imgType = fileUpload.PostedFile.ContentType
            If ext = ".jpg" Then
            ElseIf ext = ".bmp" Then
            ElseIf ext = ".gif" Then
            ElseIf ext = "jpg" Then
            ElseIf ext = "bmp" Then
            ElseIf ext = "gif" Then
            Else
                popShow(False, "Hotel Logo", "Only gif, bmp, or jpg format files supported.")
                Exit Sub
            End If

            Dim imgBytes(fileUpload.PostedFile.InputStream.Length) As Byte
            fileUpload.PostedFile.InputStream.Read(imgBytes, 0, imgBytes.Length)

            Try
                dsHotelLogo.Update()
            Catch ex As Exception
                popShow(False, "Hotel Logo", "An error occured while uploading Image... Please try again.")
                Exit Sub
            End Try


            Dim proc As New dsMaintHotelTableAdapters.HotelTableAdapter
            Dim returnval As Integer
            Try
                returnval = proc.UpdateLogo(imgBytes, Int32.Parse(Request.QueryString(0)))
            Catch ex As Exception
                popShow(False, "Hotel Logo", "An error occured while uploading Image... Please try again.")
                Exit Sub
            End Try

            imgGrid.DataBind()
        End If
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Dim proc As New dsMaintHotelTableAdapters.HotelTableAdapter
        Dim returnval As Integer
        Dim imgBytes() As Byte = Nothing

        Try
            returnval = proc.UpdateLogo(imgBytes, Int32.Parse(Request.QueryString(0)))
        Catch ex As Exception
            popShow(False, "Hotel Logo", "An error occured while deleting Image... Please try again.")
            Exit Sub
        End Try

        imgGrid.DataBind()
    End Sub

    Protected Sub dwHotelDetail_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) Handles dwHotelDetail.ItemDeleted
        If e.Exception Is Nothing Then
            Response.Redirect("Hotels.aspx", True)
        Else
            popShow(False, "Hotel Detail", ExceptionMess.GetExceptionMessDelete(e))
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub dwHotelDetail_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles dwHotelDetail.ItemInserted
        If e.Exception IsNot Nothing Then
            popShow(False, "Hotel Detail", ExceptionMess.GetExceptionMessInsert(e))
            e.ExceptionHandled = True
        Else
            pnlMP.Visible = True
            pnlUpload.Visible = True
        End If
    End Sub

    Protected Sub dwHotelDetail_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles dwHotelDetail.ItemUpdated
        If e.Exception IsNot Nothing Then
            popShow(False, "Hotel Detail", ExceptionMess.GetExceptionMessUpdate(e))
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub dsHotelDetail_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsHotelDetail.Inserted
        If e.Exception Is Nothing Then
            Response.Redirect(String.Format("HotelDetail.aspx?HotelID={0}", InsHotelID))
        Else
            If (e.Exception.InnerException IsNot Nothing) Then
                popShow(False, "Hotel Detail", e.Exception.InnerException.Message)
            Else
                popShow(False, "Hotel Detail", e.Exception.Message)
            End If
            'e.ExceptionHandled = True
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim qs As String = Request.QueryString(0)

        If qs = 0 Then
            dwHotelDetail.ChangeMode(DetailsViewMode.Insert)
            pnlUpload.Visible = False
            pnlMP.Visible = False
        End If
    End Sub

    Protected Sub dwHotelDetail_ModeChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewModeEventArgs) Handles dwHotelDetail.ModeChanging
        '   Dim q As New dsMaintHotelTableAdapters.HotelTableAdapter
        '     Dim qc As Integer = q.GetMaxSort.Rows(0).Item(0)

        If (e.NewMode = DetailsViewMode.Insert) Then
            pnlMP.Visible = False
            pnlUpload.Visible = False
            'ctype(dwHotelDetail.FindControl("txtSort"),TextBox)
        Else
            pnlMP.Visible = True
            pnlUpload.Visible = True
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

    Protected Sub dwHotelDetail_ItemInserting(sender As Object, e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles dwHotelDetail.ItemInserting
        InsHotelID = e.Values("HotelID")
    End Sub
End Class
