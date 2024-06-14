
Partial Class Maintenance_Accounting_AccPeriodHotel
    Inherits System.Web.UI.Page

    Protected Function OpenWarning(ByVal pFrom As String, ByVal pTo As String) As String
        Dim pHotel As String = CType(fvPeriods.FindControl("HotelLabel"), Label).Text
        Dim t As String = "return confirm('Are you sure you want to OPEN period from {0} to {1}\nfor {2}?');"
        Return String.Format(t, pFrom, pTo, pHotel)
    End Function

    Protected Function CloseWarning(ByVal pFrom As String, ByVal pTo As String) As String
        Dim pHotel As String = CType(fvPeriods.FindControl("HotelLabel"), Label).Text
        Dim t As String = "return confirm('Are you sure you want to CLOSE period from {0} to {1}\nfor {2}?');"
        Return String.Format(t, pFrom, pTo, pHotel)
    End Function

    Protected Function CreateWarning() As String
        Dim pHotel As String = CType(fvPeriods.FindControl("HotelLabel"), Label).Text
        Dim t As String = "return confirm('Are you sure you want to CREATE new period\nfor {0}?');"
        Return String.Format(t, pHotel)
    End Function

    Protected Sub gvPeriods_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvPeriods.RowCommand
        Dim l As New dsAccHotelPeriodTableAdapters.QueriesTableAdapter
        Dim q As New dsAccHotelPeriodTableAdapters.AccHotelPeriodTableAdapter

        If e.CommandName = "Open" Then
            Try
                Dim hap As Integer = e.CommandArgument
                q.PeriodOpen(hap)
                l.AddAccountingLog(My.User.Name, "Hotel AccPeriod", "OPEN", hap, "Hotel accounting period oppened")
                gvPeriods.DataBind()
            Catch ex As Exception
                popShow("Create Period", ex)
            End Try
        ElseIf e.CommandName = "Close" Then
            Try
                Dim hap As Integer = e.CommandArgument
                q.PeriodClose(hap, My.User.Name)
                l.AddAccountingLog(My.User.Name, "Hotel AccPeriod", "CLOSE", hap, "Hotel accounting period closed")
                gvPeriods.DataBind()
            Catch ex As Exception
                popShow("Create Period", ex)
            End Try
        ElseIf e.CommandName = "UpdatePeriod" Then
            Try
                Dim hap As Integer
                Dim dat As Date
                UpdatePeriod(e.CommandArgument, hap, dat)
                q.PeriodEdit(hap, dat, My.User.Name)
                l.AddAccountingLog(My.User.Name, "Hotel AccPeriod", "EDIT", hap, String.Format("Hotel accounting period edited to {0:d}", dat))
                gvPeriods.EditIndex = -1
                fvNewPeriod.DataBind()
                gvPeriods.DataBind()
            Catch ex As Exception
                popShow("Create Period", ex)
            End Try
        End If
    End Sub

    Protected Sub UpdatePeriod(ByVal arg As Object, ByRef h As Integer, ByRef d As Date)
        Dim p() As String = arg.ToString.Split("/")
        Dim hap As Integer = p(0)
        Dim i As Integer = p(1)
        Dim dNew As Date = CType(gvPeriods.Rows(i).FindControl("editPeriodFinish"), TextBox).Text

        Dim dMin As Date = CType(gvPeriods.Rows(i).FindControl("hfRangeStart"), HiddenField).Value
        If dNew < dMin Then Throw (New ApplicationException(String.Format("New finish date can't be before {0:d}", dMin)))

        Try
            Dim dMax As Date = CType(gvPeriods.Rows(i).FindControl("hfRangeFinish"), HiddenField).Value
            If dNew > dMax Then Throw (New ApplicationException(String.Format("New finish date can't be after {0:d}", dMax)))
        Catch ex As Exception
        End Try

        h = hap
        d = dNew
    End Sub

    Protected Sub fvNewPeriod_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles fvNewPeriod.ItemCommand
        Dim q As New dsAccHotelPeriodTableAdapters.AccHotelPeriodTableAdapter

        Dim h As Integer = fvPeriods.SelectedValue
        Dim dStart As Date = CType(fvNewPeriod.Row.FindControl("newPeriodStart"), TextBox).Text
        Dim dFinish As Date = CType(fvNewPeriod.Row.FindControl("newPeriodFinish"), TextBox).Text

        Try
            q.PeriodNew(h, dStart, dFinish, My.User.Name)
            gvPeriods.EditIndex = -1
            fvNewPeriod.DataBind()
            gvPeriods.DataBind()
        Catch ex As Exception
            popShow("Create Period", ex)
        End Try
    End Sub

    Protected Sub cbAll_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cbAll.CheckedChanged
        gvPeriods.AllowPaging = cbAll.Checked

        gvPeriods.EditIndex = -1
        gvPeriods.DataBind()
    End Sub

    Protected Sub dsPeriods_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs) Handles dsPeriods.Selecting
        If cbAll.Checked Then
            dsPeriods.SelectMethod = "GetData"
            gvPeriods.AllowPaging = True
        Else
            dsPeriods.SelectMethod = "GetData12"
            gvPeriods.AllowPaging = False
        End If
    End Sub

    Protected Sub popShow(ByVal Title As String, ByVal ex As Exception)
        popLabel.Text = Title
        popMessage.Text = ex.Message
        If ex.InnerException IsNot Nothing Then popMessage.Text = popMessage.Text & "<br />" & ex.InnerException.Message
        popExtender.Show()
    End Sub
End Class
