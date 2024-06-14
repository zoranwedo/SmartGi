<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" 
    CodeFile="ExpectingArrivals.aspx.vb" Inherits="Reports_Invoices_ExpectingArrivals" 
    enableEventValidation="false" %>

<%@ Register src="~/App_UserControls/HotelExpanderControl.ascx" tagname="HotelExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/TourOpExpanderControl.ascx" tagname="TourOpExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/FromToIntegerControl.ascx" tagname="FromToIntegerControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/FromToDateControl.ascx" tagname="FromToDateControl" tagprefix="uc" %>
<%@ Register src="../../App_UserControls/MessagePop.ascx" tagname="MessagePop" tagprefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Expecting Arrivals
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
                                <td class="GridRow1B">Room Type</td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlRoomType" runat="server" CssClass="TextBox" 
                                        DataSourceID="dsRoomType" DataTextField="RoomType" DataValueField="RoomTypeID" 
                                        AppendDataBoundItems="True">
                                        <asp:ListItem Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsRoomType" runat="server" OldValuesParameterFormatString="original_{0}" 
                                        SelectMethod="GetData" TypeName="dsMaintBasicTableAdapters.RoomTypeTableAdapter" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 120px;">Name</td>
                                <td class="GridRow1B" style="width: 480px;">
                                    <asp:TextBox ID="fltName" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wo_fltName" runat="server" WatermarkCssClass="WaterMark"
                                        TargetControlID="fltName" WatermarkText="Name on reservation (use % as wildcard)" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Group Code/Name</td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="fltResGroup" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wo_fltResGroup" runat="server" WatermarkCssClass="WaterMark"
                                        TargetControlID="fltResGroup" WatermarkText="Group name or code (use % as wildcard)" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" >Bk Number</td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="fltBkNumber" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wo_fltBkNumber" runat="server" WatermarkCssClass="WaterMark"
                                        TargetControlID="fltBkNumber" WatermarkText="Booking number (use % as wildcard)" />
                               </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 120px;" >Folio Num</td>
                                <td class="GridRow1B" style="width: 480px;" >
                                    <uc:FromToIntegerControl ID="ctrlFolioNum" runat="server"
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
                                <td class="GridRowClear" style="width: 120px;" >Bk Date</td>
                                <td class="GridRowClear" style="width: 480px;" >
                                    <uc:FromToDateControl ID="ctrlBook" runat="server"
                                        MandatoryFrom="false"
                                        MandatoryTo="false" />
                                </td>
                            </tr>
                            <tr>
                                <td class="ComandRow2T" style="height: 28px; padding-top: 5px; text-align: left;" />
                                <td class="ComandRow2T" style="height: 28px; padding-top: 5px; text-align: right;">
                                    <asp:CheckBox ID="cbCancel" runat="server" Text="Include cancel" TextAlign="Left" />
                                    &nbsp;&nbsp;<asp:Button ID="btReport" runat="server" SkinID="skBtnBase" Text="Report" />
                                    &nbsp;&nbsp;<asp:Button ID="btClear" runat="server" SkinID="skBtnClear" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <uc:MessagePop ID="msgPop" runat="server" Title="Invoice Journal Coop Marketing Report" />
    </div>
    <asp:ObjectDataSource ID="dsReservas" runat="server" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetData" TypeName="ReportsInvoiceTableAdapters.Expecting_ArrivalsTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelID" PropertyName="SelectedHotel" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelGroupId" PropertyName="SelectedHotelGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpID" PropertyName="SelectedTourOp" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpGroupId" PropertyName="SelectedTourOpGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="PayCondID" PropertyName="SelectedPayCond" Type="String" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="MarketID" PropertyName="SelectedMarket" Type="String" />
            <asp:ControlParameter ControlID="ctrlFolioNum" Name="FolioFrom" PropertyName="IntegerFrom" Type="Int64" />
            <asp:ControlParameter ControlID="ctrlFolioNum" Name="FolioTo" PropertyName="IntegerTo" Type="Int64" />
            <asp:ControlParameter ControlID="ctrlCheckIn" Name="ChkInFrom" PropertyName="DateFrom" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlCheckIn" Name="ChkInTo" PropertyName="DateTo" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlBook" Name="BookFrom" PropertyName="DateFrom" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlBook" Name="BookTo" PropertyName="DateTo" Type="DateTime" />
            <asp:ControlParameter ControlID="fltBkNumber" Name="BkNumber" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="fltResGroup" Name="ResGroup" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="ddlRoomType" Name="RoomTypeId" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="fltName" Name="Name" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="cbCancel" Name="Cancelled" PropertyName="Checked" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

