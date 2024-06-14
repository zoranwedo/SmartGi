<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" 
    CodeFile="CrsExcludedServices.aspx.vb" Inherits="Maintenance_CRS_CrsExcludedServices" %>

<%@ Register src="~/App_UserControls/MessagePop.ascx" tagname="MessagePop" tagprefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    SynXis Excluded Services
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" Runat="Server">
<div class="Blue">
        <br />
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblExcluded" runat="server" Text="Excluded Services" 
                        SkinID="skGridLabel" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gridExcluded" runat="server" SkinID="skGridView" AutoGenerateColumns="False" 
                        DataSourceID="dsExcluded" DataKeyNames="ServiceID" >
                        <Columns>
                            <asp:BoundField DataField="ServiceID" HeaderText="Code" ReadOnly="True" SortExpression="ServiceID">
                                <ItemStyle Width="150px" />
                            </asp:BoundField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnDel" runat="server" CausesValidation="False" 
                                        CommandName="DeleteService" ImageUrl="~/Images/delete_inline.gif" 
                                        CommandArgument='<%# Eval("ServiceID") %>' CssClass="ImgButton"
                                        OnClientClick="if (!confirm('Are you sure you want to delete this record?')) return;" />
                                </ItemTemplate>
                                <ItemStyle Width="75px" />
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:GridView>
                    <asp:FormView ID="newExcluded" runat="server" DataKeyNames="ServiceID" 
                        DataSourceID="dsExcluded" >
                        <InsertItemTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                <tr class="GridRow1T">
                                    <td style="width: 148px; height: 30px;">
                                        <asp:TextBox ID="ServiceIDTextBox" runat="server" 
                                            Text='<%# Bind("ServiceID") %>' CssClass="TextBox" MaxLength="50" Width="80%" />
                                        <asp:RequiredFieldValidator ID="reqServiceID" runat="server" ErrorMessage="This is required field!" ControlToValidate="ServiceIDTextBox" Display="None" />
                                        <asp:ValidatorCalloutExtender ID="reqServiceIDtExt" runat="server" TargetControlID="reqServiceID" HighlightCssClass="WaterMark"></asp:ValidatorCalloutExtender>
                                    </td>
                                    <td style="width: 75px; padding-left: 5px;">
                                        <asp:ImageButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                            ImageUrl="~/Images/accept_inline.gif" CssClass="ImgButton" />
                                        <asp:ImageButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                            CommandName="Cancel" ImageUrl="~/Images/decline_inline.gif" CssClass="ImgButton" />
                                    </td>
                                </tr>
                            </table>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                            <tr class="GridRow1T">
                                    <td style="width: 150px; height: 30px;">&nbsp;</td>
                                    <td style="width: 73px; padding-left: 5px;">
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                    </td>
                            </tr>
                            </ table>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                <tr class="GridRow1T">
                                    <td style="width: 150px; height: 30px;">&nbsp;</td>
                                    <td style="width: 73px; padding-left: 5px;">
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                    </asp:FormView>
                    <asp:ObjectDataSource ID="dsExcluded" runat="server" DeleteMethod="DeleteQuery" InsertMethod="Insert"
                        OldValuesParameterFormatString="" SelectMethod="GetData" TypeName="dsCRSTableAdapters.crsExcludedServicesTableAdapter">
                        <DeleteParameters>
                            <asp:Parameter Name="ChangeUser" Type="String" />
                            <asp:Parameter Name="ServiceID" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ServiceID" Type="String" />
                            <asp:Parameter Name="ChangeUser" Type="String" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>

        <uc:MessagePop ID="msgPop" runat="server" Title="SynXis Connected Tour Operators" />

    </div>
</asp:Content>

