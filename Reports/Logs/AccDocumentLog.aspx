<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" 
    CodeFile="AccDocumentLog.aspx.vb" Inherits="Reports_Logs_AccDocumentLog"
    enableEventValidation="false" %>

<%@ Register src="~/App_UserControls/HotelExpanderControl.ascx" tagname="HotelExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/TourOpExpanderControl.ascx" tagname="TourOpExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/FromToDateControl.ascx" tagname="FromToDateControl" tagprefix="uc" %>
<%@ Register src="../../App_UserControls/MessagePop.ascx" tagname="MessagePop" tagprefix="uc" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Accounting Documents Change Log
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
                                <td class="GridRow1B">
                                    Doc Class
                                </td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlDocClass" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsTrDocClass" DataTextField="TrDocClass" DataValueField="TrDocClass">
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsTrDocClass" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="ReportAccountingTableAdapters.TrDocClassTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear" style="width: 120px;" >Document Date</td>
                                <td class="GridRowClear" style="width: 480px;" >
                                    <uc:FromToDateControl ID="ctrlDocDate" runat="server"
                                        MandatoryFrom="false"
                                        MandatoryTo="false" />
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
        <uc:MessagePop ID="msgPop" runat="server" Title="Accounting Documents Change Log Report" />
    </div>
    <br />
    <asp:ObjectDataSource ID="dsLog" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="LogReportsTableAdapters.LogRep_AccDocumentsTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelID" PropertyName="SelectedHotel" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelGroupId" PropertyName="SelectedHotelGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpID" PropertyName="SelectedTourOp" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpKind" PropertyName="SelectedTourOpKind" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpGroupId" PropertyName="SelectedTourOpGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="PayCondID" PropertyName="SelectedPayCond" Type="String" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="MarketID" PropertyName="SelectedMarket" Type="String" />
            <asp:ControlParameter ControlID="ddlAccType" Name="AccType" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlDocClass" Name="TrDocClass" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlDocDate" Name="FromDate" PropertyName="DateFrom" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlDocDate" Name="ToDate" PropertyName="DateTo" Type="DateTime" />
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>

