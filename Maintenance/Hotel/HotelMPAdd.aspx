<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Hotel/masterHotels.master" AutoEventWireup="false" CodeFile="HotelMPAdd.aspx.vb" Inherits="Maintenance_Hotel_HotelMPAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    <p>
        Meal Plan Add On</p>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HotelContent" Runat="Server">
    <div class="Blue">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table cellpadding="0" cellspacing="2px">
                    <tr>
                        <td class="GridLabelBG" colspan="2">
                            <asp:Label ID="Label7" runat="server" SkinID="skGridLabel" 
                                Text="Meal Plan and Taxes"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        
                        <td class="GridBorder" style="vertical-align: top;">
                            <asp:GridView ID="gridMP" runat="server" AutoGenerateColumns="False" 
                                DataKeyNames="MealPlanID" DataSourceID="dsHotelMP" SelectedIndex="0" 
                                SkinID="skGridView" Width="196px">
                                <HeaderStyle HorizontalAlign="Right" />
                                <Columns>
                                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" 
                                        ShowCancelButton="False" ShowSelectButton="True">
                                        <ItemStyle Width="25px" />
                                    </asp:CommandField>
                                    <asp:BoundField DataField="MealPlanID" HeaderText="MealPlan" ReadOnly="True" 
                                        SortExpression="MealPlanID" />
                                </Columns>
                                <EmptyDataTemplate>
                                    <asp:Panel ID="pnlNewPeriod" runat="server" 
                                        style="width: 510px; height: 30px; text-align:right; padding-top: 5px;">
                                        <asp:Button ID="btNew" runat="server" BorderStyle="None" 
                                            CausesValidation="False" CommandName="NewPeriod" SkinID="skBtnBase" 
                                            Text="Insert Hotel Period" />
                                    </asp:Panel>
                                </EmptyDataTemplate>
                            </asp:GridView>
                            <asp:ObjectDataSource ID="dsHotelMP" runat="server" DeleteMethod="Delete" 
                                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                                SelectMethod="GetDataByHotelID" 
                                TypeName="dsMaintHotelTableAdapters.HotelMealPlanTableAdapter" 
                                UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_HotelID" Type="Int32" />
                                    <asp:Parameter Name="Original_MealPlanID" Type="String" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="Original_HotelID" Type="Int32" />
                                    <asp:Parameter Name="Original_MealPlanID" Type="String" />
                                </UpdateParameters>
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="HotelID" QueryStringField="HotelID" 
                                        Type="Int32" />
                                </SelectParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="HotelID" Type="Int32" />
                                    <asp:Parameter Name="MealPlanID" Type="String" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                        </td>
                        <td class="GridBorder" style="vertical-align: top; width: 367px">
                            <asp:GridView ID="gridAddOn" runat="server" AllowSorting="True" 
                                AutoGenerateColumns="False" DataKeyNames="HotelId,MealPlanId,AddID" 
                                DataSourceID="dsHotelMPAdd" SkinID="skGridView" Width="100%">
                                <Columns>
                                    <asp:BoundField DataField="HotelId" HeaderText="HotelID" ReadOnly="True" 
                                        SortExpression="HotelId" Visible="False" />
                                    <asp:TemplateField SortExpression="SelectedTx">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="CheckBox3" runat="server" 
                                                Checked='<%# Bind("SelectedTx") %>' />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:CheckBox ID="CheckBox4" runat="server" 
                                                Checked='<%# Bind("SelectedTx") %>' />
                                        </EditItemTemplate>
                                        <ItemStyle Width="25px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="MealPlanId" HeaderText="MealPlanId" ReadOnly="True" 
                                        SortExpression="MealPlanId" Visible="False">
                                    </asp:BoundField>
                                    <asp:BoundField DataField="AddID" HeaderText="Add On" ReadOnly="True" 
                                        SortExpression="AddID" Visible="False">
                                        <HeaderStyle Font-Bold="True" HorizontalAlign="Left" />
                                        <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="AddName" HeaderText="AddName" 
                                        SortExpression="AddName" ReadOnly="True" />
                                    <asp:TemplateField HeaderText="AddType" SortExpression="AddType">
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="TextBox" 
                                                SelectedValue='<%# Eval("AddType") %>' Enabled="False">
                                                <asp:ListItem Value="0">add-in tax</asp:ListItem>
                                                <asp:ListItem Value="1">add-in fee</asp:ListItem>
                                                <asp:ListItem Value="2">add-on tax</asp:ListItem>
                                                <asp:ListItem Value="3">add-on fee</asp:ListItem>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="TextBox" 
                                                SelectedValue='<%# Eval("AddType") %>' Enabled="False">
                                                <asp:ListItem Value="0">add-in tax</asp:ListItem>
                                                <asp:ListItem Value="1">add-in fee</asp:ListItem>
                                                <asp:ListItem Value="2">add-on tax</asp:ListItem>
                                                <asp:ListItem Value="3">add-on fee</asp:ListItem>
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CheckBoxField DataField="IsPercent" HeaderText="%" 
                                        SortExpression="IsPercent" ReadOnly="True" />
                                    <asp:BoundField DataField="Value" HeaderText="Value" SortExpression="Value" 
                                        ReadOnly="True" />
                                </Columns>
                            </asp:GridView>
                            <div style="padding-top: 5px; padding-bottom: 5px; text-align: right">
                                <asp:ObjectDataSource ID="dsHotelMPAdd" runat="server" 
                                    SelectMethod="GetData" 
                                    TypeName="dsMaintHotelTableAdapters.SelectHotelMealPlanAddTableAdapter" 
                                    UpdateMethod="HotelMealPlanAddUpdate">
                                    <UpdateParameters>
                                        <asp:QueryStringParameter Name="HotelID" QueryStringField="HotelID" 
                                            Type="Int32" />
                                        <asp:ControlParameter ControlID="gridMP" Name="MealPlanID" 
                                            PropertyName="SelectedValue" Type="String" />
                                        <asp:Parameter Name="AddID" Type="Int32" />
                                        <asp:Parameter Name="SelectedTx" Type="Boolean" />
                                    </UpdateParameters>
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="HotelId" QueryStringField="HotelID" 
                                            Type="Int32" />
                                        <asp:ControlParameter ControlID="gridMP" Name="MealPlanID" 
                                            PropertyName="SelectedValue" Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <asp:Button ID="btnUpdate0" runat="server" SkinID="skBtnBase" Text="Update" />
                            </div>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    
    <br />
    
    <asp:HiddenField ID="dummy" runat="server" />
    <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
        PopupDragHandleControlID="popLabel" CancelControlID="btnNo" DropShadow="True" 
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
                        <asp:Label ID="popMessage" runat="server" Text="Message"></asp:Label>
                    </p>
                    <p style="text-align: right;" class="GridRow2T">
                        <br />
                        <asp:Button ID="btnYes" runat="server" Text="Yes" SkinID="skBtnBase" />&nbsp;
                        <asp:Button ID="btnNo" runat="server" Text="No" SkinID="skBtnBase" />&nbsp;
                    </p>
                </td>
            </tr>
        </table>
    </asp:Panel>

</asp:Content>

