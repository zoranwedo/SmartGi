<%@ Page Title="" Language="VB" MasterPageFile="~/Accounting/masterAccounting.master"
    AutoEventWireup="false" CodeFile="AccTransfer.aspx.vb" Inherits="Accounting_AccTransfer" %>

<%@ MasterType VirtualPath="~/Accounting/masterAccounting.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Document Transfer
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AccountContent" runat="Server">
<div class="Blue"><asp:Panel ID="pnlTransPre" runat="server">
        <table cellpadding="0" cellspacing="2">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lbDetails" runat="server" Text="Transfer details" SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <table cellpadding="0" cellspacing="2">
                        <tr>
                            <td style="width: 400px;" class="GridRow2B">
                                <asp:HiddenField ID="hfTranID" runat="server" />
                                <asp:HiddenField ID="hfUser" runat="server" />
                                <asp:DropDownList ID="ddlTransfer" runat="server" CssClass="TextBox" AutoPostBack="True"
                                    DataSourceID="dsGetAccTransfer" DataTextField="Transfer" DataValueField="TransferID"
                                    AppendDataBoundItems="True">
                                    <asp:ListItem Value="0">select...</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:FormView ID="fvTransfer" runat="server" DataKeyNames="Amount" DataSourceID="dsAccTransferStatus"
                                    DefaultMode="Edit">
                                    <EditItemTemplate>
                                        <table cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td style="width: 100px" class="SelectRow1B">
                                                    Date
                                                </td>
                                                <td style="width: 300px" class="GridRow1B" colspan="2">
                                                    <asp:TextBox ID="txtDate" runat="server" CssClass="TextBox" />
                                                    <asp:CalendarExtender ID="txtDate_CalendarExtender" runat="server" CssClass="cal_Theme1"
                                                        Enabled="True" TargetControlID="txtDate" />
                                                    <asp:CompareValidator ID="txtDate_CompareValidator" runat="server" ControlToValidate="txtDate"
                                                        Operator="DataTypeCheck" Type="Date" SkinID="skDate" />
                                                    <asp:ValidatorCalloutExtender ID="txtDate_DateValidatorCalloutExtender" runat="server"
                                                        TargetControlID="txtDate_CompareValidator" SkinID="skExtender" />
                                                    <asp:RequiredFieldValidator ID="txtDate_RequiredFieldValidator" runat="server" ControlToValidate="txtDate"
                                                        Display="None" ErrorMessage="Required Field" />
                                                    <asp:ValidatorCalloutExtender ID="txtDate_ReqDateValidatorCalloutExtender" runat="server"
                                                        Enabled="True" TargetControlID="txtDate_RequiredFieldValidator" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="SelectRow1B">
                                                    Amount
                                                </td>
                                                <td class="GridRow1B" style="width: 150px;">
                                                    <asp:TextBox ID="txtAmount" runat="server" CssClass="TextBox" Text='<%# Bind("Amount","{0:F2}") %>' />
                                                    <asp:CompareValidator ID="txtAmount_CompareValidator" runat="server" ControlToValidate="txtAmount"
                                                        Operator="DataTypeCheck" Type="Double" SkinID="skInteger" />
                                                    <asp:ValidatorCalloutExtender ID="txtAmount_DecValidatorCalloutExtender" runat="server"
                                                        TargetControlID="txtAmount_CompareValidator" SkinID="skExtender" />
                                                    <asp:RequiredFieldValidator ID="txtAmount_RequiredFieldValidator" runat="server"
                                                        ControlToValidate="txtAmount" Display="None" ErrorMessage="Required Field" />
                                                    <asp:ValidatorCalloutExtender ID="txtAmount_ReqValidatorCalloutExtender" runat="server"
                                                        Enabled="True" TargetControlID="txtAmount_RequiredFieldValidator" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="SelectRow1B">
                                                    Dest.Hotel
                                                </td>
                                                <td class="GridRow1B" colspan="2">
                                                    <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" DataSourceID="dsAccHotel"
                                                        DataTextField="Hotel" DataValueField="HotelID" Enabled='<%# Bind("ChangeHotel") %>'
                                                        SelectedValue='<%# Bind("HotelId") %>' BackColor="White">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="SelectRow1B">
                                                    Dest.TourOp.
                                                </td>
                                                <td class="GridRow1B" colspan="2">
                                                    <asp:DropDownList ID="ddlTourOp" runat="server" CssClass="TextBox" DataSourceID="dsAccTourOp"
                                                        DataTextField="TourOp" DataValueField="TourOpID" Enabled='<%# Bind("ChangeTO") %>'
                                                        SelectedValue='<%# Bind("TourOpId") %>' BackColor="White">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="SelectRow1B">
                                                    Liability Concept
                                                </td>
                                                <td class="GridRow1B" colspan="2">
                                                    <asp:DropDownList ID="ddlLiability" runat="server" CssClass="TextBox" DataSourceID="dsLiability"
                                                        DataTextField="AccLiabilityConceptName" DataValueField="AccLiabilityConceptID" BackColor="White">
                                                    </asp:DropDownList>
                                                    <asp:ObjectDataSource ID="dsLiability" runat="server" 
                                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetActive" 
                                                        TypeName="AccUnitsTableAdapters.AccLiabilityConceptTableAdapter">
                                                        <SelectParameters>
                                                            <asp:Parameter DefaultValue="True" Name="ActiveOnly" Type="Boolean" />
                                                        </SelectParameters>
                                                    </asp:ObjectDataSource>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="SelectRow1B">
                                                    Transfer Type
                                                </td>
                                                <td class="GridRow1B" colspan="2">
                                                    <asp:DropDownList ID="ddlTransfer" runat="server" CssClass="TextBox" DataSourceID="dsTransferType"
                                                        DataTextField="AccTransferTypeName" DataValueField="AccTransferTypeID" BackColor="White" >
                                                    </asp:DropDownList>
                                                    <asp:ObjectDataSource ID="dsTransferType" runat="server" 
                                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetActive" 
                                                        TypeName="AccUnitsTableAdapters.AccTransferTypeTableAdapter">
                                                        <SelectParameters>
                                                            <asp:Parameter DefaultValue="True" Name="ActiveOnly" Type="Boolean" />
                                                        </SelectParameters>
                                                    </asp:ObjectDataSource>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="SelectRow1B">Invoice #</td>
                                                <td class="GridRow1B" colspan="2">
                                                    <asp:TextBox ID="AdditionalInvoice" runat="server" CssClass="TextBox" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="SelectRow1B">First Name</td>
                                                <td class="GridRow1B" colspan="2">
                                                    <asp:TextBox ID="AdditionalName" runat="server" CssClass="TextBox" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="SelectRow1B">Last Name</td>
                                                <td class="GridRow1B" colspan="2">
                                                    <asp:TextBox ID="AdditionalLastName" runat="server" CssClass="TextBox" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="SelectRow1B">Booking #</td>
                                                <td class="GridRow1B" colspan="2">
                                                    <asp:TextBox ID="AdditionalBooking" runat="server" CssClass="TextBox" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="SelectRow1B">Check In</td>
                                                <td class="GridRow1B" colspan="2">
                                                    <asp:TextBox ID="AdditionalCheckIn" runat="server" CssClass="TextBox" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="SelectRowClear">Check Out</td>
                                                <td class="GridRowClear" colspan="2">
                                                    <asp:TextBox ID="AdditionalCheckOut" runat="server" CssClass="TextBox" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="SelectRowClear">Note</td>
                                                <td class="GridRowClear" colspan="2">
                                                    <asp:TextBox ID="txtNote" runat="server" CssClass="TextBox" TextMode="MultiLine" MaxLength="2000" />
                                                </td>
                                            </tr>
                                        </table>
                                    </EditItemTemplate>
                                    <EmptyDataTemplate>
                                        <div class="GridRowClear" style="width: 400px;">
                                            No transaction defined for selected document.
                                        </div>
                                    </EmptyDataTemplate>
                                </asp:FormView>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="gvTransferDocs" runat="server" AutoGenerateColumns="False" DataSourceID="dsAccTransferDoc"
                                    SkinID="skGridView">
                                    <Columns>
                                        <asp:BoundField DataField="TrDocument" HeaderText="Document">
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="TrAccount" HeaderText="Account">
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="TrAccType" HeaderText="Acc.Type">
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="TrAmount" DataFormatString="{0:N2}" HeaderText="Amount">
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="TrHAmount" DataFormatString="{0:N2}" HeaderText="Htl.Amount">
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td class="GridRow1T" style="text-align: right; padding-top: 5px; margin-top: 2px;">
                                <asp:Button ID="btnConfirm" runat="server" SkinID="skBtnBase" Text="Confirm Transfer"
                                    CommandName="Update" Visible="False" />&nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="pnlTransPost" runat="server">
        <table cellpadding="0" cellspacing="2">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="Label1" runat="server" Text="Transfer details" SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:DetailsView ID="dvMaster" runat="server" AutoGenerateRows="False" DataKeyNames="TransID"
                        DataSourceID="dsTrMaster" Height="50px" SkinID="skDetailView" Width="410px">
                        <FieldHeaderStyle Width="100px" />
                        <Fields>
                            <asp:BoundField DataField="TransID" HeaderText="TransID" ReadOnly="True" SortExpression="TransID" />
                            <asp:BoundField DataField="TransDate" HeaderText="TransDate" SortExpression="TransDate" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                            <asp:BoundField DataField="TransNote" HeaderText="TransNote" SortExpression="TransNote" />
                            <asp:TemplateField HeaderText="Transfer">
                                <ItemTemplate>
                                    &nbsp;from:&nbsp;
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("AccountType") %>' />
                                    &nbsp;to&nbsp;
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("DebitType") %>' Visible='<%# Eval("TrSign")="D" %>' />
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("CreditType") %>' Visible='<%# Eval("TrSign")="C" %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Change">
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("ChangeHotel") %>' Enabled="false" Text="Change Hotel" TextAlign="Left" />
                                    <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("ChangeTO") %>' Enabled="false" Text="Change TO" TextAlign="Left" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Fields>
                    </asp:DetailsView>
                    <br />
                    <asp:Label ID="Label5" runat="server" Text="Transacton" Width="100%" CssClass="SelectRowClear" />
                    <asp:ObjectDataSource ID="dsTrMaster" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="dsAccountingTableAdapters.AccDocTransferHeadTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfTranID" Name="TransID" PropertyName="Value" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:GridView ID="gvDetails" runat="server" AutoGenerateColumns="False" DataSourceID="dsTrDetails" SkinID="skGridView">
                        <Columns>
                            <asp:BoundField DataField="TransOrd" HeaderText="Ord" SortExpression="TransOrd">
                                <ItemStyle Width="50px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DocumentID" HeaderText="DocumentID" SortExpression="DocumentID"
                                Visible="False" />
                            <asp:TemplateField HeaderText="Document" SortExpression="DocCode">
                                <ItemTemplate>
                                    <a href='<%# "AccDocDetailNew.aspx?DocumentID=" & Eval("DocumentID") %>'>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("DocCode") %>' />&nbsp;
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("DocNumber") %>' />
                                    </a>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="DocAccount" HeaderText="Account" SortExpression="DocAccount">
                                <ItemStyle Width="100px" />
                                <ItemStyle HorizontalAlign="Center" Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DebitAmount" HeaderText="Debit" SortExpression="DebitAmount"
                                DataFormatString="{0:N2}">
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DebitHAmount" HeaderText="DebitHAmount" SortExpression="DebitHAmount"
                                DataFormatString="{0:N2}" Visible="False">
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CreditAmount" HeaderText="Credit" SortExpression="CreditAmount"
                                DataFormatString="{0:N2}">
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CreditHAmount" HeaderText="CreditHAmount" SortExpression="CreditHAmount"
                                Visible="False" DataFormatString="{0:N2}">
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="dsTrDetails" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="dsAccountingTableAdapters.AccDocTransferDetailTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfTranID" Name="TransID" PropertyName="Value" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <br />
                    <asp:Label ID="Label7" runat="server" Text="Documents" CssClass="SelectRowClear"
                        Width="100%"></asp:Label>
                    <asp:GridView ID="gvBalances" runat="server" AutoGenerateColumns="False" DataKeyNames="TransID,DocumentID"
                        DataSourceID="dsTrBalances" SkinID="skGridView">
                        <Columns>
                            <asp:BoundField DataField="DocumentID" HeaderText="DocumentID" ReadOnly="True" SortExpression="DocumentID"
                                Visible="False" />
                            <asp:TemplateField HeaderText="Document" SortExpression="DocCode">
                                <ItemTemplate>
                                    <a href='<%# "AccDocDetailNew.aspx?DocumentID=" & Eval("DocumentID") %>'>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("DocCode") %>' />&nbsp;
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("DocNumber") %>' />
                                    </a>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="DocDate" HeaderText="Date" SortExpression="DocDate" DataFormatString="{0:d}">
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DocAmount" DataFormatString="{0:N2}" HeaderText="Total"
                                SortExpression="DocAmount">
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DocHAmount" DataFormatString="{0:N2}" HeaderText="DocHAmount"
                                SortExpression="DocHAmount" Visible="False">
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Balance" HeaderText="Balance" SortExpression="Balance"
                                ReadOnly="True" DataFormatString="{0:N2}">
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="HBalance" HeaderText="HBalance" SortExpression="HBalance"
                                ReadOnly="True" Visible="False" DataFormatString="{0:N2}">
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Hotel") %>' Visible='<%# Bind("ChangeHotel") %>'></asp:Label>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("TourOp") %>' Visible='<%# Bind("ChangeTO") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="dsTrBalances" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="dsAccountingTableAdapters.AccDocTransferBalanceTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfTranID" Name="TransID" PropertyName="Value" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
            <tr>
                <td class="GridRow1T" style="text-align: right; padding-top: 5px; margin-top: 2px;">
                    <asp:Button ID="Button1" runat="server" SkinID="skBtnBase" Text="Print" CommandName="Update"
                        Width="100px" />&nbsp;
                    <asp:Button ID="Button3" runat="server" CommandName="Update"
                        SkinID="skBtnBase" Text="Back To Document" />
                    &nbsp;
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:ObjectDataSource ID="dsGetAccTransfer" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="dsAccountingTableAdapters.GetAccTransferTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
            <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsAccTransferStatus" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataEffective" TypeName="dsAccountingEffectiveTableAdapters.AccTransStatusTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlTransfer" Name="TransferID" PropertyName="SelectedValue" Type="Int32" />
            <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsAccHotel" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="dsAccountingTableAdapters.SelectUserHotelTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="hfUser" Name="UserName" PropertyName="Value" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsAccTourOp" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="dsAccountingTableAdapters.SelectUserTourOpTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="hfUser" Name="UserName" PropertyName="Value" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsAccTransferDoc" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="dsAccountingTableAdapters.SelectAccTransferDocTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="hfTranID" DefaultValue="0" Name="TranID" PropertyName="Value" Type="Int32" />
            <asp:ControlParameter ControlID="ddlTransfer" DefaultValue="" Name="TransferID" PropertyName="SelectedValue" Type="Int32" />
            <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
            <asp:ControlParameter ControlID="fvTransfer" Name="Amount" PropertyName="SelectedValue" Type="Decimal" DefaultValue="" />
            <asp:ControlParameter ControlID="hfUser" Name="UserName" PropertyName="Value" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:HiddenField ID="dummy" runat="server" />
    <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
        CancelControlID="btnNo" DropShadow="True" Enabled="True"
        BackgroundCssClass="modalBackground" X="200" Y="200" TargetControlID="dummy">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popPanel" runat="server" Width="300px" BackColor="White" Style="display: none">
        <table cellpadding="0" cellspacing="0" style="width: 100%;">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="popLabel" runat="server" Text="Delete data" SkinID="skGridLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <p style="text-align: center;">
                        <asp:Label ID="popMessage" runat="server" Text="Message"></asp:Label>
                    </p>
                    <p style="text-align: right;" class="GridRow1T">
                        <br />
                        <%--<asp:Button ID="btnYes" runat="server" Text="Yes" SkinID="skBtnBase" Visible="false" />&nbsp;--%>
                        <asp:Button ID="btnNo" runat="server" Text="No" SkinID="skBtnBase" />&nbsp;
                    </p>
                </td>
            </tr>
        </table>
    </asp:Panel>
</div>
</asp:Content>
