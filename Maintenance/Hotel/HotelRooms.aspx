<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Hotel/masterHotels.master"
    AutoEventWireup="false" CodeFile="HotelRooms.aspx.vb" Inherits="Maintenance_Hotel_HotelRooms" %>
   
   
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Hotel Room Types
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HotelContent" runat="Server">
    <div class="Blue">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="GridBorder">
                            <asp:GridView ID="gvRooms" runat="server" SkinID="skGridView" DataSourceID="dsHotelRoomType"
                                SelectedIndex="0" DataKeyNames="RoomTypeID,HotelId" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:CommandField SelectImageUrl="~/Images/select_.gif" ShowCancelButton="False"
                                        ShowSelectButton="True" ButtonType="Image">
                                        <ItemStyle Width="25px" />
                                    </asp:CommandField>
                                    <asp:BoundField DataField="RoomTypeId" HeaderText="Room" ReadOnly="True" SortExpression="RoomTypeId">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle Width="50px" />
                                    </asp:BoundField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemStyle Width="50px" />
                                        <ItemTemplate>
                                            <asp:ImageButton ID="Up" runat="server" Height="8px" ImageUrl="~/Images/up.gif" Width="10px"
                                                CommandName="CatUp" CommandArgument='<%# Eval("RoomTypeId") %>' />
                                            &nbsp;
                                            <asp:ImageButton ID="Dwn" runat="server" Height="8px" ImageUrl="~/Images/dwn.gif"
                                                Width="10px" CommandName="CatDwn" CommandArgument='<%# Eval("RoomTypeId") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField SortExpression="RoomType" HeaderText="Type">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle Width="350px" />
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtRoomType" runat="server" Text='<%# Bind("RoomType") %>' MaxLength="50"
                                                CssClass="TextBox" />
                                            <asp:RequiredFieldValidator ID="reqRoomType" runat="server" ControlToValidate="txtRoomType"
                                                SkinID="skRequired" />
                                            <asp:ValidatorCalloutExtender ID="extRoomType" runat="server" TargetControlID="reqRoomType"
                                                SkinID="skExtender" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblRoomType" runat="server" Text='<%# Bind("RoomType") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Beds" SortExpression="Beds">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle Width="60px" />
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtBeds" runat="server" Text='<%# Bind("Beds") %>' CssClass="TextBox" />
                                            <asp:CompareValidator ID="intBeds" runat="server" ControlToValidate="txtBeds" Operator="DataTypeCheck"
                                                Type="Integer" SkinID="skInteger" />
                                            <asp:ValidatorCalloutExtender ID="extBeds" runat="server" TargetControlID="intBeds"
                                                SkinID="skExtender" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblBeds" runat="server" Text='<%# Bind("Beds") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Rooms" SortExpression="TotalRooms">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle Width="60px" />
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtRooms" runat="server" Text='<%# Bind("TotalRooms") %>' CssClass="TextBox" />
                                            <asp:CompareValidator ID="intRooms" runat="server" ControlToValidate="txtRooms" Operator="DataTypeCheck"
                                                Type="Integer" SkinID="skInteger" />
                                            <asp:ValidatorCalloutExtender ID="extRooms" runat="server" TargetControlID="intRooms"
                                                SkinID="skExtender" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblRooms" runat="server" Text='<%# Bind("TotalRooms") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Note" HeaderText="Note" ReadOnly="False" SortExpression="Note">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle Width="300px" />
                                        <ControlStyle CssClass="TextBox" />
                                    </asp:BoundField>
                                    <asp:CheckBoxField DataField="Active" HeaderText="A" SortExpression="Active">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle Width="25px" HorizontalAlign="Left" />
                                    </asp:CheckBoxField>
                                    <asp:CommandField CancelImageUrl="~/Images/decline_inline.gif" ShowEditButton="True"
                                        ButtonType="Image" EditImageUrl="~/Images/edit_inline.gif" UpdateImageUrl="~/Images/accept_inline.gif">
                                        <ControlStyle CssClass="ImgButton" />
                                        <ItemStyle Width="50px" />
                                    </asp:CommandField>
                                    <asp:TemplateField InsertVisible="False" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="false" CommandName="Delete"
                                                ImageUrl="~/Images/delete_inline.gif" OnClientClick="return confirm('Are you sure you want to delete the record')" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            &nbsp;</EditItemTemplate>
                                        <ItemStyle Width="25px" />
                                    </asp:TemplateField>
                                </Columns>
                                <SelectedRowStyle CssClass="SelectRow1TB" />
                            </asp:GridView>
                            <asp:FormView ID="newHotelRoom" runat="server" DataKeyNames="RoomTypeId" DataSourceID="dsHotelRoomType">
                                <RowStyle HorizontalAlign="Right" />
                                <InsertItemTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                        <tr class="GridRow1T">
                                            <td style="width: 25px;">
                                                &nbsp
                                            </td>
                                            <td style="width: 50px;">
                                                <asp:TextBox ID="ddlRoomType" runat="server" Text='<%# Bind("RoomTypeID") %>' CssClass="TextBox"
                                                    ReadOnly="true" />
                                                <%--<asp:DropDownList ID="ddlRoomType" runat="server" DataSourceID="dsRoomTypes" 
                                            DataTextField="RoomTypeID" DataValueField="RoomTypeID" 
                                            SelectedValue='<%# Bind("RoomTypeID") %>'>
                                        </asp:DropDownList>--%>
                                                <asp:PopupControlExtender ID="PopupControlExtender1" runat="server" TargetControlID="ddlRoomType"
                                                    CommitProperty="Text" PopupControlID="gvPopRoom" OffsetX="-25" 
                                                    Position="Bottom">
                                                </asp:PopupControlExtender>
                                                <asp:RequiredFieldValidator ID="reqInsRoomTypeID" runat="server" ControlToValidate="ddlRoomType"
                                                    SkinID="skRequired" />
                                                <asp:ValidatorCalloutExtender ID="extInsRoomTypeID" runat="server" TargetControlID="reqInsRoomTypeID"
                                                    SkinID="skExtender" />
                                            </td>
                                            <td style="width: 50px;">
                                                &nbsp
                                            </td>
                                            <td style="width: 355px;">
                                                <asp:TextBox ID="txtInsRoomType" runat="server" Text='<%# Bind("RoomType") %>' MaxLength="50"
                                                    CssClass="TextBox" Enabled="False" />
                                            </td>
                                            <td style="width: 60px;">
                                                <asp:TextBox ID="txtInsBeds" runat="server" Text='<%# Bind("Beds") %>' CssClass="TextBox"
                                                    Width="55px" />
                                                <asp:CompareValidator ID="intInsBeds" runat="server" ControlToValidate="txtInsBeds"
                                                    Operator="DataTypeCheck" Type="Integer" SkinID="skInteger" />
                                                <asp:ValidatorCalloutExtender ID="extInsBeds" runat="server" TargetControlID="intInsBeds"
                                                    SkinID="skExtender" />
                                            </td>
                                            <td style="width: 60px;">
                                                <asp:TextBox ID="txtInsRooms" runat="server" Text='<%# Bind("TotalRooms") %>' CssClass="TextBox"
                                                    Width="55px" />
                                                <asp:CompareValidator ID="intInsRooms" runat="server" ControlToValidate="txtInsRooms"
                                                    Operator="DataTypeCheck" Type="Integer" SkinID="skInteger" />
                                                <asp:ValidatorCalloutExtender ID="extInsRooms" runat="server" TargetControlID="intInsRooms"
                                                    SkinID="skExtender" />
                                            </td>
                                            <td style="width: 305px;">
                                                <asp:TextBox ID="NoteTextBox" runat="server" Text='<%# Bind("Note") %>' CssClass="TextBox" />
                                            </td>
                                            <td style="width: 25px;">
                                                <asp:CheckBox ID="cbActive" runat="server" Checked='<%# Bind("Active") %>' />
                                            </td>
                                            <td style="width: 75px; text-align: left;">
                                                <asp:ImageButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                                    ImageUrl="~/Images/accept_inline.gif" CssClass="ImgButton" />
                                                <asp:ImageButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                                    CommandName="Cancel" ImageUrl="~/Images/decline_inline.gif" CssClass="ImgButton" />
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:GridView ID="gvPopRoom" runat="server" DataSourceID="dsRoomTypes" AutoGenerateColumns="False"
                                        ShowHeader="False" DataKeyNames="RoomTypeID" BackColor="White" CssClass="GridBorder"
                                        GridLines="None" OnSelectedIndexChanged="gvPopRoom_SelectedIndexChanged">
                                        <RowStyle CssClass="GridRowClear" HorizontalAlign="Left" />
                                        <SelectedRowStyle CssClass="SelectRowClear" />
                                        <Columns>
                                            <asp:CommandField SelectImageUrl="~/Images/select_.gif" ShowCancelButton="False"
                                                ShowSelectButton="True" ButtonType="Image">
                                                <ItemStyle Width="25px" />
                                            </asp:CommandField>
                                            <asp:BoundField DataField="RoomTypeID" HeaderText="RoomTypeID" ReadOnly="True" SortExpression="RoomTypeID">
                                                <ItemStyle Width="50px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RoomType" HeaderText="RoomType" SortExpression="RoomType">
                                                <ItemStyle Width="450px" />
                                            </asp:BoundField>
                                        </Columns>
                                    </asp:GridView>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                        <tr class="GridRow1T">
                                            <td style="width: 930px; height: 30px;">
                                                &nbsp;
                                            </td>
                                            <td style="width: 75px; padding-left: 5px;">
                                                <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <EmptyDataTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                        <tr class="GridRow1T">
                                            <td style="width: 930px; height: 30px;">
                                                &nbsp;
                                            </td>
                                            <td style="width: 75px; padding-left: 5px;">
                                                <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                            </asp:FormView>
                        </td>
                    </tr>
                </table>
                <asp:ObjectDataSource ID="dsHotelRoomType" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByHotelID"
                    TypeName="dsMaintHotelTableAdapters.HotelRoomTypeTableAdapter" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_HotelId" Type="Int32" />
                        <asp:Parameter Name="Original_RoomTypeId" Type="String" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="RoomType" Type="String" />
                        <asp:Parameter Name="Active" Type="Boolean" />
                        <asp:Parameter Name="Beds" Type="Int32" />
                        <asp:Parameter Name="TotalRooms" Type="Int32" />
                        <asp:Parameter Name="Note" Type="String" />
                        <asp:Parameter Name="Category" Type="Int32" />
                        <asp:Parameter Name="HotelSectionId" Type="Int32" />
                        <asp:Parameter Name="AdultOnly" Type="Boolean" />
                        <asp:Parameter Name="MaxOccupancy" Type="Int16" />
                        <asp:Parameter Name="Original_HotelId" Type="Int32" />
                        <asp:Parameter Name="Original_RoomTypeId" Type="String" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="HotelID" QueryStringField="HotelID" Type="Int32"
                            DefaultValue="" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:QueryStringParameter Name="HotelId" QueryStringField="HotelID" Type="Int32" />
                        <asp:Parameter Name="RoomTypeId" Type="String" />
                        <asp:Parameter Name="RoomType" Type="String" />
                        <asp:Parameter Name="Active" Type="Boolean" />
                        <asp:Parameter Name="Beds" Type="Int32" />
                        <asp:Parameter Name="TotalRooms" Type="Int32" />
                        <asp:Parameter Name="Note" Type="String" />
                        <asp:Parameter Name="Category" Type="Int32" />
                        <asp:Parameter Name="HotelSectionId" Type="Int32" />
                        <asp:Parameter Name="AdultOnly" Type="Boolean" />
                        <asp:Parameter Name="MaxOccupancy" Type="Int16" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsRoomTypes" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsMaintBasicTableAdapters.RoomTypeTableAdapter"
                    UpdateMethod="Update">
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
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <br />
    <div class="Red">
        <asp:UpdatePanel ID="updPanel" runat="server">
            <ContentTemplate>
                <asp:Panel ID="pnlRoom" runat="server">
                    <table cellpadding="0" cellspacing="2px">
                        <tr>
                            <td style="width: 25px;">
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/select_.gif" />
                            </td>
                            <td class="GridLabelBG">
                                <asp:Label ID="lblOccupancy" runat="server" SkinID="skGridLabel" Text="Occupancy For Selected Room"></asp:Label>
                            </td>
                            <td class="GridLabelBG">
                                <asp:Label ID="lblMapping" runat="server" SkinID="skGridLabel" Text="Room Type Mapping"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="GridBorder" style="vertical-align: top;">
                                <asp:GridView ID="gvOccupancy" runat="server" AutoGenerateColumns="False" DataKeyNames="OccupancyID"
                                    DataSourceID="dsRoomOccupancy" SkinID="skGridView">
                                    <Columns>
                                        <asp:BoundField DataField="OccupancyID" HeaderText="OccupancyID" InsertVisible="False"
                                            ReadOnly="True" SortExpression="OccupancyID" Visible="False" />
                                        <asp:BoundField DataField="HotelId" HeaderText="HotelId" InsertVisible="False" ReadOnly="True"
                                            SortExpression="HotelId" Visible="False" />
                                        <asp:BoundField DataField="RoomTypeId" HeaderText="RoomTypeId" InsertVisible="False"
                                            ReadOnly="True" SortExpression="RoomTypeId" Visible="False" />
                                        <asp:BoundField DataField="Adult" HeaderText="Adult" SortExpression="Adult">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ControlStyle CssClass="TextBox" />
                                            <ItemStyle Width="50px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Chld1" HeaderText="Ch1" SortExpression="Chld1">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ControlStyle CssClass="TextBox" />
                                            <ItemStyle Width="50px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Chld2" HeaderText="Ch2" SortExpression="Chld2">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ControlStyle CssClass="TextBox" />
                                            <ItemStyle Width="50px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Chld3" HeaderText="Ch3" SortExpression="Chld3">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ControlStyle CssClass="TextBox" />
                                            <ItemStyle Width="50px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Chld4" HeaderText="Ch4" SortExpression="Chld4">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ControlStyle CssClass="TextBox" />
                                            <ItemStyle Width="50px" />
                                        </asp:BoundField>
                                        <asp:CommandField CancelImageUrl="~/Images/decline_inline.gif" ShowEditButton="True"
                                            ButtonType="Image" EditImageUrl="~/Images/edit_inline.gif" UpdateImageUrl="~/Images/accept_inline.gif">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ControlStyle CssClass="ImgButton" />
                                            <ItemStyle Width="50px" />
                                        </asp:CommandField>
                                        <asp:TemplateField InsertVisible="False" ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="false" CommandName="Delete"
                                                    ImageUrl="~/Images/delete_inline.gif" OnClientClick="return confirm('Are you sure you want to delete the record')" />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                &nbsp;</EditItemTemplate>
                                            <ItemStyle Width="25px" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle Wrap="True" />
                                </asp:GridView>
                                <asp:FormView ID="fvOccupancy" runat="server" DataKeyNames="RoomTypeId" DataSourceID="dsRoomOccupancy">
                                    <RowStyle HorizontalAlign="Right" />
                                    <InsertItemTemplate>
                                        <table border="0" cellpadding="0" cellspacing="0" style="border-style: None; border-collapse: collapse;">
                                            <tr class="GridRow1T">
                                                <%--<td style="width: 50px;">--%>
                                                <td>
                                                    <asp:TextBox ID="AdultTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Adult") %>'
                                                        Width="47px" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Chld1TextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld1") %>'
                                                        Width="47px" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Chld2TextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld2") %>'
                                                        Width="47px" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Chld3TextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld3") %>'
                                                        Width="47px" />
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Chld4TextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld4") %>'
                                                        Width="47px" />
                                                </td>
                                                <td style="width: 75px; padding-left: 5px;">
                                                    <asp:ImageButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                                        CssClass="ImgButton" ImageUrl="~/Images/accept_inline.gif" />
                                                    <asp:ImageButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                                        CommandName="Cancel" CssClass="ImgButton" ImageUrl="~/Images/decline_inline.gif" />
                                                </td>
                                            </tr>
                                        </table>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <table border="0" cellpadding="0" cellspacing="0" style="border-style: None; border-collapse: collapse;">
                                            <tr class="GridRow1T">
                                                <%--<td style="width: 255px; height: 30px;">--%>
                                                <td style="height: 30px;">
                                                    <asp:Label ID="spcLabel1" runat="server" Width="255px">&nbsp;</asp:Label>
                                                </td>
                                                <td style="width: 75px; padding-left: 5px;">
                                                    <asp:Button ID="btnNew" runat="server" CommandName="New" SkinID="skBtnBase" Text="New" />
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <EmptyDataTemplate>
                                        <table border="0" cellpadding="0" cellspacing="0" style="border-style: None; border-collapse: collapse;">
                                            <tr class="GridRow1T">
                                                <%--<td style="width: 255px; height: 30px;">--%>
                                                <td style="height: 30px;">
                                                    <asp:Label ID="spcLabel1" runat="server" Width="255px">&nbsp;</asp:Label>
                                                </td>
                                                <td style="width: 75px; padding-left: 5px;">
                                                    <asp:Button ID="btnNew" runat="server" CommandName="New" SkinID="skBtnBase" Text="New" />
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </EmptyDataTemplate>
                                </asp:FormView>
                            </td>
                            <td class="GridBorder" style="vertical-align: top;">
                                <asp:GridView ID="gvMapping" runat="server" AutoGenerateColumns="False" DataKeyNames="HotelID,RoomTypeID,RoomTypeHID"
                                    DataSourceID="dsRoomMapping" SkinID="skGridView">
                                    <Columns>
                                        <asp:BoundField DataField="HotelID" HeaderText="HotelID" InsertVisible="False" ReadOnly="True"
                                            SortExpression="HotelID" Visible="False" />
                                        <asp:BoundField DataField="RoomTypeID" HeaderText="RoomTypeID" InsertVisible="False"
                                            ReadOnly="True" SortExpression="RoomTypeID" Visible="False" />
                                        <asp:BoundField DataField="RoomTypeHID" HeaderText="Hotel Room Type" SortExpression="RoomTypeHID">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ControlStyle CssClass="TextBox" />
                                            <ItemStyle Width="150px" />
                                        </asp:BoundField>
                                        <asp:CommandField CancelImageUrl="~/Images/decline_inline.gif" ShowEditButton="True"
                                            ButtonType="Image" EditImageUrl="~/Images/edit_inline.gif" UpdateImageUrl="~/Images/accept_inline.gif">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ControlStyle CssClass="ImgButton" />
                                            <ItemStyle Width="50px" />
                                        </asp:CommandField>
                                        <asp:TemplateField InsertVisible="False" ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="false" CommandName="Delete"
                                                    ImageUrl="~/Images/delete_inline.gif" OnClientClick="return confirm('Are you sure you want to delete the record')" />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                &nbsp;</EditItemTemplate>
                                            <ItemStyle Width="25px" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle Wrap="True" />
                                </asp:GridView>
                                <asp:FormView ID="fvMapping" runat="server" DataKeyNames="HotelID,RoomTypeID" DataSourceID="dsRoomMapping">
                                    <RowStyle HorizontalAlign="Right" />
                                    <InsertItemTemplate>
                                        <table border="0" cellpadding="0" cellspacing="0" style="border-style: None; border-collapse: collapse;">
                                            <tr class="GridRow1T">
                                                <td style="width: 150px;">
                                                    <asp:TextBox ID="txtHID" runat="server" CssClass="TextBox" Text='<%# Bind("RoomTypeHID") %>' />
                                                </td>
                                                <td style="width: 75px; padding-left: 5px;">
                                                    <asp:ImageButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                                        CssClass="ImgButton" ImageUrl="~/Images/accept_inline.gif" />
                                                    <asp:ImageButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                                        CommandName="Cancel" CssClass="ImgButton" ImageUrl="~/Images/decline_inline.gif" />
                                                </td>
                                            </tr>
                                        </table>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <table border="0" cellpadding="0" cellspacing="0" style="border-style: None; border-collapse: collapse;">
                                            <tr class="GridRow1T">
                                                <td style="width: 150px; height: 30px;">
                                                    &nbsp;
                                                </td>
                                                <td style="width: 75px; padding-left: 5px;">
                                                    <asp:Button ID="btnNew" runat="server" CommandName="New" SkinID="skBtnBase" Text="New" />
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <EmptyDataTemplate>
                                        <table border="0" cellpadding="0" cellspacing="0" style="border-style: None; border-collapse: collapse;">
                                            <tr class="GridRow1T">
                                                <td style="width: 150px; height: 30px;">
                                                    &nbsp;
                                                </td>
                                                <td style="width: 75px; padding-left: 5px;">
                                                    <asp:Button ID="btnNew" runat="server" CommandName="New" SkinID="skBtnBase" Text="New" />
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </EmptyDataTemplate>
                                </asp:FormView>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:ObjectDataSource ID="dsRoomOccupancy" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByHotelRoom"
                    TypeName="dsMaintHotelTableAdapters.HotelRoomOccupancyTableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_OccupancyID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:QueryStringParameter Name="HotelId" QueryStringField="HotelID" Type="Int32" />
                        <asp:ControlParameter ControlID="gvRooms" Name="RoomTypeId" PropertyName="SelectedValue"
                            Type="String" />
                        <asp:Parameter Name="Adult" Type="Int32" />
                        <asp:Parameter Name="Chld1" Type="Int32" />
                        <asp:Parameter Name="Chld2" Type="Int32" />
                        <asp:Parameter Name="Chld3" Type="Int32" />
                        <asp:Parameter Name="Chld4" Type="Int32" />
                        <asp:Parameter Name="Original_OccupancyID" Type="Int32" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="HotelId" QueryStringField="HotelID" 
                            Type="Int32" />
                        <asp:ControlParameter ControlID="gvRooms" DefaultValue="0" Name="RoomTypeID" PropertyName="SelectedValue"
                            Type="String" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:QueryStringParameter Name="HotelId" QueryStringField="HotelID" Type="Int32" />
                        <asp:ControlParameter ControlID="gvRooms" Name="RoomTypeId" PropertyName="SelectedValue"
                            Type="String" />
                        <asp:Parameter Name="Adult" Type="Int32" />
                        <asp:Parameter Name="Chld1" Type="Int32" />
                        <asp:Parameter Name="Chld2" Type="Int32" />
                        <asp:Parameter Name="Chld3" Type="Int32" />
                        <asp:Parameter Name="Chld4" Type="Int32" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsRoomMapping" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByRoomType"
                    TypeName="dsMaintHotelTableAdapters.HotelRoomMapTableAdapter" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_HotelID" Type="Int32" />
                        <asp:Parameter Name="Original_RoomTypeID" Type="String" />
                        <asp:Parameter Name="Original_RoomTypeHID" Type="String" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="RoomTypeHID" Type="String" />
                        <asp:Parameter Name="Original_HotelID" Type="Int32" />
                        <asp:Parameter Name="Original_RoomTypeID" Type="String" />
                        <asp:Parameter Name="Original_RoomTypeHID" Type="String" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="HotelID" QueryStringField="HotelID" Type="Int32" />
                        <asp:ControlParameter ControlID="gvRooms" Name="RoomTypeID" PropertyName="SelectedValue"
                            Type="String" DefaultValue="0" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:QueryStringParameter Name="HotelID" QueryStringField="HotelID" 
                            Type="Int32" />
                        <asp:ControlParameter ControlID="gvRooms" Name="RoomTypeID" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:Parameter Name="RoomTypeHID" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
                    PopupDragHandleControlID="popLabel" CancelControlID="btnNo" DropShadow="True"
                    BackgroundCssClass="modalBackground" TargetControlID="HiddenField1" X="200" Y="200">
                </asp:ModalPopupExtender>
                <asp:HiddenField ID="HiddenField1" runat="server" />
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
