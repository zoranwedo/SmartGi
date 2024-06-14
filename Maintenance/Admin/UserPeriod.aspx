<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" CodeFile="UserPeriod.aspx.vb" Inherits="Maintenance_Admin_UserPeriod" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        User Log-on Accounting Period
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" Runat="Server">
        <asp:HiddenField ID="hfUser" runat="server" Value='<%# My.User.Name %>' />
        <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblUser" runat="server" SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:FormView ID="newPeriod" runat="server" DataSourceID="dsUserLogPeriod" DefaultMode="Edit" >
                        <EditItemTemplate>
                            <table border="0" cellpadding="0" cellspacing="0" 
                                style="border-style: None; border-collapse: collapse;">
                                <tr>
                                    <td style="width: 150px; ">
                                        <asp:DropDownList ID="ddlMonth" runat="server" CssClass="TextBox" 
                                            SelectedValue='<%# Bind("PeriodMonth") %>' >
                                            <asp:ListItem Value="1">January</asp:ListItem>
                                            <asp:ListItem Value="2">February</asp:ListItem>
                                            <asp:ListItem Value="3">March</asp:ListItem>
                                            <asp:ListItem Value="4">April</asp:ListItem>
                                            <asp:ListItem Value="5">May</asp:ListItem>
                                            <asp:ListItem Value="6">June</asp:ListItem>
                                            <asp:ListItem Value="7">July</asp:ListItem>
                                            <asp:ListItem Value="8">August</asp:ListItem>
                                            <asp:ListItem Value="9">September</asp:ListItem>
                                            <asp:ListItem Value="10">October</asp:ListItem>
                                            <asp:ListItem Value="11">November</asp:ListItem>
                                            <asp:ListItem Value="12">December</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width: 100px; ">
                                        <asp:DropDownList ID="ddlYear" runat="server" AppendDataBoundItems="True" 
                                            CssClass="TextBox" onload="ddlYear_Load" 
                                            SelectedValue='<%# Bind("PeriodYear") %>'>
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width: 50px; height: 30px; padding-left: 5px;">
                                        <asp:ImageButton ID="InsertButton" runat="server" CausesValidation="True" 
                                            CommandName="Update" CssClass="ImgButton" 
                                            ImageUrl="~/Images/accept_inline.gif" />
                                    </td>
                                </tr>
                            </table>
                        </EditItemTemplate>
                    </asp:FormView>
                    <asp:ObjectDataSource ID="dsUserLogPeriod" runat="server" OldValuesParameterFormatString="original_{0}" 
                        TypeName="UserTableAdapters.UserTableAdapter" 
                        SelectMethod="GetByUserName" 
                        UpdateMethod="UpdatePeriod">
                        <UpdateParameters>
                            <asp:Parameter Name="PeriodYear" Type="Int32" />
                            <asp:Parameter Name="PeriodMonth" Type="Int16" />
                            <asp:ControlParameter Name="UserName" Type="String" ControlID="hfUser" PropertyName="Value" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:ControlParameter Name="UserName" Type="String" ControlID="hfUser" PropertyName="Value" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

