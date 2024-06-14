<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/SihotMap/MapSihot.master" AutoEventWireup="false"
    CodeFile="MapRoom.aspx.vb" Inherits="Maintenance_SihotMap_MapRoom" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    SIHOT Room Type Mapping
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" runat="Server">
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
                            <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />&nbsp; 
                        </asp:Label>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px;">
                    <asp:Panel ID="pnSearch" runat="server" CssClass="popupPanel" DefaultButton="btnFilter">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="GridRowClear" style="width: 100px;">
                                    Room Type
                                </td>
                                <td class="GridRowClear" style="width: 500px;" colspan="2">
                                    <asp:TextBox ID="fltName" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="fltNameExt" runat="server" TargetControlID="fltName"
                                        WatermarkCssClass="WaterMark" WatermarkText="Room type code or name (use % as wildchar)" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="ComandRow2T" style="width: 200px; height: 30px; padding-top: 5px; text-align: left;">
                                    &nbsp;
                                </td> 
                                <td class="ComandRow2T" style="height: 30px; padding-top: 5px">
                                    <asp:Button ID="btnFilter" runat="server" SkinID="skBtnFilter" />&nbsp;
                                    <asp:Button ID="btnClear" runat="server" SkinID="skBtnClear" />
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
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lbRooms" runat="server" Text="Room Types" SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvRoomTypes" runat="server" DataSourceID="dsRoomTypes" DataKeyNames="RoomTypeID"
                        SkinID="skGridView" AutoGenerateColumns="False" 
                        EnableModelValidation="True" PageSize="20">
                        <RowStyle Wrap="False" Height="30px" />
                        <Columns>
                            <asp:TemplateField HeaderText="Room Type" >
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("RoomType") %>' />&nbsp;
                                </ItemTemplate>
                                <ItemStyle Width="355px" HorizontalAlign="Left"  />
                            </asp:TemplateField>
                            <asp:TemplateField >
                                <ItemTemplate>
                                    &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Eval("RoomTypeID") %>' />
                                </ItemTemplate>
                                <ItemStyle Width="50px" HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SIHOT:" >
                                <EditItemTemplate>
                                    <asp:ImageButton ID="ibEditA0" runat="server" CausesValidation="False" Enabled="false"
                                        ImageUrl="~/Images/right_one_red.png" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="ibEditA1" runat="server" CausesValidation="False" ToolTip="Add mapping" 
                                        CommandName="Edit"
                                        ImageUrl="~/Images/right_one_red.png"
                                        Visible='<%# Eval("CODE") Is DBNull.Value %>' />
                                    <asp:ImageButton ID="ibEditA2" runat="server" CausesValidation="False" Enabled="false"
                                        ImageUrl="~/Images/right_one_blue.png"
                                        Visible='<%# Eval("CODE") IsNot DBNull.Value %>' />
                                </ItemTemplate>
                                <ItemStyle Width="50px" />
                                <ControlStyle CssClass="ImgButton" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="CODE" >
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("CODE") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCODE" runat="server" Text='<%# Bind("CODE") %>' CssClass="TextBox" />
                                </EditItemTemplate>
                                <ItemStyle Width="100px" HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:ImageButton ID="ibUpdate" runat="server" CausesValidation="True"
                                        CommandName="AddMapping" CommandArgument='<%# Eval("RoomTypeID") %>'
                                        ImageUrl="~/Images/accept_inline.gif" Text="Update" />&nbsp;
                                    <asp:ImageButton ID="ibCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                        ImageUrl="~/Images/decline_inline.gif" Text="Cancel" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="ibDelete" runat="server" CausesValidation="False" ToolTip="Remove mapping" 
                                        CommandName="RemoveMapping" CommandArgument='<%# Eval("RoomTypeID") %>'
                                        OnClientClick="confirm('Are you sure you want to remove mapping?')"
                                        ImageUrl="~/Images/delete_inline.gif" Text="Split" 
                                        Visible='<%# Eval("CODE") IsNot DBNull.Value %>' />
                                </ItemTemplate>
                                <ItemStyle Width="50px" HorizontalAlign="Left" />
                                <ControlStyle CssClass="ImgButton" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
    <asp:ObjectDataSource ID="dsRoomTypes" runat="server" OldValuesParameterFormatString=""
        SelectMethod="Filter" TypeName="dsSIHOTTableAdapters.RoomTypeMapTableAdapter" >
        <SelectParameters>
            <asp:ControlParameter ControlID="fltName" Name="Name" PropertyName="Text" Type="String" />
        </SelectParameters>
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
