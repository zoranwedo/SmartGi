<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="CCIDetail.aspx.vb" Inherits="Maintenance_CCIDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    CCI Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" runat="Server">
    <div class="Blue">
        <table cellpadding="0" cellspacing="2">
            <tr>
                <td class="GridBorder">
                    <asp:DetailsView ID="dwHotelDetail" runat="server" Width="600px" DataSourceID="dsHotelDetail"
                        DataKeyNames="HotelID" SkinID="skDetailView" AutoGenerateRows="False" EnableModelValidation="True">
                        <FieldHeaderStyle Width="120px" />
                        <Fields>
                            <asp:TemplateField HeaderText="Company" SortExpression="Hotel">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtHotel" runat="server" Text='<%# Bind("Hotel") %>' CssClass="TextBox" />
                                    <asp:RequiredFieldValidator ID="reqHotel" runat="server" ErrorMessage="This is required field!"
                                        ControlToValidate="txtHotel" Display="None" />
                                    <asp:ValidatorCalloutExtender ID="reqHotelExt" runat="server" TargetControlID="reqHotel"
                                        HighlightCssClass="WaterMark" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Hotel") %>' />
                                </ItemTemplate>
                                <HeaderStyle CssClass="GridRow2B" Font-Bold="True" />
                                <ItemStyle CssClass="GridRow2B" Font-Bold="True" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="HotelID" HeaderText="HotelID" SortExpression="HotelID"
                                Visible="false" />
                            <asp:BoundField DataField="HotelHID" HeaderText="Map Code" SortExpression="HotelHID"
                                Visible="false">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="RNC" HeaderText="RNC" SortExpression="RNC">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" Visible="False">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" SortExpression="ZipCode">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Tel" HeaderText="Tel" SortExpression="Tel">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Fax" HeaderText="Fax" SortExpression="Fax">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Contact" HeaderText="Contact" SortExpression="Contact">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Bank" HeaderText="Bank" SortExpression="Bank">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="BankAccount" HeaderText="BankAccount" SortExpression="BankAccount">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Rooms" HeaderText="Rooms" SortExpression="Rooms" Visible="False">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Htl_Titulo" HeaderText="Htl_Titulo" SortExpression="Htl_Titulo"
                                Visible="False">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:CheckBoxField DataField="Flat" HeaderText="Flat" SortExpression="Flat" Visible="False" />
                            <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active"
                                Visible="False" />
                            <asp:CheckBoxField DataField="AdultOnly" HeaderText="AdultOnly" SortExpression="AdultOnly"
                                Visible="False" />
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update"
                                        Text="Update" />
                                    &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel"
                                        Text="Cancel" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit"
                                        Text="Edit" />
                                </ItemTemplate>
                                <ControlStyle BorderStyle="None" CssClass="Button" Font-Size="10pt" ForeColor="White" />
                                <ItemStyle CssClass="ComandRow2T" Height="30px" HorizontalAlign="Right" VerticalAlign="Middle" />
                            </asp:TemplateField>
                        </Fields>
                    </asp:DetailsView>
                </td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="dsHotelDetail" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataByHotelID" TypeName="dsMaintHotelTableAdapters.HotelTableAdapter"
            UpdateMethod="Update">
            <UpdateParameters>
                <asp:Parameter Name="HotelHID" Type="String" />
                <asp:Parameter Name="Hotel" Type="String" />
                <asp:Parameter Name="RNC" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="ZipCode" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="Tel" Type="String" />
                <asp:Parameter Name="Fax" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Contact" Type="String" />
                <asp:Parameter Name="Bank" Type="String" />
                <asp:Parameter Name="BankAccount" Type="String" />
                <asp:Parameter Name="Rooms" Type="Int32" />
                <asp:Parameter Name="Htl_Titulo" Type="String" />
                <asp:Parameter Name="AdultOnly" Type="Boolean" />
                <asp:Parameter Name="Flat" Type="Boolean" />
                <asp:Parameter Name="Active" Type="Boolean" />
                <asp:Parameter Name="Logo" Type="Object" />
                <asp:Parameter Name="MaxOccupancy" Type="Int16" />
                <asp:Parameter Name="SortPriority" Type="Int32" />
                <asp:Parameter Name="Original_HotelID" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="HotelID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
            Enabled="true" PopupDragHandleControlID="popLabel" CancelControlID="btnNo" DropShadow="True"
            BackgroundCssClass="modalBackground" TargetControlID="hfUserName" X="200" Y="200">
        </asp:ModalPopupExtender>
        <asp:Panel ID="popPanel" runat="server" Width="300px" BackColor="White" Style="display: none">
            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td class="GridLabelBG">
                        <asp:Label ID="popLabel" runat="server" Text="Title" SkinID="skGridLabel" />
                    </td>
                </tr>
                <tr>
                    <td class="GridBorder">
                        <p style="text-align: center;">
                            <asp:Label ID="popMessage" runat="server" Text="Message" />
                        </p>
                        <p style="text-align: right;" class="GridRow2T">
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
