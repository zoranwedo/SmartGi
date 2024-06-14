<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="Taxes.aspx.vb" Inherits="Maintenance_Taxes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Taxes
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" runat="Server">
    <div class="Blue">
        <asp:Panel ID="pnlMPAddOn" runat="server">
            <table cellpadding="0" cellspacing="2px">
                <tr>
                    <td class="GridLabelBG" >
                        <asp:Label ID="Label1" runat="server" SkinID="skGridLabel" Text="Taxes and Fees " />
                    </td>
                </tr>
                <tr>
                    <td class="GridBorder" style="vertical-align: top;">
                        <asp:GridView ID="gridMPAdd" runat="server" AutoGenerateColumns="False" DataKeyNames="AddID"
                            DataSourceID="dsHotelMPAdd" SkinID="skGridView">
                            <FooterStyle Font-Italic="True" HorizontalAlign="Right" />
                            <HeaderStyle HorizontalAlign="Left" />
                            <Columns>
                                <asp:BoundField DataField="AddName" HeaderText="Name" SortExpression="AddName">
                                    <ItemStyle Width="150px" />
                                    <ControlStyle CssClass="TextBox" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Type" SortExpression="AddType">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text="add-in tax" Visible='<%# Eval("AddType")=0 %>' />
                                        <asp:Label ID="Label3" runat="server" Text="add-in fee" Visible='<%# Eval("AddType")=1 %>' />
                                        <asp:Label ID="Label4" runat="server" Text="add-on tax" Visible='<%# Eval("AddType")=2 %>' />
                                        <asp:Label ID="Label5" runat="server" Text="add-on fee" Visible='<%# Eval("AddType")=3 %>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddlType" runat="server" SelectedValue='<%# Bind("AddType") %>'
                                            CssClass="TextBox">
                                            <asp:ListItem Value="0">add-in tax</asp:ListItem>
                                            <asp:ListItem Value="1">add-in fee</asp:ListItem>
                                            <asp:ListItem Value="2">add-on tax</asp:ListItem>
                                            <asp:ListItem Value="3">add-on fee</asp:ListItem>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemStyle Width="100px" />
                                </asp:TemplateField>
                                <asp:CheckBoxField DataField="IsPercent" HeaderText="%" SortExpression="IsPercent">
                                    <ItemStyle Width="20px" />
                                </asp:CheckBoxField>
                                <asp:TemplateField HeaderText="Value" SortExpression="Value">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtValue" runat="server" Text='<%# Bind("Value") %>' CssClass="TextBox" />
                                        <asp:RequiredFieldValidator ID="reqValue" runat="server" ErrorMessage="This is required field!"
                                            ControlToValidate="txtValue" Display="None" />
                                        <asp:ValidatorCalloutExtender ID="reqValueExt" runat="server" TargetControlID="reqValue"
                                            HighlightCssClass="WaterMark">
                                        </asp:ValidatorCalloutExtender>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtValue"
                                            ErrorMessage="Must input number" Operator="DataTypeCheck" Type="Double" Display="None"></asp:CompareValidator>
                                        <asp:ValidatorCalloutExtender ID="CompareValidator1_ValidatorCalloutExtender" runat="server"
                                            Enabled="True" TargetControlID="CompareValidator1">
                                        </asp:ValidatorCalloutExtender>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Value") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="80px" />
                                </asp:TemplateField>
                                <asp:CommandField ButtonType="Image" EditImageUrl="~/Images/edit_inline.gif" ShowEditButton="True"
                                    CancelImageUrl="~/Images/decline_inline.gif" UpdateImageUrl="~/Images/accept_inline.gif">
                                    <ControlStyle CssClass="ImgButton" />
                                    <ItemStyle Width="50px" />
                                </asp:CommandField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Delete"
                                            ImageUrl="~/Images/delete_inline.gif" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete the record')" />
                                    </ItemTemplate>
                                    <ItemStyle Width="25px" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:FormView ID="newMPAddOn" runat="server" DataSourceID="dsHotelMPAdd" DataKeyNames="AddID">
                            <InsertItemTemplate>
                                <table border="0" cellpadding="0" cellspacing="0" style="border-style: None; border-collapse: collapse;">
                                    <tr class="GridRow1T">
                                        <td style="width: 150px; height: 30px;">
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("AddName") %>' CssClass="TextBox" />
                                        </td>
                                        <td style="width: 105px;">
                                            <asp:DropDownList ID="ddlType" runat="server" SelectedValue='<%# Bind("AddType") %>'
                                                CssClass="TextBox">
                                                <asp:ListItem Value="0">add-in tax</asp:ListItem>
                                                <asp:ListItem Value="1">add-in fee</asp:ListItem>
                                                <asp:ListItem Value="2">add-on tax</asp:ListItem>
                                                <asp:ListItem Value="3">add-on fee</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td style="width: 20px; text-align: center;">
                                            <asp:CheckBox ID="cbPercent" runat="server" Checked='<%# Bind("IsPercent") %>' Text="" BorderStyle="None" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox2" runat="server" Width="80px" Text='<%# Bind("Value") %>'
                                                CssClass="TextBox" />
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox2"
                                                ErrorMessage="Must input number" Operator="DataTypeCheck" Type="Double" Display="None"></asp:CompareValidator>
                                            <asp:ValidatorCalloutExtender ID="CompareValidator1_ValidatorCalloutExtender" runat="server"
                                                Enabled="True" TargetControlID="CompareValidator1">
                                            </asp:ValidatorCalloutExtender>
                                        </td>
                                        <td style="width: 75px;">
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
                                        <td style="width: 360px; height: 30px;">
                                            &nbsp;
                                        </td>
                                        <td style="width: 75px;">
                                            <asp:Button ID="btnNew" runat="server" CommandName="New" SkinID="skBtnBase" Text="New" />
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <table border="0" cellpadding="0" cellspacing="0" style="border-style: None; border-collapse: collapse;">
                                    <tr class="GridRow1T">
                                        <td style="width: 360px; height: 30px;">
                                            &nbsp;
                                        </td>
                                        <td style="width: 75px;">
                                            <asp:Button ID="btnNew0" runat="server" CommandName="New" SkinID="skBtnBase" Text="New" />
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                        </asp:FormView>
                        <asp:ObjectDataSource ID="dsHotelMPAdd" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                            SelectMethod="GetData" TypeName="dsMaintHotelTableAdapters.TaxesTableAdapter"
                            UpdateMethod="Update" OldValuesParameterFormatString="original_{0}">
                            <DeleteParameters>
                                <asp:Parameter Name="Original_AddID" Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="AddType" Type="Int16" />
                                <asp:Parameter Name="AddName" Type="String" />
                                <asp:Parameter Name="IsPercent" Type="Boolean" />
                                <asp:Parameter Name="Value" Type="Decimal" />
                                <asp:Parameter Name="Original_AddID" Type="Int32" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:Parameter Name="AddType" Type="Int16" />
                                <asp:Parameter Name="AddName" Type="String" />
                                <asp:Parameter Name="IsPercent" Type="Boolean" />
                                <asp:Parameter Name="Value" Type="Decimal" />
                            </InsertParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
            </table>
        </asp:Panel>
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
