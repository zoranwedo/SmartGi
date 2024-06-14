<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Hotel/masterHotels.master"
    AutoEventWireup="false" CodeFile="HotelPolicy.aspx.vb" Inherits="Maintenance_Hotel_HotelPolicy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Hotel Children Policy
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HotelContent" runat="Server">
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gridPolicy" runat="server" AutoGenerateColumns="False" DataKeyNames="HotelID,Category"
                        DataSourceID="dsPolicy" SkinID="skGridView" >
                        <Columns>
                            <asp:BoundField DataField="HotelID" HeaderText="HotelID" ReadOnly="True" SortExpression="HotelID"
                                Visible="False" />
                            <asp:BoundField DataField="Category" DataFormatString="Category {0}" HeaderText="Category"
                                ReadOnly="True" SortExpression="Category">
                                <ItemStyle Width="80px" />
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ChldLabel" HeaderText="Label" SortExpression="ChldLabel">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ControlStyle CssClass="TextBox" />
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ChldShLabel" HeaderText="Short" SortExpression="ChldShLabel">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ControlStyle CssClass="TextBox" />
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="From" SortExpression="ChldFrom">
                                <HeaderStyle HorizontalAlign="Left" />
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtFrom" runat="server" CssClass="TextBox" Enabled='<%# Eval("Category")=1 %>' Text='<%# Bind("ChldFrom") %>' />
                                    <asp:CompareValidator ID="intFrom" runat="server" ControlToValidate="txtFrom" Operator="DataTypeCheck" Type="Integer" SkinID="skInteger" />
                                    <asp:ValidatorCalloutExtender ID="extFrom" runat="server" TargetControlID="intFrom" SkinID="skExtender" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblFrom" runat="server" Text='<%# Bind("ChldFrom") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="80px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Less Than" SortExpression="ChldMax">
                                <HeaderStyle HorizontalAlign="Left" />
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtMax" runat="server" Text='<%# Bind("ChldMax") %>' CssClass="TextBox" />
                                    <asp:CompareValidator ID="intMax" runat="server" ControlToValidate="txtMax" Operator="DataTypeCheck" Type="Integer" SkinID="skInteger" />
                                    <asp:ValidatorCalloutExtender ID="extMax" runat="server" TargetControlID="intMax" SkinID="skExtender" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblMax" runat="server" Text='<%# Bind("ChldMax") %>' />
                                </ItemTemplate>
                                <ItemStyle Width="80px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Type" SortExpression="ChldType">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="cbType" runat="server" CssClass="TextBox" SelectedValue='<%# Bind("ChldType") %>'>
                                        <asp:ListItem Value="">(no category)</asp:ListItem>
                                        <asp:ListItem Value="I">I (Infant)</asp:ListItem>
                                        <asp:ListItem Value="C">C (Child)</asp:ListItem>
                                        <asp:ListItem Value="J">J (Junior)</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ChldType") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="120px" />
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Image" CancelImageUrl="~/Images/decline_inline.gif"
                                EditImageUrl="~/Images/edit_inline.gif" ShowEditButton="True" UpdateImageUrl="~/Images/accept_inline.gif">
                                <ItemStyle Width="50px" />
                            </asp:CommandField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
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
    <asp:ObjectDataSource ID="dsPolicy" runat="server" SelectMethod="GetDataByHotelID"
        TypeName="dsMaintHotelTableAdapters.SelectHotlePolicyTableAdapter" UpdateMethod="HotelPolicyUpdate">
        <UpdateParameters>
            <asp:Parameter Name="HotelID" Type="Int32" />
            <asp:Parameter Name="Category" Type="Int32" />
            <asp:Parameter Name="ChldLabel" Type="String" />
            <asp:Parameter Name="ChldShLabel" Type="String" />
            <asp:Parameter Name="ChldFrom" Type="Int16" />
            <asp:Parameter Name="ChldMax" Type="Int16" />
            <asp:Parameter Name="ChldType" Type="String" />
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="HotelID" QueryStringField="HotelID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
