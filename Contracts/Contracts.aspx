<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="Contracts.aspx.vb" Inherits="Contracts_Contracts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <span style="font-style: normal">Contracts </span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" runat="Server">
    <div class="Green">
        <asp:CollapsiblePanelExtender ID="cpeSearch" runat="server" 
            TargetControlID="pnSearch"
            CollapseControlID="lblFilter" 
            ExpandControlID="lblFilter" 
            ImageControlID="imgExpander"
            CollapsedImage="~/Images/expand_.png" 
            ExpandedImage="~/Images/collapse_.png"
            Collapsed="False">
        </asp:CollapsiblePanelExtender>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <asp:Panel ID="pnSearchHead" runat="server" Width="600px">
                    <td class="GridLabelBG" style="width: 600px;">
                        <asp:Label ID="lblFilter" runat="server" SkinID="skGridLabel">Search/Filter &nbsp;
                            <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />
                            &nbsp; </asp:Label>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px">
                    <asp:Panel ID="pnSearch" runat="server" CssClass="popupPanel"> <%--CssClass="popupPanel"--%>
                        <asp:Panel ID="pnEditPart" runat="server" Style="width: 600px" DefaultButton="btnSerch">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td class="GridRow2B" style="width: 110px;">
                                        Contract
                                    </td>
                                    <td class="GridRow2B" style="width: 400px">
                                        <asp:TextBox ID="txtContID" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="txtContID"
                                            WatermarkCssClass="WaterMark" WatermarkText="Contract ID" />
                                    </td>
                                    <td class="GridRow2B" style="width: 100px; text-align: right; padding-top: 5px; height: 30px;">
                                        <asp:Button ID="btnSerch" runat="server" SkinID="skBtnSerach" Style="margin-bottom: 5px;" Text="Details" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="pnSearchPart" runat="server" Style="width: 600px" DefaultButton="Button1">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td class="GridRow1B" style="width: 100px; text-align: left;">
                                        Title
                                    </td>
                                    <td class="GridRow1B" style="width: 500px" align="left" colspan="2">
                                        <asp:TextBox ID="fltName" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="fltNameExt" runat="server" TargetControlID="fltName"
                                            WatermarkCssClass="WaterMark" WatermarkText="Contract title (use % as wildchar)" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Market
                                    </td>
                                    <td class="GridRow1B" colspan="2">
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
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Hotel
                                    </td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" DataSourceID="dsUserHotels"
                                            DataTextField="Hotel" DataValueField="HotelID" AppendDataBoundItems="True">
                                            <asp:ListItem Selected="True" Value="">all hotels.</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsUserHotels" runat="server" OldValuesParameterFormatString="original_{0}"
                                            SelectMethod="GetData" TypeName="ContractsTableAdapters.SelectUserHotelTableAdapter">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value"
                                                    Type="String" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" style="width: 110px">
                                        Tour Operator
                                    </td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:DropDownList ID="ddlTO" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                            DataSourceID="dsTO" DataTextField="TourOp" DataValueField="TourOpID">
                                            <asp:ListItem Selected="True" Value="">all Tour Operators</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsTO" runat="server" 
                                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByUser" 
                                            TypeName="TourOperTableAdapters.TourOpTableAdapter">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="hfUsername" Name="User" PropertyName="Value" 
                                                    Type="String" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Rate Code
                                    </td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:TextBox ID="fltRateCode" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="fltRateCode_TextBoxWatermarkExtender" 
                                            runat="server" TargetControlID="fltRateCode" WatermarkCssClass="WaterMark" 
                                            WatermarkText="Rate Code" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Start
                                    </td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:TextBox ID="fltStart" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="wmfltStart" runat="server" TargetControlID="fltStart"
                                            WatermarkCssClass="WaterMark" 
                                            WatermarkText="Contract start date equal or greater than..." />
                                        <asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="fltStart"
                                            Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" 
                                            Type="Date"></asp:CompareValidator>
                                        <asp:ValidatorCalloutExtender ID="CompareValidator7_ValidatorCalloutExtender" runat="server"
                                            Enabled="True" TargetControlID="CompareValidator7">
                                        </asp:ValidatorCalloutExtender>
                                        <asp:CalendarExtender ID="fltStart_CalendarExtender" runat="server" Enabled="True"
                                            TargetControlID="fltStart" CssClass="cal_Theme1">
                                        </asp:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        End
                                    </td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:TextBox ID="fltFinish" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="wmfltFinish" runat="server" 
                                            TargetControlID="fltFinish" WatermarkCssClass="WaterMark" 
                                            WatermarkText="Contract end date equal or less than..." />
                                        <asp:CompareValidator ID="CompareValidator8" runat="server" 
                                            ControlToValidate="fltFinish" Display="None" ErrorMessage="Only date input" 
                                            Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                        <asp:ValidatorCalloutExtender ID="CompareValidator8_ValidatorCalloutExtender" 
                                            runat="server" Enabled="True" TargetControlID="CompareValidator8">
                                        </asp:ValidatorCalloutExtender>
                                        <asp:CalendarExtender ID="fltFinish_CalendarExtender" runat="server" 
                                            CssClass="cal_Theme1" Enabled="True" TargetControlID="fltFinish">
                                        </asp:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear">
                                        State
                                    </td>
                                    <td class="GridRowClear" colspan="2">
                                        <asp:DropDownList ID="ddlState" runat="server" AppendDataBoundItems="True" 
                                            CssClass="TextBox" DataSourceID="dsCntState" DataTextField="ContractState" 
                                            DataValueField="ContractStateID">
                                            <asp:ListItem Selected="True" Value="">all states</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsCntState" runat="server" OldValuesParameterFormatString="original_{0}" 
                                            SelectMethod="GetData" TypeName="ContractsTableAdapters.ContractStateTableAdapter">
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="ComandRow2T" colspan="3" style="height: 30px; padding-top: 5px">
                                        <asp:Button ID="Button1" runat="server" SkinID="skBtnFilter" />
                                        &nbsp;
                                        <asp:Button ID="Button2" runat="server" SkinID="skBtnClear" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div class="Blue">

                <table cellpadding="0" cellspacing="0">
                    <%--<asp:ControlParameter ControlID="fltYear" Name="Year" PropertyName="Text" Type="Int32" />--%>
                            <asp:Panel runat="server" ID="pnlCnt" Visible="false">
                        <tr>
                            <td class="GridLabelBG">
                                <asp:Label ID="lbHotels" runat="server" Text="Contracts" SkinID="skGridLabel"></asp:Label>
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
                                            <ItemStyle HorizontalAlign="Left" Width="25px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="" SortExpression="ContractID">
                                            <ItemTemplate>
                                                (<asp:HyperLink ID="hypID" runat="server" 
                                                    NavigateUrl='<%# "ContractOverview.aspx?ContractID=" & Eval("ContractID") %>' 
                                                    Text='<%# Eval("ContractID") %>' />)
                                            </ItemTemplate>
                                            <ItemStyle Width="50px" HorizontalAlign="Right" />
                                            <HeaderStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Rate Code" SortExpression="RateCodeId">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="hypRateCode" runat="server" 
                                                    NavigateUrl='<%# "ContractOverview.aspx?ContractID=" & Eval("ContractID") %>' 
                                                    Text='<%# Eval("RateCodeId") %>'
                                                    ToolTip='<%# Eval("Description") %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="100px" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Title" SortExpression="Title">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="hypTitle" runat="server" 
                                                    NavigateUrl='<%# "ContractOverview.aspx?ContractID=" & Eval("ContractID") %>' 
                                                    Text='<%# Eval("Title") %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="250px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Hotel" HeaderText="Hotel" SortExpression="Hotel">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle Width="350px" Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="TourOp" HeaderText="Tour Operator" SortExpression="TourOpId">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle Width="350px" Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Start" DataFormatString="{0:d}" HeaderText="Start"
                                            HtmlEncode="False" SortExpression="Start">
                                            <ItemStyle Width="90px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Finish" DataFormatString="{0:d}" HeaderText="End"
                                            HtmlEncode="False" SortExpression="Finish">
                                            <ItemStyle Width="90px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ContractState" HeaderText="State" SortExpression="StateId">
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                    <div style="width:500px">
                                        No contracts found for search criteria. Try change filters.
                                    </div>
                                    </EmptyDataTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:GridView>
                                </asp:Panel>
                                <asp:ObjectDataSource ID="dsFilteredContracts" runat="server" DeleteMethod="Delete"
                                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataForFilter"
                                    TypeName="ContractsTableAdapters.ContractTableAdapter" 
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
                                        <asp:Parameter DefaultValue="False" Name="Template" Type="Boolean" />
                                        <asp:ControlParameter ControlID="ddlMarkets" Name="MarketId" PropertyName="SelectedValue"
                                            Type="String" />
                                        <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue"
                                            Type="Int32" />
                                        <asp:ControlParameter ControlID="ddlTO" Name="TourOpId" PropertyName="SelectedValue"
                                            Type="Int32" />
                                        <asp:ControlParameter ControlID="fltName" Name="Title" PropertyName="Text" Type="String" />
                                        <%--<asp:ControlParameter ControlID="fltYear" Name="Year" PropertyName="Text" Type="Int32" />--%>
                                        <asp:Parameter Name="Year" Type="Int32" />
                                        <asp:ControlParameter ControlID="fltStart" Name="Start" PropertyName="Text" Type="DateTime" />
                                        <asp:ControlParameter ControlID="fltFinish" Name="Finish" PropertyName="Text" Type="DateTime" />
                                        <asp:ControlParameter ControlID="ddlState" Name="StateId" PropertyName="SelectedValue"
                                            Type="Int32" />
                                        <asp:ControlParameter ControlID="fltRateCode" Name="RateCodeID" 
                                            PropertyName="Text" Type="String" />
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
                     </asp:Panel>
                    <tr>
                        <td style="text-align: right; padding-top: 5px; height: 30px;">
                            <asp:Button ID="linkNew" runat="server" Text="New Contract" SkinID="skBtnBase" />
                        </td>
                    </tr>
                </table>
               
           <%-- </ContentTemplate>
        </asp:UpdatePanel>--%>
    </div>
</asp:Content>
