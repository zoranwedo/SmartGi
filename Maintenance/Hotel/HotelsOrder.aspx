<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Hotel/masterHotels.master" AutoEventWireup="false" CodeFile="HotelsOrder.aspx.vb" Inherits="Maintenance_Hotel_HotelsOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HotelContent" Runat="Server">
 <div class="Blue">
                     <asp:GridView ID="gvHotelOrder" runat="server" 
        AutoGenerateColumns="False" SkinID="skGridView"
                        DataSourceID="dsHotelsSection" DataKeyNames="HotelID" 
                        SelectedIndex="0" Width="600px" >
                        <SelectedRowStyle CssClass="SelectRow1TB" />
                        <HeaderStyle HorizontalAlign="Left" />
                        <Columns>
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" 
                                ShowSelectButton="True">
                                <ItemStyle Width="25px" />
                            </asp:CommandField>
                            <asp:BoundField DataField="HotelId" HeaderText="HotelId" InsertVisible="False" ReadOnly="True"
                                SortExpression="HotelId" Visible="False" />
                            <asp:BoundField DataField="Hotel" HeaderText="Hotel" ReadOnly="True" 
                                SortExpression="Hotel">
                            <ItemStyle Width="300px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SortPriority" HeaderText="SortPriority" 
                                SortExpression="SortPriority" >
                            <ItemStyle Width="70px" />
                            </asp:BoundField>
                            <asp:CommandField CancelImageUrl="~/Images/decline_inline.gif" ShowEditButton="True"
                                ButtonType="Image" EditImageUrl="~/Images/edit_inline.gif" UpdateImageUrl="~/Images/accept_inline.gif">
                                <ControlStyle CssClass="ImgButton" />
                                <ItemStyle Width="50px" />
                            </asp:CommandField>
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="dsHotelsSection" runat="server" 
        DeleteMethod="Delete" InsertMethod="Insert"
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllActive"
                        TypeName="dsMaintHotelTableAdapters.HotelTableAdapter" 
        UpdateMethod="UpdateSort">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_HotelID" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="SortPriority" Type="Int32" />
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
                            <asp:Parameter Name="SortPriority" Type="Int32" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
</div>                    
                    </asp:Content>
                    

