<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Accounting/masterTypes.master"
    AutoEventWireup="false" CodeFile="AccTypes.aspx.vb" Inherits="Maintenance_Accounting_AccTypes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Accounting Types
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AccountContent" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="dummy" runat="server" />
            <div class="Blue">
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="GridLabelBG">
                            <asp:Label ID="lblAccTypes" runat="server" Text="Accounting Transaction Types" SkinID="skGridLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder">
                            <asp:GridView ID="gridMealPlan" runat="server" SkinID="skGridView" AutoGenerateColumns="False"
                                DataSourceID="dsAccTranType" DataKeyNames="AccTranTypeID">
                                <Columns>
                                    <asp:BoundField DataField="AccTranTypeID" HeaderText="TypeID" ReadOnly="True" SortExpression="AccTranTypeID">
                                        <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="AccTranType" HeaderText="Type" SortExpression="AccTranType">
                                        <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="AccTranTypeName" HeaderText="TypeName" SortExpression="AccTranTypeName">
                                        <ItemStyle Width="250px" />
                                    </asp:BoundField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            &nbsp;
                                        </ItemTemplate>
                                        <ItemStyle Width="50px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Delete"
                                                ImageUrl="~/Images/delete_inline.gif" OnClientClick="return confirm('Are you sure you want to delete the record')"
                                                Text="Delete" />
                                        </ItemTemplate>
                                        <ItemStyle Width="25px" />
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:GridView>
                            <asp:FormView ID="newAccTranType" runat="server" DataSourceID="dsAccTranType">
                                <InsertItemTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                        <tr class="GridRow1T">
                                            <td style="width: 80px; padding-right: 2px; height: 30px;">
                                                <asp:TextBox ID="TypeIDTextBox" runat="server" Text='<%# Bind("AccTranTypeID") %>'
                                                    CssClass="TextBox" />
                                                <asp:RequiredFieldValidator ID="reqTypeID" runat="server" ErrorMessage="This is required field!"
                                                    ControlToValidate="TypeIDTextBox" Display="None" />
                                                <asp:ValidatorCalloutExtender ID="reqTypeIDExt" runat="server" TargetControlID="reqTypeID"
                                                    HighlightCssClass="WaterMark">
                                                </asp:ValidatorCalloutExtender>
                                            </td>
                                            <td style="width: 80px; padding-right: 2px;">
                                                <asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("AccTranType") %>' CssClass="TextBox" />
                                                <asp:RequiredFieldValidator ID="reqType" runat="server" ErrorMessage="This is required field!"
                                                    ControlToValidate="TypeTextBox" Display="None" />
                                                <asp:ValidatorCalloutExtender ID="reqreqTypeExt" runat="server" TargetControlID="reqType"
                                                    HighlightCssClass="WaterMark">
                                                </asp:ValidatorCalloutExtender>
                                            </td>
                                            <td style="width: 250px;">
                                                <asp:TextBox ID="TypeNameTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("AccTranTypeName") %>' />
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
                                            <td style="width: 416px; height: 30px;">
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
                                            <td style="width: 416px; height: 30px;">
                                                &nbsp;
                                            </td>
                                            <td style="width: 75px; padding-left: 5px;">
                                                <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                            </asp:FormView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="GridLabelBG">
                            <asp:Label ID="Label1" runat="server" Text="Accounting Types" SkinID="skGridLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder">
                            <asp:GridView ID="GridView1" runat="server" SkinID="skGridView" AutoGenerateColumns="False"
                                DataSourceID="dsAccType" DataKeyNames="AccTypeID">
                                <Columns>
                                    <asp:BoundField DataField="AccTypeID" HeaderText="TypeID" ReadOnly="True" SortExpression="AccTypeID">
                                        <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="AccType" HeaderText="Type" SortExpression="AccType">
                                        <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="AccTypeName" HeaderText="TypeName" SortExpression="AccTypeName">
                                        <ItemStyle Width="250px" />
                                    </asp:BoundField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            &nbsp;
                                        </ItemTemplate>
                                        <ItemStyle Width="50px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Delete"
                                                ImageUrl="~/Images/delete_inline.gif" OnClientClick="return confirm('Are you sure you want to delete the record')"
                                                Text="Delete" Visible='<%# Eval("AccTypeID") <> "01" %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="25px" />
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:GridView>
                            <asp:FormView ID="FormView1" runat="server" DataSourceID="dsAccType">
                                <InsertItemTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                        <tr class="GridRow1T">
                                            <td style="width: 80px; padding-right: 2px; height: 30px;">
                                                <asp:TextBox ID="TypeIDTextBox" runat="server" Text='<%# Bind("AccTypeID") %>' CssClass="TextBox" />
                                                <asp:RequiredFieldValidator ID="reqTypeID" runat="server" ErrorMessage="This is required field!"
                                                    ControlToValidate="TypeIDTextBox" Display="None" />
                                                <asp:ValidatorCalloutExtender ID="reqTypeIDExt" runat="server" TargetControlID="reqTypeID"
                                                    HighlightCssClass="WaterMark">
                                                </asp:ValidatorCalloutExtender>
                                            </td>
                                            <td style="width: 80px; padding-right: 2px;">
                                                <asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("AccType") %>' CssClass="TextBox" />
                                                <asp:RequiredFieldValidator ID="reqType" runat="server" ErrorMessage="This is required field!"
                                                    ControlToValidate="TypeTextBox" Display="None" />
                                                <asp:ValidatorCalloutExtender ID="reqreqTypeExt" runat="server" TargetControlID="reqType"
                                                    HighlightCssClass="WaterMark">
                                                </asp:ValidatorCalloutExtender>
                                            </td>
                                            <td style="width: 250px;">
                                                <asp:TextBox ID="TypeNameTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("AccTypeName") %>' />
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
                                            <td style="width: 416px; height: 30px;">
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
                                            <td style="width: 416px; height: 30px;">
                                                &nbsp;
                                            </td>
                                            <td style="width: 75px; padding-left: 5px;">
                                                <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                            </asp:FormView>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="GridLabelBG">
                            <asp:Label ID="Label2" runat="server" Text="Accounting Document Types" SkinID="skGridLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder">
                            <asp:GridView ID="GridView2" runat="server" SkinID="skGridView" AutoGenerateColumns="False"
                                DataSourceID="dsAccDocType" DataKeyNames="AccDocTypeID">
                                <Columns>
                                    <asp:BoundField DataField="AccDocTypeID" HeaderText="TypeID" ReadOnly="True" SortExpression="AccDocTypeID">
                                        <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="AccDocType" HeaderText="Type" SortExpression="AccDocType">
                                        <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="AccDocTypeName" HeaderText="TypeName" SortExpression="AccDocTypeName">
                                        <ItemStyle Width="250px" />
                                    </asp:BoundField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            &nbsp;
                                        </ItemTemplate>
                                        <ItemStyle Width="50px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Delete"
                                                ImageUrl="~/Images/delete_inline.gif" OnClientClick="return confirm('Are you sure you want to delete the record')"
                                                Text="Delete" />
                                        </ItemTemplate>
                                        <ItemStyle Width="25px" />
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:GridView>
                            <asp:FormView ID="FormView2" runat="server" DataSourceID="dsAccDocType">
                                <InsertItemTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                        <tr class="GridRow1T">
                                            <td style="width: 80px; padding-right: 2px; height: 30px;">
                                                <asp:TextBox ID="TypeIDTextBox" runat="server" Text='<%# Bind("AccDocTypeID") %>'
                                                    CssClass="TextBox" />
                                                <asp:RequiredFieldValidator ID="reqTypeID" runat="server" ErrorMessage="This is required field!"
                                                    ControlToValidate="TypeIDTextBox" Display="None" />
                                                <asp:ValidatorCalloutExtender ID="reqTypeIDExt" runat="server" TargetControlID="reqTypeID"
                                                    HighlightCssClass="WaterMark">
                                                </asp:ValidatorCalloutExtender>
                                            </td>
                                            <td style="width: 80px; padding-right: 2px;">
                                                <asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("AccDocType") %>' CssClass="TextBox" />
                                                <asp:RequiredFieldValidator ID="reqType" runat="server" ErrorMessage="This is required field!"
                                                    ControlToValidate="TypeTextBox" Display="None" />
                                                <asp:ValidatorCalloutExtender ID="reqreqTypeExt" runat="server" TargetControlID="reqType"
                                                    HighlightCssClass="WaterMark">
                                                </asp:ValidatorCalloutExtender>
                                            </td>
                                            <td style="width: 250px;">
                                                <asp:TextBox ID="TypeNameTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("AccDocTypeName") %>' />
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
                                            <td style="width: 416px; height: 30px;">
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
                                            <td style="width: 416px; height: 30px;">
                                                &nbsp;
                                            </td>
                                            <td style="width: 75px; padding-left: 5px;">
                                                <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                            </asp:FormView>
                        </td>
                    </tr>
                </table>
                <asp:ObjectDataSource ID="dsAccType" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsAccountTableAdapters.AccTypeTableAdapter"
                    UpdateMethod="Update" FilterExpression="AccTypeID&gt;0">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_AccTypeID" Type="String" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="AccType" Type="String" />
                        <asp:Parameter Name="AccTypeName" Type="String" />
                        <asp:Parameter Name="Original_AccTypeID" Type="String" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="AccTypeID" Type="String" />
                        <asp:Parameter Name="AccType" Type="String" />
                        <asp:Parameter Name="AccTypeName" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsAccTranType" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsAccountTableAdapters.AccTranTypeTableAdapter"
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_AccTranTypeID" Type="String" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="AccTranType" Type="String" />
                        <asp:Parameter Name="AccTranTypeName" Type="String" />
                        <asp:Parameter Name="Original_AccTranTypeID" Type="String" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="AccTranTypeID" Type="String" />
                        <asp:Parameter Name="AccTranType" Type="String" />
                        <asp:Parameter Name="AccTranTypeName" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsAccDocType" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsAccountTableAdapters.AccDocTypeTableAdapter"
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_AccDocTypeID" Type="String" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="AccDocType" Type="String" />
                        <asp:Parameter Name="AccDocTypeName" Type="String" />
                        <asp:Parameter Name="Original_AccDocTypeID" Type="String" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="AccDocTypeID" Type="String" />
                        <asp:Parameter Name="AccDocType" Type="String" />
                        <asp:Parameter Name="AccDocTypeName" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
                    CancelControlID="btnNo" OkControlID="btnYes" DropShadow="True" Enabled="True"
                    BackgroundCssClass="modalBackground" X="200" Y="200" TargetControlID="dummy">
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
                                <p style="text-align: right;">
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
