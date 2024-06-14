<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/TO/TOMaster.master"
    EnableEventValidation="true" AutoEventWireup="false" CodeFile="TOContacts.aspx.vb"
    Inherits="Maintenance_TO_TOContacts" %>

<asp:Content ID="Content2" ContentPlaceHolderID="TOTitle" runat="Server">
    Tour Operator Contacts
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="TOContent" runat="Server">
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gwTourOp" runat="server" DataSourceID="dsTOContacts" DataKeyNames="ContactID"
                        SkinID="skGridView" SelectedIndex="0" AllowPaging="True">
                        <Columns>
                            <asp:CommandField ButtonType="Image" InsertVisible="False" SelectImageUrl="~/Images/select_.gif"
                                ShowCancelButton="False" ShowSelectButton="True">
                                <ItemStyle Width="25px" />
                            </asp:CommandField>
                            <asp:BoundField DataField="ContactID" HeaderText="ContactID" ReadOnly="True" SortExpression="ContactID"
                                InsertVisible="False" Visible="False"></asp:BoundField>
                            <asp:BoundField DataField="ContactTypeId" HeaderText="Type" SortExpression="ContactTypeId">
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
                                    <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="false" CommandName="Delete"
                                        ImageUrl="~/Images/delete_inline.gif" Text="Button" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    &nbsp;</EditItemTemplate>
                                <ItemStyle Width="25px" />
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <asp:Panel ID="Panel1" runat="server" Width="915px" HorizontalAlign="Right">
                                <asp:Button ID="btnNew" runat="server" CommandName="New" OnClick="btnNew_Click" SkinID="skBtnBase"
                                    Text="New" />
                            </asp:Panel>
                        </EmptyDataTemplate>
                        <SelectedRowStyle CssClass="SelectRow1TB" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div class="Red">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="25">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/select_.gif" />
                        </td>
                        <td class="GridLabelBG">
                            <asp:Label ID="lblSelectedHotel" runat="server" SkinID="skGridLabel" Text="Selected Contact"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td class="GridBorder">
                            <asp:DetailsView ID="dvContact" runat="server" AutoGenerateRows="False" DataKeyNames="ContactID"
                                DataSourceID="dsContact" GridLines="None" SkinID="skDetailView" Width="600px">
                                <FieldHeaderStyle Width="120px" />
                                <Fields>
                                    <asp:TemplateField HeaderText="Name" SortExpression="Name">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>' />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>' CssClass="TextBox" />
                                            <asp:RequiredFieldValidator ID="reqTO" runat="server" ErrorMessage="This is required field!" Display="None" 
                                                ControlToValidate="TextBox1" />
                                            <asp:ValidatorCalloutExtender ID="reqTOExt" runat="server" HighlightCssClass="WaterMark" 
                                                TargetControlID="reqTO" />
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>' CssClass="TextBox" />
                                            <asp:RequiredFieldValidator ID="reqTO" runat="server" ErrorMessage="This is required field!" Display="None" 
                                                ControlToValidate="TextBox1" />
                                            <asp:ValidatorCalloutExtender ID="reqTOExt" runat="server" HighlightCssClass="WaterMark" 
                                                TargetControlID="reqTO" />
                                        </InsertItemTemplate>
                                        <HeaderStyle CssClass="GridRow2B" />
                                        <ItemStyle CssClass="GridRow2B" Font-Size="10pt" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ContactID" HeaderText="ContactID" InsertVisible="False"
                                        ReadOnly="True" SortExpression="ContactID" Visible="False" />
                                    <asp:TemplateField HeaderText="Contact Type Id" SortExpression="ContactTypeId">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="dsContactType"
                                                DataTextField="ContactType" DataValueField="ContactTypeID" SelectedValue='<%# Bind("ContactTypeId") %>'
                                                CssClass="TextBox">
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsContactType"
                                                DataTextField="ContactType" DataValueField="ContactTypeID" SelectedValue='<%# Bind("ContactTypeId") %>'
                                                CssClass="TextBox">
                                            </asp:DropDownList>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ContactTypeId") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title">
                                        <ControlStyle CssClass="TextBox" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address">
                                        <ControlStyle CssClass="TextBox" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="City" HeaderText="City" SortExpression="City">
                                        <ControlStyle CssClass="TextBox" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State">
                                        <ControlStyle CssClass="TextBox" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ZipCode" HeaderText="Zip Code" 
                                        SortExpression="ZipCode">
                                        <ControlStyle CssClass="TextBox" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country">
                                        <ControlStyle CssClass="TextBox" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Tel1" HeaderText="Tel1" SortExpression="Tel1">
                                        <ControlStyle CssClass="TextBox" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Tel2" HeaderText="Tel2" SortExpression="Tel2">
                                        <ControlStyle CssClass="TextBox" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile">
                                        <ControlStyle CssClass="TextBox" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Fax" HeaderText="Fax" SortExpression="Fax">
                                        <ControlStyle CssClass="TextBox" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Email1" HeaderText="Email1" SortExpression="Email1">
                                        <ControlStyle CssClass="TextBox" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Email2" HeaderText="Email2" SortExpression="Email2">
                                        <ControlStyle CssClass="TextBox" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note">
                                        <ControlStyle CssClass="TextBox" />
                                    </asp:BoundField>
                                    <asp:TemplateField ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update"
                                                Text="Update" />
                                            &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel"
                                                Text="Cancel" />
                                        </EditItemTemplate>
                                        <InsertItemTemplate>
                                            <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Insert"
                                                Text="Save" />
                                            &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel"
                                                Text="Cancel" />
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit"
                                                Text="Edit" />
                                            &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="New"
                                                Text="New" />
                                            &nbsp;<asp:Button ID="Button3" runat="server" CausesValidation="False" CommandName="Delete"
                                                Text="Delete" OnClientClick="return confirm('Are you sure you want to delete the record')" />
                                        </ItemTemplate>
                                        <ControlStyle BorderStyle="None" CssClass="Button" Font-Size="10pt" ForeColor="White" />
                                        <ItemStyle CssClass="ComandRow2T" Height="30px" HorizontalAlign="Right" VerticalAlign="Middle" />
                                    </asp:TemplateField>
                                </Fields>
                            </asp:DetailsView>
                        </td>
                    </tr>
                </table>
                <asp:ObjectDataSource ID="dsTOContacts" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataByTOID" TypeName="TourOperTableAdapters.ContactTableAdapter"
                    DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
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
                        <asp:QueryStringParameter Name="TourOpId" QueryStringField="TOID" Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
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
                <asp:ObjectDataSource ID="dsContactType" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataByTOCont" TypeName="TourOperTableAdapters.ContactTypeTableAdapter"
                    DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
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
                <asp:ObjectDataSource ID="dsContact" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataByContID" TypeName="TourOperTableAdapters.ContactTableAdapter"
                    DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="dvContact" Name="Original_ContactID" PropertyName="SelectedValue"
                            Type="Int32" />
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
                        <asp:ControlParameter ControlID="gwTourOp" Name="ContactID" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                    <InsertParameters>
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
                        <asp:Parameter Direction="InputOutput" Name="NewID" Type="Int32" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div class="Blue">
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
