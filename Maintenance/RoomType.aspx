<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="RoomType.aspx.vb" Inherits="Maintenance_RoomType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" runat="Server">
    <div class="Blue">
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblRateType" runat="server" Text="Room Types" SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    
                            <asp:GridView ID="gridRoomTypes" runat="server" SkinID="skGridView" AutoGenerateColumns="False"
                                DataSourceID="dsRoomTypes" DataKeyNames="RoomTypeID">
                                <Columns>
                                    <asp:BoundField DataField="RoomTypeID" HeaderText="Code" ReadOnly="True" SortExpression="RoomTypeID">
                                        <ItemStyle Width="50px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="RoomType" HeaderText="Type" SortExpression="RoomType">
                                        <ControlStyle CssClass="TextBox" />
                                        <ItemStyle Width="300px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description">
                                        <ControlStyle CssClass="TextBox" />
                                        <ItemStyle Width="350px" />
                                    </asp:BoundField>
                                    <asp:CommandField ButtonType="Image" CancelImageUrl="~/Images/decline_inline.gif"
                                        EditImageUrl="~/Images/edit_inline.gif" ShowEditButton="True" UpdateImageUrl="~/Images/accept_inline.gif">
                                        <ControlStyle CssClass="ImgButton" />
                                        <ItemStyle Width="50px" />
                                    </asp:CommandField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Delete"
                                                ImageUrl="~/Images/delete_inline.gif" OnClientClick="return confirm('Are you sure you want to delete the record')"
                                                Text="Delete" />
                                        </ItemTemplate>
                                        <ControlStyle CssClass="ImgButton" />
                                        <ItemStyle Width="25px" />
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:GridView>
                            <asp:ObjectDataSource ID="dsRoomTypes" runat="server" DeleteMethod="Delete" 
                                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                                SelectMethod="GetData" 
                                TypeName="dsMaintBasicTableAdapters.RoomTypeTableAdapter" UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_RoomTypeID" Type="String" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="RoomType" Type="String" />
                                    <asp:Parameter Name="Description" Type="String" />
                                    <asp:Parameter Name="Original_RoomTypeID" Type="String" />
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="RoomTypeID" Type="String" />
                                    <asp:Parameter Name="RoomType" Type="String" />
                                    <asp:Parameter Name="Description" Type="String" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                            <asp:FormView ID="newRateType" runat="server" DataKeyNames="RoomTypeID" DataSourceID="dsRoomTypes">
                                <InsertItemTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                        <tr class="GridRow1T">
                                            <td style="width: 50px; height: 30px;">
                                                <asp:TextBox ID="roomTypeIDTextBox" runat="server" CssClass="TextBox" MaxLength="4"
                                                    Text='<%# Bind("RoomTypeID") %>' Width="45px" />
                                                <asp:RequiredFieldValidator ID="reqRateID" runat="server" ControlToValidate="roomTypeIDTextBox"
                                                    Display="None" ErrorMessage="This is required field!" />
                                                <asp:ValidatorCalloutExtender ID="reqRateIDExt" runat="server" HighlightCssClass="WaterMark"
                                                    TargetControlID="reqRateID" />
                                            </td>
                                            <td style="width: 300px;">
                                                <asp:TextBox ID="RoomTypeTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("RoomType") %>' />
                                            </td>
                                            <td style="width: 350px;">
                                                <asp:TextBox ID="DescriptionTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Description") %>' />
                                            </td>
                                            <td style="width: 75px; padding-left: 5px;">
                                                <asp:ImageButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                                    ImageUrl="~/Images/accept_inline.gif" CssClass="ImgButton" />
                                                <asp:ImageButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                                    CommandName="Cancel" ImageUrl="~/Images/decline_inline.gif" CssClass="ImgButton" />
                                            </td>
                                        </tr>
                                    </table>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                        <tr class="GridRow1T">
                                            <td style="width: 700px; height: 30px;">
                                                &nbsp;
                                            </td>
                                            <td style="width: 75px; padding-left: 5px;">
                                                <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />
                                            </td>
                                        </tr>
                                </ItemTemplate>
                                <EmptyDataTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                        <tr class="GridRow1T">
                                            <td style="width: 700px; height: 30px;">
                                                &nbsp;
                                            </td>
                                            <td style="width: 75px; padding-left: 5px;">
                                                <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />
                                            </td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                            </asp:FormView>
                       
                </td>
            </tr>
        </table>
    
 <asp:HiddenField ID="dummy" runat="server" />
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
 </ContentTemplate>
                    </asp:UpdatePanel>
                    </div>
</asp:Content>
