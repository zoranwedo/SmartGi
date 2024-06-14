<%@ Page Title="" Language="VB" MasterPageFile="~/masterLogon.master" AutoEventWireup="false"
    CodeFile="Login.aspx.vb" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="LogonContent" runat="Server">

    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <div class="Blue" style="font-size: 10pt;" >
        <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server"  DropShadow="True"
            PopupControlID="Panel1" TargetControlID="dummy" PopupDragHandleControlID="Label1">
        </asp:ModalPopupExtender>
        <asp:HiddenField ID="dummy" runat="server" />
        <asp:Panel ID="Panel1" runat="server" Style="display: none" BackColor="White">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="Label1" runat="server" Text="Log In" SkinID="skGridLabel">
                    </asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder" style="text-align: left;">
                    <asp:Login ID="Login1" runat="server">
                        <LayoutTemplate>
                            <table border="0" cellpadding="1" cellspacing="0" style="border-collapse: collapse;" >
                                <tr>
                                    <td>
                                        <table border="0" cellpadding="0px" cellspacing="5px">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" Text="User Name" />&nbsp;&nbsp;
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="UserName" runat="server" CssClass="TextBox" Width="200px" />
                                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                        ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" Text="Password " />&nbsp;&nbsp;
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="TextBox"
                                                        Width="200px" />
                                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                        ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2" style="color: Red; text-align: center; line-height: 30px; text-decoration: overline;">
                                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="2">
                                                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1"
                                                        CssClass="Button" BorderStyle="None" ForeColor="White" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                    </asp:Login>
                </td>
            </tr>
        </table>
        </asp:Panel> 
    </div>



    <%--<div class="Blue" style="font-size: 10pt;" >
        <asp:Panel ID="Panel1" runat="server">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="Label1" runat="server" Text="Log In" SkinID="skGridLabel">
                    </asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder" style="text-align: left;">
                    <asp:Login ID="Login1" runat="server">
                        <LayoutTemplate>
                            <table border="0" cellpadding="1" cellspacing="0" style="border-collapse: collapse;" >
                                <tr>
                                    <td>
                                        <table border="0" cellpadding="0px" cellspacing="5px">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" Text="User Name" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="UserName" runat="server" CssClass="TextBox" Width="200px" />
                                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                        ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" Text="Password " />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="TextBox"
                                                        Width="200px" />
                                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                        ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2" style="color: Red;">
                                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="2">
                                                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1"
                                                        CssClass="Button" BorderStyle="None" ForeColor="White" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                    </asp:Login>
                </td>
            </tr>
        </table>
        </asp:Panel> 
    </div>--%>
</asp:Content>
