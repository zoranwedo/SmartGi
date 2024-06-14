<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="TO.aspx.vb" Inherits="Maintenance_TO_TO" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Tour Operators
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
                <asp:Panel ID="Panel1" runat="server">
                    <td class="GridLabelBG" width="620px">
                        <asp:Label ID="lblFilter" runat="server" SkinID="skGridLabel">Search/Filter &nbsp;
                            <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />
                            &nbsp; </asp:Label>
                        <asp:HyperLink ID="btSpeed" runat="server"
                            style="float:right; color: White; padding: 4px; font-weight: bold;"
                            NavigateUrl="TouropSpeedEdit.aspx">
                            Speed Edit
                        </asp:HyperLink>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 620px">
                    <asp:Panel ID="pnSearch" runat="server" CssClass="popupPanel" DefaultButton="Button1">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="GridRow2B" style="width: 120px; text-align: left; font-weight: bold;">
                                    Tour Operator
                                </td>
                                <td class="GridRow2B" style="width: 400px;">
                                    <asp:DropDownList ID="ddlTO" runat="server" CssClass="TextBox" DataSourceID="dsTOSearch"
                                        DataTextField="TourOp" DataValueField="TourOpID" />
                                </td>
                                <td class="GridRow2B" style="width: 100px; text-align: right; padding-top: 5px; height: 30px;">
                                    <asp:Button ID="btnSerch" runat="server" SkinID="skBtnSerach" Style="margin-bottom: 5px;" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Name
                                </td>
                                <td class="GridRow1B" colspan="2">
                                    <asp:TextBox ID="fltName" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="fltNameExt" runat="server" TargetControlID="fltName"
                                        WatermarkCssClass="WaterMark" WatermarkText="TourOperator name (use % as wildchar)" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    City
                                </td>
                                <td class="GridRow1B" colspan="2">
                                    <asp:TextBox ID="fltCity" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="fltCityExt" runat="server" TargetControlID="fltCity"
                                        WatermarkCssClass="WaterMark" WatermarkText="City name (use % as wildchar)" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Country
                                </td>
                                <td class="GridRow1B" colspan="2">
                                    <asp:TextBox ID="fltCountry" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="fltCountryExt" runat="server" TargetControlID="fltCountry"
                                        WatermarkCssClass="WaterMark" WatermarkText="Country name (use % as wildchar)" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Market
                                </td>
                                <td class="GridRow1B" style="width: 400px;" colspan="2">
                                    <asp:DropDownList ID="ddlMarkets" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsMarkets" DataTextField="Market" DataValueField="MarketID">
                                        <asp:ListItem Selected="True" Value="">all markets</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsMarkets" runat="server" OldValuesParameterFormatString="original_{0}"
                                        TypeName="TourOperTableAdapters.MarketTableAdapter" SelectMethod="GetData"></asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Pay Condition
                                </td>
                                <td class="GridRow1B" style="width: 400px;" colspan="2">
                                    <asp:DropDownList ID="ddlPay" runat="server" CssClass="TextBox" DataSourceID="dsPayCond"
                                        DataTextField="PayCond" DataValueField="PayCondID" AppendDataBoundItems="True">
                                        <asp:ListItem Selected="True" Value="">all pay cond.</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsPayCond" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="TourOperTableAdapters.PayCondTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Created
                                </td>
                                <td class="GridRow1B" colspan="2">
                                    <asp:TextBox ID="fltCreated" runat="server" CssClass="TextBox" />
                                    <asp:CompareValidator ID="valCreated" runat="server" ControlToValidate="fltCreated"
                                        Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date" />
                                    <asp:ValidatorCalloutExtender ID="valCreatedExtender" runat="server"
                                        Enabled="True" TargetControlID="valCreated" />
                                    <asp:CalendarExtender ID="calCreated" runat="server" CssClass="cal_Theme1"
                                        Enabled="True" TargetControlID="fltCreated" />
                                    <asp:TextBoxWatermarkExtender ID="fltCreatedWatermark" runat="server" TargetControlID="fltCreated"
                                        WatermarkCssClass="WaterMark" 
                                        WatermarkText="Created from ..." />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear">
                                </td>
                                <td class="GridRowClear">
                                    <asp:CheckBox ID="fltActive" runat="server" Text="Show only active TO" Checked="True"
                                        AutoPostBack="False" />
                                </td>
                                <td class="GridRowClear">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" class="ComandRow2T" style="height: 30px; padding-top: 5px">
                                    <asp:Button ID="Button1" runat="server" SkinID="skBtnFilter" />&nbsp;
                                    <asp:Button ID="Button2" runat="server" SkinID="skBtnClear" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    <asp:ObjectDataSource ID="dsTOSearch" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataForFilter" TypeName="TourOperTableAdapters.TourOpTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
            <asp:ControlParameter ControlID="fltName" Name="TourOp" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="ddlMarkets" Name="MarketID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlPay" Name="PayCondID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="fltCity" Name="City" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="fltCountry" Name="Country" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="fltCreated" Name="Created" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="fltActive" Name="ActiveOnly" PropertyName="Checked"
                Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="Label1" runat="server" Text="Tour Operators" SkinID="skGridLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvTO" runat="server" DataSourceID="dsTOSearch" SkinID="skGridView"
                        DataKeyNames="TourOpID" AllowPaging="True" PageSize="20">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandArgument='<%# Eval("TourOpID") %>'
                                        CommandName="Details" ImageUrl="~/Images/Leads.gif" Text="Button" />
                                </ItemTemplate>
                                <ItemStyle Width="25px" HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="" SortExpression="TourOpID">
                                <ItemTemplate>
                                    (<asp:HyperLink ID="HyperLink1" runat="server" 
                                        NavigateUrl='<%# "TtOoDetail.aspx?TOID=" & Eval("TourOpID") %>' 
                                        Text='<%# Eval("TourOpID") %>' />)
                                </ItemTemplate>
                                <ItemStyle Width="50px" HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="TourOp" HeaderText="Tour Operator" SortExpression="TourOp">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="350px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MarketId" HeaderText="Market" SortExpression="MarketId">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="50px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PayCondId" HeaderText="Pay" SortExpression="PayCondId">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="50px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="200px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="200px" />
                            </asp:BoundField>
                            <asp:CheckBoxField DataField="Active" HeaderText="A" SortExpression="Active">
                                <ItemStyle Width="25px" />
                            </asp:CheckBoxField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td style="text-align: right; padding-top: 5px; height: 30px;">
                    <asp:Button ID="Button4" runat="server" Text="New Tour Operator" SkinID="skBtnBase" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
