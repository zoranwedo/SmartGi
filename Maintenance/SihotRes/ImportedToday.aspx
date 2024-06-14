<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/SihotRes/ResSihot.master" AutoEventWireup="false" 
    CodeFile="ImportedToday.aspx.vb" Inherits="Maintenance_SihotRes_ImportedToday" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Today's Reservation Import
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" Runat="Server">
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblToday" runat="server" SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:DataList ID="dlToday" runat="server" DataSourceID="dsImported">
                        <HeaderTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <th class="GridRow2B" style="width: 50px;" rowspan="2">Hotel<br />Code</th>
                                    <th class="GridRow2B" style="width: 80px;" rowspan="2">File Date</th>
                                    <th class="GridRow2B" style="width: 80px;" rowspan="2">Status</th>
                                    <th class="GridRow2B" style="width: 560px;" rowspan="2">File Name</th>
                                    <th class="GridRow2B" style="width: 140px;" rowspan="2">On</th>
                                    <th class="GridRow1B" style="width: 160px; min-width: 145px;">Result</th>
                                    <th class="GridRow1B" colspan="3" >&nbsp;</th>
                                </tr>
                                <tr>
                                    <th class="GridRow2B">&nbsp;</th>
                                    <th class="GridRow2B" style="width: 100px;">
                                        <asp:Label ID="head_procRes" runat="server" Text="Reservations" ToolTip="Processed Reservations" />
                                    </th>
                                    <th class="GridRow2B" style="width: 100px;">
                                        <asp:Label ID="head_procInv" runat="server" Text="Invoices" ToolTip="Created Invoices" />
                                    </th>
                                    <th class="GridRow2B" style="width: 100px;">
                                        <asp:Label ID="head_procInvRes" runat="server" Text="Invoiced" ToolTip="Invoiced Reservations" />
                                    </th>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                                <tr style="height: 25px;">
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:Label ID="pend_hotelCode" runat="server" Text='<%# Eval("hotelCode") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:Label ID="pend_fileDate" runat="server" Text='<%# Eval("fileDate","{0:d}") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center; font-style: italic;" >
                                        <asp:Label ID="done_importState" runat="server" Text="imported" Visible='<%# Eval("importState")=1 %>' Font-Bold="true" />
                                        <asp:Label ID="pend_importState" runat="server" Text="pending" Visible='<%# Eval("importState")=0 %>' Font-Bold="true" ForeColor="Red" />
                                        <asp:Label ID="canc_importState" runat="server" Text="cancelled" Visible='<%# Eval("importState")=-1 %>' ForeColor="DarkRed" />
                                    </td>
                                    <td class="GridRow1B" style="text-align: left;" >
                                        <asp:Label ID="done_importName" runat="server" Text='<%# Eval("importName") %>' ToolTip='<%# Eval("fileID","fileID={0} ") & Eval("fileTimeStamp","with timestamp {0}") %>' 
                                            Visible='<%# Eval("importState")=1 %>' Font-Bold="true" />
                                        <asp:Label ID="pend_importName" runat="server" Text='<%# Eval("importName") %>' ToolTip='<%# Eval("fileID","fileID={0} ") & Eval("fileTimeStamp","with timestamp {0}") %>' 
                                            Visible='<%# Eval("importState")=0 %>' ForeColor="Red" />
                                        <asp:Label ID="canc_importName" runat="server" Text='<%# Eval("importName") %>' ToolTip='<%# Eval("fileID","fileID={0} ") & Eval("fileTimeStamp","with timestamp {0}") %>' 
                                            Visible='<%# Eval("importState")=-1 %>' ForeColor="DarkRed" />
                                    </td>
                                    <td class="GridRow1B" style="text-align: left;" >
                                        <asp:Label ID="pend_importTime" runat="server" Text='<%# Eval("importTime") %>' />
                                    </td>
                                <asp:Panel ID="pnlPending" runat="server" Visible='<%# Eval("importState")<1 %>' >
                                    <td class="GridRow1B" style="text-align: left; font-style: italic;" colspan="4" >
                                        <asp:Label ID="pend_procResult" runat="server" Text='<%# Eval("procResult") %>' />
                                        <asp:Label ID="pend_NotRun" runat="server" Text="Import not tried yet." Visible='<%# Eval("procResult") Is DBNull.Value %>' Font-Italic="true" />
                                    </td>
                                </asp:Panel>
                                <asp:Panel ID="pnlDone" runat="server" Visible='<%# Eval("importState")=1 %>'>
                                    <td class="GridRow1B" style="text-align: left; font-style: italic; min-width: 145px;" >
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("procResult") %>' Font-Bold="true" />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:Label ID="done_procRes" runat="server" Text='<%# Eval("procRes") %>' ToolTip='<%# Eval("procPre","Preinvoices: {0}") %>' Font-Bold="true" />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:Label ID="done_procInv" runat="server" Text='<%# Eval("procInv") +  Eval("procNoSh") %>' ToolTip='<%# Eval("procNoSh","{0} of them No-Show") %>' Font-Bold="true" />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:Label ID="done_procInvRes" runat="server" Text='<%# Eval("procInvRes") %>' Font-Bold="true" />
                                    </td>
                                </asp:Panel>
                                </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                                <tr style="height: 30px;">
                                    <td colspan="3">&nbsp;</td>
                                    <td colspan="6" style="font-weight: bold; font-style: italic;">
                                        <asp:Label ID="footerLabel" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </FooterTemplate>
                    </asp:DataList>
                </td>
            </tr>
        </table>
    </div>
    <asp:ObjectDataSource ID="dsImported" runat="server" OldValuesParameterFormatString="original_{0}"
        TypeName="dsResImportTableAdapters.ImportTodayTableAdapter" 
        SelectMethod="GetData" >
    </asp:ObjectDataSource>
</asp:Content>

