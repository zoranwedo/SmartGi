<%@ Page Language="VB" MasterPageFile="~/Maintenance/Reservations/masterRes.master" AutoEventWireup="false" 
	CodeFile="ReservationImport.aspx.vb" Inherits="Maintenance_Reservations_ReservationImport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Reservations Import
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ResContent" Runat="Server">
    <asp:UpdatePanel runat="server" ID="updPanel" >
        <ContentTemplate>
            <asp:HiddenField ID="dummy" runat="server" />
            <div class="Blue">
                <br />
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="GridLabelBG" style="width: 600px;">
                            <asp:Label ID="lblCtrTitle" runat="server" Text="Import List" SkinID="skGridLabel" />
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder">
                            <asp:GridView ID="gvDTSLog" runat="server" AutoGenerateColumns="False" DataSourceID="dsImportList"
                                SkinID="skGridView" DataKeyNames="import_uid">
                                <Columns>
                                    <asp:BoundField DataField="hotel" HeaderText="Hotel (mapping)" SortExpression="hotel">
                                        <ItemStyle Width="100px" HorizontalAlign="Center" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="date_txt" HeaderText="Booking File Date" SortExpression="date_txt"
                                        DataFormatString="{0:d}">
                                        <ItemStyle Width="100px" HorizontalAlign="Center" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Import File" SortExpression="filename">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPath" runat="server" Text='<%# Bind("filename") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="400px" />
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    There are no reservation files in import queue.
                                </EmptyDataTemplate>
                            </asp:GridView>
                            <asp:ObjectDataSource ID="dsImportList" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="dsDTSTableAdapters.dtsImportListTableAdapter">
                           </asp:ObjectDataSource>
                            <asp:Panel ID="popImport" runat="server" BackColor="White" Visible="false">
                                        <div class="Red" style="padding-top: 5px; width: 100%;" >
                                            <asp:Label ID="lblImportRep" runat="server" Text="Importing" />
                                        </div>
                                        <div style="padding-top: 5px; vertical-align: top; text-align: right;">
                                            <asp:Button ID="btnOK" runat="server" Text="OK" SkinID="skBtnBase" />
                                        </div>
                            </asp:Panel>
                        </td>
                    </tr>
                    <asp:Panel ID="popImportQueue" runat="server">
                    <tr>
                        <td class="GridRowClear" style="height: 30px; padding-top: 5px; vertical-align: top; text-align: right;">
                            <asp:Button ID="btnImportQueue" runat="server" Text="Import" SkinID="skBtnBase"
                                OnClientClick="this.disabled = true; this.value = 'Import in progress...';" 
                                UseSubmitBehavior="false" />
                        </td>
                    </tr>
                    </asp:Panel>
                </table>
                <asp:UpdateProgress ID="upImporting" runat="server">
                    <ProgressTemplate>
                        <asp:AlwaysVisibleControlExtender ID="ace" runat="server" TargetControlID="popImporting"
                            VerticalOffset="210" HorizontalOffset="30" />
                        <asp:Panel ID="popImporting" runat="server" BackColor="White">
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="width: 550px; height: 50px; padding-left: 10px; vertical-align: middle;">
                                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/status_anim.gif" />
                                        &nbsp;Importing...
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

