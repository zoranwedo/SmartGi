<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/SihotMap/MapSihot.master" AutoEventWireup="false"
    CodeFile="MapMealPlan.aspx.vb" Inherits="Maintenance_SihotMap_MapMealPlan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    SIHOT Services to Meal Plan Mapping
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" runat="Server">
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lbMealPlans" runat="server" Text="Smart Meal Plan Mappings" SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvMealPlans" runat="server" DataSourceID="dsMealPlans" DataKeyNames="serviceID"
                        SkinID="skGridView" AutoGenerateColumns="False" EnableModelValidation="True">
                        <RowStyle Wrap="False" Height="30px" />
                        <Columns>
                            <asp:TemplateField HeaderText="SIHOT" >
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("serviceID") %>' />
                                </ItemTemplate>
                                <ItemStyle Width="80px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SMART" >
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("MealPlanID") %>' />
                                </ItemTemplate>
                                <ItemStyle Width="80px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Meal Plan" >
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("MealPlan") %>' />
                                </ItemTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ibDelete" runat="server" CausesValidation="False" ToolTip="Delete meal plan mapping" 
                                        CommandName="Delete" OnClientClick="confirm('Are you sure you want to delete meal plan mapping?')"
                                        ImageUrl="~/Images/delete_inline.gif" />
                                </ItemTemplate>
                                <ItemStyle Width="50px" />
                                <ControlStyle CssClass="ImgButton" />
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr> 
                                    <td class="GridRow2B" style="width: 82px; font-weight: bold;" >
                                        SIHOT
                                    </td> 
                                    <td class="GridRow2B" style="width: 286px; font-weight: bold;" >
                                        SMART Meal Plan
                                    </td> 
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                    </asp:GridView>
                    <asp:FormView ID="fvMealPlans" runat="server" DataKeyNames="serviceID" 
                        DataSourceID="dsMealPlans">
                        <InsertItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr> 
                                    <td class="GridRowClear" style="width: 82px; height: 30px;" >
                                        <asp:TextBox ID="txtServiceID" runat="server" Text='<%# Bind("serviceID") %>' CssClass="TextBox" Width="70px" />
                                        <asp:RequiredFieldValidator ID="txtServiceID_Required" runat="server" ErrorMessage="Required field!" 
                                            Display="None" ControlToValidate="txtServiceID" />
                                        <asp:ValidatorCalloutExtender ID="txtServiceID_RequiredCallout" runat="server" TargetControlID="txtServiceID_Required" />
                                    </td> 
                                    <td class="GridRowClear" style="width: 234px; height: 30px;" >
                                        <asp:DropDownList ID="ddlMealPlan" runat="server" CssClass="TextBox"
                                            DataSourceID="dsMealPlan" DataTextField="MealPlan" DataValueField="MealPlanID" 
                                            SelectedValue='<%# Bind("MealPlanID") %>'>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsMealPlan" runat="server" 
                                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                            TypeName="dsSIHOTTableAdapters.MealPlanTableAdapter"></asp:ObjectDataSource>
                                    </td> 
                                    <td class="GridRowClear" style="width: 52px; height: 30px;" >
                                        <asp:ImageButton ID="ibUpdate" runat="server" CausesValidation="True"
                                            CommandName="Insert" ImageUrl="~/Images/accept_inline.gif" CssClass="ImgButton" />&nbsp;
                                        <asp:ImageButton ID="ibCancel" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" ImageUrl="~/Images/decline_inline.gif" CssClass="ImgButton" />
                                    </td> 
                                </tr>
                            </table>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr> 
                                    <td class="GridRowClear" style="width: 82px;" >&nbsp;</td> 
                                    <td class="GridRowClear" style="width: 286px; text-align: right;" > 
                                        <asp:Button ID="btNew" runat="server" Text="New Mapping" SkinID="skBtnBase" CommandName="New" />
                                    </td> 
                                </tr>
                            </table>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr> 
                                    <td class="GridRowClear" style="width: 82px;" >&nbsp;</td> 
                                    <td class="GridRowClear" style="width: 286px; text-align: right;" > 
                                        <asp:Button ID="btNew" runat="server" Text="New Mapping" SkinID="skBtnBase" CommandName="New" />
                                    </td> 
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                    </asp:FormView>
                </td>
            </tr>
        </table>
    </div>
    <asp:HiddenField ID="hfUser" runat="server" />
    <asp:ObjectDataSource ID="dsMealPlans" runat="server" OldValuesParameterFormatString="{0}"
        TypeName="dsSIHOTTableAdapters.MealPlanMapTableAdapter" 
        SelectMethod="GetData"
        DeleteMethod="RemoveMapping"
        InsertMethod="AddMapping" >
        <DeleteParameters>
            <asp:Parameter Name="serviceID" Type="String" />
            <asp:ControlParameter Name="ChangeUser" Type="String" ControlID="hfUser" PropertyName="Value" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="serviceID" Type="String" />
            <asp:Parameter Name="MealPlanID" Type="String" />
            <asp:ControlParameter Name="ChangeUser" Type="String" ControlID="hfUser" PropertyName="Value" />
        </InsertParameters>
    </asp:ObjectDataSource>

    <asp:HiddenField ID="dummy" runat="server" />
    <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
        PopupDragHandleControlID="popLabel" CancelControlID="btnYes" DropShadow="True"
        BackgroundCssClass="modalBackground" TargetControlID="dummy" X="200" Y="200">
    </asp:ModalPopupExtender>
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
                        <asp:Label ID="popMessage" runat="server" Text="Message" />
                    </p>
                    <p style="text-align: right;" class="GridRow1T"><br />
                        <asp:Button ID="btnYes" runat="server" Text="OK" SkinID="skBtnBase" />&nbsp;
                    </p>
                </td>
            </tr>
        </table>
    </asp:Panel>
   
</asp:Content>
