<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="Market.aspx.vb" Inherits="Maintenance_Market" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Market
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" runat="Server">
    <asp:HiddenField ID="dummy" runat="server" />
    <div class="Blue">
        <br />
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblMarket" runat="server" Text="Market" SkinID="skGridLabel" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gridMarket" runat="server" SkinID="skGridView" AllowSorting="True"
                        AutoGenerateColumns="False" DataKeyNames="MarketID" 
                        DataSourceID="dsMarket" Width="335px">
                        <Columns>
                            <asp:BoundField DataField="MarketID" HeaderText="Code" ReadOnly="True" SortExpression="MarketID">
                                <ItemStyle Width="50px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Market" HeaderText="Market" SortExpression="Market">
                                <ControlStyle CssClass="TextBox" />
                                <ItemStyle Width="200px" />
                            </asp:BoundField>
                            <asp:CheckBoxField DataField="Local" HeaderText="Local" InsertVisible="False" 
                                ReadOnly="True" SortExpression="Local" />
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
                    <asp:FormView ID="newMarket" runat="server" DataKeyNames="MarketID" 
                        DataSourceID="dsMarket" Width="335px">
                        <InsertItemTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                <tr class="GridRow1T">
                                    <td style="width: 50px; height: 30px;">
                                        <asp:TextBox ID="MarketIDTextBox" runat="server" Text='<%# Bind("MarketID") %>' 
                                            Width="45px" CssClass="TextBox" MaxLength="2" />
                                        <asp:RequiredFieldValidator ID="reqMarketID" runat="server" ErrorMessage="This is required field!" ControlToValidate="MarketIDTextBox" Display="None" />
                                        <asp:ValidatorCalloutExtender ID="reqMarketIDExt" runat="server" TargetControlID="reqMarketID" HighlightCssClass="WaterMark"></asp:ValidatorCalloutExtender>
                                    </td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="MarketTextBox" runat="server" Text='<%# Bind("Market") %>' CssClass="TextBox" />
                                        <asp:RequiredFieldValidator ID="reqMarket" runat="server" ErrorMessage="This is required field!" ControlToValidate="MarketTextBox" Display="None" />
                                        <asp:ValidatorCalloutExtender ID="reqMarketExt" runat="server" TargetControlID="reqMarket" HighlightCssClass="WaterMark"></asp:ValidatorCalloutExtender>
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
                                    <td style="width: 250px; height: 30px;">
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
                    <asp:ObjectDataSource ID="dsMarket" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsMaintBasicTableAdapters.MarketTableAdapter"
                        UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_MarketID" Type="String" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Market" Type="String" />
                            <asp:Parameter Name="Original_MarketID" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="MarketID" Type="String" />
                            <asp:Parameter Name="Market" Type="String" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
                
        <asp:Panel ID="popPanel" runat="server" Width="300px" BackColor="White" Style="display: none">
        <table cellpadding="0" cellspacing="0" style="width: 100%;">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="popLabel" runat="server" Text="Delete Market" SkinID="skGridLabel"></asp:Label>
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
  <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        ShowMessageBox="True" ShowSummary="False" />  
    <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
        PopupDragHandleControlID="popLabel" CancelControlID="btnNo" DropShadow="True" 
        BackgroundCssClass="modalBackground" TargetControlID="dummy" X="200" Y="200">
    </asp:ModalPopupExtender>
    
</asp:Content>
