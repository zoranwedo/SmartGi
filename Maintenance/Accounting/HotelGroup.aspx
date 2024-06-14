<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="HotelGroup.aspx.vb" Inherits="Maintenance_Accounting_HotelGroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Hotel Groups
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" runat="Server">
    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>
    <br />
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="Label2" runat="server" Text="Hotel Groups" SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvGroups" runat="server" SkinID="skGridView" AutoGenerateColumns="False"
                        DataKeyNames="HotelGroupID" DataSourceID="dsGroups" SelectedIndex="0">
                        <Columns>
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" ShowSelectButton="True">
                                <ItemStyle Width="25px" />
                            </asp:CommandField>
                            <asp:BoundField DataField="HotelGroupID" HeaderText="HotelGroupID" InsertVisible="False"
                                ReadOnly="True" SortExpression="HotelGroupID" Visible="False" />
                            <asp:TemplateField HeaderText="Group" SortExpression="HotelGroup">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("HotelGroup") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                                        SkinID="skRequired" />
                                    <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender" runat="server" TargetControlID="RequiredFieldValidator1"
                                        SkinID="skExtender" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("HotelGroup") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="200px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description">
                                <ItemStyle Width="400px" />
                            </asp:BoundField>
                            <asp:CommandField ButtonType="Image" CancelImageUrl="~/Images/decline_inline.gif"
                                EditImageUrl="~/Images/edit_inline.gif" ShowEditButton="True" UpdateImageUrl="~/Images/accept_inline.gif">
                                <ItemStyle Width="50px" />
                            </asp:CommandField>
                            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/delete_inline.gif"
                                ShowDeleteButton="True">
                                <ItemStyle Width="25px" />
                            </asp:CommandField>
                        </Columns>
                        <EmptyDataTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="width: 27px;" class="GridRow1B">
                                        &nbsp;
                                    </td>
                                    <td style="width: 202px;" class="GridRow1B">
                                        Group
                                    </td>
                                    <td style="width: 402px;" class="GridRow1B">
                                        Description
                                    </td>
                                    <td style="width: 79px;" class="GridRow1B">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                    </asp:GridView>
                    <asp:FormView ID="fvGroups" runat="server" DataKeyNames="HotelGroupID" DataSourceID="dsGroups">
                        <InsertItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="width: 27px; margin-top: 2px;" class="GridRow1T">
                                        &nbsp;
                                    </td>
                                    <td style="width: 202px; margin-top: 2px;" class="GridRow1T">
                                        <asp:TextBox ID="HotelGroupTextBox" runat="server" Text='<%# Bind("HotelGroup") %>'
                                            CssClass="TextBox" />
                                        <asp:RequiredFieldValidator ID="Group_RequiredFieldValidator1" runat="server" ControlToValidate="HotelGroupTextBox"
                                            SkinID="skRequired" />
                                        <asp:ValidatorCalloutExtender ID="Group_ValidatorCalloutExtender" runat="server"
                                            TargetControlID="Group_RequiredFieldValidator1" SkinID="skExtender" />
                                    </td>
                                    <td style="width: 402px; margin-top: 2px;" class="GridRow1T">
                                        <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>'
                                            CssClass="TextBox" />
                                    </td>
                                    <td style="width: 79px; margin-top: 2px;" class="GridRow1T">
                                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Insert"
                                            ImageUrl="~/Images/accept_inline.gif" CssClass="ImgButton" />
                                        <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                            ImageUrl="~/Images/decline_inline.gif" CssClass="ImgButton" />
                                    </td>
                                </tr>
                            </table>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="width: 629px; margin-top: 2px;" class="GridRow1T">
                                        &nbsp;
                                    </td>
                                    <td style="width: 79px; padding-top: 5px; margin-top: 2px;" class="GridRow1T">
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="width: 629px; margin-top: 2px;" class="GridRow1T">
                                        &nbsp;
                                    </td>
                                    <td style="width: 79px; padding-top: 5px; margin-top: 2px;" class="GridRow1T">
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                    </asp:FormView>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div class="Red">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 25px;">
                    &nbsp;<asp:Image ID="Image2" runat="server" ImageUrl="~/Images/select_.gif" />
                </td>
                <td class="GridLabelBG">
                    <asp:Label ID="lblMembers" runat="server" Text="Hotels In Group" SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td style="width: 25px; vertical-align: top;">
                    &nbsp;
                </td>
                <td class="GridBorder">
                    <asp:GridView ID="gvMembers" runat="server" SkinID="skGridView" AutoGenerateColumns="False"
                        DataKeyNames="HotelId" DataSourceID="dsMembers">
                        <Columns>
                            <asp:BoundField DataField="HotelGroupId" HeaderText="HotelGroupId" ReadOnly="True"
                                SortExpression="HotelGroupId" Visible="False" />
                            <asp:TemplateField HeaderText="Hotel" SortExpression="HotelId">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="TextBox" DataSourceID="dsHotel"
                                        DataTextField="Hotel" DataValueField="HotelID" SelectedValue='<%# Bind("HotelId") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Hotel") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="650px" />
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/delete_inline.gif"
                                ShowDeleteButton="True">
                                <ItemStyle Width="25px" />
                            </asp:CommandField>
                        </Columns>
                        <EmptyDataTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="width: 602px;" class="GridRow1B">
                                        Hotel
                                    </td>
                                    <td style="width: 77px;" class="GridRow1B">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                    </asp:GridView>
                    <asp:FormView ID="fvMembers" runat="server" DataKeyNames="HotelGroupId,HotelId" DataSourceID="dsMembers">
                        <InsertItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="width: 602px; margin-top: 2px;" class="GridRow1T">
                                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="TextBox" SelectedValue='<%# Bind("HotelId") %>'
                                            DataSourceID="dsHotel" DataTextField="Hotel" DataValueField="HotelID">
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width: 77px; margin-top: 2px;" class="GridRow1T">
                                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Insert"
                                            ImageUrl="~/Images/accept_inline.gif" CssClass="ImgButton" />
                                        <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                            ImageUrl="~/Images/decline_inline.gif" CssClass="ImgButton" />
                                    </td>
                                </tr>
                            </table>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="width: 602px; margin-top: 2px;" class="GridRow1T">
                                        &nbsp;
                                    </td>
                                    <td style="width: 77px; padding-top: 5px; margin-top: 2px;" class="GridRow1T">
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="width: 602px; margin-top: 2px;" class="GridRow1T">
                                        &nbsp;
                                    </td>
                                    <td style="width: 77px; padding-top: 5px; margin-top: 2px;" class="GridRow1T">
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                    </asp:FormView>
                </td>
            </tr>
        </table>
    </div>
    <asp:ObjectDataSource ID="dsGroups" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsGroupsTableAdapters.HotelGroupTableAdapter"
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_HotelGroupID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="HotelGroup" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Original_HotelGroupID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="HotelGroup" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsMembers" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByGroup" TypeName="dsGroupsTableAdapters.HotelGroupMemberTableAdapter"
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:ControlParameter ControlID="gvGroups" Name="Original_HotelGroupId" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter Name="Original_HotelId" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Original_HotelGroupId" Type="Int32" />
            <asp:Parameter Name="Original_HotelId" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="gvGroups" Name="HotelGroupID" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="gvGroups" Name="HotelGroupId" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter Name="HotelId" Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsHotel" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="dsGroupsTableAdapters.HotelTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="gvGroups" Name="HotelGroupID" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <%--</ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>
