<%@ Page Title="Meal Plan" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="MealPlan.aspx.vb" Inherits="Maintenance_MealPlan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Meal Plan
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" runat="Server">
     <asp:HiddenField ID="dummy" runat="server" />
<div class="Blue">
        <br />
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblMealPlan" runat="server" Text="Meal Plan" SkinID="skGridLabel" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gridMealPlan" runat="server" SkinID="skGridView" AutoGenerateColumns="False" 
                        DataSourceID="dsMealPlan" DataKeyNames="MealPlanID" >
                        <Columns>
                            <asp:BoundField DataField="MealPlanID" HeaderText="Code" ReadOnly="True" SortExpression="MealPlanID">
                                <ItemStyle Width="50px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MealPlan" HeaderText="Meal Plan" SortExpression="MealPlan">
                                <ControlStyle CssClass="TextBox" />
                                <ItemStyle Width="200px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Rate Constraint" SortExpression="RateConstrain">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="TextBox" 
                                        SelectedValue='<%# Bind("RateConstrain") %>'>
                                        <asp:ListItem Value="0">No Constraint</asp:ListItem>
                                        <asp:ListItem Value="1">PerPax Constraint</asp:ListItem>
                                        <asp:ListItem Value="2">PerRoom Constraint</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Visible='<%# Eval("RateConstrain") = 0 %>'>No Constraint</asp:Label>
                                    <asp:Label ID="Label2" runat="server" Visible='<%# Eval("RateConstrain") = 1 %>'>PerPax Constraint</asp:Label>
                                    <asp:Label ID="Label3" runat="server" Visible='<%# Eval("RateConstrain") = 2 %>'>PerRoom Constraint</asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="200px" />
                            </asp:TemplateField>
                            <asp:CommandField CancelImageUrl="~/Images/decline_inline.gif" ShowEditButton="True"
                                ButtonType="Image" EditImageUrl="~/Images/edit_inline.gif" UpdateImageUrl="~/Images/accept_inline.gif">
                                <ControlStyle CssClass="ImgButton" />
                                <ItemStyle Width="50px" />
                            </asp:CommandField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnDel" runat="server" CausesValidation="False" 
                                        CommandName="Delete" ImageUrl="~/Images/delete_inline.gif" 
                                        
                                        OnClientClick="if (!confirm('Are you sure you want to delete this record?')) return;" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:GridView>
                    <asp:FormView ID="newMealPlan" runat="server" DataKeyNames="MealPlanID" 
                        DataSourceID="dsMealPlan" >
                        <InsertItemTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                <tr class="GridRow1T">
                                    <td style="width: 50px; height: 30px;">
                                        <asp:TextBox ID="MealPlanIDTextBox" runat="server" 
                                            Text='<%# Bind("MealPlanID") %>' Width="45px" CssClass="TextBox" 
                                            MaxLength="3" />
                                        <asp:RequiredFieldValidator ID="reqMealPlanID" runat="server" ErrorMessage="This is required field!" ControlToValidate="MealPlanIDTextBox" Display="None" />
                                        <asp:ValidatorCalloutExtender ID="reqMealPlanIDtExt" runat="server" TargetControlID="reqMealPlanID" HighlightCssClass="WaterMark"></asp:ValidatorCalloutExtender>
                                    </td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="MealPlanTextBox" runat="server" Text='<%# Bind("MealPlan") %>' Width="195px" CssClass="TextBox" />
                                        <asp:RequiredFieldValidator ID="reqMealPlan" runat="server" ErrorMessage="This is required field!" ControlToValidate="MealPlanTextBox" Display="None" />
                                        <asp:ValidatorCalloutExtender ID="reqMealPlanExt" runat="server" TargetControlID="reqMealPlan" HighlightCssClass="WaterMark"></asp:ValidatorCalloutExtender>
                                    </td>
                                    <td style="width: 200px;">
                                        <asp:DropDownList ID="DropDownList1" runat="server" Width="200px" CssClass="TextBox" SelectedValue='<%# Bind("RateConstrain") %>'>
                                            <asp:ListItem Value="0">No Constraint</asp:ListItem>
                                            <asp:ListItem Value="1">PerPax Constraint</asp:ListItem>
                                            <asp:ListItem Value="2">PerRoom Constraint</asp:ListItem>
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
                                    <td style="width: 450px; height: 30px;">&nbsp;
                                    </td>
                                    <td style="width: 75px; padding-left: 5px;">
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                    </td>
                            </tr>
                            </ table>
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
                    <asp:ObjectDataSource ID="dsMealPlan" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsMaintBasicTableAdapters.MealPlanTableAdapter"
                        UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_MealPlanID" Type="String" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="MealPlan" Type="String" />
                            <asp:Parameter Name="RateConstrain" Type="Int16" />
                            <asp:Parameter Name="Original_MealPlanID" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="MealPlanID" Type="String" />
                            <asp:Parameter Name="MealPlan" Type="String" />
                            <asp:Parameter Name="RateConstrain" Type="Int16" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
        
        <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel" CancelControlID="btnNo"  OkControlID="btnYes" DropShadow="True" Enabled="True" BackgroundCssClass="modalBackground" X="200" Y="200" TargetControlID="dummy">
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
