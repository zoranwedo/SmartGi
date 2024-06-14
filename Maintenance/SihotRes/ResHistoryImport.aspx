<%@ Page Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" CodeFile="ResHistoryImport.aspx.vb" Inherits="Maintenance_SihotRes_ResHistoryImport"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Historical SIHOT Reservation Import
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" Runat="Server">
    <div class="Blue">
        <table cellpadding="0" cellspacing="0" style="width: 100%;">
            <tr>
                <td class="LocalMenuRow" >
                    <asp:HyperLink ID="hlHistory" runat="server" SkinID="skHypLink" NavigateUrl="ResImport.aspx">&lt;&lt; Back to Reservation Import</asp:HyperLink>
                </td>
                <td class="LocalMenuRow" >&nbsp;</td>
            </tr>
        </table>
        <br />
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblImport" runat="server" Text="Import From File" SkinID="skGridLabel" ToolTip="Import reservation file." />
                </td>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 1000px;">
                    <asp:HiddenField ID="hfStep" runat="server" Value="0" />
                    <asp:HiddenField ID="hfFile" runat="server" />
                    <asp:HiddenField ID="hfFileUpload" runat="server" />
                    <asp:FileUpload ID="FileImport" runat="server" CssClass="TextBox" />
                    <asp:Label ID="lblPrompt" runat="server" Text="" />
                    <asp:GridView ID="gvImport" runat="server" Visible="False" SkinID="skGridView" >
                        <Columns>
                            <asp:BoundField DataField="ResID" HeaderText="ResID" SortExpression="ResID">
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PreInvID" HeaderText="PreInvID" 
                                SortExpression="PreInvID">
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FolioFull" HeaderText="FolioFull" 
                                SortExpression="FolioFull">
                                <ItemStyle Width="200px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Amount" DataFormatString="{0:N2}" 
                                HeaderText="Amount" SortExpression="Amount">
                                <ItemStyle Width="200px" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                    <div style="text-align: right; padding-top: 5px; width: 1000px;">
                        <asp:Button ID="btCancel" runat="server" Text="Cancel" SkinID="skBtnBase" Visible="false" />
                        &nbsp;
                        <asp:Button ID="btImportFile" runat="server" Text="Import File" SkinID="skBtnBase" />
                    </div> 
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

