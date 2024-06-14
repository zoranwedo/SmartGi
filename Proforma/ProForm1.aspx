<%@ Page Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="ProForm1.aspx.vb" Inherits="Proforma_ProForm1" enableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Proforma
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" runat="Server">

    <script type="text/javascript">
        function ClientItemSelected(sender, e) {
            $get("<%=hfTourOpID.ClientID %>").value = e.get_value();
        }
        function ShowStayModal(BillingID) {
            var frame = $get('IframeStay');
            var popup = $find('StayModalPopup')
            frame.src = "ProFormSGrid.aspx?BillingID=" + BillingID;
            popup._backgroundElement.onclick = function() { document.getElementById("dumyStayCancel").click(); }
            popup.show();
        }
        function RateUpdated() {
            document.getElementById('<%=dumyRefresh.ClientID%>').click();
        }

        function ShowSuppModal(DetailID, InvoiceID) {
            var frame = $get('IframeSupp');
            var popup = $find('SuppModalPopup')
            frame.src = "ProFormPGrid.aspx?DetailID=" + DetailID + "&InvoiceID=" + InvoiceID;
            popup._backgroundElement.onclick = function() { document.getElementById("dumySuppCancel").click(); }
            popup.show();
        }
        function SuppUpdated() {
            document.getElementById('<%=dumyRefresh.ClientID%>').click();
        }

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

        function ShowPaymentModal(InvoiceID) {
            var frame = $get('IframePayment');
            var popup = $find('PaymentModalPopup');
            frame.src = "ProformPayment.aspx?ProformaID=" + InvoiceID;
            popup._backgroundElement.onclick = function() { document.getElementById("dummyPaymentClose").click(); }
            popup.show();
        }
        function ShowPaymentModalEdit(InvoiceID, DocumentID) {
            var frame = $get('IframePayment');
            var popup = $find('PaymentModalPopup');
            frame.src = "ProformPayment.aspx?ProformaID=" + InvoiceID + "&AccDocID=" + DocumentID;
            popup._backgroundElement.onclick = function() { document.getElementById("dummyPaymentClose").click(); }
            popup.show();
        }
        function PaymentUpdated() {
            document.getElementById('<%=dummyPaymentRefresh.ClientID%>').click();
        }

        function ShowSplitModal(BookingID) {
            var frame = $get('IframeSplit');
            var popup = $find('SplitModalPopup');
            frame.src = "ProFormStaySplit.aspx?BookingID=" + BookingID;
            popup._backgroundElement.onclick = function() { document.getElementById("dumySplitClose").click(); }
            popup.show();
        }
        function SplitUpdated() {
            document.getElementById('<%=dumyRefresh.ClientID%>').click();
        }
    </script>

    <%--<Rate popups>--%>
    <asp:Button ID="dumyRefresh" runat="server" Style="display: none;" OnClick="dumyRefresh_Click" />
    <asp:ModalPopupExtender runat="server" BackgroundCssClass="modalBackground" ID="stayPopExtender"
        X="0" Y="150" TargetControlID="dumyStayRate" OkControlID="dumyStayOK" CancelControlID="dumyStayCancel"
        PopupControlID="stayPopDiv" OnOkScript="RateUpdated();" BehaviorID="StayModalPopup">
    </asp:ModalPopupExtender>
    <div style="display: none">
        <asp:Button ID="dumyStayRate" runat="server" Style="display: none;" />
        <input id="dumyStayOK" value="Done" type="button" />
        <input id="dumyStayCancel" value="Cancel" type="button" />
    </div>
    <div id="stayPopDiv" style="display: none;">
        <iframe id="IframeStay" frameborder="0" style="width: 1320px; height: 550px; overflow: visible;"
            scrolling="no" marginheight="10px" marginwidth="10px"></iframe>
    </div>
    <asp:ModalPopupExtender runat="server" BackgroundCssClass="modalBackground" ID="supplPopExtender"
        X="0" Y="150" TargetControlID="dumySuppRate" OkControlID="dumySuppOK" CancelControlID="dumySuppCancel"
        PopupControlID="suppPopDiv" OnOkScript="SuppUpdated();" BehaviorID="SuppModalPopup">
    </asp:ModalPopupExtender>
    <div style="display: none">
        <asp:Button ID="dumySuppRate" runat="server" />
        <input id="dumySuppOK" value="Done" type="button" />
        <input id="dumySuppCancel" value="Cancel" type="button" />
    </div>
    <div id="suppPopDiv" style="display: none;">
        <iframe id="IframeSupp" frameborder="0" style="width: 1460px; height: 520px; overflow: visible;"
            scrolling="no" marginheight="10px" marginwidth="10px"></iframe>
    </div>
    <%--</Rate popups>--%>
    
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
    
    <%--<Split popup>--%>
    <asp:ModalPopupExtender runat="server" BackgroundCssClass="modalBackground" ID="splitPopupExtender"
        X="170" Y="350" TargetControlID="dummySplit" OkControlID="dumySplitOK" CancelControlID="dumySplitClose"
        PopupControlID="splitPopDiv" OnOkScript="SplitUpdated();" BehaviorID="SplitModalPopup">
    </asp:ModalPopupExtender>
    <div style="display: none">
        <asp:Button ID="dummySplit" runat="server" />
        <input id="dumySplitOK" value="Done" type="button" />
        <input id="dumySplitClose" value="Cancel" type="button" />
    </div>
    <div id="splitPopDiv" style="display: none;">
        <iframe id="IframeSplit" frameborder="0" style="width: 600px; height: 600px; overflow: visible;"
            scrolling="no" marginheight="10px" marginwidth="10px"></iframe>
    </div>
    <%--</Split popup>--%>

    <%--<Payment popup>--%>
    <asp:ModalPopupExtender runat="server" BackgroundCssClass="modalBackground" ID="paymentPopupExtender"
        X="100" Y="100" TargetControlID="dummyPayment" OkControlID="dummyPaymentOk" CancelControlID="dummyPaymentClose"
        PopupControlID="paymentPopDiv" OnOkScript="PaymentUpdated();" BehaviorID="PaymentModalPopup">
    </asp:ModalPopupExtender>
    <div style="display: none">
        <asp:Button ID="dummyPayment" runat="server" />
        <asp:Button ID="dummyPaymentRefresh" runat="server" OnClick="dummyPayment_Click" />
        <input id="dummyPaymentOk" value="Done" type="button" />
        <input id="dummyPaymentClose" value="Cancel" type="button" />
    </div>
    <div id="paymentPopDiv" style="display: none; width: 100%; height: 100%;">
        <iframe id="IframePayment" frameborder="0" style="width: 100%; height: 100%; overflow: visible;"
            scrolling="yes" marginheight="10px" marginwidth="10px"></iframe>
    </div>
    <%--</Payment popup>--%>
    
    <asp:HiddenField ID="hfTourOpID" runat="server" />
    <asp:HiddenField ID="hfHotel" runat="server" />
    <asp:UpdatePanel ID="UpdatePanelPage" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
        <ContentTemplate>
            <div class="Blue">
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <asp:FormView ID="fvInvoiceHead" runat="server" Width="100%" DataKeyNames="InvDocID" DataSourceID="dsProforma">
                                <ItemTemplate>
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="GridLabelBG" colspan="9">
                                                <asp:Label ID="Label30" runat="server" SkinID="skGridLabel" Text='<%# "PF " & Eval("InvDocNum") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 30px;">&nbsp;</td>
                                            <td class="GridRow1B" style="width: 120px;">
                                                <asp:Label ID="Label27" runat="server" Font-Bold="true" Font-Size="Larger"
                                                    Text='<%# Iif(Eval("GroupName") Is DBNull.Value, "Single", "Group") %>' />
                                            </td>
                                            <td class="GridRow1B" style="width: 480px;" colspan="2">
                                                <asp:Label ID="GroupNameLabel" runat="server" Font-Bold="true" Font-Size="Larger"
                                                    Text='<%# Eval("GroupName") %>' />
                                            </td>
                                            <td rowspan="8" style="width: 10px;">&nbsp;</td>
                                            <td class="GridRow1B" style="width: 100px; text-align: left;"><b>Payments</b></td>
                                            <td class="GridRow1B" style="width: 80px; text-align: center;"><i>Proforma</i></td>
                                            <td class="GridRow1B" style="width: 80px; text-align: center;"><i>Applied</i></td>
                                            <td class="GridRow1B" style="width: 80px; text-align: center;"><i>Reserved</i></td>
                                        </tr>
                                        <tr>
                                            <td style="width: 30px;" rowspan="7">&nbsp;</td>
                                            <td class="GridRow1B" style="width: 120px;"><b>Tour Operator</b></td>
                                            <td class="GridRow1B" style="width: 480px;" colspan="2">
                                                <asp:Label ID="TourOpLabel" runat="server" Text='<%# Eval("TourOp") %>' ToolTip='<%# Bind("TourOpID")%>' />
                                            </td>
                                            <td style="vertical-align: top;" rowspan="7" colspan="4">
                                            <asp:Repeater ID="rptTotal" runat="server" DataSourceID="dsTotal" >
                                                <ItemTemplate>
                                                    <table cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td style="width: 100px;">&nbsp;</td>
                                                            <td style="width: 80px; text-align: right;">
                                                                <asp:Label ID="Label39" runat="server" Text='<%# Eval("BookingAmount","{0:N2}") %>' />
                                                            </td>
                                                            <td style="width: 80px;">&nbsp;</td>
                                                            <td style="width: 80px;">&nbsp;</td>
                                                        </tr>                                            
                                                        <asp:Repeater ID="rptApplications" runat="server" DataSourceID="dsApplications" >
                                                            <ItemTemplate>
                                                        <tr>
                                                            <td style="width: 100px; text-align: right; border-top: solid 1px;">
                                                                <asp:LinkButton ID="Label44" runat="server" Text='<%# Eval("DocCode") & " " & Eval("DocNumber")  %>'
                                                                    OnClientClick='<%# ShowPaymentModalText(Eval("DocumentID")) %>' />
                                                            </td>
                                                            <td style="width: 80px; border-top: solid 1px;">
                                                            </td>
                                                            <td style="width: 80px; text-align: right; border-top: solid 1px;">
                                                                <asp:Label ID="Label40" runat="server" Text='<%# Eval("AccAppAmount","{0:N2}") %>' /><br />
                                                            </td>
                                                            <td style="width: 80px; text-align: right; border-top: solid 1px;">
                                                                <asp:Label ID="Label42" runat="server" Text='<%# Eval("AccResAmount","{0:N2}") %>' />
                                                            </td>
                                                        </tr>                                            
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                        <tr>
                                                            <td class="GridRow1T" colspan="2" style="width: 180px; text-align: right;">Total Payments</td>
                                                            <td class="GridRow1T" style="width: 80px; text-align: right;">
                                                                <asp:Label ID="Label42" runat="server" Text='<%# Eval("AppAmount","{0:N2}") %>' />
                                                            </td>
                                                            <td class="GridRow1T" style="width: 80px; text-align: right;">
                                                                <asp:Label ID="Label37" runat="server" Text='<%# Eval("ResAmount","{0:N2}") %>' />
                                                            </td>
                                                        </tr>                                            
                                                        <tr>
                                                            <td style="width: 100px; border-top: solid 1px; text-align: right;">Overpayment</td>
                                                            <td style="width: 80px; border-top: solid 1px; text-align: right;">
                                                                <asp:Label ID="Label41" runat="server" Text='<%# Eval("Overpayment","{0:N2}") %>' />
                                                            </td>
                                                            <td style="width: 160px; border-top: solid 1px; vertical-align: middle; text-align: right;" colspan="2" rowspan="2">
                                                                <asp:Button ID="btnPayment" runat="server" SkinID="skBtnBase" Text="New Payment" 
                                                                    OnClientClick='<%# ShowPaymentModalText() %>'
                                                                    CommandName="payNew"  />
                                                            </td>
                                                        </tr>                                            
                                                        <tr>
                                                            <td style="width: 100px; text-align: right;">Underpayment</td>
                                                            <td style="width: 80px; text-align: right;">
                                                                <asp:Label ID="Label43" runat="server" Text='<%# Eval("Underpayment","{0:N2}") %>' />
                                                            </td>
                                                        </tr>                                            
                                                    </table>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            </td>
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
                                            <td class="GridRow1B"><b>Check In</b></td>
                                            <td class="GridRow1B" colspan="2">
                                                <asp:Label ID="CheckInLabel1" runat="server"  Visible='<%# Eval("GroupName") IsNot DBNull.Value %>'
                                                    Text='<%# GetCheckDates(Eval("CheckInFrom","{0:d}"), Eval("CheckInTo","{0:d}")) %>' />
                                                <asp:Label ID="CheckInLabel2" runat="server"  Visible='<%# Eval("GroupName") Is DBNull.Value %>'
                                                    Text='<%# Eval("CheckInFrom","{0:d}") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="GridRow1B"><b>Check Out</b></td>
                                            <td class="GridRow1B" colspan="2">
                                                <asp:Label ID="CheckOutLabel" runat="server" Text='<%# GetCheckDates(Eval("CheckOutFrom","{0:d}"), Eval("CheckOutTo","{0:d}")) %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="GridRow1B" style="vertical-align: top;"><b>Include Cancelled</b></td>
                                            <td class="GridRow1B" colspan="2">
                                                <asp:CheckBox ID="cbCancelled" runat="server" Checked='<%# Eval("Cancelled") %>' Enabled="false" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="GridRowClear" style="vertical-align: top;"><b>State</b></td>
                                            <td class="GridRowClear" style="width: 100px;">
                                                <asp:Label ID="InvDocStateLabel" runat="server" Text='<%# Eval("InvDocStateDesc") %>' />
                                                <asp:HiddenField ID="hfInvDocState" runat="server" Value='<%# Eval("InvDocState") %>' />
                                            </td>
                                            <td class="GridRowClear" style="padding: 4px; text-align: right;">
                                                <asp:LinkButton ID="btDefinitive" runat="server" SkinID="skBtnBase" Text="Set to Definitive"
                                                    CommandName="SetDefinitive" Visible='<%# Not (IsDefinitive OR IsCancelled) And IsAdmin %>' />
                                                <asp:LinkButton ID="btNotDefinitive" runat="server" SkinID="skBtnBase" Text="Not Definitive"
                                                    CommandName="ResetDefinitive" Visible='<%# IsDefinitive And IsAdmin %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="GridRow2T Red" style="width: 120px; height: 30px; padding-top: 7px; vertical-align: top;">
                                                <div class="Green">
                                                    <%--<asp:Button ID="btnProCancel" runat="server" SkinID="skBtnBase" Text="Cancel Proforma" 
                                                    CommandName="cCancel" Visible='<%# Not (IsDefinitive OR IsCancelled) AND AllCancelled %>' />--%>
                                                    <asp:Button ID="btnRefresh" runat="server" SkinID="skBtnBase" Text="Refresh Proforma"
                                                        CommandName="cRefresh" Visible='<%# Not IsDefinitive %>'
                                                        OnClientClick="return confirm('Are you sure you want to refresh Proforma from imported reservations?')" />
                                                </div>
                                            </td>
                                            <td class="GridRow2T Red" style="width: 100px; padding-top: 7px; vertical-align: top;">
                                                <asp:Button ID="btnDelete" runat="server" SkinID="skBtnBase" Text="Delete" CommandName="cDelete"
                                                    Visible='<%# Not (IsDefinitive OR IsCancelled) %>'
                                                    OnClientClick="return confirm('Are you sure you want to delete Proforma?')" />
                                            </td>
                                            <td class="GridRow2T" style="width: 380px; padding-top: 7px; text-align: right; vertical-align: top;">
                                                <asp:LinkButton ID="btnCharge" runat="server" Text="Proforma Charge" Font-Bold="true" 
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
                                            <td class="GridRow1B" style="width: 480px;" colspan="2">
                                                <asp:Label ID="GroupNameLabel" runat="server" Text='<%# Eval("GroupName") %>' />
                                            </td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="width: 30px;" rowspan="7">&nbsp;</td>
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
                                            <td rowspan="7">&nbsp;</td>
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
                                            <td style="width: 30px;" rowspan="7">&nbsp;</td>
                                            <td class="GridRow1B" style="width: 120px;"><b>Tour Operator</b></td>
                                            <td class="GridRow1B" style="width: 480px;" colspan="2">
                                                <asp:Label ID="TourOpLabel" runat="server" Text='<%# Eval("TourOp") %>' ToolTip='<%# Bind("TourOpID")%>' />
                                            </td>
                                            <td rowspan="7">&nbsp;</td>
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
                                            <td class="GridRowClear" style="vertical-align: top;">
                                                <b>State</b>
                                            </td>
                                            <td class="GridRowClear" colspan="2">
                                                <asp:Label ID="InvDocStateLabel" runat="server" Text='<%# Eval("InvDocStateDesc") %>' />
                                                <asp:HiddenField ID="hfInvDocState" runat="server" Value='<%# Eval("InvDocState") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="GridRow2T" style="width: 120px; height: 40px;">
                                                &nbsp;
                                            </td>
                                            <td class="GridRow2T Red" style="width: 100px; margin-top: 2px; padding-top: 5px;">
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
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align: top;">
                            <asp:HiddenField ID="hdBookingID" runat="server" />
                            <asp:HiddenField ID="hdProformaAmount" runat="server" />
                            <asp:CheckBox ID="cbHotel" runat="server" Text="Hotel" TextAlign="Left" AutoPostBack="True"
                                Style="float: right; color: White; padding: 2px; font-weight: bold;" />
                            <asp:TabContainer ID="tabProforma" runat="server" CssClass="SmartTab" ActiveTabIndex="0">
                                <asp:TabPanel ID="tpDetails" runat="server" HeaderText="<b>Proforma Details</b>" Style="float: left;">
                                    <HeaderTemplate>
                                        <b>Proforma Details</b></HeaderTemplate>
                                    <ContentTemplate>
                                        <asp:UpdatePanel ID="upProforma" runat="server">
                                            <ContentTemplate>
                                        <div class="normal">
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
                                                            </td>
                                                            <td class="PreRowHead" rowspan="2" style="width: 80px;">
                                                                Arrival
                                                            </td>
                                                            <td class="PreRowHead" rowspan="2" style="width: 80px;">
                                                                Departure
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
                                                                <%--<asp:Label ID="lblHotelName" runat="server" Text='<%# Eval("Hotel") %>' />--%>
                                                                <%# Eval("Hotel") %>
                                                            </td>
                                                        </asp:Panel>
                                                    <%--</tr>
                                                    <tr>--%>
                                                        <asp:Panel ID="Panel3" runat="server" Visible='<%# Eval("rnH")>0 %>'>
                                                            <asp:Panel ID="Panel2" runat="server" Visible='<%# Eval("rnR")>1 %>'>
                                                                <td class="PreRow" style="border-style: none solid none solid;">
                                                                    &nbsp;
                                                                </td>
                                                                <td class="PreRow" style="border-style: none solid none solid;">
                                                                    &nbsp;
                                                                </td>
                                                                <td class="PreRow" style="border-style: none solid none solid;">
                                                                    &nbsp;
                                                                </td>
                                                            </asp:Panel>
                                                            <asp:Panel ID="Panel1" runat="server" Visible='<%# Eval("rnR")=1 %>'>
                                                                <td class="PreRow" style="border-style: solid solid none solid; text-align: left;
                                                                    padding: 2px;">
                                                                    <asp:ImageButton ID="ibSelect" runat="server" Width="17px" Height="17px" CausesValidation="False"
                                                                        ImageUrl='<%# BookingStateIcon(Eval("InHouseState")) %>'
                                                                        Visible='<%# Eval("rnR")=1 %>' ToolTip='<%# Eval("BookingID") %>'
                                                                        CommandArgument='<%# Eval("BookingID") %>' CommandName="Select" />
                                                                </td>
                                                                <td class="PreRow" style="border-style: solid solid none solid; text-align: left;">
                                                                    <asp:LinkButton ID="lbSelect" runat="server" Text='<%# Eval("PreInvText") %>' CausesValidation="false"
                                                                        Visible='<%# Eval("rnR")=1 %>' ToolTip='<%# Eval("FolioFull") %>' 
                                                                        CommandArgument='<%# Eval("BookingID") %>' CommandName="Select" />
                                                                </td>
                                                                <td class="PreRow" style="border-style: solid solid none solid;">
                                                                    <asp:Label ID="Label1" runat="server" Visible='<%# Eval("rnR")=1 %>' Text='<%# Eval("BkNumber") %>' />
                                                                </td>
                                                            </asp:Panel>
                                                            <td class="PreRow" style="text-align: left;">
                                                                <%# Eval("RateCodeID") %>
                                                            </td>
                                                            <td class="PreRow">
                                                                <%# Eval("BkDate","{0:d}") %>
                                                            </td>
                                                            <td class="PreRow">
                                                                <%# Eval("Arrival","{0:d}") %>
                                                            </td>
                                                            <td class="PreRow">
                                                                <%# Eval("Departure","{0:d}") %>
                                                            </td>
                                                            <td class="PreRow">
                                                                <%# Eval("Nights") %>
                                                            </td>
                                                            <td class="PreRow">
                                                                <%# Eval("RoomTypeID") %>
                                                            </td>
                                                            <td class="PreRow">
                                                                <%--<asp:Literal ID="Label9" runat="server" Text='<%# Eval("Adult") %>' Visible='<%# Not Eval("Adult")=0 %>' />--%>
                                                                <span style="display: <%# DisplayTag(Not Eval("Adult")=0) %>"><%# Eval("Adult") %></span>
                                                            </td>
                                                            <td class="PreRow">
                                                                <span style="display: <%# DisplayTag(Not Eval("Infant")=0) %>"><%# Eval("Infant") %></span>
                                                            </td>
                                                            <td class="PreRow">
                                                                <%--<asp:Literal ID="Label11" runat="server" Text='<%# Eval("Child") %>' Visible='<%# Not Eval("Child")=0 %>' />--%>
                                                                <span style="display: <%# DisplayTag(Not Eval("Child")=0) %>"><%# Eval("Child") %></span>
                                                            </td>
                                                            <td class="PreRow">
                                                                <%--<asp:Literal ID="Label12" runat="server" Text='<%# Eval("Junior1") %>' Visible='<%# Not Eval("Junior1")=0 %>' />--%>
                                                                <span style="display: <%# DisplayTag(Not Eval("Junior1")=0) %>"><%# Eval("Junior1") %></span>
                                                            </td>
                                                            <td class="PreRow">
                                                                <%--<asp:Literal ID="Label13" runat="server" Text='<%# Eval("Junior2") %>' Visible='<%# Not Eval("Junior2")=0 %>' />--%>
                                                                <span style="display: <%# DisplayTag(Not Eval("Junior2")=0) %>"><%# Eval("Junior2") %></span>
                                                            </td>
                                                            <td class="PreRow" style="text-align: right;">
                                                                <asp:Label ID="Label3c" runat="server" Text='<%# Eval("InvResAmount","{0:N2}") %>'
                                                                    Visible='<%# Not cbHotel.Checked AND AmountShow(Eval("InHouseState"),Eval("Penalty")) %>'
                                                                    ForeColor='<%# PenaltyColor(Eval("Penalty")) %>' />
                                                                <asp:Label ID="Label3h" runat="server" Text='<%# Eval("InvResHAmount","{0:N2}") %>' 
                                                                    Visible='<%# cbHotel.Checked AND AmountShow(Eval("InHouseState"),Eval("Penalty")) %>'
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
                                                            <td class="PreRowHead" style="text-align: right; border-right: solid 1px; padding-right: 5px;"
                                                                colspan="14">
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
                                        </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel ID="tpInvResDetail" runat="server" HeaderText="Detail" Font-Bold="true"
                                    Style="float: left;" Visible="false">
                                    <ContentTemplate>
                                        <asp:UpdatePanel ID="upInvResDetail" runat="server">
                                            <ContentTemplate>
                                        <asp:FormView ID="fvBooking" runat="server" DataKeyNames="GuestName, InHouseState, Penalty" DataSourceID="dsBooking">
                                            <ItemTemplate>
                                                <table cellpadding="0" cellspacing="0" style="border-collapse: collapse; border: solid 1px;">
                                                    <tr>
                                                        <td class="PreRowHeadSel" style="width: 60px;">
                                                            <asp:Label ID="Label14" runat="server" Text='<%# Eval("HotelCode") %>' />
                                                        </td>
                                                        <td class="PreRowHeadSel" colspan="2" style="width: 180px;">
                                                            <asp:Label ID="FolioFullLabel" runat="server" Text='<%# Eval("FolioFull") %>' />
                                                        </td>
                                                        <td class="PreRowHeadSel" colspan="6" style="text-align: left; vertical-align: middle; padding: 2px 2px 0px 2px;">
                                                            <%--<asp:Label ID="GuestNameLabel" runat="server" Text='<%# Eval("GuestName") %>' />--%>
                                                            <asp:LinkButton ID="lbGuestName" runat="server"  Text='<%# Eval("GuestName") %>' />
                                                            <asp:Label ID="ibBookingInfo" runat="server" Style="float: right;" ToolTip="Booking info">
                                                                <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/infoIcon.gif" />
                                                            </asp:Label>
                                                            
                                                            <asp:HiddenField ID="hfPreinvoiceId" runat="server" Value='<%# Eval("BookingId") %>' />
                                                            <!-- Rooming List -->
                                                            <asp:PopupControlExtender ID="infoRoomEx" runat="server"
                                                                TargetControlID="lbGuestName"
                                                                PopupControlID="infoRoomDiv"
                                                                Position="Bottom" OffsetX="7" OffsetY="6" />
                                                            <asp:Panel id="infoRoomDiv" runat="server" Style="display: none; border-top: none;" CssClass="PreRowHeadSel" >
                                                                <asp:ObjectDataSource ID="dsRooming" runat="server" OldValuesParameterFormatString="original_{0}"
                                                                    TypeName="dsProformaTableAdapters.BookingRoomingTableAdapter"
                                                                    SelectMethod="GetData" >
                                                                    <SelectParameters>
                                                                        <asp:ControlParameter ControlID="hdBookingID" DefaultValue="16924" Name="BookingID" PropertyName="Value" Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:ObjectDataSource>
                                                                <asp:DataList ID="dlRooming" runat="server" DataKeyField="BookingID" DataSourceID="dsRooming">
                                                                    <ItemTemplate>
                                                                        <table cellpadding="0" cellspacing="0" style="border: none; border-collapse: collapse;">
                                                                            <tr>
                                                                                <td style="text-align: left; vertical-align: middle; padding: 2px 2px 0px 2px; width: 374px;">
                                                                                    <asp:Label ID="lblgName" runat="server" Text='<%# Eval("genericName") %>' Font-Bold="true" />
                                                                                    <asp:Label ID="lblgType" runat="server" Style="float: right;" Text='<%# Eval("CHILD-TYPE") %>'/>
                                                                                </td>
                                                                            </tr>
                                                                        </table> 
                                                                    </ItemTemplate>
                                                                </asp:DataList>
                                                            </asp:Panel>
                                                            <!-- /Rooming List -->

                                                            <!-- Booking Info -->
                                                            <asp:PopupControlExtender ID="infoBookEx" runat="server"
                                                                TargetControlID="ibBookingInfo"
                                                                PopupControlID="infoBookDiv"
                                                                Position="Bottom"
                                                                OffsetX="-440" />
                                                            <asp:Panel id="infoBookDiv" runat="server" Style="display: none; background-color: White;" CssClass="GridBorderThin" >
                                                                <asp:ObjectDataSource ID="dsPInfo" runat="server" 
                                                                    TypeName="dsProformaTableAdapters.BookingInfoTableAdapter" 
                                                                    SelectMethod="GetData" >
                                                                    <SelectParameters>
                                                                        <asp:ControlParameter ControlID="hfPreinvoiceId" Name="BookingID" PropertyName="Value" Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:ObjectDataSource>
                                                                <asp:FormView ID="fvPInfo" runat="server" DataSourceID="dsPInfo" Width="100%" >
                                                                    <RowStyle CssClass="GridRowClear" Font-Size="Small" />
                                                                    <ItemTemplate>
                                                                        <table cellpadding="0" cellspacing="0" style="border: solid 1px;">
                                                                            <tr>
                                                                                <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px; font-weight: normal; width: 80px;">
                                                                                    <i>Reservation:</i>
                                                                                </td>
                                                                                <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px; width: 190px;">
                                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("FolioFull") %>' Font-Bold="true" />
                                                                                </td>
                                                                                <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px; font-weight: normal; width: 80px;">
                                                                                    <i>Preinvoice:</i>
                                                                                </td>
                                                                                <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px; width: 190px;">
                                                                                    <asp:Label ID="Label18" runat="server" Text='<%# Eval("BookingID") %>' Font-Bold="true" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px; font-weight: normal;">
                                                                                    <i>Imported:</i>
                                                                                </td>
                                                                                <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px;">
                                                                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("ImportDate") %>' Font-Bold="true" />
                                                                                </td>
                                                                                <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px; font-weight: normal;">
                                                                                    <i>Created:</i>
                                                                                </td>
                                                                                <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px;">
                                                                                    <asp:Label ID="Label24" runat="server" Text='<%# Eval("DateCreated") %>' Font-Bold="true" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px; font-weight: normal;">
                                                                                    <i>Last update:</i>
                                                                                </td>
                                                                                <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px;" colspan="3">
                                                                                    <asp:Label ID="Label25" runat="server" Text='<%# Eval("DateModified") %>' Font-Bold="true" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px; text-align: center;" colspan="4">
                                                                                    <asp:Label ID="Label29" runat="server" Text='<%# Eval("FileID","({0})") %>' Font-Bold="true" />
                                                                                    <asp:Label ID="Label31" runat="server" Text='<%# Eval("fileExpected") %>' Font-Bold="true" />
                                                                                </td>
                                                                            </tr>
                                                                        </table> 
                                                                    </ItemTemplate>
                                                                </asp:FormView>
                                                            </asp:Panel>
                                                            <!-- /Booking Info -->
                                                            
                                                        </td>
                                                        <td class="PreRowHeadSel" colspan="1" style="width: 140px; text-align: right;">
                                                            <asp:Label ID="InvResCAmountLabel" runat="server" Text='<%# Eval("InvResAmount","{0:N2}") %>' Visible='<%# Not cbHotel.Checked %>' ToolTip='<%# Eval("BookingId") %>' />
                                                            <asp:Label ID="InvResHAmountLabel" runat="server" Text='<%# Eval("InvResHAmount","{0:N2}") %>' Visible='<%# cbHotel.Checked %>' ToolTip='<%# Eval("BookingId") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="PreRowHead" colspan="2" style="width: 120px;">
                                                            Bk.Number
                                                        </td>
                                                        <td class="PreRowHead" colspan="1" style="width: 120px;">
                                                            Bk.Date
                                                        </td>
                                                        <td class="PreRowHead" colspan="2" style="width: 120px;">
                                                            Check In
                                                        </td>
                                                        <td class="PreRowHead" colspan="2" style="width: 120px;">
                                                            Check Out
                                                        </td>
                                                        <td class="PreRowHead" colspan="2" style="width: 120px; border-right: solid 1px;">
                                                            Nights
                                                        </td>
                                                        <td class="PreRowHead" colspan="1" rowspan="5" style="width: 140px; vertical-align: top;
                                                            border-bottom: solid 1px;">
                                                            <table style="border-collapse: collapse; border: none; width: 100%; margin: 5px;">
                                                                <tr>
                                                                    <td style="width: 30%; vertical-align: middle; text-align: right; padding-right: 5px;">
                                                                        <asp:Image ID="imgState" runat="server" Height="16px" Width="16px" ImageUrl='<%# BookingStateIcon(Eval("InHouseState")) %>' />
                                                                    </td>
                                                                    <td style="width: 70%; vertical-align: middle; text-align: left; font-style: italic;">
                                                                        <asp:Label ID="lblState" runat="server" Text='<%# BookingState(Eval("InHouseState")) %>' />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="PreRow" colspan="2" style="text-align: center;">
                                                            <asp:Label ID="BkNumberLabel" runat="server" Text='<%# Eval("BkNumber") %>' />
                                                        </td>
                                                        <td class="PreRow" style="text-align: center;">
                                                            <asp:Label ID="BkDateLabel" runat="server" Text='<%# Eval("BkDate","{0:d}") %>' />
                                                        </td>
                                                        <td class="PreRow" colspan="2" style="text-align: center;">
                                                            <asp:Label ID="CheckInLabel" runat="server" Text='<%# Eval("CheckIn","{0:d}") %>' />
                                                        </td>
                                                        <td class="PreRow" colspan="2" style="text-align: center;">
                                                            <asp:Label ID="CheckOutLabel" runat="server" Text='<%# Eval("CheckOut","{0:d}") %>' />
                                                        </td>
                                                        <td class="PreRow" colspan="2" style="text-align: center; border-right: solid 1px;">
                                                            <asp:Label ID="StayNightsLabel" runat="server" Text='<%# Eval("StayNights") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="PreRowHead" colspan="2">
                                                            Meal Plan
                                                        </td>
                                                        <td class="PreRowHead" colspan="1">
                                                            Room
                                                        </td>
                                                        <td class="PreRowHead" colspan="1" style="width: 60px;">
                                                            &#160;&nbsp;
                                                        </td>
                                                        <td class="PreRowHead" colspan="1" style="width: 60px;">
                                                            Ad
                                                        </td>
                                                        <td class="PreRowHead" colspan="1" style="width: 60px;">
                                                            Inf
                                                        </td>
                                                        <td class="PreRowHead" colspan="1" style="width: 60px;">
                                                            Ch
                                                        </td>
                                                        <td class="PreRowHead" colspan="1" style="width: 60px;">
                                                            Jun
                                                        </td>
                                                        <td class="PreRowHead" colspan="1" style="width: 60px; border-right: solid 1px;">
                                                            Jun2
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="PreRow" colspan="2" rowspan="2" style="text-align: center;">
                                                            <asp:Label ID="MealPlanIdLabel" runat="server" Text='<%# Eval("MealPlanId") %>' />
                                                        </td>
                                                        <td class="PreRow" rowspan="2" style="text-align: center;">
                                                            <asp:Label ID="RoomTypeIdLabel" runat="server" Text='<%# Eval("RoomTypeId") %>' />
                                                        </td>
                                                        <td class="PreRow" style="font-style: italic; font-weight: bold;">
                                                            Pax
                                                        </td>
                                                        <td class="PreRow">
                                                            <asp:Label ID="AdultLabel" runat="server" Text='<%# Eval("Adult") %>' />
                                                        </td>
                                                        <td class="PreRow">
                                                            <asp:Label ID="InfantLabel" runat="server" Text='<%# Eval("Infant") %>' />
                                                        </td>
                                                        <td class="PreRow">
                                                            <asp:Label ID="ChildLabel" runat="server" Text='<%# Eval("Child") %>' />
                                                        </td>
                                                        <td class="PreRow">
                                                            <asp:Label ID="JuniorLabel" runat="server" Text='<%# Eval("Junior") %>' />
                                                        </td>
                                                        <td class="PreRow">
                                                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("Junior2") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="PreRow" style="font-style: italic; font-weight: bold;">
                                                            Comp.
                                                        </td>
                                                        <td class="PreRow">
                                                            <asp:Label ID="CompAdultLabel" runat="server" Text='<%# Eval("CompAdult") %>' />
                                                        </td>
                                                        <td class="PreRow" colspan="2">
                                                            <asp:Label ID="CompChildLabel" runat="server" Text='<%# Eval("CompChild") %>' />
                                                        </td>
                                                        <td class="PreRow" colspan="2" style="text-align: center;">
                                                            <asp:Label ID="CompJuniorLabel" runat="server" Text='<%# Eval("CompJunior") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="GridRowClear" colspan="9" rowspan="1" style="border: solid 1px; text-align: left; vertical-align: middle;">
                                                            <asp:FormView ID="fvPenalty" runat="server" DataKeyNames="BookingID" DataSourceID="dsBooking"
                                                                OnItemCommand="fvPenalty_ItemCommand">
                                                                <ItemTemplate>
                                                                    <table cellpadding="5px" cellspacing="0" style="border: none; border-collapse: collapse;">
                                                                        <tr>
                                                                            <td style="width: 114px; border-right: solid 1px; text-align: right;">
                                                                                <asp:LinkButton ID="lbPenalty" runat="server" OnClick="lbPenalty_Click" 
                                                                                    Enabled='<%# Not (IsDefinitive OR IsCancelled) %>'
                                                                                    CommandArgument='<%# Eval("BookingID") & ";" & Eval("Penalty") %>'
                                                                                    OnClientClick='<%# PenaltyChangeText(Eval("Penalty")) %>' 
                                                                                    Text="Penalize" />
                                                                                <asp:ImageButton ID="ibPenalty" runat="server" OnClick="ibPenalty_Click" 
                                                                                    Enabled='<%# Not (IsDefinitive OR IsCancelled) %>'
                                                                                    CommandArgument='<%# Eval("BookingID") & ";" & Eval("Penalty") %>'
                                                                                    OnClientClick='<%# PenaltyChangeText(Eval("Penalty")) %>' 
                                                                                    ImageUrl='<%# PenaltyStateIcon(Eval("Penalty")) %>'
                                                                                    CssClass="InvButton" />
                                                                            </td>
                                                                            <td style="width: 430px;">
                                                                                <asp:Label ID="PenaltyConceptLabel" runat="server" Text='<%# Eval("PenaltyConcept") %>' Visible='<%# Eval("Penalty") %>' />
                                                                            </td>
                                                                            <td style="width: 50px;">
                                                                                <asp:ImageButton ID="ibEdit" runat="server" CausesValidation="False" CssClass="InvButton"
                                                                                    ImageUrl="~/Images/edit_inline.gif" CommandName="Edit" 
                                                                                    Visible='<%# Eval("Penalty") AND  Not (IsDefinitive OR IsCancelled) %>' />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </ItemTemplate>
                                                                <EditItemTemplate>
                                                                    <table cellpadding="5px" cellspacing="0" style="border: none;">
                                                                        <tr>
                                                                            <td style="width: 114px; border-right: solid 1px; text-align: right;">
                                                                                <asp:LinkButton ID="lbPenalty" runat="server" Text="Penalize" Enabled="false" />
                                                                                <asp:ImageButton ID="ibPenalty" runat="server" ImageUrl='<%# PenaltyStateIcon(Eval("Penalty")) %>'
                                                                                    CssClass="InvButton" Enabled="false" />
                                                                            </td>
                                                                            <td style="width: 430px;">
                                                                                <asp:TextBox ID="txtPenaltyConcept" runat="server" CssClass="TextBox" Text='<%# Bind("PenaltyConcept") %>' />
                                                                            </td>
                                                                            <td style="width: 50px;">
                                                                                <asp:ImageButton ID="ibEditUpdate" runat="server" CausesValidation="False" CommandName="PenUpdate"
                                                                                    CssClass="InvButton" ImageUrl="~/Images/accept_inline.gif" CommandArgument='<%# Eval("BookingID") %>' />
                                                                                <asp:ImageButton ID="ibEditCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                                                                    CssClass="InvButton" ImageUrl="~/Images/decline_inline.gif" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </EditItemTemplate>
                                                            </asp:FormView>
                                                        </td>
                                                        <td class="GridRowClear" colspan="1" rowspan="1" style="border: none; text-align: right; padding: 5px;">
                                                            <asp:Button ID="btnEdit" runat="server" SkinID="skBtnBase" Text="Edit" CommandName="Edit"
                                                                Visible='<%# Not (IsDefinitive OR IsCancelled) %>' />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <table cellpadding="0" cellspacing="0" style="border-collapse: collapse; border: solid 1px;">
                                                    <tr>
                                                        <td class="PreRowHeadSel" style="width: 60px;">
                                                            <asp:Label ID="Label14" runat="server" Text='<%# Eval("HotelCode") %>' />
                                                        </td>
                                                        <td class="PreRowHeadSel" colspan="2" style="width: 180px;">
                                                            <asp:Label ID="FolioFullLabel" runat="server" Text='<%# Eval("FolioFull") %>' />
                                                        </td>
                                                        <td class="PreRowHeadSel" colspan="6" style="text-align: left; vertical-align: middle; padding: 2px 2px 0px 2px;">
                                                            <asp:TextBox ID="txtGuestName" runat="server" Width="370px" CssClass="TextBox" Text='<%# Bind("GuestName") %>' />
                                                            <asp:RequiredFieldValidator ID="req_txtGuestName" runat="server" Display="None" ErrorMessage="Required Field" 
                                                                ControlToValidate="txtGuestName" />
                                                            <asp:ValidatorCalloutExtender runat="server" ID="ext_req_txtGuestName" TargetControlID="req_txtGuestName" />
                                                        </td>
                                                        <td class="PreRowHeadSel" colspan="1" style="width: 140px; text-align: right;">
                                                            <asp:Label ID="InvResCAmountLabel" runat="server" Text='<%# Eval("InvResAmount","{0:N2}") %>' Visible='<%# Not cbHotel.Checked %>' />
                                                            <asp:Label ID="InvResHAmountLabel" runat="server" Text='<%# Eval("InvResHAmount","{0:N2}") %>' Visible='<%# cbHotel.Checked %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="PreRowHead" colspan="2" style="width: 120px;">
                                                            Bk.Number
                                                        </td>
                                                        <td class="PreRowHead" colspan="1" style="width: 120px;">
                                                            Bk.Date
                                                        </td>
                                                        <td class="PreRowHead" colspan="2" style="width: 120px;">
                                                            Check In
                                                        </td>
                                                        <td class="PreRowHead" colspan="2" style="width: 120px;">
                                                            Check Out
                                                        </td>
                                                        <td class="PreRowHead" colspan="2" style="width: 120px; border-right: solid 1px;">
                                                            Nights
                                                        </td>
                                                        <td class="PreRowHead" colspan="1" rowspan="5" style="width: 140px; vertical-align: top;
                                                            border-bottom: solid 1px;">
                                                            <table style="border-collapse: collapse; border: none; width: 100%; margin: 5px;">
                                                                <tr>
                                                                    <td style="width: 30%; vertical-align: middle; text-align: right; padding-right: 5px;">
                                                                        <asp:Image ID="imgState" runat="server" Height="16px" Width="16px" ImageUrl='<%# BookingStateIcon(Eval("InHouseState")) %>' />
                                                                    </td>
                                                                    <td style="width: 70%; vertical-align: middle; text-align: left; font-style: italic;">
                                                                        <asp:Label ID="lblState" runat="server" Text='<%# BookingState(Eval("InHouseState")) %>' />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="PreRow" colspan="2" style="text-align: center;">
                                                            <asp:TextBox ID="txtBkNumber" runat="server" Width="100px" CssClass="TextBox" Text='<%# Bind("BkNumber") %>' />
                                                            <%--<asp:RequiredFieldValidator ID="req_txtBkNumber" runat="server" Display="None" ErrorMessage="Required Field" 
                                                                ControlToValidate="txtBkNumber" />
                                                            <asp:ValidatorCalloutExtender runat="server" ID="ext_req_txtBkNumber" TargetControlID="req_txtBkNumber" />--%>
                                                        </td>
                                                        <td class="PreRow" style="text-align: center;">
                                                            <asp:TextBox ID="txtBkDate" runat="server" Width="100px" CssClass="TextBox" Text='<%# Bind("BkDate","{0:d}") %>' />
                                                            <asp:CalendarExtender ID="cal_txtBkDate" runat="server" CssClass="cal_Theme1" TargetControlID="txtBkDate" />
                                                            <asp:CompareValidator ID="cmp_txtBkDate" runat="server" Display="None" Operator="DataTypeCheck"
                                                                ControlToValidate="txtBkDate" Type="Date" ErrorMessage="Please enter a valid date" />
                                                            <asp:ValidatorCalloutExtender runat="server" ID="exp_cmp_txtBkDate" TargetControlID="cmp_txtBkDate" />
                                                        </td>
                                                        <td class="PreRow" colspan="2" style="text-align: center;">
                                                            <asp:TextBox ID="txtCheckIn" runat="server" Width="100px" CssClass="TextBox" Text='<%# Bind("CheckIn","{0:d}") %>' />
                                                            <asp:CalendarExtender ID="cal_txtCheckIn" runat="server" CssClass="cal_Theme1" TargetControlID="txtCheckIn" />
                                                            <asp:RequiredFieldValidator ID="req_txtCheckIn" runat="server" Display="None" ErrorMessage="Required Field" 
                                                                ControlToValidate="txtCheckIn" />
                                                            <asp:ValidatorCalloutExtender runat="server" ID="ext_req_txtCheckIn" TargetControlID="req_txtCheckIn" />
                                                            <asp:CompareValidator ID="cmp_txtCheckIn" runat="server" Display="None" Operator="DataTypeCheck"
                                                                ControlToValidate="txtCheckIn" Type="Date" ErrorMessage="Please enter a valid date" />
                                                            <asp:ValidatorCalloutExtender runat="server" ID="ext_cmp_txtCheckIn" TargetControlID="cmp_txtCheckIn" />
                                                        </td>
                                                        <td class="PreRow" colspan="2" style="text-align: center;">
                                                            <asp:TextBox ID="txtCheckOut" runat="server" Width="100px" CssClass="TextBox" Text='<%# Bind("CheckOut","{0:d}") %>' />
                                                            <asp:CalendarExtender ID="cal_txtCheckOut" runat="server" CssClass="cal_Theme1" TargetControlID="txtCheckOut" />
                                                            <asp:RequiredFieldValidator ID="req_txtCheckOut" runat="server" Display="None" ErrorMessage="Required Field" 
                                                                ControlToValidate="txtCheckOut"  />
                                                            <asp:ValidatorCalloutExtender runat="server" ID="ext_req_txtCheckOut" TargetControlID="req_txtCheckOut" />
                                                            <asp:CompareValidator ID="cmp_txtCheckOut" runat="server" Display="None" Operator="DataTypeCheck"
                                                                ControlToValidate="txtCheckOut" Type="Date" ErrorMessage="Please enter a valid date" />
                                                            <asp:ValidatorCalloutExtender runat="server" ID="exp_cmp_txtCheckOut" TargetControlID="cmp_txtCheckOut" />
                                                        </td>
                                                        <td class="PreRow" colspan="2" style="text-align: center; border-right: solid 1px;">
                                                            <asp:Label ID="StayNightsLabel" runat="server" Text='<%# Eval("StayNights") %>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="PreRowHead" colspan="2">
                                                            Meal Plan
                                                        </td>
                                                        <td class="PreRowHead" colspan="1">
                                                            Room
                                                        </td>
                                                        <td class="PreRowHead" colspan="1" style="width: 60px;">
                                                            &#160;&nbsp;
                                                        </td>
                                                        <td class="PreRowHead" colspan="1" style="width: 60px;">
                                                            Ad
                                                        </td>
                                                        <td class="PreRowHead" colspan="1" style="width: 60px;">
                                                            Inf
                                                        </td>
                                                        <td class="PreRowHead" colspan="1" style="width: 60px;">
                                                            Ch
                                                        </td>
                                                        <td class="PreRowHead" colspan="1" style="width: 60px;">
                                                            Jun
                                                        </td>
                                                        <td class="PreRowHead" colspan="1" style="width: 60px; border-right: solid 1px;">
                                                            Jun2
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="PreRow" colspan="2" rowspan="2" style="text-align: center;">
                                                            <asp:Label ID="MealPlanIdLabel" runat="server" Text='<%# Eval("MealPlanId") %>' />
                                                        </td>
                                                        <td class="PreRow" rowspan="2" style="text-align: center;">
                                                            <asp:HiddenField ID="hfHotelID" runat="server" Value='<%# Eval("HotelID") %>' />
                                                            <asp:DropDownList ID="ddlRoomTypeID" runat="server" CssClass="TextBox" DataSourceID="dsHtlRooms"
                                                                DataTextField="RoomTypeID" DataValueField="RoomTypeID" SelectedValue='<%# Bind("RoomTypeId") %>' />
                                                            <asp:ObjectDataSource runat="server" ID="dsHtlRooms" SelectMethod="GetData" 
                                                                TypeName="dsProformaTableAdapters.HotelRoomTypeTableAdapter" >
                                                                <SelectParameters>
                                                                    <asp:ControlParameter Name="HotelID" ControlID="hfHotelID" PropertyName="Value" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:ObjectDataSource>
                                                        </td>
                                                        <td class="PreRow" style="font-style: italic; font-weight: bold;">
                                                            Pax
                                                        </td>
                                                        <td class="PreRow" style="text-align: center;">
                                                            <asp:TextBox ID="txtAdult" runat="server" Width="40" CssClass="TextBox" Text='<%# Bind("Adult") %>' />
                                                            <asp:RequiredFieldValidator ID="req_txtAdult" runat="server" Display="None" ErrorMessage="Required Field" 
                                                                ControlToValidate="txtAdult"  />
                                                            <asp:ValidatorCalloutExtender runat="server" ID="ext_req_txtAdult" TargetControlID="req_txtAdult" />
                                                            <asp:CompareValidator ID="cmp_txtAdult" runat="server" Display="None" Operator="DataTypeCheck"
                                                                ControlToValidate="txtAdult" Type="Integer" ErrorMessage="Please enter a valid number" />
                                                            <asp:ValidatorCalloutExtender runat="server" ID="exp_cmp_txtAdult" TargetControlID="cmp_txtAdult" />
                                                            
                                                        </td>
                                                        <td class="PreRow" style="text-align: center;">
                                                            <asp:TextBox ID="txtInfant" runat="server" Width="40" CssClass="TextBox" Text='<%# Bind("Infant") %>' />
                                                            <asp:RequiredFieldValidator ID="req_txtInfant" runat="server" Display="None" ErrorMessage="Required Field" 
                                                                ControlToValidate="txtInfant"  />
                                                            <asp:ValidatorCalloutExtender runat="server" ID="ext_req_txtInfant" TargetControlID="req_txtInfant" />
                                                            <asp:CompareValidator ID="cmp_txtInfant" runat="server" Display="None" Operator="DataTypeCheck"
                                                                ControlToValidate="txtInfant" Type="Integer" ErrorMessage="Please enter a valid number" />
                                                            <asp:ValidatorCalloutExtender runat="server" ID="exp_cmp_txtInfant" TargetControlID="cmp_txtInfant" />
                                                            
                                                        </td>
                                                        <td class="PreRow" style="text-align: center;">
                                                            <asp:TextBox ID="txtChild" runat="server" Width="40" CssClass="TextBox" Text='<%# Bind("Child") %>' />
                                                            <asp:RequiredFieldValidator ID="req_txtChild" runat="server" Display="None" ErrorMessage="Required Field" 
                                                                ControlToValidate="txtChild"  />
                                                            <asp:ValidatorCalloutExtender runat="server" ID="ext_req_txtChild" TargetControlID="req_txtChild" />
                                                            <asp:CompareValidator ID="cmp_txtChild" runat="server" Display="None" Operator="DataTypeCheck"
                                                                ControlToValidate="txtChild" Type="Integer" ErrorMessage="Please enter a valid number" />
                                                            <asp:ValidatorCalloutExtender runat="server" ID="exp_cmp_txtChild" TargetControlID="cmp_txtChild" />
                                                            
                                                        </td>
                                                        <td class="PreRow" style="text-align: center;">
                                                            <asp:TextBox ID="txtJunior" runat="server" Width="40" CssClass="TextBox" Text='<%# Bind("Junior") %>' />
                                                            <asp:RequiredFieldValidator ID="req_txtJunior" runat="server" Display="None" ErrorMessage="Required Field" 
                                                                ControlToValidate="txtJunior"  />
                                                            <asp:ValidatorCalloutExtender runat="server" ID="ext_req_txtJunior" TargetControlID="req_txtJunior" />
                                                            <asp:CompareValidator ID="cmp_txtJunior" runat="server" Display="None" Operator="DataTypeCheck"
                                                                ControlToValidate="txtJunior" Type="Integer" ErrorMessage="Please enter a valid number" />
                                                            <asp:ValidatorCalloutExtender runat="server" ID="exp_cmp_txtJunior" TargetControlID="cmp_txtJunior" />
                                                            
                                                        </td>
                                                        <td class="PreRow" style="text-align: center;">
                                                            <asp:TextBox ID="txtJunior2" runat="server" Width="40" CssClass="TextBox" Text='<%# Bind("Junior2") %>' />
                                                            <asp:RequiredFieldValidator ID="req_txtJunior2" runat="server" Display="None" ErrorMessage="Required Field" 
                                                                ControlToValidate="txtJunior2"  />
                                                            <asp:ValidatorCalloutExtender runat="server" ID="ext_req_txtJunior2" TargetControlID="req_txtJunior2" />
                                                            <asp:CompareValidator ID="cmp_txtJunior2" runat="server" Display="None" Operator="DataTypeCheck"
                                                                ControlToValidate="txtJunior2" Type="Integer" ErrorMessage="Please enter a valid number" />
                                                            <asp:ValidatorCalloutExtender runat="server" ID="exp_cmp_txtJunior2" TargetControlID="cmp_txtJunior2" />
                                                            
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="PreRow" style="font-style: italic; font-weight: bold;">
                                                            Comp.
                                                        </td>
                                                        <td class="PreRow" style="text-align: center;">
                                                            <asp:TextBox ID="txtCompAdult" runat="server" Width="40" CssClass="TextBox" Text='<%# Bind("CompAdult") %>' />
                                                            <asp:RequiredFieldValidator ID="req_txtCompAdult" runat="server" Display="None" ErrorMessage="Required Field" 
                                                                ControlToValidate="txtCompAdult"  />
                                                            <asp:ValidatorCalloutExtender runat="server" ID="ext_req_txtCompAdult" TargetControlID="req_txtCompAdult" />
                                                            <asp:CompareValidator ID="cmp_txtCompAdult" runat="server" Display="None" Operator="DataTypeCheck"
                                                                ControlToValidate="txtCompAdult" Type="Integer" ErrorMessage="Please enter a valid number" />
                                                            <asp:ValidatorCalloutExtender runat="server" ID="exp_cmp_txtCompAdult" TargetControlID="cmp_txtCompAdult" SkinID="skExtender" />
                                                            
                                                        </td>
                                                        <td class="PreRow" colspan="2" style="text-align: center;">
                                                            <asp:TextBox ID="txtCompChild" runat="server" Width="40" CssClass="TextBox" Text='<%# Bind("CompChild") %>' />
                                                            <asp:RequiredFieldValidator ID="req_txtCompChild" runat="server" Display="None" ErrorMessage="Required Field" 
                                                                ControlToValidate="txtCompChild"  />
                                                            <asp:ValidatorCalloutExtender runat="server" ID="ext_req_txtCompChild" TargetControlID="req_txtCompChild" />
                                                            <asp:CompareValidator ID="cmp_txtCompChild" runat="server" Display="None" Operator="DataTypeCheck"
                                                                ControlToValidate="txtCompChild" Type="Integer" ErrorMessage="Please enter a valid number" />
                                                            <asp:ValidatorCalloutExtender runat="server" ID="exp_cmp_txtCompChild" TargetControlID="cmp_txtCompChild" />
                                                            
                                                        </td>
                                                        <td class="PreRow" colspan="2" style="text-align: center;">
                                                            <asp:TextBox ID="txtCompJunior" runat="server" Width="40" CssClass="TextBox" Text='<%# Bind("CompJunior") %>' />
                                                            <asp:RequiredFieldValidator ID="req_txtCompJunior" runat="server" Display="None" ErrorMessage="Required Field" 
                                                                ControlToValidate="txtCompJunior"  />
                                                            <asp:ValidatorCalloutExtender runat="server" ID="ext_req_txtCompJunior" TargetControlID="req_txtCompJunior" />
                                                            <asp:CompareValidator ID="cmp_txtCompJunior" runat="server" Display="None" Operator="DataTypeCheck"
                                                                ControlToValidate="txtCompJunior" Type="Integer" ErrorMessage="Please enter a valid number" />
                                                            <asp:ValidatorCalloutExtender runat="server" ID="exp_cmp_txtCompJunior" TargetControlID="cmp_txtCompJunior" />
                                                            
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="GridRowClear" colspan="2" rowspan="1" style="border: none; text-align: right; padding: 5px;">
                                                            <asp:LinkButton ID="lbPenalty" runat="server" Text="Penalize" Enabled="false" />
                                                            <asp:ImageButton ID="ibPenalty" runat="server" ImageUrl='<%# PenaltyStateIcon(Eval("Penalty")) %>' CssClass="InvButton" Enabled="false" />
                                                        </td>
                                                        <td class="GridRowClear" colspan="7" rowspan="1" style="border: solid 1px; text-align: left; vertical-align: middle; padding: 5px;">
                                                            <asp:Label ID="PenaltyConceptLabel" runat="server" Text='<%# Eval("PenaltyConcept") %>' Visible='<%# Eval("Penalty") %>' />
                                                        </td>
                                                        <td class="GridRowClear" colspan="1" rowspan="1" style="border: none; text-align: right; padding: 5px;">
                                                            <asp:Button ID="btnUpdate" runat="server" SkinID="skBtnBase" Text="Update" CommandName="BkUpdate" 
                                                                CommandArgument='<%# Eval("BookingID") %>' />
                                                                <%--CommandArgument='<%# Eval("BookingID") %>' OnClientClick='<%# EditWarning %>' />--%>
                                                            <asp:Button ID="btnCancel" runat="server" SkinID="skBtnBase" Text="Cancel" CommandName="Cancel" CausesValidation="false" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </EditItemTemplate>
                                        </asp:FormView>
                                        <asp:DataList ID="dlBooking" runat="server" DataKeyField="BookingID" DataSourceID="dsBooking">
                                            <HeaderTemplate>
                                                <table cellpadding="0" cellspacing="0" style="border-collapse: collapse;">
                                                    <tr>
                                                        <td style="width: 66px; text-align: right;">
                                                            <asp:ImageButton ID="ibSplit" runat="server" CssClass="ImgButton" ImageUrl="~/Images/unpublish_inline.gif" 
                                                                ToolTip="Split Charge" Visible='<%# Not IsDefinitive %>' OnClientClick='<%# ShowSplitModalText() %>' />
                                                        </td>
                                                        <td class="PreRowHead" colspan="1" style="width: 180px; border-left: solid 1px;">
                                                            Rate
                                                        </td>
                                                        <td class="PreRowHead" colspan="1" style="width: 124px;">
                                                            Arrival
                                                        </td>
                                                        <td class="PreRowHead" colspan="1" style="width: 124px;">
                                                            Departure
                                                        </td>
                                                        <td class="PreRowHead" colspan="2">
                                                            Nights
                                                        </td>
                                                        <td class="PreRowHead" colspan="1" style="width: 139px; border-right: solid 1px;">
                                                            Amount
                                                        </td>
                                                    </tr>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <asp:HiddenField ID="hfResID" runat="server" Value='<%# Eval("InvResID") %>' />
                                                    </td>
                                                    <td class="PreRow" style="text-align: left; font-style: italic; font-weight: bold;
                                                        vertical-align: middle; padding: 2px 2px 0px 5px;">
                                                        <asp:ImageButton ID="btnSuppDel" runat="server" ImageUrl="~/Images/delete.gif" 
                                                            ToolTip="Remove supplement charge"
                                                            CommandName="Delete" CommandArgument='<%# Eval("InvResID") %>'
                                                            OnClientClick="return confirm('Are you sure you want to remove supplement charge?')"
                                                            Visible='<%# Not RateTypeNot9(Eval("RateType")) AND Not IsDefinitive %>' />
                                                        <asp:LinkButton ID="lnkEditRate" runat="server" Text='<%# Eval("RateCodeID") %>'
                                                            Visible='<%# RateTypeNot9(Eval("RateType")) AND Not IsDefinitive %>' 
                                                            Enabled='<%# NotComplimentary(Eval("RateCodeId")) %>'
                                                            OnClientClick='<%# "ShowStayModal(" & Eval("InvResID") & ");" %>' />
                                                        <asp:Label ID="lblSuppRate" runat="server" Text='<%# Eval("RateCodeID") %>' 
                                                            Visible='<%# Not (RateTypeNot9(Eval("RateType")) AND Not IsDefinitive) %>' />
                                                        <asp:Label ID="ibRateInfo" runat="server" Style="float: right;" ToolTip="Rate info" 
                                                            Visible='<%# NotComplimentary(Eval("RateCodeID")) AND NotNoRate(Eval("RateCodeID")) %>'>
                                                            <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/infoIcon.gif" />
                                                        </asp:Label>
                                                        <!-- Rate Info -->
                                                            <asp:HiddenField ID="hfRateId" runat="server" Value='<%# Eval("RateId") %>' />
                                                            <asp:PopupControlExtender ID="infoPopEx" runat="server"
                                                                TargetControlID="ibRateInfo"
                                                                PopupControlID="infoPopDiv"
                                                                Position="Bottom"
                                                                OffsetX="-85" />
                                                            <asp:Panel id="infoPopDiv" runat="server" Style="display: none; background-color: White;" CssClass="GridBorderThin" >
                                                                <asp:ObjectDataSource ID="dsRInfo" runat="server" 
                                                                    TypeName="dsInvoiceFormTableAdapters.Rate_SelectByBillInfoTableAdapter" 
                                                                    SelectMethod="GetData" >
                                                                    <SelectParameters>
                                                                        <asp:ControlParameter ControlID="hfRateId" Name="RateID" PropertyName="Value" Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:ObjectDataSource>
                                                                <asp:FormView ID="fvRInfo" runat="server" DataSourceID="dsRInfo" Width="100%" Visible='<%# RateTypeNot9(Eval("RateType")) %>' >
                                                                    <RowStyle CssClass="GridRowClear" Font-Size="Small" />
                                                                    <ItemTemplate>
                                                                        <table cellpadding="0" cellspacing="0" style="border: solid 1px;">
                                                                            <asp:Panel ID="pnlSPO" runat="server" Visible='<%# Not (Eval("SpecialID") Is DBNull.Value) %>'>
                                                                                <tr>
                                                                                    <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px; font-weight: bold;">
                                                                                        <asp:Label ID="SpoLabel" runat="server" Text='<%# Iif(Eval("SpoDiscount1ID")=6,"Free-rate special:","Special:") %>' />
                                                                                    </td>
                                                                                    <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px;">
                                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("RateCodeId") %>' Font-Bold="true" />
                                                                                        /
                                                                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("SpoTitle") %>' />
                                                                                        &nbsp;
                                                                                        <i>
                                                                                        <asp:Label ID="Label12" runat="server" Text='<%# "&nbsp;-&nbsp;" & Eval("SpoDiscount1") %>' Visible='<%# Eval("SpoDiscount1ID")<>6 %>' />
                                                                                        <asp:Label ID="Label13" runat="server" Text='<%# Iif(Eval("SpoOn1") Is DBNull.Value,""," on " & Eval("SpoOn1")) %>' />
                                                                                        <asp:Label ID="Label14" runat="server" Text='<%# Iif(Eval("SpoDiscount2ID")<>-1,"AND " & Eval("SpoDiscount2"),"") %>' />
                                                                                        <asp:Label ID="Label15" runat="server" Text='<%# Iif(Eval("SpoOn2") Is DBNull.Value,""," on " & Eval("SpoOn2")) %>' />
                                                                                        </i>
                                                                                    </td>
                                                                                </tr>
                                                                            </asp:Panel>
                                                                            <asp:Panel ID="pnlCTR" runat="server" Visible='<%# Eval("SpoDiscount1ID")<>6 %>'>
                                                                                <tr>
                                                                                    <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px; font-weight: bold;">
                                                                                        <asp:Label ID="Label2" runat="server" Text='<%# Iif(Eval("SpoDiscount1ID")>-1,"On Contract:","Contract:") %>' />
                                                                                    </td>
                                                                                    <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px;">
                                                                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("CtrRateCode") %>' Font-Bold="true" />
                                                                                        /
                                                                                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("CtrTitle") %>' />
                                                                                    </td>
                                                                                </tr>
                                                                            </asp:Panel>
                                                                            <tr>
                                                                                <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px; font-weight: bold;">
                                                                                    Children Policy:&nbsp;
                                                                                </td>
                                                                                <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px;">
                                                                                    <asp:Label ID="Label48" runat="server" Text="Adult Only" 
                                                                                        Visible='<%# Eval("ChldCategories") = 0 %>' />
                                                                                    <asp:Label ID="Label3" runat="server" Text='<%# "<b>C1</b> " & Eval("Chld1Label") & " (" & Eval("Chld1ShLabel") & ") " & Eval("Chld1From") & "-" & Eval("Chld1Max") %>'
                                                                                        Visible='<%# Eval("ChldCategories") > 0 %>' />
                                                                                    <asp:Label ID="Label8" runat="server" Text='<%# "<br /><b>C2</b> " & Eval("Chld2Label") & " (" & Eval("Chld2ShLabel") & "): " & Eval("Chld2From") & "-" & Eval("Chld2Max") %>'
                                                                                        Visible='<%# Eval("ChldCategories") > 1 %>' />
                                                                                    <asp:Label ID="Label10" runat="server" Text='<%# "<br /><b>C3</b> " & Eval("Chld3Label") & " (" & Eval("Chld3ShLabel") & "): " & Eval("Chld3From") & "-" & Eval("Chld3Max") %>'
                                                                                        Visible='<%# Eval("ChldCategories") > 2 %>' />
                                                                                    <asp:Label ID="Label11" runat="server" Text='<%# "<br /><b>C4</b> " & Eval("Chld4Label") & " (" & Eval("Chld4ShLabel") & "): " & Eval("Chld4From") & "-" & Eval("Chld4Max") %>'
                                                                                        Visible='<%# Eval("ChldCategories") > 3 %>' />
                                                                                </td>
                                                                            </tr>
                                                                        </table> 
                                                                    </ItemTemplate>
                                                                </asp:FormView>
                                                                <asp:ObjectDataSource ID="dsSInfo" runat="server" 
                                                                    TypeName="dsInvoiceFormTableAdapters.Rate_SuppSelectByStayInfoTableAdapter" 
                                                                    SelectMethod="GetData" OldValuesParameterFormatString="original_{0}" >
                                                                    <SelectParameters>
                                                                        <asp:ControlParameter ControlID="hfRateId" Name="RateID" PropertyName="Value" Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:ObjectDataSource>
                                                                <asp:FormView ID="fvSInfo" runat="server" DataSourceID="dsSInfo" Width="100%" Visible='<%# Not RateTypeNot9(Eval("RateType")) %>'>
                                                                    <RowStyle CssClass="GridRowClear" Font-Size="Small" />
                                                                    <ItemTemplate>
                                                                        <table cellpadding="0" cellspacing="0" style="border: solid 1px;">
                                                                            <tr>
                                                                                <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px; font-weight: bold;">
                                                                                    Supplement:
                                                                                </td>
                                                                                <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px;">
                                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("RateCodeId") %>' Font-Bold="true" />
                                                                                    /
                                                                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("SupTitle") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px; font-weight: bold;">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px;">
                                                                                    <asp:CheckBox ID="CheckBox1" runat="server" Enabled="false" AutoPostBack="false" Text="Mandatory" Checked='<%# Eval("IsMandatory") %>' TextAlign="Left" />
                                                                                    <asp:CheckBox ID="CheckBox2" runat="server" Enabled="false" AutoPostBack="false" Text="Combinable" Checked='<%# Eval("Combinable") %>' TextAlign="Left" />
                                                                                    <asp:CheckBox ID="CheckBox3" runat="server" Enabled="false" AutoPostBack="false" Text="Restrict on EBB" Checked='<%# Eval("RestrictEBB") %>' TextAlign="Left" />
                                                                                    <asp:CheckBox ID="CheckBox4" runat="server" Enabled="false" AutoPostBack="false" Text="All Week Days" Checked="true" TextAlign="Left" Visible='<%# Eval("WeekDays")="YYYYYYY" %>' />
                                                                                    &nbsp;
                                                                                    <asp:Label ID="Label3" runat="server" Text="Week Days:" Visible='<%# Eval("WeekDays")<>"YYYYYYY" %>' />
                                                                                    <asp:CheckBox ID="CheckBox12" runat="server" Enabled="false" AutoPostBack="false" Text="Su" Checked='<%# Eval("WeekDays").Chars(0)="Y" %>' Visible='<%# Eval("WeekDays")<>"YYYYYYY" %>' />
                                                                                    <asp:CheckBox ID="CheckBox13" runat="server" Enabled="false" AutoPostBack="false" Text="Mo" Checked='<%# Eval("WeekDays").Chars(1)="Y" %>' Visible='<%# Eval("WeekDays")<>"YYYYYYY" %>' />
                                                                                    <asp:CheckBox ID="CheckBox14" runat="server" Enabled="false" AutoPostBack="false" Text="Tu" Checked='<%# Eval("WeekDays").Chars(2)="Y" %>' Visible='<%# Eval("WeekDays")<>"YYYYYYY" %>' />
                                                                                    <asp:CheckBox ID="CheckBox15" runat="server" Enabled="false" AutoPostBack="false" Text="We" Checked='<%# Eval("WeekDays").Chars(3)="Y" %>' Visible='<%# Eval("WeekDays")<>"YYYYYYY" %>' />
                                                                                    <asp:CheckBox ID="CheckBox16" runat="server" Enabled="false" AutoPostBack="false" Text="Th" Checked='<%# Eval("WeekDays").Chars(4)="Y" %>' Visible='<%# Eval("WeekDays")<>"YYYYYYY" %>' />
                                                                                    <asp:CheckBox ID="CheckBox17" runat="server" Enabled="false" AutoPostBack="false" Text="Fr" Checked='<%# Eval("WeekDays").Chars(5)="Y" %>' Visible='<%# Eval("WeekDays")<>"YYYYYYY" %>' />
                                                                                    <asp:CheckBox ID="CheckBox18" runat="server" Enabled="false" AutoPostBack="false" Text="Sa" Checked='<%# Eval("WeekDays").Chars(6)="Y" %>' Visible='<%# Eval("WeekDays")<>"YYYYYYY" %>' />
                                                                                </td>
                                                                            </tr> 
                                                                            <tr>
                                                                                <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px; font-weight: bold;">
                                                                                    On Contract:
                                                                                </td>
                                                                                <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px;">
                                                                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("CtrRateCode") %>' Font-Bold="true" />
                                                                                    /
                                                                                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("CtrTitle") %>' />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px; font-weight: bold;">
                                                                                    Children Policy:&nbsp;
                                                                                </td>
                                                                                <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px;">
                                                                                    <asp:Label ID="Label48" runat="server" Text="Adult Only" 
                                                                                        Visible='<%# Eval("ChldCategories") = 0 %>' />
                                                                                    <asp:Label ID="Label49" runat="server" Text='<%# "<b>C1</b> " & Eval("Chld1Label") & " (" & Eval("Chld1ShLabel") & ") " & Eval("Chld1From") & "-" & Eval("Chld1Max") %>'
                                                                                        Visible='<%# Eval("ChldCategories") > 0 %>' />
                                                                                    <asp:Label ID="Label8" runat="server" Text='<%# "<br /><b>C2</b> " & Eval("Chld2Label") & " (" & Eval("Chld2ShLabel") & "): " & Eval("Chld2From") & "-" & Eval("Chld2Max") %>'
                                                                                        Visible='<%# Eval("ChldCategories") > 1 %>' />
                                                                                    <asp:Label ID="Label10" runat="server" Text='<%# "<br /><b>C3</b> " & Eval("Chld3Label") & " (" & Eval("Chld3ShLabel") & "): " & Eval("Chld3From") & "-" & Eval("Chld3Max") %>'
                                                                                        Visible='<%# Eval("ChldCategories") > 2 %>' />
                                                                                    <asp:Label ID="Label11" runat="server" Text='<%# "<br /><b>C4</b> " & Eval("Chld4Label") & " (" & Eval("Chld4ShLabel") & "): " & Eval("Chld4From") & "-" & Eval("Chld4Max") %>'
                                                                                        Visible='<%# Eval("ChldCategories") > 3 %>' />
                                                                                </td>
                                                                            </tr>
                                                                        </table> 
                                                                    </ItemTemplate>
                                                                </asp:FormView>
                                                                
                                                                <asp:ObjectDataSource ID="dsRLog" runat="server" 
                                                                    TypeName="dsInvoiceFormTableAdapters.RateSuspendLogTableAdapter" 
                                                                    SelectMethod="GetData" >
                                                                    <SelectParameters>
                                                                        <asp:ControlParameter ControlID="hfRateId" Name="RateID" PropertyName="Value" Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:ObjectDataSource>
                                                                <asp:FormView ID="fvRLog" runat="server" DataSourceID="dsRLog" Width="100%" >
                                                                    <RowStyle CssClass="Red" Font-Size="Small" Font-Bold="false" Font-Italic="true" />
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblSTime" runat="server" Text='<%# "[" & Eval("SuspendTime") & "]:" %>' />&nbsp;
                                                                        <asp:Label ID="lblSMsg" runat="server" Text='<%# Eval("SuspendMsg") %>' Font-Bold="true" />
                                                                    </ItemTemplate>
                                                                </asp:FormView>
                                                                
                                                            </asp:Panel>                                                                
                                                        <!-- /Rate Info -->
                                                    </td>
                                                    <td class="PreRow" style="text-align: center;">
                                                        <asp:Label ID="ArrivalLabel" runat="server" Text='<%# Eval("Arrival","{0:d}") %>' />
                                                    </td>
                                                    <td class="PreRow" style="text-align: center;">
                                                        <asp:Label ID="DepartureLabel" runat="server" Text='<%# Eval("Departure","{0:d}") %>' />
                                                    </td>
                                                    <td class="PreRow" style="width: 60px; text-align: center;">
                                                        <asp:Label ID="TravelNightsLabel" runat="server" Text='<%# Eval("TravelNights") %>' ToolTip="Travel nights" />
                                                    </td>
                                                    <td class="PreRow" style="width: 60px; text-align: center;">
                                                        <asp:Label ID="ChargedNightsLabel" runat="server" Text='<%# Eval("ChargedNights") %>' ToolTip="Charged nights" />
                                                        <asp:ImageButton ID="imgChNts" runat="server" style="float: right; padding-right: 2px; padding-top: 2px;" 
                                                            ImageUrl="~/Images/edit.gif" CommandName="Edit"
                                                            Visible='<%# Eval("Penalty") AND Not (IsDefinitive OR IsCancelled) %>' />
                                                    </td>
                                                    <td class="PreRow" style="text-align: right;">
                                                        <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount","{0:N2}") %>' 
                                                            Visible='<%# Not cbHotel.Checked %>' ToolTip='<%# Eval("InvResID") %>' />
                                                        <asp:Label ID="HAmountLabel" runat="server" Text='<%# Eval("HAmount","{0:N2}") %>' 
                                                            Visible='<%# cbHotel.Checked %>' ToolTip='<%# Eval("InvResID") %>' />
                                                    </td>
                                                </tr>
                                                <%--
                                                    InvResID:       <asp:Label ID="InvResIDLabel" runat="server" Text='<%# Eval("InvResID") %>' />
                                                    AddOn:          <asp:Label ID="AddOnLabel" runat="server" Text='<%# Eval("AddOn") %>' />
                                                    RateID:         <asp:Label ID="RateIDLabel" runat="server" Text='<%# Eval("RateID") %>' />
                                                    RateType:       <asp:Label ID="RateTypeLabel" runat="server" Text='<%# Eval("RateType") %>' />
                                                    HotelPercent:   <asp:Label ID="HotelPercentLabel" runat="server" Text='<%# Eval("HotelPercent") %>' />
                                                    AmountAdult:    <asp:Label ID="AmountAdultLabel" runat="server" Text='<%# Eval("AmountAdult") %>' />
                                                    AmountExtra:    <asp:Label ID="AmountExtraLabel" runat="server" Text='<%# Eval("AmountExtra") %>' />
                                                    AmountChld1:    <asp:Label ID="AmountChld1Label" runat="server" Text='<%# Eval("AmountChld1") %>' />
                                                    AmountChld2:    <asp:Label ID="AmountChld2Label" runat="server" Text='<%# Eval("AmountChld2") %>' />
                                                    AmountChld3:    <asp:Label ID="AmountChld3Label" runat="server" Text='<%# Eval("AmountChld3") %>' />
                                                    AmountChld4:    <asp:Label ID="AmountChld4Label" runat="server" Text='<%# Eval("AmountChld4") %>' />
                                                --%>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <tr>
                                                    <td>
                                                        <asp:HiddenField ID="hfResID" runat="server" Value='<%# Eval("InvResID") %>' />
                                                    </td>
                                                    <td class="PreRow" style="text-align: left; font-style: italic; font-weight: bold;
                                                        vertical-align: middle; padding: 2px 2px 0px 5px;">
                                                        <asp:Label ID="lblRateCode" runat="server" Text='<%# Eval("RateCodeID") %>' />
                                                    </td>
                                                    <td class="PreRow" style="text-align: center;">
                                                        <asp:Label ID="ArrivalLabel" runat="server" Text='<%# Eval("Arrival","{0:d}") %>' />
                                                    </td>
                                                    <td class="PreRow" style="text-align: center;">
                                                        <asp:Label ID="DepartureLabel" runat="server" Text='<%# Eval("Departure","{0:d}") %>' />
                                                    </td>
                                                    <td class="PreRow" style="width: 60px; text-align: center;">
                                                        <asp:Label ID="TravelNightsLabel" runat="server" Text='<%# Eval("TravelNights") %>' ToolTip="Travel nights" />
                                                    </td>
                                                    <td class="PreRow" style="width: 60px; text-align: center;">
                                                        <asp:DropDownList ID="ddlChgNhs" runat="server" ToolTip="Charged nights" CssClass="TextBox" Width="40px"
                                                            SelectedValue='<%# Eval("ChargedNights") %>'
                                                            AutoPostBack="true"
                                                            OnDataBinding="ddlChgNts_DataBinding"
                                                            OnSelectedIndexChanged="ddlChgNts_SelectedIndexChanged" />
                                                        <asp:ImageButton ID="imgChNts" runat="server" style="float:right; padding-top: 2px;" 
                                                            ImageUrl="~/Images/cancel_big.gif" CommandName="Cancel" />
                                                    </td>
                                                    <td class="PreRow" style="text-align: right;">
                                                        <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount","{0:N2}") %>' 
                                                            Visible='<%# Not cbHotel.Checked %>' />
                                                        <asp:Label ID="HAmountLabel" runat="server" Text='<%# Eval("HAmount","{0:N2}") %>' 
                                                            Visible='<%# cbHotel.Checked %>' />
                                                    </td>
                                                </tr>
                                            </EditItemTemplate>
                                            <FooterTemplate>
                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td>
                                                    <td colspan="5" style="text-align: left; font-style: italic; font-weight: bold; border-top: solid 2px; padding-top: 5px;">
                                                        &nbsp;
                                                    </td>
                                                    <td colspan="1" style="text-align: right; font-style: italic; font-weight: bold; border-top: solid 2px; padding-top: 5px;">
                                                        <asp:LinkButton ID="lnkSupplement" runat="server" Text="Add Supplement" 
                                                            Visible='<%# Not IsDefinitive AND ShowSuppLink() %>'
                                                            OnClientClick='<%# ShowSuppModalText() %>' />
                                                    </td>
                                                </tr>
                                                </table></FooterTemplate>
                                        </asp:DataList>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel ID="tpPayments" runat="server" HeaderText="<b>Proforma Payments</b>" Style="float: left;">
                                    <HeaderTemplate>
                                        <b>Proforma Payments</b></HeaderTemplate>
                                    <ContentTemplate>
                                        <div class="normal">
                                        <asp:UpdatePanel ID="upPayments" runat="server">
                                            <ContentTemplate>
                                            <asp:Repeater ID="rptPayments" runat="server" DataSourceID="dsPayments" >
                                                <HeaderTemplate>
                                                    <table cellpadding="0" cellspacing="0" style="border-collapse: collapse; border: solid 1px;">
                                                        <tr>
                                                            <td class="PreRowHead" rowspan="2" style="width: 20px;">
                                                                &nbsp;
                                                            </td>
                                                            <td class="PreRowHead" rowspan="2" style="width: 315px;">
                                                                Guest Name
                                                            </td>
                                                            <td class="PreRowHead" rowspan="2" style="width: 100px;">
                                                                Bk Number
                                                            </td>
                                                            <td class="PreRowHead" rowspan="2" style="width: 100px;">
                                                                Bill
                                                            </td>
                                                            <td class="PreRowHead" rowspan="1" style="width: 200px;" colspan="2">
                                                                Payment
                                                            </td>
                                                            <td class="PreRowHead" rowspan="2" style="width: 100px;">
                                                                Total
                                                            </td>
                                                            <td class="PreRowHead" rowspan="2" style="width: 100px;">
                                                                Status
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="PreRowHead" style="width: 100px;">
                                                                Applied
                                                            </td>
                                                            <td class="PreRowHead" style="width: 100px;">
                                                                Reserved
                                                            </td>
                                                        </tr>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Panel ID="pnlHotel" runat="server" Visible='<%# Eval("rnH")=0 %>'>
                                                        <tr>
                                                            <td class="PreRowHeadSel" colspan="8" style="text-align: left;">
                                                                <asp:Label ID="lblHotelName" runat="server" Text='<%# Eval("Hotel") %>' />
                                                            </td>
                                                        </tr>
                                                    </asp:Panel>
                                                    <asp:Panel ID="Panel3" runat="server" Visible='<%# Eval("rnH")>0 %>'>
                                                    <asp:Panel ID="Panel4" runat="server" Visible='<%# Eval("AccResID")=0 %>'>
                                                        <tr>
                                                            <td class="PreRow" style="border-style: solid solid none solid; text-align: left; padding: 2px;">
                                                                <asp:ImageButton ID="ibSelect" runat="server" Width="17px" Height="17px" CausesValidation="False"
                                                                    ImageUrl='<%# BookingStateIcon(Eval("InHouseState")) %>'
                                                                    ToolTip='<%# Eval("BookingID") %>'
                                                                    CommandArgument='<%# Eval("BookingID") %>' CommandName="Select" />
                                                            </td>
                                                            <td class="PreRow" style="border-style: solid solid none solid; text-align: left;">
                                                                <asp:LinkButton ID="lbSelect" runat="server" Text='<%# Eval("PreInvText") %>' CausesValidation="false"
                                                                    ToolTip='<%# Eval("FolioFull") %>' 
                                                                    CommandArgument='<%# Eval("BookingID") %>' CommandName="Select" />
                                                            </td>
                                                            <td class="PreRow" style="border-style: solid solid none solid;">
                                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("BkNumber") %>' />
                                                            </td>
                                                            <td class="PreRow" style="text-align: right;">
                                                                <asp:Label ID="Label3c" runat="server" Text='<%# Eval("InvResTotal","{0:N2}") %>' />
                                                            </td>
                                                            <td class="PreRow" colspan="2" >
                                                                &nbsp;
                                                            </td>
                                                            <td class="PreRow" style="border-style: solid solid none solid; text-align: right;">
                                                                <asp:Label ID="Label34" runat="server" Text='<%# Eval("InvResBalance","{0:N2}") %>' />
                                                            </td>
                                                            <td class="PreRow" style="border-style: solid solid none solid; text-align: right;">
                                                                <asp:Panel ID="Panel6" runat="server" Visible='<%# Eval("InvResTotal")>0 Or Eval("InvResBalance")<>0 %>'>
                                                                <asp:Label ID="Label28" runat="server" Visible='<%# Eval("InvResBalance","{0:N2}")<0 %>' Text="Overpaid"/>
                                                                <asp:Label ID="Label32" runat="server" Visible='<%# Eval("InvResBalance","{0:N2}")=0 %>' Text="Paid"/>
                                                                <asp:Label ID="Label33" runat="server" Visible='<%# Eval("InvResBalance","{0:N2}")>0 %>' Text="Underpaid"/>
                                                                </asp:Panel>
                                                            </td>
                                                        </tr>
                                                    </asp:Panel>
                                                    <asp:Panel ID="Panel5" runat="server" Visible='<%# Eval("AccResID")>0 %>'>
                                                        <tr>
                                                            <td class="PreRow" style="border-style: none solid none solid;">
                                                                &nbsp;
                                                            </td>
                                                            <td class="PreRow" style="border-style: none solid none solid;">
                                                                &nbsp;
                                                            </td>
                                                            <td class="PreRow" style="border-style: none solid none solid;">
                                                                &nbsp;
                                                            </td>
                                                            <td class="PreRow" style="text-align: left;">
                                                                <asp:Label ID="Label38" runat="server" Text='<%# Eval("DocCode") & " " & Eval("DocNumber") %>' />
                                                            </td>
                                                            <td class="PreRow" style="text-align: right;">
                                                                <asp:Label ID="Label36" runat="server" Text='<%# Eval("AccAppAmount","{0:N2}") %>' />
                                                            </td>
                                                            <td class="PreRow" style="text-align: right;">
                                                                <asp:Label ID="Label35" runat="server" Text='<%# Eval("AccResAmount","{0:N2}") %>' />
                                                            </td>
                                                            <td class="PreRow" style="border-style: none solid none solid;">
                                                                &nbsp;
                                                            </td>
                                                            <td class="PreRow" style="border-style: none solid none solid;">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                    </asp:Panel>
                                                    </asp:Panel>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Panel ID="pnlFootNoData" runat="server" Visible='<%# rptProforma.Items.Count < 1 %>'>
                                                        <tr>
                                                            <td class="PreRowHeadSel" style="height: 25px;" colspan="8">
                                                                Proforma has no reservations at the moment
                                                            </td>
                                                        </tr>
                                                    </asp:Panel>
                                                    </table>
                                                </FooterTemplate>
                                            </asp:Repeater>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        </div>
                                    </ContentTemplate>
                                </asp:TabPanel>
                                <asp:TabPanel ID="tpChangeLog" runat="server" HeaderText="Change Log" Font-Bold="true" Style="float: left;">
                                    <ContentTemplate>
                                        <table cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td class="PreLogHead" style="width: 150px;">
                                                    <asp:DropDownList ID="dlLog" runat="server" CssClass="PreLogControl normal" AutoPostBack="True">
                                                        <asp:ListItem Text="Proforma" Value="1" Selected="True" />
                                                        <asp:ListItem Text="Booking" Value="2" />
                                                        <asp:ListItem Text="Reservation" Value="3" />
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="PreLogHead" style="width: 450px;">
                                                    <asp:DropDownList ID="dlProformaLog" runat="server" CssClass="PreLogControl normal">
                                                        <asp:ListItem Text="Full log" Value="1" Selected="True" />
                                                        <asp:ListItem Text="Proforma only" Value="2" />
                                                    </asp:DropDownList>
                                                    <asp:DropDownList ID="dlBookingLog" runat="server" CssClass="PreLogControl normal"
                                                        Visible="False" DataSourceID="dsLogForm" DataTextField="ForBooking" DataValueField="BookingID" />
                                                    <asp:DropDownList ID="dlReservationLog" runat="server" CssClass="PreLogControl normal"
                                                        Visible="False" DataSourceID="dsLogForm" DataTextField="ForReservation" DataValueField="FolioFull" />
                                                </td>
                                                <td class="PreLogHead">
                                                    <asp:LinkButton ID="btLogGo" runat="server">ShowLog</asp:LinkButton>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <asp:Repeater ID="rptLog" runat="server" Visible="false">
                                                        <HeaderTemplate>
                                                            <table cellpadding="0" cellspacing="0" style="border-collapse: collapse; border: solid 1px;">
                                                                <tr>
                                                                    <td class="PreRowHead" style="width: 120px;">
                                                                        Time
                                                                    </td>
                                                                    <td class="PreRowHead" style="width: 80px;">
                                                                        User
                                                                    </td>
                                                                    <td class="PreRowHead" style="width: 400px;">
                                                                        Booking
                                                                    </td>
                                                                    <td class="PreRowHead" style="width: 50px;">
                                                                        Detail
                                                                    </td>
                                                                    <td class="PreRowHead" style="width: 400px;">
                                                                        Log
                                                                    </td>
                                                                    <td class="PreRowHead" style="width: 120px;">
                                                                        Amount
                                                                    </td>
                                                                </tr>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td class="PreRow" style="text-align: left;">
                                                                    <asp:Label ID="lblDate" runat="server" Text='<%# Eval("LogTime","{0:d}") %>' />
                                                                    <asp:Label ID="lblTime" runat="server" Text='<%# Eval("LogTime","{0:t}") %>' />
                                                                </td>
                                                                <td class="PreRow" style="text-align: left;">
                                                                    <asp:Label ID="Label15" runat="server" Text='<%# Eval("LogUser") %>' />
                                                                </td>
                                                                <td class="PreRow" style="text-align: left;">
                                                                    <asp:Label ID="Label19" runat="server" Text='<%# "[" & Eval("BookingID") & "]" %>' Visible='<%# Not Eval("BookingID") Is DBNull.Value %>' />
                                                                    <asp:Label ID="Label20" runat="server" Text='<%# Eval("GuestName") %>' Visible='<%# Not Eval("GuestName") Is DBNull.Value %>' />
                                                                    <asp:Label ID="Label21" runat="server" Text='<%# "(" &  Eval("FolioFull") & ")" %>' Visible='<%# Not Eval("FolioFull") Is DBNull.Value %>' />
                                                                </td>
                                                                <td class="PreRow" style="text-align: left;">
                                                                    <asp:Label ID="Label17" runat="server" Text='<%# Eval("InvResID") %>' />
                                                                </td>
                                                                <td class="PreRow" style="text-align: left;">
                                                                    <asp:Label ID="Label16" runat="server" Text='<%# Eval("LogMessage") %>' />
                                                                </td>
                                                                <td class="PreRow" style="text-align: right;">
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
                                                        <FooterTemplate>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:TabPanel>
                            </asp:TabContainer>
                        </td>
                    </tr>
                </table>

                <asp:UpdateProgress ID="upProcessing" runat="server">
                    <ProgressTemplate>
                        <div id="Div1" runat="server" align="center" valign="center" 
                            style="position: absolute; left: 5%; top: 5%; visibility: visible; border: none; z-index: 100; 
                                   width: 90%; height: 90%; background: White; filter: alpha(opacity=80); -moz-opacity:.8; opacity:.8;">
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/status_anim.gif" />&nbsp;Processing...
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
            <div class="Green">
                <asp:HiddenField ID="dummy" runat="server" />
                <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
                    PopupDragHandleControlID="popLabel" CancelControlID="btnYes" DropShadow="True"
                    BackgroundCssClass="modalBackground" TargetControlID="dummy" X="120" Y="200">
                </asp:ModalPopupExtender>
                <asp:Panel ID="popPanel" runat="server" Width="400px" BackColor="White" Style="display: none">
                    <table cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                            <td class="GridLabelBG">
                                <asp:Label ID="popLabel" runat="server" Text="Title" SkinID="skGridLabel" />
                            </td>
                        </tr>
                        <tr>
                            <td class="GridBorder" style="text-align: center;">
                                <asp:Label ID="popMessage" runat="server" Text="Message" />
                                <div style="text-align: right; padding: 10px;" class="GridRow1T">
                                    <asp:Button ID="btnYes" runat="server" Text="OK" SkinID="skBtnBase" Width="80px" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </div>
            <%--<div class="Red">
                <asp:ModalPopupExtender ID="popWarning" runat="server" PopupControlID="pnlWarning"
                    PopupDragHandleControlID="popLabel" CancelControlID="btnWarningNo" DropShadow="True"
                    BackgroundCssClass="modalBackground" TargetControlID="dummy" X="120" Y="200"
                    BehaviorID="WarningPop" >
                </asp:ModalPopupExtender>
                <asp:Panel ID="pnlWarning" runat="server" Width="400px" BackColor="White" Style="display: none">
                    <table cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                            <td class="GridLabelBG">
                                <asp:Label ID="Label1" runat="server" Text="Warning" SkinID="skGridLabel" />
                            </td>
                        </tr>
                        <tr>
                            <td class="GridBorder" style="text-align: center;">
                                <p>
                                    This Proforma can't be printed on standard layout as some of applied rates won't be presented.
                                </p>
                                <p>
                                    Do you want to print it anyway?
                                </p>
                                <div style="text-align: right; padding: 10px 0px 0px 0px;" class="GridRow1T">
                                    <asp:Button ID="btnWarningYes" runat="server" CssClass="ButtonGreen" Text="Yes" Width="80px" OnClientClick="{$find('WarningPop').hide();}" />
                                    <asp:Button ID="btnWarningNo" runat="server" CssClass="ButtonRed" Text="No"  Width="80px" />
                                    <asp:Button ID="btnWarningNC" runat="server" CssClass="ButtonBlue" Text="Flat Layout" OnClientClick="{$find('WarningPop').hide();}" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </div>--%>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="fvInvoiceHead" />
            <asp:AsyncPostBackTrigger ControlID="tabProforma" />
        </Triggers>
    </asp:UpdatePanel>
    
    
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
    <asp:ObjectDataSource ID="dsDetails" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByID" TypeName="dsProformaTableAdapters.InvDocItemsTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="13" Name="InvDocID" QueryStringField="ProformaID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsBooking" runat="server" OldValuesParameterFormatString="original_{0}"
        TypeName="dsProformaTableAdapters.InvDocDetailTableAdapter"
        SelectMethod="GetDataByID" 
        UpdateMethod="BookingUpdate" >
        <SelectParameters>
            <asp:ControlParameter ControlID="hdBookingID" DefaultValue="16924" Name="BookingID" PropertyName="Value" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="User" Type="String" />
            <asp:QueryStringParameter Name="InvDocID" Type="Int32" QueryStringField="ProformaID" />
            <asp:SessionParameter Name="BookingID" Type="Int32" SessionField="SelectedBookingID" />
            <asp:Parameter Name="BkDate" Type="DateTime" />
            <asp:Parameter Name="BkNumber" Type="String" />
            <asp:Parameter Name="CheckIn" Type="DateTime" />
            <asp:Parameter Name="CheckOut" Type="DateTime" />
            <asp:Parameter Name="RoomTypeId" Type="String" />
            <asp:Parameter Name="GuestName" Type="String" />
            <asp:Parameter Name="Adult" Type="Int32" />
            <asp:Parameter Name="Infant" Type="Int32" />
            <asp:Parameter Name="Child" Type="Int32" />
            <asp:Parameter Name="Junior" Type="Int32" />
            <asp:Parameter Name="Junior2" Type="Int32" />
            <asp:Parameter Name="CompAdult" Type="Int32" />
            <asp:Parameter Name="CompChild" Type="Int32" />
            <asp:Parameter Name="CompJunior" Type="Int32" />
        </UpdateParameters>
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
    
    <asp:ObjectDataSource ID="dsPayments" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="dsProformaApplicationTableAdapters.ProformaPaymentTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="InvDocID" QueryStringField="ProformaID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsTotal" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="dsProformaApplicationTableAdapters.ProformaTotalTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="InvDocID" QueryStringField="ProformaID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsApplications" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="dsProformaApplicationTableAdapters.ProformaAccdocumentTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="InvDocID" QueryStringField="ProformaID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
</asp:Content>
