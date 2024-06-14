
Partial Class Maintenance_Admin_UserPeriod
    Inherits System.Web.UI.Page

    Protected Sub ddlYear_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim intYear As Int32
        Dim ddl As DropDownList = CType(sender, DropDownList)
        If ddl IsNot Nothing Then
            For intYear = Convert.ToInt16(DateTime.Now.Year) - 20 To Convert.ToInt16(DateTime.Now.Year + 20)
                ddl.Items.Add(Convert.ToString(intYear))
            Next intYear
            ddl.Items.FindByValue(DateTime.Now.Year.ToString()).Selected = True
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        hfUser.Value = My.User.Name
        lblUser.Text = "<u>" & My.User.Name & "</u> Accounting Log-on Period"
    End Sub
End Class
