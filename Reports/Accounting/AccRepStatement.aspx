<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="AccRepStatement.aspx.vb" Inherits="Reports_Accounting_AccRepStatement"
    enableEventValidation="false" %>

<%@ Register src="~/App_UserControls/HotelExpanderControl.ascx" tagname="HotelExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/TourOpExpanderControl.ascx" tagname="TourOpExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/InputDateControl.ascx" tagname="InputDateControl" tagprefix="uc" %>
<%@ Register src="../../App_UserControls/MessagePop.ascx" tagname="MessagePop" tagprefix="uc" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Account Statement
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
                        <asp:HyperLink ID="btSwitchReport" runat="server"
                            style="float:right; color: White; padding: 4px; font-weight: bold;"
                            NavigateUrl="~/Reports/Accounting/AccRepStatement_Old.aspx">
                            Old Account of Statement
                        </asp:HyperLink>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px">
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
                                <td class="GridRow1B" style="width: 120px;" >From Date</td>
                                <td class="GridRow1B" style="width: 480px;">
                                    <uc:InputDateControl ID="fltFromDate" runat="server" 
                                        DefaultNow="false" Mandatory="false" />
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
                                <td class="GridRow1B">Balance</td>
                                <td class="GridRow1B">
                                    <%--<asp:RadioButtonList ID="ddlOptions" runat="server" >
                                        <asp:ListItem Value="1"  Text="All Pending Balance" Selected="True" />
                                        <asp:ListItem Value="2"  Text="Pending Balance" />
                                        <asp:ListItem Value="3"  Text="Pending Balance without Early Checkout Credits" />
                                        <asp:ListItem Value="6"  Text="Pending Balance with Zero application" />
                                        <asp:ListItem Value="4"  Text="Non Applied" />
                                        <asp:ListItem Value="5"  Text="Non Applied with Early Checkout Credits only" />
                                        <asp:ListItem Value="10" Text="Fully Applied" />
                                        <asp:ListItem Value="0"  Text="All" />
                                    </asp:RadioButtonList>--%>
                                    <asp:DropDownList ID="ddlOptions" runat="server" CssClass="TextBox" >
                                        <asp:ListItem Value="1"  Text="All Pending Balance" Selected="True" />
                                        <asp:ListItem Value="2"  Text="Pending Balance Differences with EC/O" />
                                        <asp:ListItem Value="3"  Text="Pending Balance Difference without EC/O" />
                                        <asp:ListItem Value="6"  Text="Pending Balance with Zero application" />
                                        <asp:ListItem Value="4"  Text="Pending Balance Invoices/Debit Notes Without EC/O" />
                                        <asp:ListItem Value="5"  Text="Pending Balance Invoices/Debit Notes with EC/O" />
                                        <asp:ListItem Value="10" Text="Fully Applied" />
                                        <asp:ListItem Value="0"  Text="All" />
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear">Include Credit</td>
                                <td class="GridRowClear">
                                    <asp:CheckBox ID="cbAR" runat="server" Checked="True" Text="AR" TextAlign="Right" style="margin-right: 7px;" />
                                    <asp:CheckBox ID="cbFL" runat="server" Checked="True" Text="FL" TextAlign="Right" style="margin-right: 7px;" />
                                    <asp:CheckBox ID="cbCC" runat="server" Checked="True" Text="CC" TextAlign="Right" style="margin-right: 7px;" />
                                    <asp:CheckBox ID="cbMC" runat="server" Checked="True" Text="MC" TextAlign="Right" style="margin-right: 7px;" />
                                    <asp:CheckBox ID="cbIC" runat="server" Checked="True" Text="IC" TextAlign="Right" style="margin-right: 7px;" />
                                </td>
                            </tr>
                            <tr>
                                <td class="ComandRow2T" style="text-align: left;">
                                    <asp:CheckBox ID="cbHotel" runat="server" Text="Hotel" />
                                </td>
                                <td class="ComandRow2T" style="text-align: right;">
                                    <asp:CheckBox ID="cbCCI" runat="server" Text="Exclude CCI" TextAlign="Left" style="float: left;" />
                                    <asp:CheckBox ID="cbNoDetails" runat="server" Text="Without Details" TextAlign="Left" style="margin-right: 4px;" />
                                    <asp:CheckBox ID="cbAgBalance" runat="server" Text="Include Aging Balance" TextAlign="Left" style="margin-right: 4px;" />
                                    <asp:CheckBox ID="cbNote" runat="server" Text="Show Notes" TextAlign="Left" style="margin-right: 4px;" />
                                    <%--<br />
                                    <asp:CheckBox ID="cbAR" runat="server" Checked="True" Text="AR" TextAlign="Left" style="margin-left: 7px;" />
                                    <asp:CheckBox ID="cbFL" runat="server" Checked="True" Text="FL" TextAlign="Left" style="margin-left: 7px;" />
                                    <asp:CheckBox ID="cbCC" runat="server" Text="CC" TextAlign="Left" Checked="True" style="margin-left: 7px;" />
                                    <asp:CheckBox ID="cbMC" runat="server" Text="MC" TextAlign="Left" Checked="True" style="margin-left: 7px;" />
                                    <asp:CheckBox ID="cbIC" runat="server" Text="IC" TextAlign="Left" Checked="True" style="margin-left: 7px;" />--%>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear" style="height: 28px; padding-top: 5px; text-align: right;" >
                                    <asp:CheckBox ID="cbExcel" runat="server" Text="export to Excel" TextAlign="Left" />
                                </td>
                                <td class="GridRow1T" style="height: 28px; padding-top: 5px; text-align: right;">
                                    &nbsp;&nbsp;<asp:CheckBox ID="cbGross" runat="server" Text="Gross Billing" TextAlign="Left" />
                                    &nbsp;&nbsp;<asp:Button ID="btReport" runat="server" SkinID="skBtnBase" Text="Report" />
                                    &nbsp;&nbsp;<asp:Button ID="btRptByBooking" runat="server" SkinID="skBtnBase" Text="Report By Booking" />
                                    &nbsp;&nbsp;<asp:Button ID="btClear" runat="server" SkinID="skBtnClear" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <uc:MessagePop ID="msgPop" runat="server" Title="Account Statement Report" />
    </div>
    <br />
    <asp:ObjectDataSource ID="dsCredits" runat="server" OldValuesParameterFormatString="original_{0}"
        TypeName="ReportAccStatementTableAdapters.GetAccCreditBalanceTableAdapter"
        SelectMethod="GetData" >
        <SelectParameters>
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelId" PropertyName="SelectedHotel" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelGroupID" PropertyName="SelectedHotelGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpId" PropertyName="SelectedTourOp" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpGroupID" PropertyName="SelectedTourOpGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="MarketID" PropertyName="SelectedMarket" Type="String" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="PayCondID" PropertyName="SelectedPayCond" Type="String" />
            <asp:ControlParameter ControlID="fltDate" Name="AsOffDate" PropertyName="DateValue" Type="DateTime" />
            <asp:ControlParameter ControlID="cbHotel" Name="HRate" PropertyName="Checked" Type="Boolean" />
            <asp:ControlParameter ControlID="fltFromDate" Name="FromDate" PropertyName="TextValue" Type="DateTime" />
            <asp:ControlParameter ControlID="ddlAccType" Name="AccType" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlInvType" Name="InvType" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="ddlOptions" Name="BalanceStatus" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsAccRepStatment" runat="server" OldValuesParameterFormatString="original_{0}"
        TypeName="ReportAccStatementTableAdapters.AccStatementTableAdapter"
        SelectMethod="GetStatement" >
        <SelectParameters>
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelId" PropertyName="SelectedHotel" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelGroupID" PropertyName="SelectedHotelGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpId" PropertyName="SelectedTourOp" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpGroupID" PropertyName="SelectedTourOpGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="MarketID" PropertyName="SelectedMarket" Type="String" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="PayCondID" PropertyName="SelectedPayCond" Type="String" />
            <asp:ControlParameter ControlID="fltFromDate" Name="FromDate" PropertyName="TextValue" Type="DateTime" />
            <asp:ControlParameter ControlID="fltDate" Name="AsOffDate" PropertyName="DateValue" Type="DateTime" />
            <asp:ControlParameter ControlID="ddlAccType" Name="AccType" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlInvType" Name="InvType" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="ddlOptions" Name="BalanceStatus" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsAccRepStatmentBooking" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetStatement" 
        TypeName="ReportAccStatementTableAdapters.AccRepStatementOfAccBookingTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelId" PropertyName="SelectedHotel" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelGroupID" PropertyName="SelectedHotelGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpId" PropertyName="SelectedTourOp" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpGroupID" PropertyName="SelectedTourOpGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="MarketID" PropertyName="SelectedMarket" Type="String" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="PayCondID" PropertyName="SelectedPayCond" Type="String" />
            <asp:ControlParameter ControlID="fltFromDate" Name="FromDate" PropertyName="TextValue" Type="DateTime" />
            <asp:ControlParameter ControlID="fltDate" Name="AsOffDate" PropertyName="DateValue" Type="DateTime" />
            <asp:ControlParameter ControlID="ddlAccType" Name="AccType" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlInvType" Name="InvType" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="ddlOptions" Name="BalanceStatus" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    <asp:ObjectDataSource ID="dsAccAgedBalance" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="ReportAccountingTableAdapters.AccRepAgingBalanceTableAdapter"> 
        <SelectParameters>
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelId" PropertyName="SelectedHotel" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelGroupID" PropertyName="SelectedHotelGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpId" PropertyName="SelectedTourOp" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpGroupID" PropertyName="SelectedTourOpGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="MarketID" PropertyName="SelectedMarket" Type="String" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="PayCondID" PropertyName="SelectedPayCond" Type="String" />
            <asp:ControlParameter ControlID="fltDate" Name="AsOffDate" PropertyName="DateValue" Type="DateTime" />
            <asp:ControlParameter ControlID="cbAR" Name="AR" PropertyName="Checked" Type="Boolean" />
            <asp:ControlParameter ControlID="cbFL" Name="FL" PropertyName="Checked" Type="Boolean" />
            <asp:ControlParameter ControlID="cbHotel" Name="HRate" PropertyName="Checked" Type="Boolean" />
            <asp:ControlParameter ControlID="ddlAccType" Name="AccType" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlInvType" Name="InvType" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
