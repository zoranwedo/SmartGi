<%@ Page Title="" Language="VB" MasterPageFile="~/Contracts/Wizard/masterWizard.master"
    AutoEventWireup="false" CodeFile="ManageRate.aspx.vb" Inherits="Contracts_Wizard_ManageRate" %>
<%@ MasterType VirtualPath="~/Contracts/Wizard/masterWizard.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Manage Rate
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="WizardContent" runat="Server">
    <div class="Red">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblMarket" runat="server" Text="Manage rates" SkinID="skGridLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gridPeriods1" runat="server" SkinID="skGridView" AutoGenerateColumns="False"
                        DataSourceID="ObjectDataSource1" DataKeyNames="ContractId,HotelId,RateCodeId,MealPlanId,RoomTypeId">
                        <HeaderStyle HorizontalAlign="Left" />
                        <Columns>
                            <asp:BoundField DataField="ContractId" HeaderText="ContractId" ReadOnly="True"
                                Visible="False" />
                            <asp:BoundField DataField="HotelId" HeaderText="HotelId" ReadOnly="True" 
                                Visible="False" />
                            <asp:BoundField DataField="RoomTypeId" HeaderText="Room" SortExpression="RoomTypeId" ReadOnly="True">
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="RateCodeId" HeaderText="RateCode" SortExpression="RateCodeId" ReadOnly="True">
                                <ItemStyle Width="120px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MealPlanId" HeaderText="MP" SortExpression="MealPlanId" ReadOnly="True">
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:DropDownList ID="cbPerPax" runat="server" CssClass="TextBox" 
                                        SelectedValue='<%# Bind("PerPax") %>' 
                                        Enabled='<%# Eval("IsConstrained") = False %>' >
                                        <asp:ListItem Value="False">PerRoom</asp:ListItem>
                                        <asp:ListItem Value="True">PerPax</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Generate">
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("Generate") %>' />
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="80px" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete"
                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataWithConstraint"
                        TypeName="ContractsTableAdapters.ContractRateOptionTableAdapter" 
                        UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_ContractId" Type="Int32" />
                            <asp:Parameter Name="Original_HotelId" Type="Int32" />
                            <asp:Parameter Name="Original_RateCodeId" Type="String" />
                            <asp:Parameter Name="Original_MealPlanId" Type="String" />
                            <asp:Parameter Name="Original_RoomTypeId" Type="String" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="PerPax" Type="Boolean" />
                            <asp:Parameter Name="Generate" Type="Boolean" />
                            <asp:Parameter Name="Original_ContractId" Type="Int32" />
                            <asp:Parameter Name="Original_HotelId" Type="Int32" />
                            <asp:Parameter Name="Original_RateCodeId" Type="String" />
                            <asp:Parameter Name="Original_MealPlanId" Type="String" />
                            <asp:Parameter Name="Original_RoomTypeId" Type="String" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="ContractID" QueryStringField="ContractID" Type="Int32" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ContractId" Type="Int32" />
                            <asp:Parameter Name="HotelId" Type="Int32" />
                            <asp:Parameter Name="RateCodeId" Type="String" />
                            <asp:Parameter Name="MealPlanId" Type="String" />
                            <asp:Parameter Name="RoomTypeId" Type="String" />
                            <asp:Parameter Name="PerPax" Type="Boolean" />
                            <asp:Parameter Name="Generate" Type="Boolean" />
                            <asp:Parameter Name="IsGenerated" Type="Boolean" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                    <div style="height:30px; text-align: right; padding-top:5px;">
                        <asp:Button ID="btnNew0" runat="server" Text="Update" SkinID="skBtnBase" CommandName="New" />
                        &nbsp;
                        <asp:Button ID="btnNew" runat="server" CommandName="New" SkinID="skBtnBase" Text="Generate rates" />
                    </div> 
                </td>
            </tr>
        </table>
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
    </div>
</asp:Content>
