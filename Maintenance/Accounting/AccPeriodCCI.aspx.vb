
Partial Class Maintenance_Accounting_AccPeriodCCI
    Inherits System.Web.UI.Page

    Protected Function OpenWarning(ByVal pYear As Integer, ByVal pMonth As Integer, ByVal pHotel As String) As String
        Dim t As String = "return confirm('Are you sure you want to OPEN period {0}/{1} for {2}?');"
        Return String.Format(t, pYear, pMonth, pHotel)
    End Function

    Protected Function CloseWarning(ByVal pYear As Integer, ByVal pMonth As Integer, ByVal pHotel As String) As String
        Dim t As String = "return confirm('Are you sure you want to CLOSE period {0}/{1} for {2}?');"
        Return String.Format(t, pYear, pMonth, pHotel)
    End Function

    Protected Function CreateWarning(ByVal pYear As Integer, ByVal pMonth As Integer, ByVal pHotel As String) As String
        Dim t As String = "return confirm('Are you sure you want to CREATE period {0}/{1} for {2}?');"
        Return String.Format(t, pYear, pMonth, pHotel)
    End Function

    Protected Function CloseModuleWarning(ByVal pYear As Integer, ByVal pMonth As Integer, ByVal pAccType As String, ByVal pCheck As Boolean) As String
        Dim t As String = "return confirm('Are you sure you want to {0} module {1} for period {2}/{3}?');"
        Return String.Format(t, IIf(pCheck, "OPEN", "CLOSE"), pAccType, pYear, pMonth)
    End Function

    Protected Sub gvPeriods_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvPeriods.RowCommand
        Dim l As New dsAccHotelPeriodTableAdapters.QueriesTableAdapter
        Dim q As New dsAccHotelPeriodTableAdapters.AccPeriodTableAdapter
        Dim y As Integer
        Dim m As Integer
        Dim h As Integer

        If e.CommandName = "Open" Then
            Try
                GetParams(e.CommandArgument, y, m, h)
                q.PeriodOpen(h, y, m)
                l.AddAccountingLog(My.User.Name, "AccPeriod", "OPEN", h, String.Format("Accounting period {0}/{1} oppened", y, m))
                gvPeriods.DataBind()
            Catch ex As Exception
                popShow("Open Period", ex)
            End Try
        ElseIf e.CommandName = "Close" Then
            Try
                GetParams(e.CommandArgument, y, m, h)
                q.PeriodClose(h, y, m, My.User.Name)
                l.AddAccountingLog(My.User.Name, "AccPeriod", "CLOSE", h, String.Format("Accounting period {0}/{1} closed", y, m))
                gvPeriods.DataBind()
            Catch ex As Exception
                popShow("Close Period", ex)
            End Try
        ElseIf e.CommandName = "Create" Then
            Try
                GetParams(e.CommandArgument, y, m, h)
                q.PeriodNew(h, y, m)
                l.AddAccountingLog(My.User.Name, "AccPeriod", "CREATE", h, String.Format("Accounting period {0}/{1} created", y, m))
                gvPeriods.DataBind()
            Catch ex As Exception
                popShow("Create Period", ex)
            End Try
        End If
    End Sub

    Protected Sub cbModuleClose_CheckedChanged(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.CommandEventArgs)
        Dim pList As String() = Split(e.CommandArgument, ";")
        Dim pHotel As Integer = pList(0)
        Dim pYear As Integer = pList(1)
        Dim pMonth As Integer = pList(2)
        Dim pAccType As String = pList(3)

        Dim q As New dsAccHotelPeriodTableAdapters.AccPeriod_AccTypeTableAdapter
        q.UpdateData(pHotel, pYear, pMonth, pAccType)
        gvPeriods.DataBind()
        'MsgBox(String.Format("Hotel: {0}, y: {1}, m: {2}, t: {3}", pHotel, pYear, pMonth, pAccType))
    End Sub

    Private Sub GetParams(ByVal arg As String, ByRef y As Integer, ByRef m As Integer, ByRef h As Integer)
        Dim p() As String = arg.Split("/")
        y = p(0)
        m = p(1)
        h = p(2)
    End Sub

    Protected Sub lbAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbAll.Click
        Response.Redirect("~/Maintenance/Accounting/AccPeriodCCIAll.aspx?HotelID=" & gvHotels.SelectedValue)
    End Sub

    Protected Sub popShow(ByVal Title As String, ByVal ex As Exception)
        popLabel.Text = Title
        popMessage.Text = ex.Message
        If ex.InnerException IsNot Nothing Then popMessage.Text = popMessage.Text & "<br />" & ex.InnerException.Message
        popExtender.Show()
    End Sub
End Class
