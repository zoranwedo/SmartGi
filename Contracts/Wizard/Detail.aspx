<%@ Page Title="" Language="VB" MasterPageFile="~/Contracts/Wizard/masterWizard.master"
    AutoEventWireup="false" CodeFile="Detail.aspx.vb" Inherits="Contracts_Wizard_Detail" %>

<%@ MasterType VirtualPath="~/Contracts/Wizard/masterWizard.master" %>
<asp:Content ID="CntTitle" ContentPlaceHolderID="title" runat="Server">
    Details
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="WizardContent" runat="Server">
    <div class="Red">
        <table cellpadding="0" cellspacing="2">
            <tr>
                <td class="GridLabelBG" colspan="3">
                    <asp:Label ID="Label6" runat="server" SkinID="skGridLabel" Text="Contract basic details"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder" valign="top">
                    <asp:DetailsView ID="dvContractDetail" runat="server" DataKeyNames="ContractID" SkinID="skDetailView"
                        Width="600px" DataSourceID="dsContractDetail">
                        <FieldHeaderStyle Width="120px" />
                        <Fields>
                            <asp:TemplateField HeaderText="Start" SortExpression="Start">
                                <EditItemTemplate>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox1"
                                        Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date" />
                                    <%--<asp:RangeValidator ID="RangeValidator1" runat="server" 
                                        ControlToValidate="TextBox1" ErrorMessage="Out of contract period!" 
                                        MinimumValue="<%# Master.GetStartT() %>"  Type="Date" 
                                        MaximumValue="<%# Master.GetFinishT() %>" Display="None" />
                                    <asp:ValidatorCalloutExtender ID="RangeValidator1_ValidatorCalloutExtender" 
                                        runat="server" Enabled="True" TargetControlID="RangeValidator1" />--%>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator1_ValidatorCalloutExtender" 
                                        runat="server" Enabled="True" TargetControlID="CompareValidator1" />
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="TextBox" Text='<%# Bind("Start", "{0:d}") %>'></asp:TextBox>
                                    <asp:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" CssClass="cal_Theme1"
                                        Enabled="True" TargetControlID="TextBox1" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Start", "{0:d}") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="End" SortExpression="Finish">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="TextBox" Text='<%# Bind("Finish", "{0:d}") %>' />
                                    <asp:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="TextBox2" />
                                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="TextBox2"
                                        Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date" />
                                    <asp:ValidatorCalloutExtender ID="CompareValidator2_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator2" />
                                    <%--<asp:RangeValidator ID="RangeValidator11" runat="server" 
                                        ControlToValidate="TextBox2" Display="None" 
                                        ErrorMessage="Out of contract period!" 
                                        MaximumValue="<%# Master.GetFinishT() %>" 
                                        MinimumValue="<%# Master.GetStartT() %>" Type="Date" />
                                    <asp:ValidatorCalloutExtender ID="RangeValidator11_ValidatorCalloutExtender" 
                                        runat="server" Enabled="True" TargetControlID="RangeValidator11" />--%>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Finish", "{0:d}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Commision (%)" SortExpression="Commision">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" CssClass="TextBox" Text='<%# Bind("Commision") %>' />
                                    <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="TextBox5"
                                        Display="None" ErrorMessage="Numbered input" Operator="DataTypeCheck" Type="Double" />
                                    <asp:ValidatorCalloutExtender ID="CompareValidator3_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator3" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Commision") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Title" SortExpression="Title">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlTitle" runat="server" CssClass="TextBox" DataSourceID="dsContractTitle"
                                        DataTextField="ContractTitle" DataValueField="ContractTitle" SelectedValue='<%# Bind("Title") %>' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Title") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="RateRecieved" SortExpression="RateRecieved">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtRRecived" runat="server" Text='<%# Bind("RateRecieved", "{0:d}") %>' CssClass="TextBox" />
                                    <asp:CalendarExtender ID="TextBox3_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="txtRRecived" />
                                    <asp:CompareValidator ID="dateRRecived" runat="server" ControlToValidate="txtRRecived"
                                        Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date" />
                                    <asp:ValidatorCalloutExtender ID="datexRRecived" runat="server"
                                        Enabled="True" TargetControlID="dateRRecived" />
                                    <asp:RequiredFieldValidator ID="reqRRecived" runat="server" ControlToValidate="txtRRecived"
                                        Display="None" ErrorMessage="Required Field" />
                                    <asp:ValidatorCalloutExtender ID="reqxRRecived" runat="server" Enabled="True" TargetControlID="reqRRecived" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("RateRecieved", "{0:d}") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description">
                                <ControlStyle CssClass="TextBox" Height="40px"/>
                                <HeaderStyle VerticalAlign="Top" />
                            </asp:BoundField>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Save" />&nbsp;
                                    <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:Button ID="Button4" runat="server" CausesValidation="True" CommandName="Insert" Text="Save" />&nbsp;
                                    <asp:Button ID="Button5" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Button ID="Button6" runat="server" CausesValidation="False" CommandName="Edit" 
                                        Text="Edit" Style="margin-top: 5px;" Visible="<%# Master.CanEdit() %>" />
                                    &nbsp;&nbsp;
                                    <asp:Button ID="Button3" runat="server" CausesValidation="False" CommandName="Delete"
                                        OnClientClick="return confirm('Are you sure you want to delete the record')"
                                        Text="Delete" Style="margin-top: 5px;" Visible="<%# Master.CanEdit() %>" />
                                </ItemTemplate>
                                <ControlStyle BorderStyle="None" CssClass="Button" Font-Size="10pt" ForeColor="White" />
                                <ItemStyle CssClass="ComandRow2T" Height="30px" HorizontalAlign="Right" VerticalAlign="Middle" />
                            </asp:TemplateField>
                        </Fields>
                    </asp:DetailsView>

                    <asp:DetailsView ID="dvContractDetailRO" runat="server" DataKeyNames="ContractID" SkinID="skDetailView"
                        Width="600px" DataSourceID="dsOvwCtr">
                        <FieldHeaderStyle Width="120px" />
                        <Fields>
                            <asp:TemplateField HeaderText="Start" SortExpression="Start">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Start", "{0:d}") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="End" SortExpression="Finish">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Finish", "{0:d}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Commision (%)" SortExpression="Commision">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("Commision") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Title" SortExpression="Title">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Title") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="RateRecieved" SortExpression="RateRecieved">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtRRecived" runat="server" Text='<%# Bind("RateRecieved", "{0:d}") %>' CssClass="TextBox" />
                                    <asp:CalendarExtender ID="TextBox3_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="txtRRecived" />
                                    <asp:CompareValidator ID="dateRRecived" runat="server" ControlToValidate="txtRRecived"
                                        Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date" />
                                    <asp:ValidatorCalloutExtender ID="datexRRecived" runat="server"
                                        Enabled="True" TargetControlID="dateRRecived" />
                                    <asp:RequiredFieldValidator ID="reqRRecived" runat="server" ControlToValidate="txtRRecived"
                                        Display="None" ErrorMessage="Required Field" />
                                    <asp:ValidatorCalloutExtender ID="reqxRRecived" runat="server" Enabled="True" TargetControlID="reqRRecived" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("RateRecieved", "{0:d}") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Description">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDescription" runat="server" CssClass="TextBox" Text='<%# Bind("Description") %>' Height="40px" />
                                    <div style="text-align: right; vertical-align: top;">
                                        <asp:ImageButton ID="ibUpdate" runat="server" CommandName="Update" 
                                            ImageUrl="~/Images/accept_inline.gif" CssClass="ImgButton" />  
                                        <asp:ImageButton ID="ibCancel" runat="server" CommandName="Cancel" 
                                            ImageUrl="~/Images/decline_inline.gif" CssClass="ImgButton" 
                                            CausesValidation="false" />
                                    </div>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Bind("Description") %>' />
                                    <div style="text-align: right;">
                                        <asp:ImageButton ID="ibEdit" runat="server" CommandName="Edit" 
                                            ImageUrl="~/Images/edit_inline.gif" CssClass="ImgButton" />
                                    </div>
                                </ItemTemplate>
                                <HeaderStyle VerticalAlign="Top" />
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>&nbsp;</ItemTemplate>
                                <ItemStyle CssClass="ComandRow2T" Height="30px" HorizontalAlign="Right" VerticalAlign="Middle" />
                            </asp:TemplateField>
                        </Fields>
                    </asp:DetailsView>
                </td>
                <td class="GridBorder" valign="top">
                    <asp:GridView ID="gridMealPlan" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        DataKeyNames="MealPlanID,ContractID" DataSourceID="dsMealPlan" SkinID="skGridView">
                        <Columns>
                            <asp:BoundField DataField="ContractID" HeaderText="ContractID" ReadOnly="True" SortExpression="ContractID"
                                Visible="False" />
                            <asp:TemplateField SortExpression="SelectedMP">
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("SelectedMP") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("SelectedMP") %>' />
                                </EditItemTemplate>
                                <ItemStyle Width="25px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="MealPlanID" HeaderText="Meal Plan" ReadOnly="True">
                                <HeaderStyle Font-Bold="True" HorizontalAlign="Left" />
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                    <div style="height: 30px; text-align: right; padding-top: 5px;">
                        <asp:Button ID="btnMPUpdate" runat="server" SkinID="skBtnBase" Text="Update" />
                    </div>
                    <asp:ObjectDataSource ID="dsMealPlan" runat="server" SelectMethod="GetData" TypeName="ContractsTableAdapters.SelectContractMealPlanTableAdapter"
                        UpdateMethod="ContractMealPlanUpdate">
                        <UpdateParameters>
                            <asp:QueryStringParameter Name="ContractID" QueryStringField="ContractID" Type="Int32" />
                            <asp:Parameter Name="MealPlanID" Type="String" />
                            <asp:Parameter Name="SelectedMP" Type="Boolean" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="ContractID" QueryStringField="ContractID" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
                <td class="GridBorder" valign="top">
                    <asp:GridView ID="gridRateType" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        DataSourceID="dsRateType" SkinID="skGridView" DataKeyNames="ContractID,RateTypeID">
                        <Columns>
                            <asp:BoundField DataField="ContractID" HeaderText="ContractID" ReadOnly="True" SortExpression="ContractID" Visible="False" />
                            <asp:TemplateField SortExpression="SelectedRT">
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbRateTypeID" runat="server" Checked='<%# Bind("SelectedRT") %>' />
                                    <asp:MutuallyExclusiveCheckBoxExtender ID="MutuallyExclusiveCheckBoxExtender1" runat="server"
                                        TargetControlID="cbRateTypeID" Key="RateTypeKey">
                                    </asp:MutuallyExclusiveCheckBoxExtender>
                                </ItemTemplate>
                                <ItemStyle Width="25px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="RateTypeID" HeaderText="Rate Type" ReadOnly="True">
                                <HeaderStyle Font-Bold="True" HorizontalAlign="Left" />
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                    <div style="height: 30px; text-align: right; padding-top: 5px;">
                        <asp:Button ID="btnRTUpdate" runat="server" SkinID="skBtnBase" Text="Update" />
                    </div>
                    <asp:ObjectDataSource ID="dsRateType" runat="server" 
                        SelectMethod="GetData" 
                        TypeName="ContractsTableAdapters.SelectContractRateTypeTableAdapter">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="ContractID" QueryStringField="ContractID" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="dsContractDetail" runat="server" 
            DeleteMethod="Delete" SelectMethod="GetData" TypeName="ContractsTableAdapters.ContractByIDTableAdapter"
            UpdateMethod="UpdateQuery">
            <DeleteParameters>
                <asp:QueryStringParameter Name="ContractID" QueryStringField="ContractID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Start" Type="DateTime" />
                <asp:Parameter Name="Finish" Type="DateTime" />
                <asp:Parameter Name="Commision" Type="Decimal" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Year" Type="Int16" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="RateRecieved" Type="DateTime" />
                <asp:ControlParameter ControlID="hfUsername" Name="UserName" 
                    PropertyName="Value" Type="String" />
                <asp:QueryStringParameter Name="ContractID" QueryStringField="ContractID" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="ContractID" QueryStringField="ContractID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsOvwCtr" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" 
            UpdateMethod="UpdateQuery"
            TypeName="dsCtrPrevTableAdapters.OvwContractTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="ContractID" QueryStringField="ContractID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="RateRecieved" Type="DateTime" />
                <asp:Parameter Name="Description" Type="String" />
                <%--<asp:Parameter Name="Original_ContractID" Type="Int32" />--%>
                <asp:QueryStringParameter Name="Original_ContractID" QueryStringField="ContractID" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>

        <asp:ObjectDataSource ID="dsContractTitle" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ContractsTableAdapters.ContractTitleTableAdapter"
            UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_ContractTitle" Type="String" />
                <asp:Parameter Name="Original_ContractYear" Type="Int16" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Original_ContractTitle" Type="String" />
                <asp:Parameter Name="Original_ContractYear" Type="Int16" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="ContractTitle" Type="String" />
                <asp:Parameter Name="ContractYear" Type="Int16" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <asp:HiddenField ID="dummy" runat="server" />
        <asp:ModalPopupExtender ID="popExtender" runat="server" BackgroundCssClass="modalBackground"
            CancelControlID="btnNo" DropShadow="True" Enabled="true" PopupControlID="popPanel"
            PopupDragHandleControlID="popLabel" TargetControlID="hfUserName" X="200" Y="200">
        </asp:ModalPopupExtender>
        <asp:Panel ID="popPanel" runat="server" BackColor="White" Style="display: none" Width="300px">
            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td class="GridLabelBG">
                        <asp:Label ID="popLabel" runat="server" SkinID="skGridLabel" Text="Title" />
                    </td>
                </tr>
                <tr>
                    <td class="GridBorder">
                        <p style="text-align: center;">
                            <asp:Label ID="popMessage" runat="server" Text="Message" />
                        </p>
                        <p class="GridRow2T" style="text-align: right;">
                            <br />
                            <asp:Button ID="btnYes" runat="server" SkinID="skBtnBase" Text="Yes" />
                            &nbsp;
                            <asp:Button ID="btnNo" runat="server" SkinID="skBtnBase" Text="No" />
                            &nbsp;
                        </p>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
</asp:Content>
