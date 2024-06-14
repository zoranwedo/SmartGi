
Partial Class Maintenance_Hotel_LogPeriod
    Inherits System.Web.UI.Page
    Protected Sub Populate_YearddList()

        'If ViewState("year") Is Nothing Then
        '    ddlYear.Items.FindByValue(DateTime.Now.Year.ToString()).Selected = True
        'Else
        '    ddlYear.Items.FindByValue(ViewState("year").ToString()).Selected = True
        'End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'If Not (IsPostBack) Then
        '    Populate_YearddList()
        'End If
    End Sub

    Protected Sub dsHotels_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsHotels.Updating
        e.InputParameters.Item("UserClosed") = Membership.GetUser.UserName
        e.InputParameters.Item("DateClosed") = Now()

    End Sub

    Protected Sub newPeriod_ModeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles newPeriod.ModeChanged
        If newPeriod.CurrentMode = FormViewMode.Insert Then
            Populate_YearddList()
        End If
    End Sub

    'Protected Sub UpdateButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
    '    dsHotelPeriod.Update()
    '    gvHotelPeriod.DataBind()
    'End Sub

    'Protected Sub lbInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbInsert.Click
    '    dsHotelPeriod.Insert()
    '    gvHotelPeriod.DataBind()
    'End Sub

    Protected Sub newPeriod_ModeChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewModeEventArgs) Handles newPeriod.ModeChanging
        
    End Sub

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
End Class
