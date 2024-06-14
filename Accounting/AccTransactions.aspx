<%@ Page Title="" Language="VB" MasterPageFile="~/Accounting/masterAccounting.master"
    AutoEventWireup="false" CodeFile="AccTransactions.aspx.vb" Inherits="Accounting_AccTransactions" %>

<%@ Register src="~/App_UserControls/MessagePop.ascx" tagname="MessagePop" tagprefix="uc" %>
<%@ MasterType VirtualPath="~/Accounting/masterAccounting.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Accounting Document Transactions
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AccountContent" runat="Server">
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lbDetails" runat="server" Text="Document Transactions" SkinID="skGridLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder" valign="top">
                    <asp:HiddenField ID="hfUser" runat="server" />
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td colspan="2">
                                <asp:Repeater ID="repTransactions" runat="server" DataSourceID="dsTransactions">
                                    <HeaderTemplate>
                                        <table cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td class="SelectRowClear" colspan="2" style="font-weight: bold; border-right: solid 2px white;">
                                                    Transaction
                                                </td>
                                                <td class="SelectRowClear" colspan="8" style="font-weight: bold; border-right: solid 2px white;">
                                                    Detail
                                                </td>
                                                <td class="GridRowClear">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <%--Transaction--%>
                                                <td class="GridRow2B" style="width: 80px; font-weight: bold;">Date</td>
                                                <td class="GridRow2B" style="width: 60px; font-weight: bold;">ID</td>
                                                <%--Detail--%>
                                                <td class="GridRow2B" style="width: 32px; font-weight: bold;">Ord</td>
                                                <td class="GridRow2B" style="width: 122px; font-weight: bold;">Document</td>
                                                <td class="GridRow2B" style="width: 102px; font-weight: bold;">Account</td>
                                                <td class="GridRow2B" style="width: 82px; font-weight: bold; text-align: right;">Debit</td>
                                                <td class="GridRow2B" style="width: 82px; font-weight: bold; text-align: right;">Credit</td>
                                                <td class="GridRow2B" style="width: 12px;">&nbsp;</td>
                                                <td class="GridRow2B" style="width: 302px; font-weight: bold;">Application Comment</td>
                                                <td class="GridRow2B" style="width: 42px;">&nbsp;</td>
                                                <td class="GridRow2B" style="width: 60px;">&nbsp;</td>
                                            </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td class="GridRow1B" style="width: 80px; padding-bottom: 2px; vertical-align: top; font-weight: bold;" rowspan="2" >
                                                <asp:Label ID="lblDate" runat="server" Text='<%# Bind("TransDate","{0:d}") %>' />
                                            </td>
                                            <td class="GridRow1B" style="width: 60px; padding-bottom: 2px; vertical-align: top; font-weight: bold;" rowspan="2" >
                                                <asp:Label ID="lblTranID" runat="server" Text='<%# Bind("TransID") %>' />
                                            </td>
                                            <td class="GridRow1B" style="padding-bottom: 2px;" colspan="8">
                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("TransNote") %>' />
                                            </td>
                                            <td class="GridRowClear" style="width: 60px; vertical-align: middle; text-align: center;">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="GridRow1B" style="padding-bottom: 2px;" colspan="8">
                                                <asp:GridView ID="gvTrans" runat="server" AutoGenerateColumns="False" DataSourceID="dsTranDetails"
                                                    DataKeyNames="TransID,TransOrd" GridLines="None" ShowHeader="False" 
                                                    OnRowCommand="gvTrans_RowCommand">
                                                    <Columns>
                                                        <asp:BoundField DataField="TransOrd" HeaderText="Ord" ReadOnly="True" SortExpression="TransOrd">
                                                            <ItemStyle Width="30px" />
                                                        </asp:BoundField>
                                                        <asp:TemplateField >
                                                            <ItemTemplate>
                                                                <a href='<%# "AccDocDetail.aspx?DocumentID=" & Eval("DocumentID") %>'>
                                                                <asp:Label ID="lblTrCode" runat="server" Text='<%# Bind("TrCode") %>'></asp:Label>
                                                                <asp:Label ID="lblDocNumber" runat="server" Text='<%# Bind("DocNumber") %>'></asp:Label>
                                                                </a>
                                                            </ItemTemplate>
                                                            <ItemStyle Width="120px" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="TrAccount" ReadOnly="true" >
                                                            <ItemStyle Width="100px" />
                                                        </asp:BoundField>
                                                        <asp:TemplateField >
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label1" runat="server" 
                                                                    Text='<%# iif(cbHotel.Checked,Eval("DebitHAmount", "{0:N2}"),Eval("DebitAmount", "{0:N2}")) %>' />
                                                            </ItemTemplate>
                                                            <ItemStyle Width="80px" HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField >
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label2" runat="server" 
                                                                    Text='<%# iif(cbHotel.Checked,Eval("CreditHAmount", "{0:N2}"),Eval("CreditAmount", "{0:N2}")) %>'>
                                                                </asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle Width="80px" HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <ItemTemplate>&nbsp;</ItemTemplate>
                                                            <ItemStyle Width="10px" HorizontalAlign="Right" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Application Comment" >
                                                            <ItemTemplate>
                                                                <asp:Label ID="txtNote" runat="server" Text='<%# Bind("DetailNote") %>' />
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="txtNote" runat="server" Text='<%# Bind("DetailNote") %>' CssClass="TextBox" />
                                                            </EditItemTemplate>
                                                            <ItemStyle Width="300px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField >
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDetCancel" runat="server" Visible='<%# Bind("Canceled") %>' Text="Canc."
                                                                    Font-Bold="true" ForeColor="Red" ToolTip="Transaction Detail Canceled" />
                                                                <asp:ImageButton ID="btnNoteEdit1" runat="server" CommandName="Edit"
                                                                    ImageUrl="~/Images/edit_inline.gif" Visible='<%# Not Eval("Canceled") %>' />
                                                                <asp:ImageButton ID="btnNoteClear1" runat="server" CommandName="ClearNote"
                                                                    CommandArgument='<%# Container.DataItemIndex %>'
                                                                    ImageUrl="~/Images/delete_inline.gif" Visible='<%# Not (Eval("Canceled") OR Eval("DetailNote") Is DBNull.Value) %>' />
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:ImageButton ID="btnNoteUpdate1" runat="server" CommandName="SetNote"
                                                                    CommandArgument='<%# Container.DataItemIndex %>'
                                                                    ImageUrl="~/Images/accept_inline.gif" />
                                                                <asp:ImageButton ID="btnNoteCancel1" runat="server" CommandName="Cancel"
                                                                    ImageUrl="~/Images/delete_inline.gif" />
                                                            </EditItemTemplate>
                                                            <ItemStyle Width="40px" HorizontalAlign="Left" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <RowStyle CssClass="GridRow1B" />
                                                </asp:GridView>
                                                <asp:ObjectDataSource ID="dsTranDetails" runat="server" OldValuesParameterFormatString="original_{0}"
                                                    SelectMethod="GetData" TypeName="AccDocApplicationTableAdapters.AccTransDetailTableAdapter">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="lblTranID" Name="TransID" PropertyName="Text" Type="Int32" />
                                                        <asp:ControlParameter ControlID="cbCanceled" Name="ShowCancel" PropertyName="Checked" Type="Boolean" />
                                                    </SelectParameters>
                                                </asp:ObjectDataSource>
                                            </td>
                                            <td class="Red GridRow1B" style="width: 60px; vertical-align: middle; text-align: center;">
                                                <asp:Label ID="lblDetCancel" runat="server" Visible='<%# Eval("Canceled") %>' Font-Bold="true"
                                                    ForeColor="Red" Text="Canc." ToolTip="Transaction Canceled" />
                                                <asp:LinkButton ID="lnkDetCancel" runat="server" Visible='<%# Not Eval("Canceled") %>' 
                                                    Text="Cancel" ToolTip="Cancel Transaction" OnClientClick="return confirm('Are you sure you want to cancel transaction.')"
                                                    CommandName="TrCancel" CommandArgument='<%# Bind("TransID") %>' />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </table>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </td>
                        </tr>
                        <tr>
                            <td class="GridRowClear" style="width: 200px;padding: 4px 0px 5px 0px; text-align: center;">
                                <div style="padding: 4px; border: solid 1px;" >
                                <asp:CheckBox ID="cbCanceled" runat="server" Text="Show Cancelled" TextAlign="Left" AutoPostBack="True" style="margin-left: 5px;" />
                                <asp:CheckBox ID="cbHotel" runat="server" Text="Show Htl.Amount" TextAlign="Left" AutoPostBack="True" style="margin-left: 5px;" Visible="False" />
                                <asp:Button ID="btnPrint" runat="server" SkinID="skBtnBase"  Text="Report" style="margin-left: 5px;"/>
                                </div>
                            </td>
                            <td class="GridRowClear" style="vertical-align: middle; text-align: right;">
                                <asp:Button ID="btnByBooking" runat="server" SkinID="skBtnBase" Text="Apply by Bookings" style="margin-left: 5px;" />
                                <asp:Button ID="btnApply" runat="server" SkinID="skBtnBase" Text="Apply" style="margin-left: 5px;" />
                                <asp:Button ID="btnTransfer" runat="server" SkinID="skBtnBase" Text="Transfer" style="margin-left: 5px;" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>

        <asp:Button ID="btnRefresh" runat="server" Style="display: none;"  />
        <asp:ModalPopupExtender runat="server" BackgroundCssClass="modalBackground" 
            ID="popByBookExtender" X="0" Y="160" 
            TargetControlID="btnByBooking" 
            OkControlID="byBookOK" 
            CancelControlID="byBookCancel"
            PopupControlID="popByBookDiv" >
        </asp:ModalPopupExtender>
        <div style="display: none">
            <input id="byBookOK" value="Done" type="button" />
            <input id="byBookCancel" value="Cancel" type="button" />
        </div>
        <div id="popByBookDiv" style="display: none; overflow: auto;">
            <iframe id="IframeBook" frameborder="0" style="width: 1920px; height: 5000px; overflow: visible;"
                scrolling="no" marginheight="10px" marginwidth="10px" src='<%=ByBookingSrc()%>'  >
            </iframe>
        </div>

        <asp:ModalPopupExtender runat="server" BackgroundCssClass="modalBackground" 
            ID="popByAnyExtender" X="0" Y="160" 
            TargetControlID="btnApply" 
            OkControlID="byAnyOK" 
            CancelControlID="byAnyCancel"
            PopupControlID="popByAnyDiv" >
        </asp:ModalPopupExtender>
        <div style="display: none">
            <input id="byAnyOK" value="Done" type="button" />
            <input id="byAnyCancel" value="Cancel" type="button" />
        </div>
        <div id="popByAnyDiv" style="display: none; overflow: auto;">
            <iframe id="IframeAny" frameborder="0" style="width: 1920px; height: 5000px; overflow: visible;"
                scrolling="no" marginheight="10px" marginwidth="10px" src='<%=ByAnySrc()%>'  >
            </iframe>
        </div>

        <uc:MessagePop ID="msgPop" runat="server" Title="Accounting Document Transactions" />
    </div>

    <asp:ObjectDataSource ID="dsTransactions" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="AccDocApplicationTableAdapters.AccTransactionTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
            <asp:ControlParameter ControlID="cbCanceled" DefaultValue="" Name="ShowCancel" PropertyName="Checked" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsTransactionsRpt" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="AccDocApplicationTableAdapters.RptTransferDetailTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
            <asp:ControlParameter ControlID="cbCanceled" DefaultValue="" Name="ShowCancel" PropertyName="Checked" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsDocHeader" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="dsAccountingTableAdapters.DocHeaderTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>
