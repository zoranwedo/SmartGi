<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Admin/AdminMaster.master"
    AutoEventWireup="false" CodeFile="User.aspx.vb" Inherits="Maintenance_Admin_User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    User Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AminContent" runat="Server">
    <div class="Blue">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table cellpadding="0" cellspacing="2" style="width: 716px">
                    <tr>
                        <td style="width: 25px">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/select_.gif" />
                        </td>
                        <td class="GridLabelBG" style="width: 332px">
                            <asp:Label ID="lblSelectedHotel0" runat="server" SkinID="skGridLabel" Text="User's option" />
                        </td>
                        <td class="GridLabelBG" style="width: 200px">
                            <asp:Label ID="lblSelectedHotel" runat="server" SkinID="skGridLabel" Text="Roles" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 25px">&nbsp;</td>
                        <td align="left" class="GridBorder" valign="top">
                            <table cellpadding="0" cellspacing="0" style="width: 500px">
                                <tr>
                                    <td class="SelectRow1TB" style="padding: 0px 0px 0px 5px;">
                                        Full Name
                                    </td>
                                    <td class="GridRow1TB" colspan="2" style="padding: 0px 0px 0px 5px;">
                                        <asp:TextBox ID="txtSignature" runat="server" CssClass="TextBox" Width="80%" />
                                        &nbsp;
                                        <asp:ImageButton ID="btUpdate" runat="server" ImageUrl="~/Images/accept_inline.gif" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="width: 140px; padding: 4px 0px 4px 5px;">
                                        Last Passsword Cange
                                    </td>
                                    <td class="GridRow1B" style="width: 180px; padding: 4px 0px 4px 5px;">
                                        <asp:Label ID="lblPasswordDate" runat="server" SkinID="GridLabel" Text="lblPasswordDate" />
                                    </td>
                                    <td class="GridRow1B" style="width: 180px; padding: 4px 0px 4px 5px;">
                                    <div class="Red">
                                        <asp:HyperLink ID="lnkChange" runat="server" Font-Bold="True" SkinID="GridLink"
                                            Text="Change Password" NavigateUrl="~/Admin/ChangePassword.aspx" />
                                    </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" rowspan="2" style="width: 140px; padding: 4px 0px 4px 5px; vertical-align: top;">
                                        User Status
                                    </td>
                                    <td class="GridRow1B" style="width: 180px; padding: 4px 0px 4px 5px;">
                                        <asp:Label ID="lblApproved" runat="server" SkinID="GridLabel" Text="Active" />
                                    </td>
                                    <td class="GridRow1B" style="width: 180px; padding: 4px 0px 4px 5px;">
                                    <div class="Red">
                                        <asp:LinkButton ID="btDisable" runat="server" Text="Disable User" Font-Bold="True"
                                            OnClientClick="return confirm('Are you sure you want to disable this user?')" />
                                        <asp:LinkButton ID="btEnable" runat="server" Text="Enable User" Font-Bold="True"
                                            OnClientClick="return confirm('Are you sure you want to enable this user?')" />
                                    </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" style="width: 180px; padding: 4px 0px 4px 5px; vertical-align: bottom;">
                                        <asp:Label ID="lblLocked" runat="server" SkinID="GridLabel" Text="User Locked" 
                                            ToolTip="User is locked when limit of log-ins by wrong password is exceeded!" />
                                        <asp:Label ID="lblLockedOn" runat="server" SkinID="GridLabel" Text="Locked Date" />
                                    </td>
                                    <td class="GridRow1B" style="width: 180px; padding: 4px 0px 4px 5px; vertical-align: bottom;">
                                    <div class="Red">
                                        <asp:LinkButton ID="btUnlock" runat="server" Text="Unlock User" Font-Bold="True"
                                            OnClientClick="return confirm('Are you sure you want to unlock this user?')" />
                                    </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" rowspan="2" style="width: 140px; padding: 4px 0px 4px 5px; vertical-align: top;">
                                        User Access
                                    </td>
                                    <td class="GridRow1B" style="width: 180px; padding: 4px 0px 4px 5px;">
                                        <asp:Label      ID="lblHotelsAll" runat="server" Text="All Hotels" />
                                        <asp:LinkButton ID="lblHotelsSel" runat="server" Text="Selected Hotels" />
                                    </td>
                                    <td class="GridRow1B" style="width: 180px; padding: 4px 0px 4px 5px;">
                                    <div class="Red">
                                        <asp:LinkButton ID="btHotelsAll" runat="server" Text="Grant All Hotels" Font-Bold="True"
                                            OnClientClick="return confirm('Are you sure you want to grant access to all hotels to this user?')" />
                                        <asp:LinkButton ID="btHotelsSel" runat="server" Text="Grant Selected Hotels" Font-Bold="True" CssClass="Red"
                                            OnClientClick="return confirm('Are you sure you want to grant access only to selected hotels to this user?')" />
                                    </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" style="width: 180px; padding: 4px 0px 4px 5px; vertical-align: bottom;">
                                        <asp:Label      ID="lblToAll" runat="server" Text="All Tour Operators" />
                                        <asp:LinkButton ID="lblToSel" runat="server" Text="Selected Tour Operators" />
                                    </td>
                                    <td class="GridRow1B" style="width: 180px; padding: 4px 0px 4px 5px; vertical-align: bottom;">
                                    <div class="Red">
                                        <asp:LinkButton ID="btToAll" runat="server" Text="Grant All Tour Operators" Font-Bold="True"
                                            OnClientClick="return confirm('Are you sure you want to grant access to all tour operators to this user?')" />
                                        <asp:LinkButton ID="btToSel" runat="server" Text="Grant Selected Tour Operators" Font-Bold="True"
                                            OnClientClick="return confirm('Are you sure you want to grant access only to selected tour operators to this user?')" />
                                    </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="Red" Text="Error" Visible="False" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td class="GridBorder" style="width: 200px" valign="top">
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:CheckBoxList ID="RoleList" runat="server" CssClass="GridRow1TB" SkinID="GridComboList" Width="200px" />
                                        <asp:LinkButton ID="lnkUpdate" runat="server" Font-Bold="True" SkinID="GridButton" Text="Update role" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <asp:Panel ID="popPanel" runat="server" Width="300px" BackColor="White" Style="display: none">
        <table cellpadding="0" cellspacing="0" style="width: 100%;">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="popLabel" runat="server" Text="Delete data" SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <p style="text-align: center;">
                        <asp:Label ID="popMessage" runat="server" Text="Message" />
                    </p>
                    <p style="text-align: right;" class="GridRow2TB">
                        <br />
                        <asp:Button ID="btnYes" runat="server" Text="Yes" SkinID="skBtnBase" />&nbsp;
                        <asp:Button ID="btnNo" runat="server" Text="No" SkinID="skBtnBase" />&nbsp;
                    </p>
                </td>
            </tr>
        </table>
    </asp:Panel>
    </div>
</asp:Content>
