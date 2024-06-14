
Partial Class Maintenance_Admin_User
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim userName As String = Request.QueryString(0)

        If Me.IsPostBack = False Then
            FillControls()
            lblError.Visible = False
        End If
    End Sub

    Protected Sub FillControls()
        Dim userName As String = Request.QueryString(0)
        Dim SelectedUser As System.Web.Security.MembershipUser

        FillRoleList(userName)

        If Not userName Is Nothing Then
            lnkUpdate.Visible = True
            SelectedUser = System.Web.Security.Membership.GetUser(userName)
            lnkChange.NavigateUrl = "ChangePassword.aspx?username=" + userName

            lblApproved.Text = IIf(SelectedUser.IsApproved, "Active", "Disabled")
            lblApproved.ForeColor = IIf(SelectedUser.IsApproved, Nothing, System.Drawing.Color.Red)
            btEnable.Visible = Not SelectedUser.IsApproved
            btDisable.Visible = SelectedUser.IsApproved

            lblLocked.Text = IIf(SelectedUser.IsLockedOut, "Locked", "Not Locked")
            lblLocked.ForeColor = IIf(SelectedUser.IsLockedOut, System.Drawing.Color.Red, Nothing)
            lblLockedOn.Text = String.Format("<br />{0}", SelectedUser.LastLockoutDate)
            lblLockedOn.Visible = SelectedUser.IsLockedOut
            btUnlock.Visible = SelectedUser.IsLockedOut

            lblPasswordDate.Text = SelectedUser.LastPasswordChangedDate.ToString
            txtSignature.Text = Profile.GetProfile(userName).UserSignature

            Try
                Dim userQuery As New UserTableAdapters.UserTableAdapter()
                Dim userTable As User.UserDataTable = userQuery.GetByUserName(userName)
                Dim userRow As User.UserRow = userTable.Rows(0)

                lblHotelsSel.PostBackUrl = "UserHotels.aspx?username=" + userName
                lblToSel.PostBackUrl = "UserTO.aspx?username=" + userName

                lblHotelsAll.Visible = userRow.AllHotels
                lblHotelsSel.Visible = Not userRow.AllHotels
                btHotelsAll.Visible = Not userRow.AllHotels
                btHotelsSel.Visible = userRow.AllHotels
                lblToAll.Visible = userRow.AllTO
                lblToSel.Visible = Not userRow.AllTO
                btToAll.Visible = Not userRow.AllTO
                btToSel.Visible = userRow.AllTO
            Catch ex As Exception
                lblHotelsAll.Text = "Error"
                lblHotelsAll.Visible = True
                lblHotelsSel.Visible = False
                btHotelsAll.Visible = False
                btHotelsSel.Visible = False
                lblToAll.Text = "Error"
                lblToAll.Visible = True
                lblToSel.Visible = False
                btToAll.Visible = False
                btToSel.Visible = False
            End Try
        End If

    End Sub

    Protected Sub lnkUnlock_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btUnLock.Click
        Dim userName As String = Request.QueryString(0)
        Membership.Provider.UnlockUser(userName)

        lblError.Visible = False
        FillControls()
    End Sub

    Protected Sub btEnable_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btEnable.Click
        Dim userName As String = Request.QueryString(0)
        Dim SelectedUser As System.Web.Security.MembershipUser

        SelectedUser = System.Web.Security.Membership.GetUser(userName)
        SelectedUser.IsApproved = True
        System.Web.Security.Membership.UpdateUser(SelectedUser)

        lblError.Visible = False
        FillControls()
    End Sub

    Protected Sub btDisable_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btDisable.Click
        Dim userName As String = Request.QueryString(0)
        Dim SelectedUser As System.Web.Security.MembershipUser

        SelectedUser = System.Web.Security.Membership.GetUser(userName)
        SelectedUser.IsApproved = False
        System.Web.Security.Membership.UpdateUser(SelectedUser)

        lblError.Visible = False
        FillControls()
    End Sub

    Protected Sub btUpdate_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btUpdate.Click
        Dim userName As String = Request.QueryString(0)
        Dim p As ProfileCommon = Profile.GetProfile(userName)

        p.UserSignature = txtSignature.Text
        p.Save()
        FillControls()
    End Sub

    Private Sub FillRoleList(ByVal userName As String)
        Dim roleNames() As String
        Dim roleName As String

        RoleList.Items.Clear()
        roleNames = Roles.GetAllRoles()

        For Each roleName In roleNames
            Dim roleListItem As New ListItem
            roleListItem.Text = roleName
            roleListItem.Selected = Roles.IsUserInRole(userName, roleName)

            RoleList.Items.Add(roleListItem)
        Next
    End Sub

    Private Sub UpdateRolesFromList()
        Dim userName As String = Request.QueryString(0)
        Dim roleListItem As ListItem

        For Each roleListItem In RoleList.Items
            Dim roleName As String = roleListItem.Value
            Dim enableRole As Boolean = roleListItem.Selected

            If (enableRole = True) And (Roles.IsUserInRole(userName, roleName) = False) Then
                Try
                    Roles.AddUserToRole(userName, roleName)
                Catch ex As Exception
                    lblError.Text = Left(ex.Message, InStr(ex.Message, "#") - 1)
                    lblError.Visible = True
                    Exit For
                End Try
            ElseIf (enableRole = False) And (Roles.IsUserInRole(userName, roleName) = True) Then
                Roles.RemoveUserFromRole(userName, roleName)
            End If
        Next
    End Sub

    Protected Sub lnkUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkUpdate.Click
        lblError.Visible = False
        UpdateRolesFromList()
        FillRoleList(Request.QueryString(0))
    End Sub

    Protected Sub btHotelsAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btHotelsAll.Click
        Dim q As New UserTableAdapters.QueriesTableAdapter
        q.UpdateAllHotels(True, Request.QueryString(0))
        FillControls()
    End Sub

    Protected Sub btHotelsSel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btHotelsSel.Click
        Dim q As New UserTableAdapters.QueriesTableAdapter
        q.UpdateAllHotels(False, Request.QueryString(0))
        FillControls()
    End Sub

    Protected Sub btToAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btToAll.Click
        Dim q As New UserTableAdapters.QueriesTableAdapter
        q.UpdateAllTO(True, Request.QueryString(0))
        FillControls()
    End Sub

    Protected Sub btToSel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btToSel.Click
        Dim q As New UserTableAdapters.QueriesTableAdapter
        q.UpdateAllTO(False, Request.QueryString(0))
        FillControls()
    End Sub
End Class
