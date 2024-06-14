<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="ContactType.aspx.vb" Inherits="Maintenance_ContactType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Contact Type
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" runat="Server">
    <asp:HiddenField ID="dummy" runat="server" />
    <div class="Blue">
        <br />
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblCType" runat="server" Text="Contact Type" SkinID="skGridLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvCType" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="ContactTypeID" DataSourceID="dsCType" SkinID="skGridView">
                        <Columns>
                            <asp:TemplateField HeaderText="Code" SortExpression="ContactTypeID">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ContactTypeID") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ContactTypeID") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="50px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Type" SortExpression="ContactType">
                                <EditItemTemplate>
                            <asp:TextBox ID="txtEType" runat="server" Text='<%# Bind("ContactType") %>' MaxLength="50" CssClass="TextBox" Width="295px" />
                                        <asp:RequiredFieldValidator ID="reqEType" runat="server" ErrorMessage="This is required field!" ControlToValidate="txtEType" Display="None" />
                                        <asp:ValidatorCalloutExtender ID="reqETypeExt" runat="server" TargetControlID="reqEType" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ContactType") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="300px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Contact For" SortExpression="ContactFor">
                                <EditItemTemplate>
                                        <asp:DropDownList ID="cbEFor" runat="server" SelectedValue='<%# Bind("ContactFor") %>' CssClass="TextBox" >
                                            <asp:ListItem Value="H">Hotel</asp:ListItem>
                                            <asp:ListItem Value="T">TO</asp:ListItem>
                                            <asp:ListItem Value="">Hotel & TO</asp:ListItem>
                                        </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("CFor") %>' />
                                </ItemTemplate>
                                <ItemStyle Width="120px" />
                            </asp:TemplateField>
                            <asp:CommandField CancelImageUrl="~/Images/decline_inline.gif" ShowEditButton="True"
                                ButtonType="Image" EditImageUrl="~/Images/edit_inline.gif" UpdateImageUrl="~/Images/accept_inline.gif">
                                <ControlStyle CssClass="ImgButton" />
                                <ItemStyle Width="50px" />
                            </asp:CommandField>
                            <asp:TemplateField InsertVisible="False" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="false" 
                                        CommandName="Delete" ImageUrl="~/Images/delete_inline.gif" 
                                        onclientclick="if (!confirm('Are you sure you want to delete this record?')) return;"  />
                                </ItemTemplate>
                                <EditItemTemplate>&nbsp;</EditItemTemplate>
                                <ItemStyle Width="25px" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:FormView ID="fvCType" runat="server" DataKeyNames="ContactTypeID" 
                        DataSourceID="dsCType">
                        <InsertItemTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                <tr class="GridRow1T">
                                    <td style="width: 50px; height: 30px;">
                            <asp:TextBox ID="txtCode" runat="server" Text='<%# Bind("ContactTypeID") %>'
                                            Width="45px" CssClass="TextBox" MaxLength="3" />
                                        <asp:RequiredFieldValidator ID="reqCode" runat="server" ErrorMessage="This is required field!" ControlToValidate="txtCode" Display="None" />
                                        <asp:ValidatorCalloutExtender ID="reqCodeExt" runat="server" TargetControlID="reqCode" />
                                    </td>
                                    <td style="width: 300px;">
                            <asp:TextBox ID="txtType" runat="server" Text='<%# Bind("ContactType") %>' MaxLength="50" CssClass="TextBox" Width="295px" />
                                        <asp:RequiredFieldValidator ID="reqType" runat="server" ErrorMessage="This is required field!" ControlToValidate="txtType" Display="None" />
                                        <asp:ValidatorCalloutExtender ID="reqTypeExt" runat="server" TargetControlID="reqType" />
                                    </td>
                                    <td style="width: 120px;">
                                        <asp:DropDownList ID="cbFor" runat="server" SelectedValue='<%# Bind("ContactFor") %>' CssClass="TextBox" >
                                            <asp:ListItem Value="H">Hotel</asp:ListItem>
                                            <asp:ListItem Value="T">TO</asp:ListItem>
                                            <asp:ListItem Value="">Hotel & TO</asp:ListItem>
                                        </asp:DropDownList>
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
                                    <td style="width: 470px; height: 30px;">
                                        &nbsp;
                                    </td>
                                    <td style="width: 75px; padding-left: 5px;">
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                <tr class="GridRow1T">
                                    <td style="width: 470px; height: 30px;">
                                        &nbsp;
                                    </td>
                                    <td style="width: 75px; padding-left: 5px;">
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                    </asp:FormView>
                    <asp:ObjectDataSource ID="dsCType" runat="server" DeleteMethod="Delete" 
                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                        SelectMethod="GetDataFor" 
                        TypeName="dsMaintBasicTableAdapters.ContactTypeTableAdapter" 
                        UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_ContactTypeID" Type="String" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ContactType" Type="String" />
                            <asp:Parameter Name="ContactFor" Type="String" />
                            <asp:Parameter Name="Original_ContactTypeID" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ContactTypeID" Type="String" />
                            <asp:Parameter Name="ContactType" Type="String" />
                            <asp:Parameter Name="ContactFor" Type="String" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
        <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
            PopupDragHandleControlID="popLabel" CancelControlID="btnNo" DropShadow="True"
            BackgroundCssClass="modalBackground" TargetControlID="dummy" X="200" Y="200">
        </asp:ModalPopupExtender>
        <asp:Panel ID="popPanel" runat="server" Width="300px" BackColor="White" Style="display: none">
            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td class="GridLabelBG">
                        <asp:Label ID="popLabel" runat="server" Text="Delete Market" SkinID="skGridLabel"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="GridBorder">
                        <p style="text-align: center;">
                            <asp:Label ID="popMessage" runat="server" Text="Message"></asp:Label>
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
