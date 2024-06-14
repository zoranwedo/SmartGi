<%@ Page Title="" Language="VB" MasterPageFile="~/Invoices/masterProForma.master"
    AutoEventWireup="false" MaintainScrollPositionOnPostback="true" CodeFile="ProFormaCreate.aspx.vb"
    Inherits="Invoices_InvoiceCreate" %>

<asp:Content ID="pfTitle" ContentPlaceHolderID="title" runat="Server">
    ProForma Detail
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ProFormaContent" runat="Server">
    <div id="InvDet" class="Blue">
        <asp:UpdatePanel ID="UpdatePanelMain" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table style="width: 100%;">
                    <tr>
                        <td>
                            <asp:FormView ID="fvInvoice" runat="server" DataSourceID="dsInvoice" Width="100%"
                                DataKeyNames="InvoiceID">
                                <EditItemTemplate>
                                    <div class="Blue">
                                        <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                            <tr>
                                                <td class="GridLabelBG" colspan="2">
                                                    <asp:Label ID="Label26" runat="server" SkinID="skGridLabel" Text='<%# "Proforma Num " &  Eval("InvNumber") %>' />
                                                    &nbsp;
                                                    <asp:Label ID="Label9" runat="server" SkinID="skGridLabel" Text='<%# Eval("InvTypeDisp") %>'
                                                        Visible='<%# iif(Eval("InvType") >0,True,False) %>' />
                                                    &nbsp;<asp:Label ID="Label8" runat="server" SkinID="skGridLabel" Text='<%# Eval("ResGroup") %>'
                                                        Visible='<%# iif(Eval("InvType") =1,True,False) %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="GridRowClear" style="width: 30px;">
                                                    &nbsp;
                                                </td>
                                                <td class="GridRow2B" style="padding: 6px;">
                                                    <table cellpadding="0" cellspacing="0" style="width: 700px;">
                                                        <tr>
                                                            <td style="padding-left: 5px;">
                                                                Hotel
                                                            </td>
                                                            <td style="padding-left: 5px;" colspan="4">
                                                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" BackColor="White"
                                                                    CssClass="TextBox" DataSourceID="dsAllHotels" DataTextField="Hotel" DataValueField="HotelID"
                                                                    Enabled="False" OnDataBound="ddlHotels_DataBound" OnSelectedIndexChanged="ddlHotels_SelectedIndexChanged"
                                                                    SelectedValue='<%# Eval("HotelId") %>'>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="GridRow1B" style="padding-left: 5px;">
                                                                Tour Operator
                                                            </td>
                                                            <td class="GridRow1B" style="padding-left: 5px;" colspan="4">
                                                                (<asp:Label ID="Label28" runat="server" Text='<%# Eval("TourOpId") %>'></asp:Label>
                                                                )
                                                                <asp:Label ID="Label32" runat="server" Text='<%# Eval("BillingName") %>'></asp:Label>
                                                                &nbsp;(<asp:Label ID="Label36" runat="server" Text='<%# Eval("TourOp") %>'></asp:Label>
                                                                )
                                                            </td>
                                                        </tr>
                                                        <tr style="height: 10px;">
                                                            <td class="SelectRow1B" style="height: 15px; padding-left: 5px;">
                                                                CheckIn
                                                            </td>
                                                            <td class="SelectRow1B" style="height: 15px; padding-left: 5px;">
                                                                CheckOut
                                                            </td>
                                                            <td class="SelectRow1B" style="height: 15px; padding-left: 5px;">
                                                                Nhgt
                                                            </td>
                                                            <td class="SelectRow1B">
                                                                Inv Date
                                                            </td>
                                                            <td class="SelectRow1B">
                                                                &nbsp;<asp:Label ID="Label15" runat="server" Text="Amount"></asp:Label>
                                                                <br />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="GridRow1B" colspan="1" style="padding-left: 5px;">
                                                                <asp:Label ID="Label14" runat="server" Text='<%# Eval("CheckIn", "{0:d}") %>'></asp:Label>
                                                            </td>
                                                            <td class="GridRow1B" style="padding-left: 5px;">
                                                                <asp:Label ID="Label16" runat="server" Text='<%# Eval("CheckOut", "{0:d}") %>'></asp:Label>
                                                            </td>
                                                            <td class="GridRow1B" style="padding-left: 5px;">
                                                                <asp:Label ID="Label17" runat="server" Text='<%# Eval("Nights") & "nights" %>'></asp:Label>
                                                            </td>
                                                            <td class="GridRow1B">
                                                                <asp:CompareValidator ID="CompareValidator8" runat="server" ControlToValidate="txtDate"
                                                                    Display="None" ErrorMessage="Input date!" Operator="DataTypeCheck" Type="Date">Input date!</asp:CompareValidator>
                                                                <asp:ValidatorCalloutExtender ID="CompareValidator8_ValidatorCalloutExtender" runat="server"
                                                                    Enabled="True" TargetControlID="CompareValidator8">
                                                                </asp:ValidatorCalloutExtender>
                                                                <asp:TextBox ID="txtDate" runat="server" CssClass="TextBox" Text='<%# Bind("InvDate", "{0:d}") %>'></asp:TextBox>
                                                                <asp:CalendarExtender ID="txtDate_CalendarExtender" runat="server" CssClass="cal_Theme1"
                                                                    Enabled="True" TargetControlID="txtDate">
                                                                </asp:CalendarExtender>
                                                            </td>
                                                            <td class="GridRow1B">
                                                                <asp:Label ID="Label37" runat="server" Text='<%# Eval("Amount", "{0:N2}") %>' Visible="<%# ModificationRights.RightsOperatorAdmin %>"></asp:Label>
                                                                <asp:Label ID="Label38" runat="server" Text='<%# Eval("HAmount", "{0:N2}") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="GridRowClear" colspan="1" style="padding-left: 5px;">
                                                                Proforma Note
                                                            </td>
                                                            <td class="GridRowClear" style="padding-left: 5px;" colspan="4">
                                                                <asp:TextBox ID="TextBox12" runat="server" CssClass="TextBox" Text='<%# Bind("InvRefText") %>'></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="GridRowClear" colspan="1" style="padding-left: 5px;">
                                                                Operator Note
                                                            </td>
                                                            <td colspan="4" style="padding-left: 5px;">
                                                                <asp:TextBox ID="TextBox13" runat="server" CssClass="TextBox" Text='<%# Bind("InvPrnText") %>'></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="GridRowClear" colspan="1" style="padding-left: 5px;">
                                                                Comment
                                                            </td>
                                                            <td colspan="4" style="padding-left: 5px;">
                                                                <asp:TextBox ID="TextBox14" runat="server" CssClass="TextBox" Text='<%# Bind("InvComment") %>'></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="GridRow1T" style="padding-left: 5px;">
                                                                &nbsp;
                                                            </td>
                                                            <td class="GridRow1T" style="padding-left: 5px;">
                                                                &nbsp;
                                                            </td>
                                                            <td class="GridRow1T" style="padding-left: 5px;">
                                                                &nbsp;
                                                            </td>
                                                            <td class="GridRow1T" style="padding-left: 5px;">
                                                                &nbsp;
                                                            </td>
                                                            <td align="right" class="GridRow1T">
                                                                &nbsp;<asp:Button ID="Button2" runat="server" CommandName="Update" SkinID="skBtnBase"
                                                                    Text="Save" />
                                                                &nbsp;<asp:Button ID="Button3" runat="server" CommandName="Cancel" SkinID="skBtnBase"
                                                                    Text="Cancel" />
                                                                &nbsp;
                                                            </td>
                                                            <td class="GridRowClear">
                                                                &nbsp;
                                                            </td>
                                                            <td class="GridRowClear">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <div class="Blue">
                                        <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                            <tr>
                                                <td class="GridLabelBG" colspan="2">
                                                    <asp:Label ID="Label1" runat="server" Text="Create New Proforma For:" SkinID="skGridLabel" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="GridRowClear" style="width: 30px;">
                                                    &nbsp;
                                                </td>
                                                <td class="GridRow2B" style="padding: 6px;">
                                                    <table cellpadding="0" cellspacing="0" style="width: 640px;">
                                                        <tr>
                                                            <td class="GridRow1B" style="width: 120px; padding-left: 5px;">
                                                                Proforma Type
                                                            </td>
                                                            <td class="GridRow1B" style="width: 240px;">
                                                                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="TextBox" SelectedValue='<%# Bind("InvType") %>'
                                                                    AutoPostBack="True" AppendDataBoundItems="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                                                    <asp:ListItem Value="0">Stay</asp:ListItem>
                                                                    <asp:ListItem Value="1">Group</asp:ListItem>
                                                                    <asp:ListItem Value="2">Cancel</asp:ListItem>
                                                                    <asp:ListItem Value="3">No-Show</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td class="GridRow1B" style="width: 120px;">
                                                                <asp:Label ID="lblGroup" runat="server" Text="Group" Visible='<%# iif(hfInvType.Value ="1",True,False) %>'></asp:Label>
                                                            </td>
                                                            <td class="GridRow1B" style="width: 240px;">
                                                                <asp:TextBox ID="txtInvType" runat="server" CssClass="TextBox" Text='<%# Bind("ResGroup") %>'
                                                                    Visible='<%# iif(hfInvType.Value ="1",True,False) %>'></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="GridRow1B" style="width: 120px; padding-left: 5px;">
                                                                Hotel
                                                            </td>
                                                            <td class="GridRow1B" colspan="3">
                                                                <asp:DropDownList ID="ddlHotels" runat="server" CssClass="TextBox" DataSourceID="dsAllHotels"
                                                                    DataTextField="Hotel" DataValueField="HotelID" SelectedValue='<%# Bind("HotelId") %>'
                                                                    OnSelectedIndexChanged="ddlHotels_SelectedIndexChanged" AutoPostBack="True" OnDataBound="ddlHotels_DataBound">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="GridRow1B" style="width: 120px; padding-left: 5px;">
                                                                Tour Operator
                                                            </td>
                                                            <td class="GridRow1B" colspan="3">
                                                                <asp:DropDownList ID="ddlTO" runat="server" CssClass="TextBox" DataSourceID="dsTOAll"
                                                                    DataTextField="TourOp" DataValueField="TourOpID" SelectedValue='<%# Bind("TourOpId") %>'>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="GridRow1B" style="width: 120px; padding-left: 5px;">
                                                                Check In
                                                            </td>
                                                            <td class="GridRow1B" style="width: 240px;">
                                                                <asp:TextBox ID="txtCheckIn" runat="server" CssClass="TextBox" Text='<%# Bind("CheckIn", "{0:d}") %>' />
                                                                <asp:CalendarExtender ID="txtCheckIn_CalendarExtender" runat="server" CssClass="cal_Theme1"
                                                                    TargetControlID="txtCheckIn" />
                                                            </td>
                                                            <td class="GridRow1B" style="width: 120px;">
                                                                Check Out
                                                            </td>
                                                            <td class="GridRow1B" style="width: 240px;">
                                                                <asp:CompareValidator ID="CompareValidator9" runat="server" ControlToCompare="txtCheckIn"
                                                                    ControlToValidate="txtCheckOut" Display="None" ErrorMessage="CheckOut date must be greater than Check In date"
                                                                    Operator="GreaterThanEqual" Type="Date">CheckOut date must be greater than Check In date</asp:CompareValidator>
                                                                <asp:ValidatorCalloutExtender ID="CompareValidator9_ValidatorCalloutExtender" runat="server"
                                                                    Enabled="True" TargetControlID="CompareValidator9">
                                                                </asp:ValidatorCalloutExtender>
                                                                <asp:TextBox ID="txtCheckOut" runat="server" CssClass="TextBox" Text='<%# Bind("CheckOut", "{0:d}") %>' />
                                                                <asp:CalendarExtender ID="txtCheckOut_CalendarExtender" runat="server" CssClass="cal_Theme1"
                                                                    TargetControlID="txtCheckOut" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="GridRow1B" style="width: 120px; padding-left: 5px;">
                                                                Ref Text
                                                            </td>
                                                            <td class="GridRow1B" style="width: 240px;">
                                                                <asp:TextBox ID="TextBox6" runat="server" CssClass="TextBox" Text='<%# Bind("InvRefText") %>'></asp:TextBox>
                                                            </td>
                                                            <td class="GridRow1B" style="width: 120px;">
                                                                Print Text
                                                            </td>
                                                            <td class="GridRow1B" style="width: 240px;">
                                                                <asp:TextBox ID="TextBox1" runat="server" CssClass="TextBox" Text='<%# Bind("InvPrnText") %>'></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="GridRowClear" style="width: 120px; padding-left: 5px;">
                                                                Comment
                                                            </td>
                                                            <td class="GridRowClear" colspan="3">
                                                                <asp:TextBox ID="TextBox7" runat="server" CssClass="TextBox" Text='<%# Bind("InvComment") %>'></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <div class="Blue">
                                        <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                            <tr>
                                                <td class="GridLabelBG" colspan="6">
                                                    <asp:Label ID="Label30" runat="server" SkinID="skGridLabel" Text='<%# "Invoice No " & Eval("InvNumber") %>' />
                                                    <asp:Label ID="Label9" runat="server" SkinID="skGridLabel" Text='<%# "|" & Eval("InvTypeDisp") %>'
                                                        Visible='<%# iif(Eval("InvType") >0,True,False) %>' />
                                                    <asp:Label ID="Label8" runat="server" SkinID="skGridLabel" Text='<%# "|" & Eval("ResGroup") %>'
                                                        Visible='<%# iif(Eval("InvType") =1,True,False) %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 30px;" rowspan="8">
                                                    &nbsp;
                                                </td>
                                                <td style="width: 120px;" class="GridRow1B">
                                                    <b>Hotel</b>
                                                </td>
                                                <td style="width: 580px;" class="GridRow1B">
                                                    <asp:DropDownList ID="ddlHotels" runat="server" AutoPostBack="True" BackColor="White"
                                                        CssClass="TextBox" DataSourceID="dsAllHotels" DataTextField="Hotel" DataValueField="HotelID"
                                                        Enabled="False" OnDataBound="ddlHotels_DataBound" OnSelectedIndexChanged="ddlHotels_SelectedIndexChanged"
                                                        SelectedValue='<%# Eval("HotelId") %>'>
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="width: 10px;" rowspan="8">
                                                    &nbsp;
                                                </td>
                                                <td style="width: 120px;" rowspan="8" valign="top">
                                                    <div class="Red">
                                                        <table class="GridBorderThin" cellpadding="0" cellspacing="0" style="vertical-align: top;">
                                                            <tr>
                                                                <td style="width: 120px; height: 30px; text-align: center; vertical-align: middle">
                                                                    <asp:Button ID="btRecalc" runat="server" CommandName="Recalc" SkinID="skBtnBase"
                                                                        Text="Recalculate" Width="100px" OnClick="btRecalc_Click" Visible='<%# (iif(Eval("State")>3,True,False) And ModificationRights.RightsOperatorAdmin) Or (iif(Eval("State")<4 AND Eval("State")>0,True,False) And ModificationRights.RightsHotel) %>'
                                                                        OnClientClick="return confirm('Are you sure you want to recalculate whole invoice?')" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 120px; height: 30px; text-align: center; vertical-align: middle">
                                                                    <b>
                                                                        <asp:Label ID="Label41" runat="server" CssClass="SelectRow" Style="padding: 2px;"
                                                                            Text='<%# Eval("InvoiceState") %>' Visible='<%# iif(Eval("State") >= 0,true,false) %>' />
                                                                    </b>
                                                                    <asp:Label ID="Label33" runat="server" ForeColor="Red" Text='<%# iif(Eval("State") = -3, "Canceled by Hotel","Canceled by CCI") %>'
                                                                        Visible='<%# iif(Eval("State") = -3 OR Eval("State") = -7,true,false) %>' />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 120px; text-align: center;">
                                                                    <asp:CheckBox ID="cbRVHtl" runat="server" Text="Htl Reviewed" OnCheckedChanged="cbRVHtl_CheckedChanged"
                                                                        AutoPostBack="True" Checked='<%# iif(Eval("State")=2, True, False) %>' Visible='<%# ModificationRights.RightsHotel And iif(Eval("State")<4,True,False) %>' />
                                                                    <br />
                                                                    <asp:HyperLink ID="hlSend" runat="server" NavigateUrl="~/Invoices/InvoiceSend.aspx"
                                                                        Visible='<%# ModificationRights.RightsHotel And iif(Eval("State")=2,True,False) %>'> Sending List &gt;&gt; </asp:HyperLink>
                                                                    <br />
                                                                    <asp:CheckBox ID="cbRVCCI" runat="server" Text="CCI Reviewed" OnCheckedChanged="cbRVCCI_CheckedChanged"
                                                                        AutoPostBack="True" Checked='<%# iif(Eval("State")=5, True, False) %>' Visible='<%# iif(Eval("State") >3,True,False) And ModificationRights.RightsOperatorAdmin %>' />
                                                                    <br />
                                                                    <asp:CheckBox ID="cbExcel" runat="server" Style="padding-right: 5px; width: 370px"
                                                                        Text="Excel" TextAlign="Left" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 120px; height: 30px; text-align: center; vertical-align: middle">
                                                                    <asp:Button ID="Button1" runat="server" CommandName="Print" SkinID="skBtnBase" Text="Print Proforma"
                                                                        Width="100px" OnClick="Button1_Click" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 120px; height: 30px; text-align: center; vertical-align: middle">
                                                                    <asp:Button ID="btnCancel" runat="server" CommandName="CancelInv" SkinID="skBtnBase"
                                                                        Text='<%# iif(Eval("State") = -3 OR Eval("State") = -7,"Uncancel","Cancel") %>'
                                                                        Width="100px" OnClick="btnCancel_Click" OnClientClick="return confirm('Are you sure you want to change invoice state?')" />
                                                                    <br />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </td>
                                                <td rowspan="8">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 120px;" class="GridRow1B">
                                                    <b>Tour Operator</b>
                                                </td>
                                                <td style="width: 580px;" class="GridRow1B">
                                                    (<asp:Label ID="Label25" runat="server" Text='<%# Eval("TourOpId") %>'></asp:Label>)
                                                    <asp:Label ID="Label24" runat="server" Text='<%# Eval("BillingName") %>'></asp:Label>
                                                    (<asp:Label ID="Label27" runat="server" Text='<%# Eval("TourOp") %>'></asp:Label>)
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="GridRow1B" colspan="2" style="padding: 4px 0px 4px 0px;">
                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <b>
                                                                <td class="SelectRow1B" style="width: 20%;">
                                                                    CheckIn
                                                                </td>
                                                                <td class="SelectRow1B" style="width: 20%;">
                                                                    CheckOut
                                                                </td>
                                                                <td class="SelectRow1B" style="width: 20%;">
                                                                    Nights
                                                                </td>
                                                                <td class="SelectRow1B" style="width: 20%;">
                                                                    Inv Date
                                                                </td>
                                                                <td class="SelectRow1B" style="width: 20%;">
                                                                    Amount
                                                                </td>
                                                            </b>
                                                        </tr>
                                                        <tr>
                                                            <td class="GridRowClear">
                                                                <asp:Label ID="Label14" runat="server" Text='<%# Eval("CheckIn", "{0:d}") %>' />
                                                            </td>
                                                            <td class="GridRowClear">
                                                                <asp:Label ID="Label16" runat="server" Text='<%# Eval("CheckOut", "{0:d}") %>' />
                                                            </td>
                                                            <td class="GridRowClear">
                                                                <asp:Label ID="Label17" runat="server" Text='<%# Eval("Nights") %>' />
                                                            </td>
                                                            <td class="GridRowClear">
                                                                <asp:Label ID="Label23" runat="server" Text='<%# Eval("InvDate", "{0:d}") %>' />
                                                            </td>
                                                            <td class="GridRowClear">
                                                                <asp:Label ID="lblAmount0" runat="server" Text='<%# Eval("Amount", "{0:N2}") %>'
                                                                    Visible="<%# cbHotel.Checked=false %>" />
                                                                <asp:Label ID="lblHAmount0" runat="server" Text='<%# Eval("HAmount", "{0:N2}") %>'
                                                                    Visible="<%# cbHotel.Checked %>" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="GridRowClear" colspan="5">
                                                                <asp:FormView ID="FormView1" runat="server" DataSourceID="dsInvBalance" DataKeyNames="AppAmount"
                                                                    Visible="<%# Not ModificationRights.RightsHotel %>" Width="100%">
                                                                    <EditItemTemplate>
                                                                    </EditItemTemplate>
                                                                    <InsertItemTemplate>
                                                                    </InsertItemTemplate>
                                                                    <ItemTemplate>
                                                                        Balance:
                                                                        <asp:Label ID="BalanceLabel" runat="server" Text='<%# Eval("Balance", "{0:N}") %>' />
                                                                        &nbsp;&nbsp; On:
                                                                        <asp:Label ID="BalanceDateLabel" runat="server" Text='<%# Eval("BalanceDate", "{0:d}") %>' />
                                                                        &nbsp;&nbsp; (Applied:
                                                                        <asp:Label ID="AppAmountLabel" runat="server" Text='<%# Eval("AppAmount", "{0:N}") %>' />)
                                                                    </ItemTemplate>
                                                                </asp:FormView>
                                                                <asp:ObjectDataSource ID="dsInvBalance" runat="server" OldValuesParameterFormatString="original_{0}"
                                                                    SelectMethod="GetData" TypeName="dsInvoicesTableAdapters.InvAccBalanceTableAdapter">
                                                                    <SelectParameters>
                                                                        <asp:QueryStringParameter Name="InvoiceID" QueryStringField="InvoiceID" Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:ObjectDataSource>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 120px;" class="SelectRow1B">
                                                    Reference
                                                </td>
                                                <td style="width: 580px;" class="GridRow1B">
                                                    <asp:Label ID="Label34" runat="server" Text='<%# Eval("InvRefText") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 120px;" class="SelectRow1B">
                                                    Note
                                                </td>
                                                <td style="width: 580px;" class="GridRow1B">
                                                    <asp:Label ID="Label29" runat="server" Text='<%# Eval("InvPrnText") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 120px;" class="SelectRow1B">
                                                    Comment
                                                </td>
                                                <td style="width: 580px;" class="GridRow1B">
                                                    <asp:Label ID="Label35" runat="server" Text='<%# Eval("InvComment") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 120px;" class="SelectRowClear">
                                                    Delivery Date
                                                </td>
                                                <td style="width: 580px; padding-top: 2px; vertical-align: middle;" class="GridRowClear">
                                                    <asp:TextBox ID="txtDelivery" runat="server" CssClass="TextBox" Width="450px" Text='<%# Bind("DeliveryDate") %>'
                                                        Enabled='<%# iif(Eval("State")=5 OR Eval("State")=6, True,False) And ModificationRights.RightsOperatorAdmin %>'> </asp:TextBox>
                                                    <asp:CalendarExtender ID="txtDelivery_CalendarExtender" runat="server" CssClass="cal_Theme1"
                                                        Enabled="True" TargetControlID="txtDelivery">
                                                    </asp:CalendarExtender>
                                                    <asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="txtDelivery"
                                                        Display="None" ErrorMessage="Date field!" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                                    <asp:ValidatorCalloutExtender ID="CompareValidator7_ValidatorCalloutExtender" runat="server"
                                                        Enabled="True" TargetControlID="CompareValidator7">
                                                    </asp:ValidatorCalloutExtender>
                                                    <asp:Button ID="btnDeliv" runat="server" OnClick="btnDeliv_Click" SkinID="skBtnBase"
                                                        Text="Set Delivery" Width="100px" Visible='<%# iif(Eval("State")=5 OR Eval("State")=6, True,False) And ModificationRights.RightsOperatorAdmin %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="GridRow2T" style="margin-top: 2px; padding-top: 5px; text-align: right;"
                                                    colspan="2">
                                                    <asp:Button ID="btnupdate" runat="server" CommandName="Edit" SkinID="skBtnBase" Text="Edit"
                                                        Visible='<%# (iif(Eval("State") >3 And Eval("State") <> -7,True,False) And ModificationRights.RightsOperatorAdmin) Or (iif(Eval("State") < 3,True,False) And ModificationRights.RightsHotel) %>' />
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </ItemTemplate>
                            </asp:FormView>
                        </td>
                    </tr>
                </table>
                <asp:HiddenField ID="hfHotel" runat="server" />
                <asp:HiddenField ID="hfRoom" runat="server" />
                <asp:HiddenField ID="hfInvType" runat="server" />
                <asp:HiddenField ID="hfBillID" runat="server" />
                <asp:HiddenField ID="hfCh1" runat="server" />
                <asp:HiddenField ID="hfCh2" runat="server" />
                <asp:HiddenField ID="hfCh3" runat="server" />
                <asp:HiddenField ID="hfCh4" runat="server" />
                <br />
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="GridLabelBG ">
                            <asp:Label ID="Label31" runat="server" Text="Details" CssClass="GridLabel" Height="26px"></asp:Label>
                            <asp:CheckBox ID="cbHotel" runat="server" Text="Hotel" ForeColor="White" Height="26px"
                                AutoPostBack="True" />
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder" style="vertical-align: top;">
                            <asp:GridView ID="gvMix" runat="server" AutoGenerateColumns="False" DataKeyNames="DetailID"
                                DataSourceID="dsMix" SelectedIndex="0" Width="100%">
                                <RowStyle CssClass="GridRow1B" />
                                <SelectedRowStyle CssClass="SelectRow1T" />
                                <HeaderStyle CssClass="GridRow2B" />
                                <EmptyDataRowStyle CssClass="GridRow1B" Height="20px" />
                                <Columns>
                                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" ShowCancelButton="False"
                                        ShowSelectButton="True">
                                        <ItemStyle Width="25px" />
                                    </asp:CommandField>
                                    <asp:BoundField DataField="DetText" HeaderText="Guest Name">
                                        <ItemStyle Width="150px" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Arrival" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="txtStart" runat="server" Text='<%# Bind("EnterDate", "{0:d}") %>'></asp:Label></ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("EnterDate", "{0:d}") %>'></asp:TextBox></EditItemTemplate>
                                        <ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Departure" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="txtFinish" runat="server" Text='<%# Bind("ExitDate", "{0:d}") %>'></asp:Label></ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ExitDate", "{0:d}") %>'></asp:TextBox></EditItemTemplate>
                                        <ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="EnterDate" DataFormatString="{0:d}" HeaderText="Arrival"
                                        HtmlEncode="False" SortExpression="EnterDate">
                                        <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ExitDate" DataFormatString="{0:d}" HeaderText="Departure"
                                        HtmlEncode="False" SortExpression="ExitDate">
                                        <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Nights" HeaderText="Nts#" ReadOnly="True">
                                        <ItemStyle Width="50px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="BookingDate" DataFormatString="{0:d}" HeaderText="Bk.Date">
                                        <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="BookingVoucher" HeaderText="Voucher">
                                        <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="RoomTypeId" HeaderText="Room">
                                        <ItemStyle Width="50px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="MealPlanId" HeaderText="MP">
                                        <ItemStyle Width="40px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="AdultNum" HeaderText="Ad">
                                        <ItemStyle Width="25px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Chld1Num" HeaderText="Ch1">
                                        <ItemStyle Width="25px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Chld2Num" HeaderText="Ch2">
                                        <ItemStyle Width="25px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Chld3Num" HeaderText="Ch3">
                                        <ItemStyle Width="25px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Chld4Num" HeaderText="Ch4">
                                        <ItemStyle Width="25px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ChargeNights" HeaderText="ChargeNights" Visible="False">
                                    </asp:BoundField>
                                    <asp:BoundField DataField="RoomsNum" HeaderText="Rms#">
                                        <ItemStyle Width="50px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="RateCodeId" HeaderText="Rate">
                                        <ItemStyle Width="60px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="RateID" HeaderText="RateID" Visible="False" />
                                    <asp:BoundField DataField="RateType" HeaderText="RateType" Visible="False" />
                                    <asp:CheckBoxField DataField="HotelRate" HeaderText="HotelRate" Visible="False" />
                                    <asp:BoundField DataField="AmountAd" HeaderText="AmountAd" Visible="False" />
                                    <asp:BoundField DataField="AmountCh" HeaderText="AmountCh" Visible="False" />
                                    <asp:BoundField DataField="AmountEx" HeaderText="AmountEx" Visible="False" />
                                    <asp:TemplateField HeaderText="Amount">
                                        <ItemTemplate>
                                            <%--
                                            <asp:Label ID="lblAmountNull" runat="server" Visible='<%# Eval("Amount") Is DBNull.Value %>' 
                                                Text="NO RATES" />
                                            <asp:Label ID="lblAmountNotNull" runat="server" Visible='<%# Not (Eval("Amount") Is DBNull.Value) %>' 
                                                Text='<%# iif(Eval("Amount")=0,"NO RATES",Eval("Amount", "{0:N2}")) %>' />
                                            --%>
                                            <asp:Label ID="lblAmount" runat="server" Text='<%# Eval("Amount", "{0:N2}") %>' />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Amount", "{0:N2}") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemStyle Width="100px" />
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td style="width: 28px; height: 20px">
                                            </td>
                                            <td style="height: 20px; width: 368px;">
                                                <asp:Label ID="Label18" runat="server" Text="Guest Name"></asp:Label>
                                            </td>
                                            <td style="height: 20px; width: 82px;">
                                                <asp:Label ID="Label19" runat="server" Text="Bk Date"></asp:Label>
                                            </td>
                                            <td style="height: 20px; width: 80px;">
                                                <asp:Label ID="Label20" runat="server" Text="Bk Voucher"></asp:Label>
                                            </td>
                                            <td style="height: 20px; width: 50px;">
                                                <asp:Label ID="Label21" runat="server" Text="Room"></asp:Label>
                                            </td>
                                            <td style="height: 20px; width: 40px;">
                                                <asp:Label ID="Label22" runat="server" Text="MP"></asp:Label>
                                            </td>
                                            <td style="height: 20px; width: 25px;">
                                                <asp:Label ID="Label39" runat="server" Text="Ad"></asp:Label>
                                            </td>
                                            <td style="height: 20px; width: 25px;">
                                                <asp:Label ID="lblCh1" runat="server" Text="<%# Me.hfCh1.Value %>"></asp:Label>
                                            </td>
                                            <td style="height: 20px; width: 25px;">
                                                <asp:Label ID="lblCh2" runat="server" Text="<%# Me.hfCh2.Value %>"></asp:Label>
                                            </td>
                                            <td style="height: 20px; width: 25px;">
                                                <asp:Label ID="lblCh3" runat="server" Text="<%# Me.hfCh3.Value %>"></asp:Label>
                                            </td>
                                            <td style="height: 20px; width: 25px;">
                                                <asp:Label ID="lblCh4" runat="server" Text="<%# Me.hfCh4.Value %>"></asp:Label>
                                            </td>
                                            <td style="height: 20px; width: 25px;">
                                                <asp:Label ID="Label40" runat="server" Text="Rms#"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                            </asp:GridView>
                            <asp:FormView ID="fvNewDetail" runat="server" DataSourceID="dsMix" Width="100%">
                                <InsertItemTemplate>
                                    <table cellpadding="0" cellspacing="0">
                                        <tr align="left">
                                            <td class="GridRow1T" style="width: 28px;">
                                                &nbsp;
                                            </td>
                                            <td class="GridRow1T">
                                                <asp:TextBox ID="txtName" runat="server" CssClass="TextBox" Text='<%# Bind("DetText") %>'
                                                    Width="368px"></asp:TextBox>
                                            </td>
                                            <td class="GridRow1T">
                                                <asp:TextBox ID="txtStart" runat="server" CssClass="TextBox" Text='<%# Bind("BookingDate", "{0:d}") %>'
                                                    Width="82px" />
                                                <asp:CalendarExtender ID="calStart" runat="server" CssClass="cal_Theme1" TargetControlID="txtStart" />
                                                <asp:CompareValidator ID="valDtStart" runat="server" ControlToValidate="txtStart"
                                                    Display="None" ErrorMessage="Required date input!" Operator="DataTypeCheck" Type="Date" />
                                                <asp:ValidatorCalloutExtender ID="extDtStart" runat="server" SkinID="skExtender"
                                                    TargetControlID="valDtStart" />
                                            </td>
                                            <td class="GridRow1T">
                                                <asp:TextBox ID="txtVoucher" runat="server" CssClass="TextBox" Text='<%# Bind("BookingVoucher") %>'
                                                    Width="80px"></asp:TextBox>
                                            </td>
                                            <td class="GridRow1T" style="width: 50px;">
                                                <asp:DropDownList ID="ddlRoomType" runat="server" AutoPostBack="True" CssClass="TextBox"
                                                    DataSourceID="dsHtlRooms" DataTextField="RoomTypeID" DataValueField="RoomTypeID"
                                                    OnSelectedIndexChanged="ddlRoomType_SelectedIndexChanged" OnDataBound="ddlRoomType_DataBound"
                                                    Width="50px">
                                                </asp:DropDownList>
                                            </td>
                                            <td class="GridRow1T">
                                                <asp:DropDownList ID="ddlMP" runat="server" CssClass="TextBox" DataSourceID="dsHtlMP"
                                                    DataTextField="MealPlanID" DataValueField="MealPlanID" Width="40px">
                                                </asp:DropDownList>
                                            </td>
                                            <td class="GridRow1T">
                                                <asp:TextBox ID="txtAdult" runat="server" CssClass="TextBox" Width="25px" Text='<%# Bind("AdultNum") %>' />
                                                <asp:CompareValidator ID="valCommision0" runat="server" ControlToValidate="txtAdult"
                                                    Display="None" ErrorMessage="Must input number" Operator="DataTypeCheck" Type="Double" />
                                                <asp:ValidatorCalloutExtender ID="valCommision0_ValidatorCalloutExtender" runat="server"
                                                    SkinID="skExtender" TargetControlID="valCommision0" />
                                            </td>
                                            <td class="GridRow1T">
                                                <asp:TextBox ID="txtChld1" runat="server" CssClass="TextBox" Width="25px" Text='<%# Bind("Chld1Num") %>' />
                                                <asp:CompareValidator ID="valCommision1" runat="server" ControlToValidate="txtChld1"
                                                    Display="None" ErrorMessage="Must input number" Operator="DataTypeCheck" Type="Double" />
                                                <asp:ValidatorCalloutExtender ID="valCommision1_ValidatorCalloutExtender" runat="server"
                                                    SkinID="skExtender" TargetControlID="valCommision1" />
                                            </td>
                                            <td class="GridRow1T">
                                                <asp:TextBox ID="txtChld2" runat="server" CssClass="TextBox" Width="25px" Text='<%# Bind("Chld2Num") %>' />
                                                <asp:CompareValidator ID="valCommision2" runat="server" ControlToValidate="txtChld2"
                                                    Display="None" ErrorMessage="Must input number" Operator="DataTypeCheck" Type="Double" />
                                                <asp:ValidatorCalloutExtender ID="valCommision2_ValidatorCalloutExtender" runat="server"
                                                    SkinID="skExtender" TargetControlID="valCommision2" />
                                            </td>
                                            <td class="GridRow1T">
                                                <asp:TextBox ID="txtChld3" runat="server" CssClass="TextBox" Width="25px" Text='<%# Bind("Chld3Num") %>' />
                                                <asp:CompareValidator ID="valCommision4" runat="server" ControlToValidate="txtChld3"
                                                    Display="None" ErrorMessage="Must input number" Operator="DataTypeCheck" Type="Double" />
                                                <asp:ValidatorCalloutExtender ID="valCommision4_ValidatorCalloutExtender" runat="server"
                                                    SkinID="skExtender" TargetControlID="valCommision4" />
                                            </td>
                                            <td class="GridRow1T">
                                                <asp:TextBox ID="txtChld4" runat="server" CssClass="TextBox" Width="25px" Text='<%# Bind("Chld4Num") %>' />
                                                <asp:CompareValidator ID="valCommision3" runat="server" ControlToValidate="txtChld4"
                                                    Display="None" ErrorMessage="Must input number" Operator="DataTypeCheck" Type="Double" />
                                                <asp:ValidatorCalloutExtender ID="valCommision3_ValidatorCalloutExtender" runat="server"
                                                    SkinID="skExtender" TargetControlID="valCommision3" />
                                            </td>
                                            <td class="GridRow1T">
                                                <asp:TextBox ID="txtRoomsNum" runat="server" CssClass="TextBox" Width="25px" Text='<%# Bind("RoomsNum") %>' />
                                                <asp:CompareValidator ID="valCommision" runat="server" ControlToValidate="txtRoomsNum"
                                                    Display="None" ErrorMessage="Must input number" Operator="DataTypeCheck" Type="Double" />
                                                <asp:ValidatorCalloutExtender ID="extCommision" runat="server" SkinID="skExtender"
                                                    TargetControlID="valCommision" />
                                            </td>
                                            <td style="width: 244px; text-align: left;">
                                                <%--style="width: 100px;--%>
                                                <asp:ImageButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                                    ImageUrl="~/Images/accept_inline.gif" CssClass="ImgButton" />
                                                <asp:ImageButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                                    CommandName="Cancel" ImageUrl="~/Images/decline_inline.gif" CssClass="ImgButton" />
                                            </td>
                                        </tr>
                                    </table>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;
                                        width: 100%;">
                                        <tr>
                                            <td style="width: 90%;">
                                            </td>
                                            <td style="padding-left: 5px;" align="right">
                                                <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New"
                                                    OnClick="btnNew_Click" />&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <EmptyDataTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                        <tr>
                                            <td style="width: 930px; height: 30px;">
                                                &nbsp;
                                            </td>
                                            <td style="width: 75px; padding-left: 5px;">
                                                <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                                <HeaderTemplate>
                                </HeaderTemplate>
                            </asp:FormView>
                            <div class="Red" style="padding-left: 28px; margin-top: 2px;">
                                <asp:Panel ID="pnlDetail" runat="server">
                                    <asp:GridView ID="gvStay" runat="server" AutoGenerateColumns="False" DataKeyNames="DetailID"
                                        DataSourceID="dsStay" Style="margin-bottom: 0px">
                                        <RowStyle CssClass="GridRow1B" />
                                        <HeaderStyle CssClass="SelectRow1TB" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="Guest Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label12" runat="server" Text='<%# Eval("DetText") %>'></asp:Label></ItemTemplate>
                                                <AlternatingItemTemplate>
                                                </AlternatingItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName"
                                                        Display="None" ErrorMessage="Required Field">*</asp:RequiredFieldValidator><asp:ValidatorCalloutExtender
                                                            ID="RequiredFieldValidator1_ValidatorCalloutExtender" runat="server" Enabled="True"
                                                            TargetControlID="RequiredFieldValidator1">
                                                        </asp:ValidatorCalloutExtender>
                                                    <asp:TextBox ID="txtName" runat="server" CssClass="TextBox" Text='<%# Bind("DetText") %>'></asp:TextBox></EditItemTemplate>
                                                <FooterTemplate>
                                                </FooterTemplate>
                                                <HeaderTemplate>
                                                </HeaderTemplate>
                                                <ItemStyle Width="372px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Bk.Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("BookingDate", "{0:d}") %>'></asp:Label></ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="TextBox" Text='<%# Bind("BookingDate") %>'></asp:TextBox><asp:CalendarExtender
                                                        ID="TextBox2_CalendarExtender" runat="server" CssClass="cal_Theme1" Enabled="True"
                                                        TargetControlID="TextBox2">
                                                    </asp:CalendarExtender>
                                                </EditItemTemplate>
                                                <ItemStyle Width="82px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Voucher">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("BookingVoucher") %>'></asp:Label></ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox3" runat="server" CssClass="TextBox" Text='<%# Bind("BookingVoucher") %>'></asp:TextBox></EditItemTemplate>
                                                <ItemStyle Width="82px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Room">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("RoomTypeId") %>'></asp:Label></ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:DropDownList ID="ddlRoomType" runat="server" DataSourceID="dsHtlRooms" DataTextField="RoomTypeID"
                                                        DataValueField="RoomTypeID" CssClass="TextBox" SelectedValue='<%# Bind("RoomTypeId") %>'>
                                                    </asp:DropDownList>
                                                </EditItemTemplate>
                                                <ItemStyle Width="50px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="MP">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("MealPlanId") %>'></asp:Label></ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:DropDownList ID="ddlMP" runat="server" DataSourceID="dsHtlMP" DataTextField="MealPlanID"
                                                        DataValueField="MealPlanID" CssClass="TextBox">
                                                    </asp:DropDownList>
                                                </EditItemTemplate>
                                                <ItemStyle Width="40px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Ad">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("AdultNum") %>'></asp:Label></ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox6"
                                                        Display="None" ErrorMessage="CompareValidator" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator><asp:ValidatorCalloutExtender
                                                            ID="CompareValidator1_ValidatorCalloutExtender" runat="server" Enabled="True"
                                                            SkinID="skExtender" TargetControlID="CompareValidator1">
                                                        </asp:ValidatorCalloutExtender>
                                                    <asp:TextBox ID="TextBox6" runat="server" CssClass="TextBox" Text='<%# Bind("AdultNum") %>'></asp:TextBox></EditItemTemplate>
                                                <ItemStyle Width="25px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Ch1">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Chld1Num") %>'></asp:Label></ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtChld1E"
                                                        Display="None" ErrorMessage="Must input number" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator><asp:ValidatorCalloutExtender
                                                            ID="CompareValidator2_ValidatorCalloutExtender" runat="server" Enabled="True"
                                                            SkinID="skExtender" TargetControlID="CompareValidator2">
                                                        </asp:ValidatorCalloutExtender>
                                                    <asp:TextBox ID="txtChld1E" runat="server" CssClass="TextBox" Text='<%# Bind("Chld1Num") %>'></asp:TextBox></EditItemTemplate>
                                                <ItemStyle Width="25px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Ch2">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Chld2Num") %>'></asp:Label></ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="txtChld2E"
                                                        Display="None" ErrorMessage="Must input number" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator><asp:ValidatorCalloutExtender
                                                            ID="CompareValidator3_ValidatorCalloutExtender" runat="server" Enabled="True"
                                                            SkinID="skExtender" TargetControlID="CompareValidator3">
                                                        </asp:ValidatorCalloutExtender>
                                                    <asp:TextBox ID="txtChld2E" runat="server" CssClass="TextBox" Text='<%# Bind("Chld2Num") %>'></asp:TextBox></EditItemTemplate>
                                                <ItemStyle Width="25px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Ch3">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("Chld3Num") %>'></asp:Label></ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="txtChld3E"
                                                        Display="None" ErrorMessage="Must input number">*</asp:CompareValidator>
                                                    <asp:TextBox ID="txtChld3E" runat="server" CssClass="TextBox" Text='<%# Bind("Chld3Num") %>'></asp:TextBox></EditItemTemplate>
                                                <ItemStyle Width="25px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Ch4">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("Chld4Num") %>'></asp:Label></ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:CompareValidator ID="CompareValidator5" runat="server" ControlToValidate="txtChld4E"
                                                        Display="None" ErrorMessage="Must input number" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator><asp:ValidatorCalloutExtender
                                                            ID="CompareValidator5_ValidatorCalloutExtender" runat="server" Enabled="True"
                                                            SkinID="skExtender" TargetControlID="CompareValidator5">
                                                        </asp:ValidatorCalloutExtender>
                                                    <asp:TextBox ID="txtChld4E" runat="server" CssClass="TextBox" Text='<%# Bind("Chld4Num") %>'></asp:TextBox></EditItemTemplate>
                                                <ItemStyle Width="25px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Rms#">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("RoomsNum") %>'></asp:Label></ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:CompareValidator ID="CompareValidator6" runat="server" ControlToValidate="txtRoomsNum"
                                                        Display="None" ErrorMessage="Must input number" Operator="DataTypeCheck" Type="Double">*</asp:CompareValidator><asp:ValidatorCalloutExtender
                                                            ID="CompareValidator6_ValidatorCalloutExtender" runat="server" Enabled="True"
                                                            SkinID="skExtender" TargetControlID="CompareValidator6">
                                                        </asp:ValidatorCalloutExtender>
                                                    <asp:TextBox ID="txtRoomsNum" runat="server" CssClass="TextBox" Text='<%# Bind("RoomsNum") %>'></asp:TextBox></EditItemTemplate>
                                                <ItemStyle Width="50px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemStyle Width="60px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Amount">
                                                <EditItemTemplate>
                                                    <asp:Label ID="Label131" runat="server" Text='<%# Eval("Amount", "{0:N2}") %>' Visible="<%# iif(cbHotel.Checked,false,true) %>"></asp:Label>
                                                    <asp:Label ID="lblHamount1" runat="server" Text='<%# Eval("HAmount", "{0:N2}") %>'
                                                        Visible="<%# cbHotel.Checked %>"></asp:Label>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label13" runat="server" Text='<%# Bind("Amount", "{0:N2}") %>' Visible="<%# iif(cbHotel.Checked,false,true) %>"></asp:Label>
                                                    <asp:Label ID="lblHamount" runat="server" Text='<%# Bind("HAmount", "{0:N2}") %>'
                                                        Visible="<%# cbHotel.Checked %>"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle Width="80px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="HAmount" SortExpression="HAmount" Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label14" runat="server" Text='<%# Bind("HAmount", "{0:N2}") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("HAmount", "{0:N2}") %>'></asp:Label>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ibEdit" runat="server" CausesValidation="False" CommandName="Edit"
                                                        ImageUrl="~/Images/edit_inline.gif" />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:ImageButton ID="ibDelete" runat="server" CausesValidation="False" CommandName="Delete"
                                                        ImageUrl="~/Images/delete_inline.gif" OnClientClick="return confirm('Are you sure you want to delete the record')" />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Update"
                                                        ImageUrl="~/Images/accept_inline.gif" />
                                                    &nbsp;
                                                    <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                                        ImageUrl="~/Images/decline_inline.gif" />
                                                </EditItemTemplate>
                                                <ItemStyle Width="100px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="DetailID" InsertVisible="False" SortExpression="DetailID"
                                                Visible="False">
                                                <ItemTemplate>
                                                    <asp:Label ID="txtDetailID" runat="server" Text='<%# Eval("DetailID") %>'></asp:Label></ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:Label ID="txtDetailID" runat="server" Text='<%# Eval("DetailID") %>'></asp:Label></EditItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <div style="padding-left: 129px; margin-top: 2px;">
                                        <asp:GridView ID="gvBill" runat="server" AutoGenerateColumns="False" DataSourceID="dsBill"
                                            SelectedIndex="0">
                                            <RowStyle CssClass="GridRow1B" />
                                            <SelectedRowStyle CssClass="SelectRow1T" />
                                            <HeaderStyle CssClass="SelectRow1TB" />
                                            <Columns>
                                                <asp:TemplateField ShowHeader="False">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandArgument='<%# Eval("RateID") %>'
                                                            CommandName="Select" ImageUrl="~/Images/select_.gif" ToolTip="Select for Child Policy" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="25px" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="EnterDate" HeaderText="Arrival" DataFormatString="{0:d}"
                                                    ReadOnly="True">
                                                    <ItemStyle Width="80px" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="Departure">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkEditDate" runat="server" CommandArgument='<%# Eval("ExitDate") %>'
                                                            CommandName="EditBillDate" Text='<%# Eval("ExitDate", "{0:d}") %>'></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtExitDate" runat="server" Text='<%# Bind("ExitDate", "{0:d}") %>'
                                                            Width="80px"></asp:TextBox>
                                                        <asp:CalendarExtender ID="txtExitDate_CalendarExtender" runat="server" Enabled="True"
                                                            TargetControlID="txtExitDate" CssClass="cal_Theme1">
                                                        </asp:CalendarExtender>
                                                    </EditItemTemplate>
                                                    <ItemStyle Width="80px" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="Nights" HeaderText="Nts#" ReadOnly="True">
                                                    <ItemStyle Width="50px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ChargeNights" HeaderText="ChargeNights" Visible="False"
                                                    ReadOnly="True" />
                                                <asp:TemplateField HeaderText="RateID" Visible="False">
                                                    <EditItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("RateID") %>'></asp:Label>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRateID" runat="server" Text='<%# Bind("RateID") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="RateType" Visible="False">
                                                    <EditItemTemplate>
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("RateType") %>'></asp:Label>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblRateType" runat="server" Text='<%# Bind("RateType") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:CheckBoxField DataField="HotelRate" HeaderText="HotelRate" Visible="False" ReadOnly="True" />
                                                <asp:BoundField DataField="Pax1" HeaderText="P1" ReadOnly="True">
                                                    <ItemStyle Width="28px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Pax2" HeaderText="P2" ReadOnly="True">
                                                    <ItemStyle Width="28px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Pax3" HeaderText="P3" ReadOnly="True">
                                                    <ItemStyle Width="28px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Pax4" HeaderText="P4" ReadOnly="True">
                                                    <ItemStyle Width="28px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Pax5" HeaderText="P5" ReadOnly="True">
                                                    <ItemStyle Width="28px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Pax6" HeaderText="P6" ReadOnly="True">
                                                    <ItemStyle Width="28px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Pax7" HeaderText="P7" ReadOnly="True">
                                                    <ItemStyle Width="28px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Pax8" HeaderText="P8" ReadOnly="True">
                                                    <ItemStyle Width="28px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Pax9" HeaderText="P9" ReadOnly="True">
                                                    <ItemStyle Width="28px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Pax10" HeaderText="P10" ReadOnly="True">
                                                    <ItemStyle Width="28px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Extra" HeaderText="E" ReadOnly="True">
                                                    <ItemStyle Width="27px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Chld1" HeaderText="Ch1" ReadOnly="True">
                                                    <ItemStyle Width="27px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Chld2" HeaderText="Ch2" ReadOnly="True">
                                                    <ItemStyle Width="27px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Chld3" HeaderText="Ch3" ReadOnly="True">
                                                    <ItemStyle Width="27px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Chld4" HeaderText="Ch4" ReadOnly="True">
                                                    <ItemStyle Width="28px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="RoomsNum" HeaderText="Rms#" Visible="False" ReadOnly="True">
                                                    <ItemStyle Width="50px" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="Rate" SortExpression="RateCodeId">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkEditRate" runat="server" CommandArgument='<%# Eval("BillingId") %>'
                                                            CommandName="EditBillRate" Text='<%# Eval("RateCodeId") %>'></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:Label ID="Label132" runat="server" Text='<%# Eval("RateCodeId") %>'></asp:Label>
                                                    </EditItemTemplate>
                                                    <ItemStyle Width="60px" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="AmountAd" HeaderText="AmountAd" Visible="False" ReadOnly="True" />
                                                <asp:BoundField DataField="AmountCh" HeaderText="AmountCh" Visible="False" ReadOnly="True" />
                                                <asp:BoundField DataField="Amount" HeaderText="Amount" DataFormatString="{0:N2}"
                                                    ReadOnly="True">
                                                    <ItemStyle Width="80px" />
                                                </asp:BoundField>
                                                <asp:TemplateField ShowHeader="False">
                                                    <ItemTemplate>
                                                        <asp:ImageButton ID="ibBillEdit" runat="server" CausesValidation="False" CommandName="EditBill"
                                                            ImageUrl="~/Images/edit_inline.gif" CommandArgument='<%# Eval("BillingId") %>'
                                                            Visible="False" />
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:ImageButton ID="ibBillDelete"
                                                            runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/Images/delete_inline.gif"
                                                            OnClientClick="return confirm('Are you sure you want to delete the record')"
                                                            Visible='<%# iif(Eval("RateType") = 9, true,false) %>' CommandArgument='<%# Eval("BillingId") %>' />
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:ImageButton ID="ImageButton11" runat="server" CausesValidation="False" CommandName="Update"
                                                            ImageUrl="~/Images/accept_inline.gif" />
                                                        &nbsp;&nbsp;
                                                        <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                                            ImageUrl="~/Images/decline_inline.gif" />
                                                    </EditItemTemplate>
                                                    <ItemStyle Width="100px" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="BillingId" HeaderText="BillingId" InsertVisible="False"
                                                    ReadOnly="True" SortExpression="BillingId" Visible="False" />
                                            </Columns>
                                        </asp:GridView>
                                        <asp:FormView ID="fvNewBill" runat="server" DataSourceID="dsMix" Width="100%">
                                            <RowStyle HorizontalAlign="Right" />
                                            <InsertItemTemplate>
                                            </InsertItemTemplate>
                                            <ItemTemplate>
                                                <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                                    <tr>
                                                        <td>
                                                            &nbsp;
                                                        </td>
                                                        <td style="width: 75px; padding-left: 5px;">
                                                            <asp:Button ID="btnNewBill" runat="server" Text="New" SkinID="skBtnBase" OnClick="btnNewBill_Click" />&nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                            <EmptyDataTemplate>
                                                <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                                    <tr class="GridRow1T">
                                                        <td style="width: 930px; height: 30px;">
                                                            &nbsp;
                                                        </td>
                                                        <td style="width: 75px; padding-left: 5px;">
                                                            <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </EmptyDataTemplate>
                                        </asp:FormView>
                                        <asp:FormView ID="fvChPolicy" runat="server" DataSourceID="dsRateGetPolicy">
                                            <ItemTemplate>
                                                <table cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td class="SelectRow1T" style="width: 120px;">
                                                            Children Category
                                                        </td>
                                                        <td class="GridRow1T" style="width: 100px; text-align: center;">
                                                            <b>
                                                                <asp:Label ID="Chld1ShLabelLabel" runat="server" Text='<%# Bind("Chld1ShLabel") %>' /></b>
                                                            <asp:Label ID="Chld1FromLabel" runat="server" Text='<%# Bind("Chld1From") %>' />
                                                            -
                                                            <asp:Label ID="Chld1MaxLabel" runat="server" Text='<%# Bind("Chld1Max") %>' />
                                                        </td>
                                                        <td class="GridRow1T" style="width: 100px; text-align: center;">
                                                            <b>
                                                                <asp:Label ID="Chld2ShLabelLabel" runat="server" Text='<%# Bind("Chld2ShLabel") %>' /></b>
                                                            <asp:Label ID="Chld2FromLabel" runat="server" Text='<%# Bind("Chld2From") %>' />
                                                            -
                                                            <asp:Label ID="Chld2MaxLabel" runat="server" Text='<%# Bind("Chld2Max") %>' />
                                                        </td>
                                                        <td class="GridRow1T" style="width: 100px; text-align: center;">
                                                            <b>
                                                                <asp:Label ID="Chld3ShLabelLabel" runat="server" Text='<%# Bind("Chld3ShLabel") %>' /></b>
                                                            <asp:Label ID="Chld3FromLabel" runat="server" Text='<%# Bind("Chld3From") %>' />
                                                            -
                                                            <asp:Label ID="Chld3MaxLabel" runat="server" Text='<%# Bind("Chld3Max") %>' />
                                                        </td>
                                                        <td class="GridRow1T" style="width: 100px; text-align: center;">
                                                            <b>
                                                                <asp:Label ID="Chld4ShLabelLabel" runat="server" Text='<%# Bind("Chld4ShLabel") %>' /></b>
                                                            <asp:Label ID="Chld4FromLabel" runat="server" Text='<%# Bind("Chld4From") %>' />
                                                            -
                                                            <asp:Label ID="Chld4MaxLabel" runat="server" Text='<%# Bind("Chld4Max") %>' />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:FormView>
                                    </div>
                                </asp:Panel>
                            </div>
                        </td>
                    </tr>
                </table>
                <asp:HiddenField ID="HiddenField1" runat="server" />
                <asp:HiddenField ID="HiddenField2" runat="server" />
                <asp:HiddenField ID="HiddenField3" runat="server" />
                <asp:HiddenField ID="HiddenField4" runat="server" />
                <asp:ObjectDataSource runat="server" InsertMethod="InsertQuery" SelectMethod="GetDataByID"
                    TypeName="dsInvoicesTableAdapters.InvoiceTableAdapter" UpdateMethod="UpdateQuery"
                    ID="dsInvoice" DeleteMethod="DeleteQuery">
                    <DeleteParameters>
                        <asp:Parameter Name="InvoiceID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="InvDate" Type="DateTime" DefaultValue="" />
                        <asp:Parameter Name="InvRefText" Type="String" />
                        <asp:Parameter Name="InvPrnText" Type="String" />
                        <asp:Parameter Name="InvComment" Type="String" />
                        <asp:ControlParameter ControlID="hfUsername" Name="EditUser" PropertyName="Value"
                            Type="String" />
                        <asp:Parameter Name="EditDate" Type="DateTime" DefaultValue="" />
                        <asp:Parameter Name="InvoiceID" Type="Int32" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="InvoiceID" QueryStringField="InvoiceID" Type="Int32"
                            DefaultValue="" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="InvNumber" Type="Int32" DefaultValue=""></asp:Parameter>
                        <asp:Parameter Name="CheckOut" Type="DateTime"></asp:Parameter>
                        <asp:Parameter Name="InvDoc" Type="String" DefaultValue="PRO"></asp:Parameter>
                        <asp:Parameter DefaultValue="" Name="InvType" Type="Int32" />
                        <asp:Parameter Name="ResGroup" Type="String" />
                        <asp:Parameter Name="HotelId" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="TourOpId" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="BillingName" Type="String" />
                        <asp:Parameter Name="CheckIn" Type="DateTime"></asp:Parameter>
                        <asp:Parameter Name="InvRefText" Type="String" />
                        <asp:Parameter Name="InvPrnText" Type="String" />
                        <asp:Parameter Name="InvComment" Type="String" />
                        <asp:ControlParameter ControlID="hfUsername" Name="CreateUser" PropertyName="Value"
                            Type="String" />
                        <asp:Parameter Direction="InputOutput" Name="NewID" Type="Int32" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsStay" runat="server" DeleteMethod="InvStayDetailDelete"
                    SelectMethod="GetDataByStay" TypeName="dsInvoicesTableAdapters.InvStayDetailTableAdapter"
                    InsertMethod="InvStayDetailInsert" UpdateMethod="InvStayDetailUpdate">
                    <DeleteParameters>
                        <asp:QueryStringParameter Name="InvoiceId" QueryStringField="InvoiceID" Type="Int32" />
                        <asp:Parameter Name="DetailID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="DetailID" Type="Int32" />
                        <asp:Parameter Name="DetText" Type="String" />
                        <asp:Parameter Name="BookingDate" Type="DateTime" />
                        <asp:Parameter Name="BookingVoucher" Type="String" />
                        <asp:Parameter Name="RoomTypeId" Type="String" />
                        <asp:Parameter Name="MealPlanId" Type="String" />
                        <asp:ControlParameter ControlID="hfRoom" Name="RoomsNum" PropertyName="Value" Type="Int32" />
                        <asp:Parameter Name="AdultNum" Type="Int32" />
                        <asp:Parameter Name="Chld1Num" Type="Int32" />
                        <asp:Parameter Name="Chld2Num" Type="Int32" />
                        <asp:Parameter Name="Chld3Num" Type="Int32" />
                        <asp:Parameter Name="Chld4Num" Type="Int32" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="InvoiceId" QueryStringField="InvoiceID" Type="Int32" />
                        <asp:ControlParameter ControlID="gvMix" Name="DetailID" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="InvoiceId" Type="Int32" />
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
                        <asp:Parameter Name="PreDetId" Type="Int32" />
                        <asp:Parameter Name="FolioFull" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsMix" runat="server" SelectMethod="GetDataMix" TypeName="dsInvoicesTableAdapters.InvMixDetailTableAdapter"
                    InsertMethod="InvStayDetailInsert" UpdateMethod="InvStayDetailUpdate">
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
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="InvoiceId" QueryStringField="InvoiceID" Type="Int32" />
                        <asp:ControlParameter ControlID="cbHotel" Name="HRate" PropertyName="Checked" Type="Boolean"
                            DefaultValue="" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="InvoiceId" Type="Int32" />
                        <asp:Parameter Name="DetText" Type="String" />
                        <asp:Parameter Name="BookingDate" Type="DateTime" />
                        <asp:Parameter Name="BookingVoucher" Type="String" />
                        <asp:Parameter Name="RoomTypeId" Type="String" />
                        <asp:Parameter Name="MealPlanId" Type="String" />
                        <asp:Parameter Name="RoomsNum" Type="Int32" DefaultValue="0" />
                        <asp:Parameter Name="AdultNum" Type="Int32" DefaultValue="0" />
                        <asp:Parameter Name="Chld1Num" Type="Int32" DefaultValue="0" />
                        <asp:Parameter Name="Chld2Num" Type="Int32" DefaultValue="0" />
                        <asp:Parameter Name="Chld3Num" Type="Int32" DefaultValue="0" />
                        <asp:Parameter Name="Chld4Num" Type="Int32" DefaultValue="0" />
                        <asp:Parameter Name="PreDetId" Type="Int32" />
                        <asp:Parameter Name="FolioFull" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsBill" runat="server" DeleteMethod="InvBillDelete" SelectMethod="GetData"
                    TypeName="dsInvoicesTableAdapters.InvBillDetailTableAdapter" InsertMethod="InvBillInsert"
                    UpdateMethod="InvBillUpdateDate">
                    <DeleteParameters>
                        <asp:QueryStringParameter Name="InvoiceId" QueryStringField="InvoiceID" Type="Int32" />
                        <asp:ControlParameter ControlID="gvMix" Name="DetailId" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:Parameter Name="BillingId" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:QueryStringParameter Name="InvoiceId" QueryStringField="InvoiceID" Type="Int32" />
                        <asp:ControlParameter ControlID="gvMix" Name="DetailID" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:Parameter Name="ExitDate" Type="DateTime" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="InvoiceId" QueryStringField="InvoiceID" Type="Int32" />
                        <asp:ControlParameter ControlID="gvMix" Name="DetailId" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="cbHotel" Name="HRate" PropertyName="Checked" Type="Boolean"
                            DefaultValue="" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:QueryStringParameter Name="InvoiceId" QueryStringField="InvoiceID" Type="Int32" />
                        <asp:ControlParameter ControlID="gvMix" Name="DetailId" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="gvSuppRates" Name="RateID" PropertyName="SelectedValue"
                            Type="Int32" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsGetStayRate" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="dsInvoicesTableAdapters.RateSelectStBillTableAdapter">
                    <SelectParameters>
                        <asp:Parameter Name="BillingId" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsGetSuppRate" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="dsInvoicesTableAdapters.RateSelectSuppTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cbHotel" Name="HRate" PropertyName="Checked" Type="Boolean" />
                        <asp:ControlParameter ControlID="gvMix" Name="DetailId" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:Parameter Name="Start" Type="DateTime" />
                        <asp:Parameter Name="Finish" Type="DateTime" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataByHotelID" TypeName="dsMaintHotelTableAdapters.HotelRoomTypeTableAdapter"
                    ID="dsHtlRooms">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="hfHotel" Name="HotelId" PropertyName="Value" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataByHotelRoom" TypeName="dsMaintHotelTableAdapters.HotelRoomOccupancyTableAdapter"
                    ID="dsHtlRooms0" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_OccupancyID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="HotelId" Type="Int32" />
                        <asp:Parameter Name="RoomTypeId" Type="String" />
                        <asp:Parameter Name="Adult" Type="Int32" />
                        <asp:Parameter Name="Chld1" Type="Int32" />
                        <asp:Parameter Name="Chld2" Type="Int32" />
                        <asp:Parameter Name="Chld3" Type="Int32" />
                        <asp:Parameter Name="Chld4" Type="Int32" />
                        <asp:Parameter Name="Original_OccupancyID" Type="Int32" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="hfHotel" Name="HotelId" PropertyName="Value" Type="Int32" />
                        <asp:Parameter Name="RoomTypeId" Type="String" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="HotelId" Type="Int32" />
                        <asp:Parameter Name="RoomTypeId" Type="String" />
                        <asp:Parameter Name="Adult" Type="Int32" />
                        <asp:Parameter Name="Chld1" Type="Int32" />
                        <asp:Parameter Name="Chld2" Type="Int32" />
                        <asp:Parameter Name="Chld3" Type="Int32" />
                        <asp:Parameter Name="Chld4" Type="Int32" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource runat="server" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataByHotelID" TypeName="dsMaintHotelTableAdapters.HotelMealPlanTableAdapter"
                    UpdateMethod="Update" ID="dsHtlMP" DeleteMethod="Delete">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_HotelID" Type="Int32" />
                        <asp:Parameter Name="Original_MealPlanID" Type="String" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Original_HotelID" Type="Int32" />
                        <asp:Parameter Name="Original_MealPlanID" Type="String" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="hfHotel" Name="HotelId" PropertyName="Value" Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="HotelID" Type="Int32" />
                        <asp:Parameter Name="MealPlanID" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllActive" TypeName="dsMaintHotelTableAdapters.HotelTableAdapter"
                    UpdateMethod="Update" ID="dsAllHotels">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_HotelID" Type="Int32"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="HotelID" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="HotelHID" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Hotel" Type="String"></asp:Parameter>
                        <asp:Parameter Name="RNC" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Address" Type="String"></asp:Parameter>
                        <asp:Parameter Name="City" Type="String"></asp:Parameter>
                        <asp:Parameter Name="State" Type="String"></asp:Parameter>
                        <asp:Parameter Name="ZipCode" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Country" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Tel" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Fax" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Email" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Contact" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Bank" Type="String"></asp:Parameter>
                        <asp:Parameter Name="BankAccount" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Rooms" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="Htl_Titulo" Type="String"></asp:Parameter>
                        <asp:Parameter Name="AdultOnly" Type="Boolean"></asp:Parameter>
                        <asp:Parameter Name="Flat" Type="Boolean"></asp:Parameter>
                        <asp:Parameter Name="Active" Type="Boolean"></asp:Parameter>
                        <asp:Parameter Name="Logo" Type="Object"></asp:Parameter>
                        <asp:Parameter Name="MaxOccupancy" Type="Int16"></asp:Parameter>
                        <asp:Parameter Direction="InputOutput" Name="NewID" Type="Int32"></asp:Parameter>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="HotelHID" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Hotel" Type="String"></asp:Parameter>
                        <asp:Parameter Name="RNC" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Address" Type="String"></asp:Parameter>
                        <asp:Parameter Name="City" Type="String"></asp:Parameter>
                        <asp:Parameter Name="State" Type="String"></asp:Parameter>
                        <asp:Parameter Name="ZipCode" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Country" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Tel" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Fax" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Email" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Contact" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Bank" Type="String"></asp:Parameter>
                        <asp:Parameter Name="BankAccount" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Rooms" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="Htl_Titulo" Type="String"></asp:Parameter>
                        <asp:Parameter Name="AdultOnly" Type="Boolean"></asp:Parameter>
                        <asp:Parameter Name="Flat" Type="Boolean"></asp:Parameter>
                        <asp:Parameter Name="Active" Type="Boolean"></asp:Parameter>
                        <asp:Parameter Name="Logo" Type="Object"></asp:Parameter>
                        <asp:Parameter Name="MaxOccupancy" Type="Int16"></asp:Parameter>
                        <asp:Parameter Name="Original_HotelID" Type="Int32"></asp:Parameter>
                    </UpdateParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsTOAll" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="ContractsTableAdapters.SelectUserTourOpTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsRptInvoice" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="ReportsInvoiceTableAdapters.Invoice_PrintTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="InvoiceID" QueryStringField="InvoiceID" Type="Int32" />
                        <asp:ControlParameter ControlID="cbHotel" Name="HRate" PropertyName="Checked" Type="Boolean" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsRateGetPolicy" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="dsInvoicesTableAdapters.RateGetPolicyTableAdapter">
                    <SelectParameters>
                        <asp:Parameter Name="RateID" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsRateDesc" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="dsInvoicesTableAdapters.RateDescriptionTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="gvStayRates" Name="RateID" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsInvoiceDetail" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="ReportsInvoiceTableAdapters.InvoiceDetail_PrintTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="InvoiceID" QueryStringField="InvoiceID" Type="Int32" />
                        <asp:ControlParameter ControlID="cbHotel" Name="HRate" PropertyName="Checked" Type="Boolean" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:HiddenField ID="dummy" runat="server" />
                <%--<asp:HiddenField ID="hfRoomType" runat="server" Value='<%# Eval("DetailID") %>' />--%>
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
                                    <asp:Label ID="popMessage" runat="server" Text="Message"></asp:Label></p>
                                <p style="text-align: right;" class="GridRow1T">
                                    <br />
                                    <asp:Button ID="btnYes" runat="server" Text="OK" SkinID="skBtnBase" />&nbsp;
                                </p>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <%--    <asp:Button ID="btnShowPopup" runat="server" Style="display: none" />
        <asp:ModalPopupExtender ID="mdlPopup" runat="server"     TargetControlID="btnShowPopup"     
            PopupControlID="pnlPopup" CancelControlID="btnClose" BackgroundCssClass="modalBackground" />--%>
                <%-- TargetControlID="btnShowPopup"--%>
                <asp:Panel ID="pnlPopup" runat="server" BackColor="White" Visible="false">
                    <%--Style="display: none"--%>
                    <%-- <asp:UpdatePanel ID="updPnlRateDetail" runat="server" UpdateMode="Conditional">
                <ContentTemplate>--%>
                    <%--<div class="Blue">--%>
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="GridLabelBG">
                                <asp:Label ID="lblRateDetail" runat="server" Text="Available Rates" SkinID="skGridLabel"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="GridBorder">
                                <p style="text-align: center;">
                                    <asp:GridView ID="gvSuppRates" runat="server" AutoGenerateColumns="False" DataSourceID="dsGetSuppRate"
                                        Visible="False" DataKeyNames="RateID" SelectedIndex="0">
                                        <RowStyle CssClass="GridRow1B" />
                                        <SelectedRowStyle CssClass="SelectRow1T" />
                                        <HeaderStyle CssClass="GridRow2B" />
                                        <EmptyDataRowStyle CssClass="GridRow1B" Height="20px" />
                                        <Columns>
                                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" ShowSelectButton="True" />
                                            <asp:BoundField DataField="RateID" HeaderText="RtID" SortExpression="RateID">
                                                <ItemStyle Width="40px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RateTypeID" HeaderText="RtType" SortExpression="RateTypeID"
                                                Visible="false">
                                                <ItemStyle Width="40px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="MealPlanId" HeaderText="MP" SortExpression="MealPlanId">
                                                <ItemStyle Width="30px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RoomTypeId" HeaderText="Room" SortExpression="RoomTypeId">
                                                <ItemStyle Width="40px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RateCodeId" HeaderText="Rate" SortExpression="RateCodeId"
                                                Visible="False">
                                                <ItemStyle Width="40px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title">
                                                <ItemStyle Width="200px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="BkStart" DataFormatString="{0:d}" HeaderText="Bk.Start"
                                                HtmlEncode="False" SortExpression="BkStart" Visible="False">
                                                <ItemStyle Width="70px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="BkStart" DataFormatString="{0:d}" HeaderText="BkStart"
                                                HtmlEncode="False" SortExpression="BkStart" />
                                            <asp:BoundField DataField="BkFinish" DataFormatString="{0:d}" HeaderText="Bk.End"
                                                HtmlEncode="False" SortExpression="BkFinish">
                                                <ItemStyle Width="70px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Start" DataFormatString="{0:d}" HeaderText="Start" HtmlEncode="False"
                                                SortExpression="Start">
                                                <ItemStyle Width="70px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Finish" DataFormatString="{0:d}" HeaderText="End" HtmlEncode="False"
                                                SortExpression="Finish">
                                                <ItemStyle Width="70px" />
                                            </asp:BoundField>
                                            <asp:CheckBoxField DataField="PerPax" HeaderText="PerPax" SortExpression="PerPax" />
                                            <asp:CheckBoxField DataField="PerDay" HeaderText="PerDay" SortExpression="PerDay" />
                                            <asp:BoundField DataField="RatePax1" DataFormatString="{0:N2}" HeaderText="Adult"
                                                SortExpression="RatePax1">
                                                <ItemStyle Width="55px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RatePax2" DataFormatString="{0:N2}" HeaderText="Extra"
                                                SortExpression="RatePax2">
                                                <ItemStyle Width="55px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RatePax3" DataFormatString="{0:N2}" HeaderText="Trpl"
                                                SortExpression="RatePax3" Visible="False">
                                                <ItemStyle Width="25px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RatePax4" DataFormatString="{0:N2}" HeaderText="Qud" SortExpression="RatePax4"
                                                Visible="False">
                                                <ItemStyle Width="25px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RatePax5" DataFormatString="{0:N2}" HeaderText="Qun" SortExpression="RatePax5"
                                                Visible="False">
                                                <ItemStyle Width="25px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RatePax6" DataFormatString="{0:N2}" HeaderText="Sext"
                                                SortExpression="RatePax6" Visible="False">
                                                <ItemStyle Width="25px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RatePax7" DataFormatString="{0:N2}" HeaderText="Sept"
                                                SortExpression="RatePax7" Visible="False">
                                                <ItemStyle Width="25px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RatePax8" DataFormatString="{0:N2}" HeaderText="Oct" SortExpression="RatePax8"
                                                Visible="False">
                                                <ItemStyle Width="25px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RatePax9" DataFormatString="{0:N2}" HeaderText="Non" SortExpression="RatePax9"
                                                Visible="False">
                                                <ItemStyle Width="25px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RatePax10" DataFormatString="{0:N2}" HeaderText="Dec"
                                                SortExpression="RatePax10" Visible="False">
                                                <ItemStyle Width="25px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RateExtra" DataFormatString="{0:N2}" HeaderText="Ext"
                                                SortExpression="RateExtra" Visible="False">
                                                <ItemStyle Width="25px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RateChld1" DataFormatString="{0:N2}" HeaderText="Children"
                                                SortExpression="RateChld1">
                                                <ItemStyle Width="55px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RateChld2" DataFormatString="{0:N2}" HeaderText="Ch2"
                                                SortExpression="RateChld2" Visible="False">
                                                <ItemStyle Width="25px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RateChld3" DataFormatString="{0:N2}" HeaderText="Ch3"
                                                SortExpression="RateChld3" Visible="False">
                                                <ItemStyle Width="25px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RateChld4" DataFormatString="{0:N2}" HeaderText="Ch4"
                                                SortExpression="RateChld4" Visible="False">
                                                <ItemStyle Width="25px" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="Description" SortExpression="Description">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:TextBox ID="TextBox16" runat="server" Font-Size="X-Small" ReadOnly="True" Text='<%# Eval("Description") %>'
                                                        Width="250px"></asp:TextBox>
                                                </ItemTemplate>
                                                <ItemStyle Width="150px" Wrap="False" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <EmptyDataTemplate>
                                            - NO AVAILABLE RATES -
                                        </EmptyDataTemplate>
                                    </asp:GridView>
                                    <asp:GridView ID="gvStayRates" runat="server" AutoGenerateColumns="False" DataSourceID="dsGetStayRate"
                                        Visible="False" DataKeyNames="RateID" EnableModelValidation="True" SelectedIndex="0">
                                        <RowStyle CssClass="GridRow1B" />
                                        <SelectedRowStyle CssClass="SelectRow1T" />
                                        <HeaderStyle CssClass="GridRow2B" />
                                        <EmptyDataRowStyle CssClass="GridRow1B" Height="20px" />
                                        <Columns>
                                            <asp:TemplateField ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandArgument='<%# Eval("RateID") %>'
                                                        CommandName="Select" ImageUrl="~/Images/select_.gif" ToolTip="Select for Child Policy" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="RateID" HeaderText="RtID" SortExpression="RateID">
                                                <ItemStyle Width="40px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RateTypeID" HeaderText="RtType" SortExpression="RateTypeID"
                                                Visible="False">
                                                <ItemStyle Width="40px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="MealPlanId" HeaderText="MP" SortExpression="MealPlanId">
                                                <ItemStyle Width="30px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RoomTypeId" HeaderText="Room" SortExpression="RoomTypeId">
                                                <ItemStyle Width="40px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RateCodeId" HeaderText="Rate" SortExpression="RateCodeId">
                                                <ItemStyle Width="40px" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="BkCode" SortExpression="BookingCode">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# iif(Eval("BookingCode") is DBNull.Value,Eval("BookingCodeS"),Eval("BookingCode")) %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("BookingCode") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="BkStart" DataFormatString="{0:d}" HeaderText="Bk.Start"
                                                HtmlEncode="False" SortExpression="BkStart" Visible="False" />
                                            <asp:BoundField DataField="BkStart" DataFormatString="{0:d}" HeaderText="BkStart"
                                                HtmlEncode="False" SortExpression="BkStart" />
                                            <asp:BoundField DataField="BkFinish" DataFormatString="{0:d}" HeaderText="Bk.End"
                                                HtmlEncode="False" SortExpression="BkFinish" Visible="True">
                                                <ItemStyle Width="70px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Start" DataFormatString="{0:d}" HeaderText="Start" HtmlEncode="False"
                                                SortExpression="Start">
                                                <ItemStyle Width="70px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Finish" DataFormatString="{0:d}" HeaderText="End" HtmlEncode="False"
                                                SortExpression="Finish">
                                                <ItemStyle Width="70px" />
                                            </asp:BoundField>
                                            <asp:CheckBoxField DataField="PerPax" HeaderText="PerPax" SortExpression="PerPax" />
                                            <asp:TemplateField HeaderText="RtOpt" SortExpression="RateOption">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text="PerArr" Visible='<%# iif(Eval("RateOption") = 0, true,false) %>'></asp:Label>
                                                    <asp:Label ID="Label3" runat="server" Text="PerStay" Visible='<%# iif(Eval("RateOption") = 1, true,false) %>'></asp:Label>
                                                    <asp:Label ID="Label4" runat="server" Text="Incl" Visible='<%# iif(Eval("RateOption") = 2, true,false) %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("RateOption") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="RatePax1" DataFormatString="{0:N2}" HeaderText="Sgl" SortExpression="RatePax1">
                                                <ItemStyle Width="25px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RatePax2" DataFormatString="{0:N2}" HeaderText="Dbl" SortExpression="RatePax2">
                                                <ItemStyle Width="25px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RatePax3" DataFormatString="{0:N2}" HeaderText="Trpl"
                                                SortExpression="RatePax3">
                                                <ItemStyle Width="25px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RatePax4" DataFormatString="{0:N2}" HeaderText="Qud" SortExpression="RatePax4">
                                                <ItemStyle Width="25px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RatePax5" DataFormatString="{0:N2}" HeaderText="Qun" SortExpression="RatePax5">
                                                <ItemStyle Width="25px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RatePax6" DataFormatString="{0:N2}" HeaderText="Sext"
                                                SortExpression="RatePax6">
                                                <ItemStyle Width="25px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RatePax7" DataFormatString="{0:N2}" HeaderText="Sept"
                                                SortExpression="RatePax7">
                                                <ItemStyle Width="25px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RatePax8" DataFormatString="{0:N2}" HeaderText="Oct" SortExpression="RatePax8">
                                                <ItemStyle Width="25px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RatePax9" DataFormatString="{0:N2}" HeaderText="Non" SortExpression="RatePax9">
                                                <ItemStyle Width="25px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RatePax10" DataFormatString="{0:N2}" HeaderText="Dec"
                                                SortExpression="RatePax10">
                                                <ItemStyle Width="25px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RateExtra" DataFormatString="{0:N2}" HeaderText="Ext"
                                                SortExpression="RateExtra">
                                                <ItemStyle Width="25px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RateChld1" DataFormatString="{0:N2}" HeaderText="-" SortExpression="RateChld1">
                                                <ItemStyle Width="25px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RateChld2" DataFormatString="{0:N2}" HeaderText="-" SortExpression="RateChld2">
                                                <ItemStyle Width="25px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RateChld3" DataFormatString="{0:N2}" HeaderText="-" SortExpression="RateChld3">
                                                <ItemStyle Width="25px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RateChld4" DataFormatString="{0:N2}" HeaderText="-" SortExpression="RateChld4">
                                                <ItemStyle Width="25px" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="Description" SortExpression="DescriptionCnt">
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DescriptionCnt") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:TextBox ID="TextBox15" runat="server" CssClass="TextBox" Font-Size="X-Small"
                                                        ReadOnly="True" Text='<%# Eval("DescriptionCnt") %>' Width="250px"></asp:TextBox>
                                                </ItemTemplate>
                                                <ItemStyle Width="150px" Wrap="False" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <EmptyDataTemplate>
                                            - NO AVAILABLE RATES -
                                        </EmptyDataTemplate>
                                    </asp:GridView>
                                    <asp:FormView ID="fvStayRatesDesc" runat="server" DataSourceID="dsRateDesc" HorizontalAlign="Left"
                                        Visible="False" Width="800px">
                                        <ItemTemplate>
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td class="SelectRow1T" style="width: 159px; text-align: left;">
                                                        RateDescription
                                                    </td>
                                                    <td class="GridRow1T" style="width: 100%; text-align: left;">
                                                        <asp:Label ID="Chld1FromLabel" runat="server" Text='<%# Eval("Description") %>' />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:FormView>
                                    <div style="padding-top: 10px;">
                                        <p>
                                        </p>
                                        <asp:FormView ID="fvChildPolicyRates" runat="server" DataSourceID="dsRateGetPolicy"
                                            Visible="False" HorizontalAlign="Left">
                                            <ItemTemplate>
                                                <table cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td class="SelectRow1T" style="width: 120px;">
                                                            Children Category
                                                        </td>
                                                        <td class="GridRow1T" style="width: 100px; text-align: center;">
                                                            <b>
                                                                <asp:Label ID="Chld1ShLabelLabel" runat="server" Text='<%# Bind("Chld1ShLabel") %>' /></b>
                                                            <asp:Label ID="Chld1FromLabel" runat="server" Text='<%# Bind("Chld1From") %>' />
                                                            -
                                                            <asp:Label ID="Chld1MaxLabel" runat="server" Text='<%# Bind("Chld1Max") %>' />
                                                        </td>
                                                        <td class="GridRow1T" style="width: 100px; text-align: center;">
                                                            <b>
                                                                <asp:Label ID="Chld2ShLabelLabel" runat="server" Text='<%# Bind("Chld2ShLabel") %>' /></b>
                                                            <asp:Label ID="Chld2FromLabel" runat="server" Text='<%# Bind("Chld2From") %>' />
                                                            -
                                                            <asp:Label ID="Chld2MaxLabel" runat="server" Text='<%# Bind("Chld2Max") %>' />
                                                        </td>
                                                        <td class="GridRow1T" style="width: 100px; text-align: center;">
                                                            <b>
                                                                <asp:Label ID="Chld3ShLabelLabel" runat="server" Text='<%# Bind("Chld3ShLabel") %>' /></b>
                                                            <asp:Label ID="Chld3FromLabel" runat="server" Text='<%# Bind("Chld3From") %>' />
                                                            -
                                                            <asp:Label ID="Chld3MaxLabel" runat="server" Text='<%# Bind("Chld3Max") %>' />
                                                        </td>
                                                        <td class="GridRow1T" style="width: 100px; text-align: center;">
                                                            <b>
                                                                <asp:Label ID="Chld4ShLabelLabel" runat="server" Text='<%# Bind("Chld4ShLabel") %>' /></b>
                                                            <asp:Label ID="Chld4FromLabel" runat="server" Text='<%# Bind("Chld4From") %>' />
                                                            -
                                                            <asp:Label ID="Chld4MaxLabel" runat="server" Text='<%# Bind("Chld4Max") %>' />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:FormView>
                                    </div>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p class="GridRow2T" style="text-align: right;">
                                        <br />
                                        <asp:Button ID="btnSave" runat="server" SkinID="skBtnBase" Text="Save" Visible="False" />
                                        <asp:Button ID="btnSaveIns" runat="server" SkinID="skBtnBase" Text="Save" Visible="False" />
                                        &nbsp;
                                        <asp:Button ID="btnClose" runat="server" SkinID="skBtnBase" Text="Close" />
                                        &nbsp;
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                    <p>
                                    </p>
                                </p>
                            </td>
                        </tr>
                    </table>
                    <%--</div>--%>
                    <%-- </ContentTemplate>
            </asp:UpdatePanel>--%></asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
