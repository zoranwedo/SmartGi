<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Contracting/masterContracting.master"
    AutoEventWireup="false" CodeFile="ContractTitle.aspx.vb" Inherits="Maintenance_Contracting_ContractTitle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Contract Titles
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContractingContent" runat="Server">
    <asp:HiddenField ID="dummy" runat="server" />
    <div class="Blue">
        <br />
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblCtrTitle" runat="server" Text="Contract Title" SkinID="skGridLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gridCtrTitle" runat="server" SkinID="skGridView" AutoGenerateColumns="False"
                        DataSourceID="dsCtrTitle" DataKeyNames="ContractTitle">
                        <Columns>
                            <asp:BoundField DataField="ContractTitle" HeaderText="Title" SortExpression="ContractTitle">
                                <ItemStyle Width="450px" />
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Year" SortExpression="ContractYear" Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ContractYear") %>' MaxLength="4"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox1"
                                        ErrorMessage="Must input 4-digit number" Operator="DataTypeCheck" Type="Integer"
                                        Display="None"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator1_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator1">
                                    </asp:ValidatorCalloutExtender>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ContractYear") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                                <ItemStyle Width="80px" />
                            </asp:TemplateField>
                            <asp:CommandField CancelImageUrl="~/Images/decline_inline.gif" ShowEditButton="True"
                                ButtonType="Image" EditImageUrl="~/Images/edit_inline.gif" UpdateImageUrl="~/Images/accept_inline.gif">
                                <ControlStyle CssClass="ImgButton" />
                                <ItemStyle Width="50px" />
                            </asp:CommandField>
                            <asp:TemplateField InsertVisible="False" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="false" CommandName="Delete"
                                        ImageUrl="~/Images/delete_inline.gif" OnClientClick="return confirm('Are you sure you want to delete the record')" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    &nbsp;</EditItemTemplate>
                                <ItemStyle Width="25px" />
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:GridView>
                    <asp:FormView ID="newCtrTitle" runat="server" DataKeyNames="ContractTitle" DataSourceID="dsCtrTitle">
                        <InsertItemTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                <tr>
                                    <td class="GridRow1T" style="width: 450px; height: 30px;" valign="top">
                                        <asp:TextBox ID="CtrTitleTextBox" runat="server" Text='<%# Bind("ContractTitle") %>'
                                            Width="445px" CssClass="TextBox" MaxLength="30" />
                                        <asp:RequiredFieldValidator ID="reqCtrTitle" runat="server" ErrorMessage="This is required field!"
                                            ControlToValidate="CtrTitleTextBox" Display="None" />
                                        <asp:ValidatorCalloutExtender ID="reqCtrTitleExt" runat="server" TargetControlID="reqCtrTitle"
                                            HighlightCssClass="WaterMark">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                    <%--<td style="width: 80px;">
                                        <asp:TextBox ID="CtrYearTextBox" runat="server" 
                                            Text='<%# Bind("ContractYear") %>' Width="75px" CssClass="TextBox" 
                                            MaxLength="4" />
                                        <asp:RequiredFieldValidator ID="reqCtrYear" runat="server" ErrorMessage="This is required field!" ControlToValidate="CtrYearTextBox" Display="None" />
                                        <asp:ValidatorCalloutExtender ID="reqCtrYearExt" runat="server" TargetControlID="reqCtrTitle" HighlightCssClass="WaterMark"></asp:ValidatorCalloutExtender>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="CtrYearTextBox" 
                                            ErrorMessage="Must input 4-digit number" Operator="DataTypeCheck" 
                                            Type="Integer" Display="None"></asp:CompareValidator>
                                        <asp:ValidatorCalloutExtender ID="CompareValidator1_ValidatorCalloutExtender" 
                                            runat="server" Enabled="True" TargetControlID="CompareValidator1">
                                        </asp:ValidatorCalloutExtender>
                                    </td>--%>
                                    <td class="GridRow1T" style="width: 75px; padding-left: 5px;">
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
                                <tr>
                                    <td class="GridRow1T" style="width: 450px; height: 30px; padding-top: 5px;">
                                        &nbsp;
                                    </td>
                                    <td class="GridRow1T" style="width: 75px; padding-left: 5px; text-align: right; padding-top: 5px;">
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                    </td>
                                </tr>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                <tr>
                                    <td class="GridRow1T" style="width: 450px; height: 30px;">
                                        &nbsp;
                                    </td>
                                    <td style="width: 75px; padding-left: 5px;">
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                    </asp:FormView>
                    <asp:ObjectDataSource ID="dsCtrTitle" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsMaintBasicTableAdapters.ContractTitleTableAdapter"
                        UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_ContractTitle" Type="String" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ContractTitle" Type="String" />
                            <asp:Parameter Name="ContractYear" Type="Int16" />
                            <asp:Parameter Name="Original_ContractTitle" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ContractTitle" Type="String" />
                            <asp:Parameter Name="ContractYear" Type="Int16" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
        <%--<asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
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
        </asp:Panel>--%>
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
