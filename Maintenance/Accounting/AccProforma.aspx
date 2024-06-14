<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" 
    CodeFile="AccProforma.aspx.vb" Inherits="Maintenance_Accounting_AccProforma" %>


<%@ Register src="~/App_UserControls/MessagePop.ascx" tagname="MessagePop" tagprefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Proforma Payment
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" Runat="Server">
    <div class="Blue">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
            <ContentTemplate>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="GridLabelBG">
                            <asp:Label ID="lblTitle" runat="server" Text="Proforma Payment Documents" SkinID="skGridLabel" />
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder">
                            <asp:GridView ID="gridDocProforma" runat="server" SkinID="skGridView" AllowSorting="True"
                                AutoGenerateColumns="False" DataKeyNames="TrDocID" 
                                DataSourceID="dsAccDocProforma" EnableModelValidation="True" >
                                <Columns>
                                    <asp:BoundField DataField="TrCode" HeaderText="Document" SortExpression="TrCode" >
                                    <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="AccountType" HeaderText="Acc." SortExpression="AccountType" >
                                    <ItemStyle Width="60px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="CreditCode" HeaderText="Transf." SortExpression="CreditCode" >
                                    <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:TemplateField InsertVisible="False" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="false" CommandName="Delete" CssClass="ImgButton"
                                                ImageUrl="~/Images/delete_inline.gif" OnClientClick="return confirm('Are you sure you want to delete the record')" />
                                        </ItemTemplate>
                                        <ItemStyle Width="50px" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:FormView ID="newDocProforma" runat="server" DataKeyNames="TrDocID" 
                                DataSourceID="dsAccDocProforma" EnableModelValidation="True" >
                                <InsertItemTemplate>
                                    <table cellpadding="0" cellspacing="2" style="border-collapse: collapse; table-layout: fixed;" class="GridRow1B">
                                        <tr>
                                            <td style="width: 102px;">
                                                <asp:HiddenField ID="hfTrDocID" runat="server" Value='<%# Bind("TrDocID") %>' />
                                                <asp:TextBox ID="txtTrCode" runat="server" CssClass="TextBox" Text='<%# Bind("TrCode") %>' ReadOnly="true" Width="95px"/>
                                                <asp:PopupControlExtender ID="popAccAppDocument" runat="server" CommitProperty="Text" 
                                                    PopupControlID="gvAccAppDocument"
                                                    TargetControlID="txtTrCode" 
                                                    Position="Bottom">
                                                </asp:PopupControlExtender>
                                                <asp:GridView ID="gvAccAppDocument" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                    DataKeyNames="TrDocID, TrCode, AccountType" DataSourceID="dsAccAppDocument" GridLines="None"
                                                    CssClass="ListGrid"
                                                    OnSelectedIndexChanging="gvAccAppDocument_SelectedIndexChanged"
                                                    OnSelectedIndexChanged="gvAccAppDocument_SelectedIndexChanged" >
                                                    <Columns>
                                                        <asp:TemplateField >
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="Label2" runat="server" Text='<%# Bind("TrCode") %>' CommandName="Select" />
                                                            </ItemTemplate>
                                                            <ItemStyle Width="100px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField >
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="Label3" runat="server" Text='<%# Bind("AccountType") %>' CommandName="Select"/>
                                                            </ItemTemplate>
                                                            <ItemStyle Width="60px" />
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <RowStyle CssClass="ListItem" />
                                                </asp:GridView>
                                            </td>
                                            <td style="width: 62px;">
                                                <asp:TextBox ID="txtAccountType" runat="server" CssClass="TextBox" Text='<%# Eval("AccountType") %>' ReadOnly="true" Width="55px"/>
                                            </td>
                                            <td style="width: 102px;">
                                                <asp:DropDownList ID="ddlTransferID" runat="server" CssClass="TextBox" Width="100px" Visible="false"
                                                    DataSourceID="dsAccAppTransfer" DataTextField="CreditCode" DataValueField="TransferID" /> 
                                            </td>
                                            <td class="GridRow1B" style="width: 50px;">
                                                <asp:ImageButton ID="btUpdate" runat="server" ImageUrl="~/Images/accept_inline.gif" CssClass="ImgButton" 
                                                    CommandName="Insert" />
                                                <asp:ImageButton ID="btCancel" runat="server" ImageUrl="~/Images/decline_inline.gif" CssClass="ImgButton" 
                                                    CommandName="Cancel" CausesValidation="true" />
                                            </td>
                                        </tr>
                                    </table>
                                </InsertItemTemplate>
                                <InsertRowStyle Height="34px" />
                                <ItemTemplate>
                                <div style="text-align: right; height: 30px; width: 316px;" class="GridRow1B">
                                    <asp:Button ID="NewButton" runat="server" CommandName="New" CausesValidation="False" 
                                        Text="New" SkinID="skBtnBase" style="margin-right: 5px; margin-top: 5px;" />
                                </div>
                                </ItemTemplate>
                                <EmptyDataTemplate>
                                <div style="text-align: right; height: 30px; width: 316px;" class="GridRow1B">
                                    <asp:Button ID="NewButton" runat="server" CommandName="New" CausesValidation="False" 
                                        Text="New" SkinID="skBtnBase" style="margin-right: 5px; margin-top: 5px;" />
                                </div>
                                </EmptyDataTemplate>
                            </asp:FormView>
                            <asp:ObjectDataSource ID="dsAccDocProforma" runat="server" 
                                DeleteMethod="DeleteQuery" InsertMethod="InsertQuery" 
                                OldValuesParameterFormatString="{0}" SelectMethod="GetData" 
                                TypeName="dsProformaApplicationTableAdapters.AccDocProformaTableAdapter" >
                                <DeleteParameters>
                                    <asp:Parameter Name="TrDocID" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="TrDocID" Type="Int32" />
                                    <asp:Parameter Name="TrCode" Type="String" />
                                    <asp:Parameter Name="TransferID" Type="Int32" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="dsAccAppDocument" runat="server" 
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                TypeName="dsProformaApplicationTableAdapters.AccAppDocumentTableAdapter" />
                            <asp:ObjectDataSource ID="dsAccAppTransfer" runat="server" 
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                TypeName="dsProformaApplicationTableAdapters.AccAppTransferTableAdapter" >
                                <SelectParameters>
                                    <asp:Parameter Name="TrDocID" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                </table>
                <uc:MessagePop ID="msgPop" runat="server" Title="Proforma Payment" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

