<%@ Page Language="VB" MasterPageFile="~/Contracts/Supplements/masterSupplement.master"
    AutoEventWireup="false" EnableEventValidation="false" CodeFile="Detail.aspx.vb"
    Inherits="Contracts_Supplements_Detail" %>

<%@ MasterType VirtualPath="~/Contracts/Supplements/masterSupplement.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Supplement Detail
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="WizardContent" runat="Server">
    <div class="Blue">
        <table cellpadding="0" cellspacing="2">
            <tr>
                <td class="GridLabelBG" colspan="2">
                    <asp:Label ID="lbDetails" runat="server" Text="Supplement details" SkinID="skGridLabel"></asp:Label>
                    <asp:LinkButton ID="btCopy" runat="server" CssClass="GridLabel" Text="Copy Supplement"
                        Style="float: right; background-color: transparent; color: White; padding-right: 20px;" />
                </td>
            </tr>
            <asp:Panel ID="pnlCopy" runat="server" Visible="false">
                <tr class="Red">
                    <td valign="top" class="GridBorder" colspan="2">
                        <asp:FormView ID="fvCopy" runat="server" DataSourceID="dsCopy" DefaultMode="Edit">
                            <EditItemTemplate>
                                <table cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td class="GridRow1B" style="width: 100px;">
                                            Title
                                        </td>
                                        <td class="GridRow1B" style="width: 480px">
                                            <asp:TextBox ID="txtCopyTitle" runat="server" CssClass="TextBox" Text='<%# Bind("Title") %>' />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCopyTitle"
                                                Display="None" ErrorMessage="Required Field">*</asp:RequiredFieldValidator>
                                            <asp:ValidatorCalloutExtender ID="RequiredFieldValidator2_ValidatorCalloutExtender"
                                                runat="server" Enabled="True" TargetControlID="RequiredFieldValidator2">
                                            </asp:ValidatorCalloutExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="GridRow2B">
                                            Hotel
                                        </td>
                                        <td class="GridRow2B">
                                            <asp:DropDownList ID="ddlCopyHotels" runat="server" CssClass="TextBox" DataSourceID="dsHotel"
                                                DataTextField="Hotel" DataValueField="HotelID" SelectedValue='<%# Bind("HotelId") %>'>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: right; padding-top: 5px;">
                                            <asp:Button ID="btCopySave" runat="server" Text="Copy" SkinID="skBtnBase" OnClientClick="return confirm('Are you sure you want to copy this supplement?')"
                                                OnClick="btCopySave_Click" />&nbsp;
                                            <asp:Button ID="btCopyCancel" runat="server" Text="Cancel" SkinID="skBtnBase" CausesValidation="false"
                                                OnClick="btCopyCancel_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </EditItemTemplate>
                        </asp:FormView>
                        <asp:ObjectDataSource ID="dsCopy" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="SupplementsTableAdapters.SupplementCopyTableAdapter">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="SupplementID" QueryStringField="SupplementID" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;
                    </td>
                </tr>
            </asp:Panel>
            <tr>
                <td class="GridBorder" valign="top">
                    <asp:FormView ID="fvSupp" runat="server" DataKeyNames="SupplementID" DataSourceID="dsSupp">
                        <EditItemTemplate>
                            <table cellspacing="0" cellpadding="0">
                                <tr>
                                    <td class="GridRow2B" style="width: 100px; text-align: right;">
                                        [<asp:Label ID="IdLabel" runat="server" Text='<%# Eval("SupplementID") %>' />]&nbsp;
                                    </td>
                                    <td class="GridRow2B" style="width: 480px" colspan="5">
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="TextBox" Text='<%# Bind("Title") %>' />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1"
                                            Display="None" ErrorMessage="Required Field" />
                                        <asp:ValidatorCalloutExtender ID="RequiredFieldValidator2_ValidatorCalloutExtender"
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator2">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">Hotel</td>
                                    <td class="GridRow1B" colspan="5">
                                        <asp:DropDownList ID="ddlHotels" runat="server" CssClass="TextBox" DataSourceID="dsHotel"
                                            Enabled="false" DataTextField="Hotel" DataValueField="HotelID" SelectedValue='<%# Bind("HotelId") %>'>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">Category</td>
                                    <td class="GridRow1B" colspan="5">
                                        <asp:DropDownList ID="cdCategory" runat="server" CssClass="TextBox" DataSourceID="dsCategory"
                                            DataTextField="SupplementCategory" DataValueField="SupplementCategory" 
                                            SelectedValue='<%# Bind("Category") %>' ondatabound="cdCategory_DataBound">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" rowspan="2">Rate options</td>
                                    <td class="GridRow1B" colspan="5">
                                        <asp:DropDownList ID="cbRateOption" runat="server" CssClass="TextBox" SelectedValue='<%# Bind("PerDay") %>'>
                                            <asp:ListItem Text="Per Stay" Value="False" Selected="True" />
                                            <asp:ListItem Text="Per Day" Value="True" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" colspan="5">
                                        <asp:DropDownList ID="cbPerPax" runat="server" SelectedValue='<%# Bind("PerPax") %>' CssClass="TextBox">
                                            <asp:ListItem Value="False" Text="Per Room" Selected="True" />
                                            <asp:ListItem Value="True" Text="Per Pax" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">Start</td>
                                    <td class="GridRow1B" colspan="5">
                                        <asp:TextBox ID="txtStart" runat="server" Text='<%# Bind("Start", "{0:d}") %>' CssClass="TextBox" />
                                        <asp:CalendarExtender ID="extStart" runat="server" TargetControlID="txtStart" PopupButtonID="txtStart"
                                            TodaysDateFormat="d" DaysModeTitleFormat="d" ClearTime="True" CssClass="cal_Theme1" />
                                        <asp:CompareValidator ID="datStart" runat="server" ControlToValidate="txtStart" Operator="DataTypeCheck"
                                            Type="Date" SkinID="skDate" Display="None" ErrorMessage="Date input required" />
                                        <asp:ValidatorCalloutExtender ID="valStart" runat="server" TargetControlID="datStart" SkinID="skExtender" />
                                        <asp:RequiredFieldValidator ID="reqStart" runat="server" ControlToValidate="txtStart" 
                                            Display="None" ErrorMessage="Required Field" />
                                        <asp:ValidatorCalloutExtender ID="ereqStart" runat="server" Enabled="True" TargetControlID="reqStart" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">End</td>
                                    <td class="GridRow1B" colspan="5">
                                        <asp:TextBox ID="txtFinish" runat="server" CssClass="TextBox" Text='<%# Bind("Finish", "{0:d}") %>' />
                                        <asp:CalendarExtender ID="extFinish" runat="server" CssClass="cal_Theme1" PopupButtonID="txtFinish"
                                            TargetControlID="txtFinish" TodaysDateFormat="d" />
                                        <asp:CompareValidator ID="datFinish" runat="server" ControlToValidate="txtFinish"
                                            Display="None" Operator="DataTypeCheck" SkinID="skDate" Type="Date" ErrorMessage="Date input required" />
                                        <asp:ValidatorCalloutExtender ID="valFinish" runat="server" SkinID="skExtender" TargetControlID="datFinish" />
                                        <asp:RequiredFieldValidator ID="reqFinish" runat="server" ControlToValidate="txtFinish"
                                            Display="None" ErrorMessage="Required Field" />
                                        <asp:ValidatorCalloutExtender ID="ereqFinish" runat="server" Enabled="True" TargetControlID="reqFinish" />
                                        <asp:CompareValidator ID="CompareValidator101" runat="server" ControlToCompare="txtStart"
                                            ControlToValidate="txtFinish" Display="None" ErrorMessage="End Date must be greater then Strart Date"
                                            Operator="GreaterThan" Type="Date"></asp:CompareValidator>
                                        <asp:ValidatorCalloutExtender ID="CompareValidator101_ValidatorCalloutExtender" runat="server"
                                            Enabled="True" TargetControlID="CompareValidator101">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">Book.Start</td>
                                    <td class="GridRow1B" colspan="5">
                                        <asp:TextBox ID="txtBkStart" runat="server" Text='<%# Bind("BkStart", "{0:d}") %>'
                                            CssClass="TextBox" />
                                        <asp:CalendarExtender ID="extBkStart" runat="server" TargetControlID="txtBkStart"
                                            PopupButtonID="txtBkStart" TodaysDateFormat="d" CssClass="cal_Theme1" />
                                        <asp:CompareValidator ID="datBkStart" runat="server" ControlToValidate="txtBkStart"
                                            Display="None" Operator="DataTypeCheck" Type="Date" SkinID="skDate" ErrorMessage="Date input required" />
                                        <asp:ValidatorCalloutExtender ID="valBkStart" runat="server" TargetControlID="datBkStart"
                                            SkinID="skExtender" />
                                        <asp:CompareValidator ID="cmpBkStart" runat="server" ControlToValidate="txtBkStart"
                                            Operator="LessThanEqual" Type="Date" SkinID="skDate" ControlToCompare="txtFinish"
                                            ErrorMessage="Must be less or equal to End date." Display="None" />
                                        <asp:ValidatorCalloutExtender ID="vcmpBkStart" runat="server" TargetControlID="cmpBkStart"
                                            SkinID="skExtender" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">Book.End</td>
                                    <td class="GridRow1B" colspan="5">
                                        <asp:TextBox ID="txtBkFinish" runat="server" CssClass="TextBox" Text='<%# Bind("BkFinish", "{0:d}") %>' />
                                        <asp:CalendarExtender ID="extBkFinish" runat="server" CssClass="cal_Theme1" PopupButtonID="imgBkFinish"
                                            TargetControlID="txtBkFinish" TodaysDateFormat="d" />
                                        <asp:CompareValidator ID="datBkFinish" runat="server" ControlToValidate="txtBkFinish"
                                            Display="None" Operator="DataTypeCheck" Type="Date" SkinID="skDate" ErrorMessage="Date input required" />
                                        <asp:ValidatorCalloutExtender ID="valBkFinish" runat="server" TargetControlID="datBkFinish"
                                            SkinID="skExtender" />
                                        <asp:CompareValidator ID="cmpBkFinish" runat="server" ControlToValidate="txtBkFinish"
                                            Operator="LessThanEqual" Type="Date" SkinID="skDate" ControlToCompare="txtFinish"
                                            ErrorMessage="Must be less or equal to End date." Display="None" />
                                        <asp:ValidatorCalloutExtender ID="vcmpBkFinish" runat="server" TargetControlID="cmpBkFinish"
                                            SkinID="skExtender" />
                                        <asp:CompareValidator ID="CompareValidator102" runat="server" ControlToCompare="txtBkStart"
                                            ControlToValidate="txtBkFinish" Display="None" ErrorMessage="End Date must be greater then Strart Date"
                                            Operator="GreaterThan" Type="Date">End Date must be greater then Strart Date</asp:CompareValidator>
                                        <asp:ValidatorCalloutExtender ID="CompareValidator102_ValidatorCalloutExtender" runat="server"
                                            Enabled="True" TargetControlID="CompareValidator102">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">Bk.Code</td>
                                    <td class="GridRow1B" colspan="5">
                                        <asp:TextBox ID="TextBox3" runat="server" CssClass="TextBox" Text='<%# Bind("BookingCode") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">Meal Plan</td>
                                    <td class="GridRow1B" colspan="5">
                                        <asp:DropDownList ID="ddlMealPlan" runat="server" CssClass="TextBox" DataSourceID="dsMealPlan"
                                            DataTextField="MealPlanID" DataValueField="MealPlanID" AppendDataBoundItems="True"
                                            SelectedValue='<%# Bind("MealPlanId") %>'>
                                            <asp:ListItem Value="">all</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">Charge By</td>
                                    <td class="GridRow1B" colspan="5">
                                        <asp:DropDownList ID="ddlPercent" runat="server" CssClass="TextBox" SelectedValue='<%# Bind("IsPercent") %>'>
                                            <asp:ListItem Value="False" Selected="True">Amount</asp:ListItem>
                                            <asp:ListItem Value="True">Pecent</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" rowspan="2" style="width: 100px;">
                                        Rates
                                    </td>
                                    <td class="GridRow1B" style="width: 80px;">
                                        <asp:Label ID="lblCh5" runat="server" Text="Adult"></asp:Label>
                                    </td>
                                    <td class="GridRow1B" style="width: 80px;">
                                        <asp:Label ID="lblCh7" runat="server" Text="Extra"></asp:Label>
                                    </td>
                                    <td class="GridRow1B" style="width: 80px;">
                                        <asp:Label ID="lblCh1" runat="server" Text="Child"></asp:Label>
                                    </td>
                                    <td class="GridRow1B" style="width: 120px;">&nbsp</td>
                                    <td class="GridRowClear">&nbsp</td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" style="width: 80px;">
                                        <asp:TextBox ID="txtAdult" runat="server" Text='<%# Bind("RateAdult", "{0:N2}") %>'
                                            CssClass="TextBox" />
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtAdult"
                                            Display="None" ErrorMessage="Decimal input" Operator="DataTypeCheck" Type="Double" />
                                        <asp:ValidatorCalloutExtender ID="CompareValidator1_ValidatorCalloutExtender" runat="server"
                                            Enabled="True" TargetControlID="CompareValidator1" />
                                    </td>
                                    <td class="GridRow1B" style="width: 80px;">
                                        <asp:TextBox ID="txtAdult1" runat="server" Text='<%# Bind("RateExtra", "{0:N2}") %>'
                                            CssClass="TextBox" />
                                        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtAdult1"
                                            Display="None" ErrorMessage="Decimal input" Operator="DataTypeCheck" Type="Double" />
                                        <asp:ValidatorCalloutExtender ID="CompareValidator2_ValidatorCalloutExtender" runat="server"
                                            Enabled="True" TargetControlID="CompareValidator2" />
                                    </td>
                                    <td class="GridRow1B" style="width: 80px;">
                                        <asp:TextBox ID="txtCh1" runat="server" Text='<%# Bind("RateChld1", "{0:N2}") %>'
                                            CssClass="TextBox" />
                                        <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="txtCh1"
                                            Display="None" ErrorMessage="Decimal input" Operator="DataTypeCheck" Type="Double" />
                                        <asp:ValidatorCalloutExtender ID="CompareValidator3_ValidatorCalloutExtender" runat="server"
                                            Enabled="True" TargetControlID="CompareValidator3" />
                                    </td>
                                    <td class="GridRow1B" style="width: 120px;">
                                        <asp:CheckBox ID="cbHVisible" runat="server" Checked='<%# Bind("HotelVisible") %>'
                                            Text="Htl.Visible" />
                                    </td>
                                    <td class="GridRowClear">&nbsp</td>
                                </tr>
                                <asp:Panel ID="pnFlat" runat="server">
                                    <tr>
                                        <td class="SelectRow1B" style="width: 100px;">Htl.Amount</td>
                                        <td class="GridRow1B" style="width: 80px;">
                                            <asp:TextBox ID="txtAdult0" runat="server" Text='<%# Bind("HRateAdult", "{0:N2}") %>' CssClass="TextBox" />
                                            <asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="txtAdult0"
                                                Display="None" ErrorMessage="Decimal input" Operator="DataTypeCheck" Type="Double" />
                                            <asp:ValidatorCalloutExtender ID="CompareValidator7_ValidatorCalloutExtender" runat="server"
                                                Enabled="True" TargetControlID="CompareValidator7" />
                                        </td>
                                        <td class="GridRow1B" style="width: 80px;">
                                            <asp:TextBox ID="txtAdult2" runat="server" Text='<%# Bind("HRateExtra", "{0:N2}") %>' CssClass="TextBox" />
                                            <asp:CompareValidator ID="CompareValidator8" runat="server" ControlToValidate="txtAdult2"
                                                Display="None" ErrorMessage="Decimal input" Operator="DataTypeCheck" Type="Double" />
                                            <asp:ValidatorCalloutExtender ID="CompareValidator8_ValidatorCalloutExtender" runat="server"
                                                Enabled="True" TargetControlID="CompareValidator8" />
                                        </td>
                                        <td class="GridRow1B" style="width: 80px;">
                                            <asp:TextBox ID="txtHCh1" runat="server" Text='<%# Bind("HRateChld1", "{0:N2}") %>' CssClass="TextBox" />
                                            <asp:CompareValidator ID="CompareValidator9" runat="server" ControlToValidate="txtHCh1"
                                                Display="None" ErrorMessage="Decimal input" Operator="DataTypeCheck" Type="Double" />
                                            <asp:ValidatorCalloutExtender ID="CompareValidator9_ValidatorCalloutExtender" runat="server"
                                                Enabled="True" TargetControlID="CompareValidator9" />
                                        </td>
                                        <td class="GridRow1B" style="width: 120px;">&nbsp</td>
                                        <td class="GridRowClear">&nbsp</td>
                                    </tr>
                                </asp:Panel>
                                <tr>
                                    <td class="SelectRow1B">
                                        Week Days
                                    </td>
                                    <td class="GridRow1B" colspan="5">
                                        <table cellpadding="0" cellspacing="5px">
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="cbAll" runat="server" Text="All Days" Checked='<%# iif(Eval("WeekDays")="YYYYYYY",True,False) %>'
                                                        AutoPostBack="True" OnCheckedChanged="cbAll_CheckedChanged" OnDataBinding="cbAll_DataBinding" />
                                                </td>
                                                <asp:Panel ID="pnlWeek" runat="server" Visible="False">
                                                    <td>
                                                        <asp:CheckBox ID="cbE1" runat="server" Text="Sd" Checked='<%# iif(Eval("WeekDays").Chars(0)="Y",True,False) %>' />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="cbE2" runat="server" Text="Mo" Checked='<%# iif(Eval("WeekDays").Chars(1)="Y",True,False) %>' />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="cbE3" runat="server" Text="Tu" Checked='<%# iif(Eval("WeekDays").Chars(2)="Y",True,False) %>' />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="cbE4" runat="server" Text="Wd" Checked='<%# iif(Eval("WeekDays").Chars(3)="Y",True,False) %>' />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="cbE5" runat="server" Text="Th" Checked='<%# iif(Eval("WeekDays").Chars(4)="Y",True,False) %>' />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="cbE6" runat="server" Text="Fr" Checked='<%# iif(Eval("WeekDays").Chars(5)="Y",True,False) %>' />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="cbE7" runat="server" Text="St" Checked='<%# iif(Eval("WeekDays").Chars(6)="Y",True,False) %>' />
                                                    </td>
                                                </asp:Panel>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">Options</td>
                                    <td class="GridRow1B" colspan="5">
                                        <asp:CheckBox ID="cbMandatory" runat="server" Checked='<%# Bind("IsMandatory") %>' Text="Mandatory" />
                                        &nbsp;
                                        <asp:CheckBox ID="cbResEBB" runat="server" Checked='<%# Bind("RestrictEBB") %>' Text="Restrict on EBB" />
                                        &nbsp;
                                        <asp:CheckBox ID="cbResEBB0" runat="server" Checked='<%# Bind("Combinable") %>' Text="Combinable" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">Rate Received</td>
                                    <td class="GridRow1B" colspan="5">
                                        <asp:TextBox ID="txtRateReceived" runat="server" CssClass="TextBox" Text='<%# Bind("RateRecieved", "{0:d}") %>' />
                                        <asp:CalendarExtender ID="txtRateReceived_CalendarExtenderE" runat="server" ClearTime="True"
                                            CssClass="cal_Theme1" DaysModeTitleFormat="d" PopupButtonID="txtRateReceived"
                                            TargetControlID="txtRateReceived" TodaysDateFormat="d" />
                                        <asp:CompareValidator ID="datRateReceivedE" runat="server" ControlToValidate="txtRateReceived"
                                            Operator="DataTypeCheck" SkinID="skDate" Type="Date" Display="None" ErrorMessage="Date input required" />
                                        <asp:ValidatorCalloutExtender ID="datRateReceived_ValidatorCalloutExtenderE" runat="server"
                                            SkinID="skExtender" TargetControlID="datRateReceivedE" />
                                        <asp:RequiredFieldValidator ID="reqRRecived" runat="server" ControlToValidate="txtRateReceived"
                                            Display="None" ErrorMessage="Required Field" />
                                        <asp:ValidatorCalloutExtender ID="reqxRRecived" runat="server" Enabled="True" TargetControlID="reqRRecived" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRowClear">Description</td>
                                    <td class="GridRowClear" colspan="5">
                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="TextBox" Text='<%# Bind("Description") %>' TextMode="MultiLine" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow2T" colspan="6" style="text-align: right; padding-top: 5px;">
                                        <asp:Button ID="btUpdate" runat="server" Text="Update" SkinID="skBtnBase" CommandName="Update" />&nbsp;
                                        <asp:Button ID="btCancel" runat="server" Text="Cancel" SkinID="skBtnBase" CommandName="Cancel" CausesValidation="false" />
                                    </td>
                                </tr>
                            </table>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <table cellspacing="0" cellpadding="0">
                                <tr>
                                    <td class="GridRow2B" style="width: 100px">Supplement</td>
                                    <td class="GridRow2B" style="width: 480px" colspan="5">
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="TextBox" Text='<%# Bind("Title") %>' />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1"
                                            Display="None" ErrorMessage="Required Field">*</asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="RequiredFieldValidator2_ValidatorCalloutExtender"
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator2">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">Hotel</td>
                                    <td class="GridRow1B" colspan="5">
                                        <asp:DropDownList ID="ddlHotels" runat="server" CssClass="TextBox" DataSourceID="dsHotel"
                                            DataTextField="Hotel" DataValueField="HotelID" SelectedValue='<%# Bind("HotelId") %>'
                                            AutoPostBack="True" OnSelectedIndexChanged="ddlHotels_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">Category</td>
                                    <td class="GridRow1B" colspan="5">
                                        <asp:DropDownList ID="cdCategory" runat="server" CssClass="TextBox" DataSourceID="dsCategory"
                                            DataTextField="SupplementCategory" DataValueField="SupplementCategory" 
                                            SelectedValue='<%# Bind("Category") %>' AutoPostBack="True" 
                                            onselectedindexchanged="cdCategory_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" rowspan="2">Rate options</td>
                                    <td class="GridRow1B" colspan="5">
                                        <asp:DropDownList ID="cbRateOption" runat="server" CssClass="TextBox" SelectedValue='<%# Bind("PerDay") %>'>
                                            <asp:ListItem Text="Per Stay" Value="False" Selected="True" />
                                            <asp:ListItem Text="Per Day" Value="True" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" colspan="5">
                                        <asp:DropDownList ID="cbPerPax" runat="server" SelectedValue='<%# Bind("PerPax") %>' CssClass="TextBox">
                                            <asp:ListItem Value="False" Text="Per Room" Selected="True" />
                                            <asp:ListItem Value="True" Text="Per Pax" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">Start</td>
                                    <td class="GridRow1B" colspan="5">
                                        <asp:TextBox ID="txtStart" runat="server" Text='<%# Bind("Start", "{0:d}") %>' CssClass="TextBox" />
                                        <asp:CalendarExtender ID="extStart" runat="server" TargetControlID="txtStart" PopupButtonID="txtStart"
                                            TodaysDateFormat="d" DaysModeTitleFormat="d" ClearTime="True" CssClass="cal_Theme1" />
                                        <asp:CompareValidator ID="datStart" runat="server" ControlToValidate="txtStart" Operator="DataTypeCheck"
                                            Type="Date" SkinID="skDate" Display="None" ErrorMessage="Date input required" />
                                        <asp:ValidatorCalloutExtender ID="valStart" runat="server" TargetControlID="datStart" SkinID="skExtender" />
                                        <asp:RequiredFieldValidator ID="reqStart" runat="server" ControlToValidate="txtStart"
                                            Display="None" ErrorMessage="Required Field" />
                                        <asp:ValidatorCalloutExtender ID="ereqStart" runat="server" Enabled="True" TargetControlID="reqStart" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">End</td>
                                    <td class="GridRow1B" colspan="5">
                                        <asp:TextBox ID="txtFinish" runat="server" CssClass="TextBox" Text='<%# Bind("Finish", "{0:d}") %>' />
                                        <asp:CalendarExtender ID="extFinish" runat="server" CssClass="cal_Theme1" PopupButtonID="txtFinish"
                                            TargetControlID="txtFinish" TodaysDateFormat="d" />
                                        <asp:CompareValidator ID="datFinish" runat="server" ControlToValidate="txtFinish"
                                            Display="None" Operator="DataTypeCheck" SkinID="skDate" Type="Date" ErrorMessage="Date input required" />
                                        <asp:ValidatorCalloutExtender ID="valFinish" runat="server" SkinID="skExtender" TargetControlID="datFinish" />
                                        <asp:RequiredFieldValidator ID="reqFinish" runat="server" ControlToValidate="txtFinish"
                                            Display="None" ErrorMessage="Required Field" />
                                        <asp:ValidatorCalloutExtender ID="ereqFinish" runat="server" Enabled="True" TargetControlID="reqFinish" />
                                        <asp:CompareValidator ID="CompareValidator10" runat="server" ControlToCompare="txtStart"
                                            ControlToValidate="txtFinish" Display="None" ErrorMessage="End Date must be greater then Strart Date"
                                            Operator="GreaterThan" Type="Date">End Date must be greater then Strart Date</asp:CompareValidator>
                                        <asp:ValidatorCalloutExtender ID="CompareValidator10_ValidatorCalloutExtender" runat="server"
                                            Enabled="True" TargetControlID="CompareValidator10">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">Book.Start</td>
                                    <td class="GridRow1B" colspan="5">
                                        <asp:TextBox ID="txtBkStart" runat="server" Text='<%# Bind("BkStart", "{0:d}") %>' CssClass="TextBox" />
                                        <asp:CalendarExtender ID="extBkStart" runat="server" TargetControlID="txtBkStart"
                                            PopupButtonID="txtBkStart" TodaysDateFormat="d" CssClass="cal_Theme1" />
                                        <asp:CompareValidator ID="datBkStart" runat="server" ControlToValidate="txtBkStart"
                                            Display="None" Operator="DataTypeCheck" Type="Date" SkinID="skDate" ErrorMessage="Date input required" />
                                        <asp:ValidatorCalloutExtender ID="valBkStart" runat="server" TargetControlID="datBkStart" SkinID="skExtender" />
                                        <asp:CompareValidator ID="cmpBkStart" runat="server" ControlToValidate="txtBkStart"
                                            Operator="LessThanEqual" Type="Date" SkinID="skDate" ControlToCompare="txtFinish"
                                            ErrorMessage="Must be less or equal to End date." Display="None" />
                                        <asp:ValidatorCalloutExtender ID="vcmpBkStart" runat="server" TargetControlID="cmpBkStart" SkinID="skExtender" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">Book.End</td>
                                    <td class="GridRow1B" colspan="5">
                                        <asp:TextBox ID="txtBkFinish" runat="server" CssClass="TextBox" Text='<%# Bind("BkFinish", "{0:d}") %>' />
                                        <asp:CalendarExtender ID="extBkFinish" runat="server" CssClass="cal_Theme1" PopupButtonID="imgBkFinish"
                                            TargetControlID="txtBkFinish" TodaysDateFormat="d" />
                                        <asp:CompareValidator ID="datBkFinish" runat="server" ControlToValidate="txtBkFinish"
                                            Display="None" Operator="DataTypeCheck" Type="Date" SkinID="skDate" ErrorMessage="Date input required" />
                                        <asp:ValidatorCalloutExtender ID="valBkFinish" runat="server" TargetControlID="datBkFinish" SkinID="skExtender" />
                                        <asp:CompareValidator ID="cmpBkFinish" runat="server" ControlToValidate="txtBkFinish"
                                            Operator="LessThanEqual" Type="Date" SkinID="skDate" ControlToCompare="txtFinish"
                                            ErrorMessage="Must be less or equal to End date." Display="None" />
                                        <asp:ValidatorCalloutExtender ID="vcmpBkFinish" runat="server" TargetControlID="cmpBkFinish" SkinID="skExtender" />
                                        <asp:CompareValidator ID="CompareValidator11" runat="server" ControlToCompare="txtBkStart"
                                            ControlToValidate="txtBkFinish" Display="None" ErrorMessage="End Date must be greater then Strart Date"
                                            Operator="GreaterThan" Type="Date">End Date must be greater then Strart Date</asp:CompareValidator>
                                        <asp:ValidatorCalloutExtender ID="CompareValidator11_ValidatorCalloutExtender" runat="server"
                                            Enabled="True" TargetControlID="CompareValidator11">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">Bk.Code</td>
                                    <td class="GridRow1B" colspan="5">
                                        <asp:TextBox ID="TextBox3" runat="server" CssClass="TextBox" Text='<%# Bind("BookingCode") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">Meal Plan</td>
                                    <td class="GridRow1B" colspan="5">
                                        <asp:DropDownList ID="ddlMealPlan" runat="server" CssClass="TextBox" DataSourceID="dsMealPlan"
                                            DataTextField="MealPlanID" DataValueField="MealPlanID" AppendDataBoundItems="True"
                                            SelectedValue='<%# Bind("MealPlanId") %>'>
                                            <asp:ListItem Value="">all</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">Charge By</td>
                                    <td class="GridRow1B" colspan="5">
                                        <asp:DropDownList ID="ddlPercent" runat="server" CssClass="TextBox" SelectedValue='<%# Bind("IsPercent") %>'>
                                            <asp:ListItem Value="False" Selected="True">Amount</asp:ListItem>
                                            <asp:ListItem Value="True">Pecent</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" rowspan="2" style="width: 100px;">Rates</td>
                                    <td class="GridRow1B" style="width: 80px;">
                                        <asp:Label ID="lblCh5" runat="server" Text="Adult"/>
                                    </td>
                                    <td class="GridRow1B" style="width: 80px;">
                                        <asp:Label ID="lblCh7" runat="server" Text="Extra"/>
                                    </td>
                                    <td class="GridRow1B" style="width: 80px;">
                                        <asp:Label ID="lblCh1" runat="server" Text="Child"/>
                                    </td>
                                    <td class="GridRow1B" style="width: 120px;">
                                        &nbsp;
                                    </td>
                                    <td class="GridRowClear">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" style="width: 80px;">
                                        <asp:TextBox ID="txtAdult" runat="server" Text='<%# Bind("RateAdult", "{0:N2}") %>' CssClass="TextBox" />
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtAdult"
                                            Display="None" ErrorMessage="Decimal input" Operator="DataTypeCheck" Type="Double" />
                                        <asp:ValidatorCalloutExtender ID="CompareValidator1_ValidatorCalloutExtender" runat="server"
                                            Enabled="True" TargetControlID="CompareValidator1" />
                                    </td>
                                    <td class="GridRow1B" style="width: 80px;">
                                        <asp:TextBox ID="txtAdult1" runat="server" Text='<%# Bind("RateExtra", "{0:N2}") %>' CssClass="TextBox" />
                                        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtAdult1"
                                            Display="None" ErrorMessage="Decimal input" Operator="DataTypeCheck" Type="Double" />
                                        <asp:ValidatorCalloutExtender ID="CompareValidator2_ValidatorCalloutExtender" runat="server"
                                            Enabled="True" TargetControlID="CompareValidator2" />
                                    </td>
                                    <td class="GridRow1B" style="width: 80px;">
                                        <asp:TextBox ID="txtCh1" runat="server" Text='<%# Bind("RateChld1", "{0:N2}") %>' CssClass="TextBox" />
                                        <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="txtCh1"
                                            Display="None" ErrorMessage="Decimal input" Operator="DataTypeCheck" Type="Double" />
                                        <asp:ValidatorCalloutExtender ID="CompareValidator3_ValidatorCalloutExtender" runat="server"
                                            Enabled="True" TargetControlID="CompareValidator3" />
                                    </td>
                                    <td class="GridRow1B" style="width: 120px;">
                                        <asp:CheckBox ID="cbiHVisible" runat="server" Checked='<%# Bind("HotelVisible") %>' Text="Htl.Visible" />
                                    </td>
                                    <td class="GridRowClear">&nbsp;</td>
                                </tr>
                                <asp:Panel ID="pnFlat" runat="server">
                                    <tr>
                                        <td class="SelectRow1B" style="width: 100px;">Htl.Amount</td>
                                        <td class="GridRow1B" style="width: 80px;">
                                            <asp:TextBox ID="txtAdult0" runat="server" Text='<%# Bind("HRateAdult", "{0:N2}") %>' CssClass="TextBox" />
                                            <asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="txtAdult0"
                                                Display="None" ErrorMessage="Decimal input" Operator="DataTypeCheck" Type="Double" />
                                            <asp:ValidatorCalloutExtender ID="CompareValidator7_ValidatorCalloutExtender" runat="server"
                                                Enabled="True" TargetControlID="CompareValidator7" />
                                        </td>
                                        <td class="GridRow1B" style="width: 80px;">
                                            <asp:TextBox ID="txtAdult2" runat="server" Text='<%# Bind("HRateExtra", "{0:N2}") %>' CssClass="TextBox" />
                                            <asp:CompareValidator ID="CompareValidator8" runat="server" ControlToValidate="txtAdult2"
                                                Display="None" ErrorMessage="Decimal input" Operator="DataTypeCheck" Type="Double" />
                                            <asp:ValidatorCalloutExtender ID="CompareValidator8_ValidatorCalloutExtender" runat="server"
                                                Enabled="True" TargetControlID="CompareValidator8" />
                                        </td>
                                        <td class="GridRow1B" style="width: 80px;">
                                            <asp:TextBox ID="txtHCh1" runat="server" Text='<%# Bind("HRateChld1", "{0:N2}") %>' CssClass="TextBox" />
                                            <asp:CompareValidator ID="CompareValidator9" runat="server" ControlToValidate="txtHCh1"
                                                Display="None" ErrorMessage="Decimal input" Operator="DataTypeCheck" Type="Double" />
                                            <asp:ValidatorCalloutExtender ID="CompareValidator9_ValidatorCalloutExtender" runat="server"
                                                Enabled="True" TargetControlID="CompareValidator9" />
                                        </td>
                                        <td class="GridRow1B" style="width: 120px;">&nbsp</td>
                                    </tr>
                                    <td class="GridRowClear">&nbsp;</td>
                                    <td class="GridRowClear">&nbsp;</td>
                                </asp:Panel>
                                <tr>
                                    <td class="SelectRow1B">Week Days</td>
                                    <td class="GridRow1B" colspan="5">
                                        <table cellpadding="0" cellspacing="5px">
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="cbiAll" runat="server" Text="All Days" Checked="True" AutoPostBack="True"
                                                        OnCheckedChanged="cbiAll_CheckedChanged" />
                                                </td>
                                                <asp:Panel ID="pnliWeek" runat="server" Visible="False">
                                                    <td>
                                                        <asp:CheckBox ID="cbi1" runat="server" Text="Sd" Checked="False" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="cbi2" runat="server" Text="Mo" Checked="False" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="cbi3" runat="server" Text="Tu" Checked="False" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="cbi4" runat="server" Text="Wd" Checked="False" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="cbi5" runat="server" Text="Th" Checked="False" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="cbi6" runat="server" Text="Fr" Checked="False" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="cbi7" runat="server" Text="St" Checked="False" />
                                                    </td>
                                                </asp:Panel>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">Options</td>
                                    <td class="GridRow1B" colspan="5">
                                        <asp:CheckBox ID="cbiMandatory" runat="server" Checked='<%# Bind("IsMandatory") %>' Text="Mandatory" />
                                        &nbsp;
                                        <asp:CheckBox ID="cbiResEBB" runat="server" Checked='<%# Bind("RestrictEBB") %>' Text="Restrict on EBB" />
                                        &nbsp;
                                        <asp:CheckBox ID="cbiResEBB0" runat="server" Checked='<%# Bind("Combinable") %>' Text="Combinable" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">Rate Received</td>
                                    <td class="GridRow1B" colspan="5">
                                        <asp:TextBox ID="txtRateReceived" runat="server" CssClass="TextBox" Text='<%# Bind("RateRecieved", "{0:d}") %>' />
                                        <asp:CalendarExtender ID="txtRateReceived_CalendarExtenderE" runat="server" ClearTime="True"
                                            CssClass="cal_Theme1" DaysModeTitleFormat="d" PopupButtonID="txtRateReceived"
                                            TargetControlID="txtRateReceived" TodaysDateFormat="d" />
                                        <asp:CompareValidator ID="datRateReceivedE" runat="server" ControlToValidate="txtRateReceived"
                                            Operator="DataTypeCheck" SkinID="skDate" Type="Date" Display="None" ErrorMessage="Date input required" />
                                        <asp:ValidatorCalloutExtender ID="datRateReceived_ValidatorCalloutExtenderE" runat="server"
                                            SkinID="skExtender" TargetControlID="datRateReceivedE" />
                                        <asp:RequiredFieldValidator ID="reqRRecived" runat="server" ControlToValidate="txtRateReceived"
                                            Display="None" ErrorMessage="Required Field" />
                                        <asp:ValidatorCalloutExtender ID="reqxRRecived" runat="server" Enabled="True" TargetControlID="reqRRecived" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRowClear">Description</td>
                                    <td class="GridRowClear" colspan="5">
                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="TextBox" Text='<%# Bind("Description") %>' TextMode="MultiLine" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow2T" colspan="6" style="text-align: right; padding-top: 5px;">
                                        <asp:Button ID="btInsert" runat="server" Text="Save" SkinID="skBtnBase" CommandName="TryInsert" />&nbsp;
                                        <asp:Button ID="btCancel" runat="server" Text="Cancel" SkinID="skBtnBase" CommandName="Cancel"
                                            CausesValidation="false" OnClick="btCancel_Click" />&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <table cellspacing="0" cellpadding="0">
                                <tr>
                                    <td class="GridRow2B" style="width: 100px; text-align: right;">
                                        [<asp:Label ID="IdLabel" runat="server" Text='<%# Eval("SupplementID") %>' />]&nbsp;
                                    </td>
                                    <td class="GridRow2B" style="width: 480px">
                                        <asp:Label ID="TextBox1" runat="server" Text='<%# Eval("Title") %>' Font-Bold="true" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">Hotel</td>
                                    <td class="GridRow1B">
                                        <asp:HiddenField ID="hfHotels" runat="server" Value='<%# Bind("HotelId") %>' />
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Hotel") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">Category</td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Category") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" rowspan="2">Rate options</td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="lblPerStay" runat="server" Text="Per Stay" Visible='<%# Eval("PerDay")=False %>' />
                                        <asp:Label ID="lblPerDay" runat="server" Text="Per Day" Visible='<%# Eval("PerDay")=True %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        <asp:Label ID="lblPerRoom" runat="server" Text="Per Room" Visible='<%# Eval("PerPax")=False %>' />
                                        <asp:Label ID="lblPerPax" runat="server" Text="Per Pax" Visible='<%# Eval("PerPax")=True %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">Start</td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="txtStart" runat="server" Text='<%# Eval("Start", "{0:d}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">End</td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="txtFinish" runat="server" Text='<%# Eval("Finish", "{0:d}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">Book.Start</td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="txtBkStart" runat="server" Text='<%# Eval("BkStart", "{0:d}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">Book.End</td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="txtBkFinish" runat="server" Text='<%# Eval("BkFinish", "{0:d}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">Bk.Code</td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("BookingCode") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">Meal Plan</td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="lblMealPlan" runat="server" Text='<%# Eval("MealPlanId") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">Charge By</td>
                                    <td class="GridRow1B">
                                        <asp:Label runat="server" ID="lblAmount" Text="Amount" Visible='<%# Eval("IsPercent")=False %>' />
                                        <asp:Label runat="server" ID="lblPercent" Text="Percent" Visible='<%# Eval("IsPercent")=True %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear" colspan="2">
                                        <table cellpadding="0" cellspacing="2px">
                                            <tr>
                                                <td class="SelectRow1B" style="width: 100px;">
                                                    Rates
                                                </td>
                                                <td class="GridRow1B" style="width: 80px;">
                                                    <asp:Label ID="lblCh5" runat="server" Text="Adult"></asp:Label>
                                                </td>
                                                <td class="GridRow1B" style="width: 80px;">
                                                    <asp:Label ID="lblCh7" runat="server" Text="Extra"></asp:Label>
                                                </td>
                                                <td class="GridRow1B" style="width: 80px;">
                                                    <asp:Label ID="lblCh1" runat="server" Text="Child"></asp:Label>
                                                </td>
                                                <td class="GridRow1B" style="width: 120px;">
                                                    &nbsp
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="SelectRow1B" style="width: 100px;">
                                                    TO Amount
                                                </td>
                                                <td class="GridRow1B" style="width: 80px;">
                                                    <asp:Label ID="txtAdult" runat="server" Text='<%# Eval("RateAdult", "{0:N2}") %>' />
                                                </td>
                                                <td class="GridRow1B" style="width: 80px;">
                                                    <asp:Label ID="txtAdult1" runat="server" Text='<%# Eval("RateExtra", "{0:N2}") %>' />
                                                </td>
                                                <td class="GridRow1B" style="width: 80px;">
                                                    <asp:Label ID="txtCh1" runat="server" Text='<%# Eval("RateChld1", "{0:N2}") %>' />
                                                </td>
                                                <td class="GridRow1B" style="width: 120px;">
                                                    <asp:CheckBox ID="cbR2HVisible" runat="server" Checked='<%# Eval("HotelVisible") %>'
                                                        Enabled="false" Text="Htl.Visible" />
                                                </td>
                                            </tr>
                                            <asp:Panel ID="pnFlat" runat="server">
                                                <tr>
                                                    <td class="SelectRow1B" style="width: 100px;">
                                                        Htl.Amount
                                                    </td>
                                                    <td class="GridRow1B" style="width: 80px;">
                                                        <asp:Label ID="txtAdult0" runat="server" Text='<%# Eval("HRateAdult", "{0:N2}") %>' />
                                                    </td>
                                                    <td class="GridRow1B" style="width: 80px;">
                                                        <asp:Label ID="txtAdult2" runat="server" Text='<%# Eval("HRateExtra", "{0:N2}") %>' />
                                                    </td>
                                                    <td class="GridRow1B" style="width: 80px;">
                                                        <asp:Label ID="txtHCh1" runat="server" Text='<%# Eval("HRateChld1", "{0:N2}") %>' />
                                                    </td>
                                                    <td class="GridRow1B" style="width: 120px;">
                                                        &nbsp
                                                    </td>
                                                </tr>
                                            </asp:Panel>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Week Days
                                    </td>
                                    <td class="GridRow1B">
                                        <table cellpadding="0" cellspacing="5px">
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="cbR2All" runat="server" Text="All Days" Checked='<%# iif(Eval("WeekDays")="YYYYYYY",True,False) %>'
                                                        Enabled="false" />
                                                </td>
                                                <asp:Panel ID="pnlR2Week" runat="server" Visible='<%# iif(Eval("WeekDays")="YYYYYYY",False,True) %>'>
                                                    <td>
                                                        <asp:CheckBox ID="cbR21" runat="server" Text="Sd" Checked='<%# iif(Eval("WeekDays").Chars(0)="Y",True,False) %>'
                                                            Enabled="false" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="cbR22" runat="server" Text="Mo" Checked='<%# iif(Eval("WeekDays").Chars(1)="Y",True,False) %>'
                                                            Enabled="false" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="cbR23" runat="server" Text="Tu" Checked='<%# iif(Eval("WeekDays").Chars(2)="Y",True,False) %>'
                                                            Enabled="false" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="cbR24" runat="server" Text="Wd" Checked='<%# iif(Eval("WeekDays").Chars(3)="Y",True,False) %>'
                                                            Enabled="false" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="cbR25" runat="server" Text="Th" Checked='<%# iif(Eval("WeekDays").Chars(4)="Y",True,False) %>'
                                                            Enabled="false" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="cbR26" runat="server" Text="Fr" Checked='<%# iif(Eval("WeekDays").Chars(5)="Y",True,False) %>'
                                                            Enabled="false" />
                                                    </td>
                                                    <td>
                                                        <asp:CheckBox ID="cbR27" runat="server" Text="St" Checked='<%# iif(Eval("WeekDays").Chars(6)="Y",True,False) %>'
                                                            Enabled="false" />
                                                    </td>
                                                </asp:Panel>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Options
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:CheckBox ID="cbR2Mandatory" runat="server" Checked='<%# Eval("IsMandatory") %>'
                                            Enabled="false" Text="Mandatory" />
                                        &nbsp;
                                        <asp:CheckBox ID="cbR2ResEBB" runat="server" Checked='<%# Eval("RestrictEBB") %>'
                                            Enabled="false" Text="Restrict on EBB" />
                                        &nbsp;
                                        <asp:CheckBox ID="cbR2ResEBB0" runat="server" Checked='<%# Eval("Combinable") %>'
                                            Enabled="false" Text="Combinable" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Rate Received
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="txtRateReceived" runat="server" Text='<%# Eval("RateRecieved", "{0:d}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRowClear">
                                        Description
                                    </td>
                                    <td class="GridRowClear">
                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="TextBox" Text='<%# Eval("Description") %>' 
                                            TextMode="MultiLine" Wrap="True" BorderStyle="None" BorderWidth="0" Rows="8" ReadOnly="True" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow2T" colspan="2" style="text-align: right; padding-top: 5px;">
                                        <asp:Button ID="btEdit" runat="server" Text="Edit" SkinID="skBtnBase" CommandName="Edit"
                                            Visible='<%# Eval("StateId")=0 %>' style="margin-left: 10px;" />
                                        <asp:Button ID="btCancel0" runat="server" Text="Delete" SkinID="skBtnBase" CommandName="Delete"
                                            OnClientClick="return confirm('Are you sure you want to delete the record')"
                                            Visible='<%# Eval("StateId")=0 %>' style="margin-left: 10px;" />
                                        <asp:Button ID="btExtend" runat="server" Text="Extend Booking" SkinID="skBtnBase" CommandName="Extend"
                                            Visible='<%# Eval("StateId")>0 %>' style="margin-left: 10px;" />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:FormView>

                    <asp:FormView ID="fvSuppMD" runat="server" DataKeyNames="SupplementID" DataSourceID="dsSuppMD">
                        <EditItemTemplate>
                            <table cellspacing="0" cellpadding="0">
                                <tr>
                                    <td class="GridRow2B" style="width: 100px; text-align: right;">
                                        [<asp:Label ID="IdLabel" runat="server" Text='<%# Eval("SupplementID") %>' />]&nbsp;
                                    </td>
                                    <td class="GridRow2B" style="width: 480px">
                                        <asp:Label ID="TextBox1" runat="server" Text='<%# Eval("Title") %>' Font-Bold="true" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Hotel
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:HiddenField ID="hfHotels" runat="server" Value='<%# Eval("HotelId") %>' />
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Hotel") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Category
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Category") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" rowspan="2">
                                        Rate options
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="lblPerStay" runat="server" Text="Per Stay" Visible='<%# Eval("PerDay")=False %>' />
                                        <asp:Label ID="lblPerDay" runat="server" Text="Per Day" Visible='<%# Eval("PerDay")=True %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        <asp:Label ID="lblPerRoom" runat="server" Text="Per Room" Visible='<%# Eval("PerPax")=False %>' />
                                        <asp:Label ID="lblPerPax" runat="server" Text="Per Pax" Visible='<%# Eval("PerPax")=True %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Start
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="txtStart" runat="server" Text='<%# Eval("Start", "{0:d}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        End
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="txtFinish" runat="server" Text='<%# Eval("Finish", "{0:d}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Book.Start
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtBkStart" runat="server" Text='<%# Bind("BkStart", "{0:d}") %>'
                                            Enabled='<%# EditBkStart() %>' CssClass="TextBox" />
                                        <asp:CalendarExtender ID="extBkStart" runat="server" TargetControlID="txtBkStart"
                                            PopupButtonID="txtBkStart" TodaysDateFormat="d" CssClass="cal_Theme1" />
                                        <asp:CompareValidator ID="datBkStart" runat="server" ControlToValidate="txtBkStart"
                                            Display="None" Operator="DataTypeCheck" Type="Date" SkinID="skDate" ErrorMessage="Date input required" />
                                        <asp:ValidatorCalloutExtender ID="valBkStart" runat="server" TargetControlID="datBkStart"
                                            SkinID="skExtender" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Book.End
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtBkFinish" runat="server" CssClass="TextBox" Text='<%# Bind("BkFinish", "{0:d}") %>' />
                                        <asp:CalendarExtender ID="extBkFinish" runat="server" CssClass="cal_Theme1" PopupButtonID="imgBkFinish"
                                            TargetControlID="txtBkFinish" TodaysDateFormat="d" />
                                        <asp:CompareValidator ID="datBkFinish" runat="server" ControlToValidate="txtBkFinish"
                                            Display="None" Operator="DataTypeCheck" Type="Date" SkinID="skDate" ErrorMessage="Date input required" />
                                        <asp:ValidatorCalloutExtender ID="valBkFinish" runat="server" TargetControlID="datBkFinish"
                                            SkinID="skExtender" />
                                        <asp:CompareValidator ID="CompareValidator102" runat="server" ControlToCompare="txtBkStart"
                                            ControlToValidate="txtBkFinish" Display="None" ErrorMessage="Book.End Date must be greater then Book.Start Date"
                                            Operator="GreaterThan" Type="Date">End Date must be greater then Strart Date</asp:CompareValidator>
                                        <asp:ValidatorCalloutExtender ID="CompareValidator102_ValidatorCalloutExtender" runat="server"
                                            Enabled="True" TargetControlID="CompareValidator102">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Bk.Code
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("BookingCode") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Meal Plan
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="lblMealPlan" runat="server" Text='<%# Eval("MealPlanId") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Charge By
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label runat="server" ID="lblAmount" Text="Amount" Visible='<%# Eval("IsPercent")=False %>' />
                                        <asp:Label runat="server" ID="lblPercent" Text="Percent" Visible='<%# Eval("IsPercent")=True %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear" colspan="2">
                                        <table cellpadding="0" cellspacing="2px">
                                            <tr>
                                                <td class="SelectRow1B" style="width: 100px;">
                                                    Rates
                                                </td>
                                                <td class="GridRow1B" style="width: 80px;">
                                                    <asp:Label ID="lblCh5" runat="server" Text="Adult"></asp:Label>
                                                </td>
                                                <td class="GridRow1B" style="width: 80px;">
                                                    <asp:Label ID="lblCh7" runat="server" Text="Extra"></asp:Label>
                                                </td>
                                                <td class="GridRow1B" style="width: 80px;">
                                                    <asp:Label ID="lblCh1" runat="server" Text="Child"></asp:Label>
                                                </td>
                                                <td class="GridRow1B" style="width: 120px;">
                                                    &nbsp
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="SelectRow1B" style="width: 100px;">
                                                    TO Amount
                                                </td>
                                                <td class="GridRow1B" style="width: 80px;">
                                                    <asp:Label ID="txtAdult" runat="server" Text='<%# Eval("RateAdult", "{0:N2}") %>' />
                                                </td>
                                                <td class="GridRow1B" style="width: 80px;">
                                                    <asp:Label ID="txtAdult1" runat="server" Text='<%# Eval("RateExtra", "{0:N2}") %>' />
                                                </td>
                                                <td class="GridRow1B" style="width: 80px;">
                                                    <asp:Label ID="txtCh1" runat="server" Text='<%# Eval("RateChld1", "{0:N2}") %>' />
                                                </td>
                                                <td class="GridRow1B" style="width: 120px;">
                                                    <asp:CheckBox ID="cbR2HVisible" runat="server" Checked='<%# Eval("HotelVisible") %>'
                                                        Enabled="false" Text="Htl.Visible" />
                                                </td>
                                            </tr>
                                            <asp:Panel ID="pnFlat" runat="server">
                                                <tr>
                                                    <td class="SelectRow1B" style="width: 100px;">
                                                        Htl.Amount
                                                    </td>
                                                    <td class="GridRow1B" style="width: 80px;">
                                                        <asp:Label ID="txtAdult0" runat="server" Text='<%# Eval("HRateAdult", "{0:N2}") %>' />
                                                    </td>
                                                    <td class="GridRow1B" style="width: 80px;">
                                                        <asp:Label ID="txtAdult2" runat="server" Text='<%# Eval("HRateExtra", "{0:N2}") %>' />
                                                    </td>
                                                    <td class="GridRow1B" style="width: 80px;">
                                                        <asp:Label ID="txtHCh1" runat="server" Text='<%# Eval("HRateChld1", "{0:N2}") %>' />
                                                    </td>
                                                    <td class="GridRow1B" style="width: 120px;">
                                                        &nbsp
                                                    </td>
                                                </tr>
                                            </asp:Panel>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Week Days
                                    </td>
                                    <td class="GridRow1B">
                                        <%--<asp:UpdatePanel ID="upR2Week" runat="server">
                                            <ContentTemplate>--%>
                                                <table cellpadding="0" cellspacing="5px">
                                                    <tr>
                                                        <td>
                                                            <asp:CheckBox ID="cbR2All" runat="server" Text="All Days" Checked='<%# iif(Eval("WeekDays")="YYYYYYY",True,False) %>'
                                                                Enabled="false" />
                                                        </td>
                                                        <asp:Panel ID="pnlR2Week" runat="server" Visible='<%# iif(Eval("WeekDays")="YYYYYYY",False,True) %>'>
                                                            <td>
                                                                <asp:CheckBox ID="cbR21" runat="server" Text="Sd" Checked='<%# iif(Eval("WeekDays").Chars(0)="Y",True,False) %>'
                                                                    Enabled="false" />
                                                            </td>
                                                            <td>
                                                                <asp:CheckBox ID="cbR22" runat="server" Text="Mo" Checked='<%# iif(Eval("WeekDays").Chars(1)="Y",True,False) %>'
                                                                    Enabled="false" />
                                                            </td>
                                                            <td>
                                                                <asp:CheckBox ID="cbR23" runat="server" Text="Tu" Checked='<%# iif(Eval("WeekDays").Chars(2)="Y",True,False) %>'
                                                                    Enabled="false" />
                                                            </td>
                                                            <td>
                                                                <asp:CheckBox ID="cbR24" runat="server" Text="Wd" Checked='<%# iif(Eval("WeekDays").Chars(3)="Y",True,False) %>'
                                                                    Enabled="false" />
                                                            </td>
                                                            <td>
                                                                <asp:CheckBox ID="cbR25" runat="server" Text="Th" Checked='<%# iif(Eval("WeekDays").Chars(4)="Y",True,False) %>'
                                                                    Enabled="false" />
                                                            </td>
                                                            <td>
                                                                <asp:CheckBox ID="cbR26" runat="server" Text="Fr" Checked='<%# iif(Eval("WeekDays").Chars(5)="Y",True,False) %>'
                                                                    Enabled="false" />
                                                            </td>
                                                            <td>
                                                                <asp:CheckBox ID="cbR27" runat="server" Text="St" Checked='<%# iif(Eval("WeekDays").Chars(6)="Y",True,False) %>'
                                                                    Enabled="false" />
                                                            </td>
                                                        </asp:Panel>
                                                    </tr>
                                                </table>
                                            <%--</ContentTemplate>
                                        </asp:UpdatePanel>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Options
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:CheckBox ID="cbR2Mandatory" runat="server" Checked='<%# Eval("IsMandatory") %>'
                                            Enabled="false" Text="Mandatory" />
                                        &nbsp;
                                        <asp:CheckBox ID="cbR2ResEBB" runat="server" Checked='<%# Eval("RestrictEBB") %>'
                                            Enabled="false" Text="Restrict on EBB" />
                                        &nbsp;
                                        <asp:CheckBox ID="cbR2ResEBB0" runat="server" Checked='<%# Eval("Combinable") %>'
                                            Enabled="false" Text="Combinable" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Rate Received
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtRateReceived" runat="server" CssClass="TextBox" Text='<%# Bind("RateRecieved", "{0:d}") %>' />
                                        <asp:CalendarExtender ID="txtRateReceived_CalendarExtenderE" runat="server" ClearTime="True"
                                            CssClass="cal_Theme1" DaysModeTitleFormat="d" PopupButtonID="txtRateReceived"
                                            TargetControlID="txtRateReceived" TodaysDateFormat="d" />
                                        <asp:CompareValidator ID="datRateReceivedE" runat="server" ControlToValidate="txtRateReceived"
                                            Operator="DataTypeCheck" SkinID="skDate" Type="Date" Display="None" ErrorMessage="Date input required" />
                                        <asp:ValidatorCalloutExtender ID="datRateReceived_ValidatorCalloutExtenderE" runat="server"
                                            SkinID="skExtender" TargetControlID="datRateReceivedE" />
                                        <asp:RequiredFieldValidator ID="reqRRecived" runat="server" ControlToValidate="txtRateReceived"
                                            Display="None" ErrorMessage="Required Field" />
                                        <asp:ValidatorCalloutExtender ID="reqxRRecived" runat="server" Enabled="True" TargetControlID="reqRRecived" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRowClear">
                                        Description
                                    </td>
                                    <td class="GridRowClear">
                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="TextBox" Text='<%# Bind("Description") %>'
                                            TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow2T" colspan="2" style="text-align: right; padding-top: 5px;">
                                        <asp:Button ID="btUpdate" runat="server" Text="Update" SkinID="skBtnBase" CommandName="Update" />&nbsp;
                                        <asp:Button ID="btCancel" runat="server" Text="Cancel" SkinID="skBtnBase" CommandName="Cancel"
                                            CausesValidation="false" />
                                </tr>
                            </table>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <table cellspacing="0" cellpadding="0">
                                <tr>
                                    <td class="GridRow2B" style="width: 100px; text-align: right;">
                                        [<asp:Label ID="IdLabel" runat="server" Text='<%# Eval("SupplementID") %>' />]&nbsp;
                                    </td>
                                    <td class="GridRow2B" style="width: 480px">
                                        <asp:Label ID="TextBox1" runat="server" Text='<%# Eval("Title") %>' Font-Bold="true" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Hotel
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:HiddenField ID="hfHotels" runat="server" Value='<%# Bind("HotelId") %>' />
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Hotel") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Category
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Category") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" rowspan="2">
                                        Rate options
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="lblPerStay" runat="server" Text="Per Stay" Visible='<%# Eval("PerDay")=False %>' />
                                        <asp:Label ID="lblPerDay" runat="server" Text="Per Day" Visible='<%# Eval("PerDay")=True %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        <asp:Label ID="lblPerRoom" runat="server" Text="Per Room" Visible='<%# Eval("PerPax")=False %>' />
                                        <asp:Label ID="lblPerPax" runat="server" Text="Per Pax" Visible='<%# Eval("PerPax")=True %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Start
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="txtStart" runat="server" Text='<%# Eval("Start", "{0:d}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        End
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="txtFinish" runat="server" Text='<%# Eval("Finish", "{0:d}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Book.Start
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="txtBkStart" runat="server" Text='<%# Eval("BkStart", "{0:d}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Book.End
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="txtBkFinish" runat="server" Text='<%# Eval("BkFinish", "{0:d}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Bk.Code
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("BookingCode") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Meal Plan
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="lblMealPlan" runat="server" Text='<%# Eval("MealPlanId") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Charge By
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label runat="server" ID="lblAmount" Text="Amount" Visible='<%# Eval("IsPercent")=False %>' />
                                        <asp:Label runat="server" ID="lblPercent" Text="Percent" Visible='<%# Eval("IsPercent")=True %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear" colspan="2">
                                        <table cellpadding="0" cellspacing="2px">
                                            <tr>
                                                <td class="SelectRow1B" style="width: 100px;">
                                                    Rates
                                                </td>
                                                <td class="GridRow1B" style="width: 80px;">
                                                    <asp:Label ID="lblCh5" runat="server" Text="Adult"></asp:Label>
                                                </td>
                                                <td class="GridRow1B" style="width: 80px;">
                                                    <asp:Label ID="lblCh7" runat="server" Text="Extra"></asp:Label>
                                                </td>
                                                <td class="GridRow1B" style="width: 80px;">
                                                    <asp:Label ID="lblCh1" runat="server" Text="Child"></asp:Label>
                                                </td>
                                                <td class="GridRow1B" style="width: 120px;">
                                                    &nbsp
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="SelectRow1B" style="width: 100px;">
                                                    TO Amount
                                                </td>
                                                <td class="GridRow1B" style="width: 80px;">
                                                    <asp:Label ID="txtAdult" runat="server" Text='<%# Eval("RateAdult", "{0:N2}") %>' />
                                                </td>
                                                <td class="GridRow1B" style="width: 80px;">
                                                    <asp:Label ID="txtAdult1" runat="server" Text='<%# Eval("RateExtra", "{0:N2}") %>' />
                                                </td>
                                                <td class="GridRow1B" style="width: 80px;">
                                                    <asp:Label ID="txtCh1" runat="server" Text='<%# Eval("RateChld1", "{0:N2}") %>' />
                                                </td>
                                                <td class="GridRow1B" style="width: 120px;">
                                                    <asp:CheckBox ID="cbR2HVisible" runat="server" Checked='<%# Eval("HotelVisible") %>'
                                                        Enabled="false" Text="Htl.Visible" />
                                                </td>
                                            </tr>
                                            <asp:Panel ID="pnFlat" runat="server">
                                                <tr>
                                                    <td class="SelectRow1B" style="width: 100px;">
                                                        Htl.Amount
                                                    </td>
                                                    <td class="GridRow1B" style="width: 80px;">
                                                        <asp:Label ID="txtAdult0" runat="server" Text='<%# Eval("HRateAdult", "{0:N2}") %>' />
                                                    </td>
                                                    <td class="GridRow1B" style="width: 80px;">
                                                        <asp:Label ID="txtAdult2" runat="server" Text='<%# Eval("HRateExtra", "{0:N2}") %>' />
                                                    </td>
                                                    <td class="GridRow1B" style="width: 80px;">
                                                        <asp:Label ID="txtHCh1" runat="server" Text='<%# Eval("HRateChld1", "{0:N2}") %>' />
                                                    </td>
                                                    <td class="GridRow1B" style="width: 120px;">
                                                        &nbsp
                                                    </td>
                                                </tr>
                                            </asp:Panel>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Week Days
                                    </td>
                                    <td class="GridRow1B">
                                        <%--<asp:UpdatePanel ID="upR2Week" runat="server">
                                            <ContentTemplate>--%>
                                                <table cellpadding="0" cellspacing="5px">
                                                    <tr>
                                                        <td>
                                                            <asp:CheckBox ID="cbR2All" runat="server" Text="All Days" Checked='<%# iif(Eval("WeekDays")="YYYYYYY",True,False) %>'
                                                                Enabled="false" />
                                                        </td>
                                                        <asp:Panel ID="pnlR2Week" runat="server" Visible='<%# iif(Eval("WeekDays")="YYYYYYY",False,True) %>'>
                                                            <td>
                                                                <asp:CheckBox ID="cbR21" runat="server" Text="Sd" Checked='<%# iif(Eval("WeekDays").Chars(0)="Y",True,False) %>'
                                                                    Enabled="false" />
                                                            </td>
                                                            <td>
                                                                <asp:CheckBox ID="cbR22" runat="server" Text="Mo" Checked='<%# iif(Eval("WeekDays").Chars(1)="Y",True,False) %>'
                                                                    Enabled="false" />
                                                            </td>
                                                            <td>
                                                                <asp:CheckBox ID="cbR23" runat="server" Text="Tu" Checked='<%# iif(Eval("WeekDays").Chars(2)="Y",True,False) %>'
                                                                    Enabled="false" />
                                                            </td>
                                                            <td>
                                                                <asp:CheckBox ID="cbR24" runat="server" Text="Wd" Checked='<%# iif(Eval("WeekDays").Chars(3)="Y",True,False) %>'
                                                                    Enabled="false" />
                                                            </td>
                                                            <td>
                                                                <asp:CheckBox ID="cbR25" runat="server" Text="Th" Checked='<%# iif(Eval("WeekDays").Chars(4)="Y",True,False) %>'
                                                                    Enabled="false" />
                                                            </td>
                                                            <td>
                                                                <asp:CheckBox ID="cbR26" runat="server" Text="Fr" Checked='<%# iif(Eval("WeekDays").Chars(5)="Y",True,False) %>'
                                                                    Enabled="false" />
                                                            </td>
                                                            <td>
                                                                <asp:CheckBox ID="cbR27" runat="server" Text="St" Checked='<%# iif(Eval("WeekDays").Chars(6)="Y",True,False) %>'
                                                                    Enabled="false" />
                                                            </td>
                                                        </asp:Panel>
                                                    </tr>
                                                </table>
                                            <%--</ContentTemplate>
                                        </asp:UpdatePanel>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Options
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:CheckBox ID="cbR2Mandatory" runat="server" Checked='<%# Eval("IsMandatory") %>'
                                            Enabled="false" Text="Mandatory" />
                                        &nbsp;
                                        <asp:CheckBox ID="cbR2ResEBB" runat="server" Checked='<%# Eval("RestrictEBB") %>'
                                            Enabled="false" Text="Restrict on EBB" />
                                        &nbsp;
                                        <asp:CheckBox ID="cbR2ResEBB0" runat="server" Checked='<%# Eval("Combinable") %>'
                                            Enabled="false" Text="Combinable" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Rate Received
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="txtRateReceived" runat="server" Text='<%# Eval("RateRecieved", "{0:d}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRowClear">
                                        Description
                                    </td>
                                    <td class="GridRowClear">
                                        <%--<asp:Label ID="TextBox2" runat="server" Text='<%# Eval("Description") %>' Width="470px" />--%>
                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="TextBox" Text='<%# Eval("Description") %>' 
                                            TextMode="MultiLine" Wrap="True" BorderStyle="None" BorderWidth="0" Rows="8" ReadOnly="True" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow2T" colspan="2" style="text-align: right; padding-top: 5px;">
                                        <asp:Button ID="btEdit" runat="server" Text="Modify" SkinID="skBtnBase" CommandName="Edit" style="margin-left: 10px;" />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:FormView>

                    <asp:ObjectDataSource ID="dsSupp" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetDataBySuppID" TypeName="SupplementsTableAdapters.SupplementTableAdapter"
                        DeleteMethod="Delete" InsertMethod="InsertQuery" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_SupplementID" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="HotelId" Type="Int32" />
                            <asp:Parameter Name="Category" Type="String" />
                            <asp:Parameter Name="PerPax" Type="Boolean" />
                            <asp:Parameter Name="PerDay" Type="Boolean" />
                            <asp:Parameter Name="WeekDays" Type="String" />
                            <asp:Parameter Name="Title" Type="String" />
                            <asp:Parameter Name="Start" Type="DateTime" />
                            <asp:Parameter Name="Finish" Type="DateTime" />
                            <asp:Parameter Name="BkStart" Type="DateTime" />
                            <asp:Parameter Name="BkFinish" Type="DateTime" />
                            <asp:Parameter Name="BookingCode" Type="String" />
                            <asp:Parameter Name="MealPlanId" Type="String" />
                            <asp:Parameter Name="IsMandatory" Type="Boolean" />
                            <asp:Parameter Name="HotelVisible" Type="Boolean" />
                            <asp:Parameter Name="RestrictEBB" Type="Boolean" />
                            <asp:Parameter Name="IsPercent" Type="Boolean" />
                            <asp:Parameter Name="RateAdult" Type="Decimal" />
                            <asp:Parameter Name="RateChld1" Type="Decimal" />
                            <asp:Parameter Name="RateChld2" Type="Decimal" />
                            <asp:Parameter Name="RateChld3" Type="Decimal" />
                            <asp:Parameter Name="RateChld4" Type="Decimal" />
                            <asp:Parameter Name="HRateAdult" Type="Decimal" />
                            <asp:Parameter Name="HRateChld1" Type="Decimal" />
                            <asp:Parameter Name="HRateChld2" Type="Decimal" />
                            <asp:Parameter Name="HRateChld3" Type="Decimal" />
                            <asp:Parameter Name="HRateChld4" Type="Decimal" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="Combinable" Type="Boolean" />
                            <asp:Parameter Name="RateExtra" Type="Decimal" />
                            <asp:Parameter Name="HRateExtra" Type="Decimal" />
                            <asp:Parameter Name="RateRecieved" Type="DateTime" />
                            <asp:Parameter Name="Original_SupplementID" Type="Int32" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="SupplementID" QueryStringField="SupplementID" Type="Int32" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:Parameter Name="HotelId" Type="Int32" />
                            <asp:Parameter Name="Category" Type="String" />
                            <asp:Parameter Name="PerPax" Type="Boolean" />
                            <asp:Parameter Name="PerDay" Type="Boolean" />
                            <asp:Parameter Name="WeekDays" Type="String" />
                            <asp:Parameter Name="Title" Type="String" />
                            <asp:Parameter Name="Start" Type="DateTime" />
                            <asp:Parameter Name="Finish" Type="DateTime" />
                            <asp:Parameter Name="BkStart" Type="DateTime" />
                            <asp:Parameter Name="BkFinish" Type="DateTime" />
                            <asp:Parameter Name="BookingCode" Type="String" />
                            <asp:Parameter Name="MealPlanId" Type="String" />
                            <asp:Parameter Name="IsMandatory" Type="Boolean" />
                            <asp:Parameter Name="HotelVisible" Type="Boolean" />
                            <asp:Parameter Name="RestrictEBB" Type="Boolean" />
                            <asp:Parameter Name="Combinable" Type="Boolean" />
                            <asp:Parameter Name="IsPercent" Type="Boolean" />
                            <asp:Parameter Name="RateAdult" Type="Decimal" />
                            <asp:Parameter Name="RateExtra" Type="Decimal" />
                            <asp:Parameter Name="RateChld1" Type="Decimal" />
                            <asp:Parameter Name="RateChld2" Type="Decimal" />
                            <asp:Parameter Name="RateChld3" Type="Decimal" />
                            <asp:Parameter Name="RateChld4" Type="Decimal" />
                            <asp:Parameter Name="HRateAdult" Type="Decimal" />
                            <asp:Parameter Name="HRateExtra" Type="Decimal" />
                            <asp:Parameter Name="HRateChld1" Type="Decimal" />
                            <asp:Parameter Name="HRateChld2" Type="Decimal" />
                            <asp:Parameter Name="HRateChld3" Type="Decimal" />
                            <asp:Parameter Name="HRateChld4" Type="Decimal" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="RateRecieved" Type="DateTime" />
                            <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
                            <asp:Parameter Name="NewID" Type="Int32" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                    
                    <asp:ObjectDataSource ID="dsSuppMD" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetDataBySuppID" TypeName="SupplementsTableAdapters.SupplementTableAdapter"
                        UpdateMethod="ModifyQuery">
                        <UpdateParameters>
                            <asp:Parameter Name="BkStart" Type="DateTime" />
                            <asp:Parameter Name="BkFinish" Type="DateTime" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="RateRecieved" Type="DateTime" />
                            <asp:Parameter Name="Original_SupplementID" Type="Int32" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="SupplementID" QueryStringField="SupplementID" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    
                    <asp:ObjectDataSource ID="dsHotel" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="SupplementsTableAdapters.SelectUserHotelTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="dsCategory" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="SupplementsTableAdapters.SupplementCategoryTableAdapter"/>
                    <asp:ObjectDataSource ID="dsMealPlan" runat="server" OldValuesParameterFormatString="original_{0}" 
                        SelectMethod="GetData" TypeName="dsMaintBasicTableAdapters.MealPlanTableAdapter" />


                </td>
                <asp:Panel ID="pnlRoom" runat="server" Enabled="False">
                    <td class="GridBorder" valign="top">
                        <table>
                            <tr>
                                <td>
                                    <div class="GridRow1B" style="margin-bottom: 2px; font-weight: bold;">
                                        <asp:CheckBox ID="cbAllRooms" runat="server" TextAlign="Left" Text="All Rooms" AutoPostBack="True" />
                                    </div>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:GridView ID="gridRoomType" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                                                DataSourceID="dsRoomType" SkinID="skGridView" DataKeyNames="SupplementID,RoomTypeID" >
                                                <Columns>
                                                    <asp:BoundField DataField="SpecialID" HeaderText="SpecialID" ReadOnly="True" SortExpression="SpecialID" Visible="False" />
                                                    <asp:TemplateField SortExpression="SelectedRT">
                                                        <HeaderTemplate>
                                                            <asp:ImageButton ID="btnRoomToggle" runat="server" ImageUrl="~/Images/cbCheckedCursor2.png" 
                                                                ToolTip="Toggle selection" OnClick="btnRoomToggle_Click" />
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="cbRoomSel" runat="server" Checked='<%# Bind("SelectedRT") %>' />
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:CheckBox ID="cbRoomSel" runat="server" Checked='<%# Bind("SelectedRT") %>' />
                                                        </EditItemTemplate>
                                                        <ItemStyle Width="40px" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="RoomTypeID" HeaderText="Room Type" ReadOnly="True">
                                                        <HeaderStyle Font-Bold="True" HorizontalAlign="Left" />
                                                        <ItemStyle Width="100px" />
                                                    </asp:BoundField>
                                                </Columns>
                                            </asp:GridView>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 30px; text-align: right;">
                                    <asp:Button ID="btnUpdate0" runat="server" SkinID="skBtnBase" Text="Update" Visible="False" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td colspan="2" class="GridBorder">
                    <asp:FormView ID="fvComment" runat="server" DataSourceID="dsOvwComment" >
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td class="SelectRow1B" style="width: 730px">
                                        <asp:Label ID="lblCommentLabel" runat="server" Text='<%# Eval("SihotRateType") & " comment" %>' />
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" >
                                        <asp:Label ID="lblComment" runat="server" Text='<%# Eval("RateComment") %>' />
                                    </td>
                                </tr>
                           </table>
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:ObjectDataSource ID="dsOvwComment" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                        TypeName="SupplementsTableAdapters.SupplementCommentTableAdapter">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="SupplementID" QueryStringField="SupplementID" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="dsRoomType" runat="server" SelectMethod="GetData" TypeName="SupplementsTableAdapters.SelectSupplementRoomTableAdapter"
            UpdateMethod="SupplementRoomUpdate">
            <UpdateParameters>
                <asp:Parameter Name="SupplementID" Type="Int32" />
                <asp:Parameter Name="RoomTypeId" Type="String" />
                <asp:Parameter Name="SelectedRT" Type="Boolean" />
            </UpdateParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="SupplementID" QueryStringField="SupplementID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
            Enabled="true" PopupDragHandleControlID="popLabel" CancelControlID="btnNo" DropShadow="True"
            BackgroundCssClass="modalBackground" TargetControlID="hfUserName" X="200" Y="200">
        </asp:ModalPopupExtender>
        <asp:Panel ID="popPanel" runat="server" Width="300px" BackColor="White" Style="display: none">
            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td class="GridLabelBG">
                        <asp:Label ID="popLabel" runat="server" Text="Title" SkinID="skGridLabel" />
                    </td>
                </tr>
                <tr>
                    <td class="GridBorder">
                        <p style="text-align: center;">
                            <asp:Label ID="popMessage" runat="server" Text="Message" />
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
