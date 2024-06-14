<%@ Page Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="ProFormDetailPayments.aspx.vb" Inherits="Proforma_ProFormDetailPayments" enableEventValidation="false" %>

<%@ Register src="~/App_UserControls/MessagePop.ascx" tagname="MessagePop" tagprefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Proforma
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" runat="Server">

    <script type="text/javascript">
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
    </script>

    <%--<Payment popup>--%>
    <asp:ModalPopupExtender runat="server" BackgroundCssClass="modalBackground" ID="paymentPopupExtender"
        X="100" Y="120" TargetControlID="dummyPayment" OkControlID="dummyPaymentOk" CancelControlID="dummyPaymentClose"
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
                    <asp:UpdatePanel ID="upHeader" runat="server" UpdateMode="Conditional" >
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
                                            <td style="vertical-align: top;" rowspan="7" colspan="4">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="GridRow1B" style="vertical-align: top;"><b>State</b></td>
                                            <td class="GridRow1B" >
                                                <asp:Label ID="InvDocStateLabel" runat="server" Text='<%# Eval("InvDocStateDesc") %>' />
                                                <asp:HiddenField ID="hfInvDocState" runat="server" Value='<%# Eval("InvDocState") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="GridRowClear" style="vertical-align: top;"><b>Payments</b></td>
                                            <td class="GridRowClear">
                                            <asp:Repeater ID="rptTotal" runat="server" DataSourceID="dsTotal" >
                                                <HeaderTemplate>
                                                    <table cellpadding="0" cellspacing="0">
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td style="width: 175px; text-align: right;"><i>Proforma</i></td>
                                                        <td style="width: 100px; text-align: right;">
                                                            <%# Eval("BookingAmount","{0:N2}") %>
                                                        </td>
                                                        <td style="width: 100px; text-align: right;"><b><i>Applied</i></b></td>
                                                        <td style="width: 105px; text-align: right; padding-right: 5px;"><b><i>Reserved</i></b></td>
                                                    </tr>                                            
                                                    <asp:Repeater ID="rptApplications" runat="server" DataSourceID="dsApplications" >
                                                        <ItemTemplate>
                                                        <tr>
                                                            <td style="width: 175px; text-align: right; border-top: solid 1px;">
                                                                <asp:LinkButton ID="Label44" runat="server" Text='<%# Eval("DocCode") & " " & Eval("DocNumber")  %>'
                                                                    OnClientClick='<%# ShowPaymentModalText(Eval("DocumentID")) %>' />
                                                            </td>
                                                            <td style="width: 100px; border-top: solid 1px;"></td>
                                                            <td style="width: 100px; text-align: right; border-top: solid 1px;">
                                                                <%# Eval("AccAppAmount","{0:N2}") %>
                                                            </td>
                                                            <td style="width: 105px; text-align: right; padding-right: 5px; border-top: solid 1px;">
                                                                <%# Eval("AccResAmount","{0:N2}") %>
                                                            </td>
                                                        </tr>                                            
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                        <tr>
                                                            <td class="GridRow1T" style="text-align: right;" colspan="2"><b><i>Total Payments</i></b></td>
                                                            <td class="GridRow1T" style="text-align: right;">
                                                                <%# Eval("AppAmount","{0:N2}") %>
                                                            </td>
                                                            <td class="GridRow1T" style="text-align: right; padding-right: 5px;">
                                                                <%# Eval("ResAmount","{0:N2}") %>
                                                            </td>
                                                        </tr>                                            
                                                        <tr>
                                                            <td style="border-top: solid 1px; text-align: right;" colspan="3">Overpayment</td>
                                                            <td style="border-top: solid 1px; text-align: right; padding-right: 5px;">
                                                                <%# Eval("Overpayment","{0:N2}") %>
                                                            </td>
                                                        </tr>                                            
                                                        <tr>
                                                            <td style="text-align: right; border-top: solid 1px;" colspan="3">Underpayment</td>
                                                            <td style="text-align: right; border-top: solid 1px; padding-right: 5px;">
                                                                <%# Eval("Underpayment","{0:N2}") %>
                                                            </td>
                                                        </tr>                                            
                                                    </table>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="GridRow2T Green" style="height: 30px;">
                                                <%--<div class="Green">--%>
                                                <asp:Button ID="btBatch" runat="server" SkinID="skBtnBase" Text="Payment Batch" 
                                                    OnClick="btBatch_Click" />
                                                <%--</div>--%>
                                            </td>
                                            <td class="GridRow2T" colspan="1" style="height: 30px; text-align: right;">
                                                <asp:Button ID="btnPayment" runat="server" SkinID="skBtnBase" Text="New Payment" 
                                                    OnClientClick='<%# ShowPaymentModalText() %>' CommandName="payNew"  />
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:FormView>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="dummyPaymentRefresh" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <br />
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top;">
                    <div style="padding-bottom: 5px; background-image: url(../Images/BlueFullSmall.gif); background-position: center; height: 20px; ">
                        <asp:LinkButton ID="lbDetails" runat="server" Text="Proforma Details"
                            style="font-weight: bold; color: White; padding: 5px 10px 5px 10px; border-top: solid 2px; text-decoration: none;" />
                        <span style="padding: 5px; background-color: White; border-top: solid 2px; border-right: solid 2px; border-bottom: solid 2px White; border-left: solid 2px; font-weight: bold; font-size: larger;" >
                            Proforma Payments
                        </span>
                        <asp:LinkButton ID="lbLog" runat="server" Text="Change Log"
                            style="font-weight: bold; color: White; padding: 5px 10px 5px 10px; border-top: solid 2px; border-right: solid 2px; text-decoration: none;" />
                    </div>
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="border: solid 2px; padding: 8px;" >
                            <asp:UpdatePanel ID="upDetail" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                <asp:Repeater ID="rptPayments" runat="server" DataSourceID="dsPayments" >
                                    <HeaderTemplate>
                                        <table cellpadding="0" cellspacing="0" style="border-collapse: collapse; border: solid 1px;">
                                            <tr>
                                                <td class="PreRowHead" rowspan="2" style="width: 20px;">
                                                    <%--<asp:Image ID="ibSelect" runat="server" Width="17px" Height="17px"
                                                        ImageUrl="~/Images/cancel.png"
                                                        ToolTip="Cancelled" />--%>
                                                </td>
                                                <td class="PreRowHead" rowspan="2" style="width: 315px;">
                                                    <%--<asp:CheckBox ID="showCanc" runat="server" TextAlign="Left" Text="Show" style="float: left;" OnCheckedChanged="showCanc_CheckChanged" AutoPostBack="true" />--%>
                                                    Guest Name
                                                </td>
                                                <td class="PreRowHead" rowspan="2" style="width: 100px;">Bk Number</td>
                                                <td class="PreRowHead" rowspan="2" style="width: 100px;">Bill</td>
                                                <td class="PreRowHead" rowspan="1" style="width: 200px;" colspan="2">Payment</td>
                                                <td class="PreRowHead" rowspan="2" style="width: 100px;">Total</td>
                                                <td class="PreRowHead" rowspan="2" style="width: 100px;">Status</td>
                                            </tr>
                                            <tr>
                                                <td class="PreRowHead" style="width: 100px;">Applied</td>
                                                <td class="PreRowHead" style="width: 100px;">Reserved</td>
                                            </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Panel ID="pnlHotel" runat="server" Visible='<%# Eval("rnH")=0 %>'>
                                            <tr>
                                                <td class="PreRowHeadSel" colspan="8" style="text-align: left;">
                                                    <%# Eval("Hotel") %>
                                                </td>
                                            </tr>
                                        </asp:Panel>
                                        <asp:Panel ID="Panel3" runat="server" Visible='<%# Eval("rnH")>0 %>'>
                                        <asp:Panel ID="Panel4" runat="server" Visible='<%# Eval("AccResID")=0 %>'>
                                            <tr>
                                                <td class="PreRow" style="border-style: solid none none solid; text-align: left; padding: 2px;">
                                                    <asp:Image ID="ibSelect" runat="server" Width="17px" Height="17px"
                                                        ImageUrl='<%# BookingStateIcon(Eval("InHouseState")) %>'
                                                        ToolTip='<%# Eval("BookingID") %>' />
                                                </td>
                                                <td class="PreRow" style="border-style: solid solid none none; text-align: left;">
                                                    <asp:Label ID="lbSelect" runat="server" Text='<%# Eval("PreInvText") %>' ToolTip='<%# Eval("FolioFull") %>' />
                                                </td>
                                                <td class="PreRow" style="border-style: solid solid none solid;">
                                                    <%# Eval("BkNumber") %>
                                                </td>
                                                <td class="PreRow" style="text-align: right;">
                                                    <%# Eval("InvResTotal","{0:N2}") %>
                                                </td>
                                                <td class="PreRow" colspan="2" >&nbsp;</td>
                                                <td class="PreRow" style="border-style: solid solid none solid; text-align: right;">
                                                    <%# Eval("InvResBalance","{0:N2}") %>
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
                                                <td class="PreRow" style="border-style: none none none solid;">&nbsp;</td>
                                                <td class="PreRow" style="border-style: none solid none none;">&nbsp;</td>
                                                <td class="PreRow" style="border-style: none solid none none;">&nbsp;</td>
                                                <td class="PreRow" style="text-align: left;">
                                                    <%# Eval("DocCode") & " " & Eval("DocNumber") %>
                                                </td>
                                                <td class="PreRow" style="text-align: right;">
                                                    <%# Eval("AccAppAmount","{0:N2}") %>
                                                </td>
                                                <td class="PreRow" style="text-align: right;">
                                                    <%# Eval("AccResAmount","{0:N2}") %>
                                                </td>
                                                <td class="PreRow" style="border-style: none solid none none;">&nbsp;</td>
                                                <td class="PreRow" style="border-style: none solid none none;">&nbsp;</td>
                                            </tr>
                                        </asp:Panel>
                                        </asp:Panel>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Panel ID="pnlFootNoData" runat="server" Visible='<%# rptPayments.Items.Count < 1 %>'>
                                            <tr>
                                                <td class="PreRowHeadSel" style="height: 25px;" colspan="8">
                                                    Proforma has no reservations at the moment
                                                </td>
                                            </tr>
                                        </asp:Panel>
                                        </table>
                                    </FooterTemplate>
                                </asp:Repeater>
                                <%--<asp:CheckBox ID="showCanc" runat="server" Text="Show Cancelled" 
                                    style="position: relative; top: 300px; left: 30px;" />--%>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="fvInvoiceHead" />
                                    <asp:AsyncPostBackTrigger ControlID="dummyPaymentRefresh" />
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
