<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" 
    CodeFile="AccTransferHotel.aspx.vb" Inherits="Reports_Accounting_AccTransferHotel" 
    EnableEventValidation="false" %>

<%@ Register src="~/App_UserControls/HotelControl.ascx" tagname="HotelControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/TourOpControl.ascx" tagname="TourOpControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/InputDateControl.ascx" tagname="InputDateControl" tagprefix="uc" %>
<%@ Register src="../../App_UserControls/MessagePop.ascx" tagname="MessagePop" tagprefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Hotel Transfers
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
                                    <uc:HotelControl ID="ctrlHotelFrom" runat="server" 
                                        LabelWidth="120px"
                                        HotelLabel="From Hotel"
                                        NoCCI="false" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" colspan="2" >
                                    <uc:HotelControl ID="ctrlHotelTo" runat="server" 
                                        LabelWidth="120px"
                                        HotelLabel="To Hotel"
                                        NoCCI="false" />
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
                                <td class="GridRow1B" colspan="2" >
                                    <uc:TourOpControl ID="ctrlTourOperator" runat="server" 
                                        LabelWidth="120px"
                                        HotelLabel="Tour Op" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Account Type
                                </td>
                                <td class="GridRow1B" colspan="2">
                                    <asp:DropDownList ID="ddlAccType" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsAccType" DataTextField="DisplayType" DataValueField="AccType">
                                        <asp:ListItem Selected="True" Value="">all </asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsAccType" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="AgingBalanceTableAdapters.AccTypeTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                             <tr>
                                <td class="GridRowClear" style="height: 28px; padding-top: 5px; text-align: left;" />
                                <td class="GridRowClear" style="height: 28px; padding-top: 5px; text-align: right;">
                                    <asp:CheckBox ID="cbSeparate" runat="server" Text="Separate Credit/Debit" TextAlign="Left" style="margin-right: 3px;" />
                                    <asp:CheckBox ID="cbNote" runat="server" Text="Print Notes" TextAlign="Left" style="margin-right: 10px;" />
                                    <asp:Button ID="btReport" runat="server" SkinID="skBtnBase" Text="Recap" style="margin-right: 3px;" />
                                    <asp:Button ID="btDetail" runat="server" SkinID="skBtnBase" Text="Detail Report" style="margin-right: 3px;" />
                                    <asp:Button ID="btClear" runat="server" SkinID="skBtnClear" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <uc:MessagePop ID="msgPop" runat="server" Title="Hotel Transfers Report" />
    </div>
    <asp:ObjectDataSource ID="dsRecap" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataExt" 
            
            TypeName="dsAccTransferHotelTableAdapters.AccTransferHotelRecapTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="ctrlHotelFrom" Name="srcHotelID" PropertyName="SelectedHotel" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlHotelTo" Name="destHotelID" PropertyName="SelectedHotel" Type="Int32" />
            <asp:ControlParameter ControlID="fltFromDate" Name="dateFrom" PropertyName="DateValue" Type="DateTime" />
            <asp:ControlParameter ControlID="fltDate" Name="dateTo" PropertyName="DateValue" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlTourOperator" Name="TourOpID" PropertyName="SelectedTourOp" Type="Int32" />
            <asp:ControlParameter ControlID="ddlAccType" Name="Account" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
        </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsDetail" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataExt" 
            TypeName="dsAccTransferHotelTableAdapters.AccTransferHotelDetailTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="ctrlHotelFrom" Name="srcHotelID" PropertyName="SelectedHotel" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlHotelTo" Name="destHotelID" PropertyName="SelectedHotel" Type="Int32" />
            <asp:ControlParameter ControlID="fltFromDate" Name="dateFrom" PropertyName="DateValue" Type="DateTime" />
            <asp:ControlParameter ControlID="fltDate" Name="dateTo" PropertyName="DateValue" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlTourOperator" Name="TourOpID" PropertyName="SelectedTourOp" Type="Int32" />
            <asp:ControlParameter ControlID="ddlAccType" Name="Account" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
        </asp:ObjectDataSource>
</asp:Content>

