<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" 
    CodeFile="ProformaStatement.aspx.vb" Inherits="Proforma_ProformaStatement"
    enableEventValidation="false" %>

<%@ Register src="~/App_UserControls/HotelExpanderControl.ascx" tagname="HotelExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/TourOpExpanderControl.ascx" tagname="TourOpExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/FromToDateControl.ascx" tagname="FromToDateControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/FromToIntegerControl.ascx" tagname="FromToIntegerControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/MessagePop.ascx" tagname="MessagePop" tagprefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Proforma Statement
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
                                <td class="GridRow1B" >Proformas</td>
                                <td class="GridRow1B" >
                                    <asp:RadioButtonList ID="rbType" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" AutoPostBack="true">
                                        <asp:ListItem Value="0" Selected="True">All</asp:ListItem>
                                        <asp:ListItem Value="1">Single</asp:ListItem>
                                        <asp:ListItem Value="2">Group</asp:ListItem>
                                    </asp:RadioButtonList>
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
                                <td class="GridRow1B" colspan="2" >
                                    <uc:HotelExpanderControl ID="ctrlHotel" runat="server" 
                                        LabelWidth="120px" ControlWidth="480px" 
                                        CollapsedDefailt="false"
                                        NoCCI="false" />
                                </td>
                            </tr>
                            <asp:Panel ID="pnlGroup" runat="server">
                            <tr>
                                <td class="GridRow1B" >Group Code</td>
                                <td class="GridRow1B" >
                                        <asp:TextBox ID="txtGroup" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="wmGroup" runat="server" TargetControlID="txtGroup"
                                            WatermarkCssClass="WaterMark" WatermarkText="Like Group Code" />
                                </td>
                            </tr>
                            </asp:Panel>
                            <tr>
                                <td class="GridRow1B" style="width: 120px;" >Proforma Num</td>
                                <td class="GridRow1B" style="width: 480px;" >
                                    <uc:FromToIntegerControl ID="ctrlNum" runat="server"
                                        MandatoryFrom="false"
                                        MandatoryTo="false" />
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
                                <td class="GridRowClear" style="width: 120px;" >Payment Status</td>
                                <td class="GridRowClear" style="width: 480px;" >
                                    <asp:DropDownList ID="ddlPayment" runat="server" CssClass="TextBox">
                                        <asp:ListItem Selected="True" Value="">all </asp:ListItem>
                                        <asp:ListItem Value="0">Not Paid</asp:ListItem>
                                        <asp:ListItem Value="1">Paid in Full</asp:ListItem>
                                        <asp:ListItem Value="2">Partial Payment (Not Paid in Complete)</asp:ListItem>
                                        <asp:ListItem Value="3">Paid with Overpayments</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="ComandRow2T" style="text-align: left;">&nbsp;</td>
                                <td class="ComandRow2T" style="text-align: right;">
                                    <asp:CheckBox ID="cbDetail" runat="server" Checked="true" style="float: left;" Text="Detail Report" />
                                    &nbsp;&nbsp;<asp:Button ID="btReport" runat="server" SkinID="skBtnBase" Text="Report" />
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
    <asp:ObjectDataSource ID="dsFilteredProforma" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="dsProformaApplicationTableAdapters.InvDocStatementDetailTableAdapter" >
        <SelectParameters>
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelID" PropertyName="SelectedHotel" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelGroupID" PropertyName="SelectedHotelGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpID" PropertyName="SelectedTourOp" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpGroupID" PropertyName="SelectedTourOpGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="MarketID" PropertyName="SelectedMarket" Type="String" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="PayCondID" PropertyName="SelectedPayCond" Type="String" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpKind" PropertyName="SelectedTourOpKind" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlNum" Name="NumberFrom" PropertyName="IntegerFrom" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlNum" Name="NumberTo" PropertyName="IntegerTo" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlCheckIn" Name="CheckInFrom" PropertyName="DateFrom" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlCheckIn" Name="CheckInTo" PropertyName="DateTo" Type="DateTime" />
            <asp:ControlParameter ControlID="rbType" Name="ProformaType" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="txtGroup" Name="GroupName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="ddlPayment" Name="PayStatus" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

