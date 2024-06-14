<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="Template.aspx.vb" Inherits="Contracts_Template" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Templates
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" runat="Server">
    <div class="Green">
        <asp:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="server" TargetControlID="pnSearch"
            CollapseControlID="lblFilter" ExpandControlID="lblFilter" ImageControlID="imgExpander"
            CollapsedImage="~/Images/expand_.png" ExpandedImage="~/Images/collapse_.png"
            Collapsed="False">
        </asp:CollapsiblePanelExtender>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <asp:Panel ID="Panel2" runat="server">
                    <td class="GridLabelBG" width="600px">
                        <asp:Label ID="lblFilter" runat="server" SkinID="skGridLabel">Search/Filter &nbsp;
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/collapse_.png" />
                            &nbsp; </asp:Label>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px">
                    <asp:Panel ID="pnSearch" runat="server" Width="600px" CssClass="popupPanel">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="ComandRow2b" style="width: 100px; text-align: left;">
                                    Template ID
                                </td>
                                <td class="ComandRow2b" style="width: 400px" align="left">
                                    <asp:TextBox ID="txtContID" runat="server" CssClass="TextBox"></asp:TextBox>
                                </td>
                                <td class="ComandRow2b" style="width: 100px; text-align: right;">
                                    <asp:Button ID="btnSerch" runat="server" SkinID="skBtnSerach" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 100px">
                                    Title
                                </td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="fltName" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="fltNameExt" runat="server" TargetControlID="fltName"
                                        WatermarkCssClass="WaterMark" WatermarkText="Template title (use % as wildchar)" />
                                </td>
                                <td class="GridRow1B">
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 100px">
                                    Market
                                </td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlMarkets" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsMarkets" DataTextField="Market" DataValueField="MarketID">
                                        <asp:ListItem Selected="True" Value="">all markets</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsMarkets" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="TourOperTableAdapters.MarketTableAdapter"
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
                                <td class="GridRow1B">
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 100px">
                                    Hotel
                                </td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" DataSourceID="dsUserHotels"
                                        DataTextField="Hotel" DataValueField="HotelID" AppendDataBoundItems="True">
                                        <asp:ListItem Selected="True" Value="">all hotels</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsUserHotels" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="ContractsTableAdapters.SelectUserHotelTableAdapter">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value"
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                                <td class="GridRow1B">
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 100px">
                                    Start
                                </td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="fltStart" runat="server" CssClass="TextBox" />
                                    <asp:CalendarExtender ID="fltStart_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="fltStart" CssClass="cal_Theme1">
                                    </asp:CalendarExtender>
                                </td>
                                <td class="GridRow1B">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear" style="width: 100px">
                                    End
                                </td>
                                <td class="GridRowClear">
                                    <asp:TextBox ID="fltFinish" runat="server" CssClass="TextBox" />
                                    <asp:CalendarExtender ID="fltFinish_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="fltFinish" CssClass="cal_Theme1">
                                    </asp:CalendarExtender>
                                </td>
                                <td class="GridRowClear">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" class="ComandRow2T">
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
    <br />
    <div class="Blue">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="GridLabelBG">
                            <asp:Label ID="lbHotels" runat="server" Text="Templates" SkinID="skGridLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder">
                            <asp:Panel ID="Panel1" runat="server" ScrollBars="Vertical" Height="600">
                                <asp:GridView ID="gvContracts" runat="server" DataSourceID="dsFilteredContracts"
                                    DataKeyNames="ContractID" SkinID="skGridView" AutoGenerateColumns="False" GridLines="None">
                                    <RowStyle Wrap="False" />
                                    <Columns>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandArgument='<%# Eval("ContractID") %>'
                                                    CommandName="Details" ImageUrl="~/Images/Leads.gif" />
                                            </ItemTemplate>
                                            <ItemStyle Width="25px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ContractID" Visible="True" HeaderText="(ID)" ReadOnly="True"
                                            SortExpression="ContractID" DataFormatString="({0:F0})">
                                            <ItemStyle Width="50px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle Width="350px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="MarketId" HeaderText="Market" SortExpression="MarketId">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle Width="100px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Hotel" HeaderText="Hotel" SortExpression="Hotel">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle Width="350px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" Visible="False">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Start" DataFormatString="{0:MM/dd/yyyy}" HeaderText="Start"
                                            HtmlEncode="False" SortExpression="Start">
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Finish" DataFormatString="{0:MM/dd/yyyy}" HeaderText="End"
                                            HtmlEncode="False" SortExpression="Finish">
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <div style="width: 500px">
                                            No templates found for search criteria. Try change filters.
                                        </div>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </asp:Panel>
                            <asp:ObjectDataSource ID="dsFilteredContracts" runat="server" DeleteMethod="Delete"
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetTemplates" TypeName="ContractsTableAdapters.ContractTableAdapter"
                                UpdateMethod="Update" InsertMethod="Insert">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_ContractID" Type="Int32" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Template" Type="Boolean" />
                                    <asp:Parameter Name="HotelId" Type="Int32" />
                                    <asp:Parameter Name="MarketId" Type="String" />
                                    <asp:Parameter Name="Start" Type="DateTime" />
                                    <asp:Parameter Name="Finish" Type="DateTime" />
                                    <asp:Parameter Name="Commision" Type="Decimal" />
                                    <asp:Parameter Name="Title" Type="String" />
                                    <asp:Parameter Name="Year" Type="Int16" />
                                    <asp:Parameter Name="Description" Type="String" />
                                    <asp:Parameter Name="StateId" Type="Int32" />
                                    <asp:Parameter Name="CopyId" Type="Int32" />
                                    <asp:Parameter Name="TourOpId" Type="Int32" />
                                    <asp:Parameter Name="Original_ContractID" Type="Int32" />
                                </UpdateParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value"
                                        Type="String" />
                                    <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue"
                                        Type="Int32" />
                                    <asp:ControlParameter ControlID="ddlMarkets" Name="MarketId" PropertyName="SelectedValue"
                                        Type="String" />
                                    <asp:ControlParameter ControlID="fltStart" Name="Start" PropertyName="Text" Type="DateTime" />
                                    <asp:ControlParameter ControlID="fltFinish" Name="Finish" PropertyName="Text" Type="DateTime" />
                                    <asp:ControlParameter ControlID="fltName" Name="Title" PropertyName="Text" Type="String" />
                                    <%--<asp:ControlParameter ControlID="fltYear" Name="Year" PropertyName="Text" Type="Int16" />--%>
                                    <asp:Parameter Name="Year" Type="Int16" />
                                </SelectParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="Template" Type="Boolean" />
                                    <asp:Parameter Name="HotelId" Type="Int32" />
                                    <asp:Parameter Name="MarketId" Type="String" />
                                    <asp:Parameter Name="Start" Type="DateTime" />
                                    <asp:Parameter Name="Finish" Type="DateTime" />
                                    <asp:Parameter Name="Commision" Type="Decimal" />
                                    <asp:Parameter Name="Title" Type="String" />
                                    <asp:Parameter Name="Year" Type="Int16" />
                                    <asp:Parameter Name="Description" Type="String" />
                                    <asp:Parameter Name="StateId" Type="Int32" />
                                    <asp:Parameter Name="CopyId" Type="Int32" />
                                    <asp:Parameter Name="TourOpId" Type="Int32" />
                                    <asp:Parameter Direction="InputOutput" Name="NewID" Type="Int32" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; padding-top: 5px; height: 30px;">
                            <asp:Button ID="linkNew" runat="server" Text="New Template" CssClass="Button" SkinID="skBtnBase" />
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
