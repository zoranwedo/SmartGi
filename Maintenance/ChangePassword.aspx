<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" CodeFile="ChangePassword.aspx.vb" Inherits="Maintenance_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Change Password
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" Runat="Server">
    <div class="Blue">
        <br />
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG" style="width: 351px">
                    <asp:Label ID="lblPassword" runat="server" Text="Change Password" 
                        SkinID="skGridLabel" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:ChangePassword ID="changepass" runat="server" 
                        CreateUserUrl="~/Maintenance/Admin/CreateUser.aspx" 
                        SkinID="skChPassword" DisplayUserName="True" 
                        MembershipProvider="SmartProvider">
                        <ChangePasswordTemplate>
                            <table border="0" cellpadding="1" cellspacing="0" 
                                style="border-collapse:collapse;">
                                <tr>
                                    <td>
                                        <table border="0" cellpadding="0">
                                            <tr>
                                                <td align="left">
                                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="UserName" runat="server" CssClass="TextBox" Width="250px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                        ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                                        ToolTip="User Name is required." ValidationGroup="changepass">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <asp:Label ID="CurrentPasswordLabel" runat="server" 
                                                        AssociatedControlID="CurrentPassword">Current Password:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="CurrentPassword" runat="server" CssClass="TextBox" 
                                                        TextMode="Password" Width="250px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" 
                                                        ControlToValidate="CurrentPassword" ErrorMessage="Password is required." 
                                                        ToolTip="Password is required." ValidationGroup="changepass">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <asp:Label ID="NewPasswordLabel" runat="server" 
                                                        AssociatedControlID="NewPassword">New Password:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="NewPassword" runat="server" CssClass="TextBox" 
                                                        TextMode="Password" Width="250px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" 
                                                        ControlToValidate="NewPassword" ErrorMessage="New Password is required." 
                                                        ToolTip="New Password is required." ValidationGroup="changepass">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <asp:Label ID="ConfirmNewPasswordLabel" runat="server" 
                                                        AssociatedControlID="ConfirmNewPassword">Confirm:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="ConfirmNewPassword" runat="server" CssClass="TextBox" 
                                                        TextMode="Password" Width="250px"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" 
                                                        ControlToValidate="ConfirmNewPassword" 
                                                        ErrorMessage="Confirm New Password is required." 
                                                        ToolTip="Confirm New Password is required." ValidationGroup="changepass">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2">
                                                    <asp:CompareValidator ID="NewPasswordCompare" runat="server" 
                                                        ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" 
                                                        Display="Dynamic" 
                                                        ErrorMessage="The Confirm New Password must match the New Password entry." 
                                                        ValidationGroup="changepass"></asp:CompareValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2" style="color:Red;">
                                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="2" style="height: 30px; padding-top: 5px;">
                                                    <asp:Button ID="ChangePasswordPushButton" runat="server" BorderStyle="None" 
                                                        CommandName="ChangePassword" CssClass="Button" ForeColor="White" Text="Change" 
                                                        ValidationGroup="changepass" />&nbsp;
                                                    <asp:Button ID="CancelPushButton" runat="server" BorderStyle="None" 
                                                        CausesValidation="False" CommandName="Cancel" CssClass="Button" 
                                                        ForeColor="White" Text="Cancel" 
                                                        onclientclick="javascript:history.back(); return false;" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </ChangePasswordTemplate>
                        <SuccessTemplate>
                            <table border="0" cellpadding="1" cellspacing="0" 
                                style="border-collapse:collapse;">
                                <tr>
                                    <td>
                                        <table border="0" cellpadding="0">
                                            <tr>
                                                <td align="center" colspan="2">
                                                    Change Password Complete</td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Your password has been changed!</td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="2">
                                                    <asp:Button ID="ContinuePushButton" runat="server" CausesValidation="False" 
                                                        CommandName="Continue" onclick="ContinuePushButton_Click" SkinID="skBtnBase" 
                                                        Text="Continue" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </SuccessTemplate>
                        <TextBoxStyle CssClass="TextBox" Width="250px" />
                    </asp:ChangePassword>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

