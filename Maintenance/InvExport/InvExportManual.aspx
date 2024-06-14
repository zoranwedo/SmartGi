<%@ Page Language="VB" MasterPageFile="~/Maintenance/InvExport/InvExport.master" 
    AutoEventWireup="false" CodeFile="InvExportManual.aspx.vb" Inherits="Maintenance_InvExport_InvExportManual" 
    title="Manual XML Invoice Export" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Manual XML Invoice Export
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ExpContent" Runat="Server">
    <asp:HiddenField ID="dummy" runat="server" />
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblLogTitle" runat="server" Text="Export Log" SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td style="text-align: right;">
                    <asp:Button ID="btnExport" runat="server" Text="Run Export" 
                        SkinID="skBtnBase" />
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 1150px;" >
                    <asp:GridView ID="gvExportLog" runat="server" AutoGenerateColumns="False" DataSourceID="dsExportLog"
                        SkinID="skGridView" EnableModelValidation="True" Visible="False">
                        <Columns>
                            <asp:BoundField DataField="LogDate" HeaderText="Log Date" SortExpression="LogDate">
                                <ItemStyle Width="160px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="LogUser" HeaderText="User" SortExpression="LogUser">
                                <ItemStyle Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="InvNumber" HeaderText="Invoice #" SortExpression="InvNumber">
                                <ItemStyle Width="80px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="LogMess" HeaderText="Message" 
                                SortExpression="LogMess" DataFormatString="&amp;nbsp;&amp;nbsp;{0}" 
                                HtmlEncode="False" HtmlEncodeFormatString="False">
                                <ItemStyle Width="750px" Wrap="True" />
                            </asp:BoundField>
                        </Columns>
                        <EmptyDataTemplate>
                            No invoice exported.
                        </EmptyDataTemplate>
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="dsExportLog" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataByDate" 
            TypeName="dsBavelTableAdapters.InvoiceXmlLogTableAdapter">
            <SelectParameters>
                <asp:Parameter Name="LogDate" Type="DateTime" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div> 
</asp:Content>

