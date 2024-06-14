<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/SihotRes/ResSihot.master" AutoEventWireup="false" CodeFile="PendingToday.aspx.vb" Inherits="Maintenance_SihotRes_PendingToday" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Reservation Import Pending
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" Runat="Server">
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblToday" runat="server" Text="File Pending For Import" SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvImported" runat="server" DataSourceID="dsImported" DataKeyNames="importUID"
                        SkinID="skGridView" AutoGenerateColumns="False" EnableModelValidation="True">
                        <RowStyle Height="27px" />
                        <Columns>
                            <asp:TemplateField HeaderText="Hotel Code">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("hotelCode") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("hotelCode") %>' style="color: Red; text-decoration: line-through;" />
                                </EditItemTemplate>
                                <ItemStyle Width="50px" HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="File Date">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("fileDate", "{0:d}") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("fileDate", "{0:d}") %>' style="color: Red;text-decoration: line-through;" />
                                </EditItemTemplate>
                                <ItemStyle Width="80px" HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="File Name">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("filePath") & "\" & Eval("fileExpected") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("filePath") & "\" & Eval("fileExpected") %>' style="color: Red; text-decoration: line-through;" />
                                </EditItemTemplate>
                                <ItemStyle Width="560px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Last Checked">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("lastChecked") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("lastChecked") %>' style="color: Red; text-decoration: line-through;" />
                                </EditItemTemplate>
                                <ItemStyle Width="140px" HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Result">
                                <ItemTemplate>
                                    <asp:Label ID="pend_Result" runat="server" Text='<%# Eval("importResult") %>' Font-Italic="true" />
                                    <asp:Label ID="pend_NotRun" runat="server" Text="Import not tried yet." Visible='<%# Eval("importResult") Is DBNull.Value %>' Font-Italic="true" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="pend_Result" runat="server" Text='<%# Eval("importResult") %>' Font-Italic="true" style="color: Red; text-decoration: line-through;" />
                                    <asp:Label ID="pend_NotRun" runat="server" Text="Import not tried yet." Visible='<%# Eval("importResult") Is DBNull.Value %>' Font-Italic="true" style="color: Red; text-decoration: line-through;" />
                                </EditItemTemplate>
                                <ItemStyle Width="460px" />
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
                        </Columns>
                    </asp:GridView>
                    <div style="width: 1370px; font-style: italic; font-weight: bold; padding-top: 10px; padding-bottom: 5px;" >
                        <asp:Label ID="footerLabel" runat="server" style="padding-left:134px;" />
                    </div> 
                </td>
            </tr>
        </table>
         <br />
        <asp:HyperLink ID="hlHistory" runat="server" NavigateUrl="ResHistoryImport.aspx">Historical Import</asp:HyperLink>
   </div>
    <asp:ObjectDataSource ID="dsImported" runat="server" OldValuesParameterFormatString="original_{0}"
        TypeName="dsResImportTableAdapters.importQueueTableAdapter" 
        SelectMethod="GetData" >
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

