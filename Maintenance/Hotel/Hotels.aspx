<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="Hotels.aspx.vb" Inherits="Maintenance_Hotel_Hotels" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Hotels
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" runat="Server">
    <div class="Green">
        <asp:CollapsiblePanelExtender ID="cpeSearch" runat="server" TargetControlID="pnSearch"
            CollapseControlID="lblFilter" ExpandControlID="lblFilter" ImageControlID="imgExpander"
            CollapsedImage="~/Images/expand_.png" ExpandedImage="~/Images/collapse_.png"
            Collapsed="False">
        </asp:CollapsiblePanelExtender>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <asp:Panel ID="pnSearchHead" runat="server">
                    <td class="GridLabelBG" style="width: 600px;">
                        <asp:Label ID="lblFilter" runat="server" SkinID="skGridLabel">Search/Filter &nbsp;
                            <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />
                            &nbsp; </asp:Label>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px;">
                    <asp:Panel ID="pnSearch" runat="server" CssClass="popupPanel" DefaultButton="btnFilter">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="GridRow2B" style="width: 100px; text-align: left; font-weight: bold;">
                                    Hotel
                                </td>
                                <td class="GridRow2B" style="width: 400px; text-align: left;">
                                    <asp:DropDownList ID="ddlHotels" runat="server" CssClass="TextBox" DataSourceID="dsHotels"
                                        DataTextField="Hotel" DataValueField="HotelID" />
                                </td>
                                <td class="GridRow2B" style="width: 100px; text-align: right; padding-top: 5px; height: 30px;">
                                    <asp:Button ID="btnSerch" runat="server" SkinID="skBtnSerach" Style="margin-bottom: 5px;" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Name
                                </td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="fltName" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="fltNameExt" runat="server" TargetControlID="fltName"
                                        WatermarkCssClass="WaterMark" WatermarkText="Hotel name (use % as wildchar)" />
                                </td>
                                <td class="GridRow1B">
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    City
                                </td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="fltCity" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="fltCityExt" runat="server" TargetControlID="fltCity"
                                        WatermarkCssClass="WaterMark" WatermarkText="City name (use % as wildchar)" />
                                </td>
                                <td class="GridRow1B">
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Country
                                </td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="fltCountry" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="fltCountryExt" runat="server" TargetControlID="fltCountry"
                                        WatermarkCssClass="WaterMark" WatermarkText="Country name (use % as wildchar)" />
                                </td>
                                <td class="GridRow1B">
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear">
                                </td>
                                <td class="GridRowClear">
                                    <asp:CheckBox ID="fltActive" runat="server" Text="Show only active hotels" Checked="True"
                                        AutoPostBack="False" />
                                </td>
                                <td class="GridRowClear">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" class="ComandRow2T" style="height: 30px; padding-top: 5px">
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
    <br />
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lbHotels" runat="server" Text="Hotels" SkinID="skGridLabel">
                    </asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvHotels" runat="server" DataSourceID="dsHotels" DataKeyNames="HotelID"
                        SkinID="skGridView" AutoGenerateColumns="False" 
                        EnableModelValidation="True">
                        <RowStyle Wrap="False" />
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandArgument='<%# Eval("HotelID") %>'
                                        CommandName="Details" ImageUrl="~/Images/Leads.gif" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width="25px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="" SortExpression="HotelID">
                                <ItemTemplate>
                                    (<asp:HyperLink ID="HyperLink1" runat="server" 
                                        NavigateUrl='<%# "HotelDetail.aspx?HotelID=" & Eval("HotelID") %>' 
                                        Text='<%# Eval("HotelID") %>' />)
                                </ItemTemplate>
                                <ItemStyle Width="30px" HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="HotelHID" HeaderText="Code" SortExpression="HotelHID">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle Width="60px" HorizontalAlign="Center" Font-Bold="true" Font-Italic="true" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Hotel" HeaderText="Hotel" SortExpression="Hotel">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="350px" Font-Bold="true" />
                            </asp:BoundField>
                            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="200px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="200px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Tel" HeaderText="Tel" SortExpression="Tel">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Fax" HeaderText="Fax" SortExpression="Fax" Visible="false">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="150px" />
                            </asp:BoundField>
                            <asp:CheckBoxField DataField="Flat" HeaderText="F" SortExpression="Flat">
                                <ItemStyle Width="25px" />
                            </asp:CheckBoxField>
                            <asp:CheckBoxField DataField="Active" HeaderText="A" SortExpression="Active">
                                <ItemStyle Width="25px" />
                            </asp:CheckBoxField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; padding-top: 5px; height: 30px;">
                    <asp:Button ID="linkNew" runat="server" Text="New Hotel" SkinID="skBtnBase" />
                </td>
            </tr>
        </table>
    </div>
    <asp:ObjectDataSource ID="dsHotels" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByFilter" TypeName="dsMaintHotelTableAdapters.HotelTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value"
                Type="String" />
            <asp:ControlParameter ControlID="fltName" Name="Hotel" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="fltCity" Name="City" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="fltCountry" Name="Country" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="fltActive" Name="ActiveOnly" PropertyName="Checked"
                Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
