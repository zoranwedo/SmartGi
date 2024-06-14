<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/SihotRates/RateSihot.master" AutoEventWireup="false" CodeFile="RateImportReport.aspx.vb" Inherits="Maintenance_SihotRates_RateImportReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Rate Import Status
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" Runat="Server">
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lbServiceLog" runat="server" Text="Rate imported status" SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvImport" runat="server" 
                        SkinID="skGridView" AutoGenerateColumns="False"
                        EnableModelValidation="True" DataSourceID="dsImported" ShowHeader="False">
                        <RowStyle Wrap="False" />
                        <Columns>
                            <asp:TemplateField HeaderText="msgID" SortExpression="msgID">
                                <ItemTemplate>
                                    <asp:HiddenField ID="hfID" runat="server" Value='<%# Bind("msgID") %>'/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="msg" HeaderText="msg" SortExpression="msg">
                            <ItemStyle Width="700px" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
    <asp:ObjectDataSource ID="dsImported" runat="server" OldValuesParameterFormatString="original_{0}"
        TypeName="dsRateImportTableAdapters.RateImportStatusTableAdapter" 
        SelectMethod="GetData" >
    </asp:ObjectDataSource>

</asp:Content>

