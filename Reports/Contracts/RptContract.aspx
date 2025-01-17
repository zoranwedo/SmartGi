﻿<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" CodeFile="RptContract.aspx.vb" Inherits="Reports_Contracts_RptContract" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Contract Report
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
                            <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />
                            &nbsp; </asp:Label>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px">
                    <asp:Panel ID="pnSearch" runat="server">
                        <asp:Panel ID="pnSearchPart" runat="server" Style="width: 600px" DefaultButton="linkReport">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td class="GridRow1B" style="width: 100px;">
                                        Hotel
                                    </td>
                                    <td class="GridRow1B" style="width: 500px" colspan="2">
                                        <asp:DropDownList ID="ddlHotel" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                            DataSourceID="dsUserHotels" DataTextField="Hotel" DataValueField="HotelID">
                                            <asp:ListItem Selected="True" Value="">all hotels.</asp:ListItem>
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
                                    <td class="GridRow1B">
                                        Tour Operator
                                    </td>
                                    <td class="GridRow1B" colspan="2">
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
                                    <td class="GridRow1B">
                                        Title
                                    </td>
                                    <td class="GridRow1B" colspan="2">
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
                                        <asp:ObjectDataSource ID="dsMarkets" runat="server" 
                                            TypeName="TourOperTableAdapters.MarketTableAdapter"
                                            SelectMethod="GetData">
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Rate Type
                                    </td>
                                    <td class="GridRow1B" colspan="2" >
                                        <asp:CheckBoxList ID="cblRateType" runat="server" RepeatDirection="Horizontal" >
                                            <asp:ListItem Selected="True" Value="3">Contract&nbsp;&nbsp;</asp:ListItem>
                                            <asp:ListItem Selected="True" Value="2">EBB&nbsp;&nbsp;</asp:ListItem>
                                            <asp:ListItem Selected="True" Value="1">Special</asp:ListItem>
                                            <asp:ListItem Selected="True" Value="9">Supplement</asp:ListItem>
                                        </asp:CheckBoxList> 
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Rate Code
                                    </td>
                                    <td class="GridRow1B"  colspan="2">
                                        <asp:TextBox ID="fltRate" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="fltRate"
                                            WatermarkCssClass="WaterMark" 
                                            WatermarkText="Rate code (use % as wildchar)" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Start
                                    </td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="fltStart"
                                            Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                        <asp:ValidatorCalloutExtender ID="CompareValidator7_ValidatorCalloutExtender" runat="server"
                                            Enabled="True" TargetControlID="CompareValidator7">
                                        </asp:ValidatorCalloutExtender>
                                        <asp:TextBox ID="fltStart" runat="server" CssClass="TextBox" />
                                        <asp:CalendarExtender ID="fltStart_CalendarExtender" runat="server" CssClass="cal_Theme1"
                                            Enabled="True" TargetControlID="fltStart">
                                        </asp:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        End
                                    </td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:CompareValidator ID="CompareValidator8" runat="server" ControlToValidate="fltFinish"
                                            Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                        <asp:ValidatorCalloutExtender ID="CompareValidator8_ValidatorCalloutExtender" runat="server"
                                            Enabled="True" TargetControlID="CompareValidator8">
                                        </asp:ValidatorCalloutExtender>
                                        <asp:TextBox ID="fltFinish" runat="server" CssClass="TextBox" />
                                        <asp:CalendarExtender ID="fltFinish_CalendarExtender" runat="server" CssClass="cal_Theme1"
                                            Enabled="True" TargetControlID="fltFinish">
                                        </asp:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Booking Start
                                    </td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:CompareValidator ID="CompareValidator14" runat="server" ControlToValidate="fltBkStart"
                                            Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender14" runat="server" Enabled="True"
                                            TargetControlID="CompareValidator14">
                                        </asp:ValidatorCalloutExtender>
                                        <asp:TextBox ID="fltBkStart" runat="server" CssClass="TextBox" />
                                        <asp:CalendarExtender ID="CalendarExtender14" runat="server" CssClass="cal_Theme1"
                                            Enabled="True" TargetControlID="fltBkStart">
                                        </asp:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Booking End
                                    </td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:CompareValidator ID="CompareValidator15" runat="server" ControlToValidate="fltBkEnd"
                                            Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender15" runat="server" Enabled="True"
                                            TargetControlID="CompareValidator15">
                                        </asp:ValidatorCalloutExtender>
                                        <asp:TextBox ID="fltBkEnd" runat="server" CssClass="TextBox" />
                                        <asp:CalendarExtender ID="CalendarExtender15" runat="server" CssClass="cal_Theme1" Enabled="True"
                                            TargetControlID="fltBkEnd">
                                        </asp:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear">
                                        Rate Received
                                    </td>
                                    <td class="GridRowClear" colspan="2">
                                        <asp:RadioButtonList ID="rblRecieved" runat="server" RepeatDirection="Horizontal" >
                                            <asp:ListItem Selected="True" Value="0">All&nbsp;&nbsp;</asp:ListItem>
                                            <asp:ListItem Value="1">Received Date &gt; Start Date&nbsp;&nbsp;</asp:ListItem>
                                            <asp:ListItem Value="2">Creation Date &gt; Received Date&nbsp;&nbsp;</asp:ListItem>
                                        </asp:RadioButtonList> 
                                    </td>
                                </tr>
                                <tr>
                                    <td class="ComandRow2T" colspan="2" style="text-align: left; width: 200px;">
                                        <asp:CheckBox ID="cbComments" runat="server" Text="Include comments" TextAlign="Right" Checked="true" />
                                        <br />
                                        <asp:CheckBox ID="cbInactive" runat="server" Text="Include inactive contracts" TextAlign="Right" />
                                    </td>
                                    <td class="ComandRow2T" style="padding-right: 5px; width: 400px;">
                                        <asp:CheckBox ID="cbPDF" runat="server" Text="export to PDF" TextAlign="Left" />
                                        &nbsp;&nbsp;
                                        <asp:Button ID="linkReport" runat="server" SkinID="skBtnBase" Text="Report" />
                                        &nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btClear" runat="server" SkinID="skBtnClear" />
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
        
        <asp:ObjectDataSource ID="dsFilteredContracts" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" 
            TypeName="CntReportsTableAdapters.FilterContractsTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
                <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlTO" Name="TourOpId" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlMarkets" Name="MarketId" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="fltName" Name="Title" PropertyName="Text" Type="String" />
                <asp:Parameter Name="RateType" Type="Int32" />
                <asp:Parameter Name="RateTypeId" Type="String" />
                <asp:ControlParameter ControlID="fltRate" Name="RateCodeId" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="fltStart" Name="Start" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="fltFinish" PropertyName="Text" Name="Finish" Type="String" />
                <asp:ControlParameter ControlID="fltBkStart" Name="BkStart" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="fltBkEnd" Name="BkFinish" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="rblRecieved" Name="RateRecieved" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="cbInactive" Name="InclInactive" PropertyName="Checked" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        
        <asp:ObjectDataSource ID="dsFilteredContractsComm" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" 
            TypeName="CntReportsTableAdapters.FilterContractsCommTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
                <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlTO" Name="TourOpId" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlMarkets" Name="MarketId" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="fltName" Name="Title" PropertyName="Text" Type="String" />
                <asp:Parameter Name="RateType" Type="Int32" />
                <asp:Parameter Name="RateTypeId" Type="String" />
                <asp:ControlParameter ControlID="fltRate" Name="RateCodeId" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="fltStart" Name="Start" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="fltFinish" PropertyName="Text" Name="Finish" Type="String" />
                <asp:ControlParameter ControlID="fltBkStart" Name="BkStart" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="fltBkEnd" Name="BkFinish" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="rblRecieved" Name="RateRecieved" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="cbInactive" Name="InclInactive" PropertyName="Checked" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>

