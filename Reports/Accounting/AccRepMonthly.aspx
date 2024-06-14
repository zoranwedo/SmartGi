<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="AccRepMonthly.aspx.vb" Inherits="Reports_Accounting_AccRepMonthly"  
    EnableEventValidation="false" %>

<%@ Register src="~/App_UserControls/HotelGroupHotelControl.ascx" tagname="HotelGroupHotelControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/TourOpGroupMarketPayCondTourOpControl.ascx" tagname="TourOpGroupMarketPayCondTourOpControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/InputDateControl.ascx" tagname="InputDateControl" tagprefix="uc" %>
<%@ Register src="../../App_UserControls/MessagePop.ascx" tagname="MessagePop" tagprefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Monthly Transactions Accounting
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
                <td class="GridLabelBG" style="width: 600px;">
                    <asp:Panel ID="pnSearchHead" runat="server" Width="100%">
                        <asp:Label ID="lblFilter" runat="server" SkinID="skGridLabel">Search/Filter &nbsp;
                            <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />
                            &nbsp; </asp:Label>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px">
                    <asp:Panel ID="pnSearch" runat="server" DefaultButton="btReport" style="padding-left: 8px;">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="GridRow1B" colspan="2" >
                                    <uc:HotelGroupHotelControl ID="ctrlHotel" runat="server" 
                                        LabelWidth="120px" ControlWidth="480px" 
                                        NoCCI="false" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" colspan="2" >
                                    <uc:TourOpGroupMarketPayCondTourOpControl ID="ctrlTourOp" runat="server" 
                                        LabelWidth="120px" ControlWidth="480px"
                                        NoLocal="true" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 120px;" >From Date</td>
                                <td class="GridRow1B" style="width: 480px;">
                                    <uc:InputDateControl ID="fltFromDate" runat="server" 
                                        DefaultNow="true" Mandatory="true" />
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
                                <td class="GridRowClear">Acc.Type</td>
                                <td class="GridRowClear">
                                    <asp:DropDownList ID="ddlAccType" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsAccType" DataTextField="DisplayType" DataValueField="AccTypeID">
                                        <%--<asp:ListItem Text="all" Value="" />--%>
                                        <asp:ListItem Text="all" Value="" />
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsAccType" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="AgingBalanceTableAdapters.AccTypeTableAdapter" />
                                </td>
                            </tr>
                            <tr>
                                <td class="ComandRow2T" style="text-align: left;">
                                    <asp:CheckBox ID="cbHotel" runat="server" Text="Hotel" />
                                </td>
                                <td class="ComandRow2T" style="height: 30px; padding-top: 5px">
                                    <asp:CheckBox ID="cbCCI" runat="server" Text="Exclude CCI" TextAlign="Left" style="float: left;" />
                                    <asp:CheckBox ID="cbSumary" runat="server" Text="Sumary" TextAlign="Left" />
                                    <asp:CheckBox ID="cbExcel" runat="server" Text="Export to Excel" TextAlign="Left" />
                                    &nbsp;&nbsp;<asp:Button ID="btReport" runat="server" SkinID="skBtnBase" Text="Report" />
                                    &nbsp;&nbsp;<asp:Button ID="btClear" runat="server" SkinID="skBtnClear" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <uc:MessagePop ID="msgPop" runat="server" Title="Monthly Transactions Accounting Report" />
    </div>
    <asp:ObjectDataSource ID="dsAccRepMonthGroup" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="ReportAccountingTableAdapters.AccRepMonthGroupTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelId" PropertyName="SelectedHotel" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelGroupID" PropertyName="SelectedHotelGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpId" PropertyName="SelectedTourOp" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpGroupID" PropertyName="SelectedTourOpGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="MarketID" PropertyName="SelectedMarket" Type="String" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="PayCondID" PropertyName="SelectedPayCond" Type="String" />
            <asp:ControlParameter ControlID="fltDate" Name="AsOffDate" PropertyName="DateValue" Type="DateTime" />
            <asp:ControlParameter ControlID="fltFromDate" Name="PrDate" PropertyName="DateValue" Type="DateTime" />
            <asp:ControlParameter ControlID="ddlAccType" Name="AccTypeID" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
