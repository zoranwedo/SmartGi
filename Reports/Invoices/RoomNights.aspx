<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" 
    CodeFile="RoomNights.aspx.vb" Inherits="Reports_Invoices_RoomNights" 
    enableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Room Nights
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
                    <asp:Panel ID="pnSearch" runat="server" DefaultButton="btReport" Width="600px">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="GridRow1B" style="width: 130px">Hotel Group</td>
                                <td class="GridRow1B" style="width: 470px" colspan="3">
                                    <asp:DropDownList ID="ddlHtlGroup" runat="server" CssClass="TextBox" />
                                    <asp:CascadingDropDown ID="exHtlGroup" runat="server" 
                                        TargetControlID="ddlHtlGroup" Category="HotelGroupID" 
                                        ServicePath="~/HtlGroup.asmx"
                                        ServiceMethod="GetHotelGroups">
                                    </asp:CascadingDropDown>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Hotel</td>
                                <td class="GridRow1B" colspan="3">
                                    <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" />
                                    <asp:CascadingDropDown ID="exHotel" runat="server" 
                                        TargetControlID="ddlHotel" Category="HotelID" 
                                        ServicePath="~/HtlGroup.asmx"
                                        ServiceMethod="GetHotels"
                                        ParentControlID="ddlHtlGroup" >
                                    </asp:CascadingDropDown>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" >Tour&nbsp;Op. Group</td>
                                <td class="GridRow1B" colspan="3" >
                                    <asp:DropDownList ID="ddlToGroup" runat="server" CssClass="TextBox" />
                                    <asp:CascadingDropDown ID="exToGroup" runat="server" 
                                        TargetControlID="ddlToGroup" Category="TourOpGroupID" 
                                        ServicePath="~/TOGroup.asmx"
                                        ServiceMethod="GetTOGroups" >
                                    </asp:CascadingDropDown>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" >Tour&nbsp;Operator</td>
                                <td class="GridRow1B" colspan="3" >
                                    <asp:DropDownList ID="ddlTO" runat="server" CssClass="TextBox" />
                                    <asp:CascadingDropDown ID="exTO" runat="server" 
                                        TargetControlID="ddlTO" Category="TourOpID" 
                                        ServicePath="~/TOGroup.asmx"
                                        ServiceMethod="GetTTOOs"
                                        ParentControlID="ddlToGroup" >
                                    </asp:CascadingDropDown>
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
                                <td class="GridRow1B">
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" >Market</td>
                                <td class="GridRow1B" colspan="3" >
                                    <asp:DropDownList ID="ddlMarkets" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsMarkets" DataTextField="Market" DataValueField="MarketID">
                                        <asp:ListItem Selected="True" Value="">all markets</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsMarkets" runat="server" OldValuesParameterFormatString="original_{0}"
                                        TypeName="TourOperTableAdapters.MarketTableAdapter" SelectMethod="GetData"></asp:ObjectDataSource>
                                </td>
                                <td class="GridRow1B">
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear" >Date From</td>
                                <td class="GridRowClear" >
                                    <asp:TextBox ID="fltInvDateFrom" runat="server" CssClass="TextBox" Width="185px" />
                                    <asp:TextBoxWatermarkExtender ID="fltInvDateFrom_TextBoxWatermarkExtender" 
                                        runat="server" TargetControlID="fltInvDateFrom" WatermarkCssClass="WaterMark" 
                                        WatermarkText="Inv date equals or later than" />
                                    <asp:CalendarExtender ID="fltInvDateFrom_CalendarExtender" runat="server" 
                                        CssClass="cal_Theme1" Enabled="True" TargetControlID="fltInvDateFrom">
                                    </asp:CalendarExtender>
                                    <asp:CompareValidator ID="fltInvDateFrom_CompareValidator" runat="server" 
                                        ControlToValidate="fltInvDateFrom" Display="None" ErrorMessage="Only date input" 
                                        Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="fltInvDateFrom_ValidatorCalloutExtender" 
                                        runat="server" Enabled="True" TargetControlID="fltInvDateFrom_CompareValidator">
                                    </asp:ValidatorCalloutExtender>
                                </td>
                                <td class="GridRowClear" style="padding-left: 40px;">Date To</td>
                                <td class="GridRowClear" >
                                    <asp:TextBox ID="fltInvDateTo" runat="server" CssClass="TextBox" Width="185px" />
                                    <asp:TextBoxWatermarkExtender ID="fltInvDateTo_TextBoxWatermarkExtender" 
                                        runat="server" TargetControlID="fltInvDateTo" WatermarkCssClass="WaterMark" 
                                        WatermarkText="Inv date equals or before than" />
                                    <asp:CalendarExtender ID="fltInvDateTo_CalendarExtender" runat="server" 
                                        CssClass="cal_Theme1" Enabled="True" TargetControlID="fltInvDateTo">
                                    </asp:CalendarExtender>
                                    <asp:CompareValidator ID="fltInvDateTo_CompareValidator" runat="server" 
                                        ControlToValidate="fltInvDateTo" Display="None" ErrorMessage="Only date input" 
                                        Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="fltInvDateTo_ValidatorCalloutExtender" 
                                        runat="server" Enabled="True" TargetControlID="fltInvDateTo_CompareValidator">
                                    </asp:ValidatorCalloutExtender>
                                </td>
                            </tr>
                            <tr>
                                <td class="ComandRow2T" style="text-align: left; vertical-align: middle;">
                                    <asp:CheckBox ID="cbHotel" runat="server" Text="Hotel" TextAlign="Right" Visible="False" />
                                </td> 
                                <td class="ComandRow2T" style="height: 28px; padding-top: 5px; text-align: left;">
                                    <asp:CheckBox ID="cbExcel" runat="server" Text="export to Excel" TextAlign="Right" />
                                </td>
                                <td class="ComandRow2T" style="height: 28px; padding-top: 5px; text-align: right;" colspan="2">
                                    <asp:Button ID="btReport" runat="server" SkinID="skBtnBase" Text="Report" />
                                    &nbsp;<asp:Button ID="btClear" runat="server" SkinID="skBtnClear" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    
                </td>
            </tr>
        </table>
    </div>

    <asp:ObjectDataSource ID="dsRoomNights" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="dsRoomNightsTableAdapters.InvRoomNights_GroupTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlHotel" Name="HotelID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlHtlGroup" Name="HotelGroupID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlTO" Name="TourOpID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlToGroup" Name="TourOpGroupID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlMarkets" Name="MarketID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlPayCond" Name="PayCondID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="fltInvDateFrom" Name="DateFrom" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="fltInvDateTo" Name="DateTo" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>

