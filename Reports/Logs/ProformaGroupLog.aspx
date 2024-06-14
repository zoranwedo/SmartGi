<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" 
    CodeFile="ProformaGroupLog.aspx.vb" Inherits="Reports_Logs_ProformaGroupLog" 
    enableEventValidation="false" %>

<%@ Register src="~/App_UserControls/HotelExpanderControl.ascx" tagname="HotelExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/TourOpExpanderControl.ascx" tagname="TourOpExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/FromToIntegerControl.ascx" tagname="FromToIntegerControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/FromToDateControl.ascx" tagname="FromToDateControl" tagprefix="uc" %>
<%@ Register src="../../App_UserControls/MessagePop.ascx" tagname="MessagePop" tagprefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Group Proformas Change Log
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
                            <%--<tr>
                                <td class="GridRow1B" colspan="2" >
                                    <uc:HotelExpanderControl ID="ctrlHotel" runat="server" 
                                        LabelWidth="120px" ControlWidth="480px" 
                                        CollapsedDefailt="false"
                                        NoCCI="false" />
                                </td>
                            </tr>--%>
                            <tr>
                                <td class="GridRow1B" colspan="2" >
                                    <uc:TourOpExpanderControl ID="ctrlTourOp" runat="server" 
                                        LabelWidth="120px" ControlWidth="480px"
                                        CollapsedDefailt="false"
                                        NoLocal="true" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 120px;" >Group Code</td>
                                <td class="GridRow1B" style="width: 480px;">
                                    <asp:TextBox ID="txtGroup" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wmGroup" runat="server" TargetControlID="txtGroup"
                                        WatermarkCssClass="WaterMark" WatermarkText="Like Group Code" />
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
                                <td class="GridRow1B" style="width: 120px;" >Proforma Num</td>
                                <td class="GridRow1B" style="width: 480px;" >
                                    <uc:FromToIntegerControl ID="ctrlInvNum" runat="server"
                                        MandatoryFrom="false"
                                        MandatoryTo="false" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear">State</td>
                                <td class="GridRowClear">
                                        <asp:DropDownList ID="ddlState" runat="server" AppendDataBoundItems="True" CssClass="TextBox">
                                            <asp:ListItem Selected="True" Value="">all states</asp:ListItem>
                                            <asp:ListItem Value="0">Created</asp:ListItem>
                                            <asp:ListItem Value="1">Modified</asp:ListItem>
                                            <asp:ListItem Value="2">Definitive</asp:ListItem>
                                            <asp:ListItem Value="3">Not Definitive</asp:ListItem>
                                        </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="ComandRow2T" style="height: 28px; padding-top: 5px; text-align: right;" >
                                    <asp:CheckBox ID="cbExcel" runat="server" Text="export to Excel" TextAlign="Left" Checked="true" />
                                </td>
                                <td class="ComandRow2T" style="height: 28px; padding-top: 5px; text-align: right;">
                                    &nbsp;&nbsp;<asp:Button ID="btReport" runat="server" SkinID="skBtnBase" Text="Report" />
                                    &nbsp;&nbsp;<asp:Button ID="btClear" runat="server" SkinID="skBtnClear" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <uc:MessagePop ID="msgPop" runat="server" Title="Group Proformas Change Log Report" />
    </div>
    <br />
    <asp:ObjectDataSource ID="dsLog" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="LogReportsTableAdapters.LogRep_ProformaGroupTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpID" PropertyName="SelectedTourOp" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpGroupId" PropertyName="SelectedTourOpGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="MarketID" PropertyName="SelectedMarket" Type="String" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="PayCondID" PropertyName="SelectedPayCond" Type="String" />
            <asp:ControlParameter ControlID="txtGroup" Name="GroupName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="ctrlCheckIn" Name="CkInFrom" PropertyName="DateFrom" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlCheckIn" Name="CkInTo" PropertyName="DateTo" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlInvNum" Name="NumFrom" PropertyName="IntegerFrom" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlInvNum" Name="NumTo" PropertyName="IntegerTo" Type="Int32" />
            <asp:ControlParameter ControlID="ddlState" Name="State" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>

