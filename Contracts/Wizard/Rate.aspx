<%@ Page Title="" Language="VB" MasterPageFile="~/Contracts/Wizard/masterWizard.master"
    AutoEventWireup="false" CodeFile="Rate.aspx.vb" Inherits="Contracts_Wizard_Rate" %>
<%@ MasterType VirtualPath="~/Contracts/Wizard/masterWizard.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Edit Rate
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="WizardContent" runat="Server">
    <div class="Red" style="height: 100%">
        <table>
            <tr>
                <td class=" GridBorder" valign="top">
                    <asp:GridView ID="gvRates" runat="server" AutoGenerateColumns="False" DataKeyNames="ContractRateID,HotelId,RateCodeId,RoomTypeId,MealPlanId,CtrPeriodId,Start,Finish"
                        DataSourceID="dsContractRate" SkinID="skGridView" SelectedIndex="0">
                        <Columns>
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" ShowSelectButton="True">
                                <ItemStyle Width="25px" />
                            </asp:CommandField>
                            <asp:BoundField DataField="ContractRateID" HeaderText="ContractRateID" InsertVisible="False"
                                ReadOnly="True" SortExpression="ContractRateID" Visible="False" />
                            <asp:BoundField DataField="ContractId" HeaderText="ContractId" SortExpression="ContractId"
                                Visible="False" />
                            <asp:BoundField DataField="HotelId" HeaderText="HotelId" SortExpression="HotelId"
                                Visible="False" />
                            <asp:BoundField DataField="RoomTypeId" HeaderText="Room" SortExpression="RoomTypeId">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="50px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="RateCodeId" HeaderText="Rate Code" SortExpression="RateCodeId">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MealPlanId" HeaderText="MP" SortExpression="MealPlanId">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="50px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CtrPeriodId" HeaderText="CtrPeriodId" SortExpression="CtrPeriodId"
                                Visible="False" />
                            <asp:BoundField DataField="Start" DataFormatString="{0:d}" HeaderText="Start" HtmlEncode="False"
                                SortExpression="Start">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Finish" DataFormatString="{0:d}" HeaderText="End" HtmlEncode="False"
                                SortExpression="Finish">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div style="padding-top: 12px;">
                            <asp:Image ID="Image1" runat="server" CssClass="ImgButton" ImageUrl="~/Images/warning.png" />
                            </div>
                        </EmptyDataTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:GridView>
                </td>
                <td valign="top" class=" GridBorder" style="width: 406px">
                    <asp:DetailsView ID="dvContractRate" runat="server" Width="400px" AutoGenerateRows="False"
                        DataKeyNames="ContractRateID" DataSourceID="dsRateDetail" SkinID="skDetailView"
                        DefaultMode="Edit">
                        <CommandRowStyle HorizontalAlign="Right" />
                        <FieldHeaderStyle Width="120px" />
                        <Fields>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:Label ID="lblRoomType" runat="server" Text='<%# Eval("RoomType") %>' style="padding-left: 30px; font-size: 11pt; font-weight:bold;" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblRoomType" runat="server" Text='<%# Eval("RoomType") %>' style="padding-left: 30px; font-size: 11pt; font-weight:bold;" />
                                </ItemTemplate>
                                <ItemStyle CssClass="GridRowClear" />
                            </asp:TemplateField>
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
                                    </div> <br />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label18" runat="server" SkinID="skGridLabel" Text='<%# Eval("RoomTypeId") & " ( " & Eval("MealPlanId") & " ) " & Eval("Start","{0:d}") & " - " & Eval("Finish","{0:d}") %>' />
                                </ItemTemplate>
                                <ItemStyle CssClass="GridLabelBG" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Per" SortExpression="RateOption">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddlPerPax" runat="server" CssClass="TextBox" 
                                        Enabled="false" SelectedValue='<%# Bind("PerPax") %>'>
                                        <asp:ListItem Value="True">PerPax</asp:ListItem>
                                        <asp:ListItem Value="False">PerRoom</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlPerPax" runat="server" CssClass="TextBox" Enabled="false" SelectedValue='<%# Bind("PerPax") %>'>
                                        <asp:ListItem Value="True">PerPax</asp:ListItem>
                                        <asp:ListItem Value="False">PerRoom</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="ContractRateID" HeaderText="ContractRateID" InsertVisible="False"
                                ReadOnly="True" SortExpression="ContractRateID" Visible="False" />
                            <asp:TemplateField HeaderText="RateOption" SortExpression="RateOption">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlRateOption" runat="server" CssClass="TextBox" SelectedValue='<%# Bind("RateOption") %>'>
                                        <asp:ListItem Value="1">PerStay</asp:ListItem>
                                        <asp:ListItem Value="0">PerArrival</asp:ListItem>
                                        <asp:ListItem Value="2">Inclusiv</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddlRateOption" runat="server" CssClass="TextBox" 
                                        Enabled="False" SelectedValue='<%# Bind("RateOption") %>'>
                                        <asp:ListItem Value="1">PerStay</asp:ListItem>
                                        <asp:ListItem Value="0">PerArrival</asp:ListItem>
                                        <asp:ListItem Value="2">Inclusiv</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Single" SortExpression="RatePax1">
                                <ItemTemplate>
                                    <asp:TextBox ID="Label2" runat="server" Text='<%# Eval("RatePax1", "{0:F2}") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("RatePax1", "{0:F2}") %>'></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox1"
                                        Display="None" ErrorMessage="Decimal number required (without digit separator)." Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator1_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator1">
                                    </asp:ValidatorCalloutExtender>
                                </EditItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Double" SortExpression="RatePax2">
                                <ItemTemplate>
                                    <asp:TextBox ID="Label3" runat="server" Text='<%# Eval("RatePax2", "{0:F2}") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("RatePax2", "{0:F2}") %>'></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="TextBox3"
                                        Display="None" ErrorMessage="Decimal number required (without digit separator)." Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator3_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator3">
                                    </asp:ValidatorCalloutExtender>
                                </EditItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Triple" SortExpression="RatePax3">
                                <ItemTemplate>
                                    <asp:TextBox ID="Label4" runat="server" Text='<%# Eval("RatePax3", "{0:F2}") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox31" runat="server" Text='<%# Bind("RatePax3", "{0:F2}") %>'></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator31" runat="server" ControlToValidate="TextBox31"
                                        Display="None" ErrorMessage="Decimal number required (without digit separator)." Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator31_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator31">
                                    </asp:ValidatorCalloutExtender>
                                </EditItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Quadruple" SortExpression="RatePax4">
                                <ItemTemplate>
                                    <asp:TextBox ID="Label5" runat="server" Text='<%# Eval("RatePax4", "{0:F2}") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("RatePax4", "{0:F2}") %>'></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="TextBox4"
                                        Display="None" ErrorMessage="Decimal number required (without digit separator)." Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator4_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator4">
                                    </asp:ValidatorCalloutExtender>
                                </EditItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Quintuple" SortExpression="RatePax5">
                                <ItemTemplate>
                                    <asp:TextBox ID="Label6" runat="server" Text='<%# Eval("RatePax5", "{0:F2}") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("RatePax5", "{0:F2}") %>'></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator5" runat="server" ControlToValidate="TextBox5"
                                        Display="None" ErrorMessage="Decimal number required (without digit separator)." Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator5_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator5">
                                    </asp:ValidatorCalloutExtender>
                                </EditItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sextuple" SortExpression="RatePax6">
                                <ItemTemplate>
                                    <asp:TextBox ID="Label7" runat="server" Text='<%# Eval("RatePax6", "{0:F2}") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("RatePax6", "{0:F2}") %>'></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator6" runat="server" ControlToValidate="TextBox6"
                                        Display="None" ErrorMessage="Decimal number required (without digit separator)." Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator6_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator6">
                                    </asp:ValidatorCalloutExtender>
                                </EditItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Septuple" SortExpression="RatePax7">
                                <ItemTemplate>
                                    <asp:TextBox ID="Label8" runat="server" Text='<%# Eval("RatePax7", "{0:F2}") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("RatePax7", "{0:F2}") %>'></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="TextBox7"
                                        Display="None" ErrorMessage="Decimal number required (without digit separator)." Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator7_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator7">
                                    </asp:ValidatorCalloutExtender>
                                </EditItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Octuple" SortExpression="RatePax8">
                                <ItemTemplate>
                                    <asp:TextBox ID="Label9" runat="server" Text='<%# Eval("RatePax8", "{0:F2}") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("RatePax8", "{0:F2}") %>'></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator8" runat="server" ControlToValidate="TextBox8"
                                        Display="None" ErrorMessage="Decimal number required (without digit separator)." Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator8_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator8">
                                    </asp:ValidatorCalloutExtender>
                                </EditItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nonuple" SortExpression="RatePax9">
                                <ItemTemplate>
                                    <asp:TextBox ID="Label10" runat="server" Text='<%# Eval("RatePax9", "{0:F2}") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("RatePax9", "{0:F2}") %>'></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator9" runat="server" ControlToValidate="TextBox9"
                                        Display="None" ErrorMessage="Decimal number required (without digit separator)." Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator9_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator9">
                                    </asp:ValidatorCalloutExtender>
                                </EditItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Decuple" SortExpression="RatePax10">
                                <ItemTemplate>
                                    <asp:TextBox ID="Label11" runat="server" Text='<%# Eval("RatePax10", "{0:F2}") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("RatePax10", "{0:F2}") %>'></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator10" runat="server" ControlToValidate="TextBox10"
                                        Display="None" ErrorMessage="Decimal number required (without digit separator)." Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator10_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator10">
                                    </asp:ValidatorCalloutExtender>
                                </EditItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Use as Extra Rate" SortExpression="RateExtra">
                                <ItemTemplate>
                                    <%--<asp:Label ID="Label16" runat="server" Text='<%# Eval("RateExtra") %>' />--%>
                                    <asp:DropDownList ID="Label16" runat="server" Enabled="false"
                                        SelectedValue='<%# Eval("RateExtra") %>' CssClass="TextBox">
                                        <asp:ListItem Value="10">No Extra Rate</asp:ListItem>
                                        <asp:ListItem Value="9">Nonuple</asp:ListItem>
                                        <asp:ListItem Value="8">Octuple</asp:ListItem>
                                        <asp:ListItem Value="7">Setuple</asp:ListItem>
                                        <asp:ListItem Value="6">Sextuple</asp:ListItem>
                                        <asp:ListItem Value="5">Quintuple</asp:ListItem>
                                        <asp:ListItem Value="4">Quadriple</asp:ListItem>
                                        <asp:ListItem Value="3">Triple</asp:ListItem>
                                        <asp:ListItem Value="2">Double</asp:ListItem>
                                        <asp:ListItem Value="1">Single</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlRateExtra" runat="server" 
                                        SelectedValue='<%# Bind("RateExtra") %>' CssClass="TextBox">
                                        <asp:ListItem Value="10">No Extra Rate</asp:ListItem>
                                        <asp:ListItem Value="9">Nonuple</asp:ListItem>
                                        <asp:ListItem Value="8">Octuple</asp:ListItem>
                                        <asp:ListItem Value="7">Setuple</asp:ListItem>
                                        <asp:ListItem Value="6">Sextuple</asp:ListItem>
                                        <asp:ListItem Value="5">Quintuple</asp:ListItem>
                                        <asp:ListItem Value="4">Quadriple</asp:ListItem>
                                        <asp:ListItem Value="3">Triple</asp:ListItem>
                                        <asp:ListItem Value="2">Double</asp:ListItem>
                                        <asp:ListItem Value="1">Single</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbLock" runat="server" Checked='<%# Eval("LockChildrenRates") %>'
                                        Text="Lock Children Rates" Enabled="False" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:CheckBox ID="cbLock" runat="server" Checked='<%# Bind("LockChildrenRates") %>'
                                        AutoPostBack="True" OnCheckedChanged="cbLock_CheckedChanged" OnDataBinding="cbLock_DataBinding"
                                        Text="Lock Children Rates" TextAlign="Right" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="RateChld1" SortExpression="RateChld1">
                                <ItemTemplate>
                                    <asp:TextBox ID="Label12" runat="server" Text='<%# Eval("RateChld1", "{0:F2}") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("RateChld1", "{0:F2}") %>' />
                                    <asp:CompareValidator ID="CompareValidator11" runat="server" ControlToValidate="TextBox11"
                                        Display="None" ErrorMessage="Decimal number required (without digit separator)." Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator11_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator11">
                                    </asp:ValidatorCalloutExtender>
                                </EditItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="RateChld2" SortExpression="RateChld2">
                                <ItemTemplate>
                                    <asp:TextBox ID="Label13" runat="server" Text='<%# Bind("RateChld2", "{0:F2}") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("RateChld2", "{0:F2}") %>'></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator12" runat="server" ControlToValidate="TextBox12"
                                        Display="None" ErrorMessage="Decimal number required (without digit separator)." Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator12_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator12">
                                    </asp:ValidatorCalloutExtender>
                                </EditItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="RateChld3" SortExpression="RateChld3">
                                <ItemTemplate>
                                    <asp:TextBox ID="Label14" runat="server" Text='<%# Eval("RateChld3", "{0:F2}") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("RateChld3", "{0:F2}") %>'></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator13" runat="server" ControlToValidate="TextBox13"
                                        Display="None" ErrorMessage="Decimal number required (without digit separator)." Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator13_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator13">
                                    </asp:ValidatorCalloutExtender>
                                </EditItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="RateChld4" SortExpression="RateChld4">
                                <ItemTemplate>
                                    <asp:TextBox ID="Label15" runat="server" Text='<%# Eval("RateChld4", "{0:F2}") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("RateChld4", "{0:F2}") %>'></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator14" runat="server" ControlToValidate="TextBox14"
                                        Display="None" ErrorMessage="Decimal number required (without digit separator)." Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator14_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator14">
                                    </asp:ValidatorCalloutExtender>
                                </EditItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Desctiption" SortExpression="Desctiption">
                                <ItemTemplate>
                                    <asp:TextBox ID="Label17" runat="server" Text='<%# Eval("Desctiption") %>'  />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("Desctiption") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Allotment" SortExpression="Allotment">
                                <ItemTemplate>
                                    <asp:TextBox ID="lblAllotment" runat="server" Text='<%# Eval("Allotment") %>' CssClass="TextBox" />
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
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="CutOff" SortExpression="CutOff">
                                <ItemTemplate>
                                    <asp:TextBox ID="lblCutOff" runat="server" Text='<%# Eval("CutOff") %>' CssClass="TextBox" />
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
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="CtrPeriodId" SortExpression="CtrPeriodId" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblPeriodId" runat="server" Text='<%# Eval("CtrPeriodId") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="lblPeriodId" runat="server" Text='<%# Eval("CtrPeriodId") %>'></asp:Label>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="RateCodeId" HeaderText="RateCodeId" ReadOnly="True" SortExpression="RateCodeId"
                                Visible="False" />
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <%--<div style="text-align: right; margin-top: 5px; height: 30px">
                                        <asp:Button ID="Button1" runat="server" CausesValidation="True" 
                                            CommandName="EditRate" SkinID="skBtnBase" Text="Edit Rates" />
                                        &nbsp;</div>--%>
                                </ItemTemplate>
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
                        </Fields>
                        <EmptyDataTemplate>
                            <b>Contract rates not generated.<br />
                            Go back to Manage Rates page.</b>
                        </EmptyDataTemplate>
                    </asp:DetailsView>

                    <asp:DetailsView ID="dvContractRateMD" runat="server" Width="400px" AutoGenerateRows="False"
                        DataKeyNames="ContractRateID" DataSourceID="dsRateDetailMD" SkinID="skDetailView">
                        <CommandRowStyle HorizontalAlign="Right" />
                        <FieldHeaderStyle Width="120px" />
                        <Fields>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblRoomType" runat="server" Text='<%# Eval("RoomType") %>' style="padding-left: 30px; font-size: 11pt; font-weight:bold;" />
                                </ItemTemplate>
                                <ItemStyle CssClass="GridRowClear" />
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:Label ID="Label18" runat="server" SkinID="skGridLabel" Text='<%# Eval("RoomTypeId") & " ( " & Eval("MealPlanId") & " ) " & Eval("Start","{0:d}") & " - " & Eval("Finish","{0:d}") %>' />
                                </ItemTemplate>
                                <ItemStyle CssClass="GridLabelBG" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Per" SortExpression="RateOption">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddlPerPax" runat="server" CssClass="TextBox" 
                                        Enabled="false" SelectedValue='<%# Eval("PerPax") %>'>
                                        <asp:ListItem Value="True">PerPax</asp:ListItem>
                                        <asp:ListItem Value="False">PerRoom</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="ContractRateID" HeaderText="ContractRateID" InsertVisible="False" ReadOnly="True" SortExpression="ContractRateID" Visible="False" />
                            <asp:TemplateField HeaderText="RateOption" SortExpression="RateOption">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddlRateOption" runat="server" CssClass="TextBox" 
                                        Enabled="False" SelectedValue='<%# Eval("RateOption") %>'>
                                        <asp:ListItem Value="1">PerStay</asp:ListItem>
                                        <asp:ListItem Value="0">PerArrival</asp:ListItem>
                                        <asp:ListItem Value="2">Inclusiv</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Single" SortExpression="RatePax1">
                                <ItemTemplate>
                                    <asp:TextBox ID="Label2" runat="server" Text='<%# Eval("RatePax1", "{0:F2}") %>' Enabled="false" />
                                </ItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Double" SortExpression="RatePax2">
                                <ItemTemplate>
                                    <asp:TextBox ID="Label3" runat="server" Text='<%# Eval("RatePax2", "{0:F2}") %>' Enabled="false" />
                                </ItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Triple" SortExpression="RatePax3">
                                <ItemTemplate>
                                    <asp:TextBox ID="Label4" runat="server" Text='<%# Eval("RatePax3", "{0:F2}") %>' Enabled="false" />
                                </ItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Quadruple" SortExpression="RatePax4">
                                <ItemTemplate>
                                    <asp:TextBox ID="Label5" runat="server" Text='<%# Eval("RatePax4", "{0:F2}") %>' Enabled="false" />
                                </ItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Quintuple" SortExpression="RatePax5">
                                <ItemTemplate>
                                    <asp:TextBox ID="Label6" runat="server" Text='<%# Eval("RatePax5", "{0:F2}") %>' Enabled="false" />
                                </ItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sextuple" SortExpression="RatePax6">
                                <ItemTemplate>
                                    <asp:TextBox ID="Label7" runat="server" Text='<%# Eval("RatePax6", "{0:F2}") %>' Enabled="false" />
                                </ItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Septuple" SortExpression="RatePax7">
                                <ItemTemplate>
                                    <asp:TextBox ID="Label8" runat="server" Text='<%# Eval("RatePax7", "{0:F2}") %>' Enabled="false" />
                                </ItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Octuple" SortExpression="RatePax8">
                                <ItemTemplate>
                                    <asp:TextBox ID="Label9" runat="server" Text='<%# Eval("RatePax8", "{0:F2}") %>' Enabled="false" />
                                </ItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nonuple" SortExpression="RatePax9">
                                <ItemTemplate>
                                    <asp:TextBox ID="Label10" runat="server" Text='<%# Eval("RatePax9", "{0:F2}") %>' Enabled="false" />
                                </ItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Decuple" SortExpression="RatePax10">
                                <ItemTemplate>
                                    <asp:TextBox ID="Label11" runat="server" Text='<%# Eval("RatePax10", "{0:F2}") %>' Enabled="false" />
                                </ItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Use as Extra Rate" SortExpression="RateExtra">
                                <ItemTemplate>
                                    <asp:DropDownList ID="Label16" runat="server" Enabled="false"
                                        SelectedValue='<%# Eval("RateExtra") %>' CssClass="TextBox">
                                        <asp:ListItem Value="10">No Extra Rate</asp:ListItem>
                                        <asp:ListItem Value="9">Nonuple</asp:ListItem>
                                        <asp:ListItem Value="8">Octuple</asp:ListItem>
                                        <asp:ListItem Value="7">Setuple</asp:ListItem>
                                        <asp:ListItem Value="6">Sextuple</asp:ListItem>
                                        <asp:ListItem Value="5">Quintuple</asp:ListItem>
                                        <asp:ListItem Value="4">Quadriple</asp:ListItem>
                                        <asp:ListItem Value="3">Triple</asp:ListItem>
                                        <asp:ListItem Value="2">Double</asp:ListItem>
                                        <asp:ListItem Value="1">Single</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbLock" runat="server" Checked='<%# Eval("LockChildrenRates") %>'
                                        Text="Lock Children Rates" Enabled="False" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="RateChld1" SortExpression="RateChld1">
                                <ItemTemplate>
                                    <asp:TextBox ID="Label12" runat="server" Text='<%# Eval("RateChld1", "{0:F2}") %>' Enabled="false" />
                                </ItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="RateChld2" SortExpression="RateChld2">
                                <ItemTemplate>
                                    <asp:TextBox ID="Label13" runat="server" Text='<%# Eval("RateChld2", "{0:F2}") %>' Enabled="false" />
                                </ItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="RateChld3" SortExpression="RateChld3">
                                <ItemTemplate>
                                    <asp:TextBox ID="Label14" runat="server" Text='<%# Eval("RateChld3", "{0:F2}") %>' Enabled="false" />
                                </ItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="RateChld4" SortExpression="RateChld4">
                                <ItemTemplate>
                                    <asp:TextBox ID="Label15" runat="server" Text='<%# Eval("RateChld4", "{0:F2}") %>' Enabled="false" />
                                </ItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Desctiption" SortExpression="Desctiption">
                                <ItemTemplate>
                                    <asp:TextBox ID="Label17" runat="server" Text='<%# Eval("Desctiption") %>' Enabled="false" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox16" runat="server" Text='<%# Bind("Desctiption") %>' />
                                </EditItemTemplate>
                                <ControlStyle CssClass="TextBox" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Allotment" SortExpression="Allotment">
                                <ItemTemplate>
                                    <asp:TextBox ID="lblAllotment" runat="server" Text='<%# Eval("Allotment") %>' Enabled="false" CssClass="TextBox" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtAllotment" runat="server" Text='<%# Bind("Allotment") %>' Width="80%" CssClass="TextBox" />
                                    <asp:CompareValidator ID="CompareValidator16" runat="server" ControlToValidate="txtAllotment"
                                        Display="None" ErrorMessage="Digit input" Operator="DataTypeCheck" Type="Integer">
                                    </asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator16_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator16">
                                    </asp:ValidatorCalloutExtender>
                                    <asp:LinkButton ID="btnCopyAllot" runat="server" Font-Bold="True" OnClick="btnCopyAllot_Click"
                                        ToolTip="Copy Allotment - same room - all periods">Copy</asp:LinkButton>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="CutOff" SortExpression="CutOff">
                                <ItemTemplate>
                                    <asp:TextBox ID="lblCutOff" runat="server" Text='<%# Eval("CutOff") %>' Enabled="false" CssClass="TextBox" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCutOff" runat="server" Text='<%# Bind("CutOff") %>' Width="80%" CssClass="TextBox" />
                                    <asp:CompareValidator ID="CompareValidator17" runat="server" ControlToValidate="txtCutOff"
                                        Display="None" ErrorMessage="Digit input" Operator="DataTypeCheck" Type="Integer">
                                    </asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator17_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator17">
                                    </asp:ValidatorCalloutExtender>
                                    <asp:LinkButton ID="btnCopyCutOff" runat="server" Font-Bold="True" OnClick="btnCopyCutOff_Click"
                                        ToolTip="Copy CuttOff - all rooms - same period"> Copy</asp:LinkButton>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="HotelId" HeaderText="HotelId" SortExpression="HotelId" Visible="False" ReadOnly="True" />
                            <asp:BoundField DataField="MealPlanId" HeaderText="MealPlanId" SortExpression="MealPlanId" Visible="False" ReadOnly="True" />
                            <asp:BoundField DataField="ContractId" HeaderText="ContractId" SortExpression="ContractId" Visible="False" ReadOnly="True" />
                            <asp:BoundField DataField="RoomTypeId" HeaderText="RoomTypeId" SortExpression="RoomTypeId" Visible="False" ReadOnly="True" />
                            <asp:BoundField DataField="CtrPeriodId" HeaderText="CtrPeriodId" SortExpression="CtrPeriodId" Visible="False" ReadOnly="True" />
                            <asp:BoundField DataField="RateCodeId" HeaderText="RateCodeId" ReadOnly="True" SortExpression="RateCodeId" Visible="False" />
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <div style="text-align: right; margin-top: 5px; height: 30px">
                                        <asp:Button ID="Button1" runat="server" CausesValidation="True" 
                                            CommandName="Edit" SkinID="skBtnBase" Text="Modify Rate" />
                                        &nbsp;</div>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <div style="text-align: right; margin-top: 5px; height: 30px">
                                        <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update"
                                            SkinID="skBtnBase" Text="Modify" />
                                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel"
                                            SkinID="skBtnBase" Text="Cancel" />
                                    </div>
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Fields>
                        <EmptyDataTemplate>
                            <b>Contract rates not generated.<br />
                            Go back to Manage Rates page.</b>
                        </EmptyDataTemplate>
                    </asp:DetailsView>
                </td>
                
            </tr>
        </table>
        <asp:ObjectDataSource ID="dsContractRate" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByCntID" TypeName="ContractsTableAdapters.ContractRateTableAdapter"
            UpdateMethod="Update">
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
                <asp:Parameter Name="Original_ContractRateID" Type="Int64" />
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
            </InsertParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsRateDetail" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByRateID"
            TypeName="ContractsTableAdapters.ContractRateTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_ContractRateID" Type="Int64" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:QueryStringParameter Name="ContractId" QueryStringField="ContractID" Type="Int32" />
                <asp:ControlParameter ControlID="gvRates" Name="HotelId" PropertyName="SelectedDataKey(1)" Type="Int32" />
                <asp:ControlParameter ControlID="gvRates" Name="RateCodeId" PropertyName="SelectedDataKey(2)" Type="String" />
                <asp:ControlParameter ControlID="gvRates" Name="MealPlanId" PropertyName="SelectedDataKey(4)" Type="String" />
                <asp:ControlParameter ControlID="gvRates" Name="RoomTypeId" PropertyName="SelectedDataKey(3)" Type="String" />
                <asp:ControlParameter ControlID="gvRates" Name="CtrPeriodId" PropertyName="SelectedDataKey(5)" Type="Int32" />
                <asp:ControlParameter ControlID="gvRates" Name="Start" PropertyName="SelectedDataKey(6)" Type="DateTime" />
                <asp:ControlParameter ControlID="gvRates" Name="Finish" PropertyName="SelectedDataKey(7)" Type="DateTime" />
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
                <asp:Parameter Name="Original_ContractRateID" Type="Int64" />
            </UpdateParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="gvRates" Name="ContractRateID" PropertyName="SelectedValue" Type="Int64" />
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
            </InsertParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsRateDetailMD" runat="server"
            OldValuesParameterFormatString="{0}" SelectMethod="GetDataByRateID"
            TypeName="ContractsTableAdapters.ContractRateTableAdapter" 
            UpdateMethod="ContractRateModify">
            <UpdateParameters>
                <asp:Parameter Name="ContractRateID" Type="Int64" />
                <asp:Parameter Name="Desctiption" Type="String" />
                <asp:Parameter Name="Allotment" Type="Int16" />
                <asp:Parameter Name="CutOff" Type="Int16" />
                <asp:Parameter Name="UserName" Type="String" />
            </UpdateParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="gvRates" Name="ContractRateID" PropertyName="SelectedValue" Type="Int64" />
            </SelectParameters>
        </asp:ObjectDataSource>
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
                        <p style="text-align: right;" class="GridRowClear">
                            <br />
                            <asp:Button ID="btnNo" runat="server" Text="OK" SkinID="skBtnBase" CommandName="Cancel" />&nbsp;
                        </p>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
</asp:Content>
