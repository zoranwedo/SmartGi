<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Hotel/masterHotels.master"
    AutoEventWireup="false" CodeFile="AldosTestPg.aspx.vb" Inherits="Maintenance_Hotel_AldosTestPg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Aldo's Test Page
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HotelContent" runat="Server">
    <table cellpadding="0" cellspacing="5px" width="100%">
        <tr>
            <td style="width: 33%;">
                <div class="Blue">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="HotelID"
                        DataSourceID="dsHotel" SkinID="skGridView" SelectedIndex="0" 
                        AllowPaging="True" PageSize="5" Width="95%">
                        <Columns>
                            <asp:CommandField SelectImageUrl="~/Images/select_.gif" ShowCancelButton="False"
                                ShowSelectButton="True" ButtonType="Image">
                                <ItemStyle Width="25px" />
                            </asp:CommandField>
                            <asp:BoundField DataField="Hotel" HeaderText="Hotel" SortExpression="Hotel" >
                            <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" >
                            <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Country" HeaderText="Country" 
                                SortExpression="Country" >
                            <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
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
                    </asp:GridView>
                </div>
            </td>
            <td style="width: 33%;">
                <div class="Red">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="HotelID"
                        DataSourceID="dsHotel" SkinID="skGridView" SelectedIndex="0" 
                        AllowPaging="True" PageSize="5" Width="95%">
                        <Columns>
                            <asp:CommandField SelectImageUrl="~/Images/select_.gif" ShowCancelButton="False"
                                ShowSelectButton="True" ButtonType="Image">
                                <ItemStyle Width="25px" />
                            </asp:CommandField>
                            <asp:BoundField DataField="Hotel" HeaderText="Hotel" SortExpression="Hotel" >
                            <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" >
                            <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Country" HeaderText="Country" 
                                SortExpression="Country" >
                            <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
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
                    </asp:GridView>
                </div>
            </td>
            <td style="width: 33%;">
                <div class="Green">
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="HotelID"
                        DataSourceID="dsHotel" SkinID="skGridView" SelectedIndex="0" 
                        AllowPaging="True" PageSize="5" Width="95%">
                        <Columns>
                            <asp:CommandField SelectImageUrl="~/Images/select_.gif" ShowCancelButton="False"
                                ShowSelectButton="True" ButtonType="Image">
                                <ItemStyle Width="25px" />
                            </asp:CommandField>
                            <asp:BoundField DataField="Hotel" HeaderText="Hotel" SortExpression="Hotel" >
                            <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" >
                            <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Country" HeaderText="Country" 
                                SortExpression="Country" >
                            <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
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
                    </asp:GridView>
                </div>
            </td>
        </tr>
        <tr>
            <td style="width: 33%;">
                <div class="Blue">
                    <br />
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                    DataKeyNames="HotelID" DataSourceID="dsSelHotel" Height="50px" 
                    SkinID="skDetailView" Width="95%">
                    <FieldHeaderStyle Width="90px" />
                    <Fields>
                        <asp:BoundField DataField="Hotel" HeaderText="Hotel" SortExpression="Hotel" >
                        <ControlStyle CssClass="TextBox" />
                        <HeaderStyle CssClass="GridRow2B" />
                        <ItemStyle CssClass="GridRow2B" />
                        </asp:BoundField>
                        <asp:BoundField DataField="HotelID" HeaderText="HotelID" ReadOnly="True" 
                            SortExpression="HotelID" />
                        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" >
                        <ControlStyle CssClass="TextBox" />
                        </asp:BoundField>
                        <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" >
                        <ControlStyle CssClass="TextBox" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Country" HeaderText="Country" 
                            SortExpression="Country" >
                        <ControlStyle CssClass="TextBox" />
                        </asp:BoundField>
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" 
                            ShowEditButton="True" ShowInsertButton="True">
                        <ControlStyle BorderStyle="None" CssClass="Button" Height="20px" 
                            ForeColor="White" />
                        <ItemStyle CssClass="GridRow2T" HorizontalAlign="Right" VerticalAlign="Middle" 
                            Width="30px" />
                        </asp:CommandField>
                    </Fields>
                </asp:DetailsView>
                </div>
            </td>
            <td style="width: 33%;">
                <div class="Red">
                    <br />
                <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" 
                    DataKeyNames="HotelID" DataSourceID="dsSelHotel" Height="50px" 
                    SkinID="skDetailView" Width="95%">
                    <FieldHeaderStyle Width="90px" />
                    <Fields>
                        <asp:BoundField DataField="Hotel" HeaderText="Hotel" SortExpression="Hotel" >
                        <ControlStyle CssClass="TextBox" />
                        <HeaderStyle CssClass="GridRow2B" />
                        <ItemStyle CssClass="GridRow2B" />
                        </asp:BoundField>
                        <asp:BoundField DataField="HotelID" HeaderText="HotelID" ReadOnly="True" 
                            SortExpression="HotelID" />
                        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" >
                        <ControlStyle CssClass="TextBox" />
                        </asp:BoundField>
                        <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" >
                        <ControlStyle CssClass="TextBox" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Country" HeaderText="Country" 
                            SortExpression="Country" >
                        <ControlStyle CssClass="TextBox" />
                        </asp:BoundField>
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" 
                            ShowEditButton="True" ShowInsertButton="True">
                        <ControlStyle BorderStyle="None" CssClass="Button" Height="20px" 
                            ForeColor="White" />
                        <ItemStyle CssClass="GridRow2T" HorizontalAlign="Right" VerticalAlign="Middle" 
                            Width="30px" />
                        </asp:CommandField>
                    </Fields>
                </asp:DetailsView>
                </div>
            </td>
            <td style="width: 33%;">
                <div class="Green">
                    <br />
                <asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" 
                    DataKeyNames="HotelID" DataSourceID="dsSelHotel" Height="50px" 
                    SkinID="skDetailView" Width="95%">
                    <FieldHeaderStyle Width="90px" />
                    <Fields>
                        <asp:BoundField DataField="Hotel" HeaderText="Hotel" SortExpression="Hotel" >
                        <ControlStyle CssClass="TextBox" />
                        <HeaderStyle CssClass="GridRow2B" />
                        <ItemStyle CssClass="GridRow2B" />
                        </asp:BoundField>
                        <asp:BoundField DataField="HotelID" HeaderText="HotelID" ReadOnly="True" 
                            SortExpression="HotelID" />
                        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" >
                        <ControlStyle CssClass="TextBox" />
                        </asp:BoundField>
                        <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" >
                        <ControlStyle CssClass="TextBox" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Country" HeaderText="Country" 
                            SortExpression="Country" >
                        <ControlStyle CssClass="TextBox" />
                        </asp:BoundField>
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" 
                            ShowEditButton="True" ShowInsertButton="True">
                        <ControlStyle BorderStyle="None" CssClass="Button" Height="20px" 
                            ForeColor="White" />
                        <ItemStyle CssClass="GridRow2T" HorizontalAlign="Right" VerticalAlign="Middle" 
                            Width="30px" />
                        </asp:CommandField>
                    </Fields>
                </asp:DetailsView>
                </div>
            </td>
        </tr>
    </table>
    <asp:ObjectDataSource ID="dsHotel" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsMaintHotelTableAdapters.HotelTableAdapter"
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_HotelID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="HotelHID" Type="String" />
            <asp:Parameter Name="Hotel" Type="String" />
            <asp:Parameter Name="RNC" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="Tel" Type="String" />
            <asp:Parameter Name="Fax" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Contact" Type="String" />
            <asp:Parameter Name="Bank" Type="String" />
            <asp:Parameter Name="BankAccount" Type="String" />
            <asp:Parameter Name="Rooms" Type="Int32" />
            <asp:Parameter Name="Htl_Titulo" Type="String" />
            <asp:Parameter Name="AdultOnly" Type="Boolean" />
            <asp:Parameter Name="Flat" Type="Boolean" />
            <asp:Parameter Name="Active" Type="Boolean" />
            <asp:Parameter Name="Logo" Type="Object" />
            <asp:Parameter Name="MaxOccupancy" Type="Int16" />
            <asp:Parameter Name="Original_HotelID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="HotelID" Type="Int32" />
            <asp:Parameter Name="HotelHID" Type="String" />
            <asp:Parameter Name="Hotel" Type="String" />
            <asp:Parameter Name="RNC" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="Tel" Type="String" />
            <asp:Parameter Name="Fax" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Contact" Type="String" />
            <asp:Parameter Name="Bank" Type="String" />
            <asp:Parameter Name="BankAccount" Type="String" />
            <asp:Parameter Name="Rooms" Type="Int32" />
            <asp:Parameter Name="Htl_Titulo" Type="String" />
            <asp:Parameter Name="AdultOnly" Type="Boolean" />
            <asp:Parameter Name="Flat" Type="Boolean" />
            <asp:Parameter Name="Active" Type="Boolean" />
            <asp:Parameter Name="Logo" Type="Object" />
            <asp:Parameter Name="MaxOccupancy" Type="Int16" />
            <asp:Parameter Direction="InputOutput" Name="NewID" Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsSelHotel" runat="server" DeleteMethod="Delete" 
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetDataByHotelID" 
                    TypeName="dsMaintHotelTableAdapters.HotelTableAdapter" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_HotelID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="HotelHID" Type="String" />
                        <asp:Parameter Name="Hotel" Type="String" />
                        <asp:Parameter Name="RNC" Type="String" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="City" Type="String" />
                        <asp:Parameter Name="State" Type="String" />
                        <asp:Parameter Name="ZipCode" Type="String" />
                        <asp:Parameter Name="Country" Type="String" />
                        <asp:Parameter Name="Tel" Type="String" />
                        <asp:Parameter Name="Fax" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Contact" Type="String" />
                        <asp:Parameter Name="Bank" Type="String" />
                        <asp:Parameter Name="BankAccount" Type="String" />
                        <asp:Parameter Name="Rooms" Type="Int32" />
                        <asp:Parameter Name="Htl_Titulo" Type="String" />
                        <asp:Parameter Name="AdultOnly" Type="Boolean" />
                        <asp:Parameter Name="Flat" Type="Boolean" />
                        <asp:Parameter Name="Active" Type="Boolean" />
                        <asp:Parameter Name="Logo" Type="Object" />
                        <asp:Parameter Name="MaxOccupancy" Type="Int16" />
                        <asp:Parameter Name="Original_HotelID" Type="Int32" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="GridView1" Name="HotelID" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter Name="HotelID" Type="Int32" />
                        <asp:Parameter Name="HotelHID" Type="String" />
                        <asp:Parameter Name="Hotel" Type="String" />
                        <asp:Parameter Name="RNC" Type="String" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="City" Type="String" />
                        <asp:Parameter Name="State" Type="String" />
                        <asp:Parameter Name="ZipCode" Type="String" />
                        <asp:Parameter Name="Country" Type="String" />
                        <asp:Parameter Name="Tel" Type="String" />
                        <asp:Parameter Name="Fax" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Contact" Type="String" />
                        <asp:Parameter Name="Bank" Type="String" />
                        <asp:Parameter Name="BankAccount" Type="String" />
                        <asp:Parameter Name="Rooms" Type="Int32" />
                        <asp:Parameter Name="Htl_Titulo" Type="String" />
                        <asp:Parameter Name="AdultOnly" Type="Boolean" />
                        <asp:Parameter Name="Flat" Type="Boolean" />
                        <asp:Parameter Name="Active" Type="Boolean" />
                        <asp:Parameter Name="Logo" Type="Object" />
                        <asp:Parameter Name="MaxOccupancy" Type="Int16" />
                        <asp:Parameter Direction="InputOutput" Name="NewID" Type="Int32" />
                    </InsertParameters>
                </asp:ObjectDataSource>
</asp:Content>
