<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" 
    CodeFile="AccAgedBalance.aspx.vb" Inherits="Reports_Accounting_AccAgedBalance"
    enableEventValidation="false" %>

<%@ Register src="~/App_UserControls/HotelExpanderControl.ascx" tagname="HotelExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/TourOpExpanderControl.ascx" tagname="TourOpExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/InputDateControl.ascx" tagname="InputDateControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/MessagePop.ascx" tagname="MessagePop" tagprefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Aged Balance
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
                <td class="GridLabelBG" style="width: 600px;">
                    <asp:Panel ID="pnSearchHead" runat="server" Width="100%">
                        <asp:Label ID="lblFilter" runat="server" SkinID="skGridLabel">Search/Filter &nbsp;
                            <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />
                            &nbsp; </asp:Label>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px;">
                    <asp:Panel ID="pnSearch" runat="server" DefaultButton="btReport" style="padding-left: 8px;">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="GridRow1B" colspan="2" >
                                    <uc:HotelExpanderControl ID="ctrlHotel" runat="server" 
                                        LabelWidth="120px" ControlWidth="480px" 
                                        CollapsedDefailt="false"
                                        NoCCI="false" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" colspan="2" >
                                    <uc:TourOpExpanderControl ID="ctrlTourOp" runat="server" 
                                        LabelWidth="120px" ControlWidth="480px" 
                                        CollapsedDefailt="false"
                                        NoLocal="true" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" valign="top">Account Type</td>
                                <td class="GridRow1B" >
                                    <asp:CheckBoxList ID="ddlAccType" runat="server" 
                                        DataSourceID="dsAccType" DataTextField="DisplayType" DataValueField="AccType" />
                                    <asp:ObjectDataSource ID="dsAccType" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="AgingBalanceTableAdapters.AccTypeTableAdapter" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 120px;" >Inv Type</td>
                                <td class="GridRow1B" style="width: 480px;">
                                    <asp:DropDownList ID="ddlInvType" runat="server" AppendDataBoundItems="True" 
                                        CssClass="TextBox">
                                        <asp:ListItem Selected="True" Value="">all </asp:ListItem>
                                        <asp:ListItem Value="0">Stay</asp:ListItem>
                                        <asp:ListItem Value="1">Group</asp:ListItem>
                                        <asp:ListItem Value="2">Cancel</asp:ListItem>
                                        <asp:ListItem Value="3">No-Show</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 120px;" >As of Date</td>
                                <td class="GridRow1B" style="width: 480px;">
                                    <uc:InputDateControl ID="fltDate" runat="server" 
                                        DefaultNow="true" Mandatory="true" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear">Include Credit</td>
                                <td class="GridRowClear">
                                    <asp:CheckBox ID="cbAR" runat="server" Checked="True" Text="AR" TextAlign="Right" style="margin-right: 7px;" />
                                    <asp:CheckBox ID="cbFL" runat="server" Checked="False" Text="FL" TextAlign="Right" style="margin-right: 7px;" />
                                    <asp:CheckBox ID="cbCC" runat="server" Checked="False" Text="CC" TextAlign="Right" style="margin-right: 7px;" />
                                    <asp:CheckBox ID="cbMC" runat="server" Checked="False" Text="MC" TextAlign="Right" style="margin-right: 7px;" />
                                    <asp:CheckBox ID="cbIC" runat="server" Checked="False" Text="IC" TextAlign="Right" style="margin-right: 7px;" />
                                </td>
                            </tr>
                            <tr>
                                <td class="ComandRow2T" style="text-align: left;">
                                    <asp:CheckBox ID="cbHotel" runat="server" Text="Hotel" TextAlign="Right" />
                                </td>
                                <td class="ComandRow2T">
                                    <asp:CheckBox ID="cbCCI" runat="server" Text="Exclude CCI" TextAlign="Left" style="float: left;" />
                                    <asp:RadioButtonList ID="cbSortL" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                        <asp:ListItem Selected="True" Value="0" Text="Sort By Hotel" />
                                        <asp:ListItem Value="1" Text="Sort By Hotel/TO"/>
                                        <asp:ListItem Value="2" Text="Sort By TO" />
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear" style="height: 28px; padding-top: 5px; text-align: right;">
                                    <asp:CheckBox ID="cbExcel" runat="server" Text="export to Excel" TextAlign="Left" Checked="true" />
                                </td>
                                <td class="GridRow1T" style="height: 28px; padding-top: 5px; text-align: right;">
                                    &nbsp;&nbsp;<asp:Button ID="btReport" runat="server" SkinID="skBtnBase" Text="Report" />
                                    &nbsp;&nbsp;<asp:Button ID="btClear" runat="server" SkinID="skBtnClear" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <uc:MessagePop ID="msgPop" runat="server" Title="Aged Balance Report" />
    </div>
    <asp:ObjectDataSource ID="dsAgedBalance" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="AgingBalanceTableAdapters.GetAccAgingBalanceReportTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelId" PropertyName="SelectedHotel" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelGroupID" PropertyName="SelectedHotelGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpId" PropertyName="SelectedTourOp" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpGroupID" PropertyName="SelectedTourOpGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="MarketID" PropertyName="SelectedMarket" Type="String" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="PayCondID" PropertyName="SelectedPayCond" Type="String" />
            <asp:ControlParameter ControlID="fltDate" Name="AsOffDate" PropertyName="DateValue" Type="DateTime" />
            <asp:ControlParameter ControlID="cbHotel" Name="HRate" PropertyName="Checked" Type="Boolean" />
            <asp:ControlParameter ControlID="ddlAccType" Name="AccType" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlInvType" Name="InvType" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

