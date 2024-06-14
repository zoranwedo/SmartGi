Imports App_UserControls_MessagePop

Partial Class Accounting_AccDocSearchRes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        AccCookie()
    End Sub

    Protected Sub btSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btSearch.Click
        pnlResults.Visible = True
        dsFilteredDocuments.Select()
    End Sub

    Protected Sub btClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btClear.Click
        ctrlHotel.ClearControl()
        ctrlTourOp.ClearControl()
        ctrlDocDate.ClearControl()
        pnlResults.Visible = False
    End Sub

    Public Function BookingStateIcon(ByVal InHouseState As Object) As String
        If TypeOf InHouseState Is System.DBNull Then
            Return "~/Images/Unknown.png"
        Else
            Select Case InHouseState
                Case -2 : Return "~/Images/cancel.png"
                Case -1 : Return "~/Images/no-show.png"
                Case 0 : Return "~/Images/active.png"
                Case 1 : Return "~/Images/check_in.png"
                Case 2 : Return "~/Images/check_out.png"
                Case Else : Return "~/Images/Unknown.png"
            End Select
        End If
    End Function

    Protected Sub AccCookie()
        Dim cName As String = "AccDocSearch_" & Membership.GetUser.UserName
        If (Request.Cookies(cName) IsNot Nothing) Then
            If Not Me.IsPostBack Then
                Try
                    ctrlHotel.CookieLoad(Request.Cookies(cName))
                    ctrlTourOp.CookieLoad(Request.Cookies(cName))
                    ctrlDocDate.LoadCookie(cName)
                Catch ex As Exception
                End Try
            End If
        End If

        If Me.IsPostBack Then
            ctrlHotel.CookieSave(Response.Cookies(cName))
            ctrlTourOp.CookieSave(Response.Cookies(cName))
            ctrlDocDate.SaveCookie(cName)
            Response.Cookies(cName).Expires = DateTime.Now.AddYears(1)
        End If
    End Sub

    Protected Sub rptPayments_ItemCommand(ByVal source As Object, ByVal e As RepeaterCommandEventArgs) Handles rptPayments.ItemCommand
        If e.CommandName = "payDelete" Then
            Try
                Dim id As Integer = e.CommandArgument
                Dim ta As New dsProformaApplicationTableAdapters.AccDocReservationTableAdapter
                ta.Delete(id, Nothing, My.User.Name)
                rptPayments.DataBind()
            Catch ex As Exception
                msgPop.ShowError(ex)
            End Try
        End If
    End Sub

    Protected Sub lnkReport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkReport.Click
        Dim warnings As Microsoft.Reporting.WebForms.Warning() = Nothing
        Dim streamids As String() = Nothing
        Dim mimeType As String = Nothing
        Dim encoding As String = Nothing
        Dim extension As String = Nothing
        Dim deviceInfo As String = "<DeviceInfo><SimplePageHeaders>True</SimplePageHeaders></DeviceInfo>"
        Dim bytes As Byte()

        Dim lr As New Microsoft.Reporting.WebForms.LocalReport
        lr.ReportPath = "Accounting\AccDocSearchRes.rdlc"
        lr.DataSources.Clear()
        lr.DataSources.Add(New Microsoft.Reporting.WebForms.ReportDataSource("dsAccountingEffective_AccTransDocReservations", dsFilteredDocuments))

        Try
            Response.ClearContent()
            Response.ClearHeaders()

            bytes = lr.Render("EXCEL", deviceInfo, mimeType, encoding, extension, streamids, warnings)
            Response.ContentType = "application/excel"
            Response.AppendHeader("Content-Disposition", "attachment; filename=""" + "AccountingDocumentsWithReservations.xls" + """")

            Response.BinaryWrite(bytes)
            Response.Flush()
            'Response.Close()
            Response.End()
        Catch ex As Exception
            msgPop.ShowError(ex)
        End Try

    End Sub
End Class
