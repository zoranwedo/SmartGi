<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" 
    CodeFile="AccRepDocTransfer.aspx.vb" Inherits="Reports_Accounting_AccRepDocTransfer" 
    EnableEventValidation="false" %>

<%@ Register src="~/App_UserControls/HotelGroupHotelControl.ascx" tagname="HotelGroupHotelControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/TourOpGroupMarketPayCondTourOpControl.ascx" tagname="TourOpGroupMarketPayCondTourOpControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/InputDateControl.ascx" tagname="InputDateControl" tagprefix="uc" %>
<%@ Register src="../../App_UserControls/MessagePop.ascx" tagname="MessagePop" tagprefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Documents Transfer   
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
                                <td class="GridRow1B" style="width: 120px;" >As of Date</td>
                                <td class="GridRow1B" style="width: 480px;">
                                    <uc:InputDateControl ID="fltDate" runat="server" 
                                        DefaultNow="true" Mandatory="true" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Doc From</td>
                                <td class="GridRow1B">
                                    <uc:InputDateControl ID="fltDocFrom" runat="server" 
                                        DefaultNow="false" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">From Account Type</td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlFromAccType" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsAccType" DataTextField="DisplayType" DataValueField="AccTypeID">
                                        <asp:ListItem Selected="True" Value="">all </asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsAccType" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="AgingBalanceTableAdapters.AccTypeTableAdapter" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear">To Account Type</td>
                                <td class="GridRowClear">
                                    <asp:DropDownList ID="ddlToAccType" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsAccType" DataTextField="DisplayType" DataValueField="AccTypeID">
                                        <asp:ListItem Selected="True" Value="">all </asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="AgingBalanceTableAdapters.AccTypeTableAdapter" />
                                </td>
                            </tr>
                            <tr>
                            <td class="ComandRow2T" style="text-align: left; height: 28px; padding-top: 5px;">
                                <asp:CheckBox ID="cbHotel" runat="server" Text="Hotel" TextAlign="Right" />
                            </td>
                            <td class="ComandRow2T" style="text-align: right; height: 28px; padding-top: 5px;">
                                <asp:CheckBox ID="cbDetail" runat="server" Text="Show Details" TextAlign="Left" />
                                <asp:CheckBox ID="cbExcel" runat="server" Text="Export to Excel" TextAlign="Left" Checked="true" />
                                &nbsp;&nbsp;<asp:Button ID="btReport" runat="server" SkinID="skBtnBase" Text="Report" />
                                &nbsp;&nbsp;<asp:Button ID="btClear" runat="server" SkinID="skBtnClear" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <uc:MessagePop ID="msgPop" runat="server" Title="Documents Transfer Report" />
    </div>
    <asp:ObjectDataSource ID="dsAccRepTransferDetail" runat="server" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetData" TypeName="ReportAccountingTableAdapters.AccRepTransferDetailTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelId" PropertyName="SelectedHotel" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelGroupID" PropertyName="SelectedHotelGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpId" PropertyName="SelectedTourOp" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpGroupID" PropertyName="SelectedTourOpGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="MarketID" PropertyName="SelectedMarket" Type="String" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="PayCondID" PropertyName="SelectedPayCond" Type="String" />
            <asp:ControlParameter ControlID="fltDate" Name="AsOffDate" PropertyName="DateValue" Type="DateTime" />
            <asp:ControlParameter ControlID="fltDocFrom" Name="DocFrom" PropertyName="TextValue" Type="DateTime" />
            <asp:ControlParameter ControlID="ddlFromAccType" Name="FromAccTypeID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlToAccType" Name="ToAccTypeID" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

