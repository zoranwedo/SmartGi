<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" CodeFile="SendChannel.aspx.vb" Inherits="Maintenance_TO_SendChannel" %>

<%@ Register src="~/App_UserControls/MessagePop.ascx" tagname="MessagePop" tagprefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Invoice Send Channel
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" Runat="Server">
    <div class="Blue">
        <br />
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblMarket" runat="server" Text="Invoice Send Channels" SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvChannel" runat="server" SkinID="skGridView" AllowSorting="True"
                        AutoGenerateColumns="False" DataKeyNames="SendChannelID" 
                        DataSourceID="dsChannel">
                        <Columns>
                            <asp:TemplateField HeaderText="SendChannel" SortExpression="SendChannel">
                                <ItemTemplate>
                                    <asp:Label ID="lblSendChannel" runat="server" Text='<%# Bind("SendChannel") %>'/>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:HiddenField ID="hfSendChannelID" runat="server" Value='<%# Eval("SendChannelID") %>'/>
                                    <asp:HiddenField ID="fhActive" runat="server" Value='<%# Bind("Active") %>'/>
                                    <asp:TextBox ID="txtSendChannel" runat="server" Text='<%# Bind("SendChannel") %>'/>
                                    <asp:RequiredFieldValidator ID="reqSendChannel" runat="server" ErrorMessage="This is required field!" ControlToValidate="txtSendChannel" Display="None" />
                                    <asp:ValidatorCalloutExtender ID="reqSendChannelExt" runat="server" TargetControlID="reqSendChannel" HighlightCssClass="WaterMark"></asp:ValidatorCalloutExtender>
                                </EditItemTemplate>
                                <ItemStyle Width="200px" />
                            </asp:TemplateField>
                            <%--<asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" >
                                <ItemStyle Width="50px" />
                            </asp:CheckBoxField>--%>
                            <asp:CommandField CancelImageUrl="~/Images/decline_inline.gif" ShowEditButton="True"
                                ButtonType="Image" EditImageUrl="~/Images/edit_inline.gif" UpdateImageUrl="~/Images/accept_inline.gif">
                                <ControlStyle CssClass="ImgButton" />
                                <ItemStyle Width="70px" />
                            </asp:CommandField>
                            <asp:TemplateField InsertVisible="False" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="false" 
                                        CommandName="Delete" ImageUrl="~/Images/delete_inline.gif" 
                                        onclientclick="if (!confirm('Are you sure you want to delete this record?')) return;"  />
                                </ItemTemplate>
                                <EditItemTemplate>&nbsp;</EditItemTemplate>
                                <ItemStyle Width="25px" />
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:GridView>
                    <asp:FormView ID="newChannel" runat="server" DataKeyNames="SendChannelID" 
                        DataSourceID="dsChannel">
                        <InsertItemTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                <tr class="GridRow1T">
                                    <td style="width: 297px; height: 30px;">
                                        <asp:TextBox ID="MarketTextBox" runat="server" Text='<%# Bind("SendChannel") %>' CssClass="TextBox" />
                                        <asp:RequiredFieldValidator ID="reqMarket" runat="server" ErrorMessage="This is required field!" ControlToValidate="MarketTextBox" Display="None" />
                                        <asp:ValidatorCalloutExtender ID="reqMarketExt" runat="server" TargetControlID="reqMarket" HighlightCssClass="WaterMark"></asp:ValidatorCalloutExtender>
                                    </td>
                                    <%--<td style="width: 52px;">&nbsp</td>--%>
                                    <td style="width: 72px; padding-left: 5px;">
                                        <asp:ImageButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                            ImageUrl="~/Images/accept_inline.gif" CssClass="ImgButton" />
                                        <asp:ImageButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                            CommandName="Cancel" ImageUrl="~/Images/decline_inline.gif" CssClass="ImgButton" />
                                    </td>
                                    <td style="width: 26px;">&nbsp</td>
                                </tr>
                            </table>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                <tr class="GridRow1T">
                                    <%--<td style="width: 252px; height: 30px;">&nbsp;</td>--%>
                                    <td style="width: 300px; height: 30px;">&nbsp;</td>
                                    <td style="width: 95px; padding-left: 5px;">
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                <tr class="GridRow1T">
                                    <%--<td style="width: 252px; height: 30px;">&nbsp;</td>--%>
                                    <td style="width: 300px; height: 30px;">&nbsp;</td>
                                    <td style="width: 95px; padding-left: 5px;">
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                    </asp:FormView>
                    <uc:MessagePop ID="msgPop" runat="server" Title="SynXis Connected Tour Operators" />
                    <asp:ObjectDataSource ID="dsChannel" runat="server" DeleteMethod="Delete" 
                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                        SelectMethod="GetData" 
                        TypeName="dsTourOperatorTableAdapters.InvoiceSendChannelTableAdapter" 
                        UpdateMethod="Update" >
                        <DeleteParameters>
                            <asp:Parameter Name="Original_SendChannelID" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="SendChannel" Type="String" />
                            <asp:Parameter Name="Active" Type="Boolean" />
                            <asp:Parameter Name="Original_SendChannelID" Type="Int32" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="SendChannel" Type="String" />
                            <asp:Parameter Name="Active" Type="Boolean" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
</asp:Content>

