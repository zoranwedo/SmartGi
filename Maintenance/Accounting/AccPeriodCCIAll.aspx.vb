
Partial Class Maintenance_Accounting_AccPeriodCCIAll
    Inherits System.Web.UI.Page

    Protected Sub ddlYear_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim intYear As Int32
        Dim ddl As DropDownList = CType(sender, DropDownList)
        If ddl IsNot Nothing Then
            For intYear = Convert.ToInt16(DateTime.Now.Year) - 20 To Convert.ToInt16(DateTime.Now.Year + 20)
                ddl.Items.Add(Convert.ToString(intYear))
            Next intYear
            ddl.Items.FindByValue(DateTime.Now.Year.ToString()).Selected = True
        End If
    End Sub

    Protected Sub dsPeriods_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsPeriods.Updating
        If CType(e.InputParameters("Closed"), Boolean) Then
            e.InputParameters.Item("UserClosed") = My.User.Name
            e.InputParameters.Item("DateClosed") = Now()
        Else
            e.InputParameters.Item("UserClosed") = Nothing
            e.InputParameters.Item("DateClosed") = Nothing
        End If
    End Sub

    Protected Sub ddlHotels_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlHotels.DataBound
        If Not String.IsNullOrEmpty(Request.QueryString("HotelID")) Then
            ddlHotels.SelectedValue = Request.QueryString("HotelID")
        End If
    End Sub

    Protected Sub popShow(ByVal Title As String, ByVal ex As Exception)
        popLabel.Text = Title
        popMessage.Text = ex.Message
        If ex.InnerException IsNot Nothing Then popMessage.Text = popMessage.Text & "<br />" & ex.InnerException.Message
        popExtender.Show()
    End Sub

    Protected Sub dsPeriods_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsPeriods.Deleted
        If e.Exception IsNot Nothing Then
            popShow("Delete Period", e.Exception)
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub dsPeriods_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsPeriods.Updated
        If e.Exception IsNot Nothing Then
            popShow("Close/Open Period", e.Exception)
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub dsPeriods_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsPeriods.Inserted
        If e.Exception IsNot Nothing Then
            popShow("Create Period", e.Exception)
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Function CloseModuleWarning(ByVal pYear As Integer, ByVal pMonth As Integer, ByVal pAccType As String, ByVal pCheck As Boolean) As String
        Dim t As String = "return confirm('Are you sure you want to {0} module {1} for period {2}/{3}?');"
        Return String.Format(t, IIf(pCheck, "OPEN", "CLOSE"), pAccType, pYear, pMonth)
    End Function

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

End Class
