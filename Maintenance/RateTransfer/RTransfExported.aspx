<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/RateTransfer/masterRtTransf.master" AutoEventWireup="false" CodeFile="RTransfExported.aspx.vb" Inherits="Maintenance_RateTransfer_RTransfExported" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Exported Rate Files
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ProFormaContent" runat="Server">
    <br />
    <div class="Blue">
        <asp:Panel ID="pnlRooms" runat="server">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td class="GridLabelBG">
                        <asp:Label ID="lblInSection" runat="server" Text="Exported files" SkinID="skGridLabel" />
                    </td>
                </tr>
                <tr>
                    <td class="GridBorder">
                        <asp:GridView ID="gvTransf" runat="server" SkinID="skGridView" AutoGenerateColumns="False"
                            DataSourceID="dsExported" DataKeyNames="Export_UID" AllowPaging="True" 
                            PageSize="20">
                            <Columns>
                                <asp:BoundField DataField="Export_UID" HeaderText="Export_UID" ReadOnly="True" 
                                    SortExpression="Export_UID" Visible="False" />
                                <asp:BoundField DataField="HotelEHID" HeaderText="Hotel" 
                                    SortExpression="HotelEHID">
                                    <ItemStyle Width="80px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ExportDate" DataFormatString="{0:d}" 
                                    HeaderText="Date" SortExpression="ExportDate">
                                    <ItemStyle Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ExportOrd" HeaderText="Ord" 
                                    SortExpression="ExportOrd">
                                    <ItemStyle Width="50px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ExportFile" HeaderText="Export File" 
                                    SortExpression="ExportFile">
                                    <ItemStyle Width="300px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note" >
                                    <ItemStyle Width="300px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Respond" HeaderText="Respond" 
                                    SortExpression="Respond">
                                    <ItemStyle Width="50px" />
                                </asp:BoundField>
                            </Columns>
                            <EmptyDataTemplate>
                                <div style="width: 480px;">
                                Nothing has been exported.
                                </div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <br />
        <asp:HiddenField ID="dummy" runat="server" />
        <asp:ObjectDataSource ID="dsExported" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetExported" 
            TypeName="dsRateTransferTableAdapters.smart_PMS_ExportTableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsHotel" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="dsRateTransferTableAdapters.smartHotelTableAdapter">
        </asp:ObjectDataSource>
        <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
            PopupDragHandleControlID="popLabel" CancelControlID="btnNo" DropShadow="True"
            BackgroundCssClass="modalBackground" TargetControlID="dummy" X="200" Y="200">
        </asp:ModalPopupExtender>
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
                        <p style="text-align: right;" class="GridRow2T">
                            <br />
                            <asp:Button ID="btnYes" runat="server" Text="Yes" SkinID="skBtnBase" />&nbsp;
                            <asp:Button ID="btnNo" runat="server" Text="No" SkinID="skBtnBase" />&nbsp;
                        </p>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
</asp:Content>

