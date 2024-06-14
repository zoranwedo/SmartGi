<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Hotel/masterHotels.master" AutoEventWireup="false" CodeFile="HotelContacts.aspx.vb" Inherits="Maintenance_Hotel_HotelContacts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Hotel Contacts
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HotelContent" Runat="Server">

    <div class="Blue">
    <table cellpadding="0" cellspacing="0">
        <tr>
            <td class="GridBorder">
                <asp:GridView ID="gwContacts" runat="server" SkinID="skGridView" SelectedIndex="0" 
                     DataSourceID="dsHotelContacts" DataKeyNames="ContactID" 
                    AllowPaging="true" >
                    <Columns>
                        <asp:CommandField ButtonType="Image" InsertVisible="False" SelectImageUrl="~/Images/select_.gif"
                            ShowCancelButton="False" ShowSelectButton="True">
                            <ItemStyle Width="25px" />
                        </asp:CommandField>
                        <asp:BoundField DataField="ContactID" HeaderText="ContactID" ReadOnly="True" 
                            SortExpression="ContactID" InsertVisible="False" Visible="False">
                        </asp:BoundField>
                        <asp:BoundField DataField="ContactTypeId" HeaderText="Type" 
                            SortExpression="ContactTypeId">
                        <ControlStyle CssClass="TextBox" />
                                <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title">
                        <ControlStyle CssClass="TextBox" />
                                <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                        <ControlStyle CssClass="TextBox" />
                                <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle Width="250px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Tel1" HeaderText="Tel1" SortExpression="Tel1">
                        <ControlStyle CssClass="TextBox" />
                                <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile">
                        <ControlStyle CssClass="TextBox" />
                                <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Email1" HeaderText="Email1" SortExpression="Email1">
                        <ControlStyle CssClass="TextBox" />
                                <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle Width="200px" />
                        </asp:BoundField>
                            <asp:CommandField CancelImageUrl="~/Images/decline_inline.gif" ShowEditButton="True"
                                ButtonType="Image" EditImageUrl="~/Images/edit_inline.gif" UpdateImageUrl="~/Images/accept_inline.gif">
                                <ControlStyle CssClass="ImgButton" />
                                <ItemStyle Width="50px" />
                            </asp:CommandField>
                            <asp:TemplateField InsertVisible="False" ShowHeader="False" Visible="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="false" 
                                        CommandName="TryDelete" ImageUrl="~/Images/delete_inline.gif" Text="Button" />
                                </ItemTemplate>
                                <EditItemTemplate>&nbsp;</EditItemTemplate>
                                <ItemStyle Width="25px" />
                            </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <asp:Panel ID="Panel1" runat="server" Width="915px" HorizontalAlign="Right">
                        <asp:Button ID="btnNew" runat="server" CommandName="New" onclick="btnNew_Click" 
                            SkinID="skBtnBase" Text="New" />
                        </asp:Panel>
                    </EmptyDataTemplate>
                   
                    <SelectedRowStyle CssClass="SelectRow1TB" />
                   
                </asp:GridView>
            </td>
        </tr>
    </table>
    </div>
    <br />
    
            <asp:Label ID="lblErrorDetails" runat="server" SkinID="ErrorLabel" Text="Label" 
                Visible="False"></asp:Label>
    
    <div class="Red">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td width="25">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/select_.gif" />
                    </td>
                    <td class="GridLabelBG">
                        <asp:Label ID="lblSelectedHotel" runat="server" SkinID="skGridLabel" 
                            Text="Selected Contact"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="GridBorder">
                        <asp:DetailsView ID="dvContact" runat="server" AutoGenerateRows="False" 
                            DataKeyNames="ContactID" DataSourceID="dsContact" GridLines="None" 
                            SkinID="skDetailView" Width="600px">
                            <FieldHeaderStyle Width="120px" />
                            <EmptyDataTemplate>
                                <asp:Panel ID="Panel2" runat="server" Width="600px">&nbsp;</asp:Panel>
                            </EmptyDataTemplate>
                            <Fields>
                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                                    <ControlStyle CssClass="TextBox" />
                                    <HeaderStyle CssClass="GridRow2B" Font-Bold="True" />
                                    <ItemStyle CssClass="GridRow2B" Font-Bold="True" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ContactID" HeaderText="ContactID" 
                                    InsertVisible="False" ReadOnly="True" SortExpression="ContactID" 
                                    Visible="False" />
                                <asp:TemplateField HeaderText="ContactTypeId" SortExpression="ContactTypeId">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList2" runat="server" 
                                            DataSourceID="dsContactType" DataTextField="ContactType" 
                                            DataValueField="ContactTypeID" SelectedValue='<%# Bind("ContactTypeId") %>' 
                                            CssClass="TextBox">
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="DropDownList1" runat="server" 
                                            DataSourceID="dsContactType" DataTextField="ContactType" 
                                            DataValueField="ContactTypeID" SelectedValue='<%# Bind("ContactTypeId") %>' 
                                            CssClass="TextBox">
                                        </asp:DropDownList>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ContactTypeId") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" >
                                    <ControlStyle CssClass="TextBox" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Address" HeaderText="Address" 
                                    SortExpression="Address" >
                                    <ControlStyle CssClass="TextBox" />
                                </asp:BoundField>
                                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" >
                                    <ControlStyle CssClass="TextBox" />
                                </asp:BoundField>
                                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" >
                                    <ControlStyle CssClass="TextBox" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" 
                                    SortExpression="ZipCode" >
                                    <ControlStyle CssClass="TextBox" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Country" HeaderText="Country" 
                                    SortExpression="Country" >
                                    <ControlStyle CssClass="TextBox" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Tel1" HeaderText="Tel1" SortExpression="Tel1" >
                                    <ControlStyle CssClass="TextBox" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Tel2" HeaderText="Tel2" SortExpression="Tel2" >
                                    <ControlStyle CssClass="TextBox" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Mobile" HeaderText="Mobile" 
                                    SortExpression="Mobile" >
                                    <ControlStyle CssClass="TextBox" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Fax" HeaderText="Fax" SortExpression="Fax" >
                                    <ControlStyle CssClass="TextBox" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Email1" HeaderText="Email1" 
                                    SortExpression="Email1" >
                                    <ControlStyle CssClass="TextBox" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Email2" HeaderText="Email2" 
                                    SortExpression="Email2" >
                                    <ControlStyle CssClass="TextBox" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note" >
                                    <ControlStyle CssClass="TextBox" />
                                </asp:BoundField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                                            CommandName="Edit" Text="Edit" />
                                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                                            CommandName="New" Text="New" />
                                        &nbsp;<asp:Button ID="Button3" runat="server" CausesValidation="False" 
                                            CommandName="Delete" Text="Delete" 
                                            onclientclick="return confirm('Are you sure you want to delete the record')" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Button ID="Button1" runat="server" CausesValidation="True" 
                                            CommandName="Update" Text="Update" />
                                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" Text="Cancel" />
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:Button ID="Button1" runat="server" CausesValidation="True" 
                                            CommandName="Insert" Text="Save" />
                                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" Text="Cancel" />
                                    </InsertItemTemplate>
                                    <ControlStyle BorderStyle="None" CssClass="Button" Font-Size="10pt" 
                                        ForeColor="White" />
                                    <ItemStyle CssClass="ComandRow2T" Height="30px" HorizontalAlign="Right" 
                                        VerticalAlign="Middle" />
                                </asp:TemplateField>
                            </Fields>
                        </asp:DetailsView>
                    </td>
                </tr>
            </table>
            <asp:ObjectDataSource ID="dsHotelContacts" runat="server"
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByHotelID"
                TypeName="dsMaintHotelTableAdapters.HotelContactTableAdapter" 
                InsertMethod="HotelContactInsert" UpdateMethod="HotelContactUpdate" 
                DeleteMethod="HotelContactDelete">
                <DeleteParameters>
                    <asp:Parameter Name="Original_ContactID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ContactTypeId" Type="String" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="ZipCode" Type="String" />
                    <asp:Parameter Name="Country" Type="String" />
                    <asp:Parameter Name="Tel1" Type="String" />
                    <asp:Parameter Name="Tel2" Type="String" />
                    <asp:Parameter Name="Mobile" Type="String" />
                    <asp:Parameter Name="Fax" Type="String" />
                    <asp:Parameter Name="Email1" Type="String" />
                    <asp:Parameter Name="Email2" Type="String" />
                    <asp:Parameter Name="Note" Type="String" />
                    <asp:Parameter Name="Original_ContactID" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="HotelID" QueryStringField="HotelID" 
                        Type="Int32" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="HotelID" Type="Int32" />
                    <asp:Parameter Name="ContactTypeId" Type="String" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="ZipCode" Type="String" />
                    <asp:Parameter Name="Country" Type="String" />
                    <asp:Parameter Name="Tel1" Type="String" />
                    <asp:Parameter Name="Tel2" Type="String" />
                    <asp:Parameter Name="Mobile" Type="String" />
                    <asp:Parameter Name="Fax" Type="String" />
                    <asp:Parameter Name="Email1" Type="String" />
                    <asp:Parameter Name="Email2" Type="String" />
                    <asp:Parameter Name="Note" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
                        
            <asp:ObjectDataSource ID="dsContactType" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                TypeName="dsMaintHotelTableAdapters.ContactTypeTableAdapter">
            </asp:ObjectDataSource>
                        
            <asp:ObjectDataSource ID="dsContact" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByContactID" 
                TypeName="dsMaintHotelTableAdapters.HotelContactTableAdapter" DeleteMethod="HotelContactDelete" 
                InsertMethod="HotelContactInsert" UpdateMethod="HotelContactUpdate">
                <DeleteParameters>
                    <asp:Parameter Name="Original_ContactID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ContactTypeId" Type="String" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="ZipCode" Type="String" />
                    <asp:Parameter Name="Country" Type="String" />
                    <asp:Parameter Name="Tel1" Type="String" />
                    <asp:Parameter Name="Tel2" Type="String" />
                    <asp:Parameter Name="Mobile" Type="String" />
                    <asp:Parameter Name="Fax" Type="String" />
                    <asp:Parameter Name="Email1" Type="String" />
                    <asp:Parameter Name="Email2" Type="String" />
                    <asp:Parameter Name="Note" Type="String" />
                    <asp:Parameter Name="Original_ContactID" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="HotelId" QueryStringField="HotelID" 
                        Type="Int32" />
                    <asp:ControlParameter ControlID="gwContacts" Name="ContactID" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="HotelID" Type="Int32" />
                    <asp:Parameter Name="ContactTypeId" Type="String" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="ZipCode" Type="String" />
                    <asp:Parameter Name="Country" Type="String" />
                    <asp:Parameter Name="Tel1" Type="String" />
                    <asp:Parameter Name="Tel2" Type="String" />
                    <asp:Parameter Name="Mobile" Type="String" />
                    <asp:Parameter Name="Fax" Type="String" />
                    <asp:Parameter Name="Email1" Type="String" />
                    <asp:Parameter Name="Email2" Type="String" />
                    <asp:Parameter Name="Note" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
    </div>
    <div class = "Blue">
    <asp:HiddenField ID="dummy" runat="server" />
    <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
        PopupDragHandleControlID="popLabel" CancelControlID="btnNo" DropShadow="True" 
        BackgroundCssClass="modalBackground" TargetControlID="dummy" X="200" Y="200">
    </asp:ModalPopupExtender>

    <asp:Panel ID="popPanel" runat="server" Width="300px" BackColor="White" Style="display: none">
        <table cellpadding="0" cellspacing="0" style="width: 100%;">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="popLabel" runat="server" Text="Delete data" SkinID="skGridLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <p style="text-align: center;">
                        <asp:Label ID="popMessage" runat="server" Text="Are you sure?"></asp:Label>
                    </p>
                    <p style="text-align: right;" class="GridRow2TB">
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

