<%@ Page Title="" Language="VB"  MasterPageFile="~/masterSMART.master" AutoEventWireup="false" 
    CodeFile="AccDocSearchRes.aspx.vb" Inherits="Accounting_AccDocSearchRes"
	MaintainScrollPositionOnPostback="true"
    EnableEventValidation="false" %>

<%@ Register src="~/App_UserControls/MessagePop.ascx" tagname="MessagePop" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/HotelExpanderControl.ascx" tagname="HotelExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/TourOpExpanderControl.ascx" tagname="TourOpExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/FromToDateControl.ascx" tagname="FromToDateControl" tagprefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Accounting Documents with Reservations
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
                <asp:Panel ID="pnSearchHead" runat="server" Width="600px">
                    <td class="GridLabelBG" style="width: 600px;">
                        <asp:Label ID="lblFilter" runat="server" SkinID="skGridLabel">Search/Filter &nbsp;
                            <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />&nbsp;
                        </asp:Label>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:Panel ID="pnSearch" runat="server" DefaultButton="btSearch">
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
                                <td class="GridRowClear" style="width: 120px;" >Document Date</td>
                                <td class="GridRowClear" style="width: 480px;" >
                                    <uc:FromToDateControl ID="ctrlDocDate" runat="server"
                                        MandatoryFrom="false"
                                        MandatoryTo="false" />
                                </td>
                            </tr>
                            <tr>
                                <td class="ComandRow2T" colspan="2" style="height: 30px; padding-top: 5px">
                                    <asp:Button ID="btSearch" runat="server" SkinID="skBtnFilter" />&nbsp;
                                    <asp:Button ID="btClear" runat="server" SkinID="skBtnClear" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <asp:Panel ID="pnlResults" runat="server" Visible="false">
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lbDocuments" runat="server" SkinID="skGridLabel" Text="Documents With Reservations"/>
                    <asp:LinkButton ID="lnkReport" runat="server" Text="Export to Excel"
                        style="float:right; color: White; padding: 4px; font-weight: bold;" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                    <asp:Repeater ID="rptPayments" runat="server" DataSourceID="dsFilteredDocuments">
                    <HeaderTemplate>
                        <table cellpadding="0" cellspacing="0" style="border-collapse: collapse; border: solid 1px;">
                            <tr>
                                <td class="PreRowHead" rowspan="2" style="border-top: 1px; width: 150px;">Proforma</td>
                                <td class="PreRowHead" rowspan="2" style="border-top: 1px; width: 20px;">&nbsp</td>
                                <td class="PreRowHead" rowspan="2" style="border-top: 1px; width: 250px;">Guest Name</td>
                                <td class="PreRowHead" rowspan="2" style="border-top: 1px; width: 100px;">Bk Number</td>
                                <td class="PreRowHead" rowspan="2" style="border-top: 1px; width: 80px;">Bill</td>
                                <td class="PreRowHead" rowspan="1" style="border-top: 1px; width: 180px;" colspan="2">Booking Total</td>
                                <td class="PreRowHead" rowspan="2" style="border-top: 1px; width: 10px;"></td>
                                <td class="PreRowHead" rowspan="1" style="border-top: 1px; width: 270px;" colspan="3">Accounting Document</td>
                            </tr>
                            <tr>
                                <td class="PreRowHead" style="width: 80px;">Applied</td>
                                <td class="PreRowHead" style="width: 80px;">Reserved</td>
                                <td class="PreRowHead" style="width: 90px;">Document</td>
                                <td class="PreRowHead" style="width: 80px;">Applied</td>
                                <td class="PreRowHead" style="width: 100px;">Reserved</td>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Panel ID="Panel1" runat="server" Visible='<%# Eval("rnk")=1 %>'>
                            <tr>
                                <td class="PreRowHeadSel" colspan="11" style="text-align: left;">
                                    <asp:Label ID="lblHotelName" runat="server" Text='<%# Eval("GroupText") %>'/>
                                </td>
                            </tr>
                        </asp:Panel>
                        <asp:Panel ID="Panel2" runat="server" Visible='<%# Eval("rnk")=2 %>'>
                            <tr>
                                <td class="PreRowHead" colspan="11" style="text-align: left;">
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("GroupText") %>'/>
                                </td>
                            </tr>
                        </asp:Panel>
                        <asp:Panel ID="Panel3" runat="server" Visible='<%# Eval("rnk")>2 %>'>
                            <tr>
                                <td class="PreRow" style="text-align: left; padding-left: 5px;">
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("InvDocNum","PF {0}") %>' />
                                </td>
                                <td class="PreRow" style="text-align: left; padding: 2px;">
                                    <asp:Image ID="imgState" runat="server" Width="17px" Height="17px"
                                        ImageUrl='<%# BookingStateIcon(Eval("InHouseState")) %>' />
                                </td>
                                <td class="PreRow" style="text-align: left;">
                                    <asp:Label ID="lblGuest" runat="server" Text='<%# Eval("PreInvText") %>' />
                                </td>
                                <td class="PreRow" >
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("BkNumber") %>' />
                                </td>
                                <td class="PreRow" style="text-align: right;">
                                    <asp:Label ID="Label3c" runat="server" Text='<%# Eval("InvResAmount","{0:N2}") %>' />
                                </td>
                                <td class="PreRow" style="text-align: right;">
                                    <asp:Label ID="Label36" runat="server" Text='<%# Eval("TotalAppAmount","{0:N2}") %>' />
                                </td>
                                <td class="PreRow" style="text-align: right;">
                                    <asp:Label ID="Label35" runat="server" Text='<%# Eval("TotalResAmount","{0:N2}") %>' />
                                </td>
                                <td class="PreRow" style="text-align: left; padding-left: 5px;" colspan="2">
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("DocCode") & " " & Eval("DocNumber") %>' />
                                </td>
                                <td class="PreRow" style="text-align: right;">
                                    <asp:Label ID="lblAppAmount" runat="server" Text='<%# Bind("AccAppAmount","{0:N2}") %>' />
                                </td>
                                <td class="PreRow" style="text-align: right;">
                                    <asp:Label ID="lblResAmount" runat="server" Text='<%# Bind("AccResAmount","{0:N2}") %>' />
                                    <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="false" 
                                        CommandName="payDelete" CommandArgument='<%# Eval("AccResID") %>'
                                        ImageUrl="~/Images/delete_inline.gif" CssClass="ImgButton"  style="padding-top:2px;"
                                        OnClientClick="return confirm('Are you sure you want to release this reservation?')" />
                                </td>
                            </tr>
                        </asp:Panel>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:Panel ID="pnlFootNoData" runat="server" Visible='<%# rptPayments.Items.Count < 1 %>'>
                            <tr>
                                <td class="PreRowHeadSel" style="height: 25px;" colspan="11">
                                    There are no accounting documents with pending reservations for the filter criteria
                                </td>
                            </tr>
                        </asp:Panel>
                        </table>
                    </FooterTemplate>
                    
                    </asp:Repeater>
                    </ContentTemplate>
                </asp:UpdatePanel>
                </td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="dsFilteredDocuments" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" 
            TypeName="dsAccountingEffectiveTableAdapters.AccTransDocReservationsTableAdapter">
            <SelectParameters>
                <asp:ControlParameter Name="HotelGroupId" ControlID="ctrlHotel" PropertyName="SelectedHotelGroup" Type="Int32" />
                <asp:ControlParameter Name="HotelID" ControlID="ctrlHotel" PropertyName="SelectedHotel" Type="Int32" />
                <asp:ControlParameter Name="TourOpKind" ControlID="ctrlTourOp" PropertyName="SelectedTourOpKind" Type="Int32" />
                <asp:ControlParameter Name="TourOpGroupId" ControlID="ctrlTourOp" PropertyName="SelectedTourOpGroup" Type="Int32" />
                <asp:ControlParameter Name="MarketId" ControlID="ctrlTourOp" PropertyName="SelectedMarket" Type="String" />
                <asp:ControlParameter Name="PayCondId" ControlID="ctrlTourOp" PropertyName="SelectedPayCond" Type="String" />
                <asp:ControlParameter Name="TourOpId" ControlID="ctrlTourOp" PropertyName="SelectedTourOp" Type="Int32" />
                <asp:ControlParameter Name="DocDateFrom" ControlID="ctrlDocDate" PropertyName="DateFrom" Type="String" />
                <asp:ControlParameter Name="DocDateTo" ControlID="ctrlDocDate" PropertyName="DateTo" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <uc:MessagePop ID="msgPop" runat="server" Title="Accounting Document Reservation" />
    </div>
    </asp:Panel>
</asp:Content>
