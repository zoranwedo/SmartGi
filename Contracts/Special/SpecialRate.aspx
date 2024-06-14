<%@ Page Title="" Language="VB" MasterPageFile="~/Contracts/Special/masterSpecial.master" AutoEventWireup="false" CodeFile="SpecialRate.aspx.vb" Inherits="Contracts_Special_SpecialRate" %>
<%@ MasterType VirtualPath="~/Contracts/Special/masterSpecial.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Specials Rate
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="WizardContent" runat="Server">
    <div class="Red" style="height: 100%">
        <table>
            <tr>
                <td class=" GridBorder" valign="top">
                    <asp:GridView ID="gvRates" runat="server" AutoGenerateColumns="False" DataKeyNames="ContractRateID,HotelId,RateCodeId,RoomTypeId,MealPlanId,CtrPeriodId,Start,Finish,ContractId"
                        DataSourceID="dsContractRate" SkinID="skGridView" Width="347px" SelectedIndex="0">
                        <Columns>
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" ShowSelectButton="True" />
                            <asp:BoundField DataField="ContractRateID" HeaderText="ContractRateID" InsertVisible="False"
                                ReadOnly="True" SortExpression="ContractRateID" Visible="False" />
                            <asp:BoundField DataField="ContractId" HeaderText="ContractId" SortExpression="ContractId"
                                Visible="False" />
                            <asp:BoundField DataField="HotelId" HeaderText="HotelId" SortExpression="HotelId"
                                Visible="False" />
                            <asp:BoundField DataField="RoomTypeId" HeaderText="Room" SortExpression="RoomTypeId" />
                            <asp:BoundField DataField="RateCodeId" HeaderText="Rate" SortExpression="RateCodeId" />
                            <asp:BoundField DataField="MealPlanId" HeaderText="MP" SortExpression="MealPlanId" />
                            <asp:BoundField DataField="CtrPeriodId" HeaderText="CtrPeriodId" SortExpression="CtrPeriodId"
                                Visible="False" />
                            <asp:BoundField DataField="Start" DataFormatString="{0:d}" HeaderText="Start" HtmlEncode="False"
                                SortExpression="Start" />
                            <asp:BoundField DataField="Finish" DataFormatString="{0:d}" HeaderText="Finish" HtmlEncode="False"
                                SortExpression="Finish" />
                        </Columns>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:GridView>
                    <asp:ObjectDataSource ID="dsContractRate" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetDataBySpecID" TypeName="dsSpecialTableAdapters.ContractRateTableAdapter"
                        InsertMethod="Insert" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_ContractRateID" Type="Int64" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ContractId" Type="Int32" />
                            <asp:Parameter Name="HotelId" Type="Int32" />
                            <asp:Parameter Name="RateCodeId" Type="String" />
                            <asp:Parameter Name="MealPlanId" Type="String" />
                            <asp:Parameter Name="RoomTypeId" Type="String" />
                            <asp:Parameter Name="CtrPeriodId" Type="Int32" />
                            <asp:Parameter Name="Start" Type="DateTime" />
                            <asp:Parameter Name="Finish" Type="DateTime" />
                            <asp:Parameter Name="PerPax" Type="Boolean" />
                            <asp:Parameter Name="RateOption" Type="Int16" />
                            <asp:Parameter Name="RatePax1" Type="Decimal" />
                            <asp:Parameter Name="RatePax2" Type="Decimal" />
                            <asp:Parameter Name="RatePax3" Type="Decimal" />
                            <asp:Parameter Name="RatePax4" Type="Decimal" />
                            <asp:Parameter Name="RatePax5" Type="Decimal" />
                            <asp:Parameter Name="RatePax6" Type="Decimal" />
                            <asp:Parameter Name="RatePax7" Type="Decimal" />
                            <asp:Parameter Name="RatePax8" Type="Decimal" />
                            <asp:Parameter Name="RatePax9" Type="Decimal" />
                            <asp:Parameter Name="RatePax10" Type="Decimal" />
                            <asp:Parameter Name="LockChildrenRates" Type="Boolean" />
                            <asp:Parameter Name="RateChld1" Type="Decimal" />
                            <asp:Parameter Name="RateChld2" Type="Decimal" />
                            <asp:Parameter Name="RateChld3" Type="Decimal" />
                            <asp:Parameter Name="RateChld4" Type="Decimal" />
                            <asp:Parameter Name="RateExtra" Type="Int16" />
                            <asp:Parameter Name="Desctiption" Type="String" />
                            <asp:Parameter Name="Allotment" Type="Int16" />
                            <asp:Parameter Name="CutOff" Type="Int16" />
                            <asp:Parameter Name="CopyId" Type="Int32" />
                            <asp:Parameter Name="SpecialId" Type="Int32" />
                            <asp:Parameter Name="SpecialOnRateId" Type="Int64" />
                            <asp:Parameter Name="Original_ContractRateID" Type="Int64" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="SpecialID" QueryStringField="SpecialID" Type="Int32" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ContractId" Type="Int32" />
                            <asp:Parameter Name="HotelId" Type="Int32" />
                            <asp:Parameter Name="RateCodeId" Type="String" />
                            <asp:Parameter Name="MealPlanId" Type="String" />
                            <asp:Parameter Name="RoomTypeId" Type="String" />
                            <asp:Parameter Name="CtrPeriodId" Type="Int32" />
                            <asp:Parameter Name="Start" Type="DateTime" />
                            <asp:Parameter Name="Finish" Type="DateTime" />
                            <asp:Parameter Name="PerPax" Type="Boolean" />
                            <asp:Parameter Name="RateOption" Type="Int16" />
                            <asp:Parameter Name="RatePax1" Type="Decimal" />
                            <asp:Parameter Name="RatePax2" Type="Decimal" />
                            <asp:Parameter Name="RatePax3" Type="Decimal" />
                            <asp:Parameter Name="RatePax4" Type="Decimal" />
                            <asp:Parameter Name="RatePax5" Type="Decimal" />
                            <asp:Parameter Name="RatePax6" Type="Decimal" />
                            <asp:Parameter Name="RatePax7" Type="Decimal" />
                            <asp:Parameter Name="RatePax8" Type="Decimal" />
                            <asp:Parameter Name="RatePax9" Type="Decimal" />
                            <asp:Parameter Name="RatePax10" Type="Decimal" />
                            <asp:Parameter Name="LockChildrenRates" Type="Boolean" />
                            <asp:Parameter Name="RateChld1" Type="Decimal" />
                            <asp:Parameter Name="RateChld2" Type="Decimal" />
                            <asp:Parameter Name="RateChld3" Type="Decimal" />
                            <asp:Parameter Name="RateChld4" Type="Decimal" />
                            <asp:Parameter Name="RateExtra" Type="Int16" />
                            <asp:Parameter Name="Desctiption" Type="String" />
                            <asp:Parameter Name="Allotment" Type="Int16" />
                            <asp:Parameter Name="CutOff" Type="Int16" />
                            <asp:Parameter Name="CopyId" Type="Int32" />
                            <asp:Parameter Name="SpecialId" Type="Int32" />
                            <asp:Parameter Name="SpecialOnRateId" Type="Int64" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                </td>
                <td valign="top" class=" GridBorder">
                    <asp:DetailsView ID="dvContractRate" runat="server" Width="400px" AutoGenerateRows="False"
                        DataKeyNames="ContractRateID" DataSourceID="dsRateDetail" SkinID="skDetailView"
                        DefaultMode="Edit">
                        <CommandRowStyle HorizontalAlign="Right" />
                        <FieldHeaderStyle Width="120px" />
                        <Fields>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:Label ID="Label18" runat="server" SkinID="skGridLabel" Text='<%# Eval("RoomTypeId") & " ( " & Eval("MealPlanId") & " ) " & Eval("Start","{0:d}") & " - " & Eval("Finish","{0:d}") %>' />
                                    <div style="float: right; margin-top: 6px;">
                                        <asp:ImageButton ID="btnPrev" runat="server" CausesValidation="False" CommandName="Prev"
                                            ToolTip="Go to previous rate" ImageUrl="~/Images/left_all.png" BorderColor="White"
                                            BorderStyle="Dotted" BorderWidth="1" />&nbsp;
                                        <asp:ImageButton ID="btnNext" runat="server" CausesValidation="False" CommandName="Next"
                                            ToolTip="Go to next rate" ImageUrl="~/Images/right_all.png" BorderColor="White"
                                            BorderStyle="Dotted" BorderWidth="1" />&nbsp;
                                    </div>
                                </EditItemTemplate>
                                <ItemStyle CssClass="GridLabelBG" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PerPax" SortExpression="PerPax">
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox2" runat="server" Checked='<%# Bind("PerPax") %>' Enabled="false" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="cbPerPax" runat="server" CssClass="TextBox" Enabled='<%# Eval("IsConstrained") = False %>'
                                        SelectedValue='<%# Bind("PerPax") %>'>
                                        <asp:ListItem Value="False">PerRoom</asp:ListItem>
                                        <asp:ListItem Value="True">PerPax</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ContractRateID" HeaderText="ContractRateID" InsertVisible="False"
                                ReadOnly="True" SortExpression="ContractRateID" Visible="False" />
                            <asp:TemplateField HeaderText="RateOption" SortExpression="RateOption">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("RateOption") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlRateOption" runat="server" CssClass="TextBox" SelectedValue='<%# Bind("RateOption") %>'>
                                        <asp:ListItem Value="0">PerArrival</asp:ListItem>
                                        <asp:ListItem Value="1">PerStay</asp:ListItem>
                                        <asp:ListItem Value="2">Inclusiv</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("RateOption") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Single" SortExpression="RatePax1">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("RatePax1", "{0:N2}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("RatePax1", "{0:N2}") %>'></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox1"
                                        Display="None" ErrorMessage="Sum input" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator1_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator1">
                                    </asp:ValidatorCalloutExtender>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("RatePax1") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Double" SortExpression="RatePax2">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("RatePax2", "{0:N2}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("RatePax2", "{0:N2}") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("RatePax2") %>'></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="TextBox3"
                                        Display="None" ErrorMessage="Sum input" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator3_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator3">
                                    </asp:ValidatorCalloutExtender>
                                </InsertItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Triple" SortExpression="RatePax3">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("RatePax3", "{0:N2}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("RatePax3", "{0:N2}") %>'></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator31" runat="server" ControlToValidate="TextBox3"
                                        Display="None" ErrorMessage="Sum input" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator31_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator31">
                                    </asp:ValidatorCalloutExtender>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("RatePax3") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Quadruple" SortExpression="RatePax4">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("RatePax4", "{0:N2}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("RatePax4", "{0:N2}") %>'></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="TextBox4"
                                        Display="None" ErrorMessage="Sum input" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator4_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator4">
                                    </asp:ValidatorCalloutExtender>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("RatePax4") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Quintuple" SortExpression="RatePax5">
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("RatePax5", "{0:N2}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("RatePax5", "{0:N2}") %>'></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator5" runat="server" ControlToValidate="TextBox5"
                                        Display="None" ErrorMessage="Sum input" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator5_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator5">
                                    </asp:ValidatorCalloutExtender>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("RatePax5") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sextuple" SortExpression="RatePax6">
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("RatePax6", "{0:N2}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("RatePax6", "{0:N2}") %>'></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator6" runat="server" ControlToValidate="TextBox6"
                                        Display="None" ErrorMessage="Sum input" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator6_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator6">
                                    </asp:ValidatorCalloutExtender>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("RatePax6") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Septuple" SortExpression="RatePax7">
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("RatePax7", "{0:N2}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("RatePax7", "{0:N2}") %>'></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="TextBox7"
                                        Display="None" ErrorMessage="Sum input" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator7_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator7">
                                    </asp:ValidatorCalloutExtender>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("RatePax7") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Octuple" SortExpression="RatePax8">
                                <ItemTemplate>
                                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("RatePax8") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("RatePax8") %>'></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator8" runat="server" ControlToValidate="TextBox8"
                                        Display="None" ErrorMessage="Sum input" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator8_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator8">
                                    </asp:ValidatorCalloutExtender>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("RatePax8") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nonuple" SortExpression="RatePax9">
                                <ItemTemplate>
                                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("RatePax9", "{0:N2}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("RatePax9", "{0:N2}") %>'></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator9" runat="server" ControlToValidate="TextBox9"
                                        Display="None" ErrorMessage="Sum input" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator9_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator9">
                                    </asp:ValidatorCalloutExtender>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("RatePax9") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Decuple" SortExpression="RatePax10">
                                <ItemTemplate>
                                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("RatePax10", "{0:N2}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("RatePax10", "{0:N2}") %>'></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator10" runat="server" ControlToValidate="TextBox10"
                                        Display="None" ErrorMessage="Sum input" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator10_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator10">
                                    </asp:ValidatorCalloutExtender>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("RatePax10") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="RateExtra" SortExpression="RateExtra">
                                <ItemTemplate>
                                    <asp:Label ID="Label16" runat="server" Text='<%# Bind("RateExtra") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlRateExtra" runat="server" SelectedValue='<%# Bind("RateExtra") %>'
                                        AppendDataBoundItems="True">
                                        <asp:ListItem Value="10">Pax10</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("RateExtra") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="" Visible="false">
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("LockChildrenRates") %>'
                                        Text="Lock Children Rates" Enabled="false" TextAlign="Right" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:CheckBox ID="cbLock" runat="server" Checked='<%# Eval("LockChildrenRates") %>'
                                        AutoPostBack="True" OnCheckedChanged="cbLock_CheckedChanged" OnDataBinding="cbLock_DataBinding"
                                        Enabled="False" Text="Lock Children Rates" TextAlign="Right" />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("LockChildrenRates") %>'
                                        Text="Lock Children Rates" TextAlign="Right" />
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="RateChld1" SortExpression="RateChld1">
                                <ItemTemplate>
                                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("RateChld1", "{0:N2}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("RateChld1", "{0:N2}") %>'></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator11" runat="server" ControlToValidate="TextBox11"
                                        Display="None" ErrorMessage="Sum input" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator11_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator11">
                                    </asp:ValidatorCalloutExtender>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("RateChld1") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="RateChld2" SortExpression="RateChld2">
                                <ItemTemplate>
                                    <asp:Label ID="Label13" runat="server" Text='<%# Bind("RateChld2", "{0:N2}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("RateChld2", "{0:N2}") %>'></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator12" runat="server" ControlToValidate="TextBox12"
                                        Display="None" ErrorMessage="Sum input" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator12_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator12">
                                    </asp:ValidatorCalloutExtender>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("RateChld2") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="RateChld3" SortExpression="RateChld3">
                                <ItemTemplate>
                                    <asp:Label ID="Label14" runat="server" Text='<%# Bind("RateChld3", "{0:N2}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("RateChld3", "{0:N2}") %>'></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator13" runat="server" ControlToValidate="TextBox13"
                                        Display="None" ErrorMessage="Sum input" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator13_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator13">
                                    </asp:ValidatorCalloutExtender>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("RateChld3") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="RateChld4" SortExpression="RateChld4">
                                <ItemTemplate>
                                    <asp:Label ID="Label15" runat="server" Text='<%# Bind("RateChld4", "{0:N2}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("RateChld4", "{0:N2}") %>'></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator14" runat="server" ControlToValidate="TextBox14"
                                        Display="None" ErrorMessage="Sum input" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator14_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator14">
                                    </asp:ValidatorCalloutExtender>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox15" runat="server" Text='<%# Bind("RateChld4") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Desctiption" SortExpression="Desctiption">
                                <ItemTemplate>
                                    <asp:Label ID="Label17" runat="server" Text='<%# Bind("Desctiption") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("Desctiption") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox17" runat="server" Text='<%# Bind("Desctiption") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Allotment" SortExpression="Allotment">
                                <ItemTemplate>
                                    <asp:Label ID="lblAllotment" runat="server" Text='<%# Bind("Allotment") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtAllotment" runat="server" Text='<%# Bind("Allotment") %>' Width="80%"
                                        CssClass="TextBox"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator16" runat="server" ControlToValidate="txtAllotment"
                                        Display="None" ErrorMessage="Digit input" Operator="DataTypeCheck" Type="Integer">
                                    </asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator16_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator16">
                                    </asp:ValidatorCalloutExtender>
                                    <asp:LinkButton ID="btnCopyAllot" runat="server" Font-Bold="True" OnClick="btnCopyAllot_Click"
                                        ToolTip="Copy Allotment - same room - all periods">Copy</asp:LinkButton>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtAllotment" runat="server" Text='<%# Bind("Allotment") %>'></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="CutOff" SortExpression="CutOff">
                                <ItemTemplate>
                                    <asp:Label ID="lblCutOff" runat="server" Text='<%# Bind("CutOff") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCutOff" runat="server" Text='<%# Bind("CutOff") %>' Width="80%"
                                        CssClass="TextBox"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator17" runat="server" ControlToValidate="txtCutOff"
                                        Display="None" ErrorMessage="Digit input" Operator="DataTypeCheck" Type="Integer">
                                    </asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator17_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator17">
                                    </asp:ValidatorCalloutExtender>
                                    <asp:LinkButton ID="btnCopyCutOff" runat="server" Font-Bold="True" OnClick="btnCopyCutOff_Click"
                                        ToolTip="Copy CuttOff - all rooms - same period"> Copy</asp:LinkButton>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtCutOff" runat="server" Text='<%# Bind("CutOff") %>'></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="HotelId" HeaderText="HotelId" SortExpression="HotelId"
                                Visible="False" ReadOnly="True" />
                            <asp:BoundField DataField="MealPlanId" HeaderText="MealPlanId" SortExpression="MealPlanId"
                                Visible="False" ReadOnly="True" />
                            <asp:BoundField DataField="ContractId" HeaderText="ContractId" SortExpression="ContractId"
                                Visible="False" ReadOnly="True" />
                            <asp:TemplateField HeaderText="RoomTypeId" SortExpression="RoomTypeId" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblRoomTID" runat="server" Text='<%# Bind("RoomTypeId") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="lblRoomTID" runat="server" Text='<%# Bind("RoomTypeId") %>'></asp:Label>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:Label ID="lblRoomTID" runat="server" Text='<%# Bind("RoomTypeId") %>'></asp:Label>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="CtrPeriodId" SortExpression="CtrPeriodId" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblPeriodId" runat="server" Text='<%# Eval("CtrPeriodId") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="lblPeriodId" runat="server" Text='<%# Eval("CtrPeriodId") %>'></asp:Label>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:Label ID="lblPeriodId" runat="server" Text='<%# Eval("CtrPeriodId") %>'></asp:Label>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="RateCodeId" HeaderText="RateCodeId" ReadOnly="True" SortExpression="RateCodeId"
                                Visible="False" />
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <div style="float: left; margin-top: 6px;">
                                        <asp:ImageButton ID="btnPrev1" runat="server" CausesValidation="False" CommandName="Prev"
                                            ToolTip="Go to previous rate" ImageUrl="~/Images/left_all.png" BorderColor="Black"
                                            BorderStyle="Dotted" BorderWidth="1" />&nbsp;
                                        <asp:ImageButton ID="btnNext1" runat="server" CausesValidation="False" CommandName="Next"
                                            ToolTip="Go to next rate" ImageUrl="~/Images/right_all.png" BorderColor="Black"
                                            BorderStyle="Dotted" BorderWidth="1" />&nbsp;
                                    </div>
                                    <div style="text-align: right; margin-top: 5px; height: 30px">
                                        <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update"
                                            SkinID="skBtnBase" Text="Update" />
                                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel"
                                            SkinID="skBtnBase" Text="Cancel" />
                                    </div>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <%--<asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <table style="width: 100%;">
                                        <tr>
                                            <td align="left" width="30px">
                                                <asp:Button ID="btnPrev" runat="server" CausesValidation="False" CommandName="Prev"
                                                    SkinID="skBtnBase" Text="&lt;&lt; Prev " ToolTip="Go to previous rate" />
                                            </td>
                                            <td align="center">
                                                <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update"
                                                    SkinID="skBtnBase" Text="Update" />
                                                &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel"
                                                    SkinID="skBtnBase" Text="Cancel" />
                                            </td>
                                            <td align="right" valign="top" width="30px">
                                                <asp:Button ID="btnNext" runat="server" CausesValidation="False" CommandName="Next"
                                                    SkinID="skBtnBase" Text="Next &gt;&gt;" ToolTip="Go to next rate" />
                                            </td>
                                        </tr>
                                    </table>
                                </EditItemTemplate>
                            </asp:TemplateField>--%>
                        </Fields>
                    </asp:DetailsView>
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="dummy" runat="server" />
        <asp:CheckBox ID="cbActivate" runat="server" Checked="True" Text="Activate Special On Finish" />
        <asp:ObjectDataSource ID="dsRateDetail" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByCntRateID"
            TypeName="dsSpecialTableAdapters.ContractRateTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_ContractRateID" Type="Int64" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="gvRates" Name="ContractId" PropertyName="SelectedDataKey(8)"
                    Type="Int32" />
                <asp:ControlParameter ControlID="gvRates" Name="HotelId" PropertyName="SelectedDataKey(1)"
                    Type="Int32" />
                <asp:ControlParameter ControlID="gvRates" Name="RateCodeId" PropertyName="SelectedDataKey(2)"
                    Type="String" />
                <asp:ControlParameter ControlID="gvRates" Name="MealPlanId" PropertyName="SelectedDataKey(4)"
                    Type="String" />
                <asp:ControlParameter ControlID="gvRates" Name="RoomTypeId" PropertyName="SelectedDataKey(3)"
                    Type="String" />
                <asp:ControlParameter ControlID="gvRates" Name="Start" PropertyName="SelectedDataKey(6)"
                    Type="DateTime" />
                <asp:ControlParameter ControlID="gvRates" Name="Finish" PropertyName="SelectedDataKey(7)"
                    Type="DateTime" />
                <asp:Parameter Name="PerPax" Type="Boolean" />
                <asp:Parameter Name="RateOption" Type="Int16" />
                <asp:Parameter Name="RatePax1" Type="Decimal" />
                <asp:Parameter Name="RatePax2" Type="Decimal" />
                <asp:Parameter Name="RatePax3" Type="Decimal" />
                <asp:Parameter Name="RatePax4" Type="Decimal" />
                <asp:Parameter Name="RatePax5" Type="Decimal" />
                <asp:Parameter Name="RatePax6" Type="Decimal" />
                <asp:Parameter Name="RatePax7" Type="Decimal" />
                <asp:Parameter Name="RatePax8" Type="Decimal" />
                <asp:Parameter Name="RatePax9" Type="Decimal" />
                <asp:Parameter Name="RatePax10" Type="Decimal" />
                <asp:Parameter Name="LockChildrenRates" Type="Boolean" DefaultValue="False" />
                <asp:Parameter Name="RateChld1" Type="Decimal" />
                <asp:Parameter Name="RateChld2" Type="Decimal" />
                <asp:Parameter Name="RateChld3" Type="Decimal" />
                <asp:Parameter Name="RateChld4" Type="Decimal" />
                <asp:Parameter Name="RateExtra" Type="Int16" />
                <asp:Parameter Name="Desctiption" Type="String" />
                <asp:Parameter Name="Allotment" Type="Int16" />
                <asp:Parameter Name="CutOff" Type="Int16" />
                <asp:Parameter Name="CopyId" Type="Int32" />
                <asp:QueryStringParameter Name="SpecialId" QueryStringField="SpecialID" Type="Int32" />
                <asp:Parameter Name="Original_ContractRateID" Type="Int64" />
            </UpdateParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="gvRates" Name="ContractRateID" PropertyName="SelectedValue"
                    Type="Int64" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="ContractId" Type="Int32" />
                <asp:Parameter Name="HotelId" Type="Int32" />
                <asp:Parameter Name="RateCodeId" Type="String" />
                <asp:Parameter Name="MealPlanId" Type="String" />
                <asp:Parameter Name="RoomTypeId" Type="String" />
                <asp:Parameter Name="CtrPeriodId" Type="Int32" />
                <asp:Parameter Name="Start" Type="DateTime" />
                <asp:Parameter Name="Finish" Type="DateTime" />
                <asp:Parameter Name="PerPax" Type="Boolean" />
                <asp:Parameter Name="RateOption" Type="Int16" />
                <asp:Parameter Name="RatePax1" Type="Decimal" />
                <asp:Parameter Name="RatePax2" Type="Decimal" />
                <asp:Parameter Name="RatePax3" Type="Decimal" />
                <asp:Parameter Name="RatePax4" Type="Decimal" />
                <asp:Parameter Name="RatePax5" Type="Decimal" />
                <asp:Parameter Name="RatePax6" Type="Decimal" />
                <asp:Parameter Name="RatePax7" Type="Decimal" />
                <asp:Parameter Name="RatePax8" Type="Decimal" />
                <asp:Parameter Name="RatePax9" Type="Decimal" />
                <asp:Parameter Name="RatePax10" Type="Decimal" />
                <asp:Parameter Name="LockChildrenRates" Type="Boolean" />
                <asp:Parameter Name="RateChld1" Type="Decimal" />
                <asp:Parameter Name="RateChld2" Type="Decimal" />
                <asp:Parameter Name="RateChld3" Type="Decimal" />
                <asp:Parameter Name="RateChld4" Type="Decimal" />
                <asp:Parameter Name="RateExtra" Type="Int16" />
                <asp:Parameter Name="Desctiption" Type="String" />
                <asp:Parameter Name="Allotment" Type="Int16" />
                <asp:Parameter Name="CutOff" Type="Int16" />
                <asp:Parameter Name="CopyId" Type="Int32" />
                <asp:Parameter Name="SpecialId" Type="Int32" />
                <asp:Parameter Name="SpecialOnRateId" Type="Int64" />
            </InsertParameters>
        </asp:ObjectDataSource>
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

