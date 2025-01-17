﻿<%@ Page Title="User Administration" Language="VB" MasterPageFile="~/masterSMART.master"
    AutoEventWireup="false" CodeFile="Admin.aspx.vb" Inherits="Maintenance_Admin_Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Users Administration
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" runat="Server">
    <asp:HiddenField ID="dummy" runat="server" />
    <div class="Green">
        <asp:CollapsiblePanelExtender ID="cpeSearch" runat="server" TargetControlID="pnSearch"
            CollapseControlID="lblFilter" ExpandControlID="lblFilter" ImageControlID="imgExpander"
            CollapsedImage="~/Images/expand_.png" ExpandedImage="~/Images/collapse_.png"
            Collapsed="False">
        </asp:CollapsiblePanelExtender>
        <table cellpadding="0" cellspacing="0" style="width: 633px">
            <tr>
                <asp:Panel ID="pnSearchHead" runat="server" Width="100%">
                    <td class="GridLabelBG" style="width: 100%">
                        <asp:Label ID="lblFilter" runat="server" SkinID="skGridLabel">Search/Filter &nbsp;
                            <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />
                            &nbsp; </asp:Label>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:Panel ID="pnSearch" runat="server" CssClass="popupPanel" DefaultButton="btnFilter" Width="100%">
                        <table cellpadding="0" cellspacing="0" style="width: 100%">
                            <tr>
                                <td class="GridRowClear" style="width: 70px">
                                    Name
                                </td>
                                <td class="GridRowClear">
                                    <asp:TextBox ID="fltName" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="fltNameExt" runat="server" TargetControlID="fltName"
                                        WatermarkCssClass="WaterMark" WatermarkText="User name" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="ComandRow2T" style="height: 30px; padding-top: 5px">
                                    <asp:Button ID="btnFilter" runat="server" SkinID="skBtnFilter" />&nbsp;
                                    <asp:Button ID="btnClear" runat="server" SkinID="skBtnClear" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    <div class="Blue">
        <br />
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblUsers" runat="server" Text="Users" SkinID="skGridLabel" />
                    <asp:LinkButton ID="btnReport" runat="server" Style="float: right; color: White; padding: 4px; font-weight: bold;">
                        Users Report
                    </asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                    <asp:GridView ID="gvUsers" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        DataKeyNames="UserName" DataSourceID="dsUsers" EmptyDataText="There are no users in the system..."
                        Font-Italic="False" SkinID="skGridView" Width="100%" PageSize="20"
                        EnableModelValidation="True">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandArgument='<%# Eval("UserName") %>'
                                        CommandName="Details" ImageUrl="~/Images/Leads.gif" Text="Button" />
                                </ItemTemplate>
                                <ItemStyle Width="20px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="User Name" SortExpression="UserName">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" 
                                        Text='<%# Eval("UserName") %>' ToolTip='<%# Eval("Roles") %>' 
                                        NavigateUrl='<%# "~/Maintenance/Admin/User.aspx?SpecialID=" & Eval("UserName") %>'/>
                                </ItemTemplate>
                                <HeaderStyle Wrap="False" />
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="FullName" HeaderText="Full Name" SortExpression="FullName">
                                <ItemStyle Width="200px" />
                            </asp:BoundField>
                            <asp:CheckBoxField DataField="IsLockedOut" HeaderText="Locked" ReadOnly="True" SortExpression="IsLockedOut">
                                <ItemStyle Width="50px" HorizontalAlign="Center" />
                            </asp:CheckBoxField>
                            <asp:TemplateField HeaderText="Disabled" SortExpression="IsApproved">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbUnapprove" runat="server" Visible='<%# Eval("IsApproved") %>' 
                                         CommandName="Dissable"  CommandArgument='<%# Eval("UserName") %>' 
                                         OnClientClick="return confirm('Are you sure you want to dissable this user')" >
                                        <asp:Image ID="imgUnchecked" runat="server" ImageUrl="~/Images/cbUnchecked.png" />
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="lbApprove" runat="server" Visible='<%# Not Eval("IsApproved") %>'
                                         CommandName="Enable"  CommandArgument='<%# Eval("UserName") %>' 
                                         OnClientClick="return confirm('Are you sure you want to enable this user')" >
                                        <asp:Image ID="imgChecked" runat="server" ImageUrl="~/Images/cbChecked.png" />
                                    </asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle Width="60px" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="LastActivityDate" HeaderText="Last Activity Date" HtmlEncode="False"
                                SortExpression="LastActivityDate">
                                <ItemStyle Width="150px" />
                            </asp:BoundField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="False" CommandName="DeleteUser"
                                        ImageUrl="~/Images/delete_inline.gif" Text="Button" CommandArgument='<%# Eval("UserName") %>'
                                        OnClientClick="return confirm('Are you sure you want to delete this user')" />
                                </ItemTemplate>
                                <ItemStyle Width="25px" />
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle HorizontalAlign="Right" />
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Left" />
                    </asp:GridView>
                    </ContentTemplate>
                    </asp:UpdatePanel>
                    <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Right" Style="padding-top: 5px;">
                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New"
                            OnClick="btnNew_Click" />
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="dsUsers" runat="server" SelectMethod="GetDataByUserName"
            TypeName="dsUserReportTableAdapters.UserReportTableAdapter" OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:ControlParameter ControlID="fltName" Name="UserName" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsUserReport" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="dsUserReportTableAdapters.UserReportTableAdapter" />
        <asp:HiddenField ID="HiddenField1" runat="server" />
        <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
            PopupDragHandleControlID="popLabel" CancelControlID="btnNo" DropShadow="True"
            BackgroundCssClass="modalBackground" TargetControlID="dummy" X="200" Y="200">
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
