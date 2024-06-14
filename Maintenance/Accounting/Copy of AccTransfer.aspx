﻿<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Accounting/masterAccount.master" AutoEventWireup="false" CodeFile="Copy of AccTransfer.aspx.vb" Inherits="Maintenance_Accounting_AccTransfer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Accounting Tranfers
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
                    <asp:Label ID="lblMarket" runat="server" Text="Accounting Transfer" 
                        SkinID="skGridLabel" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gridAccClass" runat="server" SkinID="skGridView" AllowSorting="True"
                        AutoGenerateColumns="False" DataKeyNames="TransferID" 
                        DataSourceID="dsAccTransfer">
                        <Columns>
                            <asp:TemplateField InsertVisible="False" ShowHeader="False" Visible="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="false" 
                                        CommandName="Delete" ImageUrl="~/Images/delete_inline.gif" 
                                        onclientclick="if (!confirm('Are you sure you want to delete this record?')) return;"  />
                                </ItemTemplate>
                                <EditItemTemplate>&nbsp;</EditItemTemplate>
                                <ItemStyle Width="25px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="TransferID" HeaderText="TransferID" 
                                SortExpression="TransferID" ReadOnly="True" InsertVisible="False" 
                                Visible="False" >
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="ApplyTo" SortExpression="ApplyTo">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("ApplyTo") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlApplyTo" runat="server" CssClass="TextBox" 
                                        SelectedValue='<%# Bind("ApplyTo") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="AccType" SortExpression="AccountType">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("AccountType") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtAccType" runat="server" CssClass="TextBox" Enabled="False" 
                                        Text='<%# Bind("AccountType") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="AccTypeID" SortExpression="AccountTypeID">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("AccountTypeID") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtAccTypeID" runat="server" CssClass="TextBox" 
                                        Enabled="False" Text='<%# Bind("AccountTypeID") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="TrSign" SortExpression="TrSign">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("TrSign") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtTrSign" runat="server" CssClass="TextBox" Enabled="False" 
                                        Text='<%# Bind("TrSign") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DebitCode" SortExpression="DebitCode">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("DebitCode") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("DebitCode") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DebitAccount" SortExpression="DebitAccount">
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("DebitAccount") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("DebitAccount") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DebitType" SortExpression="DebitType">
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("DebitType") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("DebitType") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DebitTypeID" SortExpression="DebitTypeID">
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("DebitTypeID") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("DebitTypeID") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="CreditCode" SortExpression="CreditCode">
                                <ItemTemplate>
                                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("CreditCode") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("CreditCode") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="CreditAccount" SortExpression="CreditAccount">
                                <ItemTemplate>
                                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("CreditAccount") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("CreditAccount") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="CreditType" SortExpression="CreditType">
                                <ItemTemplate>
                                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("CreditType") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("CreditType") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="CreditTypeID" SortExpression="CreditTypeID">
                                <ItemTemplate>
                                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("CreditTypeID") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("CreditTypeID") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ChangeHotel" SortExpression="ChangeHotel">
                                <ItemTemplate>
                                    <asp:Label ID="Label13" runat="server" Text='<%# Bind("ChangeHotel") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("ChangeHotel") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ChangeTO" SortExpression="ChangeTO">
                                <ItemTemplate>
                                    <asp:Label ID="Label14" runat="server" Text='<%# Bind("ChangeTO") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("ChangeTO") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Description" SortExpression="Description">
                                <ItemTemplate>
                                    <asp:Label ID="Label15" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField CancelImageUrl="~/Images/decline_inline.gif" ShowEditButton="True"
                                ButtonType="Image" EditImageUrl="~/Images/edit_inline.gif" UpdateImageUrl="~/Images/accept_inline.gif">
                                <ControlStyle CssClass="ImgButton" />
                                <ItemStyle Width="50px" />
                            </asp:CommandField>
                            <asp:TemplateField HeaderText="TrDocClass" SortExpression="TrDocClass" 
                                Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="Label16" runat="server" Text='<%# Bind("TrDocClass") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("TrDocClass") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="TrTypeClass" SortExpression="TrTypeClass" 
                                Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="Label17" runat="server" Text='<%# Bind("TrTypeClass") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("TrTypeClass") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="TrClass" SortExpression="TrClass" 
                                Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="Label18" runat="server" Text='<%# Bind("TrClass") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox18" runat="server" Text='<%# Bind("TrClass") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:GridView>
                    <asp:FormView ID="newAccDocClass" runat="server" 
                        DataSourceID="dsAccTransfer" Width="1041px">
                        <InsertItemTemplate>
                            <table class="GridBorder" cellpadding="0" cellspacing="0" ">
                                <tr>
                                
                                <td  colspan="8">
                                <div class="Red">
                                
                                 <asp:Label ID="Label11" runat="server" Text="Apply To: "></asp:Label>
                                    <asp:TextBox ID="txtApplyTo" runat="server" CssClass="TextBox" 
                                        Text='<%# Bind("ApplyTo") %>'></asp:TextBox>
                                    <asp:PopupControlExtender ID="PopupControlExtender2" runat="server" 
                                        CommitProperty="Text"
                                        PopupControlID="gvApplyTo" Position="Bottom" TargetControlID="txtApplyTo">
                                    </asp:PopupControlExtender>
                                    <asp:GridView ID="gvApplyTo" runat="server" AutoGenerateColumns="False" class="GridBorder"
                                        DataSourceID="dsApplyTo" BackColor="White" 
                                        SkinID="skGridView" 
                                        DataKeyNames="ApplyTo" 
                                        onselectedindexchanged="gvApplyTo_SelectedIndexChanged">
                                        <Columns>
                                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" 
                                                ShowSelectButton="True" />
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
                                                    <asp:Label ID="lblAccountTypeID" runat="server" 
                                                        Text='<%# Bind("AccountTypeID") %>'></asp:Label>
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
                                </div>
                               
                                </td>
                                </tr>
                                <tr >
                                <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                 <td >
                                        <asp:TextBox ID="txtDocClass" runat="server" Text='<%# Bind("TrDocClass") %>' 
                                            Width="35px" CssClass="TextBox" MaxLength="2" Visible="False" 
                                            Enabled="False" />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtTypeClass" runat="server" 
                                            Text='<%# Bind("TrTypeClass") %>' CssClass="TextBox" Width="30px" 
                                            Enabled="False" Visible="False" />
                                    </td>
                                    
                                    <td >
                                        <asp:TextBox ID="txtClass" runat="server" 
                                            Text='<%# Bind("TrClass") %>' CssClass="TextBox" Width="80px" 
                                            Visible="False" Enabled="False"></asp:TextBox></td>
                                    <td >
                                        <asp:TextBox ID="txtTrCode" runat="server" 
                                            Text='<%# Bind("TrCode") %>' CssClass="TextBox" Width="70px" 
                                             Enabled="False"></asp:TextBox></td>
                                    <td>
                                     <asp:TextBox ID="txtAccType" runat="server" CssClass="TextBox" 
                                        Text='<%# Bind("AccountType") %>' Width="30px" Enabled="False"></asp:TextBox>
                                    </td>
                                    <td>
                                     <asp:TextBox ID="txtAccTypeID" runat="server" CssClass="TextBox" 
                                        Text='<%# Bind("AccountTypeID") %>' Width="30px" Enabled="False"></asp:TextBox>
                                    </td>
                                    <td>
                                     <asp:DropDownList ID="ddlTrSgn" runat="server" CssClass="TextBox" 
                                        SelectedValue='<%# Bind("TrSign") %>' Width="30px" Enabled="False">
                                        <asp:ListItem>D</asp:ListItem>
                                        <asp:ListItem>C</asp:ListItem>
                                    </asp:DropDownList>
                                    </td>
                                    <td style="width: 50px">
                                    <asp:TextBox ID="txtDebitCode" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("DebitCode") %>' Width="60px" />
                                                <asp:PopupControlExtender ID="PopupControlExtender1" runat="server" 
                                        CommitProperty="Text"
                                        PopupControlID="gvDebitCode" Position="Bottom" TargetControlID="txtDebitCode">
                                    </asp:PopupControlExtender>
                                    <br />
                                    <asp:GridView ID="gvDebitCode" runat="server" AutoGenerateColumns="False" 
                                        BackColor="White" CssClass="GridBorder" DataKeyNames="TrCode" 
                                        DataSourceID="dsDebitCode" GridLines="None" 
                                        ShowHeader="False" 
                                        Width="187px">
                                        <RowStyle CssClass="GridRowClear" HorizontalAlign="Left" />
                                        <SelectedRowStyle CssClass="SelectRowClear" />
                                        <Columns>
                                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" 
                                                ShowCancelButton="False" ShowSelectButton="True">
                                                <ItemStyle Width="20px" />
                                            </asp:CommandField>
                                            <asp:BoundField DataField="TrCode" 
                                                SortExpression="TrCode" HeaderText="TrCode" />
                                            <asp:BoundField DataField="TrAccount" SortExpression="TrAccount" 
                                                HeaderText="TrAccount" />
                                            <asp:BoundField DataField="AccountType" HeaderText="AccountType" 
                                                SortExpression="AccountType" />
                                            <asp:BoundField DataField="AccountTypeID" HeaderText="AccountTypeID" 
                                                SortExpression="AccountTypeID" />
                                        </Columns>
                                    </asp:GridView>
                                        <asp:ObjectDataSource ID="dsDebitCode" runat="server" DeleteMethod="Delete" 
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
                                        </asp:ObjectDataSource>
                                    </td>
                                    <td style="width: 70px">
                                    <asp:TextBox ID="txtDebitAccount" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("DebitAccount") %>' Width="70px" ReadOnly="True" />
                                    </td>
                                    <td style="width: 30px">
                                    <asp:TextBox ID="txtDebitType" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("DebitType") %>' Width="30px" ReadOnly="True" />
                                    </td>
                                    <td style="width: 30px">
                                    <asp:TextBox ID="txtDebitTypeID" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("DebitTypeID") %>' Width="30px" ReadOnly="True" />
                                    </td>
                                    <td style="width: 60px">
                                    <asp:TextBox ID="txtCreditCode" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("CreditCode") %>' Width="60px" ReadOnly="True" />
                                            <asp:PopupControlExtender ID="txtDocTypeID_PopupControlExtender" runat="server" 
                                        CommitProperty="Text"
                                        PopupControlID="gvCreditCode" 
                                        Position="Bottom" TargetControlID="txtCreditCode">
                                    </asp:PopupControlExtender>

                                        <asp:ObjectDataSource ID="dsCreditCode" runat="server" DeleteMethod="Delete" 
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
                                        </asp:ObjectDataSource>

                                    <asp:GridView ID="gvCreditCode" runat="server" AutoGenerateColumns="False" 
                                        BackColor="White" CssClass="GridBorder" DataKeyNames="TrCode" 
                                        DataSourceID="dsCreditCode" GridLines="None" 
                                        ShowHeader="False" 
                                        Width="187px">
                                        <RowStyle CssClass="GridRowClear" HorizontalAlign="Left" />
                                        <SelectedRowStyle CssClass="SelectRowClear" />
                                        <Columns>
                                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" 
                                                ShowCancelButton="False" ShowSelectButton="True">
                                                <ItemStyle Width="20px" />
                                            </asp:CommandField>
                                            <asp:BoundField DataField="TrCode" 
                                                SortExpression="TrCode" HeaderText="TrCode" />
                                            <asp:BoundField DataField="TrAccount" SortExpression="TrAccount" 
                                                HeaderText="TrAccount" />
                                            <asp:BoundField DataField="AccountType" HeaderText="AccountType" 
                                                SortExpression="AccountType" />
                                            <asp:BoundField DataField="AccountTypeID" HeaderText="AccountTypeID" 
                                                SortExpression="AccountTypeID" />
                                        </Columns>
                                    </asp:GridView>
                                            
                                    </td>
                                    <td style="width: 70px">
                                    <asp:TextBox ID="txtCreditAccount" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("CreditAccount") %>' Width="70px" ReadOnly="True" />
                                    </td>
                                    <td style="width: 30px">
                                    <asp:TextBox ID="txtCreditType" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("CreditType") %>' Width="30px" ReadOnly="True" />
                                    </td>
                                    <td style="width: 30px">
                                    <asp:TextBox ID="txtCreditTypeID" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("CreditTypeID") %>' Width="30px" ReadOnly="True" />
                                    </td>
                                    <td style="width: 20px">
                                        <asp:CheckBox ID="cbChangeHotel" runat="server" 
                                            Checked='<%# Bind("ChangeHotel") %>' />
                                    </td>
                                    <td style="width: 20px">
                                        <asp:CheckBox ID="cbChangeTO" runat="server" 
                                            Checked='<%# Bind("ChangeTO") %>' />
                                    </td>
                                                                        
                                    <td>
                                    
                                        <asp:TextBox ID="txtDescription" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("Description") %>' Width="200px" />
                                    
                                    </td>
                                    <td style="width: 75px; padding-left: 5px;">
                                        <asp:ImageButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                            ImageUrl="~/Images/accept_inline.gif" CssClass="ImgButton" />
                                        <asp:ImageButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                            CommandName="Cancel" ImageUrl="~/Images/decline_inline.gif" CssClass="ImgButton" />
                                    </td>
                                
                                </ContentTemplate>
                                </asp:UpdatePanel>
                                   
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
                    <asp:ObjectDataSource ID="dsAccTransfer" runat="server" SelectMethod="GetData" 
                        TypeName="dsAccountTableAdapters.AccVwTransferTableAdapter">
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="dsApplyTo" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                        TypeName="dsAccountTableAdapters.AccVwApplyToTableAdapter">
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="dsTranType" runat="server" DeleteMethod="Delete" 
                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                        SelectMethod="GetData" 
                        TypeName="dsAccountTableAdapters.AccTranTypeTableAdapter" UpdateMethod="Update">
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
                    <asp:ObjectDataSource ID="dsAccType" runat="server" DeleteMethod="Delete" 
                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                        SelectMethod="GetData" TypeName="dsAccountTableAdapters.AccTypeTableAdapter" 
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
                    <asp:ObjectDataSource ID="dsDocType" runat="server" DeleteMethod="Delete" 
                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                        SelectMethod="GetData" TypeName="dsAccountTableAdapters.AccDocTypeTableAdapter" 
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

