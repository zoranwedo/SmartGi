<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Admin/AdminMaster.master"
    AutoEventWireup="false" CodeFile="ResetPassword.aspx.vb" Inherits="Maintenance_Admin_ResetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Reset Password
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AminContent" runat="Server">
    <div class="Blue">
        <br />
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG" style="width: 350px">
                    <asp:Label ID="lblPassword" runat="server" Text="Reset Password" SkinID="skGridLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <table border="0" cellpadding="1" cellspacing="0" style="border-collapse: collapse;">
                        <tr>
                            <td>
                                <table border="0" cellpadding="0">
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="UserName" runat="server" CssClass="TextBox" Width="250px" ReadOnly="True"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="NewPasswordLabel" runat="server" AssociatedControlID="NewPassword">New Password:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="NewPassword" runat="server" CssClass="TextBox" Width="250px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword"
                                                ErrorMessage="New Password is required." ToolTip="New Password is required."
                                                ValidationGroup="changepass" Display="None" />
                                            <asp:ValidatorCalloutExtender ID="NewPasswordExtender" runat="server" TargetControlID="NewPasswordRequired" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="ConfirmNewPasswordLabel" runat="server" AssociatedControlID="ConfirmNewPassword">Confirm:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="ConfirmNewPassword" runat="server" CssClass="TextBox" Width="250px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword"
                                                ErrorMessage="Confirm New Password is required." ToolTip="Confirm New Password is required."
                                                ValidationGroup="changepass" Display="None" />
                                            <asp:ValidatorCalloutExtender ID="ConfirmNewPasswordExtender" runat="server" TargetControlID="ConfirmNewPasswordRequired" />
                                            <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword"
                                                ControlToValidate="ConfirmNewPassword" ErrorMessage="The Confirm entry must match the New Password entry."
                                                ValidationGroup="changepass" Display="None" />
                                            <asp:ValidatorCalloutExtender ID="NewPasswordCompareExtender" runat="server" TargetControlID="NewPasswordCompare" />
                                        </td>
                                    </tr>
                                    <asp:Panel ID="pnButtons" runat="server">
                                    <tr>
                                        <td align="right" colspan="2">
                                            <asp:Button ID="ChangePasswordPushButton" runat="server" BorderStyle="None" CommandName="ChangePassword"
                                                CssClass="Button" ForeColor="White" Text="Change" ValidationGroup="changepass" />&nbsp;
                                            <asp:Button ID="CancelPushButton" runat="server" BorderStyle="None" CausesValidation="False"
                                                CommandName="Cancel" CssClass="Button" ForeColor="White" Text="Cancel" />
                                        </td>
                                    </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="pnSuccess" runat="server">
                                    <tr>
                                        <td align="right" colspan="2">
                                            <p style="text-align: center;" class="GridRow1T">
                                                <b>Password succesfully changed!</b>
                                            </p>
                                            <asp:Button ID="SuccessButton" runat="server" BorderStyle="None"
                                                CssClass="Button" ForeColor="White" Text="OK" />
                                        </td>
                                    </tr>
                                    </asp:Panel>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="dummy" runat="server" />
        <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
            CancelControlID="btnYes" OkControlID="btnYes" DropShadow="True" Enabled="True"
            BackgroundCssClass="modalBackground" X="200" Y="200" TargetControlID="dummy">
        </asp:ModalPopupExtender>
        <asp:Panel ID="popPanel" runat="server" Width="300px" BackColor="White" Style="display: none">
            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td class="GridLabelBG">
                        <asp:Label ID="popLabel" runat="server" Text="Delete data" SkinID="skGridLabel"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="GridBorder">
                        <p style="text-align: center;">
                            <asp:Label ID="popMessage" runat="server" Text="Message"></asp:Label>
                        </p>
                        <p style="text-align: right;" class="GridRowClear">
                            <br />
                            <asp:Button ID="btnYes" runat="server" Text="OK" SkinID="skBtnBase" />
                        </p>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
</asp:Content>
