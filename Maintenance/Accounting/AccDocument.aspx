<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Accounting/masterAccount.master"
    AutoEventWireup="false" CodeFile="AccDocument.aspx.vb" Inherits="Maintenance_Accounting_AccDocument" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Accounting Documents
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
                            <asp:Label ID="lblMarket" runat="server" Text="Accounting Document" SkinID="skGridLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder">
                            <asp:GridView ID="gridAccClass" runat="server" SkinID="skGridView" AllowSorting="True"
                                AutoGenerateColumns="False" DataKeyNames="TrDocID" DataSourceID="dsAccDocument">
                                <Columns>
                                    <asp:TemplateField HeaderText="DocClass" SortExpression="TrDocClass">
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("TrDocClass") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtDocClass" runat="server" CssClass="TextBox" Text='<%# Bind("TrDocClass") %>'
                                                Enabled="False"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemStyle Width="60px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TypeClass" SortExpression="TrTypeClass">
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("TrTypeClass") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtTypeClass" runat="server" CssClass="TextBox" Text='<%# Bind("TrTypeClass") %>'
                                                Enabled="False"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemStyle Width="60px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Class" SortExpression="TrClass">
                                        <ItemTemplate>
                                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("TrClass") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Label ID="txtClass" runat="server" Text='<%# Eval("TrClass") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TrCode" SortExpression="TrCode">
                                        <ItemTemplate>
                                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("TrCode") %>' />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtCode" runat="server" Text='<%# Bind("TrCode") %>' CssClass="TextBox" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCode"
                                                Display="None" ErrorMessage="Required Field!">Required field!</asp:RequiredFieldValidator>
                                            <asp:ValidatorCalloutExtender ID="RequiredFieldValidator5_ValidatorCalloutExtender"
                                                runat="server" Enabled="True" TargetControlID="RequiredFieldValidator5">
                                            </asp:ValidatorCalloutExtender>
                                        </EditItemTemplate>
                                        <ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="AccType" SortExpression="AccountTypeID">
                                        <ItemTemplate>
                                            (<asp:Label ID="Label2" runat="server" Text='<%# Bind("AccountTypeID") %>' />)
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("AccountType") %>' />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtAccTypeID" runat="server" CssClass="TextBox" Text='<%# Bind("AccountTypeID") %>'
                                                Enabled='<%# iif(Eval("FixAccountTypeID")=0,true,false) %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator53" runat="server" ControlToValidate="txtAccTypeID"
                                                Display="None" ErrorMessage="Required Field!">Required field!</asp:RequiredFieldValidator>
                                            <asp:ValidatorCalloutExtender ID="RequiredFieldValidator53_ValidatorCalloutExtender"
                                                runat="server" Enabled="True" TargetControlID="RequiredFieldValidator53">
                                            </asp:ValidatorCalloutExtender>
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
                                            (<asp:Label ID="Label3" runat="server" Text='<%# Bind("TranTypeID") %>' />)
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("TranType") %>' />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtTranType" runat="server" Text='<%# Bind("TranTypeID") %>' CssClass="TextBox"
                                                Enabled='<%# iif(Eval("FixTranTypeID")=0,true,false) %>' />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator55" runat="server" ControlToValidate="txtTranType"
                                                Display="None" ErrorMessage="Required Field!">Required field!</asp:RequiredFieldValidator>
                                            <asp:ValidatorCalloutExtender ID="RequiredFieldValidator55_ValidatorCalloutExtender"
                                                runat="server" Enabled="True" TargetControlID="RequiredFieldValidator55">
                                            </asp:ValidatorCalloutExtender>
                                            <asp:PopupControlExtender ID="txtTranTypeID_PopupControlExtender" runat="server"
                                                CommitProperty="Text" PopupControlID="gvTranType" Position="Bottom" TargetControlID="txtTranType">
                                            </asp:PopupControlExtender>
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
                                            (<asp:Label ID="Label4" runat="server" Text='<%# Bind("DocTypeID") %>' />)
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("DocType") %>' />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtDocType" runat="server" Text='<%# Bind("DocTypeID") %>' CssClass="TextBox"
                                                Enabled='<%# iif(Eval("FixDocTypeID")=0,true,false) %>' />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator56" runat="server" ControlToValidate="txtDocType"
                                                Display="None" ErrorMessage="Required Field!">Required field!</asp:RequiredFieldValidator>
                                            <asp:ValidatorCalloutExtender ID="RequiredFieldValidator56_ValidatorCalloutExtender"
                                                runat="server" Enabled="True" TargetControlID="RequiredFieldValidator56">
                                            </asp:ValidatorCalloutExtender>
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
                                            <asp:DropDownList ID="ddlTrSgn" runat="server" CssClass="TextBox" SelectedValue='<%# Bind("TrSign") %>'
                                                Enabled="False">
                                                <asp:ListItem>D</asp:ListItem>
                                                <asp:ListItem>C</asp:ListItem>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemStyle Width="50px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TrOrd" SortExpression="TrOrd">
                                        <ItemTemplate>
                                            <asp:Label ID="Label12" runat="server" Text='<%# Bind("TrOrd") %>' />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtOrd" runat="server" Text='<%# Bind("TrOrd") %>' CssClass="TextBox" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator52" runat="server" ControlToValidate="txtOrd"
                                                Display="None" ErrorMessage="Required Field!">Required field!</asp:RequiredFieldValidator>
                                            <asp:ValidatorCalloutExtender ID="RequiredFieldValidator52_ValidatorCalloutExtender"
                                                runat="server" Enabled="True" TargetControlID="RequiredFieldValidator52">
                                            </asp:ValidatorCalloutExtender>
                                        </EditItemTemplate>
                                        <ItemStyle Width="50px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="TrAccount" HeaderText="TrAccount" SortExpression="TrAccount"
                                        ReadOnly="True">
                                        <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Statistic" SortExpression="Statistic">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="cbStatic1" runat="server" Checked='<%# Bind("Statistic") %>' Enabled="false" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:CheckBox ID="cbStatic" runat="server" Checked='<%# Bind("Statistic") %>' />
                                        </EditItemTemplate>
                                        <ItemStyle Width="50px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Approvable" SortExpression="Approvable">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="cbApprovable1" runat="server" Checked='<%# Bind("Approvable") %>' Enabled="false" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:CheckBox ID="cbApprovable" runat="server" Checked='<%# Bind("Approvable") %>'  Enabled="true" />
                                        </EditItemTemplate>
                                        <ItemStyle Width="70px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Description" SortExpression="TrDescription">
                                        <ItemTemplate>
                                            <asp:Label ID="Label13" runat="server" Text='<%# Bind("TrDescription") %>' />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtDescription" runat="server" Text='<%# Bind("TrDescription") %>'
                                                CssClass="TextBox" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator51" runat="server" ControlToValidate="txtDescription"
                                                Display="None" ErrorMessage="Required Field!">Required field!</asp:RequiredFieldValidator>
                                            <asp:ValidatorCalloutExtender ID="RequiredFieldValidator51_ValidatorCalloutExtender"
                                                runat="server" Enabled="True" TargetControlID="RequiredFieldValidator51">
                                            </asp:ValidatorCalloutExtender>
                                        </EditItemTemplate>
                                        <ItemStyle Width="400px" />
                                    </asp:TemplateField>
                                    <asp:CommandField CancelImageUrl="~/Images/decline_inline.gif" ShowEditButton="True"
                                        ButtonType="Image" EditImageUrl="~/Images/edit_inline.gif" UpdateImageUrl="~/Images/accept_inline.gif">
                                        <ControlStyle CssClass="ImgButton" />
                                        <ItemStyle Width="50px" />
                                    </asp:CommandField>
                                    <asp:TemplateField InsertVisible="False" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="false" CommandName="Delete"
                                                ImageUrl="~/Images/delete_inline.gif" OnClientClick="if (!confirm('Are you sure you want to delete this record?')) return;" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            &nbsp;</EditItemTemplate>
                                        <ItemStyle Width="25px" />
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:GridView>
                            <asp:FormView ID="newAccDocClass" runat="server" DataSourceID="dsAccDocument">
                                <InsertItemTemplate>
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td style="width: 60px; padding-right: 2px;">
                                                <asp:TextBox ID="txtDocClass" runat="server" Text='<%# Bind("TrDocClass") %>' CssClass="TextBox"
                                                    MaxLength="2" />
                                            </td>
                                            <td style="width: 60px; padding-right: 2px;">
                                                <asp:TextBox ID="txtTypeClass" runat="server" Text='<%# Bind("TrTypeClass") %>' CssClass="TextBox"
                                                    Enabled="False" />
                                            </td>
                                            <td style="width: 80px; padding-right: 2px;">
                                                <asp:TextBox ID="txtClass" runat="server" CssClass="TextBox" Text='<%# Bind("TrClass") %>' />
                                                <asp:PopupControlExtender ID="PopupControlExtender2" runat="server" CommitProperty="Text"
                                                    PopupControlID="gvClass" Position="Right" OffsetX="-206" TargetControlID="txtClass">
                                                </asp:PopupControlExtender>
                                                <asp:GridView ID="gvClass" runat="server" AutoGenerateColumns="False" DataSourceID="dsAccDocClass"
                                                    BackColor="White" GridLines="Horizontal" BorderStyle="Dotted" OnSelectedIndexChanged="gvClass_SelectedIndexChanged"
                                                    ShowHeader="False" DataKeyNames="TrDocClass,TrTypeClass,TrClass,AccountTypeID,TranTypeID,DocTypeID,TrSign">
                                                    <Columns>
                                                        <asp:BoundField DataField="TrDocClassID" HeaderText="ClassID" InsertVisible="False"
                                                            ReadOnly="True" SortExpression="TrDocClassID" Visible="False" />
                                                        <asp:BoundField DataField="TrDocClass" HeaderText="DocClass" SortExpression="TrDocClass">
                                                            <ItemStyle Width="60px" />
                                                        </asp:BoundField>
                                                        <asp:TemplateField HeaderText="TypeClass" SortExpression="TrTypeClass">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblTypeClass" runat="server" Text='<%# Bind("TrTypeClass") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("TrTypeClass") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                            <ItemStyle Width="60px" />
                                                        </asp:TemplateField>
                                                        <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" ShowSelectButton="True">
                                                            <ItemStyle Width="25px" />
                                                        </asp:CommandField>
                                                        <asp:BoundField DataField="TrClass" HeaderText="Class" SortExpression="TrClass">
                                                            <ItemStyle Width="53px" />
                                                        </asp:BoundField>
                                                        <asp:TemplateField HeaderText="Code" ShowHeader="False">
                                                            <ItemStyle Width="80px" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="AccountType" HeaderText="AccountType" SortExpression="AccountType">
                                                            <ItemStyle Width="80px" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="TranType" HeaderText="TranType" SortExpression="TranType">
                                                            <ItemStyle Width="80px" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="DocType" HeaderText="DocType" SortExpression="DocType">
                                                            <ItemStyle Width="80px" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="TrSign" HeaderText="Sign" SortExpression="TrSign">
                                                            <ItemStyle Width="50px" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="TrDescription" HeaderText="Description" SortExpression="TrDescription">
                                                            <ItemStyle Wrap="false" Width="250px" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="AccountTypeID" HeaderText="AccountTypeID" Visible="False"
                                                            SortExpression="AccountTypeID" />
                                                        <asp:TemplateField HeaderText="TranTypeID" SortExpression="TranTypeID" Visible="False">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblTranType" runat="server" Text='<%# Bind("TranTypeID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("TranTypeID") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="DocTypeID" SortExpression="DocTypeID" Visible="False">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblDocType" runat="server" Text='<%# Bind("DocTypeID") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("DocTypeID") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                            <td style="width: 80px; padding-right: 2px;">
                                                <asp:TextBox ID="txtCode" runat="server" Text='<%# Bind("TrCode") %>' CssClass="TextBox" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCode"
                                                    Display="None" ErrorMessage="Required Field!">Required field!</asp:RequiredFieldValidator>
                                                <asp:ValidatorCalloutExtender ID="RequiredFieldValidator1_ValidatorCalloutExtender"
                                                    runat="server" Enabled="True" TargetControlID="RequiredFieldValidator1">
                                                </asp:ValidatorCalloutExtender>
                                            </td>
                                            <td style="width: 80px; padding-right: 2px;">
                                                <asp:TextBox ID="txtAccTypeID" runat="server" CssClass="TextBox" Text='<%# Bind("AccountTypeID") %>' />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAccTypeID"
                                                    Display="None" ErrorMessage="Required Field!">Required field!</asp:RequiredFieldValidator>
                                                <asp:ValidatorCalloutExtender ID="RequiredFieldValidator4_ValidatorCalloutExtender"
                                                    runat="server" Enabled="True" TargetControlID="RequiredFieldValidator4">
                                                </asp:ValidatorCalloutExtender>
                                                <asp:PopupControlExtender ID="txtAccTypeID_PopupControlExtender" runat="server" CommitProperty="Text"
                                                    PopupControlID="gvAccType" Position="Center" TargetControlID="txtAccTypeID">
                                                </asp:PopupControlExtender>
                                                <asp:GridView ID="gvAccType" runat="server" AutoGenerateColumns="False" DataSourceID="dsAccType"
                                                    BackColor="White" GridLines="Horizontal" BorderStyle="Dotted" DataKeyNames="AccTypeID"
                                                    OnSelectedIndexChanged="gvAccType_SelectedIndexChanged1" ShowHeader="False">
                                                    <Columns>
                                                        <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" ShowCancelButton="False"
                                                            ShowSelectButton="True">
                                                            <ItemStyle Width="25px" />
                                                        </asp:CommandField>
                                                        <asp:BoundField DataField="AccTypeID" HeaderText="AccTypeID" ReadOnly="True" SortExpression="AccTypeID">
                                                            <ItemStyle Width="40px" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="AccType" HeaderText="AccType" SortExpression="AccType">
                                                            <ItemStyle Width="40px" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="AccTypeName" HeaderText="AccTypeName" SortExpression="AccTypeName">
                                                            <ItemStyle Width="150px" Wrap="False" />
                                                        </asp:BoundField>
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                            <td style="width: 80px; padding-right: 2px;">
                                                <asp:TextBox ID="txtTranType" runat="server" Text='<%# Bind("TranTypeID") %>' 
                                                    CssClass="TextBox" AutoPostBack="True" 
                                                    ontextchanged="txtTranType_TextChanged" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtTranType"
                                                    Display="None" ErrorMessage="Required Field!">Required field!</asp:RequiredFieldValidator>
                                                <asp:ValidatorCalloutExtender ID="RequiredFieldValidator5_ValidatorCalloutExtender"
                                                    runat="server" Enabled="True" TargetControlID="RequiredFieldValidator5">
                                                </asp:ValidatorCalloutExtender>
                                                <asp:PopupControlExtender ID="PopupControlExtender1" runat="server" CommitProperty="Text"
                                                    PopupControlID="gvTranType" Position="Center" TargetControlID="txtTranType">
                                                </asp:PopupControlExtender>
                                                <asp:GridView ID="gvTranType" runat="server" AutoGenerateColumns="False" DataKeyNames="AccTranTypeID"
                                                    DataSourceID="dsTranType" BackColor="White" GridLines="Horizontal" BorderStyle="Dotted"
                                                    OnSelectedIndexChanged="gvTranType_SelectedIndexChanged1" ShowHeader="False">
                                                    <RowStyle CssClass="GridRowClear" HorizontalAlign="Left" />
                                                    <SelectedRowStyle CssClass="SelectRowClear" />
                                                    <Columns>
                                                        <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" ShowCancelButton="False"
                                                            ShowSelectButton="True">
                                                            <ItemStyle Width="25px" />
                                                        </asp:CommandField>
                                                        <asp:BoundField DataField="AccTranTypeID" ReadOnly="True" SortExpression="AccTranTypeID">
                                                            <ItemStyle Width="40px" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="AccTranType" SortExpression="AccTranType">
                                                            <ItemStyle Width="40px" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="AccTranTypeName" HeaderText="AccTranTypeName" SortExpression="AccTranTypeName">
                                                            <ItemStyle Width="150px" Wrap="False" />
                                                        </asp:BoundField>
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                            <td style="width: 80px; padding-right: 2px;">
                                                <asp:TextBox ID="txtDocType" runat="server" Text='<%# Bind("DocTypeID") %>' CssClass="TextBox" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtDocType"
                                                    Display="None" ErrorMessage="Required Field!">Required field!</asp:RequiredFieldValidator>
                                                <asp:ValidatorCalloutExtender ID="RequiredFieldValidator6_ValidatorCalloutExtender"
                                                    runat="server" Enabled="True" TargetControlID="RequiredFieldValidator6">
                                                </asp:ValidatorCalloutExtender>
                                                <asp:PopupControlExtender ID="txtDocTypeID_PopupControlExtender" runat="server" CommitProperty="Text"
                                                    PopupControlID="gvDocType" Position="Center" TargetControlID="txtDocType">
                                                </asp:PopupControlExtender>
                                                <asp:GridView ID="gvDocType" runat="server" AutoGenerateColumns="False" DataKeyNames="AccDocTypeID"
                                                    DataSourceID="dsDocType" BackColor="White" GridLines="Horizontal" BorderStyle="Dotted"
                                                    OnSelectedIndexChanged="gvDocType_SelectedIndexChanged1" ShowHeader="False">
                                                    <RowStyle CssClass="GridRowClear" HorizontalAlign="Left" />
                                                    <SelectedRowStyle CssClass="SelectRowClear" />
                                                    <Columns>
                                                        <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" ShowCancelButton="False"
                                                            ShowSelectButton="True">
                                                            <ItemStyle Width="25px" />
                                                        </asp:CommandField>
                                                        <asp:BoundField DataField="AccDocTypeID" ReadOnly="True" SortExpression="AccDocTypeID">
                                                            <ItemStyle Width="40px" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="AccDocType" SortExpression="AccDocType">
                                                            <ItemStyle Width="40px" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="AccDocTypeName" HeaderText="AccDocTypeName" SortExpression="AccDocTypeName">
                                                            <ItemStyle Width="150px" Wrap="False" />
                                                        </asp:BoundField>
                                                    </Columns>
                                                </asp:GridView>
                                            </td>
                                            <td style="width: 50px; padding-right: 2px;">
                                                <asp:DropDownList ID="ddlTrSgn" runat="server" CssClass="TextBox" SelectedValue='<%# Bind("TrSign") %>'>
                                                    <asp:ListItem>D</asp:ListItem>
                                                    <asp:ListItem>C</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td style="width: 50px; padding-right: 2px;">
                                                <asp:TextBox ID="txtOrd" runat="server" CssClass="TextBox" Text='<%# Bind("TrOrd") %>' />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtOrd"
                                                    Display="None" ErrorMessage="Required Field!">Required field!</asp:RequiredFieldValidator>
                                                <asp:ValidatorCalloutExtender ID="RequiredFieldValidator2_ValidatorCalloutExtender"
                                                    runat="server" Enabled="True" TargetControlID="RequiredFieldValidator2">
                                                </asp:ValidatorCalloutExtender>
                                            </td>
                                            <td style="width: 75px">&nbsp;</td> 
                                            <td style="width: 53px">
                                                &nbsp;
                                                <asp:CheckBox ID="cbStatic" runat="server" Text='<%# Bind("Statistic") %>' Checked='<%# Bind("Statistic") %>' />
                                            </td>
                                            <td style="width: 70px">
                                                &nbsp;
                                                <asp:CheckBox ID="cbApprovable" runat="server" Text='<%# Bind("Approvable") %>' Checked='<%# Bind("Approvable") %>' Enabled="true" />
                                            </td>
                                            <td style="width: 405px;">
                                                <asp:TextBox ID="txtDescription" runat="server" CssClass="TextBox" Text='<%# Bind("TrDescription") %>' />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDescription"
                                                    Display="None" ErrorMessage="Required Field!">Required field!</asp:RequiredFieldValidator>
                                                <asp:ValidatorCalloutExtender ID="RequiredFieldValidator3_ValidatorCalloutExtender"
                                                    runat="server" Enabled="True" TargetControlID="RequiredFieldValidator3">
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
                                            <%--<td style="width: 1118px; height: 30px;">--%>
                                            <td style="width: 1244px; height: 30px;">
                                                &nbsp;
                                            </td>
                                            <td style="width: 75px; padding-left: 5px;" >
                                                <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <EmptyDataTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                        <tr class="GridRow1T">
                                            <td style="width: 1244px; height: 30px;">
                                                &nbsp;
                                            </td>
                                            <td style="width: 75px; padding-left: 5px;">
                                                <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                            </asp:FormView>
                            <asp:Label ID="lblInsError" runat="server" Text="Label" Visible="false" CssClass="TextBox" />
                            <asp:ObjectDataSource ID="dsAccDocClass" runat="server" OldValuesParameterFormatString="original_{0}"
                                TypeName="dsAccountTableAdapters.AccDocClassTableAdapter"
                                SelectMethod="GetDataForDoc" >
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="dsTranType" runat="server" OldValuesParameterFormatString="original_{0}" 
                                TypeName="dsAccountTableAdapters.AccTranTypeTableAdapter"
                                SelectMethod="GetData" >
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="dsAccType" runat="server" OldValuesParameterFormatString="original_{0}" 
                                TypeName="dsAccountTableAdapters.AccTypeTableAdapter"
                                SelectMethod="GetData" >
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="dsDocType" runat="server" OldValuesParameterFormatString="original_{0}" 
                                TypeName="dsAccountTableAdapters.AccDocTypeTableAdapter"
                                SelectMethod="GetData" >
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="dsAccDocument" runat="server" 
                                DeleteMethod="DeleteQuery" InsertMethod="InsertQuery" 
                                UpdateMethod="UpdateQuery" SelectMethod="GetData"
                                TypeName="dsAccountTableAdapters.AccDocumentTableAdapter">
                                <DeleteParameters>
                                    <asp:Parameter Name="TrDocID" Type="Int32" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="TrDocClass" Type="String" />
                                    <asp:Parameter Name="TrTypeClass" Type="String" />
                                    <asp:Parameter Name="TrCode" Type="String" />
                                    <asp:Parameter Name="AccountTypeID" Type="String" />
                                    <asp:Parameter Name="TranTypeID" Type="String" />
                                    <asp:Parameter Name="DocTypeID" Type="String" />
                                    <asp:Parameter Name="TrOrd" Type="String" />
                                    <asp:Parameter Name="TrSign" Type="String" />
                                    <asp:Parameter Name="TrDescription" Type="String" />
                                    <asp:Parameter Name="Statistic" Type="Boolean" />
                                    <asp:Parameter Name="Approvable" Type="Boolean" />
                                    <asp:Parameter Name="TrDocID" Type="Int32" />
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="TrDocClass" Type="String" />
                                    <asp:Parameter Name="TrTypeClass" Type="String" />
                                    <asp:Parameter Name="TrCode" Type="String" />
                                    <asp:Parameter Name="AccountTypeID" Type="String" />
                                    <asp:Parameter Name="TranTypeID" Type="String" />
                                    <asp:Parameter Name="DocTypeID" Type="String" />
                                    <asp:Parameter Name="TrOrd" Type="String" />
                                    <asp:Parameter Name="TrSign" Type="String" />
                                    <asp:Parameter Name="TrDescription" Type="String" />
                                    <asp:Parameter Name="TrClass" Type="String" />
                                    <asp:Parameter Name="Statistic" Type="Boolean" />
                                    <asp:Parameter Name="Approvable" Type="Boolean" />
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
                                <p style="text-align: right;" class="GridRow1T">
                                    <br />
                                    <asp:Button ID="btnNo" runat="server" Text="OK" SkinID="skBtnBase" />&nbsp;
                                </p>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </div>
            <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
                PopupDragHandleControlID="popLabel" CancelControlID="btnNo" DropShadow="True"
                BackgroundCssClass="modalBackground" TargetControlID="dummy">
                <%--BackgroundCssClass="modalBackground" TargetControlID="dummy" X="200" Y="200">--%>
            </asp:ModalPopupExtender>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
