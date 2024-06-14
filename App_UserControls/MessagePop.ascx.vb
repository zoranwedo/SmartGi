
Partial Class App_UserControls_MessagePop
    Inherits System.Web.UI.UserControl

    Public Class MessagePopArgs
        Inherits EventArgs

        Public Action As String

        Public Sub New(ByVal popAction As String)
            MyBase.New()
            Action = popAction
        End Sub
    End Class

    Public Delegate Sub MessagePopEventHandler(ByVal sender As Object, ByVal e As MessagePopArgs)
    Public Event MessageYes As MessagePopEventHandler

    Private strTitle As String
    Public Property Title() As String
        Get
            Return strTitle
        End Get
        Set(ByVal value As String)
            strTitle = value
        End Set
    End Property

    'Private strAction As String
    Public Property Action() As String
        Get
            Return hfAction.Value
        End Get
        Set(ByVal value As String)
            hfAction.Value = value
        End Set
    End Property


    Public Sub ShowPrompt(ByVal msg As String)

        popImage.ImageUrl = "~/App_UserControls/warning.png"
        popTitle.Text = strTitle
        popMessage.Text = msg
        btnMsgBoxYes.Visible = True
        btnMsgBoxNo.Text = "No"
        popMsgBox.Show()
    End Sub

    Public Sub ShowPrompt(ByVal msg As String, ByVal popAction As String)
        Action = popAction
        ShowPrompt(msg)
    End Sub

    Public Sub ShowError(ByRef ex As Exception)
        popImage.ImageUrl = "~/App_UserControls/no-entry.png"
        popTitle.Text = strTitle
        popMessage.Text = ExceptionMessage(ex)

        If popMessage.Text.Contains("Excel") Then
            popMessage.Text = "<strong>Report is returning too many data.</strong><br />" & _
                  "Excel sheet is limited to 65536 rows.<br />" & _
                  "Try setting more filtering criteria."
        ElseIf popMessage.Text.Contains("OutOfMemoryException") Then
            popMessage.Text = "<strong>Report generation is takeing too much memory.</strong><br />" & _
                  "Try setting more filtering criteria."
        ElseIf popMessage.Text.Contains("Timeout expired.") Then
            popMessage.Text = "<strong>Report generation is taking too much time.</strong><br />" & _
                  "Try setting more filtering criteria."
        End If

        btnMsgBoxYes.Visible = False
        btnMsgBoxNo.Text = "OK"
        popMsgBox.Show()
    End Sub

    Protected Function ExceptionMessage(ByVal ex As Exception) As String
        Dim msg As String = ex.Message
        If ex.InnerException IsNot Nothing Then
            msg = msg & "<br />" & ExceptionMessage(ex.InnerException)
        End If

        Return msg
    End Function

    'Protected Function ExceptionMessage(ByVal msg As String, ByVal ex As Exception) As String
    '    msg = IIf(String.IsNullOrEmpty(msg), "", msg & "<br />") & ex.Message
    '    If ex.InnerException IsNot Nothing Then
    '        ExceptionMessage(msg, ex.InnerException)
    '    ElseIf ex.Message.Contains("Excel") Then
    '        msg = "Report will returned too many rows.<br />" & _
    '              "Excel sheet is limited to 65536 rows.<br />" & _
    '              "Try setting more filtering criteria."
    '    ElseIf ex.Message.Contains("OutOfMemoryException") Then
    '        msg = "Report generation will take too much memory.<br />" & _
    '              "Try setting more filtering criteria."
    '    End If

    '    Return msg
    'End Function

    Protected Sub btnMsgBoxYes_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMsgBoxYes.Click
        RaiseEvent MessageYes(Me, New MessagePopArgs(Action))
    End Sub

End Class
