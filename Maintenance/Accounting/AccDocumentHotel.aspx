<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Accounting/masterAccount.master"
    AutoEventWireup="false" CodeFile="AccDocumentHotel.aspx.vb" Inherits="Maintenance_Accounting_AccDocumentHotel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Accounting Documents Hotel Visibility
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AccountContent" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="dummy" runat="server" />
            <div class="Blue">
                <br />
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="GridLabelBG">
                            <asp:Label ID="lblMarket" runat="server" Text="Visible Accounting Documents For Selected Hotel"
                                SkinID="skGridLabel" />
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder">
                            <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" DataSourceID="dsActiveHotels"
                                DataTextField="Hotel" DataValueField="HotelID" AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:GridView ID="gridAccClass" runat="server" SkinID="skGridView" AllowSorting="True"
                                AutoGenerateColumns="False" DataKeyNames="TrCode" DataSourceID="dsAccDocumentHotel">
                                <Columns>
                                    <asp:BoundField DataField="TrCode" HeaderText="Code" ReadOnly="True" SortExpression="TrCode">
                                        <ItemStyle Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TrAccount" HeaderText="Account" SortExpression="TrAccount">
                                        <ItemStyle Width="150px" />
                                    </asp:BoundField>
                                    <asp:TemplateField InsertVisible="False" ShowHeader="False">
                                        <ItemTemplate>
                                            &nbsp;</ItemTemplate>
                                        <ItemStyle Width="50px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField InsertVisible="False" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="false" CommandName="Delete"
                                                ImageUrl="~/Images/delete_inline.gif" OnClientClick="return confirm('Are you sure you want to delete the record?')" />
                                        </ItemTemplate>
                                        <ItemStyle Width="25px" />
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:GridView>
                            <asp:FormView ID="newAccDocClass" runat="server" DataSourceID="dsAccDocumentHotel"
                                DataKeyNames="HotelId,TrCode">
                                <InsertItemTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                        <tr class="GridRow1T">
                                            <td style="width: 150px; padding-right: 2px;">
                                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="TextBox" DataSourceID="dsDocuments"
                                                    DataTextField="TrCode" DataValueField="TrCode" SelectedValue='<%# Bind("TrCode") %>'>
                                                </asp:DropDownList>
                                            </td>
                                            <td style="width: 150px; padding-right: 2px;">
                                                &nbsp
                                            </td>
                                            <td style="width: 75px; text-align: left;">
                                                <asp:ImageButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                                    ImageUrl="~/Images/accept_inline.gif" CssClass="ImgButton" />
                                                <asp:ImageButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                                    CommandName="Cancel" ImageUrl="~/Images/decline_inline.gif" CssClass="ImgButton" />
                                            </td>
                                        </tr>
                                    </table>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <table cellpadding="0" cellspacing="2px" border="0" style="border-style: None; border-collapse: collapse;">
                                        <tr class="GridRow1T">
                                            <td style="width: 300px; height: 30px;">
                                                &nbsp;
                                            </td>
                                            <td style="width: 75px; padding-left: 5px;">
                                                <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <EmptyDataTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                        <tr class="GridRow1T">
                                            <td style="width: 300px; height: 30px;">
                                                &nbsp;
                                            </td>
                                            <td style="width: 75px; padding-left: 5px;">
                                                <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                            </asp:FormView>
                            <asp:ObjectDataSource ID="dsAccDocumentHotel" runat="server" DeleteMethod="DeleteQuery"
                                InsertMethod="InsertQuery" SelectMethod="SelectQuery" TypeName="dsAccountTableAdapters.AccDocumentHotelTableAdapter">
                                <DeleteParameters>
                                    <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue"
                                        Type="Int32" />
                                    <asp:Parameter Name="TrCode" Type="String" />
                                </DeleteParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue"
                                        Type="Int32" />
                                </SelectParameters>
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue"
                                        Type="Int32" />
                                    <asp:Parameter Name="TrCode" Type="String" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="dsDocuments" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="dsAccountTableAdapters.AccDoc4HotelTableAdapter">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue"
                                        Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="dsActiveHotels" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="dsAccountTableAdapters.SelectUserHotelTableAdapter">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value"
                                        Type="String" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                </table>
                <asp:Panel ID="popPanel" runat="server" Width="300px" BackColor="White" Style="display: none">
                    <table cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                            <td class="GridLabelBG">
                                <asp:Label ID="popLabel" runat="server" Text="Title" SkinID="skGridLabel"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="GridBorder">
                                <p style="text-align: center;">
                                    <asp:Label ID="popMessage" runat="server" Text="Message"></asp:Label>
                                </p>
                                <p style="text-align: right;">
                                    <br />
                                    <asp:Button ID="btnYes" runat="server" Text="Yes" SkinID="skBtnBase" />&nbsp;
                                    <asp:Button ID="btnNo" runat="server" Text="No" SkinID="skBtnBase" />&nbsp;
                                </p>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </div>
            <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
                PopupDragHandleControlID="popLabel" CancelControlID="btnNo" DropShadow="True"
                BackgroundCssClass="modalBackground" TargetControlID="dummy" X="200" Y="200">
            </asp:ModalPopupExtender>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
