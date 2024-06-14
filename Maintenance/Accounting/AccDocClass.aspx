<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Accounting/masterAccount.master"
    AutoEventWireup="false" CodeFile="AccDocClass.aspx.vb" Inherits="Maintenance_Accounting_AccDocClass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Accounting Document Class
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AccountContent" runat="Server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="dummy" runat="server" />
            <div class="Blue">
                <br />
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="GridLabelBG">
                            <asp:Label ID="lblMarket" runat="server" Text="Accounting Document Class" SkinID="skGridLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder">
                            <asp:GridView ID="gridAccClass" runat="server" SkinID="skGridView" AllowSorting="True"
                                AutoGenerateColumns="False" DataKeyNames="TrDocClassID" DataSourceID="dsAccDocClass">
                                <Columns>
                                    <asp:TemplateField HeaderText="DocClass" SortExpression="TrDocClass">
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("TrDocClass") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" CssClass="TextBox" Text='<%# Bind("TrDocClass") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator51" runat="server" ControlToValidate="TextBox1"
                                                Display="None" ErrorMessage="Required Field!">*</asp:RequiredFieldValidator>
                                            <asp:ValidatorCalloutExtender ID="RequiredFieldValidator51_ValidatorCalloutExtender"
                                                runat="server" Enabled="True" TargetControlID="RequiredFieldValidator51">
                                            </asp:ValidatorCalloutExtender>
                                        </EditItemTemplate>
                                        <ItemStyle Width="50px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TypeClass" SortExpression="TrTypeClass">
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("TrTypeClass") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" CssClass="TextBox" Text='<%# Bind("TrTypeClass") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemStyle Width="50px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Class" SortExpression="TrClass">
                                        <ItemTemplate>
                                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("TrClass") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="70px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="AccType" SortExpression="AccountTypeID">
                                        <ItemTemplate>
                                            (<asp:Label ID="Label2" runat="server" Text='<%# Bind("AccountTypeID") %>'></asp:Label>
                                            )
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("AccountType") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtAccTypeID" runat="server" CssClass="TextBox" Text='<%# Bind("AccountTypeID") %>'></asp:TextBox>
                                            <asp:PopupControlExtender ID="txtAccTypeID_PopupControlExtender" runat="server" CommitProperty="Text"
                                                PopupControlID="gvAccType" Position="Bottom" TargetControlID="txtAccTypeID">
                                            </asp:PopupControlExtender>
                                            <asp:GridView ID="gvAccType" runat="server" AutoGenerateColumns="False" BackColor="White"
                                                CssClass="GridBorder" DataKeyNames="AccTypeID" DataSourceID="dsAccType" GridLines="None"
                                                OnSelectedIndexChanged="gvAccType_SelectedIndexChanged" ShowHeader="False" Width="187px">
                                                <RowStyle CssClass="GridRowClear" HorizontalAlign="Left" />
                                                <SelectedRowStyle CssClass="SelectRowClear" />
                                                <Columns>
                                                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" ShowCancelButton="False"
                                                        ShowSelectButton="True">
                                                        <ItemStyle Width="20px" />
                                                    </asp:CommandField>
                                                    <asp:BoundField DataField="AccTypeID" HeaderText="AccTypeID" ReadOnly="True" SortExpression="AccTypeID" />
                                                    <asp:BoundField DataField="AccType" HeaderText="AccType" SortExpression="AccType" />
                                                    <asp:BoundField DataField="AccTypeName" HeaderText="AccTypeName" SortExpression="AccTypeName" />
                                                </Columns>
                                            </asp:GridView>
                                        </EditItemTemplate>
                                        <ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TranType" SortExpression="TranTypeID">
                                        <ItemTemplate>
                                            (<asp:Label ID="Label3" runat="server" Text='<%# Bind("TranTypeID") %>'></asp:Label>
                                            )
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("TranType") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtTranType" runat="server" Text='<%# Bind("TranTypeID") %>' CssClass="TextBox"></asp:TextBox>
                                            <asp:PopupControlExtender ID="txtTranTypeID_PopupControlExtender" runat="server"
                                                CommitProperty="Text" PopupControlID="gvTranType" Position="Bottom" TargetControlID="txtTranType">
                                            </asp:PopupControlExtender>
                                            <br />
                                            <asp:GridView ID="gvTranType" runat="server" AutoGenerateColumns="False" BackColor="White"
                                                CssClass="GridBorder" DataKeyNames="AccTranTypeID" DataSourceID="dsTranType"
                                                GridLines="None" OnSelectedIndexChanged="gvTranType_SelectedIndexChanged" ShowHeader="False"
                                                Width="187px">
                                                <RowStyle CssClass="GridRowClear" HorizontalAlign="Left" />
                                                <SelectedRowStyle CssClass="SelectRowClear" />
                                                <Columns>
                                                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" ShowCancelButton="False"
                                                        ShowSelectButton="True">
                                                        <ItemStyle Width="20px" />
                                                    </asp:CommandField>
                                                    <asp:BoundField DataField="AccTranTypeID" ReadOnly="True" SortExpression="AccTranTypeID" />
                                                    <asp:BoundField DataField="AccTranType" SortExpression="AccTranType" />
                                                    <asp:BoundField DataField="AccTranTypeName" HeaderText="AccTranTypeName" SortExpression="AccTranTypeName" />
                                                </Columns>
                                            </asp:GridView>
                                        </EditItemTemplate>
                                        <ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="DocType" SortExpression="DocTypeID">
                                        <ItemTemplate>
                                            (<asp:Label ID="Label4" runat="server" Text='<%# Bind("DocTypeID") %>'></asp:Label>
                                            )
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("DocType") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtDocType" runat="server" Text='<%# Bind("DocTypeID") %>' CssClass="TextBox"></asp:TextBox>
                                            <asp:PopupControlExtender ID="txtDocTypeID_PopupControlExtender" runat="server" CommitProperty="Text"
                                                PopupControlID="gvDocType" Position="Bottom" TargetControlID="txtDocType">
                                            </asp:PopupControlExtender>
                                            <asp:GridView ID="gvDocType" runat="server" AutoGenerateColumns="False" BackColor="White"
                                                CssClass="GridBorder" DataKeyNames="AccDocTypeID" DataSourceID="dsDocType" GridLines="None"
                                                OnSelectedIndexChanged="gvDocType_SelectedIndexChanged" ShowHeader="False" Width="187px">
                                                <RowStyle CssClass="GridRowClear" HorizontalAlign="Left" />
                                                <SelectedRowStyle CssClass="SelectRowClear" />
                                                <Columns>
                                                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" ShowCancelButton="False"
                                                        ShowSelectButton="True">
                                                        <ItemStyle Width="20px" />
                                                    </asp:CommandField>
                                                    <asp:BoundField DataField="AccDocTypeID" ReadOnly="True" SortExpression="AccDocTypeID" />
                                                    <asp:BoundField DataField="AccDocType" SortExpression="AccDocType" />
                                                    <asp:BoundField DataField="AccDocTypeName" HeaderText="AccDocTypeName" SortExpression="AccDocTypeName" />
                                                </Columns>
                                            </asp:GridView>
                                        </EditItemTemplate>
                                        <ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sign" SortExpression="TrSign">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("TrSign") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlTrSgn" runat="server" CssClass="TextBox" SelectedValue='<%# Bind("TrSign") %>'>
                                                <asp:ListItem>D</asp:ListItem>
                                                <asp:ListItem>C</asp:ListItem>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemStyle Width="50px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Description" SortExpression="TrDescription">
                                        <ItemTemplate>
                                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("TrDescription") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" CssClass="TextBox" Text='<%# Bind("TrDescription") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator55" runat="server" ControlToValidate="TextBox3"
                                                Display="None" ErrorMessage="Required Field!">*</asp:RequiredFieldValidator>
                                            <asp:ValidatorCalloutExtender ID="RequiredFieldValidator55_ValidatorCalloutExtender"
                                                runat="server" Enabled="True" TargetControlID="RequiredFieldValidator55">
                                            </asp:ValidatorCalloutExtender>
                                        </EditItemTemplate>
                                        <ItemStyle Width="350px" />
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
                            <asp:FormView ID="newAccDocClass" runat="server" DataKeyNames="TrDocClassID" DataSourceID="dsAccDocClass">
                                <InsertItemTemplate>
                                    <table cellpadding="0" cellspacing="20" border="0" style="border-style: None; border-collapse: collapse;">
                                        <tr class="GridRow1T">
                                            <td style="width: 50px; padding-right: 2px; height: 30px;">
                                                <asp:TextBox ID="txtTrDocClass" runat="server" Text='<%# Bind("TrDocClass") %>' CssClass="TextBox"
                                                    MaxLength="2" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator51" runat="server" ControlToValidate="txtTrDocClass"
                                                    Display="None" ErrorMessage="Required Field!"></asp:RequiredFieldValidator>
                                                <asp:ValidatorCalloutExtender ID="RequiredFieldValidator51_ValidatorCalloutExtender"
                                                    runat="server" Enabled="True" TargetControlID="RequiredFieldValidator51">
                                                </asp:ValidatorCalloutExtender>
                                            </td>
                                            <td style="width: 50px;">
                                                <asp:TextBox ID="MarketTextBox" runat="server" Text='<%# Bind("TrTypeClass") %>'
                                                    CssClass="TextBox" Width="50px" />
                                            </td>
                                            <td style="width: 70px; padding-right: 2px;">
                                                &nbsp;
                                            </td>
                                            <td style="width: 80px; padding-right: 2px;">
                                                <asp:TextBox ID="txtAccTypeID" runat="server" CssClass="TextBox" Text='<%# Bind("AccountTypeID") %>' />
                                                <asp:PopupControlExtender ID="txtAccTypeID_PopupControlExtender" runat="server" CommitProperty="Text"
                                                    PopupControlID="gvAccType" Position="Bottom" TargetControlID="txtAccTypeID">
                                                </asp:PopupControlExtender>
                                                <asp:GridView ID="gvAccType" runat="server" AutoGenerateColumns="False" BackColor="White"
                                                    CssClass="GridBorder" DataKeyNames="AccTypeID" DataSourceID="dsAccType" GridLines="None"
                                                    OnSelectedIndexChanged="gvAccType_SelectedIndexChanged1" ShowHeader="False" Width="187px">
                                                    <RowStyle CssClass="GridRowClear" HorizontalAlign="Left" />
                                                    <SelectedRowStyle CssClass="SelectRowClear" />
                                                    <Columns>
                                                        <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" ShowCancelButton="False"
                                                            ShowSelectButton="True">
                                                            <ItemStyle Width="20px" />
                                                        </asp:CommandField>
                                                        <asp:BoundField DataField="AccTypeID" HeaderText="AccTypeID" ReadOnly="True" SortExpression="AccTypeID" />
                                                        <asp:BoundField DataField="AccType" HeaderText="AccType" SortExpression="AccType" />
                                                        <asp:BoundField DataField="AccTypeName" HeaderText="AccTypeName" SortExpression="AccTypeName" />
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                            <td style="width: 80px; padding-right: 2px;">
                                                <asp:TextBox ID="txtTranType" runat="server" Text='<%# Bind("TranTypeID") %>' CssClass="TextBox" />
                                                <asp:PopupControlExtender ID="PopupControlExtender1" runat="server" CommitProperty="Text"
                                                    PopupControlID="gvTranType" Position="Bottom" TargetControlID="txtTranType">
                                                </asp:PopupControlExtender>
                                                <br />
                                                <asp:GridView ID="gvTranType" runat="server" AutoGenerateColumns="False" BackColor="White"
                                                    CssClass="GridBorder" DataKeyNames="AccTranTypeID" DataSourceID="dsTranType"
                                                    GridLines="None" OnSelectedIndexChanged="gvTranType_SelectedIndexChanged1" ShowHeader="False"
                                                    Width="187px">
                                                    <RowStyle CssClass="GridRowClear" HorizontalAlign="Left" />
                                                    <SelectedRowStyle CssClass="SelectRowClear" />
                                                    <Columns>
                                                        <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" ShowCancelButton="False"
                                                            ShowSelectButton="True">
                                                            <ItemStyle Width="20px" />
                                                        </asp:CommandField>
                                                        <asp:BoundField DataField="AccTranTypeID" ReadOnly="True" SortExpression="AccTranTypeID" />
                                                        <asp:BoundField DataField="AccTranType" SortExpression="AccTranType" />
                                                        <asp:BoundField DataField="AccTranTypeName" HeaderText="AccTranTypeName" SortExpression="AccTranTypeName" />
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                            <td style="width: 80px; padding-right: 2px;">
                                                <asp:TextBox ID="txtDocType" runat="server" Text='<%# Bind("DocTypeID") %>' CssClass="TextBox" />
                                                <asp:PopupControlExtender ID="txtDocTypeID_PopupControlExtender" runat="server" CommitProperty="Text"
                                                    PopupControlID="gvDocType" Position="Bottom" TargetControlID="txtDocType">
                                                </asp:PopupControlExtender>
                                                <asp:GridView ID="gvDocType" runat="server" AutoGenerateColumns="False" BackColor="White"
                                                    CssClass="GridBorder" DataKeyNames="AccDocTypeID" DataSourceID="dsDocType" GridLines="None"
                                                    OnSelectedIndexChanged="gvDocType_SelectedIndexChanged1" ShowHeader="False" Width="187px">
                                                    <RowStyle CssClass="GridRowClear" HorizontalAlign="Left" />
                                                    <SelectedRowStyle CssClass="SelectRowClear" />
                                                    <Columns>
                                                        <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" ShowCancelButton="False"
                                                            ShowSelectButton="True">
                                                            <ItemStyle Width="20px" />
                                                        </asp:CommandField>
                                                        <asp:BoundField DataField="AccDocTypeID" ReadOnly="True" SortExpression="AccDocTypeID" />
                                                        <asp:BoundField DataField="AccDocType" SortExpression="AccDocType" />
                                                        <asp:BoundField DataField="AccDocTypeName" HeaderText="AccDocTypeName" SortExpression="AccDocTypeName" />
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                            <td style="width: 50px; padding-right: 2px;">
                                                <asp:DropDownList ID="ddlTrSgn" runat="server" CssClass="TextBox" SelectedValue='<%# Bind("TrSign") %>'>
                                                    <asp:ListItem>D</asp:ListItem>
                                                    <asp:ListItem>C</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td style="width: 350px;">
                                                <asp:TextBox ID="txtDescription" runat="server" CssClass="TextBox" Text='<%# Bind("TrDescription") %>' />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtDescription"
                                                    Display="None" ErrorMessage="Required Field!">Required field!</asp:RequiredFieldValidator>
                                                <asp:ValidatorCalloutExtender ID="RequiredFieldValidator4_ValidatorCalloutExtender"
                                                    runat="server" Enabled="True" TargetControlID="RequiredFieldValidator4">
                                                </asp:ValidatorCalloutExtender>
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
                                            <td style="width: 826px; height: 30px;">
                                                &nbsp;
                                            </td>
                                            <td style="width: 75px; padding-left: 5px;" align="right">
                                                <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <EmptyDataTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                        <tr class="GridRow1T">
                                            <td style="width: 826px; height: 30px;">
                                                &nbsp;
                                            </td>
                                            <td style="width: 75px; padding-left: 5px;">
                                                <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                            </asp:FormView>
                            <asp:ObjectDataSource ID="dsAccDocClass" runat="server" DeleteMethod="DeleteQuery"
                                InsertMethod="InsertQuery" SelectMethod="GetData" TypeName="dsAccountTableAdapters.AccDocClassTableAdapter"
                                UpdateMethod="UpdateQuery">
                                <DeleteParameters>
                                    <asp:Parameter Name="TrDocClassID" Type="Int32" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="TrDocClass" Type="String" />
                                    <asp:Parameter Name="TrTypeClass" Type="String" />
                                    <asp:Parameter Name="AccountTypeID" Type="String" />
                                    <asp:Parameter Name="TranTypeID" Type="String" />
                                    <asp:Parameter Name="DocTypeID" Type="String" />
                                    <asp:Parameter Name="TrSign" Type="String" />
                                    <asp:Parameter Name="TrDescription" Type="String" />
                                    <asp:Parameter Name="TrDocClassID" Type="Int32" />
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="TrDocClass" Type="String" />
                                    <asp:Parameter Name="TrTypeClass" Type="String" />
                                    <asp:Parameter Name="AccountTypeID" Type="String" />
                                    <asp:Parameter Name="TranTypeID" Type="String" />
                                    <asp:Parameter Name="DocTypeID" Type="String" />
                                    <asp:Parameter Name="TrSign" Type="String" />
                                    <asp:Parameter Name="TrDescription" Type="String" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="dsTranType" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
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
                            <asp:ObjectDataSource ID="dsAccType" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsAccountTableAdapters.AccTypeTableAdapter"
                                UpdateMethod="Update">
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
                            <asp:ObjectDataSource ID="dsDocType" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
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
                        </td>
                    </tr>
                </table>
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
            <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
                PopupDragHandleControlID="popLabel" CancelControlID="btnNo" DropShadow="True"
                BackgroundCssClass="modalBackground" TargetControlID="dummy" X="200" Y="200">
            </asp:ModalPopupExtender>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
