<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AccDocReservation.aspx.vb" Inherits="Accounting_AccDocReservation" %>
<%@ Register src="~/App_UserControls/MessagePop.ascx" tagname="MessagePop" tagprefix="uc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Accounting DocumentReservations</title>

    <script language="javascript" type="text/javascript">
        function okay() {
            window.parent.document.getElementById('dummyPaymentOk').click();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ToolkitScriptManager ID="tkScriptManager" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true" />
    <div class="Blue" style="background-color: Transparent; vertical-align: top;" >
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG" >
                    <asp:Label ID="lblFilter" runat="server" SkinID="skGridLabel" Text="Accounting Document Reservations" />
                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CssClass="InvButton" 
                        ImageUrl="~/Images/cancel_big.gif" OnClientClick="okay();" 
                        style="float: right; background: white; border-radius: 10px; margin: 3px;" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder" style="background-color: White;">
                    <asp:Panel ID="pnlScroll" runat="server" style="max-height: 450px;" ScrollBars="Auto">
                <asp:Repeater ID="rptPayments" runat="server" DataSourceID="dsPayments" >
                    <HeaderTemplate>
                        <table cellpadding="0" cellspacing="0" style="border-collapse: collapse; border: solid 1px;">
                            <tr>
                                <td class="PreRowHead" rowspan="2" style="width: 20px;">&nbsp</td>
                                <td class="PreRowHead" rowspan="2" style="width: 300px;">
                                    Guest Name
                                </td>
                                <td class="PreRowHead" rowspan="2" style="width: 100px;">
                                    Bk Number
                                </td>
                                <td class="PreRowHead" rowspan="2" style="width: 80px;">
                                    Bill
                                </td>
                                <td class="PreRowHead" rowspan="1" style="width: 160px;" colspan="2">
                                    Payment
                                </td>
                                <td class="PreRowHead" rowspan="2" style="width: 80px;">
                                    Total
                                </td>
                                <td class="PreRowHead" rowspan="1" colspan="2" style="width: 150px;">
                                    <asp:Label ID="lblDocument" runat="server" /><br />
                                </td>
                            </tr>
                            <tr>
                                <td class="PreRowHead" style="width: 80px;">
                                    Applied
                                </td>
                                <td class="PreRowHead" style="width: 80px;">
                                    Reserved
                                </td>
                                <td class="PreRowHead" rowspan="1" colspan="2" style="width: 150px;">
                                    <asp:Label ID="lblBalance" runat="server" ToolTip="Effective balance" 
                                        Font-Bold="false" Font-Italic="false" />
                                </td>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Panel ID="Panel1" runat="server" Visible='<%# Eval("rnH")=0 %>'>
                            <tr>
                                <td class="PreRowHeadSel" colspan="9" style="text-align: left;">
                                    <asp:Label ID="lblHotelName" runat="server" Text='<%# Eval("Hotel") %>'/>
                                </td>
                            </tr>
                        </asp:Panel>
                        <asp:Panel ID="Panel3" runat="server" Visible='<%# Eval("rnH")>0 %>'>
                            <tr>
                                <td class="PreRow" style="border-style: solid none none solid; text-align: left; padding: 2px;">
                                    <asp:ImageButton ID="ibSelect" runat="server" Width="17px" Height="17px" CausesValidation="False"
                                        ImageUrl='<%# BookingStateIcon(Eval("InHouseState")) %>'
                                        ToolTip='<%# Eval("BookingID") %>' Enabled="false"
                                        CommandArgument='<%# Eval("BookingID") %>' CommandName="Select" />
                                </td>
                                <td class="PreRow" style="border-style: solid solid none none; text-align: left;">
                                    <asp:LinkButton ID="lbSelect" runat="server" Text='<%# Eval("PreInvText") %>' CausesValidation="false"
                                        ToolTip='<%# Eval("FolioFull") %>' Enabled="false"
                                        CommandArgument='<%# Eval("BookingID") %>' CommandName="Select" />
                                </td>
                                <td class="PreRow" style="border-style: solid solid none none;">
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("BkNumber") %>' />
                                </td>
                                <td class="PreRow" style="text-align: right;">
                                    <asp:Label ID="Label3c" runat="server" Text='<%# Eval("InvResTotal","{0:N2}") %>' />
                                </td>
                                <td class="PreRow" style="text-align: right;">
                                    <asp:Label ID="Label36" runat="server" Text='<%# Eval("AccAppTotal","{0:N2}") %>' />
                                </td>
                                <td class="PreRow" style="text-align: right;">
                                    <asp:Label ID="Label35" runat="server" Text='<%# Eval("AccResTotal","{0:N2}") %>' />
                                </td>
                                <td class="PreRow" style="text-align: right;">
                                    <asp:Label ID="Label34" runat="server" Text='<%# Eval("InvResBalance","{0:N2}") %>' />
                                </td>
                                <td class="PreRow" colspan="2">
                                <asp:HiddenField ID="hfBooking" runat="server" Value='<%# Eval("BookingID") %>' />
                                <asp:FormView ID="fvPayment" runat="server" DataKeyNames="AccResID" DataSourceID="dsPayment" 
                                    OnItemCommand="fvPayment_ItemCommand">
                                    <ItemTemplate>
                                        <table cellpadding="0" cellspacing="0">
                                            <tr>                                                                    
                                                <td style="text-align: right; width: 100px;">
                                                    <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("AccResAmount","{0:N2}") %>' />
                                                </td>
                                                <td style="text-align: left; width: 50px;">
                                                    <asp:HiddenField ID="hfAccResID" runat="server" Value='<%# Bind("AccResID") %>' />
                                                    <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="false" 
                                                        CommandName="payDelete" CommandArgument='<%# Eval("AccResID") %>'
                                                        Visible='<%# Eval("AccResAmount") >= 0.01 %>'
                                                        ImageUrl="~/Images/delete_inline.gif" CssClass="ImgButton"  style="padding-top:2px;"
                                                        OnClientClick="return confirm('Are you sure you want to delete the payment?')" />
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <table cellpadding="0" cellspacing="0">
                                            <tr>                                                                    
                                                <td style="text-align: right; width: 100px;">
                                                    <asp:TextBox ID="txtAmount" runat="server" CssClass="TextBox" Text='<%# Bind("AccResAmount") %>' 
                                                        style="text-align: right;" />

                                                    <asp:CompareValidator ID="dec_txtAmount" runat="server" Display="None" 
                                                        ErrorMessage="Input a valid amount (group separator is not allowed)!" 
                                                        Operator="DataTypeCheck" Type="Double"
                                                        ControlToValidate="txtAmount"/>
                                                    <asp:ValidatorCalloutExtender ID="ca_dec_txtAmount" runat="server" 
                                                        TargetControlID="dec_txtAmount" />
                                                    <asp:RequiredFieldValidator ID="req_txtAmount" runat="server" Display="None"
                                                        ErrorMessage="Required field"
                                                        ControlToValidate="txtAmount" />
                                                    <asp:ValidatorCalloutExtender ID="ca_req_txtAmount" runat="server" 
                                                        TargetControlID="req_txtAmount" />
                                                    <asp:CompareValidator ID="gt_txtAmount" runat="server" Display="None" 
                                                        ErrorMessage="Amount has to be greater than zero" 
                                                        Operator="GreaterThan" Type="Double" ValueToCompare="0"
                                                        ControlToValidate="txtAmount"/>
                                                    <asp:ValidatorCalloutExtender ID="ca_gt_txtAmount" runat="server" 
                                                        TargetControlID="gt_txtAmount" />

                                                </td>
                                                <td style="text-align: left; width: 50px;">
                                                    <asp:HiddenField ID="hfAccResID" runat="server" Value='<%# Bind("AccResID") %>' />
                                                    <asp:ImageButton ID="btUpdate" runat="server" ImageUrl="~/Images/accept_inline.gif" 
                                                        CommandName="payUpdate" CommandArgument='<%# Eval("AccResID") %>'
                                                        CssClass="ImgButton" />
                                                    <asp:ImageButton ID="btCancel" runat="server" ImageUrl="~/Images/decline_inline.gif"
                                                        CommandName="Cancel" CausesValidation="true" CssClass="ImgButton" />
                                                </td>
                                            </tr>
                                        </table>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <table cellpadding="0" cellspacing="0">
                                            <tr>                                                                    
                                                <td style="text-align: right; width: 100px;">
                                                    <asp:TextBox ID="txtAmount" runat="server" CssClass="TextBox" Text='<%# Bind("AccResAmount") %>' 
                                                        style="text-align: right;" />

                                                    <asp:CompareValidator ID="dec_txtAmount" runat="server" Display="None" 
                                                        ErrorMessage="Input a valid amount (group separator is not allowed)!" 
                                                        Operator="DataTypeCheck" Type="Double"
                                                        ControlToValidate="txtAmount"/>
                                                    <asp:ValidatorCalloutExtender ID="ca_dec_txtAmount" runat="server" 
                                                        TargetControlID="dec_txtAmount" />
                                                    <asp:RequiredFieldValidator ID="req_txtAmount" runat="server" Display="None"
                                                        ErrorMessage="Required field"
                                                        ControlToValidate="txtAmount" />
                                                    <asp:ValidatorCalloutExtender ID="ca_req_txtAmount" runat="server" 
                                                        TargetControlID="req_txtAmount" />
                                                    <asp:CompareValidator ID="gt_txtAmount" runat="server" Display="None" 
                                                        ErrorMessage="Amount has to be greater than zero" 
                                                        Operator="GreaterThan" Type="Double" ValueToCompare="0"
                                                        ControlToValidate="txtAmount"/>
                                                    <asp:ValidatorCalloutExtender ID="ca_gt_txtAmount" runat="server" 
                                                        TargetControlID="gt_txtAmount" />

                                                </td>
                                                <td style="text-align: left; width: 50px;">
                                                    <asp:ImageButton ID="btUpdate" runat="server" ImageUrl="~/Images/accept_inline.gif" 
                                                        CommandName="payInsert" CssClass="ImgButton" />
                                                    <asp:ImageButton ID="btCancel" runat="server" ImageUrl="~/Images/decline_inline.gif"
                                                        CommandName="Cancel" CausesValidation="true" CssClass="ImgButton" />
                                                </td>
                                            </tr>
                                        </table>
                                    </InsertItemTemplate>
                                    <EmptyDataTemplate>
                                        <table cellpadding="0" cellspacing="0">
                                            <tr>                                                                    
                                                <td style="text-align: right; width: 100px;"></td>
                                                <td style="text-align: right; width: 50px;"></td>
                                            </tr>
                                        </table>
                                    </EmptyDataTemplate>
                                </asp:FormView>
                                <asp:ObjectDataSource ID="dsPayment" runat="server" OldValuesParameterFormatString="{0}"
                                    SelectMethod="GetDataBy" TypeName="dsProformaApplicationTableAdapters.AccDocReservationTableAdapter"
                                    DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update" >
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="AccDocID" QueryStringField="AccDocID" Type="Int32" />
                                        <asp:Parameter Name="BookingID" Type="Int32" />
                                    </SelectParameters>
                                    <InsertParameters>
                                        <asp:QueryStringParameter Name="AccDocID" QueryStringField="AccDocID" Type="Int32" />
                                        <asp:Parameter Name="BookingID" Type="Int32" />
                                        <asp:Parameter Name="AccResAmount" Type="Decimal" />
                                        <asp:Parameter Name="UserName" Type="String" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="AccResID" Type="Int32" />
                                        <asp:Parameter Name="AccResAmount" Type="Decimal" />
                                        <asp:Parameter Name="UserName" Type="String" />
                                    </UpdateParameters>
                                    <DeleteParameters>
                                        <asp:Parameter Name="AccResID" Type="Int32" />
                                        <asp:Parameter Name="AccResAmount" Type="Decimal" />
                                        <asp:Parameter Name="UserName" Type="String" />
                                    </DeleteParameters>
                                </asp:ObjectDataSource>
                                </td>
                            </tr>
                        </asp:Panel>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:Panel ID="pnlFootNoData" runat="server" Visible='<%# rptPayments.Items.Count < 1 %>'>
                            <tr>
                                <td class="PreRowHeadSel" style="height: 25px;" colspan="8">
                                    Accounting document is not used for proforma payment
                                </td>
                            </tr>
                        </asp:Panel>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <uc:MessagePop ID="msgPop" runat="server" Title="Proforma Payment" />
    </div>
    <asp:ObjectDataSource ID="dsPayments" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByAccDoc" TypeName="dsProformaApplicationTableAdapters.ProformaPaymentTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="AccDocID" QueryStringField="AccDocID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    </form>
</body>
</html>
