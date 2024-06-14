<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" 
    CodeFile="RptContractLead.aspx.vb" Inherits="Reports_Contracts_RptContractLead" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server" >
    Contract Report with Lead Category 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" Runat="Server">
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
                            <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />&nbsp; </asp:Label>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px">
                    <asp:Panel ID="pnSearch" runat="server">
                        <asp:Panel ID="pnSearchPart" runat="server" Style="width: 600px" DefaultButton="linkReport">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td class="GridRow1B" style="width: 100px;">Hotel</td>
                                    <td class="GridRow1B" style="width: 500px" colspan="3">
                                        <asp:DropDownList ID="ddlHotel" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                            DataSourceID="dsUserHotels" DataTextField="Hotel" DataValueField="HotelID">
                                            <asp:ListItem Selected="True" Value="">all hotels</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsUserHotels" runat="server" 
                                            TypeName="ContractsTableAdapters.SelectUserHotelTableAdapter"
                                            SelectMethod="GetData">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Hotel Group</td>
                                    <td class="GridRow1B" colspan="3">
                                        <asp:DropDownList ID="ddlHotelGroup" runat="server" CssClass="TextBox" DataSourceID="dsHotelGroup"
                                            DataTextField="HotelGroup" DataValueField="HotelGroupID" AppendDataBoundItems="True">
                                            <asp:ListItem Value="">all</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsHotelGroup" runat="server" 
                                            TypeName="dsGroupsTableAdapters.HotelGroupTableAdapter"
                                            SelectMethod="GetData">
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Tour Operator</td>
                                    <td class="GridRow1B" colspan="3">
                                        <asp:DropDownList ID="ddlTO" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                            DataSourceID="dsTO" DataTextField="TourOp" DataValueField="TourOpID">
                                            <asp:ListItem Selected="True" Value="">all tour operators</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsTO" runat="server" 
                                            TypeName="TourOperTableAdapters.TourOpTableAdapter"
                                            SelectMethod="GetDataByUser">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="hfUsername" Name="User" PropertyName="Value" Type="String" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Tour&nbsp;Op. Group</td>
                                    <td class="GridRow1B" colspan="3">
                                        <asp:DropDownList ID="ddlTOGroup" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                            DataSourceID="dsTOGroup" DataTextField="TourOpGroup" DataValueField="TourOpGroupID">
                                            <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsTOGroup" runat="server" OldValuesParameterFormatString="original_{0}"
                                            SelectMethod="GetData" TypeName="dsGroupsTableAdapters.TourOpGroupTableAdapter">
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Market</td>
                                    <td class="GridRow1B" colspan="3">
                                        <asp:DropDownList ID="ddlMarkets" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                            DataSourceID="dsMarkets" DataTextField="Market" DataValueField="MarketID">
                                            <asp:ListItem Selected="True" Value="">all markets</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsMarkets" runat="server" 
                                            TypeName="TourOperTableAdapters.MarketTableAdapter"
                                            SelectMethod="GetData">
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" >Pay Condition</td>
                                    <td class="GridRow1B" colspan="3" >
                                        <asp:DropDownList ID="ddlPayCond" runat="server" AppendDataBoundItems="True" 
                                            CssClass="TextBox" DataSourceID="dsPayCond" DataTextField="PayCond" 
                                            DataValueField="PayCondID">
                                            <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsPayCond" runat="server" OldValuesParameterFormatString="original_{0}"
                                            SelectMethod="GetData" 
                                            TypeName="TourOperTableAdapters.PayCondTableAdapter">
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <%--
                                <tr>
                                    <td class="GridRow1B">Rate</td>
                                    <td class="GridRow1B"  colspan="3">
                                        <asp:TextBox ID="fltRate" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="fltRate"
                                            WatermarkCssClass="WaterMark" 
                                            WatermarkText="Rate code (use % as wildchar)" />
                                    </td>
                                </tr>
                                --%>
                                <tr>
                                    <td class="GridRow1B">Rate</td>
                                    <td class="GridRow1B"  colspan="2" style="padding-right: 7px;" >
                                        <asp:UpdatePanel ID="upRates" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:TextBox ID="fltRates" runat="server" CssClass="TextBox" Width="100%" />
                                                <asp:PopupControlExtender ID="extRates" runat="server" CommitProperty="Text" PopupControlID="pnlRates"
                                                    Position="Bottom" TargetControlID="fltRates">
                                                </asp:PopupControlExtender>
                                                <asp:Panel ID="pnlRates" runat="server" BackColor="White" 
                                                    BorderStyle="solid" BorderWidth="1px"
                                                    ScrollBars="Auto" Height="400px" Width="440px">
                                                    <asp:CheckBoxList ID="cblRates" runat="server" DataSourceID="dsRates" 
                                                        DataTextField="RateTypeID" DataValueField="RateTypeID" />
                                                </asp:Panel>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btnCloseCBL" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                        <asp:ObjectDataSource ID="dsRates" runat="server" 
                                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetBasicData" 
                                            TypeName="dsMaintBasicTableAdapters.RateTypeTableAdapter" />
                                    </td>
                                    <td class="GridRow1B" style="width: 28px;" >
                                        <asp:ImageButton ID="btnCloseCBL" runat="server" ImageUrl="~/Images/Collapse.gif" 
                                            BorderStyle="Dotted" BorderWidth="1px" BackColor="Control" CausesValidation="false" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Start</td>
                                    <td class="GridRow1B" colspan="3">
                                        <asp:TextBox ID="fltStart" runat="server" CssClass="TextBox" />
                                        <asp:CalendarExtender ID="fltStart_CalendarExtender" runat="server" CssClass="cal_Theme1" Enabled="True" TargetControlID="fltStart"/>
                                        <asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="fltStart" Display="None" ErrorMessage="Not a valid date!" Operator="DataTypeCheck" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="CompareValidator7_ValidatorCalloutExtender" runat="server" Enabled="True" TargetControlID="CompareValidator7" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required field!" ControlToValidate="fltStart" Display="None" />
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" Enabled="True" TargetControlID="RequiredFieldValidator1"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">End</td>
                                    <td class="GridRow1B" colspan="3">
                                        <asp:TextBox ID="fltFinish" runat="server" CssClass="TextBox" />
                                        <asp:CalendarExtender ID="fltFinish_CalendarExtender" runat="server" CssClass="cal_Theme1" Enabled="True" TargetControlID="fltFinish" />
                                        <asp:CompareValidator ID="CompareValidator8" runat="server" ControlToValidate="fltFinish" Display="None" ErrorMessage="Not a valid date!" Operator="DataTypeCheck" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="CompareValidator8_ValidatorCalloutExtender" runat="server" Enabled="True" TargetControlID="CompareValidator8" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required field!" ControlToValidate="fltFinish" Display="None" />
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" Enabled="True" TargetControlID="RequiredFieldValidator2" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Booking Start</td>
                                    <td class="GridRow1B" colspan="3">
                                        <asp:TextBox ID="fltBkStart" runat="server" CssClass="TextBox" />
                                        <asp:CalendarExtender ID="CalendarExtender14" runat="server" CssClass="cal_Theme1" Enabled="True" TargetControlID="fltBkStart" />
                                        <asp:CompareValidator ID="CompareValidator14" runat="server" ControlToValidate="fltBkStart" Display="None" ErrorMessage="Not a valid date!" Operator="DataTypeCheck" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender14" runat="server" Enabled="True" TargetControlID="CompareValidator14" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Booking End</td>
                                    <td class="GridRow1B" colspan="3">
                                        <asp:TextBox ID="fltBkEnd" runat="server" CssClass="TextBox" />
                                        <asp:CalendarExtender ID="CalendarExtender15" runat="server" CssClass="cal_Theme1" Enabled="True" TargetControlID="fltBkEnd" />
                                        <asp:CompareValidator ID="CompareValidator15" runat="server" ControlToValidate="fltBkEnd" Display="None" ErrorMessage="Not a valid date!" Operator="DataTypeCheck" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender15" runat="server" Enabled="True" TargetControlID="CompareValidator15" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear"/>
                                    <td class="GridRowClear" colspan="3">
                                        <asp:CheckBox ID="cbComments" runat="server" Text="Include comments" TextAlign="Right" />&nbsp;
                                        <asp:CheckBox ID="cbRecieved" runat="server" Text="Include Recieved/Created" TextAlign="Right" />&nbsp;
                                        <asp:CheckBox ID="cbRateType" runat="server" Text="Include Rate Type" TextAlign="Right" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="ComandRow2T" colspan="2" style="text-align: left; width: 200px;">
                                        <asp:CheckBox ID="cbHotel" runat="server" Text="Hotel" TextAlign="Right" />
                                    </td>
                                    <td class="ComandRow2T" colspan="2" style="padding-right: 5px; width: 400px;">
                                        <asp:CheckBox ID="cbExcel" runat="server" Text="export to Excel" TextAlign="Left" Checked="true" />
                                        &nbsp;&nbsp;
                                        <asp:Button ID="linkReport" runat="server" SkinID="skBtnBase" Text="Report" />
                                        &nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btClear" runat="server" SkinID="skBtnClear" CausesValidation="false" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <br />
    </div>
    <div class="Blue">
        
        <asp:ObjectDataSource ID="dsContractsLead" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" 
            TypeName="CntReportsTableAdapters.FilterContractLeadReportTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
                <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlHotelGroup" Name="HotelGroupId" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlTO" Name="TourOpId" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlTOGroup" Name="TourOpGroupId" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlMarkets" Name="MarketId" PropertyName="SelectedValue" Type="String" />
                <asp:Parameter Name="PayCondId" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="RateCodeId" Type="String" />
                <asp:ControlParameter ControlID="fltStart" Name="Start" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="fltFinish" PropertyName="Text" Name="Finish" Type="DateTime" />
                <asp:ControlParameter ControlID="fltBkStart" Name="BkStart" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="fltBkEnd" Name="BkFinish" PropertyName="Text" Type="DateTime" />
                <asp:Parameter Name="RateTypeId" Type="String" />
                <asp:ControlParameter ControlID="cbHotel" Name="HRate" PropertyName="Checked" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>

