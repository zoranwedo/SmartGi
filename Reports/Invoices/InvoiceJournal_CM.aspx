﻿<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" 
    CodeFile="InvoiceJournal_CM.aspx.vb" Inherits="Reports_Invoices_InvoiceJournal_CM"  
	MaintainScrollPositionOnPostback="true"
    enableEventValidation="false" %>

<%@ Register src="~/App_UserControls/HotelExpanderControl.ascx" tagname="HotelExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/TourOpExpanderControl.ascx" tagname="TourOpExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/FromToIntegerControl.ascx" tagname="FromToIntegerControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/FromToDateControl.ascx" tagname="FromToDateControl" tagprefix="uc" %>
<%@ Register src="../../App_UserControls/MessagePop.ascx" tagname="MessagePop" tagprefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Invoice Journal Coop Marketing
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
                <td class="GridBorder" style="width: 600px">
                    <asp:Panel ID="pnSearch" runat="server" DefaultButton="btReport" style="padding-left: 8px;">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="GridRow1B" colspan="2" >
                                    <uc:HotelExpanderControl ID="ctrlHotel" runat="server" 
                                        LabelWidth="120px" ControlWidth="480px" 
                                        CollapsedDefailt="false"
                                        NoCCI="true" />
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
                                <td class="GridRow1B" style="width: 120px;" >Check In</td>
                                <td class="GridRow1B" style="width: 480px;" >
                                    <uc:FromToDateControl ID="ctrlCheckIn" runat="server"
                                        MandatoryFrom="false"
                                        MandatoryTo="false" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 120px;" >Invoice Num</td>
                                <td class="GridRow1B" style="width: 480px;" >
                                    <uc:FromToIntegerControl ID="ctrlInvNum" runat="server"
                                        MandatoryFrom="false"
                                        MandatoryTo="false" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 120px;" >Invoice Date</td>
                                <td class="GridRow1B" style="width: 480px;" >
                                    <uc:FromToDateControl ID="ctrlInvDate" runat="server"
                                        MandatoryFrom="false"
                                        MandatoryTo="false" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" >State</td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlState" runat="server" CssClass="TextBox"
                                        DataSourceID="dsInvState" DataTextField="InvoiceState" DataValueField="InvoiceStateID" 
                                        AppendDataBoundItems="True" >
                                        <asp:ListItem Selected="True" Value="10">all states</asp:ListItem>
                                        <asp:ListItem Value="20">* Hotel States</asp:ListItem>
                                        <asp:ListItem Value="30">* CCI States</asp:ListItem>
                                        <asp:ListItem Value="40">* Not Reviewed by CCI Flag</asp:ListItem>
                                        <asp:ListItem Value="50">* Reviewed by CCI Flag</asp:ListItem>
                                        <asp:ListItem Value="60">* Canceled States</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsInvState" runat="server"
                                        TypeName="dsInvoicesTableAdapters.InvoiceStateTableAdapter" 
                                        SelectMethod="GetData" >
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear" style="height: 28px; padding-top: 5px; text-align: left;" />
                                <td class="GridRowClear" style="height: 28px; padding-top: 5px; text-align: right;">
                                    <asp:Button ID="btReport" runat="server" SkinID="skBtnBase" Text="Report" />&nbsp;
                                    <asp:Button ID="btClear" runat="server" SkinID="skBtnClear" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <uc:MessagePop ID="msgPop" runat="server" Title="Invoice Journal Coop Marketing Report" />
    </div>
    <asp:ObjectDataSource ID="dsJournal" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="dsInvoiceJournalRateTableAdapters.InvoiceJournal_CMTableAdapter">
        <SelectParameters>
            <asp:Parameter DefaultValue="False" Name="HRate" Type="Boolean" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelID" PropertyName="SelectedHotel" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelGroupId" PropertyName="SelectedHotelGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpID" PropertyName="SelectedTourOp" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpGroupId" PropertyName="SelectedTourOpGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="PayCondID" PropertyName="SelectedPayCond" Type="String" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="MarketID" PropertyName="SelectedMarket" Type="String" />
            <asp:ControlParameter ControlID="ddlInvType" Name="InvType" PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter Name="GroupCode" Type="String" />
            <asp:ControlParameter ControlID="ctrlInvNum" Name="InvNumFrom" PropertyName="IntegerFrom" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlInvNum" Name="InvNumTo" PropertyName="IntegerTo" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlCheckIn" Name="ChkInFrom" PropertyName="DateFrom" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlCheckIn" Name="ChkInTo" PropertyName="DateTo" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlInvDate" Name="InvDateFrom" PropertyName="DateFrom" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlInvDate" Name="InvDateTo" PropertyName="DateTo" Type="DateTime" />
            <asp:Parameter Name="State" Type="Int32" />
            <asp:ControlParameter ControlID="ddlState" Name="StateSet" PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter DefaultValue="False" Name="IncludeCancel" Type="Boolean" />
        </SelectParameters>
        </asp:ObjectDataSource>
</asp:Content>

