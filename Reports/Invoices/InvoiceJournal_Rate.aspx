<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" 
	CodeFile="InvoiceJournal_Rate.aspx.vb" Inherits="Reports_Invoices_InvoiceJournal_Rate" 
	MaintainScrollPositionOnPostback="true"
    enableEventValidation="false" %>

<%@ Register src="~/App_UserControls/HotelExpanderControl.ascx" tagname="HotelExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/TourOpExpanderControl.ascx" tagname="TourOpExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/FromToIntegerControl.ascx" tagname="FromToIntegerControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/FromToDateControl.ascx" tagname="FromToDateControl" tagprefix="uc" %>
<%@ Register src="../../App_UserControls/MessagePop.ascx" tagname="MessagePop" tagprefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Invoice Journal Rates
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
                    <asp:Panel ID="pnSearch" runat="server" DefaultButton="btReport" style="padding-left: 8px;">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="GridRow1B" colspan="4" >
                                    <uc:HotelExpanderControl ID="ctrlHotel" runat="server" 
                                        LabelWidth="120px" ControlWidth="480px" 
                                        CollapsedDefailt="false"
                                        NoCCI="true" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" colspan="4" >
                                    <uc:TourOpExpanderControl ID="ctrlTourOp" runat="server" 
                                        LabelWidth="120px" ControlWidth="480px"
                                        CollapsedDefailt="false"
                                        NoLocal="true" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 120px;" >Inv Type</td>
                                <td class="GridRow1B" style="width: 480px;" colspan="3">
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
                                <td class="GridRow1B" >Rate</td>
                                <td class="GridRow1B" colspan="3">
                                    <asp:TextBox ID="fltRate" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="fltRate_TextBoxWatermarkExtender" 
                                        runat="server" TargetControlID="fltRate" WatermarkCssClass="WaterMark" 
                                        WatermarkText="Charged Rate" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 120px;" >Check In</td>
                                <td class="GridRow1B" style="width: 480px;" colspan="3" >
                                    <uc:FromToDateControl ID="ctrlCheckIn" runat="server"
                                        MandatoryFrom="false"
                                        MandatoryTo="false" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 120px;" >Invoice Num</td>
                                <td class="GridRow1B" style="width: 480px;" colspan="3" >
                                    <uc:FromToIntegerControl ID="ctrlInvNum" runat="server"
                                        MandatoryFrom="false"
                                        MandatoryTo="false" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 120px;" >Invoice Date</td>
                                <td class="GridRow1B" style="width: 480px;" colspan="3" >
                                    <uc:FromToDateControl ID="ctrlInvDate" runat="server"
                                        MandatoryFrom="false"
                                        MandatoryTo="false" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear" >State</td>
                                <td class="GridRowClear">
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
                                <td class="GridRowClear" style="padding-left: 40px;">Document</td>
                                <td class="GridRowClear" >
                                    <asp:DropDownList ID="ddlInv" runat="server" CssClass="TextBox" >
                                        <asp:ListItem Value="INV">Invoice</asp:ListItem>
                                        <asp:ListItem Value="PRO">Proforma</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="ComandRow2T" style="text-align: left; vertical-align: middle;">
                                    <asp:CheckBox ID="cbHotel" runat="server" Text="Hotel" TextAlign="Right" Visible="False" />
                                </td> 
                                <td class="ComandRow2T" colspan="3" >
                                    <asp:RadioButton ID="rbStay" runat="server" Text="By Stay Details" GroupName="rptType" Checked="true" />
                                    <asp:RadioButton ID="rbBilling" runat="server" Text="By Billing Details" GroupName="rptType" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear" style="height: 28px; padding-top: 5px; text-align: left;" />
                                <td class="GridRow1T" style="height: 28px; padding-top: 5px; text-align: left;" colspan="2">
                                    <asp:Button ID="btRecapShow" runat="server" SkinID="skBtnClear" Text="Show Recap" />
                                    <asp:CheckBox ID="cbCancel" runat="server" Text="Incl.cancel" TextAlign="Left" Visible="false" />
                                </td>
                                <td class="GridRow1T" style="height: 28px; padding-top: 5px; text-align: right;">
                                    <asp:Button ID="btReport" runat="server" SkinID="skBtnBase" Text="Report" />&nbsp;
                                    <asp:Button ID="btRecap" runat="server" SkinID="skBtnClear" Text="Recap" />&nbsp;
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
    
    <div class="Blue">
        <br />
        <asp:Panel ID="pnlRecap" runat="server" CssClass="GridBorder" Width="880px" Visible="False" >
            <asp:Button ID="btRecapNC" runat="server" Text="Print" SkinID="skBtnBase" Width="80px" />
            <asp:HiddenField ID="hfHotel" runat="server" Value=0 />
            <asp:GridView ID="gvRecap" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="dsRecap1" SkinID="skGridView" >
                <Columns>
                    <asp:BoundField DataField="Hotel" HeaderText="Hotel">
                        <ItemStyle Width="100px" />
                    </asp:BoundField>
                    <asp:TemplateField>
                        <ItemStyle />
                    </asp:TemplateField>
                    <asp:BoundField DataField="TourOp" HeaderText="Tour Operator">
                        <ItemStyle Width="350px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="RateAmount" DataFormatString="{0:N2}" HeaderText="Rate" ReadOnly="True" >
                        <ItemStyle HorizontalAlign="Right" Width="80px" />
                        <HeaderStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SuppAmount" DataFormatString="{0:N2}" HeaderText="Supplement" ReadOnly="True" >
                        <ItemStyle HorizontalAlign="Right" Width="80px" />
                        <HeaderStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="NC_CO_OI" DataFormatString="{0:N2}" HeaderText="Override NC_CO_OI" ReadOnly="True" >
                        <ItemStyle HorizontalAlign="Right" Width="80px" />
                        <HeaderStyle HorizontalAlign="Right" Wrap="true" />
                    </asp:BoundField>
                    <asp:BoundField DataField="NC_AR_CM" DataFormatString="{0:N2}" HeaderText="CM NC_AR_CM" ReadOnly="True" >
                        <ItemStyle HorizontalAlign="Right" Width="80px" />
                        <HeaderStyle HorizontalAlign="Right" Wrap="true" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ncNetAmount" DataFormatString="{0:N2}" HeaderText="Net Amount" ReadOnly="True" >
                        <ItemStyle HorizontalAlign="Right" Width="80px" />
                        <HeaderStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                </Columns>
                <RowStyle CssClass="GridRow1T" />
            </asp:GridView>
        </asp:Panel>
    </div>

    <asp:ObjectDataSource ID="dsRecap1" runat="server" SelectMethod="GetDataByHotel" 
        TypeName="dsInvoiceJournalRateTableAdapters.InvoiceJournal_Rate_RecapNCTableAdapter" 
        OldValuesParameterFormatString="original_{0}">
        <SelectParameters>
            <asp:ControlParameter ControlID="cbHotel" Name="HRate" PropertyName="Checked" Type="Boolean" />
            <asp:ControlParameter ControlID="ddlInv" Name="InvDoc" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelID" PropertyName="SelectedHotel" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelGroupId" PropertyName="SelectedHotelGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpID" PropertyName="SelectedTourOp" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpGroupId" PropertyName="SelectedTourOpGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="PayCondID" PropertyName="SelectedPayCond" Type="String" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="MarketID" PropertyName="SelectedMarket" Type="String" />
            <asp:ControlParameter ControlID="ddlInvType" DefaultValue="" Name="InvType" PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter Name="GroupCode" Type="String" />
            <asp:ControlParameter ControlID="ctrlInvNum" Name="InvNumFrom" PropertyName="IntegerFrom" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlInvNum" Name="InvNumTo" PropertyName="IntegerTo" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlCheckIn" Name="ChkInFrom" PropertyName="DateFrom" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlCheckIn" Name="ChkInTo" PropertyName="DateTo" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlInvDate" Name="InvDateFrom" PropertyName="DateFrom" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlInvDate" Name="InvDateTo" PropertyName="DateTo" Type="DateTime" />
            <asp:ControlParameter ControlID="fltRate" Name="RateCode" PropertyName="Text" Type="String" />
            <asp:Parameter Name="State" Type="Int32" />
            <asp:ControlParameter ControlID="ddlState" Name="StateSet" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="cbCancel" Name="IncludeCancel" PropertyName="Checked" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsRecapNC" runat="server" SelectMethod="GetDataByHotelPrint" 
        TypeName="dsInvoiceJournalRateTableAdapters.InvoiceJournal_Rate_RecapNCTableAdapter" 
        OldValuesParameterFormatString="original_{0}">
        <SelectParameters>
            <asp:ControlParameter ControlID="cbHotel" Name="HRate" PropertyName="Checked" Type="Boolean" />
            <asp:ControlParameter ControlID="ddlInv" Name="InvDoc" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelID" PropertyName="SelectedHotel" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelGroupId" PropertyName="SelectedHotelGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpID" PropertyName="SelectedTourOp" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpGroupId" PropertyName="SelectedTourOpGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="PayCondID" PropertyName="SelectedPayCond" Type="String" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="MarketID" PropertyName="SelectedMarket" Type="String" />
            <asp:ControlParameter ControlID="ddlInvType" DefaultValue="" Name="InvType" PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter Name="GroupCode" Type="String" />
            <asp:ControlParameter ControlID="ctrlInvNum" Name="InvNumFrom" PropertyName="IntegerFrom" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlInvNum" Name="InvNumTo" PropertyName="IntegerTo" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlCheckIn" Name="ChkInFrom" PropertyName="DateFrom" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlCheckIn" Name="ChkInTo" PropertyName="DateTo" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlInvDate" Name="InvDateFrom" PropertyName="DateFrom" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlInvDate" Name="InvDateTo" PropertyName="DateTo" Type="DateTime" />
            <asp:ControlParameter ControlID="fltRate" Name="RateCode" PropertyName="Text" Type="String" />
            <asp:Parameter Name="State" Type="Int32" />
            <asp:ControlParameter ControlID="ddlState" Name="StateSet" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="cbCancel" Name="IncludeCancel" PropertyName="Checked" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsRcap1Det" runat="server" SelectMethod="GetData" 
        TypeName="dsInvoiceJournalRateTableAdapters.InvoiceJournal_Rate_Recap1_DETTableAdapter" 
        OldValuesParameterFormatString="original_{0}">
        <SelectParameters>
            <asp:ControlParameter ControlID="cbHotel" Name="HRate" PropertyName="Checked" Type="Boolean" />
            <asp:ControlParameter ControlID="ddlInv" Name="InvDoc" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelID" PropertyName="SelectedHotel" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelGroupId" PropertyName="SelectedHotelGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpID" PropertyName="SelectedTourOp" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpGroupId" PropertyName="SelectedTourOpGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="PayCondID" PropertyName="SelectedPayCond" Type="String" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="MarketID" PropertyName="SelectedMarket" Type="String" />
            <asp:ControlParameter ControlID="ddlInvType" DefaultValue="" Name="InvType" PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter Name="GroupCode" Type="String" />
            <asp:ControlParameter ControlID="ctrlInvNum" Name="InvNumFrom" PropertyName="IntegerFrom" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlInvNum" Name="InvNumTo" PropertyName="IntegerTo" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlCheckIn" Name="ChkInFrom" PropertyName="DateFrom" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlCheckIn" Name="ChkInTo" PropertyName="DateTo" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlInvDate" Name="InvDateFrom" PropertyName="DateFrom" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlInvDate" Name="InvDateTo" PropertyName="DateTo" Type="DateTime" />
            <asp:ControlParameter ControlID="fltRate" Name="RateCode" PropertyName="Text" Type="String" />
            <asp:Parameter Name="State" Type="Int32" />
            <asp:ControlParameter ControlID="ddlState" Name="StateSet" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="cbCancel" Name="IncludeCancel" PropertyName="Checked" Type="Boolean" />
            <asp:Parameter Name="ParentID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    <asp:ObjectDataSource ID="dsFilteredInvoicesDet" runat="server" SelectMethod="GetData" 
        TypeName="dsInvoiceJournalRateTableAdapters.InvoiceJournal_RateTableAdapter" 
        OldValuesParameterFormatString="original_{0}">
        <SelectParameters>
            <asp:ControlParameter ControlID="cbHotel" Name="HRate" PropertyName="Checked" Type="Boolean" />
            <asp:ControlParameter ControlID="ddlInv" Name="InvDoc" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelID" PropertyName="SelectedHotel" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelGroupId" PropertyName="SelectedHotelGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpID" PropertyName="SelectedTourOp" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpGroupId" PropertyName="SelectedTourOpGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="PayCondID" PropertyName="SelectedPayCond" Type="String" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="MarketID" PropertyName="SelectedMarket" Type="String" />
            <asp:ControlParameter ControlID="ddlInvType" DefaultValue="" Name="InvType" PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter Name="GroupCode" Type="String" />
            <asp:ControlParameter ControlID="ctrlInvNum" Name="InvNumFrom" PropertyName="IntegerFrom" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlInvNum" Name="InvNumTo" PropertyName="IntegerTo" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlCheckIn" Name="ChkInFrom" PropertyName="DateFrom" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlCheckIn" Name="ChkInTo" PropertyName="DateTo" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlInvDate" Name="InvDateFrom" PropertyName="DateFrom" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlInvDate" Name="InvDateTo" PropertyName="DateTo" Type="DateTime" />
            <asp:ControlParameter ControlID="fltRate" Name="RateCode" PropertyName="Text" Type="String" />
            <asp:Parameter Name="State" Type="Int32" />
            <asp:ControlParameter ControlID="ddlState" Name="StateSet" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="cbCancel" Name="IncludeCancel" PropertyName="Checked" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsRecap" runat="server" SelectMethod="GetData" 
        TypeName="dsInvoiceJournalRateTableAdapters.InvoiceJournal_Rate_RecapTableAdapter" 
        OldValuesParameterFormatString="original_{0}">
        <SelectParameters>
            <asp:ControlParameter ControlID="cbHotel" Name="HRate" PropertyName="Checked" Type="Boolean" />
            <asp:ControlParameter ControlID="ddlInv" Name="InvDoc" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelID" PropertyName="SelectedHotel" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelGroupId" PropertyName="SelectedHotelGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpID" PropertyName="SelectedTourOp" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpGroupId" PropertyName="SelectedTourOpGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="PayCondID" PropertyName="SelectedPayCond" Type="String" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="MarketID" PropertyName="SelectedMarket" Type="String" />
            <asp:ControlParameter ControlID="ddlInvType" DefaultValue="" Name="InvType" PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter Name="GroupCode" Type="String" />
            <asp:ControlParameter ControlID="ctrlInvNum" Name="InvNumFrom" PropertyName="IntegerFrom" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlInvNum" Name="InvNumTo" PropertyName="IntegerTo" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlCheckIn" Name="ChkInFrom" PropertyName="DateFrom" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlCheckIn" Name="ChkInTo" PropertyName="DateTo" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlInvDate" Name="InvDateFrom" PropertyName="DateFrom" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlInvDate" Name="InvDateTo" PropertyName="DateTo" Type="DateTime" />
            <asp:ControlParameter ControlID="fltRate" Name="RateCode" PropertyName="Text" Type="String" />
            <asp:Parameter Name="State" Type="Int32" />
            <asp:ControlParameter ControlID="ddlState" Name="StateSet" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="cbCancel" Name="IncludeCancel" PropertyName="Checked" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

