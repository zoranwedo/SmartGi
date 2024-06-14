<%@ Page Language="VB" MasterPageFile="~/Maintenance/InvExport/InvExport.master" 
    AutoEventWireup="false" CodeFile="InvExportLog.aspx.vb" Inherits="Maintenance_InvExport_InvExportLog" 
    title="XML Invoice Export Log" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    XML Invoice Export Log
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ExpContent" Runat="Server">
    <asp:HiddenField ID="dummy" runat="server" />
    <div class="Green">
        <asp:CollapsiblePanelExtender ID="cpeSearch" runat="server" TargetControlID="pnSearch"
            CollapseControlID="lblFilter" ExpandControlID="lblFilter" ImageControlID="imgExpander"
            CollapsedImage="~/Images/expand_.png" ExpandedImage="~/Images/collapse_.png"
            Collapsed="False">
        </asp:CollapsiblePanelExtender>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <asp:Panel ID="pnSearchHead" runat="server">
                    <td class="GridLabelBG" style="width: 600px;">
                        <asp:Label ID="lblFilter" runat="server" SkinID="skGridLabel">Search/Filter &nbsp;
                            <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />
                            &nbsp; 
                        </asp:Label>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px;">
                    <asp:Panel ID="pnSearch" runat="server" CssClass="popupPanel" DefaultButton="btnSerch">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="GridRow2B" style="width: 100px; text-align: left; font-weight: bold;">
                                    Show Log on:
                                </td>
                                <td class="GridRow2B" style="width: 400px; text-align: left;">
                                    <asp:TextBox ID="txtDate" runat="server" CssClass="TextBox" />
                                    <asp:CalendarExtender ID="extDate" runat="server" TargetControlID="txtDate" />
                                    <asp:CompareValidator ID="valDate" runat="server" ErrorMessage="Date input required!"
                                        ControlToValidate="txtDate" Display="None" Operator="DataTypeCheck" Type="Date" />
                                    <asp:ValidatorCalloutExtender ID="calDate" runat="server" TargetControlID="valDate" />
                                </td>
                                <td class="GridRow2B" style="width: 100px; text-align: right; padding-top: 5px; height: 30px;">
                                    <asp:Button ID="btnSerch" runat="server" SkinID="skBtnFilter" Style="margin-bottom: 5px;" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div class="Blue">
        <br />
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblLogTitle" runat="server" Text="Export Log" SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 1150px;" >
                    <asp:GridView ID="gvExportLog" runat="server" AutoGenerateColumns="False" DataSourceID="dsExportLog"
                        SkinID="skGridView" EnableModelValidation="True">
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
                            No invoice exports on selected date.
                        </EmptyDataTemplate>
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="dsExportLog" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataByDate" 
            TypeName="dsBavelTableAdapters.InvoiceXmlLogTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtDate" Name="LogDate" PropertyName="Text" Type="DateTime" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>

