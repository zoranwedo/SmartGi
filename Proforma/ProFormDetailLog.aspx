<%@ Page Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="ProFormDetailLog.aspx.vb" Inherits="Proforma_ProFormDetailLog" enableEventValidation="false" %>

<%@ Register src="~/App_UserControls/MessagePop.ascx" tagname="MessagePop" tagprefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Proforma
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" runat="Server">
    <div class="Blue">
        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
            <ProgressTemplate>
                <div id="Div1" runat="server"
                    style="z-index: 100; 
                           position: fixed;
                           top: 50%; left: 50%;
                           transform: translate(-50%, -50%);
                           -webkit-transform: translate(-50%, -50%);
                           -moz-transform: translate(-50%, -50%);
                           -o-transform: translate(-50%, -50%);
                           -ms-transform: translate(-50%, -50%);
                           text-align: center;
                           width: 90%; height: 50px; padding-top: 20px;
                           border: dotted 1px; border-radius: 10px; 
                           background: White; filter: alpha(opacity=20); 
                           -moz-opacity:.8; opacity:.8;">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/status_anim.gif" />
                    <b>Processing...</b>
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <div class="LocalMenuRow" style="padding-bottom: 2px;">
            <asp:HyperLink ID="linkBack" runat="server" SkinID="skHypLink" NavigateUrl="~/Proforma/Proformas.aspx" Text="&lt;&lt; Back to Proformas" />
        </div>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <asp:UpdatePanel ID="upHeader" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:FormView ID="fvInvoiceHead" runat="server" Width="100%" DataKeyNames="InvDocID" DataSourceID="dsProforma">
                                <ItemTemplate>
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="GridLabelBG" colspan="3">
                                                <asp:Label ID="Label30" runat="server" SkinID="skGridLabel" Text='<%# "PF " & Eval("InvDocNum") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 30px;">&nbsp;</td>
                                            <td class="GridRow1B" style="width: 120px;">
                                                <asp:Label ID="Label27" runat="server" Font-Bold="true" Font-Size="Larger"
                                                    Text='<%# Iif(Eval("GroupName") Is DBNull.Value, "Single", "Group") %>' />
                                            </td>
                                            <td class="GridRow1B" style="width: 480px;">
                                                <asp:Label ID="GroupNameLabel" runat="server" Font-Bold="true" Font-Size="Larger"
                                                    Text='<%# Eval("GroupName") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 30px;" rowspan="7">&nbsp;</td>
                                            <td class="GridRow1B" style="width: 120px;"><b>Tour Operator</b></td>
                                            <td class="GridRow1B" style="width: 480px;">
                                                <%--<asp:Label ID="TourOpLabel" runat="server" Text='<%# Eval("TourOp") %>' ToolTip='<%# Bind("TourOpID")%>' />--%>
                                                <small>(<%#Eval("TourOpID")%>)</small> <%# Eval("TourOp") %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="GridRow1B" style="vertical-align: top;"><b>Hotel</b></td>
                                            <td class="GridRow1B">
                                                <asp:Repeater ID="rpHotels" runat="server" DataSourceID="dsProformaHotel">
                                                    <ItemTemplate>
                                                        <%--<asp:Label ID="HotelLabel" runat="server" Text='<%# Eval("Hotel") %>' /><br />--%>
                                                        <small>(<%#Eval("HotelID")%>)</small>  <%#Eval("Hotel")%>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="GridRow1B"><b>Check In</b></td>
                                            <td class="GridRow1B">
                                                <asp:Label ID="CheckInLabel1" runat="server"  Visible='<%# Eval("GroupName") IsNot DBNull.Value %>'
                                                    Text='<%# GetCheckDates(Eval("CheckInFrom","{0:d}"), Eval("CheckInTo","{0:d}")) %>' />
                                                <asp:Label ID="CheckInLabel2" runat="server"  Visible='<%# Eval("GroupName") Is DBNull.Value %>'
                                                    Text='<%# Eval("CheckInFrom","{0:d}") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="GridRow1B"><b>Check Out</b></td>
                                            <td class="GridRow1B">
                                                <asp:Label ID="CheckOutLabel" runat="server" Text='<%# GetCheckDates(Eval("CheckOutFrom","{0:d}"), Eval("CheckOutTo","{0:d}")) %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="GridRow1B" style="vertical-align: top;"><b>Include Cancelled</b></td>
                                            <td class="GridRow1B">
                                                <asp:CheckBox ID="cbCancelled" runat="server" Checked='<%# Eval("Cancelled") %>' Enabled="false" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="GridRowClear" style="vertical-align: top;"><b>State</b></td>
                                            <td class="GridRowClear">
                                                <asp:Label ID="InvDocStateLabel" runat="server" Text='<%# Eval("InvDocStateDesc") %>' />
                                                <asp:HiddenField ID="hfInvDocState" runat="server" Value='<%# Eval("InvDocState") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="GridRow2T" style="height: 30px;" colspan="2">&nbsp;</td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:FormView>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="fvInvoiceHead" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <br />
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top;">
                    <div style="padding-bottom: 5px; background-image: url(../Images/BlueFullSmall.gif); background-position: center; height: 20px; ">
                        <asp:LinkButton ID="lbDetails" runat="server" Text="Proforma Details"
                            style="font-weight: bold; color: White; padding: 5px 10px 5px 10px; border-top: solid 2px; border-right: solid 2px; text-decoration: none;" />
                        <asp:LinkButton ID="lbPayments" runat="server" Text="Proforma Payments"
                            style="font-weight: bold; color: White; padding: 5px 10px 5px 10px; border-top: solid 2px; text-decoration: none;" />
                        <span style="padding: 5px; background-color: White; border-top: solid 2px; border-right: solid 2px; border-bottom: solid 2px White; border-left: solid 2px; font-weight: bold; font-size: larger;" >
                            Change Log
                        </span>
                    </div>
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="border: solid 2px; padding: 8px;" >
                                <asp:UpdatePanel ID="upDetail" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <table cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td class="PreLogHead" colspan="2">
                                                    <asp:DropDownList ID="dlLog" runat="server" CssClass="PreLogControl normal" AutoPostBack="True">
                                                        <asp:ListItem Text="Proforma" Value="1" Selected="True" />
                                                        <asp:ListItem Text="Preinvoice" Value="2" />
                                                        <asp:ListItem Text="Booking" Value="3" />
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="PreLogHead" colspan="2">
                                                    <asp:DropDownList ID="dlProformaLog" runat="server" CssClass="PreLogControl normal">
                                                        <asp:ListItem Text="Full log" Value="1" Selected="True" />
                                                        <asp:ListItem Text="Proforma only" Value="2" />
                                                    </asp:DropDownList>
                                                    <asp:DropDownList ID="dlBookingLog" runat="server" CssClass="PreLogControl normal"
                                                        Visible="False" DataSourceID="dsLogForm" DataTextField="ForBooking" DataValueField="BookingID" />
                                                    <asp:DropDownList ID="dlReservationLog" runat="server" CssClass="PreLogControl normal"
                                                        Visible="False" DataSourceID="dsLogForm" DataTextField="ForReservation" DataValueField="FolioFull" />
                                                </td>
                                                <td class="PreLogHead" colspan="2">
                                                    <asp:LinkButton ID="btLogGo" runat="server">ShowLog</asp:LinkButton>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="PreRowHead" style="width: 120px;">Time</td>
                                                <td class="PreRowHead" style="width: 80px;">User</td>
                                                <td class="PreRowHead" style="width: 400px;">Booking</td>
                                                <td class="PreRowHead" style="width: 50px;">Detail</td>
                                                <td class="PreRowHead" style="width: 450px;">Log</td>
                                                <td class="PreRowHead" style="width: 100px;">Amount</td>
                                            </tr>
                                            <asp:Repeater ID="rptLog" runat="server">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td class="PreRow" style="text-align: left; border-style: none solid solid solid;">
                                                            <asp:Label ID="lblDate" runat="server" Text='<%# Eval("LogTime","{0:d}") %>' />
                                                            <asp:Label ID="lblTime" runat="server" Text='<%# Eval("LogTime","{0:t}") %>' />
                                                        </td>
                                                        <td class="PreRow" style="text-align: left; border-style: none solid solid none;">
                                                            <asp:Label ID="Label15" runat="server" Text='<%# Eval("LogUser") %>' />
                                                        </td>
                                                        <td class="PreRow" style="text-align: left; border-style: none solid solid none;">
                                                            <asp:Label ID="Label19" runat="server" Text='<%# "[" & Eval("BookingID") & "]" %>' Visible='<%# Not Eval("BookingID") Is DBNull.Value %>' />
                                                            <asp:Label ID="Label20" runat="server" Text='<%# Eval("GuestName") %>' Visible='<%# Not Eval("GuestName") Is DBNull.Value %>' />
                                                            <asp:Label ID="Label21" runat="server" Text='<%# "(" &  Eval("FolioFull") & ")" %>' Visible='<%# Not Eval("FolioFull") Is DBNull.Value %>' />
                                                        </td>
                                                        <td class="PreRow" style="text-align: left; border-style: none solid solid none;">
                                                            <asp:Label ID="Label17" runat="server" Text='<%# Eval("InvResID") %>' />
                                                        </td>
                                                        <td class="PreRow" style="text-align: left; border-style: none solid solid none;">
                                                            <asp:Label ID="Label16" runat="server" Text='<%# Eval("LogMessage") %>' />
                                                        </td>
                                                        <td class="PreRow" style="text-align: right; border-style: none solid solid none;">
                                                            <asp:Label ID="Label22" runat="server" Text='<%# Eval("Amount","{0:N2}") %>' 
                                                                Visible='<%# Eval("BookingID") Is DBNull.Value %>' 
                                                                Style="padding-right: 43px;" />
                                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Amount","{0:N2}") %>' 
                                                                Visible='<%# Not Eval("BookingID") Is DBNull.Value AND Eval("InvResID") Is DBNull.Value %>'
                                                                Style="padding-right: 23px;" />
                                                            <asp:Label ID="Label23" runat="server" Text='<%# Eval("Amount","{0:N2}") %>'
                                                                Visible='<%# Not Eval("InvResID") Is DBNull.Value %>' 
                                                                Style="padding-right: 3px;" />
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </table>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="btLogGo" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <uc:MessagePop ID="msgPop" runat="server" Title="Account Statement Report" />
    </div>
    
    
    <asp:ObjectDataSource ID="dsProforma" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByID" TypeName="dsProformaTableAdapters.InvDocumentTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="13" Name="InvDocID" QueryStringField="ProformaID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsProformaHotel" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByID" TypeName="dsProformaTableAdapters.InvDocumentHotelTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="13" Name="InvDocID" QueryStringField="ProformaID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsLogForm" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByID" TypeName="dsProformaTableAdapters.LogItemsTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="13" Name="InvDocID" QueryStringField="ProformaID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsLogTable" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByID" TypeName="dsProformaTableAdapters.LogTableTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="13" Name="InvDocID" QueryStringField="ProformaID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
