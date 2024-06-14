<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" MaintainScrollPositionOnPostback="true" 
    CodeFile="ProformaForm.aspx.vb" Inherits="Invoices_ProformaForm" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Proforma Detail
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" runat="Server">
    <script language="javascript" type="text/javascript">

        var requestManager = Sys.WebForms.PageRequestManager.getInstance();
        requestManager.add_initializeRequest(CancelPostbackForSubsequentSubmitClicks);

        function CancelPostbackForSubsequentSubmitClicks(sender, args) {
            if (requestManager.get_isInAsyncPostBack() & args.get_postBackElement().id == 'ctl00_MasterContent_fvInvoice_cbRVCci')
            {
                args.set_cancel(true);                
            }
        }

        function ShowStayModal(BillingID) {
            var frame = $get('IframeStay');
            frame.src = "InvoiceFormSGrid.aspx?BillingID=" + BillingID + "&Edit=1";
            $find("StayModalPopup")._backgroundElement.onclick = function() { document.getElementById("dumyStayCancel").click(); }
            $find('StayModalPopup').show();
        }
        function RateUpdated() {
            document.getElementById('<%=dumyRefresh.ClientID%>').click();
        }

        function ShowSuppModal(DetailID) {
            var frame = $get('IframeSupp');
            frame.src = "InvoiceFormPGrid.aspx?DetailID=" + DetailID + "&Edit=1";
            $find("SuppModalPopup")._backgroundElement.onclick = function() { document.getElementById("dumySuppCancel").click(); }
            $find('SuppModalPopup').show();
        }
        function SuppUpdated() {
            document.getElementById('<%=dumyRefresh.ClientID%>').click();
        }
    </script>

    <asp:HiddenField ID="hfLog" runat="server" Value="False" />
    <asp:Button ID="dumyRefresh" runat="server" Style="display: none;" OnClick="btnRefersh_Click" />

    <asp:ModalPopupExtender runat="server" BackgroundCssClass="modalBackground"
        ID="stayPopExtender" 
        X="0"
        Y="150"
        TargetControlID="dumyStayRate"
        OkControlID="dumyStayOK" 
        CancelControlID="dumyStayCancel" 
        PopupControlID="stayPopDiv" 
        OnOkScript="RateUpdated();"
        BehaviorID="StayModalPopup">
    </asp:ModalPopupExtender>
    <div style="display: none">
        <asp:Button ID="dumyStayRate" runat="server" Style="display: none;" />
        <input id="dumyStayOK" value="Done" type="button" />
        <input id="dumyStayCancel" value="Cancel" type="button" />
    </div>
    <div id="stayPopDiv" style="display: none;" >
        <iframe id="IframeStay" frameborder="0" style="width: 1320px; height: 550px; overflow: visible;" scrolling="no" marginheight="10px" marginwidth="10px">
        </iframe>
    </div> 

    <asp:ModalPopupExtender runat="server" BackgroundCssClass="modalBackground"
        ID="supplPopExtender" 
        X="0"
        Y="150"
        TargetControlID="dumySuppRate"
        OkControlID="dumySuppOK" 
        CancelControlID="dumySuppCancel" 
        PopupControlID="suppPopDiv" 
        OnOkScript="SuppUpdated();"
        BehaviorID="SuppModalPopup">
    </asp:ModalPopupExtender>
    <div style="display: none">
        <asp:Button ID="dumySuppRate" runat="server" />
        <input id="dumySuppOK" value="Done" type="button" />
        <input id="dumySuppCancel" value="Cancel" type="button" />
    </div>
    <div id="suppPopDiv" style="display: none;" >
        <iframe id="IframeSupp" frameborder="0" style="width: 1460px; height: 520px; overflow: visible;" scrolling="no" marginheight="10px" marginwidth="10px">
        </iframe>
    </div>

    <div id="InvDet" class="Blue" >
        <table cellpadding="0" cellspacing="0" style="width: 100%;">
            <tr>
                <td class="LocalMenuRow" style="width: 130px;">
                    <asp:HyperLink ID="linkBack" runat="server" SkinID="skHypLink" NavigateUrl="~/Invoices/Proformas.aspx" Text="&lt;&lt; Back to Proformas" />
                </td>
                <td class="LocalMenuRow">&nbsp;</td>
            </tr>
        </table>
        <asp:UpdatePanel ID="UpdatePanelMain" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table style="width: 100%;">
                    <tr>
                        <td>
                            <asp:FormView ID="fvInvoiceHead" runat="server" Width="100%"
                                DataSourceID="dsInvoice" DataKeyNames="HotelId" >
                                <ItemTemplate>
                                    <asp:HiddenField ID="hfState" runat="server" Value='<%# Eval("State") %>' />
                                    <asp:HiddenField ID="fhCCIReview" runat="server" Value='<%# Eval("CCIReview") %>' />
                                    <asp:HiddenField ID="fhAppAmount" runat="server" Value='<%# Eval("AppAmount") %>' />
                                    <asp:HiddenField ID="hfDeliveryDate" runat="server" Value='<%# Eval("DeliveryDate") %>' />
                                    <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                        <tr>
                                            <td class="GridLabelBG" colspan="4"  style="border-bottom: solid 1px White;">
                                                <asp:Label ID="Label30" runat="server" SkinID="skGridLabel" Text='<%# "Proforma No&nbsp;<h6>" & Eval("InvNumber") & "</h6>" %>' />
                                                <asp:Label ID="Label9" runat="server" SkinID="skGridLabel" Text='<%# Eval("InvTypeDisp") %>'
                                                    Visible='<%# iif(Eval("InvType") >1,True,False) %>' />
                                                <asp:Label ID="Label8" runat="server" SkinID="skGridLabel" Text='<%# "For Group:&nbsp;<h6>" & Eval("ResGroup") & "</h6>" %>'
                                                    Visible='<%# iif(Eval("InvType") =1,True,False) %>' />
                                                <asp:Label ID="Label5" runat="server" SkinID="skGridLabel" style="background-color: Transparent; font-style: italic; margin-left: 15px;">
                                                    <span style="padding: 0px 5px; border-radius: 4px; background-color: White;"><h6>SH</h6></span>
                                                </asp:Label>
                                            </td>
                                            <td class="GridLabelBG" colspan="2" style="border-bottom: solid 1px;">&nbsp;</td>
                                            <td class="GridLabelBG"  style="border-bottom: solid 1px White;">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="width: 30px;" rowspan="4">&nbsp;</td>
                                            <td style="width: 120px;" class="GridRow1B"><b>Hotel</b></td>
                                            <td style="width: 580px;" class="GridRow1B">
                                                (<asp:Label ID="Label2" runat="server" Text='<%# Eval("HotelId") %>' />)
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("Hotel") %>' Font-Bold="true" />
                                            </td>
                                            <td style="width: 10px;" rowspan="4">&nbsp;</td>
                                            <td style="text-align: center; padding: 3px; border-left: solid 1px;" >
                                                <asp:CheckBox ID="cbSeparateCh" runat="server" Text="Separate Children" Checked= "true" />
                                            </td>
                                            <td style="text-align: center; padding: 3px; border-right: solid 1px;" >
                                                <asp:CheckBox ID="cbExcludeCM" runat="server" Text="Exclude CM" Checked= "true" />
                                            </td>
                                            <td rowspan="4">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="width: 120px; border-bottom: 1px none;" ><b>Billing to</b></td>
                                            <td style="width: 580px; border-bottom: 1px solid;">
                                                <asp:Label ID="Label25" runat="server" Text='<%# "(" & Eval("TourOpId") & ")" %>' />
                                                <asp:Label ID="Label24" runat="server" Text='<%# Eval("BillingName") %>' Font-Bold="true" />
                                            </td>
                                            <td style="width: 120px; text-align: center; padding: 3px; border-left: solid 1px;" rowspan="2" >
                                                <asp:Button ID="btnPrint" runat="server" CommandName="Print" SkinID="skBtnBase" Text="Print Proforma"
                                                    Width="100px" OnClick="btnPrint_Click" />
                                            </td>
                                            <td style="width: 120px; text-align: center; padding: 3px; border-right: solid 1px;" rowspan="2" >
                                                <asp:Button ID="btnExcel" runat="server" CommandName="XLSExport" SkinID="skBtnBase" Text="Export to Excel"
                                                    Width="100px" OnClick="btnExcel_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 120px;" class="GridRow1B">Tour Operator</td>
                                            <td style="width: 580px;" class="GridRow1B">
                                                <asp:Label ID="Label50" runat="server" Text='<%# "(" & Eval("TourOpId") & ")" %>' ForeColor="Transparent" />
                                                <asp:Label ID="Label52" runat="server" Text='<%# Eval("TourOp") %>' />
                                            </td>
                                        </tr>


                                        <tr>
                                            <td style="width: 120px;" class="GridRow1B"><b>Travel</b></td>
                                            <td style="width: 580px;" class="GridRow1B">
                                                <asp:Label ID="Label14" runat="server" Text='<%# Eval("CheckIn", "{0:d}") %>' style="width: 100px; text-align:center;" />
                                                <asp:Label ID="Label4" runat="server" Text="-" style="width: 50px; text-align:center;" />
                                                <asp:Label ID="Label16" runat="server" Text='<%# Eval("CheckOut", "{0:d}") %>' style="width: 100px; text-align:center;" />
                                                <asp:Label ID="Label17" runat="server" Text='<%# "(" & Eval("Nights") & " Nights)" %>' style="width: 100px; text-align:left;" />
                                            </td>
                                            <td style="text-align: center; padding: 3px; border-top: solid 1px;" colspan="2" >
                                                <asp:Button ID="btnXML" runat="server" CommandName="XMLExport" SkinID="skBtnBase" Text="Export to XML"
                                                    Width="100px" OnClick="btnXML_Click" Visible="false" />
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <EmptyDataTemplate >
                                    <div class="GridLabelBG" style="width: 100%;" >
                                        <asp:Label ID="Label30" runat="server" SkinID="skGridLabel">
                                            <h6>Sorry, no such invoice!</h6>
                                        </asp:Label>
                                    </div>
                                </EmptyDataTemplate>
                            </asp:FormView>
                            <asp:FormView ID="fvInvoice" runat="server" Width="100%"
                                DataSourceID="dsInvoice" DataKeyNames="InvoiceID">
                                <%--DataSourceID="dsInvoice" DataKeyNames="InvoiceID,CCIReview,AppAmount,DeliveryDate">--%>
                                <ItemTemplate>
                                    <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                        <tr>
                                            <td style="width: 30px;" rowspan="7">&nbsp;</td>
                                            <td style="width: 120px;" class="GridRow1B"><b>Amount</b></td>
                                            <td style="width: 450px;" class="GridRow1B">
                                                <asp:Label ID="lblAmount0" runat="server" Width="100px" 
                                                    Text='<%# Iif(IsHotelView, Eval("HAmount", "{0:N2}"), Eval("Amount", "{0:N2}")) %>' />
                                                <i>
                                                <asp:Label ID="BalanceLabel" runat="server" Width="300px" 
                                                    Visible='<%# Not IsHotelView AND IsAccounted %>'
                                                    Text='<%# "(Balance: " & Eval("Balance", "{0:N}") & "  On: " & Eval("BalanceDate", "{0:d}") & "  Applied: " & Eval("AppAmount", "{0:N}") & ")" %>' />
                                                </i>
                                            </td>
                                            <td style="width: 120px; text-align: center; padding: 3px;" class="GridRow1B">
                                                <div class="Red">
                                                <asp:Button ID="btRecalc" runat="server" CommandName="Recalc" SkinID="skBtnBase"
                                                    Text="Recalculate" Width="100px" OnClick="btnRecalc_Click" 
                                                    Visible='<%# CanEdit And IsAdmin And IsRecalcEnabled %>'
                                                    OnClientClick="return confirm('Are you sure you want to recalculate whole invoice?')" />
                                                </div>
                                            </td>
                                            <td rowspan="7" style="width: 10px;">&nbsp;</td>
                                            <td rowspan="7" style="width: 250px; text-align: center; padding: 3px; vertical-align: top;" >
                                                <div class="Red">
                                                    <table class="GridBorderThin" cellpadding="0" cellspacing="0" style="vertical-align: top;">
                                                        <tr>
                                                            <td style="width: 240px; height: 40px; text-align: center; vertical-align: middle; border-bottom: solid 1px;">
                                                                <b>
                                                                    <asp:Label ID="Label41" runat="server" Style="padding: 2px;"
                                                                        Text='<%# Eval("InvoiceState") %>' Visible='<%# Eval("State") >= 0 %>'
                                                                        ToolTip='<%# Eval("State") %>' />
                                                                    <asp:Label ID="Label33" runat="server" ForeColor="Red" Text='<%# iif(Eval("State") = -3, "Canceled by Hotel","Canceled by CCI") %>'
                                                                        Visible='<%# Eval("State") = -3 OR Eval("State") = -7 %>' />
                                                                </b>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 240px; height: 30px; text-align: center; vertical-align: middle">
                                                                <asp:CheckBox ID="cbRVHtl" runat="server" Text="Htl Reviewed" OnCheckedChanged="cbRVHtl_CheckedChanged"
                                                                    AutoPostBack="True" Checked='<%# Eval("State")=2 %>' 
                                                                    Visible='<%# IsHotelState AND IsHotelUser %>' />
                                                                <br />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 240px; height: 30px; text-align: center; vertical-align: middle">
                                                                <asp:HyperLink ID="hlSend" runat="server" NavigateUrl="~/Invoices/InvoiceSend.aspx"
                                                                    Visible='<%# Eval("State")=2 AND IsHotelUser %>'>
                                                                    Sending List &gt;&gt;
                                                                </asp:HyperLink>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 240px; height: 30px; text-align: center; vertical-align: middle">
                                                                <asp:LinkButton ID="cbRVCci" runat="server" Font-Underline="False"
                                                                    Visible='<%# IsCCIState %>'
                                                                    Enabled='<%# IsCCIState AND IsCCIUser AND NOT cbHotel.Checked %>'
                                                                    CommandArgument='<%# Eval("CCIReview") %>' 
                                                                    OnCommand="cbRVCci_CheckedChanged" > 
                                                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/cbChecked.png" Visible='<%# Eval("CCIReview") %>' />
                                                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/cbUnchecked.png" Visible='<%# Not Eval("CCIReview") %>' />
                                                                    CCI Reviewed
                                                                </asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </td>
                                            <td rowspan="7">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="width: 120px;" class="GridRow1B"><b>Proforma Date</b></td>
                                            <td style="width: 580px;" class="GridRow1B" colspan="2">
                                                <asp:Label ID="Label23" runat="server" Text='<%# Eval("InvDate", "{0:d}") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 120px;" class="GridRow1B">Reference</td>
                                            <td style="width: 580px;" class="GridRow1B" colspan="2">
                                                <asp:Label ID="Label34" runat="server" Text='<%# Eval("InvRefText") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 120px;" class="GridRow1B">Note</td>
                                            <td style="width: 580px;" class="GridRow1B" colspan="2">
                                                <asp:Label ID="Label29" runat="server" Text='<%# Eval("InvPrnText") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 120px;" class="GridRow1B">Comment</td>
                                            <td style="width: 580px;" class="GridRow1B" colspan="2">
                                                <asp:Label ID="Label35" runat="server" Text='<%# Eval("InvComment") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 120px;" class="GridRowClear">Delivery Date</td>
                                            <td style="width: 450px; vertical-align: middle;" class="GridRowClear">
                                                <asp:Label ID="Label47" runat="server" Text='<%# Eval("DeliveryDate","{0:d}") %>' 
                                                    Visible='<%# NOT IsCCIReviewed OR IsDelivered OR cbHotel.Checked OR Eval("State")<3 %>' />
                                                <asp:TextBox ID="txtDelivery" runat="server" CssClass="TextBox" 
                                                    Text='<%# Bind("DeliveryDate","{0:d}") %>'
                                                    Visible='<%# IsCCIReviewed AND NOT IsDelivered AND NOT cbHotel.Checked AND (Eval("State")=5 OR Eval("State")=6) %>' />
                                                <asp:CalendarExtender ID="txtDelivery_CalendarExtender" runat="server" CssClass="cal_Theme1"
                                                    Enabled="True" TargetControlID="txtDelivery" />
                                                <asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="txtDelivery"
                                                    Display="None" ErrorMessage="Date field!" Operator="DataTypeCheck" Type="Date" />
                                                <asp:ValidatorCalloutExtender ID="CompareValidator7_ValidatorCalloutExtender" runat="server"
                                                    Enabled="True" TargetControlID="CompareValidator7" />
                                            </td>
                                            <td style="width: 120px; text-align: right; padding: 3px 0px 3px 0px;" class="GridRowClear">
                                                <asp:Button ID="btnUnDeliv" runat="server" OnClick="btnUnDeliv_Click" SkinID="skBtnBase"
                                                    Text="Reset Delivery" Width="100px" 
                                                    Visible='<%# IsCCIUser AND IsDelivered AND NOT cbHotel.Checked %>' />
                                                <asp:Button ID="btnDeliv" runat="server" OnClick="btnDeliv_Click" SkinID="skBtnBase"
                                                    Text="Set Delivery" Width="100px" 
                                                    Visible='<%# IsCCIUser AND IsCCIReviewed AND NOT IsDelivered AND NOT cbHotel.Checked AND (Eval("State")=5 OR Eval("State")=6) %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="GridRow2T" style="margin-top: 2px; padding-top: 5px; text-align: left;">
                                                <div class="Red">
                                                    <asp:Button ID="btnCancel" runat="server" CommandName="CancelInv" SkinID="skBtnBase"
                                                        Text="Cancel" Width="100px" 
                                                        Visible='<%# (IsHotelState AND IsHotelUser) OR (IsCCIState AND IsCCIUser AND NOT cbHotel.Checked) %>'
                                                        OnClick="btnCancel_Click" OnClientClick="return confirm('Are you sure you want to change proforma state?')" />
                                                </div>
                                            </td>
                                            <td class="GridRow2T" style="margin-top: 2px; padding-top: 5px; text-align: right;" colspan="2">
                                                <asp:Button ID="btnChangeHotel" runat="server" CommandName="ChangeHotel" SkinID="skBtnBase" Text="Change Hotel"
                                                    Visible='<%# IsHotelState AND IsHotelUser %>' OnClick="btnChangeHotel_Click" />&nbsp;
                                                <asp:Button ID="btnUpdate" runat="server" CommandName="Edit" SkinID="skBtnBase" Text="Edit"
                                                    Visible='<%# IsUserInState %>' />
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                        <tr>
                                            <td style="width: 30px;" rowspan="7">&nbsp;</td>
                                            <td style="width: 120px;" class="GridRow1B"><b>Amount</b></td>
                                            <td style="width: 450px;" class="GridRow1B">
                                                <asp:Label ID="lblAmount0" runat="server" Width="100px" 
                                                    Text='<%# Iif(IsHotelView, Eval("HAmount", "{0:N2}"), Eval("Amount", "{0:N2}")) %>' />
                                                <i>
                                                <asp:Label ID="BalanceLabel" runat="server" Width="300px" 
                                                    Visible='<%# Not IsHotelView %>'
                                                    Text='<%# "(Balance: " & Eval("Balance", "{0:N}") & "  On: " & Eval("BalanceDate", "{0:d}") & "  Applied: " & Eval("AppAmount", "{0:N}") & ")" %>' />
                                                </i>
                                            </td>
                                            <td style="width: 120px; text-align: center; padding: 3px;" class="GridRow1B">
                                                <div class="Red">&nbsp;</div>
                                            </td>
                                            <td rowspan="7" style="width: 10px;">&nbsp;</td>
                                            <td rowspan="7" style="width: 120px; text-align: center; padding: 3px; vertical-align: top;" >
                                                <div class="Red">
                                                    <table class="GridBorderThin" cellpadding="0" cellspacing="0" style="vertical-align: top;">
                                                        <tr>
                                                            <td style="width: 120px; height: 40px; text-align: center; vertical-align: middle; border-bottom: solid 1px;">
                                                                <b>
                                                                    <asp:Label ID="Label41" runat="server" Style="padding: 2px;"
                                                                        Text='<%# Eval("InvoiceState") %>' Visible='<%# Eval("State") >= 0 %>' 
                                                                        ToolTip='<%# Eval("State") %>' />
                                                                    <asp:Label ID="Label33" runat="server" ForeColor="Red" Text='<%# iif(Eval("State") = -3, "Canceled by Hotel","Canceled by CCI") %>'
                                                                        Visible='<%# Eval("State") = -3 OR Eval("State") = -7 %>' />
                                                                </b>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 120px; height: 30px; text-align: center; vertical-align: middle">
                                                                <asp:CheckBox ID="cbRVHtl" runat="server" Text="Htl Reviewed" 
                                                                    Checked='<%# Eval("State")=2 %>' 
                                                                    Visible='<%# IsHotelState AND IsHotelUser %>'
                                                                    Enabled="false" />
                                                                <br />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 120px; height: 30px; text-align: center; vertical-align: middle">
                                                                <asp:HyperLink ID="hlSend" runat="server" NavigateUrl="~/Invoices/InvoiceSend.aspx"
                                                                    Visible='<%# Eval("State")=2 AND IsHotelState %>'
                                                                    Enabled="false">
                                                                    Sending List &gt;&gt;
                                                                </asp:HyperLink>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 120px; height: 30px; text-align: center; vertical-align: middle">
                                                                <asp:LinkButton ID="LinkButton1" runat="server" Font-Underline="False"
                                                                    Visible='<%# IsCCIState %>' Enabled="false" > 
                                                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/cbChecked.png" Visible='<%# Eval("CCIReview") %>' />
                                                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/cbUnchecked.png" Visible='<%# Not Eval("CCIReview") %>' />
                                                                    CCI Reviewed
                                                                </asp:LinkButton>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </td>
                                            <td rowspan="7">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="width: 120px;" class="GridRow1B"><b>Proforma Date</b></td>
                                            <td style="width: 580px;" class="GridRow1B" colspan="2">
                                                <asp:TextBox ID="txtDate" runat="server" CssClass="TextBox" Text='<%# Bind("InvDate", "{0:d}") %>' />
                                                <asp:CompareValidator ID="CompareValidator8" runat="server" ControlToValidate="txtDate"
                                                    Display="None" ErrorMessage="Input date!" Operator="DataTypeCheck" Type="Date">Input date!</asp:CompareValidator>
                                                <asp:ValidatorCalloutExtender ID="CompareValidator8_ValidatorCalloutExtender" runat="server"
                                                    Enabled="True" TargetControlID="CompareValidator8" />
                                                <asp:CalendarExtender ID="txtDate_CalendarExtender" runat="server" CssClass="cal_Theme1"
                                                    Enabled="True" TargetControlID="txtDate" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 120px;" class="GridRow1B">Reference</td>
                                            <td style="width: 580px;" class="GridRow1B" colspan="2">
                                                <asp:TextBox ID="TextBox12" runat="server" CssClass="TextBox" Text='<%# Bind("InvRefText") %>'></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 120px;" class="GridRow1B">Note</td>
                                            <td style="width: 580px;" class="GridRow1B" colspan="2">
                                                <asp:TextBox ID="TextBox13" runat="server" CssClass="TextBox" Text='<%# Bind("InvPrnText") %>'></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 120px;" class="GridRow1B">Comment</td>
                                            <td style="width: 580px;" class="GridRow1B" colspan="2">
                                                <asp:TextBox ID="TextBox14" runat="server" CssClass="TextBox" Text='<%# Bind("InvComment") %>'></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 120px;" class="GridRowClear">Delivery Date</td>
                                            <td style="width: 450px; vertical-align: middle;" class="GridRowClear">
                                                <asp:Label ID="txtDelivery" runat="server" Text='<%# Eval("DeliveryDate","{0:d}") %>' />
                                            </td>
                                            <td style="width: 120px; text-align: center; padding: 3px;" class="GridRowClear">&nbsp;</td> 
                                        </tr>
                                        <tr>
                                            <td class="GridRow2T" style="margin-top: 2px; padding-top: 5px; text-align: left;">
                                                &nbsp;
                                            </td>
                                            <td class="GridRow2T" style="margin-top: 2px; padding-top: 5px; text-align: right;" colspan="2">
                                                <asp:Button ID="Button2" runat="server" CommandName="Update" SkinID="skBtnBase" Text="Save" />&nbsp;
                                                <asp:Button ID="Button3" runat="server" CommandName="Cancel" SkinID="skBtnBase" Text="Cancel" />
                                            </td>
                                        </tr>
                                    </table>
                                </EditItemTemplate>
                            </asp:FormView>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:UpdatePanelAnimationExtender ID="UpdateAnimation" runat="server" TargetControlID="UpdatePanelDetail">
                    <Animations>
                        <OnUpdating>
                            <FadeOut Duration="1" Fps="20" minimumOpacity="50%" />
                        </OnUpdating>
                        <OnUpdated>
                            <FadeIn Duration="2" Fps="20" minimumOpacity="50%" />
                        </OnUpdated>
                    </Animations>
                </asp:UpdatePanelAnimationExtender>
                <asp:UpdatePanel ID="UpdatePanelDetail" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <table cellpadding="0" cellspacing="2px" >
                            <tr>
                                <td class="GridLabelBG">
                                    <asp:Label ID="Label31" runat="server" Text="Details" CssClass="GridLabel" Height="26px" />
                                    <asp:CheckBox ID="cbHotel" runat="server" Text="Hotel" ForeColor="White" Height="26px" AutoPostBack="True" Visible="false" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridBorder" style="vertical-align: top;">
                                    <asp:DataList  ID="dlStay" runat="server" DataSourceID="dsInvStay" 
                                        SelectedIndex="0"
                                        OnEditCommand="dlStay_EditCommand"
                                        OnCancelCommand="dlStay_CancelCommand"
                                        OnUpdateCommand="dlStay_UpdateCommand"
                                        OnSelectedIndexChanged="dlStay_SelectCommand" >
                                        <HeaderTemplate>
                                        <table cellpadding="0" cellspacing="0" style="border-collapse: collapse;">
                                            <tr>
                                                <td class="InvHead" style="width: 30px;">&nbsp;</td>
                                                <td class="InvHead" style="width: 350px;">Guest Name</td>
                                                <td class="InvHead" style="width: 80px; ">Bk Date</td>
                                                <td class="InvHead" style="width: 100px;">Bk Voucher</td>
                                                <td class="InvHead" style="width: 50px;">Room</td>
                                                <td class="InvHead" style="width: 40px;">MP</td>
                                                <td class="InvHead" style="width: 25px;">Ad</td>
                                                <td class="InvHead" style="width: 25px;">
                                                    <asp:Label ID="lblHCh1" runat="server" Text='<%# ChLabel(1) %>' ToolTip='<%# ChTTip(1) %>' />
                                                </td>
                                                <td class="InvHead" style="width: 25px;">
                                                    <asp:Label ID="lblHCh2" runat="server" Text='<%# ChLabel(2) %>' ToolTip='<%# ChTTip(2) %>' />
                                                </td>
                                                <td class="InvHead" style="width: 25px;">
                                                    <asp:Label ID="lblHCh3" runat="server" Text='<%# ChLabel(3) %>' ToolTip='<%# ChTTip(3) %>' />
                                                </td>
                                                <td class="InvHead" style="width: 25px;">
                                                    <asp:Label ID="lblHCh4" runat="server" Text='<%# ChLabel(4) %>' ToolTip='<%# ChTTip(4) %>' />
                                                </td>
                                                <td class="InvHead" style="width: 35px;">
                                                    <asp:Label ID="lblCpAd" runat="server" Text="Cp.Ad" ToolTip="Complimentary adults" />
                                                </td>
                                                <td class="InvHead" style="width: 35px;">
                                                    <asp:Label ID="lblCpCh" runat="server" Text="Cp.Ch" ToolTip="Complimentary children" />
                                                </td>
                                                <td class="InvHead" style="width: 35px;">
                                                    <asp:Label ID="Label53" runat="server" Text="Cp.Jn" ToolTip="Complimentary children" />
                                                </td>
                                                <td class="InvHead" style="width: 35px;">Rms#</td>
                                                <td class="InvHead" style="width: 80px;">Amount</td>
                                                <td class="InvHead" style="width: 100px;">&nbsp;</td>
                                            </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr>
                                                <td class="InvSelRow" style="width: 30px; border-right: none;" rowspan="2">
                                                    <asp:ImageButton ID="ibSelect" runat="server" CausesValidation="False" CssClass="InvButton" 
                                                        ImageUrl="~/Images/select_.gif" 
                                                        CommandName="Select" />
                                                </td>
                                                <td class="InvRow" style="width: 350px;">
                                                    <asp:HiddenField ID="hfSDetailID" runat="server" Value='<%# Eval("DetailID") %>'  />
                                                    <asp:Label ID="Label18" runat="server" Text='<%# Eval("DetText") %>' />
                                                </td>
                                                <td class="InvRow" style="width: 80px; font-weight: normal;">
                                                    <asp:Label ID="Label19" runat="server" Text='<%# Eval("BookingDate", "{0:d}") %>' />
                                                </td>
                                                <td class="InvRow" style="width: 100px; font-weight: normal;">
                                                    <asp:Label ID="Label20" runat="server" Text='<%# Eval("BookingVoucher") %>' />
                                                </td>
                                                <td class="InvRow" style="width: 50px;">
                                                    <asp:Label ID="Label21" runat="server" Text='<%# Eval("RoomTypeId") %>' />
                                                </td>
                                                <td class="InvRow" style="width: 40px;">
                                                    <asp:Label ID="Label22" runat="server" Text='<%# Eval("MealPlanId") %>' />
                                                </td>
                                                <td class="InvRowNum" style="text-align: right; width: 25px;">
                                                    <asp:Label ID="Label39" runat="server" Text='<%# Eval("AdultNum") %>' Visible='<%# Eval("AdultNum")>0 %>' />
                                                </td>
                                                <td class="InvRowNum" style="text-align: right; width: 25px;">
                                                    <asp:Label ID="lblHCh1" runat="server" Text='<%# Eval("Chld1Num") %>' Visible='<%# Eval("Chld1Num")>0 %>' Width="25px" />
                                                </td>
                                                <td class="InvRowNum" style="text-align: right; width: 25px;">
                                                    <asp:Label ID="lblHCh2" runat="server" Text='<%# Eval("Chld2Num") %>' Visible='<%# Eval("Chld2Num")>0 %>' Width="25px"  />
                                                </td>
                                                <td class="InvRowNum" style="text-align: right; width: 25px;">
                                                    <asp:Label ID="lblHCh3" runat="server" Text='<%# Eval("Chld3Num") %>' Visible='<%# Eval("Chld3Num")>0 %>' Width="25px"  />
                                                </td>
                                                <td class="InvRowNum" style="text-align: right; width: 25px;">
                                                    <asp:Label ID="lblHCh4" runat="server" Text='<%# Eval("Chld4Num") %>' Visible='<%# Eval("Chld4Num")>0 %>' Width="25px"  />
                                                </td>
                                                <td class="InvRowNum" style="text-align: right; width: 35px;">
                                                    <asp:Label ID="Label27" runat="server" Text='<%# Eval("CompAdultNum") %>' />
                                                </td>
                                                <td class="InvRowNum" style="text-align: right; width: 35px;">
                                                    <asp:Label ID="Label51" runat="server" Text='<%# Eval("CompChildNum") %>' />
                                                </td>
                                                <td class="InvRowNum" style="text-align: right; width: 35px;">
                                                    <asp:Label ID="Label54" runat="server" Text='<%# Eval("CompJuniorNum") %>' />
                                                </td>
                                                <td class="InvRowNum" style="text-align: right; width: 35px;">
                                                    <asp:Label ID="Label40" runat="server" Text='<%# Eval("RoomsNum") %>' />
                                                </td>
                                                <td class="InvRowNum" style="text-align: right; width: 80px;">
                                                    <asp:Label ID="Label3" runat="server" 
                                                        Text='<%# Iif(IsHotelView, Eval("HAmount", "{0:N2}"),Eval("Amount", "{0:N2}")) %>' 
                                                        ToolTip='<%# Eval("DetailID") %>' />
                                                </td>
                                                <td class="InvRow" style="width: 100px;">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="16" class="InvRowBillDet" >
                                            <asp:ObjectDataSource ID="dsInvBill" runat="server" 
                                                TypeName="dsInvoiceFormTableAdapters.InvBillDetailTableAdapter"
                                                SelectMethod="GetDataByStay"
                                                OnSelecting="dsInvBill_Selecting" >
                                                <SelectParameters>
                                                    <asp:QueryStringParameter Name="InvoiceId" QueryStringField="InvoiceID" Type="Int32" />
                                                    <asp:ControlParameter Name="DetailId" ControlID="hfSDetailID" PropertyName="Value" Type="Int32" />
                                                    <asp:Parameter Name="HRate" Type="Boolean" DefaultValue="False" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                            <asp:DataList ID="dlBill" runat="server" DataSourceID="dsInvBill"
                                                OnEditCommand="dlStay_SplitCommand"
                                                OnCancelCommand="dlStay_SplitCancelCommand"
                                                OnUpdateCommand="dlStay_SplitUpdateCommand" >
                                                <HeaderTemplate>
                                                    <table cellpadding="0" cellspacing="0" style="border-collapse: collapse;">
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td style="width: 253px;">
                                                            <asp:HiddenField ID="hfBBillingID" runat="server" Value='<%# Eval("BillingId") %>'  />
                                                        </td>
                                                        <td class="InvRowBill" style="width: 80px; font-weight: bold;">
                                                            <asp:Label ID="Label44" runat="server" Text='<%# Eval("EnterDate", "{0:d}") %>' />
                                                        </td>
                                                        <td class="InvRowBill" style="width: 80px; font-weight: bold">
                                                            <asp:Label ID="Label45" runat="server" Text='<%# Eval("ExitDate", "{0:d}") %>' />
                                                        </td>
                                                        <td class="InvRowBillNum" style="width: 35px;">
                                                            <asp:Label ID="Label46" runat="server" Text='<%# Eval("Nights") %>' />
                                                        </td>
                                                        <td class="InvRowBill" style="width: 120px; font-weight: bold">
                                                            <asp:Label ID="lnkEditRate" runat="server" Text='<%# Eval("RateCodeId") %>' Visible='<%# Eval("RateType")<>9 %>' />
                                                            <asp:Label ID="lblSuppRate" runat="server" Text='<%# Eval("RateCodeId") %>' Visible='<%# Eval("RateType")=9 %>' />
                                                            <asp:Label ID="ibRateInfo" runat="server" Style="float: right; vertical-align: middle; padding: 5px 3px 3px 3px;"
                                                                ToolTip="Rate info" Visible='<%# Eval("RateCodeId")<>"COMPLIMENTARY" AND Eval("RateCodeId")<>"NO-RATE"  %>' >
                                                                <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/info_small_icon.png" />
                                                            </asp:Label>    
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
                                                                        <asp:ControlParameter ControlID="hfRateId" Name="RateID" PropertyName="Value" Type="Int64" />
                                                                    </SelectParameters>
                                                                </asp:ObjectDataSource>
                                                                <asp:FormView ID="fvRInfo" runat="server" DataSourceID="dsRInfo" Width="100%" Visible='<%# Eval("RateType")<>9 %>' >
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
                                                                        <asp:ControlParameter ControlID="hfRateId" Name="RateID" PropertyName="Value" Type="Int64" />
                                                                    </SelectParameters>
                                                                </asp:ObjectDataSource>
                                                                <asp:FormView ID="fvSInfo" runat="server" DataSourceID="dsSInfo" Width="100%" Visible='<%# Eval("RateType")=9 %>'>
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
                                                                        <asp:ControlParameter ControlID="hfRateId" Name="RateID" PropertyName="Value" Type="Int64" />
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
                                                        </td>
                                                        <td class="InvRowBillNum" style="width: 20px;">
                                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("Pax1") %>' /><%-- Visible='<%# Eval("Pax1")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNum" style="width: 20px;">
                                                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("Pax2") %>'  /><%-- Visible='<%# Eval("Pax2")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNum" style="width: 20px;">
                                                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("Pax3") %>' /><%-- Visible='<%# Eval("Pax3")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNum" style="width: 20px;">
                                                            <asp:Label ID="Label11" runat="server" Text='<%# Eval("Pax4") %>' /><%-- Visible='<%# Eval("Pax4")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNum" style="width: 20px;">
                                                            <asp:Label ID="Label12" runat="server" Text='<%# Eval("Pax5") %>' /><%-- Visible='<%# Eval("Pax5")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNum" style="width: 20px;">
                                                            <asp:Label ID="Label13" runat="server" Text='<%# Eval("Pax6") %>' /><%-- Visible='<%# Eval("Pax6")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNum" style="width: 20px;">
                                                            <asp:Label ID="Label15" runat="server" Text='<%# Eval("Pax7") %>' /><%-- Visible='<%# Eval("Pax7")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNum" style="width: 20px;">
                                                            <asp:Label ID="Label26" runat="server" Text='<%# Eval("Pax8") %>' /><%-- Visible='<%# Eval("Pax8")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNum" style="width: 20px;">
                                                            <asp:Label ID="Label28" runat="server" Text='<%# Eval("Pax9") %>' /><%-- Visible='<%# Eval("Pax9")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNum" style="width: 20px;">
                                                            <asp:Label ID="Label32" runat="server" Text='<%# Eval("Pax10") %>' /><%-- Visible='<%# Eval("Pax10")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNum" style="width: 20px;">
                                                            <asp:Label ID="Label36" runat="server" Text='<%# Eval("Extra") %>' /><%-- Visible='<%# Eval("Extra")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNum" style="width: 20px;">
                                                            <asp:Label ID="Label37" runat="server" Text='<%# Eval("Chld1") %>' /><%-- Visible='<%# Eval("Chld1")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNum" style="width: 20px;">
                                                            <asp:Label ID="Label38" runat="server" Text='<%# Eval("Chld2") %>' /><%-- Visible='<%# Eval("Chld2")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNum" style="width: 20px;">
                                                            <asp:Label ID="Label42" runat="server" Text='<%# Eval("Chld3") %>' /><%-- Visible='<%# Eval("Chld3")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNum" style="width: 20px;">
                                                            <asp:Label ID="Label43" runat="server" Text='<%# Eval("Chld4") %>' /><%-- Visible='<%# Eval("Chld4")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNum" style="width: 80px; font-weight: bold;">
                                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Amount", "{0:N2}") %>' ToolTip='<%# Eval("BillingId") %>' />
                                                        </td>
                                                        <td class="InvRowBill" style="width: 98px;">&nbsp;</td>
                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                </table>
                                                </FooterTemplate>
                                            </asp:DataList>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <tr>
                                                <td class="InvSelRow" style="width: 30px; border-right: none;" rowspan="3">
                                                    <asp:Image ID="imgSelected" runat="server"
                                                        ImageUrl="~/Images/select_.gif" 
                                                        style="float: right;" />
                                                </td>
                                                <td class="InvRowSel" style="width: 350px;">
                                                    <asp:HiddenField ID="hfSDetailID" runat="server" Value='<%# Bind("DetailID") %>'  />
                                                    <asp:HiddenField ID="hfSHotelID" runat="server" Value='<%# Bind("HotelId") %>'  />
                                                    <asp:TextBox ID="sdE_DetText" runat="server" CssClass="TextBox" Text='<%# Bind("DetText") %>' />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="sdE_DetText"
                                                        Display="None" ErrorMessage="Required Field">*</asp:RequiredFieldValidator>
                                                    <asp:ValidatorCalloutExtender runat="server" Enabled="True"
                                                            ID="RequiredFieldValidator1_ValidatorCalloutExtender" 
                                                            TargetControlID="RequiredFieldValidator1" />
                                                </td>
                                                <td class="InvRowSel" style="width: 80px;">
                                                    <asp:TextBox ID="sdE_BookingDate" runat="server" CssClass="TextBox" Text='<%# Bind("BookingDate", "{0:d}") %>' Width="75px" />
                                                    <asp:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" CssClass="cal_Theme1" Enabled="True"
                                                        TargetControlID="sdE_BookingDate">
                                                    </asp:CalendarExtender>
                                                </td>
                                                <td class="InvRowSel" style="width: 100px;">
                                                    <asp:TextBox ID="sdE_BookingVoucher" runat="server" CssClass="TextBox" Text='<%# Bind("BookingVoucher") %>' Width="95px" />
                                                </td>
                                                <td class="InvRow" style="width: 50px;">
                                                    <asp:DropDownList ID="sdE_RoomTypeID" runat="server" CssClass="TextBox" 
                                                        DataSourceID="dsHtlRooms" DataTextField="RoomTypeID" DataValueField="RoomTypeID" 
                                                        SelectedValue='<%# Bind("RoomTypeId") %>' />
                                                    <asp:ObjectDataSource runat="server" OldValuesParameterFormatString="original_{0}"
                                                        SelectMethod="GetDataByInvoice" TypeName="dsMaintHotelTableAdapters.HotelRoomTypeTableAdapter"
                                                        ID="dsHtlRooms">
                                                        <SelectParameters>
                                                            <asp:QueryStringParameter Name="InvoiceID" QueryStringField="InvoiceID" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:ObjectDataSource>
                                                </td>
                                                <td class="InvRowSel" style="width: 40px;">
                                                    <asp:DropDownList ID="sdE_MealPlanID" runat="server" CssClass="TextBox" 
                                                        DataSourceID="dsHtlMP" DataTextField="MealPlanID" DataValueField="MealPlanID" 
                                                        SelectedValue='<%# Bind("MealPlanId") %>' />
                                                    <asp:ObjectDataSource ID="dsHtlMP" runat="server" 
                                                        TypeName="dsMaintHotelTableAdapters.HotelMealPlanTableAdapter"
                                                        SelectMethod="GetDataByInvoiceID" >
                                                        <SelectParameters>
                                                            <asp:QueryStringParameter Name="InvoiceID" QueryStringField="InvoiceID" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:ObjectDataSource>
                                                </td>
                                                <td class="InvRowNumSel" style="text-align: right; width: 25px;">
                                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="sde_AdultNum"
                                                        Display="None" ErrorMessage="CompareValidator" Operator="DataTypeCheck" Type="Double">
                                                    </asp:CompareValidator>
                                                    <asp:ValidatorCalloutExtender
                                                            ID="CompareValidator1_ValidatorCalloutExtender" runat="server" Enabled="True"
                                                            SkinID="skExtender" TargetControlID="CompareValidator1">
                                                    </asp:ValidatorCalloutExtender>
                                                    <asp:TextBox ID="sde_AdultNum" runat="server" CssClass="TextBox" Text='<%# Bind("AdultNum") %>' Width="19px" />
                                                </td>
                                                <td class="InvRowNumSel" style="text-align: right; width: 25px;">
                                                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="sde_Chld1Num"
                                                        Display="None" ErrorMessage="Must input number" Operator="DataTypeCheck" Type="Double">
                                                    </asp:CompareValidator>
                                                    <asp:ValidatorCalloutExtender
                                                            ID="CompareValidator2_ValidatorCalloutExtender" runat="server" Enabled="True"
                                                            SkinID="skExtender" TargetControlID="CompareValidator2">
                                                    </asp:ValidatorCalloutExtender>
                                                    <asp:TextBox ID="sde_Chld1Num" runat="server" CssClass="TextBox" Text='<%# Bind("Chld1Num") %>' Width="19px" />
                                                </td>
                                                <td class="InvRowNumSel" style="text-align: right; width: 25px;">
                                                    <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="sde_Chld2Num"
                                                        Display="None" ErrorMessage="Must input number" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                    <asp:ValidatorCalloutExtender
                                                            ID="CompareValidator3_ValidatorCalloutExtender" runat="server" Enabled="True"
                                                            SkinID="skExtender" TargetControlID="CompareValidator3">
                                                    </asp:ValidatorCalloutExtender>
                                                    <asp:TextBox ID="sde_Chld2Num" runat="server" CssClass="TextBox" Text='<%# Bind("Chld2Num") %>' Width="19px" />
                                                </td>
                                                <td class="InvRowNumSel" style="text-align: right; width: 25px;">
                                                    <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="sde_Chld3Num"
                                                        Display="None" ErrorMessage="Must input number">*</asp:CompareValidator>
                                                    <asp:TextBox ID="sde_Chld3Num" runat="server" CssClass="TextBox" Text='<%# Bind("Chld3Num") %>' Width="19px" />
                                                </td>
                                                <td class="InvRowNumSel" style="text-align: right; width: 25px;">
                                                    <asp:CompareValidator ID="CompareValidator5" runat="server" ControlToValidate="sde_Chld4Num"
                                                        Display="None" ErrorMessage="Must input number" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                    <asp:ValidatorCalloutExtender
                                                            ID="CompareValidator5_ValidatorCalloutExtender" runat="server" Enabled="True"
                                                            SkinID="skExtender" TargetControlID="CompareValidator5">
                                                    </asp:ValidatorCalloutExtender>
                                                    <asp:TextBox ID="sde_Chld4Num" runat="server" CssClass="TextBox" Text='<%# Bind("Chld4Num") %>' Width="19px" />
                                                </td>
                                                <td class="InvRowNumSel" style="text-align: right; width: 35px;">
                                                    <asp:CompareValidator ID="CompareValidator6" runat="server" ControlToValidate="sde_CompAdultNum"
                                                        Display="None" ErrorMessage="Must input number" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                    <asp:ValidatorCalloutExtender
                                                        ID="CompareValidator6_ValidatorCalloutExtender" runat="server" Enabled="True"
                                                        SkinID="skExtender" TargetControlID="CompareValidator6">
                                                    </asp:ValidatorCalloutExtender>
                                                    <asp:TextBox ID="sde_CompAdultNum" runat="server" CssClass="TextBox" Text='<%# Bind("CompAdultNum") %>' Width="25px" />
                                                </td>
                                                <td class="InvRowNumSel" style="text-align: right; width: 35px;">
                                                    <asp:CompareValidator ID="CompareValidator9" runat="server" ControlToValidate="sde_CompChildNum"
                                                        Display="None" ErrorMessage="Must input number" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                    <asp:ValidatorCalloutExtender
                                                        ID="ValidatorCalloutExtender1" runat="server" Enabled="True"
                                                        SkinID="skExtender" TargetControlID="CompareValidator9">
                                                    </asp:ValidatorCalloutExtender>
                                                    <asp:TextBox ID="sde_CompChildNum" runat="server" CssClass="TextBox" Text='<%# Bind("CompChildNum") %>' Width="25px" />
                                                </td>
                                                <td class="InvRowNumSel" style="text-align: right; width: 35px;">
                                                    <asp:CompareValidator ID="CompareValidator13" runat="server" ControlToValidate="sde_CompJuniorNum"
                                                        Display="None" ErrorMessage="Must input number" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                    <asp:ValidatorCalloutExtender
                                                        ID="ValidatorCalloutExtender5" runat="server" Enabled="True"
                                                        SkinID="skExtender" TargetControlID="CompareValidator13">
                                                    </asp:ValidatorCalloutExtender>
                                                    <asp:TextBox ID="sde_CompJuniorNum" runat="server" CssClass="TextBox" Text='<%# Bind("CompJuniorNum") %>' Width="25px" />
                                                </td>
                                                <td class="InvRowNumSel" style="text-align: right; width: 35px;">
                                                    <asp:CompareValidator ID="CompareValidator10" runat="server" ControlToValidate="sde_RoomsNum"
                                                        Display="None" ErrorMessage="Must input number" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                    <asp:ValidatorCalloutExtender
                                                        ID="ValidatorCalloutExtender2" runat="server" Enabled="True"
                                                        SkinID="skExtender" TargetControlID="CompareValidator10">
                                                    </asp:ValidatorCalloutExtender>
                                                    <asp:TextBox ID="sde_RoomsNum" runat="server" CssClass="TextBox" Text='<%# Bind("RoomsNum") %>' Width="25px" />
                                                </td>
                                                <td class="InvRowNumSel" style="text-align: right; width: 80px;">
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Amount", "{0:N2}") %>' />
                                                </td>
                                                <td class="InvRowSel" style="width: 100px;">
                                                    <asp:ImageButton ID="ibEditUpdate" runat="server" CausesValidation="False" CommandName="Update"
                                                        CssClass="InvButton" ImageUrl="~/Images/accept_inline.gif" />
                                                    <asp:ImageButton ID="ibEditCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                                        CssClass="InvButton" ImageUrl="~/Images/decline_inline.gif" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="16" class="InvRowBillDetSel" >
                                            <asp:ObjectDataSource ID="dsInvBill" runat="server" 
                                                TypeName="dsInvoiceFormTableAdapters.InvBillDetailTableAdapter"
                                                SelectMethod="GetDataByStay"
                                                OnSelecting="dsInvBill_Selecting" >
                                                <SelectParameters>
                                                    <asp:QueryStringParameter Name="InvoiceId" QueryStringField="InvoiceID" Type="Int32" />
                                                    <asp:ControlParameter Name="DetailId" ControlID="hfSDetailID" PropertyName="Value" Type="Int32" />
                                                    <asp:Parameter Name="HRate" Type="Boolean" DefaultValue="False" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                            <asp:DataList ID="dlBill" runat="server" DataSourceID="dsInvBill">
                                                <HeaderTemplate>
                                                    <table cellpadding="0" cellspacing="0" style="border-collapse: collapse;">
                                                    <tr>
                                                        <td style="width: 253px;">&nbsp;</td>
                                                        <td class="InvHeadBill" style="width: 80px;">Arrival</td>
                                                        <td class="InvHeadBill" style="width: 80px;">Departure</td>
                                                        <td class="InvHeadBill" style="width: 35px;">Nts#</td>
                                                        <td class="InvHeadBill" style="width: 120px;">Rate</td>
                                                        <td class="InvHeadBill" style="width: 20px;">P1</td>
                                                        <td class="InvHeadBill" style="width: 20px;">P2</td>
                                                        <td class="InvHeadBill" style="width: 20px;">P3</td>
                                                        <td class="InvHeadBill" style="width: 20px;">P4</td>
                                                        <td class="InvHeadBill" style="width: 20px;">P5</td>
                                                        <td class="InvHeadBill" style="width: 20px;">P6</td>
                                                        <td class="InvHeadBill" style="width: 20px;">P7</td>
                                                        <td class="InvHeadBill" style="width: 20px;">P8</td>
                                                        <td class="InvHeadBill" style="width: 20px;">P9</td>
                                                        <td class="InvHeadBill" style="width: 20px;">P10</td>
                                                        <td class="InvHeadBill" style="width: 20px;">Ex</td>
                                                        <td class="InvHeadBill" style="width: 20px;">C1</td>
                                                        <td class="InvHeadBill" style="width: 20px;">C2</td>
                                                        <td class="InvHeadBill" style="width: 20px;">C3</td>
                                                        <td class="InvHeadBill" style="width: 20px;">C4</td>
                                                        <td class="InvHeadBill" style="width: 80px;">&nbsp;</td>
                                                        <td class="InvHeadBill" style="width: 100px;">&nbsp;</td>
                                                    </tr>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td style="width: 253px;">&nbsp;</td>
                                                        <td class="InvRowBillSel" style="width: 80px; font-weight: bold;">
                                                            <asp:Label ID="Label44" runat="server" Text='<%# Eval("EnterDate", "{0:d}") %>' />
                                                        </td>
                                                        <td class="InvRowBillSel" style="width: 80px; font-weight: bold;">
                                                            <asp:Label ID="Label45" runat="server" Text='<%# Eval("ExitDate", "{0:d}") %>' />
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 35px;">
                                                            <asp:Label ID="Label46" runat="server" Text='<%# Eval("Nights") %>' />
                                                        </td>
                                                        <td class="InvRowBillSel" style="width: 120px; font-weight: bold;">
                                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("RateCodeId") %>' />
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("Pax1") %>' />
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("Pax2") %>' />
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("Pax3") %>' />
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label11" runat="server" Text='<%# Eval("Pax4") %>' />
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label12" runat="server" Text='<%# Eval("Pax5") %>' />
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label13" runat="server" Text='<%# Eval("Pax6") %>' />
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label15" runat="server" Text='<%# Eval("Pax7") %>' />
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label26" runat="server" Text='<%# Eval("Pax8") %>' />
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label28" runat="server" Text='<%# Eval("Pax9") %>' />
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label32" runat="server" Text='<%# Eval("Pax10") %>' />
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label36" runat="server" Text='<%# Eval("Extra") %>' />
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label37" runat="server" Text='<%# Eval("Chld1") %>' />
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label38" runat="server" Text='<%# Eval("Chld2") %>' />
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label42" runat="server" Text='<%# Eval("Chld3") %>' />
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label43" runat="server" Text='<%# Eval("Chld4") %>' />
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 80px; font-weight: bold;">
                                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Amount", "{0:N2}") %>' />
                                                        </td>
                                                        <td class="InvRowBillSel" style="width: 100px;">&nbsp;</td>
                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                </table>
                                                </FooterTemplate>
                                            </asp:DataList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="InvRowAdd" colspan="16" style="height: 10px;" >&nbsp;</td>
                                            </tr>
                                        </EditItemTemplate>
                                        <SelectedItemTemplate>
                                            <tr>
                                                <td class="InvSelRow" style="width: 30px; border-right: none;" rowspan="3">
                                                    <asp:Image ID="imgSelected" runat="server"
                                                        ImageUrl="~/Images/select_.gif" 
                                                        style="float: right;" />
                                                </td>
                                                <td class="InvRowSel" style="width: 350px;">
                                                    <asp:HiddenField ID="hfSDetailID" runat="server" Value='<%# Eval("DetailID") %>'  />
                                                    <asp:Label ID="Label18" runat="server" Text='<%# Eval("DetText") %>' />
                                                </td>
                                                <td class="InvRowSel" style="width: 80px; font-weight: normal;">
                                                    <asp:Label ID="Label19" runat="server" Text='<%# Eval("BookingDate", "{0:d}") %>' />
                                                </td>
                                                <td class="InvRowSel" style="width: 100px; font-weight: normal;">
                                                    <asp:Label ID="Label20" runat="server" Text='<%# Eval("BookingVoucher") %>' />
                                                </td>
                                                <td class="InvRowSel" style="width: 50px;">
                                                    <asp:Label ID="Label21" runat="server" Text='<%# Eval("RoomTypeId") %>' />
                                                </td>
                                                <td class="InvRowSel" style="width: 40px;">
                                                    <asp:Label ID="Label22" runat="server" Text='<%# Eval("MealPlanId") %>' />
                                                </td>
                                                <td class="InvRowNumSel" style="text-align: right; width: 25px;">
                                                    <asp:Label ID="Label39" runat="server" Text='<%# Eval("AdultNum") %>' Visible='<%# Eval("AdultNum")>0 %>' />
                                                </td>
                                                <td class="InvRowNumSel" style="text-align: right; width: 25px;">
                                                    <asp:Label ID="lblHCh1" runat="server" Text='<%# Eval("Chld1Num") %>' Visible='<%# Eval("Chld1Num")>0 %>' Width="25px" />
                                                </td>
                                                <td class="InvRowNumSel" style="text-align: right; width: 25px;">
                                                    <asp:Label ID="lblHCh2" runat="server" Text='<%# Eval("Chld2Num") %>' Visible='<%# Eval("Chld2Num")>0 %>' Width="25px"  />
                                                </td>
                                                <td class="InvRowNumSel" style="text-align: right; width: 25px;">
                                                    <asp:Label ID="lblHCh3" runat="server" Text='<%# Eval("Chld3Num") %>' Visible='<%# Eval("Chld3Num")>0 %>' Width="25px"  />
                                                </td>
                                                <td class="InvRowNumSel" style="text-align: right; width: 25px;">
                                                    <asp:Label ID="lblHCh4" runat="server" Text='<%# Eval("Chld4Num") %>' Visible='<%# Eval("Chld4Num")>0 %>' Width="25px"  />
                                                </td>
                                                <td class="InvRowNumSel" style="text-align: right; width: 35px;">
                                                    <asp:Label ID="Label55" runat="server" Text='<%# Eval("CompAdultNum") %>' />
                                                </td>
                                                <td class="InvRowNumSel" style="text-align: right; width: 35px;">
                                                    <asp:Label ID="Label56" runat="server" Text='<%# Eval("CompChildNum") %>' />
                                                </td>
                                                <td class="InvRowNumSel" style="text-align: right; width: 35px;">
                                                    <asp:Label ID="Label57" runat="server" Text='<%# Eval("CompJuniorNum") %>' />
                                                </td>
                                                <td class="InvRowNumSel" style="text-align: right; width: 35px;">
                                                    <asp:Label ID="Label40" runat="server" Text='<%# Eval("RoomsNum") %>' />
                                                </td>
                                                <td class="InvRowNumSel" style="text-align: right; width: 80px;">
                                                    <asp:Label ID="Label3" runat="server" 
                                                        Text='<%# Iif(IsHotelView, Eval("HAmount", "{0:N2}"),Eval("Amount", "{0:N2}")) %>' 
                                                        ToolTip='<%# Eval("DetailID") %>' />
                                                </td>
                                                <td class="InvRowSel" style="width: 100px;">
                                                    <asp:ImageButton ID="ibEdit" runat="server" CausesValidation="False" CssClass="InvButton" 
                                                        ImageUrl="~/Images/edit_inline.gif" 
                                                        CommandName="Edit" 
                                                        Visible='<%# CanEdit %>' />
                                                    <asp:ImageButton ID="ibDelete" runat="server" CausesValidation="False" CssClass="InvButton" 
                                                        ImageUrl="~/Images/delete_inline.gif" 
                                                        CommandName="Delete" 
                                                        CommandArgument='<%# Eval("DetailID") %>'
                                                        OnCommand="dlStay_DeleteCommand"
                                                        ToolTip='<%# "Invoice stay detail (" & Eval("DetailID") & ") " & Eval("DetText") & " delete" %>'
                                                        OnClientClick="return confirm('Are you sure you want to delete the record');" 
                                                        Visible='<%# CanEdit %>' />
                                                    <div class="Red" style="text-align:right; float: right;">
                                                    <asp:LinkButton ID="btnStayRecalc" runat="server" Font-Bold="False" 
                                                        Text="Recalc"
                                                        CommandName="Recalculate" 
                                                        CommandArgument='<%# Eval("DetailID") %>'
                                                        OnCommand="dlStay_RecalcCommand"
                                                        ToolTip='<%# "Invoice stay detail (" & Eval("DetailID") & ") " & Eval("DetText") & " recalculate" %>'
                                                        OnClientClick="return confirm('Are you sure you want to recalculate this stay detail?');" 
                                                        Visible='<%# CanEdit And IsAdmin And IsRecalcEnabled %>' />
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="16" class="InvRowBillDetSel" >
                                            <asp:ObjectDataSource ID="dsInvBill" runat="server" 
                                                TypeName="dsInvoiceFormTableAdapters.InvBillDetailTableAdapter"
                                                SelectMethod="GetDataByStay"
                                                OnSelecting="dsInvBill_Selecting" >
                                                <SelectParameters>
                                                    <asp:QueryStringParameter Name="InvoiceId" QueryStringField="InvoiceID" Type="Int32" />
                                                    <asp:ControlParameter Name="DetailId" ControlID="hfSDetailID" PropertyName="Value" Type="Int32" />
                                                    <asp:Parameter Name="HRate" Type="Boolean" DefaultValue="False" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                            <asp:DataList ID="dlBill" runat="server" DataSourceID="dsInvBill"
                                                OnEditCommand="dlStay_SplitCommand"
                                                OnCancelCommand="dlStay_SplitCancelCommand"
                                                OnUpdateCommand="dlStay_SplitUpdateCommand" >
                                                <HeaderTemplate>
                                                    <table cellpadding="0" cellspacing="0" style="border-collapse: collapse;">
                                                    <tr>
                                                        <td style="width: 253px;">&nbsp;</td>
                                                        <td class="InvHeadBill" style="width: 80px;">Arrival</td>
                                                        <td class="InvHeadBill" style="width: 80px;">Departure</td>
                                                        <td class="InvHeadBill" style="width: 35px;">Nts#</td>
                                                        <td class="InvHeadBill" style="width: 120px;">Rate</td>
                                                        <td class="InvHeadBill" style="width: 20px;">P1</td>
                                                        <td class="InvHeadBill" style="width: 20px;">P2</td>
                                                        <td class="InvHeadBill" style="width: 20px;">P3</td>
                                                        <td class="InvHeadBill" style="width: 20px;">P4</td>
                                                        <td class="InvHeadBill" style="width: 20px;">P5</td>
                                                        <td class="InvHeadBill" style="width: 20px;">P6</td>
                                                        <td class="InvHeadBill" style="width: 20px;">P7</td>
                                                        <td class="InvHeadBill" style="width: 20px;">P8</td>
                                                        <td class="InvHeadBill" style="width: 20px;">P9</td>
                                                        <td class="InvHeadBill" style="width: 20px;">P10</td>
                                                        <td class="InvHeadBill" style="width: 20px;">Ex</td>
                                                        <td class="InvHeadBill" style="width: 20px;">C1</td>
                                                        <td class="InvHeadBill" style="width: 20px;">C2</td>
                                                        <td class="InvHeadBill" style="width: 20px;">C3</td>
                                                        <td class="InvHeadBill" style="width: 20px;">C4</td>
                                                        <td class="InvHeadBill" style="width: 80px;">&nbsp;</td>
                                                        <td class="InvHeadBill" style="width: 100px;">&nbsp;</td>
                                                    </tr>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td style="width: 253px;">
                                                            <asp:HiddenField ID="hfBBillingID" runat="server" Value='<%# Eval("BillingId") %>'  />
                                                        </td>
                                                        <td class="InvRowBillSel" style="width: 80px; font-weight: bold;">
                                                            <asp:Label ID="Label44" runat="server" Text='<%# Eval("EnterDate", "{0:d}") %>' />
                                                        </td>
                                                        <td class="InvRowBillSel" style="width: 80px; font-weight: bold;">
                                                            <asp:Label ID="Label45" runat="server" Text='<%# Eval("ExitDate", "{0:d}") %>' />
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 35px;">
                                                            <asp:Label ID="Label46" runat="server" Text='<%# Eval("Nights") %>' />
                                                        </td>
                                                        <td class="InvRowBillSel" style="width: 120px; font-weight: bold;">
                                                            <asp:LinkButton ID="lnkEditRate" runat="server" Text='<%# Eval("RateCodeId") %>' 
                                                                Visible='<%# Eval("RateType")<>9 AND CanEdit %>'
                                                                Enabled='<%# Eval("RateCodeId")<>"COMPLIMENTARY" %>'
                                                                OnClientClick='<%# "ShowStayModal(" & Eval("BillingId") & ");" %>' />
                                                            <asp:Label ID="lblSuppRate" runat="server" Text='<%# Eval("RateCodeId") %>' 
                                                                Visible='<%# Eval("RateType")=9 OR Not CanEdit  %>' />
                                                            <asp:Label ID="ibRateInfo" runat="server" Style="float: right; vertical-align: middle; padding: 5px 3px 3px 3px;" 
                                                                ToolTip="Rate info" Visible='<%# Eval("RateCodeId")<>"COMPLIMENTARY" AND Eval("RateCodeId")<>"NO-RATE"  %>' >
                                                                <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/info_small_icon.png" />
                                                            </asp:Label>    
                                                            <asp:HiddenField ID="hfRateId" runat="server" Value='<%# Eval("RateId") %>' />
                                                            <asp:PopupControlExtender ID="infoPopEx" runat="server"
                                                                TargetControlID="ibRateInfo"
                                                                PopupControlID="infoPopDiv"
                                                                Position="Bottom"
                                                                OffsetX="-85" />
                                                            <asp:Panel id="infoPopDiv" runat="server" Style="display: none; background-color: Transparent;" CssClass="GridBorderThin" >
                                                                <asp:ObjectDataSource ID="dsRInfo" runat="server" 
                                                                    TypeName="dsInvoiceFormTableAdapters.Rate_SelectByBillInfoTableAdapter" 
                                                                    SelectMethod="GetData" >
                                                                    <SelectParameters>
                                                                        <asp:ControlParameter ControlID="hfRateId" Name="RateID" PropertyName="Value" Type="Int64" />
                                                                    </SelectParameters>
                                                                </asp:ObjectDataSource>
                                                                <asp:FormView ID="fvRInfo" runat="server" DataSourceID="dsRInfo" Width="100%" Visible='<%# Eval("RateType")<>9 %>' >
                                                                    <RowStyle CssClass="GridRowClear" Font-Size="Small" />
                                                                    <EditItemTemplate>empty</EditItemTemplate>
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
                                                                        </table> 
                                                                    </ItemTemplate>
                                                                </asp:FormView>
                                                                <asp:ObjectDataSource ID="dsSInfo" runat="server" 
                                                                    TypeName="dsInvoiceFormTableAdapters.Rate_SuppSelectByStayInfoTableAdapter" 
                                                                    SelectMethod="GetData" OldValuesParameterFormatString="original_{0}" >
                                                                    <SelectParameters>
                                                                        <asp:ControlParameter ControlID="hfRateId" Name="RateID" PropertyName="Value" Type="Int64" />
                                                                    </SelectParameters>
                                                                </asp:ObjectDataSource>
                                                                <asp:FormView ID="fvSInfo" runat="server" DataSourceID="dsSInfo" Width="100%" Visible='<%# Eval("RateType")=9 %>'>
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
                                                                        <asp:ControlParameter ControlID="hfRateId" Name="RateID" PropertyName="Value" Type="Int64" />
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
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("Pax1") %>' /><%-- Visible='<%# Eval("Pax1")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("Pax2") %>'  /><%-- Visible='<%# Eval("Pax2")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("Pax3") %>' /><%-- Visible='<%# Eval("Pax3")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label11" runat="server" Text='<%# Eval("Pax4") %>' /><%-- Visible='<%# Eval("Pax4")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label12" runat="server" Text='<%# Eval("Pax5") %>' /><%-- Visible='<%# Eval("Pax5")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label13" runat="server" Text='<%# Eval("Pax6") %>' /><%-- Visible='<%# Eval("Pax6")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label15" runat="server" Text='<%# Eval("Pax7") %>' /><%-- Visible='<%# Eval("Pax7")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label26" runat="server" Text='<%# Eval("Pax8") %>' /><%-- Visible='<%# Eval("Pax8")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label28" runat="server" Text='<%# Eval("Pax9") %>' /><%-- Visible='<%# Eval("Pax9")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label32" runat="server" Text='<%# Eval("Pax10") %>' /><%-- Visible='<%# Eval("Pax10")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label36" runat="server" Text='<%# Eval("Extra") %>' /><%-- Visible='<%# Eval("Extra")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label37" runat="server" Text='<%# Eval("Chld1") %>' /><%-- Visible='<%# Eval("Chld1")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label38" runat="server" Text='<%# Eval("Chld2") %>' /><%-- Visible='<%# Eval("Chld2")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label42" runat="server" Text='<%# Eval("Chld3") %>' /><%-- Visible='<%# Eval("Chld3")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label43" runat="server" Text='<%# Eval("Chld4") %>' /><%-- Visible='<%# Eval("Chld4")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 80px; font-weight: bold;">
                                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Amount", "{0:N2}") %>'
                                                                ToolTip='<%# Eval("BillingId") %>' />
                                                        </td>
                                                        <td class="InvRowBillSel" style="width: 96px;">
                                                            <asp:ImageButton ID="ibBillDelete" runat="server" CausesValidation="False" CssClass="InvButton" 
                                                                ImageUrl="~/Images/delete_inline.gif" 
                                                                OnClientClick="return confirm('Are you sure you want to remove this supplement?')"
                                                                CommandArgument='<%# Eval("BillingId") %>'
                                                                OnCommand="dlBill_DeleteCommand"
                                                                Visible='<%# Eval("RateType")=9 AND CanEdit %>' />
                                                            <asp:ImageButton ID="ibSplit" runat="server" CausesValidation="False" CssClass="InvButton" Style="float: right;"
                                                                ImageUrl="~/Images/unpublish_inline.gif" 
                                                                ToolTip="Split Stay Detail"
                                                                CommandName="Edit"
                                                                CommandArgument='<%# Eval("BillingId") %>'
                                                                Visible='<%# Eval("RateType")<>9 AND CanEdit %>' />
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <tr>
                                                        <td style="width: 253px;">
                                                            <asp:HiddenField ID="hfBBillingID" runat="server" Value='<%# Eval("BillingId") %>'  />
                                                        </td>
                                                        <td class="InvRowBillSel" style="width: 80px; font-weight: bold;">
                                                            <asp:Label ID="Label44" runat="server" Text='<%# Eval("EnterDate", "{0:d}") %>' />
                                                        </td>
                                                        <td class="InvRowBillSel" style="width: 80px; font-weight: bold;">
                                                            <asp:TextBox ID="txtExitDate" runat="server" CssClass="TextBox" Font-Bold="true"
                                                                Text='<%# Eval("ExitDate", "{0:d}") %>' Width="75px" />
                                                            <asp:CalendarExtender ID="txtExitDate_CalendarExtender" runat="server" Enabled="True"
                                                                TargetControlID="txtExitDate" CssClass="cal_Theme1" />
                                                            <asp:CompareValidator ID="txtExitDate_CompareValidator" runat="server" ControlToValidate="txtExitDate"
                                                                Display="None" ErrorMessage="Input date!" Operator="DataTypeCheck" Type="Date" />
                                                            <asp:ValidatorCalloutExtender ID="txtExitDate_CompareValidator_Callout" runat="server"
                                                                Enabled="True" TargetControlID="txtExitDate_CompareValidator" />
                                                            <asp:RequiredFieldValidator ID="txtExitDate_RequiredValidator" runat="server" ControlToValidate="txtExitDate" 
                                                                Display="None" ErrorMessage="Required field!" />
                                                            <asp:ValidatorCalloutExtender ID="txtExitDate_RequiredValidator_Callout" runat="server"
                                                                Enabled="True" TargetControlID="txtExitDate_RequiredValidator" />
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 35px;">
                                                            <asp:Label ID="Label46" runat="server" Text='<%# Eval("Nights") %>' />
                                                        </td>
                                                        <td class="InvRowBillSel" style="width: 120px; font-weight: bold;">
                                                            <asp:Label ID="lblSuppRate" runat="server" Text='<%# Eval("RateCodeId") %>' />
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("Pax1") %>' /><%-- Visible='<%# Eval("Pax1")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("Pax2") %>'  /><%-- Visible='<%# Eval("Pax2")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("Pax3") %>' /><%-- Visible='<%# Eval("Pax3")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label11" runat="server" Text='<%# Eval("Pax4") %>' /><%-- Visible='<%# Eval("Pax4")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label12" runat="server" Text='<%# Eval("Pax5") %>' /><%-- Visible='<%# Eval("Pax5")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label13" runat="server" Text='<%# Eval("Pax6") %>' /><%-- Visible='<%# Eval("Pax6")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label15" runat="server" Text='<%# Eval("Pax7") %>' /><%-- Visible='<%# Eval("Pax7")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label26" runat="server" Text='<%# Eval("Pax8") %>' /><%-- Visible='<%# Eval("Pax8")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label28" runat="server" Text='<%# Eval("Pax9") %>' /><%-- Visible='<%# Eval("Pax9")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label32" runat="server" Text='<%# Eval("Pax10") %>' /><%-- Visible='<%# Eval("Pax10")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label36" runat="server" Text='<%# Eval("Extra") %>' /><%-- Visible='<%# Eval("Extra")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label37" runat="server" Text='<%# Eval("Chld1") %>' /><%-- Visible='<%# Eval("Chld1")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label38" runat="server" Text='<%# Eval("Chld2") %>' /><%-- Visible='<%# Eval("Chld2")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label42" runat="server" Text='<%# Eval("Chld3") %>' /><%-- Visible='<%# Eval("Chld3")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 20px;">
                                                            <asp:Label ID="Label43" runat="server" Text='<%# Eval("Chld4") %>' /><%-- Visible='<%# Eval("Chld4")>0 %>' />--%>
                                                        </td>
                                                        <td class="InvRowBillNumSel" style="width: 80px; font-weight: bold;">
                                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Amount", "{0:N2}") %>'
                                                                ToolTip='<%# Eval("BillingId") %>' />
                                                        </td>
                                                        <td class="InvRowBillSel" style="width: 100px;">
                                                            <asp:ImageButton ID="ibSplitUpdate" runat="server" CausesValidation="True"
                                                                CssClass="InvButton" ImageUrl="~/Images/accept_inline.gif" CommandName="Update" 
                                                                CommandArgument='<%# Eval("BillingId") %>'
                                                                OnClientClick="return confirm('Are you sure you want to split this stay detail?')" />
                                                            <asp:ImageButton ID="ibSplitCancel" runat="server" CausesValidation="False"
                                                                CssClass="InvButton" ImageUrl="~/Images/decline_inline.gif" CommandName="Cancel" />
                                                        </td>
                                                    </tr>
                                                </EditItemTemplate>
                                                <FooterTemplate>
                                                </table>
                                                </FooterTemplate>
                                            </asp:DataList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="InvRowAdd" colspan="16" >
                                                    <asp:LinkButton ID="btnNewBill" runat="server" Font-Bold="False" Text="Add Supplement"
                                                        OnClientClick='<%# "ShowSuppModal(" & Eval("DetailId") & ");" %>' 
                                                        Visible='<%# CanEdit %>' />
                                                </td>
                                            </tr>
                                        </SelectedItemTemplate>
                                        <FooterTemplate>
                                            <tr>
                                                <td style="text-align: left; vertical-align: top; padding-top: 5px;" colspan="2" >
                                                    <asp:Button ID="btnNew" runat="server" SkinID="skBtnBase" 
                                                        Text="Add Stay Detail" 
                                                        CommandName="New"
                                                        OnCommand="dlStay_NewCommand"
                                                        Visible='<%# CanEdit %>' />
                                                </td>
                                                <td style="text-align: right; vertical-align: bottom; padding-top: 5px;" colspan="3" >
                                                    <asp:Button ID="btCM" runat="server" SkinID="skBtnBase" Text="Add CM Supplement"/> 
                                                    <asp:PopupControlExtender ID="pceCM" runat="server" CommitProperty="Text" PopupControlID="gvCMRate"
                                                        Position="Bottom" TargetControlID="btCM" OffsetX="-390" />
                                                        <div class="Green">
                                                        <asp:GridView ID="gvCMRate" runat="server" AutoGenerateColumns="False" 
                                                            DataKeyNames="RateID" DataSourceID="dsCMRate"
                                                            SelectedIndex="0" BorderStyle="None" BackColor="White">
                                                            <RowStyle CssClass="GridRow1B" Wrap="False" />
                                                            <SelectedRowStyle CssClass="SelectRow1TB" Wrap="False" />
                                                            <HeaderStyle CssClass="GridRow2B" HorizontalAlign="Center" />
                                                            <EmptyDataRowStyle CssClass="GridRow1B" />
                                                            <Columns>
                                                                <asp:TemplateField ShowHeader="False">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="ibSelect" runat="server" 
                                                                            CommandName="AddCM" CommandArgument='<%# Eval("RateID") %>'
                                                                            OnCommand="AddCM_Command" ToolTip="Add CM Supplement" >
                                                                            <asp:Image ID="imgSelect" runat="server" ImageUrl="~/Images/select_.gif" CssClass="InvButton" />
                                                                        </asp:LinkButton>
                                                                        <asp:LinkButton ID="lnkRateID" runat="server" Text='<%# Eval("RateID") %>' Width="65" 
                                                                            CommandName="AddCM" CommandArgument='<%# Eval("RateID") %>' 
                                                                            OnCommand="AddCM_Command" ToolTip="Add CM Supplement" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="90px" HorizontalAlign="Left"/>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Rate">
                                                                    <ItemTemplate>
                                                                        <asp:LinkButton ID="lbRate" runat="server" style="padding: 0px 3px 0px 3px;" Width="80px" 
                                                                            Text='<%# Eval("RateCodeId") %>'
                                                                            CommandName="AddCM" CommandArgument='<%# Eval("RateID") %>'
                                                                            OnCommand="AddCM_Command" ToolTip="Add CM Supplement" />
                                                                        <asp:LinkButton ID="ibRate" runat="server"
                                                                            CommandName="AddCM" CommandArgument='<%# Eval("RateID") %>'
                                                                            OnCommand="AddCM_Command" ToolTip="Add CM Supplement">
                                                                            <asp:Image ID="imgRate" runat="server" ImageUrl="~/Images/accept.png" CssClass="InvButton" />
                                                                        </asp:LinkButton>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="115px" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Bk.Code">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label100" runat="server" Text='<%# Eval("BookingCode") %>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="80px" HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Tr.Window">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label102" runat="server" Text='<%# Eval("Start", "{0:d}") & " - " & Eval("Finish", "{0:d}") %>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="140px" HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Discount">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="Label103" runat="server" Text='<%# Eval("RatePax1", "{0:N2}") & "%" %>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="80px" HorizontalAlign="Center" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Title" >
                                                                    <ItemTemplate>
                                                                        <asp:TextBox ID="TextBox15" runat="server" Style="border: none; background: transparent;"
                                                                            CssClass="TextBox" Font-Size="X-Small" ReadOnly="True" Text='<%# Eval("Title") %>' Width="250px" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="260px" Wrap="False" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <EmptyDataTemplate>
                                                                <div style="width: 770px; text-align: center; font-weight: bold; font-style: italic;">
                                                                - NO AVAILABLE CM SUPPLEMENTS -
                                                                </div>
                                                            </EmptyDataTemplate>
                                                        </asp:GridView>
                                                        </div>                                            
                                                </td>
                                                <td style="text-align: left; vertical-align: top; padding-top: 5px;" colspan="12" >
                                                    <asp:GridView ID="gvCM" runat="server" AutoGenerateColumns="False" 
                                                        DataKeyNames="InvoiceId,SupplementId" DataSourceID="dsCM" 
                                                        ShowFooter="true" GridLines="None" style="float: right;"
                                                        OnRowCreated="CM_RowCreated">
                                                        <HeaderStyle CssClass="GridRow1B" HorizontalAlign="Right" Font-Bold="true" />
                                                        <FooterStyle HorizontalAlign="Right" Font-Bold="true" />
                                                        <RowStyle CssClass="GridRow1B" HorizontalAlign="Right" />
                                                        <Columns>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <i>Coop marketing discount:</i>
                                                                </ItemTemplate>
                                                                <ItemStyle Width="150px" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <%# Eval("RateCodeId") %>
                                                                </ItemTemplate>
                                                                <ItemStyle Width="100px" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <%# Eval("Percentage", "{0:N}") & "%" %>
                                                                </ItemTemplate>
                                                                <FooterTemplate>Total:</FooterTemplate>
                                                                <ItemStyle Width="70px" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField>
                                                                <ItemTemplate>
                                                                    <b><%# Iif(IsHotelView, Eval("HRebate", "{0:N2}"),Eval("Rebate", "{0:N2}")) %></b>
                                                                </ItemTemplate>
                                                                <ItemStyle Width="80px" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField InsertVisible="False" ShowHeader="False">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="btnDeleteCM" runat="server" CausesValidation="false" 
                                                                        CssClass="InvButton" ImageUrl="~/Images/delete_inline.gif" 
                                                                        onclientclick="if (!confirm('Are you sure you want to remove coop market supplement?')) return;"
                                                                        CommandName="DeleteCM" CommandArgument='<%# Eval("SupplementId") %>'
                                                                        OnCommand="DeleteCM_Command" />
                                                                </ItemTemplate>
                                                                <ItemStyle Width="100px" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left; padding-top: 5px;" colspan="17" >
                                                    <asp:TabContainer runat="server" >
                                                        <asp:TabPanel ID="tpComment" runat="server"
                                                            HeaderText="Comments" style="float: left;" >
                                                            <ContentTemplate>
                                                                <asp:TextBoxWatermarkExtender ID="txCCommentWatermark" runat="server" TargetControlID="txCComment" 
                                                                     WatermarkCssClass="WaterMark" WatermarkText="User Comment" />
                                                                <asp:TextBox ID="txCComment" runat="server" CssClass="TextBox" Width="95%" style="display: inline;" />
                                                                <asp:ImageButton ID="btnAddComment" runat="server" style="position: relative; left: -20px; display: inline; top: 2px;" 
                                                                    ImageUrl="~/Images/accept_inline.gif" 
                                                                    OnCommand="Invoice_AddComment" />
                                                                <br />
                                                                <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto" style="max-height: 150px;" >
                                                                <asp:GridView ID="gvCComment" runat="server" AutoGenerateColumns="False" 
                                                                    DataKeyNames="InvoiceID,CommentDate" DataSourceID="dsInvComment" 
                                                                    EnableModelValidation="True" GridLines="None" ShowHeader="False" >
                                                                    <Columns>
                                                                        <asp:BoundField DataField="SkypeLike" HeaderText="" ReadOnly="True" HtmlEncode="False">
                                                                            <ItemStyle Wrap="true" Font-Size="X-Small" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                                </asp:Panel> 
                                                            </ContentTemplate>
                                                        </asp:TabPanel>
                                                        <asp:TabPanel ID="tpLog" runat="server" 
                                                            HeaderText="Log" >
                                                            <ContentTemplate>
                                                                <asp:DropDownList ID="ddlLevel" runat="server" AutoPostBack="True" CssClass="WaterMark" Width="90%" 
                                                                    OnDataBound="ddlLevel_DataBound" 
                                                                    OnSelectedIndexChanged="ddlLevel_SelectedIndexChanged" >
                                                                    <asp:ListItem Value="0">Changes</asp:ListItem>
                                                                    <asp:ListItem Value="1">Actions</asp:ListItem>
                                                                    <asp:ListItem Value="2">Full</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto" style="max-height: 150px;" >
                                                                <asp:GridView ID="gvLog" runat="server" AllowSorting="True" 
                                                                    AutoGenerateColumns="False" DataSourceID="dsLog" EnableModelValidation="True" 
                                                                    SkinID="skGridView" >
                                                                    <Columns>
                                                                        <asp:BoundField DataField="LogDate" HeaderText="Date" SortExpression="LogDate">
                                                                            <ItemStyle Width="200px" Font-Size="X-Small" />
                                                                            <HeaderStyle Font-Size="X-Small" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="LogSource" HeaderText="LogSource" Visible="False" />
                                                                        <asp:BoundField DataField="UserName" HeaderText="User">
                                                                            <ItemStyle Width="100px" Wrap="False" Font-Size="X-Small" />
                                                                            <HeaderStyle Font-Size="X-Small" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="ObjType" HeaderText="ObjType" Visible="False" />
                                                                        <asp:BoundField DataField="ObjEvent" HeaderText="Event">
                                                                            <ItemStyle Width="60px" Wrap="False" Font-Size="X-Small" />
                                                                            <HeaderStyle Font-Size="X-Small" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="ObjEventState" HeaderText="Event State">
                                                                            <ItemStyle Width="80px" Font-Size="X-Small" />
                                                                            <HeaderStyle Font-Size="X-Small" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="ObjId" HeaderText="ObjId" Visible="False" />
                                                                        <asp:BoundField DataField="LogMess" HeaderText="Log Message">
                                                                            <ItemStyle Width="530px" Font-Size="X-Small" />
                                                                            <HeaderStyle Font-Size="X-Small" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                                </asp:Panel> 
                                                            </ContentTemplate>
                                                        </asp:TabPanel>
                                                    </asp:TabContainer>
                                                </td>
                                            </tr>
                                        </table>
                                        </FooterTemplate>
                                    </asp:DataList >
                                    <div class="Red" style="border-collapse: collapse; padding: 0px; margin: 4px 0px 0px 0px; border: none 0px;">
                                    <asp:DataList  ID="dlStayNew" runat="server" DataSourceID="dsInvStayNew" 
                                        OnCancelCommand="dlStayNew_CancelCommand"
                                        OnUpdateCommand="dlStayNew_UpdateCommand"
                                        Visible="false"
                                        EditItemIndex="0" >
                                        <HeaderTemplate>
                                        <table cellpadding="0" cellspacing="0" style="border-collapse: collapse;">
                                            <tr>
                                                <td class="InvHead" style="width: 28px;">&nbsp;</td>
                                                <td class="InvHead" style="width: 350px;">Guest Name</td>
                                                <td class="InvHead" style="width: 80px; ">Bk Date</td>
                                                <td class="InvHead" style="width: 100px;">Bk Voucher</td>
                                                <td class="InvHead" style="width: 50px;">Room</td>
                                                <td class="InvHead" style="width: 40px;">MP</td>
                                                <td class="InvHead" style="width: 25px;">Ad</td>
                                                <td class="InvHead" style="width: 25px;">
                                                    <asp:Label ID="lblHCh1" runat="server" Text='<%# ChLabel(1) %>' ToolTip='<%# ChTTip(1) %>' />
                                                </td>
                                                <td class="InvHead" style="width: 25px;">
                                                    <asp:Label ID="lblHCh2" runat="server" Text='<%# ChLabel(2) %>' ToolTip='<%# ChTTip(2) %>' />
                                                </td>
                                                <td class="InvHead" style="width: 25px;">
                                                    <asp:Label ID="lblHCh3" runat="server" Text='<%# ChLabel(3) %>' ToolTip='<%# ChTTip(3) %>' />
                                                </td>
                                                <td class="InvHead" style="width: 25px;">
                                                    <asp:Label ID="lblHCh4" runat="server" Text='<%# ChLabel(4) %>' ToolTip='<%# ChTTip(4) %>' />
                                                </td>
                                                <td class="InvHead" style="width: 35px;">Cp.Ad</td>
                                                <td class="InvHead" style="width: 35px;">Cp.Ch</td>
                                                <td class="InvHead" style="width: 35px;">Cp.Jn</td>
                                                <td class="InvHead" style="width: 35px;">Rms#</td>
                                                <td class="InvHead" style="width: 80px;">Amount</td>
                                                <td class="InvHead" style="width: 95px;">&nbsp;</td>
                                            </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <tr>
                                                <td class="InvRow" style="width: 28px;" >&nbsp;</td>
                                                <td class="InvRow" style="width: 350px;">
                                                    <asp:HiddenField ID="hfSDetailID" runat="server" Value='<%# Eval("DetailID") %>'  />
                                                    <asp:HiddenField ID="hfSHotelID" runat="server" Value='<%# Eval("HotelId") %>'  />
                                                    <asp:TextBox ID="sdn_DetText" runat="server" CssClass="TextBox" Text='<%# Bind("DetText") %>' />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="sdn_DetText"
                                                        Display="None" ErrorMessage="Required Field">*</asp:RequiredFieldValidator>
                                                    <asp:ValidatorCalloutExtender runat="server" Enabled="True"
                                                            ID="RequiredFieldValidator1_ValidatorCalloutExtender" 
                                                            TargetControlID="RequiredFieldValidator1" />
                                                </td>
                                                <td class="InvRow" style="width: 80px;">
                                                    <asp:TextBox ID="sdn_BookingDate" runat="server" CssClass="TextBox" Text='<%# Bind("BookingDate", "{0:d}") %>' Width="75px" />
                                                    <asp:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" CssClass="cal_Theme1" Enabled="True"
                                                        TargetControlID="sdn_BookingDate">
                                                    </asp:CalendarExtender>
                                                </td>
                                                <td class="InvRow" style="width: 100px;">
                                                    <asp:TextBox ID="sdn_BookingVoucher" runat="server" CssClass="TextBox" Text='<%# Bind("BookingVoucher") %>' Width="95px" />
                                                </td>
                                                <td class="InvRow" style="width: 50px;">
                                                    <asp:DropDownList ID="sdn_RoomTypeId" runat="server" CssClass="TextBox" 
                                                        DataSourceID="dsHtlRooms" DataTextField="RoomTypeID" DataValueField="RoomTypeID" 
                                                        SelectedValue='<%# Bind("RoomTypeId") %>' />
                                                    <asp:ObjectDataSource runat="server" OldValuesParameterFormatString="original_{0}"
                                                        SelectMethod="GetDataByHotelID" TypeName="dsMaintHotelTableAdapters.HotelRoomTypeTableAdapter"
                                                        ID="dsHtlRooms">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="hfSHotelID" Name="HotelId" PropertyName="Value" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:ObjectDataSource>
                                                </td>
                                                <td class="InvRow" style="width: 40px;">
                                                    <asp:DropDownList ID="sdn_MealPlanId" runat="server" CssClass="TextBox" 
                                                        DataSourceID="dsHtlMP" DataTextField="MealPlanID" DataValueField="MealPlanID" 
                                                        SelectedValue='<%# Bind("MealPlanId") %>' />
                                                    <asp:ObjectDataSource ID="dsHtlMP" runat="server" 
                                                        TypeName="dsMaintHotelTableAdapters.HotelMealPlanTableAdapter"
                                                        SelectMethod="GetHotelMP" >
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="hfSHotelID" Name="HotelId" PropertyName="Value" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:ObjectDataSource>
                                                </td>
                                                <td class="InvRowNum" style="text-align: right; width: 25px;">
                                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="sdn_AdultNum"
                                                        Display="None" ErrorMessage="CompareValidator" Operator="DataTypeCheck" Type="Double">
                                                    </asp:CompareValidator>
                                                    <asp:ValidatorCalloutExtender
                                                            ID="CompareValidator1_ValidatorCalloutExtender" runat="server" Enabled="True"
                                                            SkinID="skExtender" TargetControlID="CompareValidator1">
                                                    </asp:ValidatorCalloutExtender>
                                                    <asp:TextBox ID="sdn_AdultNum" runat="server" CssClass="TextBox" Text='<%# Bind("AdultNum") %>' Width="19px" />
                                                </td>
                                                <td class="InvRowNum" style="text-align: right; width: 25px;">
                                                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="sdn_Chld1Num"
                                                        Display="None" ErrorMessage="Must input number" Operator="DataTypeCheck" Type="Double">
                                                    </asp:CompareValidator>
                                                    <asp:ValidatorCalloutExtender
                                                            ID="CompareValidator2_ValidatorCalloutExtender" runat="server" Enabled="True"
                                                            SkinID="skExtender" TargetControlID="CompareValidator2">
                                                    </asp:ValidatorCalloutExtender>
                                                    <asp:TextBox ID="sdn_Chld1Num" runat="server" CssClass="TextBox" Text='<%# Bind("Chld1Num") %>' Width="19px" />
                                                </td>
                                                <td class="InvRowNum" style="text-align: right; width: 25px;">
                                                    <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="sdn_Chld2Num"
                                                        Display="None" ErrorMessage="Must input number" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                    <asp:ValidatorCalloutExtender
                                                            ID="CompareValidator3_ValidatorCalloutExtender" runat="server" Enabled="True"
                                                            SkinID="skExtender" TargetControlID="CompareValidator3">
                                                    </asp:ValidatorCalloutExtender>
                                                    <asp:TextBox ID="sdn_Chld2Num" runat="server" CssClass="TextBox" Text='<%# Bind("Chld2Num") %>' Width="19px" />
                                                </td>
                                                <td class="InvRowNum" style="text-align: right; width: 25px;">
                                                    <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="sdn_Chld3Num"
                                                        Display="None" ErrorMessage="Must input number">*</asp:CompareValidator>
                                                    <asp:ValidatorCalloutExtender
                                                            ID="CompareValidator4_ValidatorCalloutExtender" runat="server" Enabled="True"
                                                            SkinID="skExtender" TargetControlID="CompareValidator4">
                                                    </asp:ValidatorCalloutExtender>
                                                    <asp:TextBox ID="sdn_Chld3Num" runat="server" CssClass="TextBox" Text='<%# Bind("Chld3Num") %>' Width="19px" />
                                                </td>
                                                <td class="InvRowNum" style="text-align: right; width: 25px;">
                                                    <asp:CompareValidator ID="CompareValidator5" runat="server" ControlToValidate="sdn_Chld4Num"
                                                        Display="None" ErrorMessage="Must input number" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                    <asp:ValidatorCalloutExtender
                                                            ID="CompareValidator5_ValidatorCalloutExtender" runat="server" Enabled="True"
                                                            SkinID="skExtender" TargetControlID="CompareValidator5">
                                                    </asp:ValidatorCalloutExtender>
                                                    <asp:TextBox ID="sdn_Chld4Num" runat="server" CssClass="TextBox" Text='<%# Bind("Chld4Num") %>' Width="19px" />
                                                </td>
                                                <td class="InvRowNum" style="text-align: right; width: 35px;">
                                                    <asp:CompareValidator ID="CompareValidator11" runat="server" ControlToValidate="sdn_CompAdultNum"
                                                        Display="None" ErrorMessage="Must input number" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                    <asp:ValidatorCalloutExtender
                                                        ID="ValidatorCalloutExtender3" runat="server" Enabled="True"
                                                        SkinID="skExtender" TargetControlID="CompareValidator11">
                                                    </asp:ValidatorCalloutExtender>
                                                    <asp:TextBox ID="sdn_CompAdultNum" runat="server" CssClass="TextBox" Text='<%# Bind("CompAdultNum") %>' Width="30px" />
                                                </td>
                                                <td class="InvRowNum" style="text-align: right; width: 35px;">
                                                    <asp:CompareValidator ID="CompareValidator12" runat="server" ControlToValidate="sdn_CompChildNum"
                                                        Display="None" ErrorMessage="Must input number" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                    <asp:ValidatorCalloutExtender
                                                        ID="ValidatorCalloutExtender4" runat="server" Enabled="True"
                                                        SkinID="skExtender" TargetControlID="CompareValidator12">
                                                    </asp:ValidatorCalloutExtender>
                                                    <asp:TextBox ID="sdn_CompChildNum" runat="server" CssClass="TextBox" Text='<%# Bind("CompChildNum") %>' Width="30px" />
                                                </td>
                                                <td class="InvRowNum" style="text-align: right; width: 35px;">
                                                    <asp:CompareValidator ID="CompareValidator14" runat="server" ControlToValidate="sdn_CompJuniorNum"
                                                        Display="None" ErrorMessage="Must input number" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                    <asp:ValidatorCalloutExtender
                                                        ID="ValidatorCalloutExtender6" runat="server" Enabled="True"
                                                        SkinID="skExtender" TargetControlID="CompareValidator14">
                                                    </asp:ValidatorCalloutExtender>
                                                    <asp:TextBox ID="sdn_CompJuniorNum" runat="server" CssClass="TextBox" Text='<%# Bind("CompJuniorNum") %>' Width="30px" />
                                                </td>
                                                <td class="InvRowNum" style="text-align: right; width: 35px;">
                                                    <asp:CompareValidator ID="CompareValidator6" runat="server" ControlToValidate="sdn_RoomsNum"
                                                        Display="None" ErrorMessage="Must input number" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator>
                                                    <asp:ValidatorCalloutExtender
                                                        ID="CompareValidator6_ValidatorCalloutExtender" runat="server" Enabled="True"
                                                        SkinID="skExtender" TargetControlID="CompareValidator6">
                                                    </asp:ValidatorCalloutExtender>
                                                    <asp:TextBox ID="sdn_RoomsNum" runat="server" CssClass="TextBox" Text='<%# Bind("RoomsNum") %>' Width="30px" />
                                                </td>
                                                <td class="InvRowNum" style="text-align: right; width: 80px;">
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Amount", "{0:N2}") %>' />
                                                </td>
                                                <td class="InvRow" style="width: 95px;">
                                                    <asp:ImageButton ID="ibNewUpdate" runat="server" CausesValidation="False" CommandName="Update"
                                                        CssClass="InvButton" ImageUrl="~/Images/accept_inline.gif" />
                                                    <asp:ImageButton ID="ibNewCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                                        CssClass="InvButton" ImageUrl="~/Images/decline_inline.gif" />
                                                </td>
                                            </tr>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                        </table>
                                        </FooterTemplate>
                                    </asp:DataList >
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <asp:HiddenField ID="dummy" runat="server" />
                        <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
                            PopupDragHandleControlID="popLabel" CancelControlID="btnYes" DropShadow="True"
                            BackgroundCssClass="modalBackground" TargetControlID="dummy" X="200" Y="200">
                        </asp:ModalPopupExtender>
                        <asp:Panel ID="popPanel" runat="server" Width="300px" BackColor="White" Style="display: none">
                            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                <tr>
                                    <td class="GridLabelBG">
                                        <asp:Label ID="popLabel" runat="server" Text="Title" SkinID="skGridLabel"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridBorder">
                                        <p style="text-align: center;">
                                            <asp:Label ID="popMessage" runat="server" Text="Message" />
                                        </p>
                                        <p style="text-align: right;" class="GridRow1T"><br />
                                            <asp:Button ID="btnYes" runat="server" Text="OK" SkinID="skBtnBase" />&nbsp;
                                        </p>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="cbHotel" EventName="CheckedChanged" />
                    </Triggers>
                </asp:UpdatePanel>
                <br />
                <asp:ObjectDataSource ID="dsInvoice" runat="server" 
                    TypeName="dsInvoiceFormTableAdapters.InvoiceHeadTableAdapter"
                    SelectMethod="GetDataByID"
                    UpdateMethod="UpdateQuery">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="InvoiceID" QueryStringField="InvoiceID" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="InvDate" Type="DateTime" DefaultValue="" />
                        <asp:Parameter Name="InvRefText" Type="String" />
                        <asp:Parameter Name="InvPrnText" Type="String" />
                        <asp:Parameter Name="InvComment" Type="String" />
                        <asp:ControlParameter ControlID="hfUsername" Name="EditUser" PropertyName="Value" Type="String" />
                        <asp:Parameter Name="EditDate" Type="DateTime" DefaultValue="" />
                        <asp:Parameter Name="InvoiceID" Type="Int32" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsInvBalance" runat="server" 
                    TypeName="dsInvoiceFormTableAdapters.InvAccBalanceTableAdapter"
                    SelectMethod="GetDataByID">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="InvoiceID" QueryStringField="InvoiceID" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsInvStay" runat="server" 
                    OldValuesParameterFormatString="original_{0}" 
                    TypeName="dsInvoiceFormTableAdapters.InvStayDetailTableAdapter"
                    SelectMethod="GetDataByID" 
                    UpdateMethod="InvStayDetailUpdate"
                    DeleteMethod="InvStayDetailDelete">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="InvoiceId" QueryStringField="InvoiceID" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="DetailID" Type="Int32" />
                        <asp:Parameter Name="DetText" Type="String" />
                        <asp:Parameter Name="BookingDate" Type="DateTime" />
                        <asp:Parameter Name="BookingVoucher" Type="String" />
                        <asp:Parameter Name="RoomTypeId" Type="String" />
                        <asp:Parameter Name="MealPlanId" Type="String" />
                        <asp:Parameter Name="RoomsNum" Type="Int32" />
                        <asp:Parameter Name="AdultNum" Type="Int32" />
                        <asp:Parameter Name="Chld1Num" Type="Int32" />
                        <asp:Parameter Name="Chld2Num" Type="Int32" />
                        <asp:Parameter Name="Chld3Num" Type="Int32" />
                        <asp:Parameter Name="Chld4Num" Type="Int32" />
                        <asp:Parameter Name="CompAdultNum" Type="Int32" />
                        <asp:Parameter Name="CompChildNum" Type="Int32" />
                        <asp:Parameter Name="CompJuniorNum" Type="Int32" />
                    </UpdateParameters>
                    <DeleteParameters>
                        <asp:QueryStringParameter Name="InvoiceId" QueryStringField="InvoiceID" Type="Int32" />
                        <asp:Parameter Name="DetailID" Type="Int32" />
                    </DeleteParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsInvStayNew" runat="server"
                    OldValuesParameterFormatString="original_{0}" 
                    TypeName="dsInvoiceFormTableAdapters.InvStayDetailTableAdapter"
                    SelectMethod="GetNewDataByID" 
                    UpdateMethod="InvStayDetailInsert">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="InvoiceId" QueryStringField="InvoiceID" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:QueryStringParameter Name="InvoiceId" QueryStringField="InvoiceID" Type="Int32" />
                        <asp:Parameter Name="DetText" Type="String" />
                        <asp:Parameter Name="BookingDate" Type="DateTime" />
                        <asp:Parameter Name="BookingVoucher" Type="String" />
                        <asp:Parameter Name="RoomTypeId" Type="String" />
                        <asp:Parameter Name="MealPlanId" Type="String" />
                        <asp:Parameter Name="RoomsNum" Type="Int32" />
                        <asp:Parameter Name="AdultNum" Type="Int32" />
                        <asp:Parameter Name="Chld1Num" Type="Int32" />
                        <asp:Parameter Name="Chld2Num" Type="Int32" />
                        <asp:Parameter Name="Chld3Num" Type="Int32" />
                        <asp:Parameter Name="Chld4Num" Type="Int32" />
                        <asp:Parameter Name="CompAdultNum" Type="Int32" />
                        <asp:Parameter Name="CompChildNum" Type="Int32" />
                        <asp:Parameter Name="CompJuniorNum" Type="Int32" />
                        <asp:Parameter Name="PreDetId" Type="Int32" />
                        <asp:Parameter Name="FolioFull" Type="String" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsInvComment" runat="server" 
                    TypeName="dsInvoicesTableAdapters.InvoiceCommentTableAdapter" 
                    SelectMethod="GetInvComment"
                    InsertMethod="InvoiceNewComment">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="InvoiceID" QueryStringField="InvoiceID" Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:QueryStringParameter Name="InvoiceID" QueryStringField="InvoiceID" Type="Int32" />
                        <asp:Parameter Name="Username" Type="String" />
                        <asp:Parameter Name="Comment" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsLog" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="LogAppTableAdapters.Invoice_LogTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="InvoiceID" QueryStringField="InvoiceID" Type="Int32" />
                        <asp:Parameter Name="LogLevel" Type="Int32" DefaultValue="0" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsCM" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="dsCoopMarketingTableAdapters.InvRebateTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="InvoiceID" QueryStringField="InvoiceID" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsCMRate" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="dsCoopMarketingTableAdapters.Rate_CMSelectTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="InvoiceID" QueryStringField="InvoiceID" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="cbHotel" EventName="CheckedChanged" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
</asp:Content>
