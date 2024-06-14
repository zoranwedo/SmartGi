<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/TO/TOMaster.master"
    AutoEventWireup="false" CodeFile="TOUsers.aspx.vb" Inherits="Maintenance_TO_TOUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TOTitle" runat="Server">
    Tour Operator User rights
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TOContent" runat="Server">
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
                                <asp:GridView ID="gvUserRights" runat="server" AutoGenerateColumns="False" DataSourceID="dsUserRights"
                                    EnableModelValidation="True" SkinID="skGridView">
                                    <Columns>
                                        <asp:TemplateField ShowHeader="False" SortExpression="HasRight">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="cbHasRight" runat="server" Checked='<%# Bind("HasRight") %>' />
                                                <asp:HiddenField ID="hfUserId" runat="server" Value='<%# Eval("UserName") %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="50px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" Visible="False" />
                                        <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName">
                                            <ItemStyle Width="200px" />
                                        </asp:BoundField>
                                    </Columns>
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
                            <td height="25">
                                <a name="Bottom">
                                    <asp:Button ID="btnUpdate" runat="server" SkinID="skBtnBase" Text="Update" />
                                </a>
                            </td>
                            <td style="width: 25px;">
                                <a href="#Top">«</a>
                            </td>
                        </tr>
                        <%--
                        <tr>
                            <td height="25" style="text-align: right;">
                                <asp:Button ID="btAll" runat="server" SkinID="skBtnBase" Text="Grant To All" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        --%>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    <a name="Bottom">
                        <asp:ObjectDataSource ID="dsUserRights" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="TourOperTableAdapters.UsersForTourOpTableAdapter">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="TourOpID" QueryStringField="TOID" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </a>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
