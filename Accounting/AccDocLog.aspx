<%@ Page Language="VB"  MasterPageFile="~/Accounting/masterAccounting.master" 
    AutoEventWireup="false" CodeFile="AccDocLog.aspx.vb" Inherits="Accounting_AccDocLog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Accounting Document Log
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AccountContent" runat="Server">
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lbDetails" runat="server" Text="Document Operations Log" SkinID="skGridLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder" valign="top">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="dsLog" SkinID="skGridView">
                        <Columns>
                            <asp:BoundField DataField="LogDate" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" 
                                HeaderText="LogDate" SortExpression="LogDate">
                            <ItemStyle Width="130px" Font-Size="X-Small"/>
                            <HeaderStyle Font-Size="X-Small" />
                            </asp:BoundField>
                            <asp:BoundField DataField="UserName" HeaderText="UserName" 
                                SortExpression="UserName">
                            <ItemStyle Width="100px" Font-Size="X-Small" />
                            <HeaderStyle Font-Size="X-Small" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ObjEvent" HeaderText="ObjEvent" 
                                SortExpression="ObjEvent">
                            <ItemStyle Width="100px" Font-Size="X-Small" />
                            <HeaderStyle Font-Size="X-Small" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ObjEventState" HeaderText="ObjEventState" 
                                SortExpression="ObjEventState">
                            <ItemStyle Width="100px" Font-Size="X-Small" />
                            <HeaderStyle Font-Size="X-Small" />
                            </asp:BoundField>
                            <asp:BoundField DataField="LogMess" HeaderText="LogMess" 
                                SortExpression="LogMess">
                            <ItemStyle Width="550px" Font-Size="X-Small" />
                            <HeaderStyle Font-Size="X-Small" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="dsLog" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                        TypeName="LogReportsTableAdapters.AccDocumentLogTableAdapter">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" 
                                Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>




    </div>
</asp:Content>
