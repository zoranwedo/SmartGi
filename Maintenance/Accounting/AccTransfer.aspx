<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Accounting/masterAccount.master"
    AutoEventWireup="false" CodeFile="AccTransfer.aspx.vb" Inherits="Maintenance_Accounting_AccTransfer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Accounting Tranfers
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AccountContent" runat="Server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="dummy" runat="server" />
            <div class="Blue">
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="GridLabelBG">
                            <asp:Label ID="lblMarket" runat="server" Text="Accounting Transfer" SkinID="skGridLabel"></asp:Label>
                            <asp:CheckBox ID="fltActive" runat="server" Text="Active Only" Checked="false" 
                                ForeColor="White" AutoPostBack="true" TextAlign="Left" style="float: right;" />
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
                                    <td style="width: 52px; font-weight: bold; border-right: solid 1px;" class="GridRow1B">
                                        Active
                                    </td>
                                    <td style="width: 429px; font-weight: bold;" class="GridRow1B">
                                        Description
                                    </td>
                                </tr>
                            </table>
                            <asp:GridView ID="gridAccClass" runat="server" SkinID="skGridView" AllowSorting="True"
                                AutoGenerateColumns="False" DataKeyNames="TransferID" DataSourceID="dsAccTransfer"
                                ShowHeader="False">
                                <Columns>
                                    <asp:BoundField DataField="TransferID" HeaderText="TransferID" SortExpression="TransferID"
                                        ReadOnly="True" InsertVisible="False" Visible="False"></asp:BoundField>
                                    <asp:TemplateField HeaderText="Apply To" SortExpression="ApplyTo">
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("ApplyTo") %>' />
                                            <asp:HiddenField ID="hfTrTypeClass" runat="server" Value='<%# Bind("TrTypeClass") %>' />
                                            <asp:HiddenField ID="fhTrClass" runat="server" Value='<%# Bind("TrClass") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Acc.Type" SortExpression="AccountTypeID">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# "(" & Eval("AccountTypeID") & ")&nbsp;" & Eval("AccountType") %>'></asp:Label>
                                            <asp:HiddenField ID="hfEAccTypeID" runat="server" Value='<%# Bind("AccountTypeID") %>' />
                                            <asp:HiddenField ID="hfEAccType" runat="server" Value='<%# Bind("AccountType") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sign" SortExpression="TrSign">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("TrSign") %>' />
                                        </ItemTemplate>
                                        <ItemStyle CssClass="creditBck" Width="50px" />
                                    </asp:TemplateField>
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
                                                OnSelectedIndexChanged="gvDebitCode_SelectedIndexChanged1" ShowHeader="False" Width="187px">
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
                                            <asp:HiddenField ID="hfDebitTypeID" runat="server" Value='<%# Bind("DebitTypeID") %>' />
                                            <asp:HiddenField ID="hfDebitType" runat="server" Value='<%# Bind("DebitType") %>' />
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
                                                OnSelectedIndexChanged="gvCreditCode_SelectedIndexChanged1" ShowHeader="False" Width="187px">
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
                                            <asp:Label ID="Label11" runat="server" Text='<%# "(" & Eval("CreditTypeID") & ")&nbsp;" & Eval("CreditType") %>' />
                                            <asp:HiddenField ID="hfCreditTypeID" runat="server" Value='<%# Bind("CreditTypeID") %>' />
                                            <asp:HiddenField ID="hfCreditType" runat="server" Value='<%# Bind("CreditType") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="80px" CssClass="creditBck" />
                                    </asp:TemplateField>
                                    <asp:CheckBoxField DataField="ChangeHotel" HeaderText="Hotel" SortExpression="ChangeHotel">
                                        <ItemStyle Width="50px" />
                                    </asp:CheckBoxField>
                                    <asp:CheckBoxField DataField="ChangeTO" HeaderText="TourOp" SortExpression="ChangeTO">
                                        <ItemStyle Width="50px" CssClass="creditBck" />
                                    </asp:CheckBoxField>
                                    <asp:CheckBoxField DataField="IsActive" HeaderText="Active" SortExpression="IsActive">
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
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                                CommandArgument='<%# Eval("TrSign") & ";" & Eval("AccountType") %>' ImageUrl="~/Images/edit_inline.gif"
                                                Text="Edit" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Update"
                                                ImageUrl="~/Images/accept_inline.gif" Text="Update" />
                                            &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False"
                                                CommandName="Cancel" ImageUrl="~/Images/decline_inline.gif" Text="Cancel" />
                                        </EditItemTemplate>
                                        <ControlStyle CssClass="ImgButton" />
                                        <ItemStyle Width="50px" />
                                    </asp:TemplateField>
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
                            <asp:FormView ID="newAccDocClass" runat="server" DataSourceID="dsAccTransfer">
                                <InsertItemTemplate>
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td style="width: 80px;">
                                                <asp:TextBox ID="txtApplyTo" runat="server" CssClass="TextBox" Width="80px" ReadOnly="true" />
                                                <asp:RequiredFieldValidator ID="txtApplyTo_RequiredFieldValidator" runat="server"
                                                    ControlToValidate="txtApplyTo" Display="None" ErrorMessage="Required Field!" />
                                                <asp:ValidatorCalloutExtender ID="txtApplyTo_RequiredFieldValidator_ValidatorCalloutExtender"
                                                    runat="server" Enabled="True" TargetControlID="txtApplyTo_RequiredFieldValidator" />
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
                                                <asp:HiddenField ID="hfTrClass" runat="server" Value='<%# Bind("TrClass") %>' />
                                                <asp:HiddenField ID="hfTrCode" runat="server" Value='<%# Bind("TrCode") %>' />
                                            </td>
                                            <td style="width: 82px;">
                                                <asp:TextBox ID="txtAccTypeID" runat="server" CssClass="TextBox" Text='<%# Bind("AccountTypeID") %>'
                                                    Width="30px" ReadOnly="true" />
                                                <asp:TextBox ID="txtAccType" runat="server" CssClass="TextBox" Text='<%# Bind("AccountType") %>'
                                                    Width="30px" ReadOnly="true" />
                                            </td>
                                            <td style="width: 52px">
                                                <asp:DropDownList ID="ddlTrSgn" runat="server" CssClass="TextBox" SelectedValue='<%# Bind("TrSign") %>'
                                                    Width="50px" Enabled="False">
                                                    <asp:ListItem Value="">-</asp:ListItem>
                                                    <asp:ListItem>D</asp:ListItem>
                                                    <asp:ListItem>C</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td style="width: 82px">
                                                <asp:TextBox ID="txtDebitCode" runat="server" CssClass="TextBox" Text='<%# Bind("DebitCode") %>'
                                                    Enabled="false" />
                                                <asp:RequiredFieldValidator ID="txtDebitCode_RequiredFieldValidator" runat="server"
                                                    ControlToValidate="txtDebitCode" Display="None" ErrorMessage="Required Field!" />
                                                <asp:ValidatorCalloutExtender ID="txtDebitCode_RequiredFieldValidator_ValidatorCalloutExtender"
                                                    runat="server" Enabled="True" TargetControlID="txtDebitCode_RequiredFieldValidator" />
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
                                                    Enabled="false" />
                                                <asp:RequiredFieldValidator ID="txtCreditCode_RequiredFieldValidator" runat="server"
                                                    ControlToValidate="txtCreditCode" Display="None" ErrorMessage="Required Field!" />
                                                <asp:ValidatorCalloutExtender ID="txtCreditCode_RequiredFieldValidator_ValidatorCalloutExtender"
                                                    runat="server" Enabled="True" TargetControlID="txtCreditCode_RequiredFieldValidator" />
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
                                            <td style="width: 400px;">
                                                <asp:TextBox ID="txtDescription" runat="server" CssClass="TextBox" Text='<%# Bind("Description") %>' />
                                                <asp:RequiredFieldValidator ID="txtDescription_RequiredFieldValidator" runat="server"
                                                    ControlToValidate="txtDescription" Display="None" ErrorMessage="Required Field!" />
                                                <asp:ValidatorCalloutExtender ID="txtDescription_RequiredFieldValidator_ValidatorCalloutExtender"
                                                    runat="server" Enabled="True" TargetControlID="txtDescription_RequiredFieldValidator" />
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
                                        <tr>
                                            <td class="GridRow1T" style="width: 1215px; height: 30px;">
                                                &nbsp;
                                            </td>
                                            <td class="GridRow1T" style="width: 75px; padding-left: 5px;">
                                                <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <EmptyDataTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                        <td class="GridRow1T" style="width: 1215px; height: 30px;">
                                            &nbsp;
                                        </td>
                                        <td class="GridRow1T" style="width: 75px; padding-left: 5px;">
                                            <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                        </td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                            </asp:FormView>
                        </td>
                    </tr>
                </table>
                <asp:ObjectDataSource ID="dsAccTransfer" runat="server" 
                    SelectMethod="GetActive" TypeName="AccDocumentTableAdapters.AccTransferTableAdapter"
                    DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_TransferID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
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
                        <asp:Parameter Name="IsActive" Type="Boolean" />
                        <asp:Parameter Name="Original_TransferID" Type="Int32" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="fltActive" Name="ActiveOnly" 
                            PropertyName="Checked" Type="Boolean" />
                    </SelectParameters>
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
                        <asp:Parameter Name="IsActive" Type="Boolean" DefaultValue="True" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsDebitCode" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataForTransfDebit" TypeName="dsAccountTableAdapters.AccDocumentViewTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsCreditCode" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataForTransfCredit" TypeName="dsAccountTableAdapters.AccDocumentViewTableAdapter">
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsApplyTo" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="dsAccountTableAdapters.AccVwApplyToTableAdapter">
                </asp:ObjectDataSource>
                <asp:HiddenField ID="hfFilterD" runat="server" />
                <asp:HiddenField ID="hfFilterC" runat="server" />
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
