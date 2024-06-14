<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Accounting/masterDepartments.master" AutoEventWireup="false" 
    CodeFile="AccDepartments.aspx.vb" Inherits="Maintenance_Accounting_AccDepartments" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Departments
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AccountContent" Runat="Server">
    <script type="text/javascript">
        // It is important to place this JavaScript code after ScriptManager1
        var xPos1, xPos2, yPos1, yPos2;
        var prm = Sys.WebForms.PageRequestManager.getInstance();

        function BeginRequestHandler(sender, args) {
            if ($get('<%=pnlScroll.ClientID%>') != null) {
            // Get X and Y positions of scrollbar before the partial postback
                xPos1 = $get('<%=pnlScroll.ClientID%>').scrollLeft;
                yPos1 = $get('<%=pnlScroll.ClientID%>').scrollTop;
            }
            if ($get('<%=Panel1.ClientID%>') != null) {
                // Get X and Y positions of scrollbar before the partial postback
                xPos2 = $get('<%=Panel1.ClientID%>').scrollLeft;
                yPos2 = $get('<%=Panel1.ClientID%>').scrollTop;
            }
        }

        function EndRequestHandler(sender, args) {
            if ($get('<%=pnlScroll.ClientID%>') != null) {
                // Set X and Y positions back to the scrollbar
                // after partial postback
                $get('<%=pnlScroll.ClientID%>').scrollLeft = xPos1;
                $get('<%=pnlScroll.ClientID%>').scrollTop = yPos1;
            }
            if ($get('<%=Panel1.ClientID%>') != null) {
                // Set X and Y positions back to the scrollbar
                // after partial postback
                $get('<%=Panel1.ClientID%>').scrollLeft = xPos2;
                $get('<%=Panel1.ClientID%>').scrollTop = yPos2;
            }
        }

        prm.add_beginRequest(BeginRequestHandler);
        prm.add_endRequest(EndRequestHandler);
     </script>
     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>    
    <asp:HiddenField ID="dummy" runat="server" />
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblDep" runat="server" Text="Department" SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                        <tr>
                            <th class="GridRow1B" style="width: 124px; text-align: left;">
                                Filter
                            </th>
                            <th class="GridRow1B" style="width: 252px; text-align: left;">
                                &nbsp;
                            </th>
                            <th class="GridRow1B" style="width: 252px;">
                                &nbsp;
                            </th>
                            <th class="GridRow1B" style="width: 202px;">
                                &nbsp;
                            </th>
                            <th class="GridRow1B" style="width: 92px;">
                                &nbsp;
                            </th>
                            <th class="GridRow1B" style="width: 110px; text-align: right;">
                                <asp:ImageButton ID="fltApply" runat="server" CausesValidation="false" 
                                    CssClass="ImgButton" ImageUrl="~/Images/accept_inline.gif" />
                                <asp:ImageButton ID="fltReset" runat="server" CausesValidation="false" 
                                    CssClass="ImgButton" ImageUrl="~/Images/decline_inline.gif" />
                            </th>
                        </tr>
                        <tr>
                            <td style="padding-right: 2px;">
                                <asp:TextBox ID="fltCode" runat="server" CssClass="TextBox" />
                                <asp:TextBoxWatermarkExtender ID="wm_txtGroup" runat="server"
                                    TargetControlID="fltCode" WatermarkCssClass="WaterMark" 
                                    WatermarkText="Like Code..." />
                            </td>
                            <td style="padding-right: 2px;" colspan="2">
                                <asp:TextBox ID="fltText" runat="server" CssClass="TextBox" />
                                <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server"
                                    TargetControlID="fltText" WatermarkCssClass="WaterMark" 
                                    WatermarkText="Like Name or Description..." />
                            </td>
                            <td>
                                <asp:DropDownList ID="fltUnits" runat="server" CssClass="TextBox WaterMark"
                                    DataSourceID="dsFltUnits" 
                                    DataTextField="AccBusinessUnitName" 
                                    DataValueField="AccBusinessUnitID" 
                                    AppendDataBoundItems="True" >
                                    <asp:ListItem Selected="True" Value="">Any Unit</asp:ListItem>
                                </asp:DropDownList>
                                <asp:ObjectDataSource ID="dsFltUnits" runat="server"
                                    TypeName="accUnitsTableAdapters.AccBusinessUnitTableAdapter" 
                                    SelectMethod="GetActiveAndUsed" >
                                </asp:ObjectDataSource>
                            </td>
                            <td>
                                <asp:DropDownList ID="fltIncome" runat="server" CssClass="TextBox WaterMark" >
                                    <asp:ListItem Selected="True" Value="">*</asp:ListItem>
                                    <asp:ListItem Value="1">Affects</asp:ListItem>
                                    <asp:ListItem Value="0">Not Affects</asp:ListItem>
                                </asp:DropDownList>                            
                            </td>
                            <td>
                                <asp:CheckBox ID="fltInactive" runat="server" Text="Include Inactive" Checked="true" />
                            </td>
                        </tr>
                    </table>

                    <asp:Panel ID="pnlScroll" runat="server" ScrollBars="Vertical" Height="500" style="border-top: solid 2px; border-bottom: solid 2px;">
                    <asp:GridView ID="gvDep" runat="server" SkinID="skGridView" AllowSorting="True"
                        AutoGenerateColumns="False" DataSourceID="dsDepart" DataKeyNames="DepID" 
                        SelectedIndex="0" >
                        <Columns>
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" 
                                ShowSelectButton="True" >
                                <ItemStyle Width="50px" />
                            </asp:CommandField>
                            <asp:BoundField DataField="DepCode" HeaderText="Code" 
                                SortExpression="DepCode">
                                <ControlStyle CssClass="TextBox" />
                                <ItemStyle Width="70px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DepName" HeaderText="Name" 
                                SortExpression="DepName">
                            <ControlStyle CssClass="TextBox" />
                            <ItemStyle Width="250px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Description" HeaderText="Description" 
                                SortExpression="Description">
                            <ControlStyle CssClass="TextBox" />
                            <ItemStyle Width="250px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Unit">
                                <ItemTemplate>
                                    <asp:HiddenField runat="server" ID="hfUnitId" Value='<%# Bind("AccBusinessUnitID") %>' />
                                    <asp:Label ID="lblUnit" runat="server" Text='<%# Eval("AccBusinessUnitName") %>'/>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:HiddenField runat="server" ID="hfUnitId" Value='<%# Bind("AccBusinessUnitID") %>' />
                                    <asp:DropDownList ID="newUnits" runat="server" CssClass="TextBox"
                                        SelectedValue='<%# Bind("AccBusinessUnitID") %>'
                                        DataSourceID="dsNewUnits" 
                                        DataTextField="AccBusinessUnitName" 
                                        DataValueField="AccBusinessUnitID" >
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsNewUnits" runat="server"
                                        TypeName="accUnitsTableAdapters.AccBusinessUnitTableAdapter" 
                                        SelectMethod="GetActiveAndSelected" 
                                        onselecting="dsNewUnits_Selecting" >
                                        <SelectParameters>
                                            <asp:Parameter Name="UnitID" Type="Int32"/>
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </EditItemTemplate>
                                <ItemStyle Width="200px" />
                            </asp:TemplateField>
                            <asp:CheckBoxField DataField="AffectsIncome" HeaderText="Affects Income" 
                                SortExpression="IsActive" >
                                <ItemStyle Width="90px" HorizontalAlign="Center" />
                            </asp:CheckBoxField>
                            <asp:CheckBoxField DataField="IsActive" HeaderText="Active" 
                                SortExpression="IsActive" >
                                <ItemStyle Width="30px" />
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
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:GridView>
                    </asp:Panel>
                    <asp:FormView ID="newDept" runat="server" DataSourceID="dsDepart" >
                        <InsertItemTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                               <tr>
                                    <td style="width: 124px; height: 16px;" class="SelectRow1B">
                                        Code
                                    </td>
                                    <td style="width: 252px; height: 16px;" class="SelectRow1B">
                                        Name
                                    </td>
                                    <td style="width: 252px; height: 16px;" class="SelectRow1B">
                                        Description
                                    </td>
                                    <td style="width: 202px; height: 16px;" class="SelectRow1B">
                                        Unit
                                    </td>
                                    <td style="width: 92px; height: 16px;" class="SelectRow1B">
                                        Affects Income
                                    </td>
                                    <td style="height: 16px;" class="SelectRow1B" colspan="2">
                                        Active
                                    </td>
                                </tr>
                                <tr class="GridRow1T">
                                    <td style="height: 30px; padding-right: 2px;">
                                        <asp:TextBox ID="DepCodeTextBox" runat="server" Text='<%# Bind("DepCode") %>' 
                                            CssClass="TextBox" />
                                        <asp:RequiredFieldValidator ID="reqDepCode" runat="server" 
                                            ErrorMessage="This is required field!" ControlToValidate="DepCodeTextBox" 
                                            Display="None" />
                                        <asp:ValidatorCalloutExtender ID="reqMarketIDExt" runat="server" 
                                            TargetControlID="reqDepCode" HighlightCssClass="WaterMark" />
                                    </td>
                                    <td style="padding-right: 2px;">
                                        <asp:TextBox ID="DepName" runat="server" Text='<%# Bind("DepName") %>' 
                                            CssClass="TextBox" />
                                        <asp:RequiredFieldValidator ID="reqDepName" runat="server" 
                                            ErrorMessage="This is required field!" ControlToValidate="DepName" 
                                            Display="None" />
                                        <asp:ValidatorCalloutExtender ID="reqMarketExt" runat="server" 
                                            TargetControlID="reqDepName" HighlightCssClass="WaterMark" />
                                    </td>
                                    <td style="padding-right: 2px;">
                                        <asp:TextBox ID="DepName0" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("Description") %>' />
                                    </td>
                                    <td style="padding-right: 2px;">
                                        <asp:DropDownList ID="newUnits" runat="server" CssClass="TextBox"
                                            SelectedValue='<%# Bind("AccBusinessUnitID") %>'
                                            DataSourceID="dsNewUnits" 
                                            DataTextField="AccBusinessUnitName" 
                                            DataValueField="AccBusinessUnitID" >
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsNewUnits" runat="server"
                                            TypeName="accUnitsTableAdapters.AccBusinessUnitTableAdapter" 
                                            SelectMethod="GetActive" >
                                            <SelectParameters>
                                                <asp:Parameter Name="ActiveOnly" Type="Boolean" DefaultValue="True" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                    <td style="text-align: center;">
                                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("AffectsIncome") %>' />
                                    </td>
                                    <td style="width: 30px;">
                                        <asp:CheckBox ID="cbActive" runat="server" Checked='<%# Bind("IsActive") %>' />
                                    </td>
                                    <td style="width: 70px; padding-left: 5px;">
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
                                    <td style="width: 924px; margin-top: 2px;">
                                        &nbsp;
                                    </td>
                                    <td style="padding-top: 5px; margin-top: 2px;">
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                <tr>
                                    <td style="width: 924px; margin-top: 2px;">
                                        &nbsp;
                                    </td>
                                    <td style="padding-top: 5px; margin-top: 2px;">
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                    </asp:FormView>
                    <asp:ObjectDataSource ID="dsDepart" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataWithUnit" TypeName="accUnitsTableAdapters.DepartmentTableAdapter"
                        UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_DepID" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="DepCode" Type="String" />
                            <asp:Parameter Name="DepName" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="IsActive" Type="Boolean" />
                            <asp:Parameter Name="AccBusinessUnitID" Type="Int32" />
                            <asp:Parameter Name="Original_DepID" Type="Int32" />
                            <asp:Parameter Name="AffectsIncome" Type="Boolean" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="DepCode" Type="String" />
                            <asp:Parameter Name="DepName" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="IsActive" Type="Boolean" />
                            <asp:Parameter Name="AccBusinessUnitID" Type="Int32" />
                            <asp:Parameter Name="AffectsIncome" Type="Boolean" />
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
                <td class="GridLabelBG">
                    <asp:Label ID="lblMembers" runat="server" Text="Employee" 
                        SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top;">
                    &nbsp;
                </td>
                <td class="GridBorder">
                    <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                        <tr>
                            <th class="GridRow1B" style="width: 124px; text-align: left;">
                                Filter
                            </th>
                            <th class="GridRow1B" style="width: 200px;">
                                &nbsp;
                            </th>
                            <th class="GridRow1B" style="width: 252px;">
                                &nbsp;
                            </th>
                            <th class="GridRow1B" style="width: 110px; text-align: right;">
                                <asp:ImageButton ID="fltEmpApply" runat="server" CausesValidation="false" 
                                    CssClass="ImgButton" ImageUrl="~/Images/accept_inline.gif" />
                                <asp:ImageButton ID="fltEmpReset" runat="server" CausesValidation="false" 
                                    CssClass="ImgButton" ImageUrl="~/Images/decline_inline.gif" />
                            </th>
                        </tr>
                        <tr>
                            <td style="padding-right: 2px;">
                                <asp:TextBox ID="fltEmpCode" runat="server" CssClass="TextBox" />
                                <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" runat="server"
                                    TargetControlID="fltEmpCode" WatermarkCssClass="WaterMark" 
                                    WatermarkText="Like Code..." />
                            </td>
                            <td style="padding-right: 2px;" colspan="2">
                                <asp:TextBox ID="fltEmpText" runat="server" CssClass="TextBox" />
                                <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender3" runat="server"
                                    TargetControlID="fltEmpText" WatermarkCssClass="WaterMark" 
                                    WatermarkText="Like Name or Description..." />
                            </td>
                            <td>
                                <asp:CheckBox ID="fltEmpInactive" runat="server" Text="Include inactive" Checked="true" />
                            </td>
                        </tr>
                    </table>

                    <asp:Panel ID="Panel1" runat="server" ScrollBars="Vertical" Height="300" style="border-top: solid 2px; border-bottom: solid 2px;">                
                    <asp:GridView ID="gvEmp" runat="server" SkinID="skGridView" 
                        AutoGenerateColumns="False" DataSourceID="dsEmp" 
                        DataKeyNames="EmpID,DepID">
                        <Columns>
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" 
                                ShowSelectButton="True" >
                                <ItemStyle Width="50px" />
                            </asp:CommandField>
                            <asp:BoundField DataField="DepID" HeaderText="DepID" ReadOnly="True" Visible="False" />
                            <asp:BoundField DataField="EmpID" HeaderText="EmpID" ReadOnly="True" Visible="False" />
                            <asp:BoundField DataField="EmpCode" HeaderText="Code" 
                                SortExpression="EmpCode">
                                <ControlStyle CssClass="TextBox" />
                                <ItemStyle Width="70px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="EmpName" HeaderText="Name" 
                                SortExpression="EmpName">
                                <ControlStyle CssClass="TextBox" />
                                <ItemStyle Width="200px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Description" HeaderText="Description" 
                                SortExpression="Description">
                            <ControlStyle CssClass="TextBox" />
                            <ItemStyle Width="250px" />
                            </asp:BoundField>
                            <asp:CheckBoxField DataField="IsActive" HeaderText="Active" 
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
                    </asp:Panel>
                    <asp:FormView ID="fvEmp" runat="server" DataSourceID="dsEmp">
                        <InsertItemTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                               <tr class="GridRow1T">
                                    <td style="width: 124px; height: 14px;" class="SelectRow1B">
                                        Employee Code
                                    </td>
                                    <td style="width: 200px; height: 14px;" class="SelectRow1B">
                                        Employee Name
                                    </td>
                                    <td style="width: 252px; height: 14px;" class="SelectRow1B">
                                        Description
                                    </td>
                                    <td style="height: 14px;" class="SelectRow1B" colspan="2">
                                        Active
                                    </td>
                                </tr>
                                <tr class="GridRow1T">
                                    <td style="height: 30px; padding-right: 2px;">
                                        <asp:TextBox ID="ECodeTextBox" runat="server" Text='<%# Bind("EmpCode") %>' CssClass="TextBox" />
                                        <asp:RequiredFieldValidator ID="reqEmpCode" runat="server" 
                                            ErrorMessage="This is required field!" ControlToValidate="ECodeTextBox" 
                                            Display="None" />
                                        <asp:ValidatorCalloutExtender ID="reqMarketIDExt" runat="server" 
                                            TargetControlID="reqEmpCode" HighlightCssClass="WaterMark" />
                                    </td>
                                    <td style="padding-right: 2px;">
                                        <asp:TextBox ID="EmpName" runat="server" Text='<%# Bind("EmpName") %>' CssClass="TextBox" />
                                        <asp:RequiredFieldValidator ID="reqEmpName" runat="server" 
                                            ErrorMessage="This is required field!" ControlToValidate="EmpName" 
                                            Display="None" />
                                        <asp:ValidatorCalloutExtender ID="reqMarketExt" runat="server" 
                                            TargetControlID="reqEmpName" HighlightCssClass="WaterMark" />
                                    </td>
                                    <td style="padding-right: 2px;">
                                        <asp:TextBox ID="EmpDesc" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("Description") %>' />
                                    </td>
                                    <td style="width: 30px; ">
                                        <asp:CheckBox ID="cbActiveE" runat="server" Checked='<%# Bind("IsActive") %>' />
                                    </td>
                                    <td style="width: 70px; padding-left: 5px;">
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
                                    <td style="width: 580px; margin-top: 2px;">
                                        &nbsp;
                                    </td>
                                    <td style="width: 100px; padding-top: 5px; margin-top: 2px;">
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="width: 580px; margin-top: 2px;">
                                        &nbsp;
                                    </td>
                                    <td style="width: 100px; padding-top: 5px; margin-top: 2px;">
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

