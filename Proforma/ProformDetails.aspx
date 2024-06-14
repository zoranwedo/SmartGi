<%@ Page Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="ProformDetails.aspx.vb" Inherits="Proforma_ProformDetails" enableEventValidation="false" %>

<%@ Register src="~/App_UserControls/MessagePop.ascx" tagname="MessagePop" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/ProcessingProgressControl.ascx" tagname="ProcessingProgressControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/InputDateControl.ascx" tagname="InputDateControl" tagprefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Proforma
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" runat="Server">

    <script type="text/javascript">
        function ShowChargeModal(InvoiceID) {
            var frame = $get('IframeCharge');
            var popup = $find('ChargeModalPopup');
            frame.src = "ProFormCharge.aspx?ProformaID=" + InvoiceID;
            popup._backgroundElement.onclick = function() { document.getElementById("dumyChargeClose").click(); }
            popup.show();
        }

        function ShowPrintModal(InvoiceID,Hotel) {
            var frame = $get('IframePrint');
            var popup = $find('PrintModalPopup');
            frame.src = "ProFormPrint.aspx?ProformaID=" + InvoiceID + "&Hotel=" + Hotel;
            popup._backgroundElement.onclick = function() { document.getElementById("dumyPrintClose").click(); }
            popup.show();
        }

        function ShowPrintModalGroup(InvoiceID, Hotel) {
            var frame = $get('IframePrint');
            var popup = $find('PrintModalPopup');
            frame.src = "ProFormPrint.aspx?ProformaID=" + InvoiceID + "&Hotel=" + Hotel;
            popup._backgroundElement.onclick = function() { document.getElementById("dumyPrintClose").click(); }
            popup.show();
        }

        function ShowPrintModalSingle(InvoiceID, Hotel) {
            var frame = $get('IframePrint');
            var popup = $find('PrintModalPopup');
            frame.src = "ProFormPrintSingle.aspx?ProformaID=" + InvoiceID;
            popup._backgroundElement.onclick = function() { document.getElementById("dumyPrintClose").click(); }
            popup.show();
        }

        function ShowBookingModal(InvoiceID, BookingID) {
            var frame = $get('IframeBooking');
            var popup = $find('BookingModalPopup');
            frame.src = "ProformBooking.aspx?ProformaID=" + InvoiceID + "&BookingID=" + BookingID;
            popup._backgroundElement.onclick = function() { document.getElementById("dummyBookingCancel").click(); }
            popup.show();
        }
        function BookingUpdated() {
            document.getElementById('<%=refreshHead.ClientID%>').click();
            document.getElementById('<%=refreshBooking.ClientID%>').click();
        }

    </script>

    <%--<Charge popup>--%>
    <asp:ModalPopupExtender runat="server" BackgroundCssClass="modalBackground" ID="chargePopExtender"
        X="200" Y="150" TargetControlID="dummyCharge" OkControlID="dumyChargeOk" CancelControlID="dumyChargeClose"
        PopupControlID="chargePopDiv" BehaviorID="ChargeModalPopup">
    </asp:ModalPopupExtender>
    <div style="display: none;">
        <asp:Button ID="dummyCharge" runat="server" />
        <input id="dumyChargeOk" value="Done" type="button" />
        <input id="dumyChargeClose" value="Cancel" type="button" />
    </div>
    <div id="chargePopDiv" style="display: none;">
        <iframe id="IframeCharge" frameborder="0" style="width: 600px; height: 600px; overflow: visible;"
            scrolling="no" marginheight="10px" marginwidth="10px"></iframe>
    </div>
    <%--</Charge popup>--%>
    
    <%--<Print popup>--%>
    <asp:ModalPopupExtender runat="server" BackgroundCssClass="modalBackground" ID="printPopupExtender"
        X="300" Y="100" TargetControlID="dummyPrint" OkControlID="dumyPrintOk" CancelControlID="dumyPrintClose"
        PopupControlID="printPopDiv" BehaviorID="PrintModalPopup">
    </asp:ModalPopupExtender>
    <div style="display: none">
        <asp:Button ID="dummyPrint" runat="server" />
        <input id="dumyPrintOk" value="Done" type="button" />
        <input id="dumyPrintClose" value="Cancel" type="button" />
    </div>
    <div id="printPopDiv" style="display: none;">
        <iframe id="IframePrint" frameborder="0" style="width: 600px; height: 600px; overflow: visible;"
            scrolling="no" marginheight="10px" marginwidth="10px"></iframe>
    </div>
    <%--</Print popup>--%>
    
    <div class="Blue">
        <uc:ProcessingProgressControl ID="upProcessing" runat="server"  />
        <div class="LocalMenuRow" style="padding-bottom: 2px;">
            <asp:HyperLink ID="linkBack" runat="server" SkinID="skHypLink" NavigateUrl="~/Proforma/Proformas.aspx" Text="&lt;&lt; Back to Proformas" />
        </div>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <asp:UpdatePanel ID="upHeader" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                    <asp:Button ID="refreshHead" runat="server" style="display: none;" />
                    <asp:FormView ID="fvInvoiceHead" runat="server" Width="100%" DataKeyNames="InvDocID" DataSourceID="dsProforma">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="GridLabelBG" colspan="4">
                                        <asp:Label ID="Label30" runat="server" SkinID="skGridLabel" Text='<%# "PF " & Eval("InvDocNum") %>' />
                                        <asp:Label ID="Label7" runat="server" SkinID="skGridLabel" Visible='<%# Eval("GroupName") Is DBNull.Value %>'
                                            style="color: Red; background-color: Transparent; font-style: italic; margin-left: 15px;">
                                            <span style="padding: 0px 5px; border-radius: 4px; background-color: White;"><h6><%#SourceText(Eval("SourcePMS"))%></h6></span>
                                        </asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 30px;">&nbsp;</td>
                                    <td class="GridRow1B" style="width: 120px;">
                                        <asp:Label ID="Label27" runat="server" Font-Bold="true" Font-Size="Larger"
                                            Text='<%# Iif(Eval("GroupName") Is DBNull.Value, "Single", "Group Code") %>' />
                                    </td>
                                    <td class="GridRow1B" style="width: 580px;" colspan="2">
                                        <asp:Label ID="GroupNameLabel" runat="server" Font-Bold="true" Font-Size="Larger"
                                            Text='<%# Eval("GroupName") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 30px;" rowspan="2">&nbsp;</td>
                                    <td class="GridRow1B"><b>Tour Operator</b></td>
                                    <td class="GridRow1B" colspan="2">
                                        <%--<asp:Label ID="TourOpLabel" runat="server" Text='<%# Eval("TourOp") %>' ToolTip='<%# Bind("TourOpID")%>' />--%>
                                        <small>(<%#Eval("TourOpID")%>)</small> <%# Eval("TourOp") %>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" style="vertical-align: top;"><b>Hotel</b></td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:Repeater ID="rpHotels" runat="server" DataSourceID="dsProformaHotel">
                                            <ItemTemplate>
                                                <%--<asp:Label ID="HotelLabel" runat="server" Text='<%# Eval("Hotel") %>' /><br />--%>
                                                <small>(<%#Eval("HotelID")%>)</small>  <%#Eval("Hotel")%>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </td>
                                </tr>
                                <asp:Panel ID="pnlGroup" runat="server" Visible='<%# Eval("GroupName") IsNot DBNull.Value %>'>
                                <tr>
                                    <td style="width: 30px;">&nbsp;</td>
                                    <td class="GridRow1B" style="vertical-align: top;"><b>Group Name</b></td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:Repeater ID="rptNames" runat="server" DataSourceID="dsProformaGroup">
                                            <ItemTemplate>
                                                <asp:Label ID="ResGroupNameLabel" runat="server" Text='<%# Eval("ResGroupName") %>' /><br />
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </td>
                                </tr>
                                </asp:Panel>
                                <asp:Panel ID="pnlSingle" runat="server" Visible='<%# Eval("GroupName") Is DBNull.Value %>'>
                                <tr>
                                    <td style="width: 30px;">&nbsp;</td>
                                    <td class="GridRow1B"><b>Proforma Date</b></td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("InvDocDate","{0:d}") %>' />
                                    </td>
                                </tr>
                                </asp:Panel>
                                <tr>
                                    <td style="width: 30px;" rowspan="7">&nbsp;</td>
                                    <td class="GridRow1B"><b>Check In</b></td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:Label ID="CheckInLabel1" runat="server"  Visible='<%# Eval("GroupName") IsNot DBNull.Value %>'
                                            Text='<%# GetCheckDates(Eval("CheckInFrom","{0:d}"), Eval("CheckInTo","{0:d}")) %>'
                                            ToolTip='<%# GetCheckDates(Eval("CheckInFrom","{0:D}"), Eval("CheckInTo","{0:D}")) %>' />
                                        <asp:Label ID="CheckInLabel2" runat="server"  Visible='<%# Eval("GroupName") Is DBNull.Value %>'
                                            Text='<%# Eval("CheckInFrom","{0:d}") %>'
                                            ToolTip='<%# Eval("CheckInFrom","{0:D}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B"><b>Check Out</b></td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:Label ID="CheckOutLabel" runat="server" 
                                            Text='<%# GetCheckDates(Eval("CheckOutFrom","{0:d}"), Eval("CheckOutTo","{0:d}")) %>'
                                            ToolTip='<%# GetCheckDates(Eval("CheckOutFrom","{0:D}"), Eval("CheckOutTo","{0:D}")) %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" style="vertical-align: top;"><b>Include Cancelled</b></td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:CheckBox ID="cbCancelled" runat="server" Checked='<%# Eval("Cancelled") %>' Enabled="false" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B"><b>Comment</b></td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("InvDocComment") %>' />
                                    </td>
                                </tr>

                                <tr>
                                    <td class="GridRowClear" style="vertical-align: top; padding: 3px 0px 4px 0px;"><b>Status</b></td>
                                    
                                    <td class="GridRowClear" style="padding: 3px 0px 4px 0px;">
                                        <asp:Label ID="InvDocStateLabel" runat="server" Text='<%# Eval("InvDocStateDesc") %>' />
                                        <i><asp:Label ID="ReviewDateLabel" runat="server" Text='<%# Eval("ReviewDate"," on {0:d}") %>' Visible='<%# Eval("InvDocState") = 3 %>'/></i>
                                        <i><asp:Label ID="DeliveryDateLabel" runat="server" Text='<%# Eval("DeliveryDate"," on {0:d}") %>' Visible='<%# Eval("InvDocState") = 5 %>'/></i>
                                        <asp:HiddenField ID="hfInvDocState" runat="server" Value='<%# Eval("InvDocState") %>' />
                                    </td>
                                    <td class="GridRowClear" style="text-align: right; padding: 3px 0px 4px 0px;">
                                        <asp:LinkButton ID="btReview" runat="server" SkinID="skBtnBase" Text="Reviewed" 
                                            Visible='<%# CanReview(Eval("InvDocState")) %>' style="margin-right: 10px;" />
                                        <asp:ModalPopupExtender ID="popReview" runat="server"
                                            TargetControlID="btReview"
                                            PopupControlID="reviewDiv"
                                            OkControlID="reviewOK"
                                            CancelControlID="reviewCancel"
                                            X="35" Y="303" />
                                        <asp:Panel ID="reviewDiv" runat="server" Width="600" style="display: none; padding: 5px; border: solid 2px; background-color: White;" >
                                            <div class="Red" style="width: 100%; text-align: left;">
                                                <b>Review Date:</b> 
                                                <uc:InputDateControl ID="ctrlReviewDate" runat="server" Mandatory="true" DefaultNow="true" />
                                                <div style="text-align: right; font-weight: bold; padding-top: 5px;">
                                                <asp:Button ID="reviewOK" runat="server" SkinID="skBtnBase" Text="OK" style="margin-right: 10px;" 
                                                    OnClick="reviewOK_Click" UseSubmitBehavior="false" />
                                                <asp:Button ID="reviewCancel" runat="server" SkinID="skBtnBase" Text="Cancel" style="margin-right: 5px;"
                                                     UseSubmitBehavior="false" />
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        
                                        <asp:LinkButton ID="btDeliver" runat="server" SkinID="skBtnBase" Text="Delivered" 
                                            Visible='<%# CanDeliver(Eval("InvDocState")) %>' style="margin-right: 10px;" />
                                        <asp:ModalPopupExtender ID="popDeliver" runat="server"
                                            TargetControlID="btDeliver"
                                            PopupControlID="deliverDiv"
                                            OkControlID="deliverOK"
                                            CancelControlID="deliverCancel"
                                            X="35" Y="303" />
                                        <asp:Panel ID="deliverDiv" runat="server" Width="600" style="display: none; padding: 5px; border: solid 2px; background-color: White;" >
                                            <div class="Red" style="width: 100%; text-align: left;">
                                                <b>Delivery Date:</b> 
                                                <uc:InputDateControl ID="ctrlDeliverDate" runat="server" Mandatory="true" DefaultNow="true" />
                                                <div style="text-align: right; font-weight: bold; padding-top: 5px;">
                                                <asp:Button ID="deliverOK" runat="server" SkinID="skBtnBase" Text="OK" style="margin-right: 10px;" 
                                                    OnClick="deliverOK_Click" UseSubmitBehavior="false" />
                                                <asp:Button ID="deliverCancel" runat="server" SkinID="skBtnBase" Text="Cancel" style="margin-right: 5px;" 
                                                     UseSubmitBehavior="false"/>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                        
                                        <asp:LinkButton ID="btUnreview" runat="server" SkinID="skBtnBase" Text="Not Reviewed" style="color: Red;"
                                            Visible='<%# CanUnreview(Eval("InvDocState")) %>' OnClick="btUnreview_Click" />
                                        
                                        <asp:LinkButton ID="btUndeliver" runat="server" SkinID="skBtnBase" Text="Not Delivered" style="color: Red;"
                                            Visible='<%# CanUndeliver(Eval("InvDocState")) %>' OnClick="btUndelver_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow2T Red" style="width: 120px; height: 30px; padding-top: 7px; vertical-align: top;">
                                        <div class="Green">
                                            <asp:Button ID="btnRefresh" runat="server" SkinID="skBtnBase" Text="Refresh Proforma"
                                                CommandName="cRefresh" Visible='<%# Not IsDefinitive %>'
                                                OnClientClick="return confirm('Are you sure you want to refresh Proforma from imported reservations?')" />
                                        </div>
                                    </td>
                                    <td class="GridRow2T Red" style="width: 200px; padding-top: 7px; vertical-align: top;">
                                        <asp:Button ID="btnDelete" runat="server" SkinID="skBtnBase" Text="Delete" CommandName="cDelete"
                                            Visible='<%# Not (IsDefinitive OR IsCancelled) %>' CommandArgument='<%# Eval("GroupName") IsNot DBNull.Value %>'
                                            OnClientClick="return confirm('Are you sure you want to delete Proforma?')" />
                                    </td>
                                    <td class="GridRow2T" style="width: 380px; padding-top: 7px; text-align: right; vertical-align: top;">
                                        <asp:LinkButton ID="btnCharge" runat="server" Text="Proforma Charge" Font-Bold="true" 
                                            Visible='<%# Eval("GroupName") IsNot DBNull.Value %>'
                                            OnClientClick='<%# ShowChargeModalText() %>' />
                                        &nbsp;
                                        <asp:Button ID="btnEdit" runat="server" SkinID="skBtnBase" Width="100px" Text="Edit"
                                            CommandName="Edit" Visible='<%# Not (IsDefinitive OR IsCancelled) %>' />
                                        &nbsp;
                                        <asp:Button ID="btnPrint" runat="server" SkinID="skBtnBase" Width="100px" Text="Print" 
                                            CommandName="Print" OnClientClick='<%# ShowPrintModalText(Eval("GroupName") IsNot DBNull.Value) %>' />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="GridLabelBG" colspan="5">
                                        <asp:Label ID="Label30" runat="server" SkinID="skGridLabel" Text='<%# "(" & Eval("InvDocID") & ") PF " & Eval("InvDocNum") %>' />
                                    </td>
                                </tr>
                                <asp:Panel ID="pnlGroup" runat="server" Visible='<%# Eval("GroupName") IsNot DBNull.Value %>'>
                                <tr>
                                    <td style="width: 30px;">&nbsp;</td>
                                    <td class="GridRow1B" style="width: 120px;"><b>Group Code</b></td>
                                    <td class="GridRow1B" style="width: 580px;" colspan="2">
                                        <asp:Label ID="GroupNameLabel" runat="server" Text='<%# Eval("GroupName") %>' />
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 30px;" rowspan="8">&nbsp;</td>
                                    <td class="GridRow1B">
                                        <b>Tour Operator</b>
                                    </td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:DropDownList ID="ddlTO" runat="server" CssClass="TextBox" />
                                        <asp:CascadingDropDown ID="exTO" runat="server" 
                                            TargetControlID="ddlTO" Category="TourOpID" 
                                            SelectedValue='<%# Eval("TourOpID") %>'
                                            ServicePath="~/TOGroup.asmx"
                                            ServiceMethod="GetGroupTTOOs" >
                                        </asp:CascadingDropDown>
                                    </td>
                                    <td rowspan="8">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" style="vertical-align: top;">
                                        <b>Hotel</b>
                                    </td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:ListBox ID="lbHotel" runat="server" CssClass="TextBox" Width="95%" OnDataBound="listHotels_DataBound" />
                                        <asp:ImageButton ID="btnCloseHotel" runat="server" ImageUrl="~/Images/Collapse.gif"
                                            BorderStyle="Dotted" BorderWidth="1px" BackColor="Control" OnClick="btnCloseHotel_Click" />
                                        <asp:PopupControlExtender ID="popHotel" runat="server" CommitProperty="Text" PopupControlID="tvPanel"
                                            Position="Bottom" TargetControlID="lbHotel">
                                        </asp:PopupControlExtender>
                                        <asp:Panel ID="tvPanel" runat="server" BackColor="White" BorderStyle="solid" BorderWidth="1px"
                                            ScrollBars="Auto" Height="250px" Width="460px">
                                            <asp:CheckBoxList ID="listHotels" runat="server" OnDataBound="listHotels_DataBound" />
                                        </asp:Panel>
                                        <asp:ObjectDataSource runat="server" OldValuesParameterFormatString="original_{0}"
                                            ID="dsAllHotels" TypeName="dsProformaTableAdapters.HotelTableAdapter" SelectMethod="GetData" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        <b>Check In</b>
                                    </td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:TextBox ID="txtCheckInFrom" runat="server" CssClass="TextBox" Width="45%" Text='<%# Eval("CheckInFrom","{0:d}") %>' />
                                        <asp:CalendarExtender ID="txtCheckInFrom_Calendar" runat="server" CssClass="cal_Theme1"
                                            TargetControlID="txtCheckInFrom" />
                                        <asp:CompareValidator ID="valCheckInFromDate" runat="server" Display="None" Operator="DataTypeCheck"
                                            Type="Date" ErrorMessage="Not a valid date!" ControlToValidate="txtCheckInFrom" />
                                        <asp:ValidatorCalloutExtender ID="extCheckInFromDate" runat="server" TargetControlID="valCheckInFromDate"
                                            Enabled="True" />
                                        &nbsp;to&nbsp;
                                        <asp:TextBox ID="txtCheckInTo" runat="server" CssClass="TextBox" Width="45%" Text='<%# Eval("CheckInTo","{0:d}") %>' />
                                        <asp:CalendarExtender ID="txtCheckInTo_Calendar" runat="server" CssClass="cal_Theme1"
                                            TargetControlID="txtCheckInTo" />
                                        <asp:CompareValidator ID="valCheckInToDate" runat="server" Display="None" Operator="DataTypeCheck"
                                            Type="Date" ErrorMessage="Not a valid date!" ControlToValidate="txtCheckInTo" />
                                        <asp:ValidatorCalloutExtender ID="extCheckInToDate" runat="server" TargetControlID="valCheckInToDate"
                                            Enabled="True" />
                                    </td>
                                </tr>
                                </asp:Panel>
                                <asp:Panel ID="pnlSingle" runat="server" Visible='<%# Eval("GroupName") Is DBNull.Value %>'>
                                <tr>
                                    <td style="width: 30px;">&nbsp;</td>
                                    <td class="GridRow1B" style="width: 120px;">
                                        <asp:Label ID="Label27" runat="server" Font-Bold="true" Font-Size="Larger" Text="Single" />
                                    </td>
                                    <td class="GridRow1B" style="width: 580px;" colspan="2">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td style="width: 30px;" rowspan="9">&nbsp;</td>
                                    <td class="GridRow1B"><b>Tour Operator</b></td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:Label ID="TourOpLabel" runat="server" Text='<%# Eval("TourOp") %>' ToolTip='<%# Bind("TourOpID")%>' />
                                    </td>
                                    <td rowspan="9">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" style="vertical-align: top;"><b>Hotel</b></td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:Repeater ID="rpHotels" runat="server" DataSourceID="dsProformaHotel">
                                            <ItemTemplate>
                                                <asp:Label ID="HotelLabel" runat="server" Text='<%# Eval("Hotel") %>' /><br />
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        <b>Proforma Date</b>
                                    </td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:TextBox ID="txtProformaDate" runat="server" CssClass="TextBox" Text='<%# Eval("InvDocDate","{0:d}") %>' />
                                        <asp:CalendarExtender ID="txtProformaDate_Calendar" runat="server" CssClass="cal_Theme1" TargetControlID="txtProformaDate" />
                                        <asp:CompareValidator ID="valProformaDate" runat="server" Display="None" Operator="DataTypeCheck"
                                            Type="Date" ErrorMessage="Not a valid date!" ControlToValidate="txtProformaDate" />
                                        <asp:ValidatorCalloutExtender ID="extProformaDate" runat="server" TargetControlID="valProformaDate" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B"><b>Check In</b></td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:Label ID="CheckInLabel2" runat="server"  Text='<%# Eval("CheckInFrom","{0:d}") %>' />
                                    </td>
                                </tr>
                                </asp:Panel>
                                <tr>
                                    <td class="GridRow1B">
                                        <b>Check Out</b>
                                    </td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:TextBox ID="txtCheckOutFrom" runat="server" CssClass="TextBox" Width="45%" Text='<%# Eval("CheckOutFrom","{0:d}") %>' />
                                        <asp:CalendarExtender ID="txtCheckOutFrom_Calendar" runat="server" CssClass="cal_Theme1"
                                            TargetControlID="txtCheckOutFrom" />
                                        <asp:CompareValidator ID="valCheckOutFromDate" runat="server" Display="None" Operator="DataTypeCheck"
                                            Type="Date" ErrorMessage="Not a valid date!" ControlToValidate="txtCheckOutFrom" />
                                        <asp:ValidatorCalloutExtender ID="extCheckOutFromDate" runat="server" TargetControlID="valCheckOutFromDate"
                                            Enabled="True" />
                                        &nbsp;to&nbsp;
                                        <asp:TextBox ID="txtCheckOutTo" runat="server" CssClass="TextBox" Width="45%" Text='<%# Eval("CheckOutTo","{0:d}") %>' />
                                        <asp:CalendarExtender ID="txtCheckOutTo_Calendar" runat="server" CssClass="cal_Theme1"
                                            TargetControlID="txtCheckOutTo" />
                                        <asp:CompareValidator ID="valCheckOutToDate" runat="server" Display="None" Operator="DataTypeCheck"
                                            Type="Date" ErrorMessage="Not a valid date!" ControlToValidate="txtCheckOutTo" />
                                        <asp:ValidatorCalloutExtender ID="extCheckOutToDate" runat="server" TargetControlID="valCheckOutToDate"
                                            Enabled="True" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" style="vertical-align: top;">
                                        <b>Include Cancelled</b>
                                    </td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:CheckBox ID="cbCancelled" runat="server" Checked='<%# Eval("Cancelled") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        <b>Comment</b>
                                    </td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:TextBox ID="txtComment" runat="server" CssClass="TextBox" Text='<%# Eval("InvDocComment") %>' />
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td class="GridRowClear" style="vertical-align: top; padding: 3px 0px;">
                                        <b>Status</b>
                                    </td>
                                    <td class="GridRowClear" colspan="2" style="padding: 3px 0px;">
                                        <asp:Label ID="InvDocStateLabel" runat="server" Text='<%# Eval("InvDocStateDesc") %>' />
                                        <asp:Label ID="ReviewDateLabel" runat="server" Text='<%# Eval("ReviewDate","{0:d}") %>' Visible='<%# Eval("InvDocState") = 3 %>'/>
                                        <asp:Label ID="DeliveryDateLabel" runat="server" Text='<%# Eval("DeliveryDate","{0:d}") %>' Visible='<%# Eval("InvDocState") = 5 %>'/>
                                        <asp:HiddenField ID="hfInvDocState" runat="server" Value='<%# Eval("InvDocState") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow2T" style="width: 120px; height: 40px;">
                                        &nbsp;
                                    </td>
                                    <td class="GridRow2T Red" style="width: 200px; margin-top: 2px; padding-top: 5px;">
                                    </td>
                                    <td class="GridRow2T" style="width: 380px; margin-top: 2px; padding-top: 5px; text-align: right;">
                                        <asp:Button ID="btnUpdate" runat="server" CommandName="cUpdate" SkinID="skBtnBase"
                                            Text="Update" Width="100px" CommandArgument='<%# Eval("GroupName") IsNot DBNull.Value %>'
                                            OnClientClick="return confirm('Are you sure you want to update Proforma Criteria?')" />
                                        &nbsp;
                                        <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" SkinID="skBtnBase"
                                            Text="Cancel" Width="100px" CausesValidation="false" />
                                    </td>
                                </tr>
                            </table>
                        </EditItemTemplate>
                    </asp:FormView>
                        <uc:MessagePop ID="msgPopHead" runat="server" Title="Proforma" />
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="fvInvoiceHead" EventName="ItemCommand" />
                            <asp:AsyncPostBackTrigger ControlID="refreshHead" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <br />
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top;">
                    <asp:HiddenField ID="hdProformaAmount" runat="server" />
                    <div style="padding-bottom: 5px; background-image: url(../Images/BlueFullSmall.gif); background-position: center; height: 20px; ">
                        <span style="padding: 5px; background-color: White; border-top: solid 2px; border-right: solid 2px; border-bottom: solid 2px White; border-left: solid 2px; font-weight: bold; font-size: larger;" >
                            Proforma Details
                        </span>
                        <asp:LinkButton ID="lbPayments" runat="server" Text="Proforma Payments"
                            style="font-weight: bold; color: White; padding: 5px 10px 5px 10px; border-top: solid 2px; border-right: solid 2px; text-decoration: none;" />
                        <asp:LinkButton ID="lbLog" runat="server" Text="Change Log"
                            style="font-weight: bold; color: White; padding: 5px 10px 5px 10px; border-top: solid 2px; border-right: solid 2px; text-decoration: none;" />
                    </div>
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="border: solid 2px; padding: 8px;" >
                            <asp:UpdatePanel ID="upDetail" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>

                                <%--<Booking popup>--%>
                                <asp:Button ID="refreshBooking" runat="server" style="display: none;" />
                                <asp:ModalPopupExtender runat="server" BackgroundCssClass="modalBackground" ID="bookingPopExtender"
                                    X="70" Y="130" TargetControlID="dummyBooking" OkControlID="dummyBookingOK" CancelControlID="dummyBookingCancel"
                                    PopupControlID="bookingPopDiv" OnOkScript="BookingUpdated();" BehaviorID="BookingModalPopup">
                                </asp:ModalPopupExtender>
                                <div style="display: none">
                                    <asp:Button ID="dummyBooking" runat="server" style="display: none;" />
                                    <input id="dummyBookingOK" value="Done" type="button" />
                                    <input id="dummyBookingCancel" value="Cancel" type="button" />
                                </div>
                                <div id="bookingPopDiv" style="display: none;">
                                    <iframe id="IframeBooking" frameborder="0" style="width: 1320px; height: 550px; overflow: visible;"
                                        scrolling="no" marginheight="10px" marginwidth="10px"></iframe>
                                </div>
                                <%--</Booking popup>--%>
                                
                                <asp:Repeater ID="rptProforma" runat="server" DataSourceID="dsDetails" >
                                    <HeaderTemplate>
                                        <table cellpadding="0" cellspacing="0" style="border-collapse: collapse; border: solid 1px;">
                                            <tr>
                                                <td class="PreRowHead" rowspan="2" style="width: 20px;">
                                                    &nbsp;
                                                </td>
                                                <td class="PreRowHead" rowspan="2" style="width: 240px;">
                                                    Guest Name
                                                </td>
                                                <td class="PreRowHead" rowspan="2" style="width: 100px;">
                                                    Bk Number
                                                </td>
                                                <td class="PreRowHead" rowspan="2" style="width: 100px;">
                                                    Rate
                                                </td>
                                                <td class="PreRowHead" rowspan="2" style="width: 80px;">
                                                    Bk.Date
                                                    <span style="font-size: x-small">(M/D/YYYY)</span>
                                                </td>
                                                <td class="PreRowHead" rowspan="2" style="width: 80px;">
                                                    Arrival
                                                    <span style="font-size: x-small">(M/D/YYYY)</span>
                                                </td>
                                                <td class="PreRowHead" rowspan="2" style="width: 80px;">
                                                    Departure
                                                    <span style="font-size: x-small">(M/D/YYYY)</span>
                                                </td>
                                                <td class="PreRowHead" rowspan="2" style="width: 30px;">
                                                    #Nts
                                                </td>
                                                <td class="PreRowHead" rowspan="2" style="width: 50px;">
                                                    Room
                                                </td>
                                                <td class="PreRowHead" rowspan="1" style="width: 150px;" colspan="5">
                                                    Pax
                                                </td>
                                                <td class="PreRowHead" rowspan="2" style="width: 80px;">
                                                    Bill
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="PreRowHead" style="width: 30px;">
                                                    Ad
                                                </td>
                                                <td class="PreRowHead" style="width: 30px;">
                                                    Inf
                                                </td>
                                                <td class="PreRowHead" style="width: 30px;">
                                                    Ch
                                                </td>
                                                <td class="PreRowHead" style="width: 30px;">
                                                    Jun
                                                </td>
                                                <td class="PreRowHead" style="width: 30px;">
                                                    Jun2
                                                </td>
                                            </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <asp:Panel ID="pnlHotel" runat="server" Visible='<%# Eval("rnH")=0 %>'>
                                                <td class="PreRowHeadSel" colspan="15" style="text-align: left;">
                                                    <%# Eval("Hotel") %>
                                                </td>
                                            </asp:Panel>
                                            <asp:Panel ID="Panel3" runat="server" Visible='<%# Eval("rnH")>0 %>'>
                                                <asp:Panel ID="Panel2" runat="server" Visible='<%# Eval("rnR")>1 %>'>
                                                    <td class="PreRow" style="border-style: none none none solid;">&nbsp;</td>
                                                    <td class="PreRow" style="border-style: none solid none none;">&nbsp;</td>
                                                    <td class="PreRow" style="border-style: none solid none none;">&nbsp;</td>
                                                </asp:Panel>
                                                <asp:Panel ID="Panel1" runat="server" Visible='<%# Eval("rnR")=1 %>'>
                                                    <td class="PreRow" style="border-style: solid none none solid; text-align: left; padding: 2px;">
                                                        <asp:ImageButton ID="ibSelect" runat="server" Width="17px" Height="17px" CausesValidation="False"
                                                            ImageUrl='<%# BookingStateIcon(Eval("InHouseState")) %>'
                                                            Visible='<%# Eval("rnR")=1 %>' ToolTip='<%# Eval("BookingID") %>'
                                                            OnClientClick='<%# ShowBookingModalText(Eval("BookingID")) %>' />
                                                    </td>
                                                    <td class="PreRow" style="border-style: solid solid none none; text-align: left;">
                                                        <asp:LinkButton ID="lbSelect" runat="server" Text='<%# Eval("PreInvText") %>' CausesValidation="false"
                                                            Visible='<%# Eval("rnR")=1 %>' ToolTip='<%# Eval("FolioFull") %>' 
                                                            OnClientClick='<%# ShowBookingModalText(Eval("BookingID")) %>' />
                                                    </td>
                                                    <td class="PreRow" style="border-style: solid solid none solid;">
                                                        <asp:Label ID="Label1" runat="server" Visible='<%# Eval("rnR")=1 %>' Text='<%# Eval("BkNumber") %>' />
                                                    </td>
                                                </asp:Panel>
                                                <td class="PreRow" style="text-align: left;">
                                                    <%# Eval("RateCodeID") %>
                                                </td>
                                                <td class="PreRow">
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("BkDate","{0:d}") %>' ToolTip='<%# Eval("BkDate","{0:D}") %>' />
                                                    <%--<%# Eval("BkDate","{0:d}") %>--%>
                                                </td>
                                                <td class="PreRow">
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Arrival","{0:d}") %>' ToolTip='<%# Eval("Arrival","{0:D}") %>' />
                                                    <%--<%# Eval("Arrival","{0:d}") %>--%>
                                                </td>
                                                <td class="PreRow">
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Departure","{0:d}") %>' ToolTip='<%# Eval("Departure","{0:D}") %>' />
                                                    <%--<%# Eval("Departure","{0:d}") %>--%>
                                                </td>
                                                <td class="PreRow">
                                                    <%# Eval("Nights") %>
                                                </td>
                                                <td class="PreRow">
                                                    <%# Eval("RoomTypeID") %>
                                                </td>
                                                <td class="PreRow">
                                                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("Adult") %>' Visible='<%# Not Eval("Adult")=0 %>' />
                                                </td>
                                                <td class="PreRow">
                                                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("Infant") %>' Visible='<%# Not Eval("Infant")=0 %>' />
                                                </td>
                                                <td class="PreRow">
                                                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("Child") %>' Visible='<%# Not Eval("Child")=0 %>' />
                                                </td>
                                                <td class="PreRow">
                                                    <asp:Label ID="Label12" runat="server" Text='<%# Eval("Junior1") %>' Visible='<%# Not Eval("Junior1")=0 %>' />
                                                </td>
                                                <td class="PreRow">
                                                    <asp:Label ID="Label13" runat="server" Text='<%# Eval("Junior2") %>' Visible='<%# Not Eval("Junior2")=0 %>' />
                                                </td>
                                                <td class="PreRow" style="text-align: right;">
                                                    <asp:Label ID="Label3c" runat="server" Text='<%# Eval("InvResAmount","{0:N2}") %>'
                                                        Visible='<%# AmountShow(Eval("InHouseState"),Eval("Penalty")) %>'
                                                        ForeColor='<%# PenaltyColor(Eval("Penalty")) %>' />
                                                    <asp:Label ID="Label3canc" runat="server" Text="Canceled" Visible='<%# Not AmountShow(Eval("InHouseState"),Eval("Penalty")) %>'
                                                        Style="float: left; color: Red; padding-left: 2px; font-style: italic;" />
                                                </td>
                                            </asp:Panel>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Panel ID="pnlFootData" runat="server" Visible='<%# rptProforma.Items.Count > 0 %>'>
                                            <tr>
                                                <td class="PreRowHead" style="text-align: right; border-right: solid 1px; padding-right: 5px;" colspan="14">
                                                    TOTAL
                                                </td>
                                                <td class="PreRowHead" style="text-align: right; font-style: normal;">
                                                    <%# hdProformaAmount.Value %>
                                                </td>
                                            </tr>
                                        </asp:Panel>
                                        <asp:Panel ID="pnlFootNoData" runat="server" Visible='<%# rptProforma.Items.Count < 1 %>'>
                                            <tr>
                                                <td class="PreRowHeadSel" style="height: 25px;" colspan="14">
                                                    Proforma has no reservations at the moment
                                                </td>
                                            </tr>
                                        </asp:Panel>
                                        </table></FooterTemplate>
                                </asp:Repeater>
                                <%--<uc:MessagePop ID="msgPopDetail" runat="server" Title="Proforma" />--%>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="rptProforma" />
                                    <asp:AsyncPostBackTrigger ControlID="refreshBooking" />
                                </Triggers>
                            </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    
    <asp:ObjectDataSource ID="dsProforma" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByID" TypeName="dsProformaTableAdapters.InvDocumentTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="13" Name="InvDocID" QueryStringField="ProformaID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsProformaGroup" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="dsProformaTableAdapters.vwInvResDocGroupNameTableAdapter">
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
    <asp:ObjectDataSource ID="dsDetails" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByID" TypeName="dsProformaTableAdapters.InvDocItemsTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="13" Name="InvDocID" QueryStringField="ProformaID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
