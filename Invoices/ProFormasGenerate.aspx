<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="ProFormasGenerate.aspx.vb" Inherits="Invoices_ProFormasGenerate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Generated ProFormas
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" runat="Server">
    <div class="Blue">
        <asp:ObjectDataSource ID="dsHotel" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="dsInvoicesTableAdapters.HotelTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <table cellpadding="0" cellspacing="0" style="width: 583px">
            <tr>
                <td class="LocalMenuRow" style="width: 200px;">
                    <asp:HyperLink ID="linkBack" runat="server" SkinID="skHypLink" NavigateUrl="~/Invoices/ProFormaResCreateAll.aspx"
                        Text="&lt;&lt; Back to Create Proforma" />
                </td>
                <td class="LocalMenuRow" colspan="2">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="GridLabelBG" colspan="3">
                    <asp:Label ID="lbHotels" runat="server" SkinID="skGridLabel" Text="Generated ProFormas"
                        Height="27px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 23px" valign="top" class="GridBorder">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProFormaID"
                        DataSourceID="dsFilteredInvoices" SkinID="skGridView" AllowPaging="True" PageSize="20"
                        SelectedIndex="0">
                        <Columns>
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" ShowSelectButton="True">
                                <ItemStyle Width="25px" />
                            </asp:CommandField>
                            <asp:TemplateField HeaderText="(ID)" SortExpression="ProFormaID">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" 
                                        NavigateUrl='<%# "~/Invoices/ProformaForm.aspx?InvoiceID=" & Eval("ProFormaID") %>'
                                        Text='<%# Eval("ProFormaID") %>' />
                                </ItemTemplate>
                                <ItemStyle Width="100px" HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Details"
                                        CommandArgument='<%# Eval("ProFormaID") %>' ImageUrl="~/Images/Leads.gif" />
                                </ItemTemplate>
                                <ItemStyle Width="25px" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
                <td style="width: 97px">
                </td>
                <td style="width: 226px" valign="top">
                    <asp:DetailsView ID="dvProformas" runat="server" Height="50px" Width="325px" AutoGenerateRows="False"
                        CssClass="GridBorder" DataSourceID="dsFilteredInvoicesDet" Caption="Details"
                        EnableModelValidation="True" DataKeyNames="HotelID">
                        <Fields>
                            <asp:BoundField DataField="Hotel" HeaderText="Hotel" SortExpression="Hotel">
                                <HeaderStyle Width="70px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TourOp" HeaderText="TourOp" SortExpression="TourOp" />
                            <asp:BoundField DataField="InvNumber" HeaderText="InvNumber" SortExpression="InvNumber" />
                            <asp:BoundField DataField="InvOrder" HeaderText="InvOrder" SortExpression="InvOrder" />
                            <asp:BoundField DataField="InvDate" DataFormatString="{0:d}" HeaderText="InvDate"
                                HtmlEncode="False" SortExpression="InvDate" />
                            <asp:BoundField DataField="InvDoc" HeaderText="InvDoc" SortExpression="InvDoc" />
                            <asp:BoundField DataField="InvType" HeaderText="InvType" SortExpression="InvType" />
                            <asp:BoundField DataField="ResGroup" HeaderText="ResGroup" SortExpression="ResGroup" />
                            <asp:BoundField DataField="CheckIn" DataFormatString="{0:d}" HeaderText="CheckIn"
                                HtmlEncode="False" SortExpression="CheckIn" />
                            <asp:BoundField DataField="CheckOut" DataFormatString="{0:d}" HeaderText="CheckOut"
                                HtmlEncode="False" SortExpression="CheckOut" />
                        </Fields>
                    </asp:DetailsView>
                </td>
            </tr>
            <tr>
                <td style="text-align: left; padding-top: 5px; height: 30px;">
                    <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="#FF6600">Summary ProForma&#39;s Report</asp:LinkButton>
                    &nbsp;&nbsp;<asp:ObjectDataSource ID="dsFilteredInvoices" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="dsPreInvoicesTableAdapters.ProFormaGenerateTableAdapter">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="SessionID" QueryStringField="sessID" Type="String" />
                            <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="dsFilteredInvoicesDet" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="dsPreInvoicesTableAdapters.PreInvoiceTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView1" Name="ProFormaID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
                <td style="width: 97px">
                </td>
                <td style="width: 226px">
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
