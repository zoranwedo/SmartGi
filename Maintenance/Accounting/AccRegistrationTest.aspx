<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Accounting/masterAccount.master" AutoEventWireup="false" CodeFile="AccRegistrationTest.aspx.vb" Inherits="Maintenance_Accounting_AccRegistrationTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Accounting Registration Documents
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AccountContent" Runat="Server">
    <asp:HiddenField ID="dummy" runat="server" />
    <div class="Blue">
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblMarket" runat="server" Text="Accounting Registration Document" 
                        SkinID="skGridLabel" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gridAccClass" runat="server" SkinID="skGridView" AllowSorting="True"
                        AutoGenerateColumns="False" DataKeyNames="TrDocID" 
                        DataSourceID="dsAccRegDocument">
                        <Columns>
                            <asp:TemplateField HeaderText="DebitCode" SortExpression="DebitCode">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("DebitCode") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDebitCode" runat="server" CssClass="TextBox" 
                                        Enabled='<%# iif(Eval("DebitCode") is DbNull.Value,True,False) %>' 
                                        Text='<%# Bind("DebitCode") %>'>
                                        </asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DebitAccount" SortExpression="DebitAccount">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("DebitAccount") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDebitAccount" runat="server" CssClass="TextBox" 
                                        Enabled='False' 
                                        Text='<%# Bind("DebitAccount") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="CreditCode" SortExpression="CreditCode">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("CreditCode") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCreditCode" runat="server" CssClass="TextBox" 
                                        Enabled='<%# iif(Eval("CreditCode") is DbNull.Value,True,False) %>' 
                                        Text='<%# Bind("CreditCode") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="CreditAccount" SortExpression="CreditAccount">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("CreditAccount") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCreditAccount" runat="server" CssClass="TextBox" 
                                        Enabled='<%# iif(Eval("CreditAccount") is DbNull.Value,True,False) %>' 
                                        Text='<%# Bind("CreditAccount") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="AccountType" HeaderText="AccType" 
                                SortExpression="AccountType" ReadOnly="True" >
                            </asp:BoundField>
                            <asp:BoundField DataField="AccountTypeID" HeaderText="AcctTypeID" 
                                ReadOnly="True" SortExpression="AccountTypeID" />
                            <asp:CommandField CancelImageUrl="~/Images/decline_inline.gif" ShowEditButton="True"
                                ButtonType="Image" EditImageUrl="~/Images/edit_inline.gif" UpdateImageUrl="~/Images/accept_inline.gif">
                                <ControlStyle CssClass="ImgButton" />
                                <ItemStyle Width="50px" />
                            </asp:CommandField>
                            <asp:TemplateField InsertVisible="False" ShowHeader="False" Visible="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="false" 
                                        CommandName="Delete" ImageUrl="~/Images/delete_inline.gif" 
                                        onclientclick="if (!confirm('Are you sure you want to delete this record?')) return;"  />
                                </ItemTemplate>
                                <EditItemTemplate>&nbsp;</EditItemTemplate>
                                <ItemStyle Width="25px" />
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:GridView>
                    <asp:ObjectDataSource ID="dsAccRegDocument" runat="server" 
                        DeleteMethod="Delete" SelectMethod="GetData" 
                        TypeName="dsAccountTableAdapters.AccRegistrationTableAdapter" 
                        UpdateMethod="UpdateQuery">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_TrDocID" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="DebitCode" Type="String" />
                            <asp:Parameter Name="DebitAccount" Type="String" />
                            <asp:Parameter Name="CreditCode" Type="String" />
                            <asp:Parameter Name="CreditAccount" Type="String" />
                            <asp:Parameter Name="TrDocID" Type="Int32" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="dsDebitDoc" runat="server" DeleteMethod="Delete" 
                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                        SelectMethod="GetDataForDebit" 
                        TypeName="dsAccountTableAdapters.AccDocumentViewTableAdapter" 
                        UpdateMethod="Update">
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
                    <asp:ObjectDataSource ID="dsCreditDoc" runat="server" DeleteMethod="Delete" 
                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                        SelectMethod="GetDataForCredit" 
                        TypeName="dsAccountTableAdapters.AccDocumentViewTableAdapter" 
                        UpdateMethod="Update">
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
                    <asp:GridView ID="gvCreditCode" runat="server" AutoGenerateColumns="False" 
                        BackColor="White" CssClass="GridBorder" DataKeyNames="TrDocID" 
                        DataSourceID="dsCreditDoc" GridLines="None" ShowHeader="False" Width="187px">
                        <RowStyle CssClass="GridRowClear" HorizontalAlign="Left" />
                        <SelectedRowStyle CssClass="SelectRowClear" />
                        <Columns>
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" 
                                ShowCancelButton="False" ShowSelectButton="True">
                                <ItemStyle Width="20px" />
                            </asp:CommandField>
                            <asp:BoundField DataField="TrCode" HeaderText="TrCode" 
                                SortExpression="TrCode" />
                            <asp:BoundField DataField="TrAccount" HeaderText="TrAccount" 
                                SortExpression="TrAccount" />
                            <asp:BoundField DataField="TrDescription" HeaderText="TrDescription" 
                                SortExpression="TrDescription" />
                        </Columns>
                    </asp:GridView>
                    <asp:GridView ID="gvAccType" runat="server" AutoGenerateColumns="False" 
                        BackColor="White" CssClass="GridBorder" DataKeyNames="TrDocID" 
                        DataSourceID="dsDebitDoc" GridLines="None" 
                        OnSelectedIndexChanged="gvAccType_SelectedIndexChanged" ShowHeader="False" 
                        Width="187px">
                        <RowStyle CssClass="GridRowClear" HorizontalAlign="Left" />
                        <SelectedRowStyle CssClass="SelectRowClear" />
                        <Columns>
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" 
                                ShowCancelButton="False" ShowSelectButton="True">
                                <ItemStyle Width="20px" />
                            </asp:CommandField>
                            <asp:BoundField DataField="TrCode" HeaderText="TrCode" 
                                SortExpression="TrCode" />
                            <asp:BoundField DataField="TrAccount" HeaderText="TrAccount" 
                                SortExpression="TrAccount" />
                            <asp:BoundField DataField="TrDescription" HeaderText="TrDescription" 
                                SortExpression="TrDescription" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
        
        </ContentTemplate>
        </asp:UpdatePanel>
        
                
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
                    <p style="text-align: right;" class="GridRow2TB">
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
</asp:Content>

