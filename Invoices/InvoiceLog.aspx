<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" CodeFile="InvoiceLog.aspx.vb" Inherits="Invoices_InvoiceLog" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Invoice Change Log
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" runat="Server">
    <div id="InvDet" class="Blue">
        <table cellpadding="0" cellspacing="0" style="width: 100%;">
            <tr>
                <td class="LocalMenuRow" style="width: 130px;">
                    <asp:HyperLink ID="linkBack" runat="server" SkinID="skHypLink" NavigateUrl="~/Invoices/Invoices.aspx"
                        Text="&lt;&lt; Back to Invoices" />
                </td>
                <td class="LocalMenuRow">
                    <asp:Menu ID="LocalMenu" runat="server" SkinID="skLocalMenu">
                        <Items>
                            <asp:MenuItem Text="Invoice Details New" Value="Invoice Details New" NavigateUrl="~/Invoices/InvoiceForm.aspx" />
                            <asp:MenuItem Text="Invoice Details Old" Value="Invoice Details Old" NavigateUrl="~/Invoices/InvoiceCreate.aspx" />
                            <asp:MenuItem Text="Change Log" Value="Invoice Change Log" NavigateUrl="~/Invoices/InvoiceLog.aspx" Enabled="False" />
                        </Items>
                    </asp:Menu>
                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="UpdatePanelMain" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table style="width: 100%;">
                    <tr>
                        <td>
                            <asp:FormView ID="fvInvoice" runat="server" DataSourceID="dsInvoice" Width="100%"
                                DataKeyNames="InvoiceID">
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
                                                    <%--<asp:Label ID="Label1" runat="server" Text='<%# Eval("Hotel") %>'></asp:Label>--%>
                                                    <asp:DropDownList ID="ddlHotels" runat="server" AutoPostBack="True" BackColor="White"
                                                        CssClass="TextBox" DataSourceID="dsAllHotels" DataTextField="Hotel" DataValueField="HotelID"
                                                        Enabled="False" SelectedValue='<%# Eval("HotelId") %>' />
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
                                                                        Text="Recalculate" Width="100px" Visible='<%# (iif(Eval("State")>3,True,False) And ModificationRights.RightsOperatorAdmin) Or (iif(Eval("State")<4 AND Eval("State")>0,True,False) And ModificationRights.RightsHotel) %>'
                                                                        Enabled= "False" />

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
                                                                    <asp:CheckBox ID="cbRVHtl" runat="server" Text="Htl Reviewed" AutoPostBack="True" 
                                                                        Checked='<%# iif(Eval("State")=2, True, False) %>' 
                                                                        Visible='<%# ModificationRights.RightsHotel And iif(Eval("State")<4,True,False) %>' 
                                                                        Enabled= "False" />
                                                                    <br />
                                                                    <asp:HyperLink ID="hlSend" runat="server" NavigateUrl="~/Invoices/InvoiceSend.aspx"
                                                                        Visible='<%# ModificationRights.RightsHotel And iif(Eval("State")=2,True,False) %>' Enabled= "False" >
                                                                        Sending List &gt;&gt;
                                                                    </asp:HyperLink>
                                                                    <br />
                                                                    <asp:CheckBox ID="cbRVCCI" runat="server" Text="CCI Reviewed" AutoPostBack="True" 
                                                                        Checked='<%# Eval("CCIReview") %>' Enabled= "False" />
                                                                    <br />
                                                                    <asp:CheckBox ID="cbExcel" runat="server" Style="padding-right: 5px; width: 370px"
                                                                        Text="Excel" TextAlign="Left" Enabled= "False" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 120px; height: 30px; text-align: center; vertical-align: middle">
                                                                    <asp:Button ID="btnPrint" runat="server" CommandName="Print" SkinID="skBtnBase" Text="Print Invoice"
                                                                        Width="100px" Enabled= "False" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 120px; height: 30px; text-align: center; vertical-align: middle">
                                                                    <asp:Button ID="btnCancel" runat="server" CommandName="CancelInv" SkinID="skBtnBase"
                                                                        Text='<%# iif(Eval("State") = -3 OR Eval("State") = -7,"Uncancel","Cancel") %>'
                                                                        Width="100px" Enabled= "False" />
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
                                                                    Visible="<%# Not ModificationRights.RightsHotel %>" />
                                                                <asp:Label ID="lblHAmount0" runat="server" Text='<%# Eval("HAmount", "{0:N2}") %>'
                                                                    Visible="<%# ModificationRights.RightsHotel %>" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="GridRowClear" colspan="5">
                                                                <asp:FormView ID="FormView1" runat="server" DataSourceID="dsInvBalance" DataKeyNames="AppAmount"
                                                                    Visible="<%# Not ModificationRights.RightsHotel %>" Width="100%">
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
                                                    <asp:Label ID="Label15" runat="server" Text='<%# Eval("DeliveryDate", "{0:d}") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="GridRow2T" style="margin-top: 2px; padding-top: 5px; text-align: right;"
                                                    colspan="2">
                                                    <asp:Button ID="btnupdate" runat="server" CommandName="Edit" SkinID="skBtnBase" Text="Edit"
                                                        Visible='<%# (iif(Eval("State") >3 And Eval("State") <> -7,True,False) And ModificationRights.RightsOperatorAdmin) Or (iif(Eval("State") < 3,True,False) And ModificationRights.RightsHotel) %>' 
                                                        Enabled= "False" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </ItemTemplate>
                            </asp:FormView>
                        </td>
                    </tr>
                </table>
                <br />
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="GridLabelBG" >
                            <asp:Label ID="lblLogLevel" runat="server" CssClass="GridLabel" Height="26px" Text="Log" />
                            <asp:DropDownList ID="ddlLevel" runat="server" Width="20px"  AutoPostBack="True"
                                style="vertical-align: top; border: none; background-color: transparent; text-align: right;" >
                                <asp:ListItem Value="0">Changes</asp:ListItem>
                                <asp:ListItem Value="1">Actions</asp:ListItem>
                                <asp:ListItem Value="2">Full</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder" style="vertical-align: top;">
                            <asp:GridView ID="gvLog" runat="server" AllowSorting="True" 
                                AutoGenerateColumns="False" DataSourceID="dsLog" EnableModelValidation="True" 
                                SkinID="skGridView">
                                <Columns>
                                    <asp:BoundField DataField="LogDate" HeaderText="Date" 
                                        SortExpression="LogDate">
                                    <ItemStyle Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="LogSource" HeaderText="LogSource" Visible="False" />
                                    <asp:BoundField DataField="UserName" HeaderText="User">
                                    <ItemStyle Width="100px" Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ObjType" HeaderText="ObjType" Visible="False" />
                                    <asp:BoundField DataField="ObjEvent" HeaderText="Event">
                                    <ItemStyle Width="60px" Wrap="False" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ObjEventState" HeaderText="Event State">
                                    <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ObjId" HeaderText="ObjId" 
                                        Visible="False" />
                                    <asp:BoundField DataField="LogMess" HeaderText="Log Message">
                                    <ItemStyle Width="500px" Wrap="False" />
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                        </td>
                        
                    </tr>
                </table>
                <asp:ObjectDataSource runat="server" 
                    ID="dsInvoice" 
                    TypeName="dsInvoicesTableAdapters.InvoiceTableAdapter" 
                    SelectMethod="GetDataByID">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="InvoiceID" QueryStringField="InvoiceID" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource runat="server" OldValuesParameterFormatString="original_{0}" 
                    ID="dsAllHotels"
                    TypeName="dsMaintHotelTableAdapters.HotelTableAdapter"
                    SelectMethod="GetAllActive" >
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsLog" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="LogAppTableAdapters.Invoice_LogTableAdapter">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="InvoiceID" QueryStringField="InvoiceID" 
                            Type="Int32" />
                        <asp:ControlParameter ControlID="ddlLevel" DefaultValue="0" Name="LogLevel" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

