<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" CodeFile="ProFormasGenerated.aspx.vb" Inherits="Invoices_ProFormasGenerated" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Generated Proformas by <%=My.User.Name%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" Runat="Server">
       <div class="Blue">
        <table cellpadding="0" cellspacing="0" style="width: 100%;">
            <tr>
                <td class="LocalMenuRow" style="width: 130px;">
                    <asp:HyperLink ID="linkBack" runat="server" SkinID="skHypLink" NavigateUrl="~/Invoices/Proformas.aspx" Text="&lt;&lt; Back to Proformas" />
                </td>
                <td class="LocalMenuRow">&nbsp;</td>
            </tr>
        </table>
        <table cellpadding="0" cellspacing="2px">
            <tr>
                <td class="GridLabelBG" colspan="2">
                    <asp:Label ID="lbProformas" runat="server" SkinID="skGridLabel" Text="Generated ProFormas" />
                    <asp:CheckBox ID="cbGroup" runat="server" style="float:right; color: White; padding: 4px;"
                        TextAlign="Left" Text="Show Group Name" AutoPostBack="True" />

                </td>
            </tr>
            <tr>
                <td class="GridBorder" style="padding: 4px; vertical-align: top;">
                    <asp:ObjectDataSource ID="dsSessions" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                        TypeName="dsPreInvoicesTableAdapters.TmpProFormaTableAdapter">
                        <SelectParameters>
                            <asp:Parameter Name="UserName" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:GridView ID="gvSessions" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="dsSessions" CssClass="GridBorder" SkinID="skGridView" 
                        DataKeyNames="SessionID" AllowPaging="True" SelectedIndex="0" PageSize="5" >
                        <Columns>
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" ShowSelectButton="True">
                                <ItemStyle Width="20px" />
                            </asp:CommandField>
                            <asp:TemplateField HeaderText="Creation Date" >
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbSelect" runat="server" Text='<%# Eval("CreateDate") %>' CommandName="Select" />
                                </ItemTemplate>
                                <ItemStyle Width="160px" HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div style="width: 196px; height: 50px; padding: 10px;">&nbsp</div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </td>
                <td class="Blue GridBorder" style="padding: 4px; vertical-align: top;">
                    <asp:ObjectDataSource ID="dsProformas" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                        TypeName="dsPreInvoicesTableAdapters.GeneratedProformasTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="gvSessions" Name="SessionID" 
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                
                    <asp:GridView ID="gvProformas" runat="server" AutoGenerateColumns="False" 
                        CssClass="GridBorder" DataKeyNames="InvoiceID" DataSourceID="dsProformas" 
                        SkinID="skGridView">
                        <Columns>
                            <asp:TemplateField ShowHeader="false" InsertVisible="False" SortExpression="InvoiceID">
                                <ItemTemplate>
                                    <asp:HyperLink ID="hlProformaSH0" runat="server" 
                                        NavigateUrl='<%# "~/Invoices/ProformaForm.aspx?InvoiceID=" & Eval("InvoiceID") %>' 
                                        Visible='<%# Eval("InvSource") = "SH" %>' >
                                        <asp:ImageButton ID="imgProformaSH0" runat="server" CausesValidation="False" CommandName="Details"
                                            CommandArgument='<%# Eval("InvoiceID") %>' ImageUrl="~/Images/Leads.gif" />
                                    </asp:HyperLink>
                                    <asp:HyperLink ID="hlProformaSX0" runat="server" 
                                        NavigateUrl='<%# "~/Invoices/ProformaFormSX.aspx?InvoiceID=" & Eval("InvoiceID") %>' 
                                        Visible='<%# Eval("InvSource") = "SX" %>' >
                                        <asp:ImageButton ID="imgProformaSX0" runat="server" CausesValidation="False" CommandName="Details"
                                            CommandArgument='<%# Eval("InvoiceID") %>' ImageUrl="~/Images/Leads.gif" />
                                    </asp:HyperLink>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width="20px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="InvoiceID">
                                <ItemTemplate>
                                    <asp:HyperLink ID="hlProformaSHID" runat="server" Text='<%# Eval("InvoiceID") %>'
                                        Visible='<%# Eval("InvSource") = "SH" %>'
                                        NavigateUrl='<%# "~/Invoices/ProformaForm.aspx?InvoiceID=" & Eval("InvoiceID") %>' />
                                    <asp:HyperLink ID="hlProformaSXID" runat="server" Text='<%# Eval("InvoiceID") %>'
                                        Visible='<%# Eval("InvSource") = "SX" %>'
                                        NavigateUrl='<%# "~/Invoices/ProformaFormSX.aspx?InvoiceID=" & Eval("InvoiceID") %>' />
                                </ItemTemplate>
                                <ItemStyle Width="70px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="InvNumber" HeaderText="No#" SortExpression="InvNumber" >
                                <ItemStyle HorizontalAlign="Left" Width="50px" />
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="InvDate" HeaderText="Pro.Date" SortExpression="InvDate" DataFormatString="{0:d}" >
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="InvSource" HeaderText="Src" SortExpression="InvSource" >
                                <ItemStyle Width="40px" HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ResGroup" HeaderText="Group Name" SortExpression="ResGroup" >
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Hotel" HeaderText="Hotel" SortExpression="SortPriority" >
                                <ItemStyle Width="300px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TourOp" HeaderText="TourOp" SortExpression="TourOp" >
                                <ItemStyle Width="200px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CheckIn" HeaderText="CheckIn" SortExpression="CheckIn" DataFormatString="{0:d}" >
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CheckOut" HeaderText="CheckOut" SortExpression="CheckOut" DataFormatString="{0:d}" >
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Nights" HeaderText="Nts#" SortExpression="Nights" ReadOnly="True" >
                                <ItemStyle Width="40px" HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" DataFormatString="{0:N2}" >
                                <ItemStyle Width="70px" HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="State" SortExpression="State">
                                <ItemTemplate>
                                    <asp:Label ID="lblActive" runat="server" Text="Active" Visible='<%# Eval("State")>0 %>' />
                                    <asp:Label ID="lblCancelled" runat="server" Text="Cancelled" Visible='<%# Eval("State")<0 %>' style="font-style: italic; color: Red;" />
                                </ItemTemplate>
                                <ItemStyle Width="70px" HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:CheckBoxField DataField="CCIReview" HeaderText="Rev" SortExpression="CCIReview" >
                                <ItemStyle Width="50px" HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:CheckBoxField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div style="width: 1188px; height: 50px; padding: 10px;">
                                You don't have any proformas saved
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

