<%@ Page Title="Hotel's Sections" Language="VB" MasterPageFile="~/Maintenance/Hotel/masterHotels.master"
    AutoEventWireup="false" CodeFile="HotelSections.aspx.vb" Inherits="Maintenance_Hotel_HotelSections" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Hotel Sections
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HotelContent" runat="Server">
       <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvHotelSections" runat="server" AutoGenerateColumns="False" SkinID="skGridView"
                        DataSourceID="dsHotelsSection" DataKeyNames="HotelSectionID" 
                        SelectedIndex="0" >
                        <SelectedRowStyle CssClass="SelectRow1TB" />
                        <HeaderStyle HorizontalAlign="Left" />
                        <Columns>
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" ShowSelectButton="True">
                                <ItemStyle Width="25px" />
                            </asp:CommandField>
                            <asp:BoundField DataField="HotelId" HeaderText="HotelId" InsertVisible="False" ReadOnly="True"
                                SortExpression="HotelId" Visible="False" />
                            <asp:BoundField DataField="HotelSectionID" HeaderText="HotelSectionID" InsertVisible="False"
                                ReadOnly="True" SortExpression="HotelSectionID" Visible="False" />
                            <asp:TemplateField HeaderText="Section" SortExpression="HotelSection">
                                <ItemStyle Width="200px" />
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtSection" runat="server" Text='<%# Bind("HotelSection") %>'  CssClass="TextBox" />
                                    <asp:RequiredFieldValidator ID="reqSection" runat="server" ControlToValidate="txtSection" SkinID="skRequired" />
                                    <asp:ValidatorCalloutExtender ID="extSection" runat="server" TargetControlID="reqSection" SkinID="skExtender" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblSection" runat="server" Text='<%# Bind("HotelSection") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemStyle Width="50px" />
                                <ItemTemplate>
                                    <asp:ImageButton ID="Up" runat="server" Height="8px" ImageUrl="~/Images/up.gif" Width="10px"
                                        CommandName="CatUp" CommandArgument='<%# Eval("HotelSectionID") %>' />
                                    &nbsp;
                                    <asp:ImageButton ID="Dwn" runat="server" Height="8px" ImageUrl="~/Images/dwn.gif"
                                        Width="10px" CommandName="CatDwn" CommandArgument='<%# Eval("HotelSectionID") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CheckBoxField DataField="AdultOnly" HeaderText="Adult Only" SortExpression="AdultOnly">
                                <ItemStyle Width="100px" />
                            </asp:CheckBoxField>
                            <asp:CommandField CancelImageUrl="~/Images/decline_inline.gif" ShowEditButton="True"
                                ButtonType="Image" EditImageUrl="~/Images/edit_inline.gif" UpdateImageUrl="~/Images/accept_inline.gif">
                                <ControlStyle CssClass="ImgButton" />
                                <ItemStyle Width="50px" />
                            </asp:CommandField>
                            <asp:TemplateField InsertVisible="False" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="false" CommandName="Delete"
                                        ImageUrl="~/Images/delete_inline.gif" 
                                        onclientclick="return confirm('Are you sure you want to delete the record')" />

                                </ItemTemplate>
                                <EditItemTemplate>
                                    &nbsp;</EditItemTemplate>
                                <ItemStyle Width="25px" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:FormView ID="newSection" runat="server" DataKeyNames="HotelSectionID" DataSourceID="dsHotelsSection" >
                        <InsertItemTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                <tr class="GridRow1T">
                                    <td style="width: 25px;">
                                        &nbsp;
                                    </td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="txtInsSection" runat="server" Text='<%# Bind("HotelSection") %>' CssClass="TextBox" />
                                        <asp:RequiredFieldValidator ID="reqInsSection" runat="server" ControlToValidate="txtInsSection" SkinID="skRequired" />
                                        <asp:ValidatorCalloutExtender ID="extInsSection" runat="server" TargetControlID="reqInsSection" SkinID="skExtender" />
                                    </td>
                                    <td style="width: 55px;">&nbsp;
                                    </td>
                                    <td style="width: 100px;">
                                        <asp:CheckBox ID="cbAdultOnly" runat="server" Checked='<%# Bind("AdultOnly") %>' />
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
                                    <td style="width: 375px; height: 30px;">
                                        &nbsp;
                                    </td>
                                    <td style="width: 75px;" >
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                <tr class="GridRow1T">
                                    <td style="width: 375px; height: 30px;">
                                        &nbsp;
                                    </td>
                                    <td style="width: 75px;" >
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                    </asp:FormView>
                    <asp:ObjectDataSource ID="dsHotelsSection" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByHotelID"
                        TypeName="dsMaintHotelTableAdapters.HotelSectionTableAdapter" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:QueryStringParameter Name="Original_HotelID" QueryStringField="HotelID" Type="Int32" />
                            <asp:Parameter Name="Original_HotelSectionID" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="HotelId" Type="Int32" />
                            <asp:Parameter Name="HotelSection" Type="String" />
                            <asp:Parameter Name="Category" Type="Int32" />
                            <asp:Parameter Name="AdultOnly" Type="Boolean" />
                            <asp:Parameter Name="MaxOccupancy" Type="Int16" />
                            <asp:Parameter Name="Original_HotelID" Type="Int32" />
                            <asp:Parameter Name="Original_HotelSectionID" Type="Int32" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="HotelID" QueryStringField="HotelID" Type="Int32" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:QueryStringParameter Name="HotelID" QueryStringField="HotelID" Type="Int32" />
                            <asp:Parameter Name="HotelSection" Type="String" />
                            <asp:Parameter Name="Category" Type="Int32" />
                            <asp:Parameter Name="AdultOnly" Type="Boolean" />
                            <asp:Parameter Name="MaxOccupancy" Type="Int16" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="dsInSectionRoomType" runat="server" DeleteMethod="Delete"
                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByHotelSection"
                        TypeName="dsMaintHotelTableAdapters.HotelRoomSectionTableAdapter" 
                        UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_HotelId" Type="Int32" />
                            <asp:Parameter Name="Original_RoomTypeID" Type="String" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="HotelId" Type="Int32" />
                            <asp:Parameter Name="HotelSectionId" Type="Int32" />
                            <asp:Parameter Name="RoomTypeID" Type="String" />
                            <asp:Parameter Name="Original_HotelId" Type="Int32" />
                            <asp:Parameter Name="Original_RoomTypeID" Type="String" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="HotelID" QueryStringField="HotelID" Type="Int32" />
                            <asp:ControlParameter ControlID="gvHotelSections" Name="HotelSectionID" PropertyName="SelectedValue"
                                Type="Int32" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:Parameter Name="HotelId" Type="Int32" />
                            <asp:Parameter Name="HotelSectionId" Type="Int32" />
                            <asp:Parameter Name="RoomTypeID" Type="String" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="dsNotInSectionRoomType" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetDataByHotelNoSection" 
                        TypeName="dsMaintHotelTableAdapters.HotelRoomSectionTableAdapter" 
                        DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_HotelId" Type="Int32" />
                            <asp:Parameter Name="Original_RoomTypeID" Type="String" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="HotelId" Type="Int32" />
                            <asp:Parameter Name="HotelSectionId" Type="Int32" />
                            <asp:Parameter Name="RoomTypeID" Type="String" />
                            <asp:Parameter Name="Original_HotelId" Type="Int32" />
                            <asp:Parameter Name="Original_RoomTypeID" Type="String" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="HotelID" QueryStringField="HotelID" Type="Int32" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:Parameter Name="HotelId" Type="Int32" />
                            <asp:Parameter Name="HotelSectionId" Type="Int32" />
                            <asp:Parameter Name="RoomTypeID" Type="String" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div class="Red">
        <asp:Panel ID="pnlRooms" runat="server">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td style="width: 25px;">
                        &nbsp;<asp:Image ID="Image1" runat="server" ImageUrl="~/Images/select_.gif" />
                    </td>
                    <td class="GridLabelBG" colspan="3">
                        <asp:Label ID="lblInSection" runat="server" Text="Room Types" SkinID="skGridLabel" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 25px;">
                        &nbsp;
                    </td>
                    <td  class="GridRow1TB" rowspan="4" style="vertical-align: top;">
                        <asp:GridView ID="gvRoomsIn" runat="server" SkinID="skGridView" AllowSorting="False"
                            AutoGenerateColumns="False" DataSourceID="dsInSectionRoomType"
                            DataKeyNames="RoomTypeID" SelectedIndex="0" >
                            <SelectedRowStyle CssClass="SelectRow1TB" />
                            <HeaderStyle HorizontalAlign="Right" />
                            <Columns>
                                <asp:CommandField ButtonType="Image" ShowSelectButton="True" SelectImageUrl="~/Images/select_.gif" >
                                    <ItemStyle Width="25px" />
                                </asp:CommandField>
                                <asp:BoundField DataField="RoomTypeID" HeaderText="In Section" ReadOnly="True" SortExpression="RoomTypeID">
                                    <ItemStyle Width="150px" />
                                </asp:BoundField>
                            </Columns>
                            <EmptyDataRowStyle CssClass="GridRow2B" />
                            <EmptyDataTemplate>
                                <asp:Panel ID="PanelIn" runat="server" Width="175px" >In Section</asp:Panel>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </td>
                    <td style="width: 40px; text-align:center;">
                        <asp:ImageButton ID="btnRight" runat="server" ImageUrl="~/Images/right_one.png" />
                    </td>
                    <td class="GridRow1TB" rowspan="4"  style="vertical-align: top;">
                        <asp:GridView ID="gvRoomsOut" runat="server" SkinID="skGridView" AllowSorting="False"
                            AutoGenerateColumns="False" DataSourceID="dsNotInSectionRoomType" 
                            DataKeyNames="RoomTypeID" SelectedIndex="0" >
                            <SelectedRowStyle CssClass="SelectRow1TB" />
                            <HeaderStyle HorizontalAlign="Right" />
                            <Columns>
                                <asp:CommandField ButtonType="Image" ShowSelectButton="True" SelectImageUrl="~/Images/select_.gif" >
                                    <ItemStyle Width="25px" />
                                </asp:CommandField>
                                <asp:BoundField DataField="RoomTypeID" HeaderText="Not In Section" ReadOnly="True" SortExpression="RoomTypeID">
                                    <ItemStyle Width="150px" />
                                </asp:BoundField>
                            </Columns>
                            <EmptyDataRowStyle CssClass="GridRow2B" />
                            <EmptyDataTemplate>
                                <asp:Panel ID="PanelOut" runat="server" Width="175px" >Not In Section</asp:Panel>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td style="width: 40px; text-align:center;">
                        <asp:ImageButton ID="btnLeft" runat="server" ImageUrl="~/Images/left_one.png" />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td style="width: 40px; text-align:center;">
                        <asp:ImageButton ID="btnRightAll" runat="server" 
                            ImageUrl="~/Images/right_all.png" Visible="False" />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td style="width: 40px; text-align:center;">
                        <asp:ImageButton ID="btnLeftAll" runat="server" 
                            ImageUrl="~/Images/left_all.png" Visible="False" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <br />
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

    </div>
    

</asp:Content>
