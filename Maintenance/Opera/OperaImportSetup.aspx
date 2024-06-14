<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Opera/OperaRes.master" AutoEventWireup="false" 
    CodeFile="OperaImportSetup.aspx.vb" Inherits="Maintenance_Opera_OperaImportSetup"
    EnableEventValidation="false" %>

<%@ Register Src="~/App_UserControls/MessagePop.ascx" TagName="MessagePop" TagPrefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    OPERA Reservation Import Mappings
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" Runat="Server">
    <asp:UpdatePanel runat="server" ID="updPanel">
        <ContentTemplate>
            <div class="Blue">
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="GridLabelBG">
                            <asp:Label ID="lblCtrTitle" runat="server" Text="Hotel Mappings" SkinID="skGridLabel"/>
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder">
                            <%--<asp:Label ID="Label1" runat="server" Text="OPERA Hotels" SkinID="skGridLabel" style="padding: 0px;" />--%>
                            <asp:GridView ID="gvHotels" runat="server" SkinID="skGridView" DataSourceID="dsHotels" 
                                EnableModelValidation="True" AutoGenerateColumns="False" 
                                DataKeyNames="OhipHotelId" SelectedIndex="0" >
                                <Columns>
                                    <asp:CommandField SelectImageUrl="~/Images/select_.gif" ShowCancelButton="False"
                                        ShowSelectButton="True" ButtonType="Image">
                                        <ItemStyle Width="80px" />
                                    </asp:CommandField>
                                    <asp:BoundField DataField="OhipHotelId" HeaderText="Code" ReadOnly="True" SortExpression="OhipHotelId" >
                                    <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="OhipHotelName" HeaderText="Name" SortExpression="OhipHotelName" >
                                    <ItemStyle Width="450px" />
                                    </asp:BoundField>
                                    <asp:CheckBoxField DataField="Enabled" HeaderText="Enabled" SortExpression="Enabled" >
                                    <ItemStyle Width="50px" HorizontalAlign="Center" />
                                    </asp:CheckBoxField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <b>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                                CommandName="Enable" Text="Enable" Visible='<%# Not Eval("Enabled")%>' 
                                                CommandArgument='<%# Eval("OhipHotelId")%>' />
                                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                                CommandName="Dissable" Text="Dissable" Visible='<%# Eval("Enabled")%>'
                                                OnClientClick="confirm('Are you sure you want to dissable reservation import for this hotel?')"
                                                CommandArgument='<%# Eval("OhipHotelId")%>' ForeColor="Red" />
                                            </b>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" Width="100px" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:ObjectDataSource ID="dsHotels" runat="server"
                                TypeName="dsOperaTableAdapters.OperaHotelTableAdapter"
                                SelectMethod="GetData"
                                UpdateMethod="UpdateQuery" 
                                InsertMethod="InsertQuery"
                                OldValuesParameterFormatString="original_{0}">
                                <InsertParameters>
                                    <asp:Parameter Name="OhipHotelId" Type="String" />
                                    <asp:Parameter Name="OhipHotelName" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="OhipHotelName" Type="String" />
                                    <asp:Parameter Name="Enabled" Type="Boolean" />
                                    <asp:Parameter Name="OhipHotelId" Type="String" />
                                </UpdateParameters>
                                </asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr><td>&nbsp;</td></tr>
                    <tr>
                        <td class="GridLabelBG">
                            <asp:Label ID="Label2" runat="server" Text="Hotel Room Mappings" SkinID="skGridLabel" /> <%-- style="padding: 10px 0px 0px 0px;" />--%>
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder">
                            <asp:GridView ID="gvHotelRooms" runat="server" SkinID="skGridView" DataSourceID="dsRooms" 
                                EnableModelValidation="True" AutoGenerateColumns="False" 
                                DataKeyNames="OhipHotelId,RoomClass,RoomType">
                                <Columns>
                                    <asp:BoundField DataField="OhipHotelId" HeaderText="OhipHotelId" ReadOnly="True" SortExpression="OhipHotelId" Visible="False" />
                                    <asp:BoundField DataField="RoomClass" HeaderText="Room Class" ReadOnly="True" SortExpression="RoomClass">
                                    <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="RoomType" HeaderText="Room Type" ReadOnly="True" SortExpression="RoomType">
                                    <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="RoomName" HeaderText="Room Name" SortExpression="RoomName" ReadOnly="True">
                                    <ItemStyle Width="200px" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Hotel" SortExpression="SmartHotelId">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlSmartHotelId" runat="server" CssClass="TextBox" 
                                                SelectedValue='<%# Bind("SmartHotelId")%>' />                                    
                                            <asp:CascadingDropDown ID="exSmartHotelId" runat="server" 
                                                TargetControlID="ddlSmartHotelId" 
                                                Category="HotelId" 
                                                ServicePath="~/HotelRooms.asmx"
                                                ServiceMethod="GetHotel"
                                                SelectedValue='<%# Eval("SmartHotelId")%>' >
                                            </asp:CascadingDropDown>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <%--<asp:Label ID="Label1" runat="server" Text='<%# Bind("SmartHotelId") %>'></asp:Label>--%>
                                            <asp:DropDownList ID="ddlSmartHotelId" runat="server" CssClass="TextBox" Enabled="false"/>                                    
                                            <asp:CascadingDropDown ID="exSmartHotelId" runat="server" 
                                                TargetControlID="ddlSmartHotelId" 
                                                Category="HotelId" 
                                                ServicePath="~/HotelRooms.asmx"
                                                ServiceMethod="GetHotel"
                                                SelectedValue='<%# Eval("SmartHotelId")%>' >
                                            </asp:CascadingDropDown>
                                        </ItemTemplate>
                                        <ItemStyle Width="250px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Room Type" SortExpression="SmartRoomTypeId">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlSmartRoomTypeId" runat="server" CssClass="TextBox" 
                                                SelectedValue='<%# Bind("SmartRoomTypeId")%>'/>                                    
                                            <asp:CascadingDropDown ID="exSmartRoomTypeId" runat="server" 
                                                TargetControlID="ddlSmartRoomTypeId" 
                                                ParentControlID="ddlSmartHotelId"
                                                Category="RoomTypeId" 
                                                ServicePath="~/HotelRooms.asmx"
                                                ServiceMethod="GetHotelRooms" 
                                                SelectedValue='<%# Eval("SmartRoomTypeId")%>' >
                                            </asp:CascadingDropDown>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <%--<asp:Label ID="Label2" runat="server" Text='<%# Bind("SmartRoomTypeId") %>'></asp:Label>--%>
                                            <asp:DropDownList ID="ddlSmartRoomTypeId" runat="server" CssClass="TextBox" Enabled="false" />                                    
                                            <asp:CascadingDropDown ID="exSmartRoomTypeId" runat="server" 
                                                TargetControlID="ddlSmartRoomTypeId" 
                                                ParentControlID="ddlSmartHotelId"
                                                Category="RoomTypeId" 
                                                ServicePath="~/HotelRooms.asmx"
                                                ServiceMethod="GetHotelRooms" 
                                                SelectedValue='<%# Eval("SmartRoomTypeId")%>' >
                                            </asp:CascadingDropDown>
                                        </ItemTemplate>
                                        <ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:ImageButton ID="ibUpdate" runat="server" CausesValidation="True"
                                                CommandName="Update" CommandArgument='<%# Eval("RoomClass") & ", " & Eval("RoomType")%>'
                                                ImageUrl="~/Images/accept_inline.gif" />&nbsp;
                                            <asp:ImageButton ID="ibCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                                ImageUrl="~/Images/decline_inline.gif" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ibDelete" runat="server" CausesValidation="False" ToolTip="Remove mapping" 
                                                CommandName="Delete" CommandArgument='<%# Eval("RoomClass") & "," & Eval("RoomType")%>'
                                                OnClientClick="confirm('Are you sure you want to remove mapping?')"
                                                ImageUrl="~/Images/delete_inline.gif" 
                                                Visible='<%# Eval("SmartRoomTypeId") IsNot DBNull.Value%>' />&nbsp;
                                            <asp:ImageButton ID="ibAdd" runat="server" CausesValidation="False" ToolTip="Add mapping" 
                                                CommandName="Edit" CommandArgument='<%# Eval("RoomClass") & "," & Eval("RoomType")%>'
                                                ImageUrl="~/Images/write_big.gif" 
                                                Visible='<%# Eval("SmartRoomTypeId") Is DBNull.Value%>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="70px" HorizontalAlign="Right" />
                                        <ControlStyle CssClass="ImgButton" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:ObjectDataSource ID="dsRooms" runat="server" TypeName="dsOperaTableAdapters.OperaHotelRoomTableAdapter"
                                SelectMethod="GetDataBy" OldValuesParameterFormatString="{0}" UpdateMethod="UpdateQuery" DeleteMethod="RemoveMapping" >
                                <DeleteParameters>
                                    <asp:Parameter Name="OhipHotelId" Type="String" />
                                    <asp:Parameter Name="RoomClass" Type="String" />
                                    <asp:Parameter Name="RoomType" Type="String" />
                                </DeleteParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="gvHotels" Name="OhipHotelId" PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="SmartHotelId" Type="Int32" />
                                    <asp:Parameter Name="SmartRoomTypeId" Type="String" />
                                    <asp:Parameter Name="OhipHotelId" Type="String" />
                                    <asp:Parameter Name="RoomClass" Type="String" />
                                    <asp:Parameter Name="RoomType" Type="String" />
                                </UpdateParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

