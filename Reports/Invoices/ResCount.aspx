<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="ResCount.aspx.vb" Inherits="Reports_Invoices_ResCount" EnableEventValidation="false" %>

<%@ Register src="~/App_UserControls/HotelExpanderControl.ascx" tagname="HotelExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/TourOpExpanderControl.ascx" tagname="TourOpExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/FromToDateControl.ascx" tagname="FromToDateControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/MessagePop.ascx" tagname="MessagePop" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Reservation Count Report
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" runat="Server">
    <div class="Green">
        <%--<asp:HiddenField ID="hfUserName" runat="server" Value='<%# My.User.Name %>' />--%>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 600px">
                    <asp:Panel ID="pnSearch" runat="server">
                        <asp:Panel ID="pnSearchPart" runat="server" Style="width: 600px" DefaultButton="btnReport">
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <asp:Panel ID="Panel1" runat="server" Width="600px">
                                        <td class="GridLabelBG" style="width: 600px;">
                                            <asp:Label ID="Label1" runat="server" SkinID="skGridLabel">
                                                Search/Filter&nbsp;
                                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/collapse_.png" />&nbsp; 
                                            </asp:Label>
                                        </td>
                                    </asp:Panel>
                                </tr>
                                <tr>
                                    <td class="GridBorder" style="width: 600px">
                                        <asp:Panel ID="Panel2" runat="server" Style="width: 600px" DefaultButton="btnReport">
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
                                                    <td class="GridRow1B" style="width: 120px;" >Check In</td>
                                                    <td class="GridRow1B" style="width: 480px;" >
                                                        <uc:FromToDateControl ID="ctrlCheckIn" runat="server"
                                                            MandatoryFrom="false"
                                                            MandatoryTo="false" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="GridRowClear" >Check Out</td>
                                                    <td class="GridRowClear" >
                                                        <uc:FromToDateControl ID="ctrlCheckOut" runat="server"
                                                            MandatoryFrom="false"
                                                            MandatoryTo="false" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="ComandRow2T" style="height: 30px; padding-top: 5px; text-align: left;" >
                                                        <asp:CheckBox ID="cbCancelled" runat="server" Text="Include Cancelled" />
                                                    </td>
                                                    <td class="ComandRow2T" style="height: 30px; padding-top: 5px" >
                                                        <asp:Button ID="btnReport" runat="server" SkinID="skBtnFilter" Text="Report" />&nbsp;
                                                        <asp:Button ID="btnClear" runat="server" SkinID="skBtnClear" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="dsReservations" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataExt" 
            TypeName="dsReservationsTableAdapters.RptReservationCountTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="ctrlHotel" Name="HotelID" PropertyName="SelectedHotel" Type="Int32" />
                <asp:ControlParameter ControlID="ctrlHotel" Name="HotelGroupID" PropertyName="SelectedHotelGroup" Type="Int32" />
                <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpID" PropertyName="SelectedTourOp" Type="Int32" />
                <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpGroupID" PropertyName="SelectedTourOpGroup" Type="Int32" />
                <asp:ControlParameter ControlID="ctrlTourOp" Name="MarketId" PropertyName="SelectedMarket" Type="String" />
                <asp:ControlParameter ControlID="ctrlTourOp" Name="PayCondID" PropertyName="SelectedPayCond" Type="String" />
                <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpKind" PropertyName="SelectedTourOpKind" Type="Int32" />
                <asp:ControlParameter ControlID="ctrlCheckIn" Name="CheckInFrom" PropertyName="DateFrom" Type="DateTime" />
                <asp:ControlParameter ControlID="ctrlCheckIn" Name="CheckInTo" PropertyName="DateTo" Type="DateTime" />
                <asp:ControlParameter ControlID="ctrlCheckOut" Name="CheckOutFrom" PropertyName="DateFrom" Type="DateTime" />
                <asp:ControlParameter ControlID="ctrlCheckOut" Name="CheckOutTo" PropertyName="DateTo" Type="DateTime" />
                <asp:ControlParameter ControlID="cbCancelled" Name="Cancelled" PropertyName="Checked" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <uc1:MessagePop ID="msgPop" runat="server" Title="Reservation Count Report" />
    </div>
</asp:Content>
