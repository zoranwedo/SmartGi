<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Admin/AdminMaster.master"
    AutoEventWireup="false" CodeFile="UserHotels.aspx.vb" Inherits="Maintenance_Admin_UserHotels" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    User Hotels
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AminContent" runat="Server">
    <div class="Blue">
        <table cellpadding="0" cellspacing="2">
            <tr>
                <td style="width: 25px; vertical-align: top;">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/select_.gif" />
                </td>
                <td>
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="GridLabelBG">
                                <a name="Top">
                                    <asp:Label ID="Label1" runat="server" Text="User's Hotels" SkinID="skGridLabel" />
                                </a>
                            </td>
                            <td style="padding-left: 2px;">
                                <a href="#Bottom">»</a>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-bottom: 5px;" class="GridRow1B">
                                <asp:GridView ID="gvHotels" runat="server" AutoGenerateColumns="False" BorderColor="Tan"
                                    BorderStyle="None" BorderWidth="1px" DataKeyNames="HotelID" DataSourceID="hotelDataSource"
                                    GridLines="None" SkinID="skGridView" Width="450px">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("HasRight") %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="20px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="HotelID" HeaderText="ID" SortExpression="HotelID">
                                            <ItemStyle Width="50px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Hotel" HeaderText="Hotel">
                                            <ItemStyle Wrap="False" />
                                        </asp:BoundField>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:GridView>
                                <br />
                                &nbsp;
                                <asp:LinkButton ID="lnkSelect" runat="server" SkinID="GridButton">SelectAll</asp:LinkButton>&nbsp;
                                <asp:LinkButton ID="lnkDeselect" runat="server" SkinID="GridButton">Deselect All</asp:LinkButton>
                            </td>
                            <td style="padding-left: 2px;">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td height="25" style="width: 398px;">
                                <a name="Bottom">
                                    <asp:Button ID="btnUpdate" runat="server" SkinID="skBtnBase" Text="Update" />
                                </a>
                            </td>
                            <td style="padding-left: 2px;">
                                <a href="#Top">«</a>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:ObjectDataSource ID="hotelDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetDataUserHotel" TypeName="UserTableAdapters.UserInHotelTableAdapter"
                        UpdateMethod="UserInHotelUpdate">
                        <UpdateParameters>
                            <asp:QueryStringParameter Name="UserName" QueryStringField="username" Type="String" />
                            <asp:Parameter Name="HotelID" Type="Int32" />
                            <asp:Parameter Name="HasRight" Type="Boolean" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="UserName" QueryStringField="username" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
