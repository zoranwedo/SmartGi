<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/RateTransfer/masterRtTransf.master"
    AutoEventWireup="false" CodeFile="RTransfSetup.aspx.vb" Inherits="Maintenance_RateTransfer_RTransfSetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Rate Export Setup
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ProFormaContent" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <div class="Blue">
        <asp:Panel ID="pnlRooms" runat="server">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td class="GridLabelBG">
                        <asp:Label ID="lblInSection" runat="server" Text="Hotels For Export" SkinID="skGridLabel" />
                    </td>
                </tr>
                <tr>
                    <td class="GridBorder">
                        <asp:GridView ID="gvTransf" runat="server" SkinID="skGridView" AutoGenerateColumns="False"
                            DataSourceID="dsInTransfer" DataKeyNames="HotelID">
                            <Columns>
                                <asp:TemplateField HeaderText="Hotel" SortExpression="HotelID">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Hotel") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Hotel") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="400px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Code" SortExpression="HotelEHID">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("HotelEHID") %>' CssClass="TextBox" ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="reqTextBox1" runat="server" ErrorMessage="This is required field!"
                                            ControlToValidate="TextBox1" Display="None" />
                                        <asp:ValidatorCalloutExtender ID="reqreqTextBox1" runat="server" TargetControlID="reqTextBox1"
                                            HighlightCssClass="WaterMark">
                                        </asp:ValidatorCalloutExtender>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("HotelEHID") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="50px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Export Path" SortExpression="ExPath">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ExPath") %>' CssClass="TextBox" ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="reqTextBox2" runat="server" ErrorMessage="This is required field!"
                                            ControlToValidate="TextBox2" Display="None" />
                                        <asp:ValidatorCalloutExtender ID="reqreqTextBox2" runat="server" TargetControlID="reqTextBox2"
                                            HighlightCssClass="WaterMark">
                                        </asp:ValidatorCalloutExtender>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("ExPath") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="150px" />
                                </asp:TemplateField>
                                <asp:CommandField CancelImageUrl="~/Images/decline_inline.gif" ShowEditButton="True"
                                    ButtonType="Image" EditImageUrl="~/Images/edit_inline.gif" UpdateImageUrl="~/Images/accept_inline.gif">
                                    <ControlStyle CssClass="ImgButton" />
                                    <ItemStyle Width="50px" />
                                </asp:CommandField>
                                <asp:TemplateField InsertVisible="False" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="false" CommandName="Delete"
                                            ImageUrl="~/Images/delete_inline.gif" OnClientClick="return confirm('Are you sure you want to delete the record')" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        &nbsp;</EditItemTemplate>
                                    <ItemStyle Width="25px" />
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                    <tr class="GridRow1B">
                                        <td style="width: 400px; padding-right: 2px; height: 30px;">
                                            <b>HotelID</b>
                                        </td>
                                        <td style="width: 50px; padding-right: 2px;">
                                            <b>Code</b>
                                        </td>
                                        <td style="width: 150px; padding-right: 2px;">
                                            <b>Export Path</b>
                                        </td>
                                        <td style="width: 75px; padding-left: 5px;">
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                        </asp:GridView>
                        <asp:FormView ID="fvTransf" runat="server" DataKeyNames="HotelID" DataSourceID="dsInTransfer">
                            <InsertItemTemplate>
                                <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                    <tr class="GridRow1T">
                                        <td style="width: 400px; padding-right: 2px; height: 30px;">
                                            <asp:DropDownList ID="HotelIDCombo" runat="server" CssClass="TextBox" DataSourceID="dsHotel"
                                                DataTextField="Hotel" DataValueField="HotelID" SelectedValue='<%# Bind("HotelID") %>'>
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 50px; padding-right: 2px;">
                                            <asp:TextBox ID="HotelEHIDTextBox" runat="server" Text='<%# Bind("HotelEHID") %>'
                                                CssClass="TextBox" />
                                            <asp:RequiredFieldValidator ID="reqType" runat="server" ErrorMessage="This is required field!"
                                                ControlToValidate="HotelEHIDTextBox" Display="None" />
                                            <asp:ValidatorCalloutExtender ID="reqTypeExt" runat="server" TargetControlID="reqType"
                                                HighlightCssClass="WaterMark">
                                            </asp:ValidatorCalloutExtender>
                                        </td>
                                        <td style="width: 150px; padding-right: 2px;">
                                            <asp:TextBox ID="ExPathTextBox" runat="server" Text='<%# Bind("ExPath") %>'
                                                CssClass="TextBox" />
                                            <asp:RequiredFieldValidator ID="reqPath" runat="server" ErrorMessage="This is required field!"
                                                ControlToValidate="ExPathTextBox" Display="None" />
                                            <asp:ValidatorCalloutExtender ID="reqPathExt" runat="server" TargetControlID="reqPath"
                                                HighlightCssClass="WaterMark">
                                            </asp:ValidatorCalloutExtender>
                                        </td>
                                        <td style="width: 75px; padding-left: 5px;">
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Insert"
                                                ImageUrl="~/Images/accept_inline.gif" CssClass="ImgButton" />
                                            <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                                ImageUrl="~/Images/decline_inline.gif" CssClass="ImgButton" />
                                        </td>
                                    </tr>
                                </table>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                    <tr class="GridRow1T">
                                        <td style="width: 606px; height: 30px;">
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
                                        <td style="width: 606px; height: 30px;">
                                            &nbsp;
                                        </td>
                                        <td style="width: 75px; padding-left: 5px;">
                                            <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                        </asp:FormView>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <br />
        <asp:HiddenField ID="dummy" runat="server" />
        <asp:ObjectDataSource ID="dsInTransfer" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataHotel" TypeName="dsRateTransferTableAdapters.smartHotelTableAdapter"
            DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_HotelID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="HotelEHID" Type="String" />
                <asp:Parameter Name="Original_HotelID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="HotelID" Type="Int32" />
                <asp:Parameter Name="HotelEHID" Type="String" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsHotel" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="dsRateTransferTableAdapters.HotelTableAdapter">
        </asp:ObjectDataSource>
        <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
            PopupDragHandleControlID="popLabel" CancelControlID="btnNo" DropShadow="True"
            BackgroundCssClass="modalBackground" TargetControlID="dummy" X="200" Y="200">
        </asp:ModalPopupExtender>
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
                        <p style="text-align: right;" class="GridRow2T">
                            <br />
                            <asp:Button ID="btnNo" runat="server" Text="OK" SkinID="skBtnBase" />&nbsp;
                        </p>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
