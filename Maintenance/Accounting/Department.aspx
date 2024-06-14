<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Accounting/masterAccount.master" AutoEventWireup="false" CodeFile="Department.aspx.vb" Inherits="Maintenance_Accounting_Department" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    <p>
        <span style="color:#1F497D;">Department</span></p>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AccountContent" Runat="Server">
    <asp:HiddenField ID="dummy" runat="server" />
    <div class="Blue">
        <br />
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblDep" runat="server" Text="Department" SkinID="skGridLabel" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvDep" runat="server" SkinID="skGridView" AllowSorting="True"
                        AutoGenerateColumns="False" DataSourceID="dsDepart" Width="750px" 
                        DataKeyNames="DepID" SelectedIndex="0">
                        <Columns>
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" 
                                ShowSelectButton="True" />
                            <asp:BoundField DataField="DepID" HeaderText="DepID" ReadOnly="True" 
                                SortExpression="DepID" InsertVisible="False">
                                <ItemStyle Width="30px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DepCode" HeaderText="DepCode" 
                                SortExpression="DepCode">
                                <ControlStyle CssClass="TextBox" />
                                <ItemStyle Width="70px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DepName" HeaderText="DepName" 
                                SortExpression="DepName">
                            <ControlStyle CssClass="TextBox" />
                            <ItemStyle Width="250px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Description" HeaderText="Description" 
                                SortExpression="Description">
                            <ControlStyle CssClass="TextBox" />
                            <ItemStyle Width="250px" />
                            </asp:BoundField>
                            <asp:CheckBoxField DataField="IsActive" HeaderText="IsActive" 
                                SortExpression="IsActive" >
                            <ItemStyle Width="40px" />
                            </asp:CheckBoxField>
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
                        <EmptyDataTemplate>
                        
                        </EmptyDataTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:GridView>
                    <asp:FormView ID="newDept" runat="server" DataSourceID="dsDepart" 
                        HorizontalAlign="Right" Width="750px">
                        <InsertItemTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                               <tr class="GridRow1T">
                                    <td style="width: 100px; height: 16px;" class="SelectRow1B">
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" 
                                            TargetControlID="reqDepCode" HighlightCssClass="WaterMark"></asp:ValidatorCalloutExtender>
                                        Dep Code</td>
                                    <td style="width: 250px; height: 16px;" class="SelectRow1B">
                                        Department Name<asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" 
                                            TargetControlID="reqDepName" HighlightCssClass="WaterMark"></asp:ValidatorCalloutExtender>
                                    </td>
                                    <td style="width: 300px; height: 16px;" class="SelectRow1B">
                                        Description</td>
                                    <td style="width: 40px; height: 16px;" class="SelectRow1B">
                                        Active</td>
                                    <td style="width: 75px; padding-left: 5px; height: 16px;" class="SelectRow1B">
                                        &nbsp;</td>
                                </tr>
                                <tr class="GridRow1T">
                                    <td style="width: 80px; height: 30px;">
                                        <asp:TextBox ID="DepCodeTextBox" runat="server" Text='<%# Bind("DepCode") %>' 
                                            Width="70px" CssClass="TextBox" />
                                        <asp:RequiredFieldValidator ID="reqDepCode" runat="server" 
                                            ErrorMessage="This is required field!" ControlToValidate="DepCodeTextBox" 
                                            Display="None" />
                                        <asp:ValidatorCalloutExtender ID="reqMarketIDExt" runat="server" 
                                            TargetControlID="reqDepCode" HighlightCssClass="WaterMark"></asp:ValidatorCalloutExtender>
                                    </td>
                                    <td style="width: 230px;">
                                        <asp:TextBox ID="DepName" runat="server" Text='<%# Bind("DepName") %>' 
                                            CssClass="TextBox" Width="230px" />
                                        <asp:RequiredFieldValidator ID="reqDepName" runat="server" 
                                            ErrorMessage="This is required field!" ControlToValidate="DepName" 
                                            Display="None" />
                                        <asp:ValidatorCalloutExtender ID="reqMarketExt" runat="server" 
                                            TargetControlID="reqDepName" HighlightCssClass="WaterMark"></asp:ValidatorCalloutExtender>
                                    </td>
                                    <td style="width: 250px;">
                                        <asp:TextBox ID="DepName0" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("Description") %>' Width="250px" />
                                    </td>
                                    <td style="width: 30px; ">
                                        <asp:CheckBox ID="cbActive" runat="server" Checked='<%# Bind("IsActive") %>' 
                                            oncheckedchanged="cbActive_CheckedChanged" Width="30px" />
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
                                <tr>
                                    <td style="width: 600px; margin-top: 2px;" class="GridRow1T">
                                        &nbsp;
                                    </td>
                                    <td style="width: 150px; padding-top: 5px; margin-top: 2px;" class="GridRow1T">
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                <tr class="GridRow1T">
                                    <td style="width: 250px; height: 30px;">
                                        &nbsp;
                                    </td>
                                    <td style="width: 75px; padding-left: 5px;">
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                    </asp:FormView>
                    <asp:ObjectDataSource ID="dsDepart" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsMaintBasicTableAdapters.DepartmentTableAdapter"
                        UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_DepID" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="DepCode" Type="String" />
                            <asp:Parameter Name="DepName" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="IsActive" Type="Boolean" />
                            <asp:Parameter Name="Original_DepID" Type="Int32" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="DepCode" Type="String" />
                            <asp:Parameter Name="DepName" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="IsActive" Type="Boolean" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
                
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
    <br />
    <div class="Red">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 25px;">
                    &nbsp;<asp:Image ID="Image2" runat="server" ImageUrl="~/Images/select_.gif" />
                </td>
                <td class="GridLabelBG" style="width: 595px">
                    <asp:Label ID="lblMembers" runat="server" Text="Employee" 
                        SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td style="width: 25px; vertical-align: top;">
                    &nbsp;
                </td>
                <td class="GridBorder" style="width: 595px">
                    <asp:GridView ID="gvEmp" runat="server" SkinID="skGridView" 
                        AutoGenerateColumns="False" DataSourceID="dsEmp" Width="750px" 
                        DataKeyNames="EmpID,DepID">
                        <Columns>
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" 
                                ShowSelectButton="True" />
                            <asp:BoundField DataField="DepID" HeaderText="DepID" ReadOnly="True"
                                SortExpression="DepID" Visible="False" />
                            <asp:BoundField DataField="EmpID" HeaderText="EmpID" InsertVisible="False" 
                                ReadOnly="True" SortExpression="EmpID">
                            <ItemStyle Width="30px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="EmpCode" HeaderText="EmpCode" 
                                SortExpression="EmpCode">
                            <ControlStyle CssClass="TextBox" />
                            <ItemStyle Width="70px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="EmpName" HeaderText="EmpName" 
                                SortExpression="EmpName">
                            <ControlStyle CssClass="TextBox" />
                            <ItemStyle Width="200px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Description" HeaderText="Description" 
                                SortExpression="Description">
                            <ControlStyle CssClass="TextBox" />
                            <ItemStyle Width="250px" />
                            </asp:BoundField>
                            <asp:CheckBoxField DataField="IsActive" HeaderText="IsActive" 
                                SortExpression="IsActive">
                            <ItemStyle Width="30px" />
                            </asp:CheckBoxField>
                            <asp:CommandField ButtonType="Image" 
                                CancelImageUrl="~/Images/decline_inline.gif" 
                                EditImageUrl="~/Images/edit_inline.gif" ShowEditButton="True" 
                                UpdateImageUrl="~/Images/accept_inline.gif" >
                            <ItemStyle Width="40px" />
                            </asp:CommandField>
                            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/delete_inline.gif"
                                ShowDeleteButton="True">
                                <ItemStyle Width="25px" />
                            </asp:CommandField>
                        </Columns>
                        <EmptyDataTemplate>
                            
                        </EmptyDataTemplate>
                    </asp:GridView>
                    <asp:FormView ID="fvEmp" runat="server" DataSourceID="dsEmp" Width="754px">
                        <InsertItemTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                               <tr class="GridRow1T">
                                    <td style="width: 100px; height: 14px;" class="SelectRow1B">
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" 
                                            TargetControlID="reqEmpCode" HighlightCssClass="WaterMark"></asp:ValidatorCalloutExtender>
                                        Employee Code</td>
                                    <td style="width: 250px; height: 14px;" class="SelectRow1B">
                                        Employee Name<asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" 
                                            TargetControlID="reqEmpName" HighlightCssClass="WaterMark"></asp:ValidatorCalloutExtender>
                                    </td>
                                    <td style="width: 300px; height: 14px;" class="SelectRow1B">
                                        Description</td>
                                    <td style="width: 40px; height: 14px;" class="SelectRow1B">
                                        Active</td>
                                    <td style="width: 75px; padding-left: 5px; height: 14px;" class="SelectRow1B">
                                        </td>
                                </tr>
                                <tr class="GridRow1T">
                                    <td style="width: 70px; height: 30px;">
                                        <asp:TextBox ID="ECodeTextBox" runat="server" Text='<%# Bind("EmpCode") %>' 
                                            Width="70px" CssClass="TextBox" />
                                        <asp:RequiredFieldValidator ID="reqEmpCode" runat="server" 
                                            ErrorMessage="This is required field!" ControlToValidate="ECodeTextBox" 
                                            Display="None" />
                                        <asp:ValidatorCalloutExtender ID="reqMarketIDExt" runat="server" 
                                            TargetControlID="reqEmpCode" HighlightCssClass="WaterMark"></asp:ValidatorCalloutExtender>
                                    </td>
                                    <td style="width: 230px;">
                                        <asp:TextBox ID="EmpName" runat="server" Text='<%# Bind("EmpName") %>' 
                                            CssClass="TextBox" Width="230px" />
                                        <asp:RequiredFieldValidator ID="reqEmpName" runat="server" 
                                            ErrorMessage="This is required field!" ControlToValidate="EmpName" 
                                            Display="None" />
                                        <asp:ValidatorCalloutExtender ID="reqMarketExt" runat="server" 
                                            TargetControlID="reqEmpName" HighlightCssClass="WaterMark"></asp:ValidatorCalloutExtender>
                                    </td>
                                    <td style="width: 250px;">
                                        <asp:TextBox ID="EmpDesc" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("Description") %>' Width="250px" />
                                    </td>
                                    <td style="width: 40px; ">
                                        <asp:CheckBox ID="cbActiveE" runat="server" Checked='<%# Bind("IsActive") %>' 
                                            Width="30px" />
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
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="width: 600px; margin-top: 2px;" class="GridRow1T">
                                        &nbsp;
                                    </td>
                                    <td style="width: 150px; padding-top: 5px; margin-top: 2px;" class="GridRow1T">
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
                    <asp:ObjectDataSource ID="dsEmp" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                        OldValuesParameterFormatString="original_{0}" 
                        SelectMethod="GetDataByDepID" TypeName="dsMaintBasicTableAdapters.EmployeeTableAdapter"
                        UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_DepID" Type="Int32" />
                            <asp:Parameter Name="Original_EmpID" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="EmpCode" Type="String" />
                            <asp:Parameter Name="EmpName" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="IsActive" Type="Boolean" />
                            <asp:Parameter Name="Original_DepID" Type="Int32" />
                            <asp:Parameter Name="Original_EmpID" Type="Int32" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="gvDep" Name="DepID" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:ControlParameter ControlID="gvDep" Name="DepID" 
                                PropertyName="SelectedValue" Type="Int32" />
                            <asp:Parameter Name="EmpCode" Type="String" />
                            <asp:Parameter Name="EmpName" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="IsActive" Type="Boolean" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
    </div>
  <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        ShowMessageBox="True" ShowSummary="False" />  
    <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
        PopupDragHandleControlID="popLabel" CancelControlID="btnNo" DropShadow="True" 
        BackgroundCssClass="modalBackground" TargetControlID="dummy" X="200" Y="200">
    </asp:ModalPopupExtender>
</asp:Content>

