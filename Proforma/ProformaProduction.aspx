<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" 
    CodeFile="ProformaProduction.aspx.vb" Inherits="Proforma_ProformaProduction"  
	MaintainScrollPositionOnPostback="true"
    enableEventValidation="false" %>

<%@ Register src="~/App_UserControls/InputIntegerControl.ascx" tagname="InputIntegerControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/InputDateControl.ascx" tagname="InputDateControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/HotelExpanderControl.ascx" tagname="HotelExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/TourOpExpanderControl.ascx" tagname="TourOpExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/FromToDateControl.ascx" tagname="FromToDateControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/FromToIntegerControl.ascx" tagname="FromToIntegerControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/MessagePop.ascx" tagname="MessagePop" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/ProcessingProgressControl.ascx" tagname="ProcessingProgress" tagprefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Proforma Production
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
                    <asp:Panel ID="pnSearchHead" runat="server" Width="600px">
                        <asp:Label ID="lblFilter" runat="server" SkinID="skGridLabel">Search/Filter &nbsp;
                            <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />&nbsp; 
                        </asp:Label>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px">
                    <asp:Panel ID="pnSearch" runat="server" style="padding-left: 8px;" DefaultButton="btnSearch">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="GridRow1B" style="width: 120px;" >Proformas</td>
                                <td class="GridRow1B" style="width: 480px;" >
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
                                <td class="GridRow1B" >Group Code/Name</td>
                                <td class="GridRow1B" >
                                        <asp:TextBox ID="txtGroup" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="wmGroup" runat="server" TargetControlID="txtGroup"
                                            WatermarkCssClass="WaterMark" WatermarkText="Like Group Code or Name" />
                                </td>
                            </tr>
                            </asp:Panel>
                            <tr>
                                <td class="GridRow1B" >Check In</td>
                                <td class="GridRow1B" >
                                    <uc:FromToDateControl ID="ctrlCheckIn" runat="server"
                                        MandatoryFrom="false"
                                        MandatoryTo="false" />
                                </td>
                            </tr>
                                <tr>
                                    <td class="GridRow1B" >Check Out</td>
                                    <td class="GridRow1B" >
                                        <uc:FromToDateControl ID="ctrlCheckOut" runat="server"
                                            MandatoryFrom="false"
                                            MandatoryTo="false" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Booking Date</td>
                                    <td class="GridRow1B">
                                        <uc:FromToDateControl ID="ctrlBkDate" runat="server"
                                            MandatoryFrom="false"
                                            MandatoryTo="false" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Booking Number</td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtBkNumber" runat="server" CssClass="TextBox"/>
                                    </td>
                                </tr>
                            <tr>
                                <td class="GridRowClear">Options</td>
                                <td class="GridRowClear">
                                    <asp:CheckBox ID="cbIncludeCancelled" runat="server" Text = "Include cancelled reservations" />
                                    <br />
                                    <asp:CheckBox ID="cbIncludePreinvoiced" runat="server" Text = "Include preinvoiced reservations" />
                                </td>
                            </tr>
                            <tr>
                                <td class="ComandRow2T" colspan="2" style="height: 30px; padding-top: 5px">
                                    <asp:Button ID="btnSearch" runat="server" SkinID="skBtnFilter" style="margin-top: 7px; margin-right: 7px;" />
                                    <asp:Button ID="btnClear" runat="server" SkinID="skBtnClear" style="margin-top: 7px;" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div class="Blue">
        <asp:Panel runat="server" ID="pnlCnt" Visible="False">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td class="GridLabelBG">
                        <asp:Label ID="lbTitle" runat="server" SkinID="skGridLabel" Text="Proformas" Height="26px" />
                        <asp:LinkButton ID="btPrint" runat="server" style="float:right; color: White; padding: 4px; font-weight: bold;">
                            Export to excel
                        </asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="GridBorder">
                        <asp:Panel ID="pnlScroll" runat="server" ScrollBars="Auto" style="max-height: 600px; padding: 2px 4px;">
                            <asp:Repeater ID="rptBookings" runat="server" DataSourceID="dsFiltered" >
                                <HeaderTemplate>
                                    <table cellpadding="0" cellspacing="0">
                                        <tr style="font-weight: bold;">
                                            <td class="InvRowBill ProdHead" style="text-align: center;" colspan="10">
                                                Reservation
                                            </td>
                                            <td class="InvRowBill ProdHead ProdHeadR ProdHeadB" style="text-align: center;" colspan="2" rowspan="2">
                                                Proforma
                                            </td>
                                        </tr>
                                        <tr style="font-weight: bold;">
                                             <td class="InvRowBill ProdHead ProdHeadB" style="text-align: center;" colspan="3">
                                                FolioFull
                                            </td>
                                            <td class="InvRowBill ProdHead ProdHeadB" style="width: 120px; text-align: center;">
                                                Bk.Number
                                            </td>
                                            <td class="InvRowBill ProdHead ProdHeadB" style="width: 100px; text-align: center;">
                                                Bk.Date
                                            </td>
                                            <td class="InvRowBill ProdHead ProdHeadB" style="width: 200px; text-align: center;">
                                                Guest
                                            </td>
                                            <td class="InvRowBill ProdHead ProdHeadB" style="width: 50px; text-align: center;">
                                                Room
                                            </td>
                                            <td class="InvRowBill ProdHead ProdHeadB" style="width: 100px; text-align: center;">
                                                Check In
                                            </td>
                                            <td class="InvRowBill ProdHead ProdHeadB" style="width: 100px; text-align: center;">
                                                Check Out
                                            </td>
                                            <td class="InvRowBill ProdHead ProdHeadB" style="width: 100px; text-align: center;">
                                                Status
                                            </td>
                                        </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Panel ID="pnlTourOp" runat="server" Visible='<%# Eval("Rnk")=0 %>'>
                                        <tr>
                                            <td style="height:2px; width: 30px;"></td>
                                            <td style="height:2px; width: 30px;"></td>
                                            <td style="height:2px; width: 120px;"></td>
                                            <td colspan="9" style="height:2px;"></td>
                                        </tr>
                                        <tr style="font-weight: bold;">
                                            <td class="SelectRow1TB" colspan="12" style="text-align: left; padding-left: 5px; padding-top: 2px; padding-bottom: 2px;">
                                                <%#Eval("TourOp")%>
                                            </td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="pnlHotel" runat="server" Visible='<%# Eval("Rnk")=1 %>'>
                                        <tr style="font-weight: bold;">
                                            <td class="GridRowClear" >&nbsp</td>
                                            <td class="SelectRow1B" colspan="11" style="text-align: left; padding-left: 5px;">
                                                <%#Eval("Hotel")%>
                                            </td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="pnlResGroup" runat="server" Visible='<%# Eval("Rnk")=2 AND Not (Eval("ResGroup") Is DBNull.Value) %>'>
                                        <tr>
                                            <td class="GridRowClear" >&nbsp</td>
                                            <td class="SelectRow1B" colspan="11" style="text-align: left; padding-left: 5px;">
                                                <i>Group: <b><%#Eval("ResGroup")%></b></i>
                                            </td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="pnlData" runat="server" Visible='<%# Eval("Rnk")=3 %>'>
                                        <tr style="padding-top: 1px; padding-bottom: 2px;">
                                            <td class="GridRowClear" >&nbsp</td>
                                            <td class="GridRow1B" style="text-align: left;padding-top: 1px; padding-bottom: 3px; padding-left: 5px;" colspan="2">
                                                <%#Eval("FolioFull")%>
                                            </td>
                                            <td class="GridRow1B" style="text-align: center;padding-top: 1px; padding-bottom: 3px;">
                                                <%#Eval("BkNumber")%>
                                            </td>
                                            <td class="GridRow1B" style="text-align: center;padding-top: 1px; padding-bottom: 3px;">
                                                <%#Eval("BkDate", "{0:d}")%>
                                            </td>
                                            <td class="GridRow1B" style="text-align: left;padding-top: 1px; padding-bottom: 3px;">
                                                <%#Eval("PreInvText")%>
                                            </td>
                                            <td class="GridRow1B" style="text-align: center;padding-top: 1px; padding-bottom: 3px;">
                                                <%#Eval("RoomTypeId")%>
                                            </td>
                                            <td class="GridRow1B" style="text-align: center;padding-top: 1px; padding-bottom: 3px;">
                                                <%#Eval("CheckIn", "{0:d}")%>
                                            </td>
                                            <td class="GridRow1B" style="text-align: center;padding-top: 1px; padding-bottom: 3px;">
                                                <%#Eval("CheckOut", "{0:d}")%>
                                            </td>
                                            <td class="GridRow1B ProdHeadR" style="text-align: center;padding-top: 1px; padding-bottom: 3px;">
                                                <%#Eval("ResStatus")%>
                                            </td>
                                            <asp:Panel ID="pnlProforma" runat="server" Visible='<%# Not (Eval("InvDocID") Is DBNull.Value) %>'>
                                            <td class="GridRow1B" style="text-align: left; padding-top: 1px; padding-bottom: 3px; padding-left: 5px; width: 200px;">
                                                <asp:HyperLink ID="HyperLink1" runat="server" 
                                                    NavigateUrl='<%# "~/Proforma/ProformDetails.aspx?ProformaID=" & Eval("InvDocID")%>'>
                                                    <%#Eval("InvDocNum")%>&nbsp;(<i><%#Eval("SourcePMS")%></i>)
                                                </asp:HyperLink>
                                            </td>
                                            <td class="GridRow1B" style="text-align: center;padding-top: 1px; padding-bottom: 3px; width: 80px;">
                                                <asp:Label ID="Label1" runat="server" Text="Cancelled" Visible='<%# Eval("InvDocCancelled")%>' />
                                                <asp:Label ID="Label2" runat="server" Text="Delivered" Visible='<%# Not Eval("InvDocCancelled") And Eval("InvDocDelivered")%>' />
                                                <asp:Label ID="Label3" runat="server" Text="Not Delivered" Visible='<%# Not Eval("InvDocCancelled") And Not Eval("InvDocDelivered")%>' />
                                            </td>
                                            </asp:Panel>
                                            <asp:Panel ID="pnlOperation" runat="server" Visible='<%# (Eval("InvDocID") Is DBNull.Value) %>'>
                                            <td class="GridRow1B" style="text-align: right; padding-top: 1px; padding-bottom: 3px;" colspan="2">
                                                <asp:HyperLink ID="HyperLink2" runat="server" style="padding-right: 20px;"
                                                    Visible='<%# (Eval("ResGroup") Is DBNull.Value) %>'
                                                    NavigateUrl='<%# "~/Proforma/ProCreateSingleNew.aspx?TourOpID=" & Eval("TourOpID") & "&HotelID=" & Eval("HotelID") & "&CheckIn=" & Eval("CheckIn")%>'>
                                                    Preinvoice &gt;&gt;
                                                </asp:HyperLink>
                                                <asp:HyperLink ID="HyperLink3" runat="server" style="padding-right: 20px;"
                                                    Visible='<%# Not (Eval("ResGroup") Is DBNull.Value) %>'
                                                    NavigateUrl='<%# "~/Proforma/ProCreateGroup.aspx?TourOpID=" & Eval("TourOpID") & "&ResGroup=" & Eval("ResGroup") & "&HotelID=" & Eval("HotelID")%>'>
                                                    Preinvoice &gt;&gt;
                                                </asp:HyperLink>
                                            </td>
                                            </asp:Panel>
                                        </tr>
                                    </asp:Panel>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
            <uc:MessagePop ID="msgPop" runat="server" Title="Proforma Production" />
        </asp:Panel>
    </div>
    <asp:ObjectDataSource ID="dsFiltered" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" 
        TypeName="dsProformaSearchTableAdapters.InvRes_ProductionTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="rbType" Name="Group" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="txtGroup" Name="GroupName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelID" PropertyName="SelectedHotel" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelGroupID" PropertyName="SelectedHotelGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpID" PropertyName="SelectedTourOp" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpGroupID" PropertyName="SelectedTourOpGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="MarketID" PropertyName="SelectedMarket" Type="String" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="PayCondID" PropertyName="SelectedPayCond" Type="String" />
            <asp:ControlParameter ControlID="ctrlCheckIn" Name="CheckInFrom" PropertyName="DateFrom" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlCheckIn" Name="CheckInTo" PropertyName="DateTo" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlCheckOut" Name="CheckOutFrom" PropertyName="DateFrom" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlCheckOut" Name="CheckOutTo" PropertyName="DateTo" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlBkDate" Name="BkDateFrom" PropertyName="DateFrom" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlBkDate" Name="BkDateTo" PropertyName="DateTo" Type="DateTime" />
            <asp:ControlParameter ControlID="txtBkNumber" Name="BkNumber" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="cbIncludeCancelled" Name="IncludeCancelled" PropertyName="Checked" Type="Boolean" />
            <asp:ControlParameter ControlID="cbIncludePreinvoiced" Name="IncludePreinvoiced" PropertyName="Checked" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>

