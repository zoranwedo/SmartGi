
Partial Class masterSMART
    Inherits System.Web.UI.MasterPage

    Protected Sub MainMenu_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles MainMenu.MenuItemClick
        If (e.Item.Text = "Logout") Then
            FormsAuthentication.SignOut()
            FormsAuthentication.RedirectToLoginPage()
        End If
    End Sub

    Protected Sub MainMenu_MenuItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles MainMenu.MenuItemDataBound
        Dim user As String = Membership.GetUser.UserName
        Select Case e.Item.Text
            Case "My Logon"
                If Roles.IsUserInRole(user, "admin") Then
                    Dim csSmart As String = ConfigurationManager.ConnectionStrings("csSMART_SQL").ConnectionString
                    Dim csElements As String() = csSmart.Split(";".ToCharArray())
                    Dim csPairs As String()

                    Dim csValuesColl As New NameValueCollection
                    For Each s As String In csElements
                        csPairs = s.Split("=".ToCharArray)
                        If csPairs.Length = 2 Then csValuesColl.Add(csPairs(0), csPairs(1))
                    Next

                    MainMenu.Items(0).ChildItems.Add(New MenuItem("Server: " & csValuesColl("Data Source")))
                    MainMenu.Items(0).ChildItems.Add(New MenuItem("Database: " & csValuesColl("Initial Catalog")))
                End If

                Dim accounting As Boolean = Roles.IsUserInRole(user, "admin") Or _
                                            Roles.IsUserInRole(user, "accounting") Or _
                                            Roles.IsUserInRole(user, "accounting_admin")

                MainMenu.Items(0).ChildItems.AddAt(0, New MenuItem("Loged as: " & user))
                If accounting Then
                    Try
                        Dim uTA As New UserTableAdapters.UserTableAdapter
                        Dim uRow As User.UserRow = uTA.GetByUserName(user).Rows(0)

                        If (Not uRow.IsPeriodMonthNull) And (Not uRow.IsPeriodYearNull) Then
                            Dim logperiod As String = uRow.PeriodMonth.ToString + "/" + uRow.PeriodYear.ToString
                            MainMenu.Items(0).ChildItems.Add(New MenuItem("Acc.Period: " & logperiod))
                        End If
                    Catch ex As Exception
                    End Try
                End If
            Case "Change Password"
                e.Item.NavigateUrl = "Maintenance/ChangePassword.aspx?UserName=" + Membership.GetUser.UserName
            Case "Change Period"
                e.Item.NavigateUrl = "Maintenance/UserPeriod.aspx?username=" + Membership.GetUser.UserName
            Case "-"
                e.Item.Text = "<hr>"
        End Select
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        hfUsername.Value = Membership.GetUser.UserName
    End Sub

End Class

