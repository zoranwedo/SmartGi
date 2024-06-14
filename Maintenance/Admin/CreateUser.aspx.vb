
Partial Class Maintenance_Admin_CreateUser
    Inherits System.Web.UI.Page
    Sub FillRoleList(ByVal userName As String)
        Dim rolelistbox As CheckBoxList = CType(CreateUserWizard1.FindControl("RoleList"), CheckBoxList)
        If Not rolelistbox Is Nothing Then
            rolelistbox.Items.Clear()

            Dim roleNames() As String
            Dim roleName As String

            roleNames = Roles.GetAllRoles()
            For Each roleName In roleNames

                Dim roleListItem As New ListItem
                roleListItem.Text = roleName
                roleListItem.Selected = Roles.IsUserInRole(userName, roleName)

                rolelistbox.Items.Add(roleListItem)
            Next
        End If
    End Sub

    Sub UpdateRolesFromList()
        Dim roleListItem As ListItem
        Dim rolelistbox As CheckBoxList = CType(CreateUserWizard1.FindControl("RoleList"), CheckBoxList)

        For Each roleListItem In rolelistbox.Items

            Dim roleName As String = roleListItem.Value
            Dim userName As String = CreateUserWizard1.UserName
            Dim enableRole As Boolean = roleListItem.Selected

            If (enableRole = True) And (Roles.IsUserInRole(userName, roleName) = False) Then
                Roles.AddUserToRole(userName, roleName)
            ElseIf (enableRole = False) And (Roles.IsUserInRole(userName, roleName) = True) Then
                Roles.RemoveUserFromRole(userName, roleName)
            End If
        Next
    End Sub

    Protected Sub CreateUserWizard1_ActiveStepChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CreateUserWizard1.ActiveStepChanged
        Select Case CreateUserWizard1.ActiveStepIndex
            Case 0
                CreateUserWizard1.HeaderText = "Sign Up for New Account"
            Case 1
                CreateUserWizard1.HeaderText = "Set Up Roles for New Account"
                FillRoleList(CreateUserWizard1.UserName)
                Dim finishbutton As Button = CType(CreateUserWizard1.FindControl("ContinueButton"), Button)
                finishbutton.CommandName = Wizard.MoveCompleteCommandName
        End Select
    End Sub

    Protected Sub CreateUserWizard1_FinishButtonClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.WizardNavigationEventArgs) Handles CreateUserWizard1.FinishButtonClick
        UpdateRolesFromList()
    End Sub
    Protected Sub lnkUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        UpdateRolesFromList()
        FillRoleList(CreateUserWizard1.UserName)
    End Sub
End Class
