<%@ Page Title="All TO for User" Language="VB" MasterPageFile="~/Maintenance/Admin/AdminMaster.master"
    AutoEventWireup="false" CodeFile="UserTO.aspx.vb" Inherits="Maintenance_Admin_UserTO" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    User Touroperators
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
                                    <asp:Label ID="Label1" runat="server" Text="User's TOs" SkinID="skGridLabel" />
                                </a>
                            </td>
                            <td style="padding-left: 2px;">
                                <a href="#Bottom">»</a>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-bottom: 5px;" class="GridRow1B">
                                <asp:GridView ID="gvHotels" runat="server" AutoGenerateColumns="False" DataKeyNames="TourOpID"
                                    DataSourceID="agencyDataSource" GridLines="None" SkinID="skGridView" Width="460px">
                                    <Columns>
                                        <asp:TemplateField SortExpression="HasRight">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("HasRight") %>' />
                                            </ItemTemplate>
                                            <ControlStyle Width="30px" />
                                            <ItemStyle Width="20px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="TourOpID" HeaderText="ID" SortExpression="TourOpID">
                                            <ItemStyle Wrap="False" />
                                            <ControlStyle Width="50px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="TourOp" HeaderText="TourOperator" SortExpression="TourOp">
                                        </asp:BoundField>
                                        <asp:CheckBoxField DataField="Local" HeaderText="Local" ReadOnly="True" SortExpression="Local" />
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
                            <td height="25" style="width: 237px">
                                <a name="Bottom">
                                    <asp:Button ID="btnUpdate" runat="server" SkinID="skBtnBase" Text="Update" />
                                </a>
                            </td>
                            <td style="width: 25px;">
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
                    <asp:ObjectDataSource ID="agencyDataSource" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetDataUserTO" TypeName="UserTableAdapters.UserInTourOpTableAdapter"
                        UpdateMethod="UserInTourOpUpdate">
                        <UpdateParameters>
                            <asp:QueryStringParameter Name="UserName" QueryStringField="username" Type="String" />
                            <asp:Parameter Name="TourOpID" Type="Int32" />
                            <asp:Parameter Name="HasRight" Type="Boolean" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter DefaultValue="" Name="UserName" QueryStringField="username"
                                Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
