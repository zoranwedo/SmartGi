Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient

Public Class ModificationRights
    Public Shared Function RightsTest(ByVal app As String, ByVal role As String) As Integer

        Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("csSMART_aspnet").ToString)
        Dim spString As String = "dbo.aspnet_Roles_RoleExists"
        Dim cmd As New SqlCommand(spString, con)
        Dim retval As Integer

        cmd.CommandType = CommandType.StoredProcedure

        cmd.Parameters.AddWithValue("@ApplicationName", app)
        cmd.Parameters.AddWithValue("@RoleName", role)

        Try
            con.Open()
            retval = cmd.ExecuteScalar()
            con.Close()
            Return retval
        Catch ex As Exception
            Return retval
        End Try

    End Function
    Public Shared Function RightsSales() As Boolean
        If Not String.IsNullOrEmpty(Membership.GetUser.UserName) Then
            Dim userName As String = Membership.GetUser.UserName
            Return (Roles.IsUserInRole(userName, "sales") Or Roles.IsUserInRole(userName, "operator"))
        Else
            Return False
        End If
    End Function
    Public Shared Function RightsSalesAdmin() As Boolean
        If Not String.IsNullOrEmpty(Membership.GetUser.UserName) Then
            Dim userName As String = Membership.GetUser.UserName
            Return (Roles.IsUserInRole(userName, "sales") Or Roles.IsUserInRole(userName, "operator") Or Roles.IsUserInRole(userName, "admin"))
        Else
            Return False
        End If
    End Function
    Public Shared Function RightsHotel() As Boolean
        If Not String.IsNullOrEmpty(Membership.GetUser.UserName) Then
            Dim userName As String = Membership.GetUser.UserName
            Return (Roles.IsUserInRole(userName, "hotel") Or Roles.IsUserInRole(userName, "hotel_report"))
        Else
            Return False
        End If
    End Function
    Public Shared Function RightsHotelOperator() As Boolean
        If Not String.IsNullOrEmpty(Membership.GetUser.UserName) Then
            Dim userName As String = Membership.GetUser.UserName
            Return (Roles.IsUserInRole(userName, "hotel") Or Roles.IsUserInRole(userName, "operator"))
        Else
            Return False
        End If
    End Function
    Public Shared Function RightsOperator() As Boolean
        If Not String.IsNullOrEmpty(Membership.GetUser.UserName) Then
            Dim userName As String = Membership.GetUser.UserName
            Return (Roles.IsUserInRole(userName, "operator"))
        Else
            Return False
        End If
    End Function
    Public Shared Function RightsOperatorReport() As Boolean
        If Not String.IsNullOrEmpty(Membership.GetUser.UserName) Then
            Dim userName As String = Membership.GetUser.UserName
            Return (Roles.IsUserInRole(userName, "operator_report"))
        Else
            Return False
        End If
    End Function
    Public Shared Function RightsOperatorAdmin() As Boolean
        If Not String.IsNullOrEmpty(Membership.GetUser.UserName) Then
            Dim userName As String = Membership.GetUser.UserName
            Return (Roles.IsUserInRole(userName, "operator") Or Roles.IsUserInRole(userName, "admin"))
        Else
            Return False
        End If
    End Function
    Public Shared Function RightsAdmin() As Boolean
        If Not String.IsNullOrEmpty(Membership.GetUser.UserName) Then
            Dim userName As String = Membership.GetUser.UserName
            Return (Roles.IsUserInRole(userName, "admin"))
        Else
            Return False
        End If
    End Function
    Public Shared Function RightsOperatorAdminHotel() As Boolean
        If Not String.IsNullOrEmpty(Membership.GetUser.UserName) Then
            Dim userName As String = Membership.GetUser.UserName
            Return (Roles.IsUserInRole(userName, "operator") Or Roles.IsUserInRole(userName, "admin") Or Roles.IsUserInRole(userName, "hotel"))
        Else
            Return False
        End If
    End Function
    Public Shared Function Can_Open_Period() As Boolean
        If Not String.IsNullOrEmpty(Membership.GetUser.UserName) Then
            Dim userName As String = Membership.GetUser.UserName
            Return (Roles.IsUserInRole(userName, "can_open_period"))
        Else
            Return False
        End If
    End Function
End Class
