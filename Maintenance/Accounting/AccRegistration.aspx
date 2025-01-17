<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Accounting/masterAccount.master"
    AutoEventWireup="false" CodeFile="AccRegistration.aspx.vb" Inherits="Maintenance_Accounting_AccRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Accounting Registration Documents
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AccountContent" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="dummy" runat="server" />
            <div class="Blue">
                <br />
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="GridLabelBG">
                            <asp:Label ID="lblMarket" runat="server" Text="Accounting Registration Document"
                                SkinID="skGridLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder">
                            <table cellpadding="0" cellspacing="0" style="border-bottom-style: solid; border-bottom-color: White;
                                border-bottom-width: 2px;">
                                <tr>
                                    <td colspan="2" class="TransferB" style="text-align: center; font-weight: bold;">
                                        Debit
                                    </td>
                                    <td colspan="2" class="TransferB" style="text-align: center; font-weight: bold;">
                                        Credit
                                    </td>
                                    <td colspan="4" class="TransferB" style="text-align: center; font-weight: bold;">
                                        Document
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 83px; font-weight: bold;" class="GridRow1B">
                                        Code
                                    </td>
                                    <td style="width: 82px; font-weight: bold; border-right: solid 1px;" class="GridRow1B">
                                        Account
                                    </td>
                                    <td style="width: 83px; font-weight: bold;" class="GridRow1B">
                                        Code
                                    </td>
                                    <td style="width: 82px; font-weight: bold; border-right: solid 1px;" class="GridRow1B">
                                        Account
                                    </td>
                                    <td style="width: 104px; font-weight: bold;" class="GridRow1B">
                                        AccType
                                    </td>
                                    <td style="width: 42px; font-weight: bold;" class="GridRow1B">
                                        Sign
                                    </td>
                                    <td style="width: 102px; font-weight: bold;" class="GridRow1B">
                                        Ext.Document
                                    </td>
                                    <td style="width: 52px; font-weight: bold;" class="GridRow1B">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            <asp:GridView ID="gridAccClass" runat="server" SkinID="skGridView" AllowSorting="True" ShowHeader="false"
                                AutoGenerateColumns="False" DataKeyNames="TrDocID" DataSourceID="dsAccRegDocument">
                                <Columns>
                                    <asp:TemplateField HeaderText="DebitCode" SortExpression="DebitCode">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("DebitCode") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtDebitCode" runat="server" CssClass="TextBox" Enabled='<%# iif(Eval("TrSign") = "C",True,False) %>'
                                                Text='<%# Bind("DebitCode") %>' OnTextChanged="txtDebitCode_TextChanged"></asp:TextBox>
                                            <asp:PopupControlExtender ID="txtAccTypeID_PopupControlExtender" runat="server" CommitProperty="Text"
                                                PopupControlID="gvAccType" Position="Bottom" TargetControlID="txtDebitCode">
                                            </asp:PopupControlExtender>
                                            <asp:GridView ID="gvAccType" runat="server" AutoGenerateColumns="False" BackColor="White"
                                                CssClass="GridBorder" DataKeyNames="TrCode,TrAccount,TrDocID" DataSourceID="dsDebitDoc"
                                                GridLines="None" OnSelectedIndexChanged="gvAccType_SelectedIndexChanged" ShowHeader="False"
                                                Width="250px">
                                                <RowStyle CssClass="GridRowClear" HorizontalAlign="Left" />
                                                <SelectedRowStyle CssClass="SelectRowClear" />
                                                <Columns>
                                                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" ShowCancelButton="False"
                                                        ShowSelectButton="True">
                                                        <ItemStyle Width="20px" />
                                                    </asp:CommandField>
                                                    <asp:BoundField DataField="TrCode" HeaderText="TrCode" SortExpression="TrCode" />
                                                    <asp:BoundField DataField="TrAccount" HeaderText="TrAccount" SortExpression="TrAccount" />
                                                    <asp:BoundField DataField="TrDescription" HeaderText="TrDescription" SortExpression="TrDescription" >
                                                        <ItemStyle Wrap="false" />
                                                    </asp:BoundField>
                                                </Columns>
                                            </asp:GridView>
                                            <asp:ObjectDataSource ID="dsDebitDoc" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataForDebit"
                                                TypeName="dsAccountTableAdapters.AccDocumentViewTableAdapter" UpdateMethod="Update">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="Original_TrDocID" Type="Int32" />
                                                </DeleteParameters>
                                                <UpdateParameters>
                                                    <asp:Parameter Name="TrDocClass" Type="String" />
                                                    <asp:Parameter Name="TrTypeClass" Type="String" />
                                                    <asp:Parameter Name="TrClass" Type="String" />
                                                    <asp:Parameter Name="TrCode" Type="String" />
                                                    <asp:Parameter Name="AccountType" Type="String" />
                                                    <asp:Parameter Name="AccountTypeID" Type="String" />
                                                    <asp:Parameter Name="TranType" Type="String" />
                                                    <asp:Parameter Name="TranTypeID" Type="String" />
                                                    <asp:Parameter Name="DocType" Type="String" />
                                                    <asp:Parameter Name="DocTypeID" Type="String" />
                                                    <asp:Parameter Name="TrOrd" Type="String" />
                                                    <asp:Parameter Name="TrSign" Type="String" />
                                                    <asp:Parameter Name="TrAccount" Type="String" />
                                                    <asp:Parameter Name="TrDescription" Type="String" />
                                                    <asp:Parameter Name="Original_TrDocID" Type="Int32" />
                                                </UpdateParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="TrDocClass" Type="String" />
                                                    <asp:Parameter Name="TrTypeClass" Type="String" />
                                                    <asp:Parameter Name="TrClass" Type="String" />
                                                    <asp:Parameter Name="TrCode" Type="String" />
                                                    <asp:Parameter Name="AccountType" Type="String" />
                                                    <asp:Parameter Name="AccountTypeID" Type="String" />
                                                    <asp:Parameter Name="TranType" Type="String" />
                                                    <asp:Parameter Name="TranTypeID" Type="String" />
                                                    <asp:Parameter Name="DocType" Type="String" />
                                                    <asp:Parameter Name="DocTypeID" Type="String" />
                                                    <asp:Parameter Name="TrOrd" Type="String" />
                                                    <asp:Parameter Name="TrSign" Type="String" />
                                                    <asp:Parameter Name="TrAccount" Type="String" />
                                                    <asp:Parameter Name="TrDescription" Type="String" />
                                                </InsertParameters>
                                            </asp:ObjectDataSource>
                                        </EditItemTemplate>
                                        <ItemStyle Width="80px" CssClass="debitBck" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="DebitAccount" SortExpression="DebitAccount">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("DebitAccount") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtDebitAccount" runat="server" CssClass="TextBox" Enabled='False'
                                                Text='<%# Bind("DebitAccount") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemStyle Width="80px" CssClass="debitBck" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="CreditCode" SortExpression="CreditCode">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("CreditCode") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtCreditCode" runat="server" CssClass="TextBox" Enabled='<%# iif(Eval("TrSign") = "D",True,False) %>'
                                                Text='<%# Bind("CreditCode") %>' OnTextChanged="txtCreditCode_TextChanged"></asp:TextBox>
                                            <asp:PopupControlExtender ID="txtCreditCode_PopupControlExtender" runat="server"
                                                CommitProperty="Text" PopupControlID="gvCreditCode" Position="Bottom" TargetControlID="txtCreditCode">
                                            </asp:PopupControlExtender>
                                            <asp:GridView ID="gvCreditCode" runat="server" AutoGenerateColumns="False" BackColor="White"
                                                CssClass="GridBorder" DataKeyNames="TrCode,TrAccount,TrDocID" DataSourceID="dsCreditDoc"
                                                GridLines="None" ShowHeader="False" Width="250px" OnSelectedIndexChanged="gvCreditCode_SelectedIndexChanged">
                                                <RowStyle CssClass="GridRowClear" HorizontalAlign="Left" />
                                                <SelectedRowStyle CssClass="SelectRowClear" />
                                                <Columns>
                                                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" ShowCancelButton="False"
                                                        ShowSelectButton="True">
                                                        <ItemStyle Width="20px" />
                                                    </asp:CommandField>
                                                    <asp:BoundField DataField="TrCode" HeaderText="TrCode" SortExpression="TrCode" />
                                                    <asp:BoundField DataField="TrAccount" HeaderText="TrAccount" SortExpression="TrAccount" />
                                                    <asp:BoundField DataField="TrDescription" HeaderText="TrDescription" SortExpression="TrDescription" >
                                                        <ItemStyle Wrap="false" />
                                                    </asp:BoundField>
                                                </Columns>
                                            </asp:GridView>
                                            <asp:ObjectDataSource ID="dsCreditDoc" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataForCredit"
                                                TypeName="dsAccountTableAdapters.AccDocumentViewTableAdapter" UpdateMethod="Update">
                                                <DeleteParameters>
                                                    <asp:Parameter Name="Original_TrDocID" Type="Int32" />
                                                </DeleteParameters>
                                                <UpdateParameters>
                                                    <asp:Parameter Name="TrDocClass" Type="String" />
                                                    <asp:Parameter Name="TrTypeClass" Type="String" />
                                                    <asp:Parameter Name="TrClass" Type="String" />
                                                    <asp:Parameter Name="TrCode" Type="String" />
                                                    <asp:Parameter Name="AccountType" Type="String" />
                                                    <asp:Parameter Name="AccountTypeID" Type="String" />
                                                    <asp:Parameter Name="TranType" Type="String" />
                                                    <asp:Parameter Name="TranTypeID" Type="String" />
                                                    <asp:Parameter Name="DocType" Type="String" />
                                                    <asp:Parameter Name="DocTypeID" Type="String" />
                                                    <asp:Parameter Name="TrOrd" Type="String" />
                                                    <asp:Parameter Name="TrSign" Type="String" />
                                                    <asp:Parameter Name="TrAccount" Type="String" />
                                                    <asp:Parameter Name="TrDescription" Type="String" />
                                                    <asp:Parameter Name="Original_TrDocID" Type="Int32" />
                                                </UpdateParameters>
                                                <InsertParameters>
                                                    <asp:Parameter Name="TrDocClass" Type="String" />
                                                    <asp:Parameter Name="TrTypeClass" Type="String" />
                                                    <asp:Parameter Name="TrClass" Type="String" />
                                                    <asp:Parameter Name="TrCode" Type="String" />
                                                    <asp:Parameter Name="AccountType" Type="String" />
                                                    <asp:Parameter Name="AccountTypeID" Type="String" />
                                                    <asp:Parameter Name="TranType" Type="String" />
                                                    <asp:Parameter Name="TranTypeID" Type="String" />
                                                    <asp:Parameter Name="DocType" Type="String" />
                                                    <asp:Parameter Name="DocTypeID" Type="String" />
                                                    <asp:Parameter Name="TrOrd" Type="String" />
                                                    <asp:Parameter Name="TrSign" Type="String" />
                                                    <asp:Parameter Name="TrAccount" Type="String" />
                                                    <asp:Parameter Name="TrDescription" Type="String" />
                                                </InsertParameters>
                                            </asp:ObjectDataSource>
                                        </EditItemTemplate>
                                        <ItemStyle Width="80px" CssClass="creditBck" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="CreditAccount" SortExpression="CreditAccount">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("CreditAccount") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtCreditAccount" runat="server" CssClass="TextBox" Enabled='False'
                                                Text='<%# Bind("CreditAccount") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemStyle Width="80px" CssClass="creditBck" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="AccountType" HeaderText="Type" SortExpression="AccountType"
                                        ReadOnly="True">
                                        <ItemStyle Width="50px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="AccountTypeID" HeaderText="TypeID" ReadOnly="True"
                                        SortExpression="AccountTypeID">
                                        <ItemStyle Width="50px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="TrSign" HeaderText="Sign" ReadOnly="True" SortExpression="TrSign">
                                        <ItemStyle Width="40px" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="ExtDoc" SortExpression="ExtDoc">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlExtDoc" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                                DataSourceID="dsExtDoc" DataTextField="ExtDoc" DataValueField="ExtDoc" SelectedValue='<%# Bind("ExtDoc") %>'>
                                                <asp:ListItem Value="">- no ext doc -</asp:ListItem>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("ExtDoc") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="100px" />
                                    </asp:TemplateField>
                                    <asp:CommandField CancelImageUrl="~/Images/decline_inline.gif" ShowEditButton="True"
                                        ButtonType="Image" EditImageUrl="~/Images/edit_inline.gif" UpdateImageUrl="~/Images/accept_inline.gif">
                                        <ControlStyle CssClass="ImgButton" />
                                        <ItemStyle Width="50px" />
                                    </asp:CommandField>
                                    <asp:TemplateField InsertVisible="False" ShowHeader="False" Visible="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="false" CommandName="Delete"
                                                ImageUrl="~/Images/delete_inline.gif" OnClientClick="if (!confirm('Are you sure you want to delete this record?')) return;" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            &nbsp;</EditItemTemplate>
                                        <ItemStyle Width="25px" />
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:GridView>
                            <asp:ObjectDataSource ID="dsAccRegDocument" runat="server" SelectMethod="GetData"
                                TypeName="dsAccountTableAdapters.AccRegistrationTableAdapter" UpdateMethod="UpdateQuery">
                                <UpdateParameters>
                                    <asp:Parameter Name="DebitCode" Type="String" />
                                    <asp:Parameter Name="DebitAccount" Type="String" />
                                    <asp:Parameter Name="CreditCode" Type="String" />
                                    <asp:Parameter Name="CreditAccount" Type="String" />
                                    <asp:Parameter Name="ExtDoc" Type="String" />
                                    <asp:Parameter Name="TrDocID" Type="Int32" />
                                </UpdateParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                </table>
                <asp:ObjectDataSource ID="dsExtDoc" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsAccountTableAdapters.AccExtDocTableAdapter"
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_ExtDoc" Type="String" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ExtSign" Type="String" />
                        <asp:Parameter Name="ExtDesc" Type="String" />
                        <asp:Parameter Name="Original_ExtDoc" Type="String" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ExtDoc" Type="String" />
                        <asp:Parameter Name="ExtSign" Type="String" />
                        <asp:Parameter Name="ExtDesc" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
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
                                    <asp:Label ID="popMessage" runat="server" Text="Message"></asp:Label>
                                </p>
                                <p style="text-align: right;">
                                    <br />
                                    <asp:Button ID="btnYes" runat="server" Text="Yes" SkinID="skBtnBase" />&nbsp;
                                    <asp:Button ID="btnNo" runat="server" Text="No" SkinID="skBtnBase" />&nbsp;
                                </p>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </div>
            <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
                PopupDragHandleControlID="popLabel" CancelControlID="btnNo" DropShadow="True"
                BackgroundCssClass="modalBackground" TargetControlID="dummy" X="200" Y="200">
            </asp:ModalPopupExtender>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
