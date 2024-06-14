﻿<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Contracting/masterContracting.master" AutoEventWireup="false" CodeFile="SpecialCategory.aspx.vb" Inherits="Maintenance_Contracting_SpecialCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Special Categories
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContractingContent" Runat="Server">
    <asp:HiddenField ID="dummy" runat="server" />
    <div class="Blue">
        <br />
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblSpecCategory" runat="server" Text="Special Categories" 
                        SkinID="skGridLabel" Enabled="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gridSpecCategory" runat="server" SkinID="skGridView" AutoGenerateColumns="False"
                        DataSourceID="dsSpecCategory" DataKeyNames="SpecialCategory" >
                        <Columns>
                            <asp:BoundField DataField="SpecialCategory" HeaderText="Category" SortExpression="SpecialCategory">
                                <ItemStyle Width="250px" />
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:CommandField CancelImageUrl="~/Images/decline_inline.gif" ShowEditButton="True"
                                ButtonType="Image" EditImageUrl="~/Images/edit_inline.gif" UpdateImageUrl="~/Images/accept_inline.gif" >
                                <ControlStyle CssClass="ImgButton" />
                                <ItemStyle Width="50px" />
                            </asp:CommandField>
                            <asp:TemplateField InsertVisible="False" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="false" 
                                        CommandName="Delete" ImageUrl="~/Images/delete_inline.gif" OnClientClick="return confirm('Are you sure you want to delete the record')" />
                                </ItemTemplate>
                                <EditItemTemplate>&nbsp;</EditItemTemplate>
                                <ItemStyle Width="25px" />
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:GridView>
                    <asp:FormView ID="newSpecCategory" runat="server" DataKeyNames="SpecialCategory" 
                        DataSourceID="dsSpecCategory" >
                        <InsertItemTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                <tr class="GridRowLast">
                                    <td style="width: 250px;">
                                        <asp:TextBox ID="SpecCategoryTextBox" runat="server" Text='<%# Bind("SpecialCategory") %>' Width="245px" CssClass="TextBox" />
                                        <asp:RequiredFieldValidator ID="reqSpecCategory" runat="server" ErrorMessage="This is required field!" ControlToValidate="SpecCategoryTextBox" Display="None" />
                                        <asp:ValidatorCalloutExtender ID="reqSpecCategoryExt" runat="server" TargetControlID="reqSpecCategory" HighlightCssClass="WaterMark"></asp:ValidatorCalloutExtender>
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
                            <tr class="GridRowLast">
                                    <td style="width: 250px; height: 30px;">&nbsp;
                                    </td>
                                    <td style="width: 75px; padding-left: 5px;">
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                    </td>
                            </tr>
                            </ table>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                <tr class="GridRowLast">
                                    <td style="width: 250px; height: 30px;">
                                        &nbsp;
                                    </td>
                                    <td style="width: 75px; padding-left: 5px;">
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                    </asp:FormView>
                    <asp:ObjectDataSource ID="dsSpecCategory" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsMaintBasicTableAdapters.SpecialCategoryTableAdapter"
                        UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_SpecialCategory" Type="String" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="SpecialCategory" Type="String" />
                            <asp:Parameter Name="Original_SpecialCategory" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="SpecialCategory" Type="String" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
    </div>
    
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
                    <p style="text-align: right;" class="FooterRow">
                        <br />
                        <asp:Button ID="btnYes" runat="server" Text="Yes" SkinID="skBtnBase" />&nbsp;
                        <asp:Button ID="btnNo" runat="server" Text="No" SkinID="skBtnBase" />&nbsp;
                    </p>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

