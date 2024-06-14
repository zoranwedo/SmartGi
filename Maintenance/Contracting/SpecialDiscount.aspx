<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Contracting/masterContracting.master" AutoEventWireup="false" CodeFile="SpecialDiscount.aspx.vb" Inherits="Maintenance_Contracting_SpecialDiscount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Special Discounts
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContractingContent" Runat="Server">
    <asp:HiddenField ID="dummy" runat="server" />
    <div class="Blue">
        <br />
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblSpcDisc" runat="server" Text="Special Discounts" 
                        SkinID="skGridLabel" Enabled="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gridSpcDisc" runat="server" SkinID="skGridView" AutoGenerateColumns="False"
                        DataSourceID="dsSpcDisc" DataKeyNames="DiscountTypeID" SelectedIndex="0" 
                        ShowFooter="True" >
                        <Columns>
                            <asp:CommandField SelectImageUrl="~/Images/select_.gif" ShowCancelButton="False"
                                ShowSelectButton="True" ButtonType="Image">
                                <ItemStyle Width="25px" />
                            </asp:CommandField>
                            <asp:BoundField DataField="DiscountType" HeaderText="Discount Type" 
                                SortExpression="Discount">
                            <ItemStyle Width="225px" />
                            </asp:BoundField>
                        </Columns>
                        <FooterStyle Height="30px" CssClass="GridRow1T" />
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:GridView>
                    <asp:ObjectDataSource ID="dsSpcDisc" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsMaintBasicTableAdapters.SpecialDiscountTypeTableAdapter"
                        UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_DiscountTypeID" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="DiscountType" Type="String" />
                            <asp:Parameter Name="Original_DiscountTypeID" Type="Int32" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="DiscountType" Type="String" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div class="Red">
        <asp:Panel ID="pnlDiscount" runat="server">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td style="width: 25px;">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/select_.gif" />
                    </td>
                    <td class="GridLabelBG">
                        <asp:Label ID="lblDiscValue" runat="server" Text="Discount for Selected Type" 
                        SkinID="skGridLabel" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 25px;">
                        &nbsp;
                    </td>
                    <td class="GridBorder">
                        <asp:GridView ID="gridDiscValue" runat="server" SkinID="skGridView" AllowSorting="True"
                        AutoGenerateColumns="False" DataKeyNames="DiscountTypeId" 
                        DataSourceID="dsDiscValue">
                            <Columns>
                                <asp:BoundField DataField="DiscountTypeId" HeaderText="DiscountTypeId"
                                ReadOnly="True" SortExpression="DiscountTypeId" Visible="False" />
                                <asp:TemplateField HeaderText="Value" SortExpression="DiscountValue">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("DiscountValue") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("DiscountValue") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ControlStyle CssClass="TextBox" />
                                    <ItemStyle Width="150px" />
                                </asp:TemplateField>
                                <asp:CommandField CancelImageUrl="~/Images/decline_inline.gif" ShowEditButton="True"
                                ButtonType="Image" EditImageUrl="~/Images/edit_inline.gif" 
                                UpdateImageUrl="~/Images/accept_inline.gif">
                                    <ControlStyle CssClass="ImgButton" />
                                    <ItemStyle Width="50px" />
                                </asp:CommandField>
                                <asp:TemplateField InsertVisible="False" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="false" 
                                        CommandName="Delete" ImageUrl="~/Images/delete_inline.gif" />
                                        <asp:ModalPopupExtender ID="mpDelete" runat="server" PopupControlID="popPanel" 
                                            CancelControlID="btnNo"  OkControlID="btnYes" DropShadow="True" Enabled="True"
                                            BackgroundCssClass="modalBackground" X="200" Y="200"
                                        TargetControlID="btnDelete">
                                        </asp:ModalPopupExtender>
                                        <asp:ConfirmButtonExtender ID="cbDelete" runat="server" Enabled="True"
                                        TargetControlID="btnDelete" DisplayModalPopupID="mpDelete">
                                        </asp:ConfirmButtonExtender>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        &nbsp;
                                    </EditItemTemplate>
                                    <ItemStyle Width="25px" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:FormView ID="newDiscValue" runat="server" DataKeyNames="DiscountTypeId" 
                        DataSourceID="dsDiscValue">
                            <InsertItemTemplate>
                                <table cellpadding="0" cellspacing="0" border="0" 
                                style="border-style: None; border-collapse: collapse;">
                                    <tr class="GridRowLast">
                                        <td style="width: 150px; height: 30px;">
                                            <asp:TextBox ID="DiscValueTextBox" runat="server" 
                                            Text='<%# Bind("DiscountValue") %>' CssClass="TextBox" />
                                            <asp:RequiredFieldValidator ID="reqDiscValue" runat="server" 
                                            ErrorMessage="This is required field!" ControlToValidate="DiscValueTextBox" 
                                            Display="None" />
                                            <asp:ValidatorCalloutExtender ID="reqDiscValueExt" runat="server" 
                                            TargetControlID="reqDiscValue" HighlightCssClass="WaterMark">
                                            </asp:ValidatorCalloutExtender>
                                        </td>
                                        <td style="width: 75px; padding-left: 5px;">
                                            <asp:ImageButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                            ImageUrl="~/Images/accept_inline.gif" CssClass="ImgButton" />
                                            <asp:ImageButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                            CommandName="Cancel" ImageUrl="~/Images/decline_inline.gif" 
                                            CssClass="ImgButton" />
                                        </td>
                                    </tr>
                                </table>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <table cellpadding="0" cellspacing="0" border="0" 
                                style="border-style: None; border-collapse: collapse;">
                                    <tr class="GridRowLast">
                                        <td style="width: 150px; height: 30px;">
                                            &nbsp;
                                        </td>
                                        <td style="width: 75px; padding-left: 5px;">
                                            <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" 
                                            CommandName="New" />
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <table cellpadding="0" cellspacing="0" border="0" 
                                style="border-style: None; border-collapse: collapse;">
                                    <tr class="GridRowLast">
                                        <td style="width: 150px; height: 30px;">
                                            &nbsp;
                                        </td>
                                        <td style="width: 75px; padding-left: 5px;">
                                            <asp:Button ID="btnNew0" runat="server" Text="New" SkinID="skBtnBase" 
                                            CommandName="New" />
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                        </asp:FormView>
                        <asp:ObjectDataSource ID="dsDiscValue" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByDiscountTypeId"
                        TypeName="dsMaintBasicTableAdapters.SpecialDiscountValueTableAdapter" 
                        UpdateMethod="Update">
                            <DeleteParameters>
                                <asp:Parameter Name="Original_DiscountTypeId" Type="Int32" />
                                <asp:Parameter Name="Original_DiscountValue" Type="Decimal" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="gridDiscValue" Name="DiscountTypeId" 
                                PropertyName="SelectedValue" Type="Int32" />
                                <asp:Parameter Name="DiscountValue" Type="Decimal" />
                                <asp:Parameter Name="Original_DiscountTypeId" Type="Int32" />
                                <asp:Parameter Name="Original_DiscountValue" Type="Decimal" />
                            </UpdateParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="gridSpcDisc" Name="DiscountTypeId" PropertyName="SelectedValue"
                                Type="Int32" />
                            </SelectParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="gridDiscValue" Name="DiscountTypeId" 
                                PropertyName="SelectedValue" Type="Int32" />
                                <asp:Parameter Name="DiscountValue" Type="Decimal" />
                            </InsertParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <br />
    </div>
    
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
                        <asp:Label ID="popMessage" runat="server" Text="Message"></asp:Label>
                    </p>
                    <p style="text-align: right;" class="FooterRow">
                        <br />
                        <asp:Button ID="btnYes" runat="server" Text="Yes" SkinID="skBtnBase" />&nbsp;
                        <asp:Button ID="btnNo" runat="server" Text="No" SkinID="skBtnBase" />&nbsp;
                    </p>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

