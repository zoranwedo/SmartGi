<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" 
    CodeFile="InvoiceLog.aspx.vb" Inherits="Reports_Logs_InvoiceLog"
    enableEventValidation="false" %>

<%@ Register src="~/App_UserControls/HotelExpanderControl.ascx" tagname="HotelExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/TourOpExpanderControl.ascx" tagname="TourOpExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/FromToIntegerControl.ascx" tagname="FromToIntegerControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/FromToDateControl.ascx" tagname="FromToDateControl" tagprefix="uc" %>
<%@ Register src="../../App_UserControls/MessagePop.ascx" tagname="MessagePop" tagprefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Invoices Change Log
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
                                <td class="GridRow1B" style="width: 120px;" >Inv Source</td>
                                <td class="GridRow1B" style="width: 480px;" colspan="3">
                                    <asp:DropDownList ID="ddlInvSource" runat="server" AppendDataBoundItems="True" 
                                        CssClass="TextBox">
                                        <asp:ListItem Selected="True" Value="">all </asp:ListItem>
                                        <asp:ListItem Value="SH">SH</asp:ListItem>
                                        <asp:ListItem Value="SX">SX</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 120px;" >Group Code</td>
                                <td class="GridRow1B" style="width: 480px;" colspan="3">
                                    <asp:TextBox ID="txtGroup" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wmGroup" runat="server" TargetControlID="txtGroup"
                                        WatermarkCssClass="WaterMark" WatermarkText="Like Group Code" />
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
                                <td class="GridRowClear" colspan="3">
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
                                <td class="ComandRow2T" style="height: 28px; padding-top: 5px; text-align: right;" >
                                    <asp:CheckBox ID="cbExcel" runat="server" Text="export to Excel" TextAlign="Left" Checked="true" />
                                </td>
                                <td class="ComandRow2T" style="height: 28px; padding-top: 5px; text-align: right;" colspan="3">
                                    &nbsp;&nbsp;<asp:Button ID="btReport" runat="server" SkinID="skBtnBase" Text="Report" />
                                    &nbsp;&nbsp;<asp:Button ID="btClear" runat="server" SkinID="skBtnClear" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <uc:MessagePop ID="msgPop" runat="server" Title="Invoices Change Log Report" />
    </div>
    <asp:ObjectDataSource ID="dsLog" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="LogReportsTableAdapters.LogRep_InvoicesTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelID" PropertyName="SelectedHotel" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelGroupId" PropertyName="SelectedHotelGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpID" PropertyName="SelectedTourOp" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpKind" PropertyName="SelectedTourOpKind" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpGroupId" PropertyName="SelectedTourOpGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="MarketID" PropertyName="SelectedMarket" Type="String" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="PayCondID" PropertyName="SelectedPayCond" Type="String" />
            <asp:ControlParameter ControlID="ddlInvType" Name="InvType" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="ddlInvSource" Name="InvSource" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="txtGroup" Name="GroupName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="ctrlCheckIn" Name="CkInFrom" PropertyName="DateFrom" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlCheckIn" Name="CkInTo" PropertyName="DateTo" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlInvNum" Name="NumFrom" PropertyName="IntegerFrom" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlInvNum" Name="NumTo" PropertyName="IntegerTo" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlInvDate" Name="DateFrom" PropertyName="DateFrom" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlInvDate" Name="DateTo" PropertyName="DateTo" Type="DateTime" />
            <asp:ControlParameter ControlID="ddlState" Name="StateSet" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>

