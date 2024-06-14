<%@ Page Language="VB" MasterPageFile="~/Maintenance/SihotRes/ResSihot.master" AutoEventWireup="false" 
    CodeFile="ResImport.aspx.vb" Inherits="Maintenance_SihotRes_ResImport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Reservation Import
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" Runat="Server">
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lbServiceLog" runat="server" Text="Import Queue" SkinID="skGridLabel" ToolTip="Reservation files that are not imported on last import process run." />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvImported" runat="server" DataSourceID="dsImported" DataKeyNames="importUID"
                        SkinID="skGridView" AutoGenerateColumns="False" 
                        EnableModelValidation="True">
                        <RowStyle Wrap="False" />
                        <Columns>
                            <asp:BoundField DataField="importUID" ReadOnly="True" Visible="False" />
                            <asp:BoundField DataField="importState" ReadOnly="True" Visible="False" />
                            <asp:BoundField DataField="filePath" ReadOnly="True" Visible="False" />
                            <asp:BoundField DataField="fileID" ReadOnly="True" Visible="False" />
                            <asp:TemplateField HeaderText="Hotel Code">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("hotelCode") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("hotelCode") %>' style="color: Red; text-decoration: line-through;" />
                                </EditItemTemplate>
                                <ItemStyle Width="80px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="File Date">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("fileDate", "{0:d}") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("fileDate", "{0:d}") %>' style="color: Red;text-decoration: line-through;" />
                                </EditItemTemplate>
                                <ItemStyle Width="90px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Last Checked">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("lastChecked") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("lastChecked") %>' style="color: Red; text-decoration: line-through;" />
                                </EditItemTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="File">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("fileExpected") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("fileExpected") %>' style="color: Red; text-decoration: line-through;" />
                                </EditItemTemplate>
                                <ItemStyle Width="400px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Cancel" >
                                <ItemTemplate>
                                    <asp:ImageButton ID="ibEdit" runat="server" CausesValidation="False" 
                                        CommandName="Edit" ImageUrl="~/Images/cancel_big.gif"
                                        OnClientClick="return confirm('Canceling import can cause invoice not been generated.');" 
                                        ToolTip="Cancel import" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:ImageButton ID="ibUpdate" runat="server" CausesValidation="True" 
                                        CommandName="CancelImport" ImageUrl="~/Images/accept_red.png"  
                                        CommandArgument='<%# Eval("importUID") %>'
                                        OnClientClick="return confirm('Are you sure you want to cancel this import?');"
                                        ToolTip="Proceed with cancelation" />
                                    <asp:ImageButton ID="ibCancel" runat="server" CausesValidation="False" 
                                        CommandName="Cancel" ImageUrl="~/Images/delete_green.png" 
                                        ToolTip="Revoke cancelation" />
                                </EditItemTemplate>
                                <ControlStyle CssClass="ImgButton" />
                                <ItemStyle Width="80px" />
                            </asp:TemplateField>
                            <%--<asp:TemplateField HeaderText="Import" >
                                <ItemTemplate>
                                    <asp:ImageButton ID="ibImport" runat="server" CausesValidation="False" 
                                        CommandName="Import" ImageUrl="~/Images/ArtDown.gif"
                                        CommandArgument='<%# Eval("importUID") %>'
                                        OnClientClick="return confirm('Import this file?');" 
                                        ToolTip="Import selected reservation file." />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    &nbsp;
                                </EditItemTemplate>
                                <ControlStyle CssClass="ImgButton" />
                                <ItemStyle Width="45px" HorizontalAlign="Center" />
                            </asp:TemplateField>--%>
                        </Columns>
                        <EmptyDataTemplate>
                            <div style="width: 760px; height: 30px;" >
                                All reservation files are imported.
                            </div> 
                        </EmptyDataTemplate>
                    </asp:GridView>
                    <%--<div style="text-align: right; padding-top: 5px;">
                        <asp:Button ID="btImportAll" runat="server" Text="Import All" SkinID="skBtnBase" 
                            OnClientClick="return confirm('Import all files from queue?');" 
                            ToolTip="Import all files from import queue." />
                    </div>--%> 
                </td>
            </tr>
        </table>
        <br />
        <%--<table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="Label5" runat="server" Text="Import From File" SkinID="skGridLabel" ToolTip="Import reservation file." />
                </td>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 857px;">
                    <asp:FileUpload ID="FileImport" runat="server" CssClass="TextBox" Width="854px" />
                    <br />
                    <asp:ListBox ID="lbImport" runat="server" CssClass="TextBox" Width="855px" Visible="false" Rows="10" />
                    <div style="text-align: right; padding-top: 5px; width: 855px;">
                        <asp:Button ID="btImportFile" runat="server" Text="Import File" SkinID="skBtnBase" 
                            OnClientClick="return confirm('Import selected file?');" />
                        <asp:Button ID="btDone" runat="server" Text="Done" SkinID="skBtnBase" Visible="false" />
                    </div> 
                </td>
            </tr>
        </table>--%>
        <asp:HyperLink ID="hlHistory" runat="server" NavigateUrl="ResHistoryImport.aspx">Historical Import</asp:HyperLink>
    </div>
    <asp:ObjectDataSource ID="dsImported" runat="server" OldValuesParameterFormatString="original_{0}"
        TypeName="dsSIHOTTableAdapters.ResQueueTableAdapter" 
        SelectMethod="GetForImport" >
    </asp:ObjectDataSource>
                
    <asp:HiddenField ID="dummy" runat="server" />
    <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
        PopupDragHandleControlID="popLabel" CancelControlID="btnYes" DropShadow="True"
        BackgroundCssClass="modalBackground" TargetControlID="dummy" X="200" Y="200">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popPanel" runat="server" Width="300px" BackColor="White" Style="display: none">
        <table cellpadding="0" cellspacing="0" style="width: 100%;">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="popLabel" runat="server" Text="Title" SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <p style="text-align: center;">
                        <asp:Label ID="popMessage" runat="server" Text="Message" />
                    </p>
                    <p style="text-align: right;" class="GridRow1T"><br />
                        <asp:Button ID="btnYes" runat="server" Text="OK" SkinID="skBtnBase" />&nbsp;
                    </p>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

