<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Accounting/masterAccount.master" AutoEventWireup="false" CodeFile="AccTransfer2.aspx.vb" Inherits="Maintenance_Accounting_AccTransfer2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Accounting Tranfers
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AccountContent" runat="Server">
    <asp:HiddenField ID="dummy" runat="server" />
    <div class="Blue">
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="GridLabelBG">
                            <asp:Label ID="lblMarket" runat="server" Text="Accounting Transfer" SkinID="skGridLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder">
                            <table cellpadding="0" cellspacing="0" style="border-bottom-style: solid; border-bottom-color: White;
                                border-bottom-width: 2px;">
                                <tr>
                                    <td colspan="3" class="TransferB" style="text-align: center; font-weight: bold;">
                                        Apply
                                    </td>
                                    <td colspan="3" class="TransferB" style="text-align: center; font-weight: bold;">
                                        Debit
                                    </td>
                                    <td colspan="3" class="TransferB" style="text-align: center; font-weight: bold;">
                                        Credit
                                    </td>
                                    <td colspan="2" class="TransferB" style="text-align: center; font-weight: bold;">
                                        Change
                                    </td>
                                    <td colspan="2" class="TransferB">
                                        &nbsp;
                                    </td>
                                    <%--<td class="TransferB" >&nbsp;</td>--%>
                                </tr>
                                <tr>
                                    <td style="width: 82px; font-weight: bold;" class="GridRow1B">
                                        To class/doc
                                    </td>
                                    <td style="width: 82px; font-weight: bold;" class="GridRow1B">
                                        Type
                                    </td>
                                    <td style="width: 52px; font-weight: bold; border-right: solid 1px;" class="GridRow1B">
                                        Sign
                                    </td>
                                    <td style="width: 82px; font-weight: bold;" class="GridRow1B">
                                        Code
                                    </td>
                                    <td style="width: 82px; font-weight: bold;" class="GridRow1B">
                                        Account
                                    </td>
                                    <td style="width: 82px; font-weight: bold; border-right: solid 1px;" class="GridRow1B">
                                        Type
                                    </td>
                                    <td style="width: 82px; font-weight: bold;" class="GridRow1B">
                                        Code
                                    </td>
                                    <td style="width: 82px; font-weight: bold;" class="GridRow1B">
                                        Account
                                    </td>
                                    <td style="width: 82px; font-weight: bold; border-right: solid 1px;" class="GridRow1B">
                                        Type
                                    </td>
                                    <td style="width: 52px; font-weight: bold;" class="GridRow1B">
                                        Hotel
                                    </td>
                                    <td style="width: 52px; font-weight: bold; border-right: solid 1px;" class="GridRow1B">
                                        TourOp
                                    </td>
                                    <td colspan="2" style="width: 429px; font-weight: bold;" class="GridRow1B">
                                        Description
                                    </td>
                                    <%--<td style="width: 75px; font-weight: bold;" class="GridRow1B">&nbsp;</td>--%>
                                </tr>
                            </table>
                            <asp:GridView ID="gridAccClass" runat="server" SkinID="skGridView" AllowSorting="True"
                                AutoGenerateColumns="False" DataKeyNames="TransferID" DataSourceID="dsAccTransfer"
                                ShowHeader="false">
                                <Columns>
                                    <asp:BoundField DataField="TransferID" HeaderText="TransferID" SortExpression="TransferID"
                                        ReadOnly="True" InsertVisible="False" Visible="False"></asp:BoundField>
                                    <asp:TemplateField HeaderText="Apply To" SortExpression="ApplyTo">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("ApplyTo") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Acc.Type" SortExpression="AccountTypeID">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# "(" & Eval("AccountTypeID") & ")&nbsp;" & Eval("AccountTypeID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="TrSign" HeaderText="Sign" SortExpression="TrSign" ReadOnly="true">
                                        <ItemStyle Width="50px" CssClass="creditBck" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Debit Code" SortExpression="DebitCode">
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("DebitCode") %>' />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtDebitCode" runat="server" Text='<%# Bind("DebitCode") %>' CssClass="TextBox" />
                                            <asp:PopupControlExtender ID="PopupControlExtender1" runat="server" CommitProperty="Text"
                                                PopupControlID="gvDebitCode" Position="Center" TargetControlID="txtDebitCode">
                                            </asp:PopupControlExtender>
                                            <asp:GridView ID="gvDebitCode" runat="server" AutoGenerateColumns="False" BackColor="White"
                                                CssClass="GridBorder" DataKeyNames="TrCode" DataSourceID="dsDebitCode" GridLines="None"
                                                OnSelectedIndexChanged="gvDebitCode_SelectedIndexChanged1" ShowHeader="False"
                                                Width="187px" OnPreRender="gvDebitCode_PreRender">
                                                <RowStyle CssClass="GridRowClear" HorizontalAlign="Left" />
                                                <SelectedRowStyle CssClass="SelectRowClear" />
                                                <Columns>
                                                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" ShowCancelButton="False"
                                                        ShowSelectButton="True">
                                                        <ItemStyle Width="20px" />
                                                    </asp:CommandField>
                                                    <asp:BoundField DataField="TrCode" HeaderText="TrCode" SortExpression="TrCode" />
                                                    <asp:BoundField DataField="TrAccount" HeaderText="TrAccount" SortExpression="TrAccount" />
                                                    <asp:BoundField DataField="AccountType" HeaderText="AccountType" SortExpression="AccountType" />
                                                    <asp:BoundField DataField="AccountTypeID" HeaderText="AccountTypeID" SortExpression="AccountTypeID" />
                                                </Columns>
                                            </asp:GridView>
                                        </EditItemTemplate>
                                        <ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Debit Account" SortExpression="DebitAccount">
                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("DebitAccount") %>' />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtDebitAccount" runat="server" Text='<%# Bind("DebitAccount") %>'
                                                CssClass="TextBox" Enabled="False" />
                                        </EditItemTemplate>
                                        <ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Debit Type" SortExpression="DebitTypeID">
                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# "(" & Eval("DebitTypeID") & ")&nbsp;" & Eval("DebitType") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="80px" CssClass="creditBck" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Credit Code" SortExpression="CreditCode">
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("CreditCode") %>' />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtCreditCode" runat="server" Text='<%# Bind("CreditCode") %>' CssClass="TextBox" />
                                            <asp:PopupControlExtender ID="txtDocTypeID_PopupControlExtender" runat="server" CommitProperty="Text"
                                                PopupControlID="gvCreditCode" Position="Center" TargetControlID="txtCreditCode">
                                            </asp:PopupControlExtender>
                                            <asp:GridView ID="gvCreditCode" runat="server" AutoGenerateColumns="False" BackColor="White"
                                                CssClass="GridBorder" DataKeyNames="TrCode" DataSourceID="dsCreditCode" GridLines="None"
                                                OnSelectedIndexChanged="gvCreditCode_SelectedIndexChanged1" ShowHeader="False" Width="187px" OnPreRender="gvCreditCode_PreRender">
                                                <RowStyle CssClass="GridRowClear" HorizontalAlign="Left" />
                                                <SelectedRowStyle CssClass="SelectRowClear" />
                                                <Columns>
                                                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" ShowCancelButton="False"
                                                        ShowSelectButton="True">
                                                        <ItemStyle Width="20px" />
                                                    </asp:CommandField>
                                                    <asp:BoundField DataField="TrCode" HeaderText="TrCode" SortExpression="TrCode" />
                                                    <asp:BoundField DataField="TrAccount" HeaderText="TrAccount" SortExpression="TrAccount" />
                                                    <asp:BoundField DataField="AccountType" HeaderText="AccountType" SortExpression="AccountType" />
                                                    <asp:BoundField DataField="AccountTypeID" HeaderText="AccountTypeID" SortExpression="AccountTypeID" />
                                                </Columns>
                                            </asp:GridView>
                                        </EditItemTemplate>
                                        <ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Credit Account" SortExpression="CreditAccount">
                                        <ItemTemplate>
                                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("CreditAccount") %>' />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtCreditAccount" runat="server" Text='<%# Bind("CreditAccount") %>'
                                                CssClass="TextBox" Enabled="False" />
                                        </EditItemTemplate>
                                        <ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Credit Type" SortExpression="CreditTypeID">
                                        <ItemTemplate>
                                            <asp:Label ID="Label11" runat="server" Text='<%# "(" & Eval("CreditType") & ")&nbsp;" & Eval("CreditType") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="80px" CssClass="creditBck" />
                                    </asp:TemplateField>
                                    <asp:CheckBoxField DataField="ChangeHotel" HeaderText="Hotel" SortExpression="ChangeHotel">
                                        <ItemStyle Width="50px" />
                                    </asp:CheckBoxField>
                                    <asp:CheckBoxField DataField="ChangeTO" HeaderText="TourOp" SortExpression="ChangeTO">
                                        <ItemStyle Width="50px" CssClass="creditBck" />
                                    </asp:CheckBoxField>
                                    <asp:TemplateField HeaderText="Description" SortExpression="Description">
                                        <ItemTemplate>
                                            <asp:Label ID="Label15" runat="server" Text='<%# Bind("Description") %>' />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("Description") %>' CssClass="TextBox" />
                                        </EditItemTemplate>
                                        <ItemStyle Width="350px" />
                                    </asp:TemplateField>
                                    <asp:CommandField CancelImageUrl="~/Images/decline_inline.gif" ShowEditButton="True"
                                        ButtonType="Image" EditImageUrl="~/Images/edit_inline.gif" UpdateImageUrl="~/Images/accept_inline.gif">
                                        <ControlStyle CssClass="ImgButton" />
                                        <ItemStyle Width="50px" />
                                    </asp:CommandField>
                                    <asp:TemplateField HeaderText="TrDocClass" SortExpression="TrDocClass" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label16" runat="server" Text='<%# Bind("TrDocClass") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("TrDocClass") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TrTypeClass" SortExpression="TrTypeClass" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label17" runat="server" Text='<%# Bind("TrTypeClass") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("TrTypeClass") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TrClass" SortExpression="TrClass" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="Label18" runat="server" Text='<%# Bind("TrClass") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox18" runat="server" Text='<%# Bind("TrClass") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField InsertVisible="False" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="false" CommandName="Delete"
                                                ImageUrl="~/Images/delete_inline.gif" OnClientClick="return confirm('Are you sure you want to delete the record')" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            &nbsp;</EditItemTemplate>
                                        <ItemStyle Width="25px" />
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:GridView>
                            <asp:FormView ID="newAccDocClass" runat="server" DataSourceID="dsAccTransfer" DefaultMode="Insert">
                                <InsertItemTemplate>
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td style="width: 80px;">
                                                <asp:TextBox ID="txtApplyTo" runat="server" CssClass="TextBox" Width="80px" />
                                                <asp:PopupControlExtender ID="PopupControlExtender2" runat="server" CommitProperty="Text"
                                                    PopupControlID="gvApplyTo" Position="Bottom" TargetControlID="txtApplyTo">
                                                </asp:PopupControlExtender>
                                                <asp:GridView ID="gvApplyTo" runat="server" AutoGenerateColumns="False" CssClass="GridBorder"
                                                    DataSourceID="dsApplyTo" BackColor="White" SkinID="skGridView" DataKeyNames="ApplyTo"
                                                    OnSelectedIndexChanged="gvApplyTo_SelectedIndexChanged">
                                                    <Columns>
                                                        <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" ShowSelectButton="True" />
                                                        <asp:TemplateField HeaderText="ApplyTo" SortExpression="ApplyTo">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblApplyTo" runat="server" Text='<%# Bind("ApplyTo") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ApplyTo") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="TrDocClass" SortExpression="TrDocClass">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblTrDocClass" runat="server" Text='<%# Bind("TrDocClass") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TrDocClass") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="TrTypeClass" SortExpression="TrTypeClass">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblTrTypeClass" runat="server" Text='<%# Bind("TrTypeClass") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("TrTypeClass") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="TrClass" SortExpression="TrClass">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblTrClass" runat="server" Text='<%# Bind("TrClass") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("TrClass") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="AccountType" SortExpression="AccountType">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblAccountType" runat="server" Text='<%# Bind("AccountType") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("AccountType") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="AccountTypeID" SortExpression="AccountTypeID">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblAccountTypeID" runat="server" Text='<%# Bind("AccountTypeID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("AccountTypeID") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="TrSign" SortExpression="TrSign">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblTrSign" runat="server" Text='<%# Bind("TrSign") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("TrSign") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="TrCode" SortExpression="TrCode">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblTrCode" runat="server" Text='<%# Bind("TrCode") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("TrCode") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                                <asp:HiddenField ID="hfDocClass" runat="server" Value='<%# Bind("TrDocClass") %>' />
                                                <asp:HiddenField ID="hfTypeClass" runat="server" Value='<%# Bind("TrTypeClass") %>' />
                                                <asp:HiddenField ID="hfClass" runat="server" Value='<%# Bind("TrClass") %>' />
                                                <asp:HiddenField ID="hfTrCode" runat="server" Value='<%# Bind("TrCode") %>' />
                                            </td>
                                            <td style="width: 82px;">
                                                <asp:TextBox ID="txtAccTypeID" runat="server" CssClass="TextBox" Text='<%# Bind("AccountTypeID") %>'
                                                    Width="30px" Enabled="False" />
                                                <asp:TextBox ID="txtAccType" runat="server" CssClass="TextBox" Text='<%# Bind("AccountType") %>'
                                                    Width="30px" Enabled="False" />
                                            </td>
                                            <td style="width: 52px">
                                                <asp:DropDownList ID="ddlTrSgn" runat="server" CssClass="TextBox" SelectedValue='<%# Bind("TrSign") %>'
                                                    Width="50px" Enabled="False">
                                                    <asp:ListItem>D</asp:ListItem>
                                                    <asp:ListItem>C</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td style="width: 82px">
                                                <asp:TextBox ID="txtDebitCode" runat="server" CssClass="TextBox" Text='<%# Bind("DebitCode") %>' />
                                                <asp:PopupControlExtender ID="PopupControlExtender1" runat="server" CommitProperty="Text"
                                                    PopupControlID="gvDebitCode" Position="Bottom" TargetControlID="txtDebitCode">
                                                </asp:PopupControlExtender>
                                                <asp:GridView ID="gvDebitCode" runat="server" AutoGenerateColumns="False" BackColor="White"
                                                    CssClass="GridBorder" DataKeyNames="TrCode" OnSelectedIndexChanged="gvDebitCode_SelectedIndexChanged"
                                                    OnPreRender="gvDebitCode_PreRender" DataSourceID="dsDebitCode" GridLines="None"
                                                    ShowHeader="False" Width="187px">
                                                    <RowStyle CssClass="GridRowClear" HorizontalAlign="Left" />
                                                    <SelectedRowStyle CssClass="SelectRowClear" />
                                                    <Columns>
                                                        <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" ShowCancelButton="False"
                                                            ShowSelectButton="True">
                                                            <ItemStyle Width="20px" />
                                                        </asp:CommandField>
                                                        <asp:BoundField DataField="TrCode" SortExpression="TrCode" HeaderText="TrCode" />
                                                        <asp:BoundField DataField="TrAccount" SortExpression="TrAccount" HeaderText="TrAccount" />
                                                        <asp:BoundField DataField="AccountType" HeaderText="AccountType" SortExpression="AccountType" />
                                                        <asp:BoundField DataField="AccountTypeID" HeaderText="AccountTypeID" SortExpression="AccountTypeID" />
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                            <td style="width: 82px">
                                                <asp:TextBox ID="txtDebitAccount" runat="server" CssClass="TextBox" Text='<%# Bind("DebitAccount") %>'
                                                    ReadOnly="True" />
                                            </td>
                                            <td style="width: 82px">
                                                <asp:TextBox ID="txtDebitTypeID" runat="server" CssClass="TextBox" Text='<%# Bind("DebitTypeID") %>'
                                                    Width="30px" ReadOnly="True" />
                                                <asp:TextBox ID="txtDebitType" runat="server" CssClass="TextBox" Text='<%# Bind("DebitType") %>'
                                                    Width="30px" ReadOnly="True" />
                                            </td>
                                            <td style="width: 82px">
                                                <asp:TextBox ID="txtCreditCode" runat="server" CssClass="TextBox" Text='<%# Bind("CreditCode") %>'
                                                    ReadOnly="True" />
                                                <asp:PopupControlExtender ID="txtDocTypeID_PopupControlExtender" runat="server" CommitProperty="Text"
                                                    PopupControlID="gvCreditCode" Position="Bottom" TargetControlID="txtCreditCode">
                                                </asp:PopupControlExtender>
                                                <asp:GridView ID="gvCreditCode" runat="server" AutoGenerateColumns="False" BackColor="White"
                                                    CssClass="GridBorder" DataKeyNames="TrCode" OnSelectedIndexChanged="gvCreditCode_SelectedIndexChanged"
                                                    OnPreRender="gvCreditCode_PreRender" DataSourceID="dsCreditCode" GridLines="None"
                                                    ShowHeader="False" Width="187px">
                                                    <RowStyle CssClass="GridRowClear" HorizontalAlign="Left" />
                                                    <SelectedRowStyle CssClass="SelectRowClear" />
                                                    <Columns>
                                                        <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" ShowCancelButton="False"
                                                            ShowSelectButton="True">
                                                            <ItemStyle Width="20px" />
                                                        </asp:CommandField>
                                                        <asp:BoundField DataField="TrCode" SortExpression="TrCode" HeaderText="TrCode" />
                                                        <asp:BoundField DataField="TrAccount" SortExpression="TrAccount" HeaderText="TrAccount" />
                                                        <asp:BoundField DataField="AccountType" HeaderText="AccountType" SortExpression="AccountType" />
                                                        <asp:BoundField DataField="AccountTypeID" HeaderText="AccountTypeID" SortExpression="AccountTypeID" />
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                            <td style="width: 82px">
                                                <asp:TextBox ID="txtCreditAccount" runat="server" CssClass="TextBox" Text='<%# Bind("CreditAccount") %>'
                                                    ReadOnly="True" />
                                            </td>
                                            <td style="width: 82px">
                                                <asp:TextBox ID="txtCreditTypeID" runat="server" CssClass="TextBox" Text='<%# Bind("CreditTypeID") %>'
                                                    Width="30px" ReadOnly="True" />
                                                <asp:TextBox ID="txtCreditType" runat="server" CssClass="TextBox" Text='<%# Bind("CreditType") %>'
                                                    Width="30px" ReadOnly="True" />
                                            </td>
                                            <td style="width: 52px">
                                                <asp:CheckBox ID="cbChangeHotel" runat="server" Checked='<%# Bind("ChangeHotel") %>' />
                                            </td>
                                            <td style="width: 52px">
                                                <asp:CheckBox ID="cbChangeTO" runat="server" Checked='<%# Bind("ChangeTO") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtDescription" runat="server" CssClass="TextBox" Text='<%# Bind("Description") %>'
                                                    Width="350px" />
                                            </td>
                                            <td style="width: 75px; padding-left: 5px;">
                                                <asp:ImageButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                                    ImageUrl="~/Images/accept_inline.gif" CssClass="ImgButton" />
                                                <asp:ImageButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                                    CommandName="Cancel" ImageUrl="~/Images/decline_inline.gif" CssClass="ImgButton" />
                                            </td>
                                        </tr>
                                    </table>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                        <tr class="GridRow1T">
                                            <td style="width: 95%; height: 30px;">
                                                &nbsp;
                                            </td>
                                            <td style="padding-left: 5px;" align="right">
                                                <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <EmptyDataTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                        <tr class="GridRow1T">
                                            <td style="width: 250px; height: 30px;">
                                                &nbsp;
                                            </td>
                                            <td style="width: 75px; padding-left: 5px;">
                                                <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                            </asp:FormView>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:ObjectDataSource ID="dsAccTransfer" runat="server" SelectMethod="GetData" TypeName="dsAccountTableAdapters.AccVwTransferTableAdapter"
            DeleteMethod="DeleteQuery" InsertMethod="InsertQuery" OldValuesParameterFormatString="original_{0}"
            UpdateMethod="UpdateQuery">
            <DeleteParameters>
                <asp:Parameter Name="Original_TransferID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="AccountType" Type="String" />
                <asp:Parameter Name="AccountTypeID" Type="String" />
                <asp:Parameter Name="TrSign" Type="String" />
                <asp:Parameter Name="DebitCode" Type="String" />
                <asp:Parameter Name="DebitAccount" Type="String" />
                <asp:Parameter Name="DebitType" Type="String" />
                <asp:Parameter Name="DebitTypeID" Type="String" />
                <asp:Parameter Name="CreditCode" Type="String" />
                <asp:Parameter Name="CreditAccount" Type="String" />
                <asp:Parameter Name="CreditType" Type="String" />
                <asp:Parameter Name="CreditTypeID" Type="String" />
                <asp:Parameter Name="ChangeHotel" Type="Boolean" />
                <asp:Parameter Name="ChangeTO" Type="Boolean" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Original_TransferID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="TrDocClass" Type="String" />
                <asp:Parameter Name="TrTypeClass" Type="String" />
                <asp:Parameter Name="TrClass" Type="String" />
                <asp:Parameter Name="TrCode" Type="String" />
                <asp:Parameter Name="AccountType" Type="String" />
                <asp:Parameter Name="AccountTypeID" Type="String" />
                <asp:Parameter Name="TrSign" Type="String" />
                <asp:Parameter Name="DebitCode" Type="String" />
                <asp:Parameter Name="DebitAccount" Type="String" />
                <asp:Parameter Name="DebitType" Type="String" />
                <asp:Parameter Name="DebitTypeID" Type="String" />
                <asp:Parameter Name="CreditCode" Type="String" />
                <asp:Parameter Name="CreditAccount" Type="String" />
                <asp:Parameter Name="CreditType" Type="String" />
                <asp:Parameter Name="CreditTypeID" Type="String" />
                <asp:Parameter Name="ChangeHotel" Type="Boolean" />
                <asp:Parameter Name="ChangeTO" Type="Boolean" />
                <asp:Parameter Name="Description" Type="String" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsDebitCode" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataForTransfDebit"
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
        <asp:ObjectDataSource ID="dsCreditCode" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataForTransfCredit"
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
        <asp:ObjectDataSource ID="dsApplyTo" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="dsAccountTableAdapters.AccVwApplyToTableAdapter">
        </asp:ObjectDataSource>
        <asp:HiddenField ID="hfFilterD" runat="server" />
        <asp:HiddenField ID="hfFilterC" runat="server" />
        <%--<asp:ObjectDataSource ID="dsCreditCode" runat="server" DeleteMethod="Delete" 
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetDataForTransfCredit" 
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
                </asp:ObjectDataSource>--%>
        <asp:ObjectDataSource ID="dsTranType" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsAccountTableAdapters.AccTranTypeTableAdapter"
            UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_AccTranTypeID" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="AccTranType" Type="String" />
                <asp:Parameter Name="AccTranTypeName" Type="String" />
                <asp:Parameter Name="Original_AccTranTypeID" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="AccTranTypeID" Type="String" />
                <asp:Parameter Name="AccTranType" Type="String" />
                <asp:Parameter Name="AccTranTypeName" Type="String" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAccType" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsAccountTableAdapters.AccTypeTableAdapter"
            UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_AccTypeID" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="AccType" Type="String" />
                <asp:Parameter Name="AccTypeName" Type="String" />
                <asp:Parameter Name="Original_AccTypeID" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="AccTypeID" Type="String" />
                <asp:Parameter Name="AccType" Type="String" />
                <asp:Parameter Name="AccTypeName" Type="String" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsDocType" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsAccountTableAdapters.AccDocTypeTableAdapter"
            UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_AccDocTypeID" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="AccDocType" Type="String" />
                <asp:Parameter Name="AccDocTypeName" Type="String" />
                <asp:Parameter Name="Original_AccDocTypeID" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="AccDocTypeID" Type="String" />
                <asp:Parameter Name="AccDocType" Type="String" />
                <asp:Parameter Name="AccDocTypeName" Type="String" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <%--<asp:ObjectDataSource ID="dsDebitCode" runat="server" DeleteMethod="Delete" 
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetDataForTransfDebit" 
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
                </asp:ObjectDataSource>--%>
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

