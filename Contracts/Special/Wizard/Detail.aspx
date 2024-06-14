<%@ Page Title="" Language="VB" MasterPageFile="~/Contracts/Special/Wizard/masterWizard.master"
    AutoEventWireup="false" CodeFile="Detail.aspx.vb" Inherits="Contracts_Special_Wizard_Detail" %>

<%@ MasterType VirtualPath="~/Contracts/Special/Wizard/masterWizard.master" %>
<asp:Content ID="CntTitle" ContentPlaceHolderID="title" runat="Server">
    Details
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="WizardContent" runat="Server">
    <div class="Red">
        <table cellpadding="0" cellspacing="2">
            <tr>
                <td class="GridLabelBG" colspan="4">
                    <asp:Label ID="Label6" runat="server" SkinID="skGridLabel" 
                        Text="Special basic details"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder" valign="top">
                    <asp:FormView ID="fvContract" runat="server" DataKeyNames="ContractID" 
                        DataSourceID="dsContractDetail">
                        <EditItemTemplate>
                            <table cellspacing="0" cellpadding="0">
                                <tr>
                                    <td class="GridRow2B" style="width: 100px; text-align: right;">
                                        [<asp:Label ID="IdLabel" runat="server" Text='<%# Eval("SpecialID") %>' />]&nbsp;
                                    </td>
                                    <td class="GridRow2B" style="width: 300px">
                                        <asp:TextBox ID="txtSpecial" runat="server" CssClass="TextBox" Text='<%# Bind("Title") %>'
                                            Font-Bold="true" MaxLength="30" />
                                        <asp:RequiredFieldValidator ID="valSpecial" runat="server" ControlToValidate="txtSpecial"
                                            Display="None" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="extSpecial"
                                            runat="server" Enabled="True" TargetControlID="valSpecial">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Hotel
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Hotel") %>' />
                                        <asp:HiddenField ID="HiddenField1" runat="server" 
                                            Value='<%# Eval("HotelId") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Start
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtStart" runat="server" Text='<%# Bind("Start", "{0:d}") %>' CssClass="TextBox" />
                                        <asp:CalendarExtender ID="extStart" runat="server" TargetControlID="txtStart" TodaysDateFormat="d"
                                            DaysModeTitleFormat="d" ClearTime="True" CssClass="cal_Theme1" />
                                        <asp:CompareValidator ID="datStart" runat="server" ControlToValidate="txtStart" Operator="DataTypeCheck"
                                            Type="Date" SkinID="skDate" ErrorMessage="Date input required" Display="None" />
                                        <asp:ValidatorCalloutExtender ID="valStart" runat="server" TargetControlID="datStart"
                                            SkinID="skExtender" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtStart"
                                            Display="None" ErrorMessage="Required Field">*</asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="RequiredFieldValidator2_ValidatorCalloutExtender"
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator2">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        End
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtFinish" runat="server" Text='<%# Bind("Finish","{0:d}") %>' CssClass="TextBox" />
                                        <asp:CalendarExtender ID="extFinish" runat="server" TargetControlID="txtFinish" TodaysDateFormat="d"
                                            CssClass="cal_Theme1" />
                                        <asp:CompareValidator ID="datFinish" runat="server" ControlToValidate="txtFinish" Display="None"
                                            Operator="DataTypeCheck" Type="Date" SkinID="skDate" ErrorMessage="Date input required" />
                                        <asp:ValidatorCalloutExtender ID="valFinish" runat="server" TargetControlID="datFinish"
                                            SkinID="skExtender" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFinish"
                                            Display="None" ErrorMessage="Required Field">*</asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="RequiredFieldValidator3_ValidatorCalloutExtender"
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator3">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Rate Received
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtRateReceived" runat="server" CssClass="TextBox" Text='<%# Bind("RateRecieved", "{0:d}") %>' />
                                        <asp:CalendarExtender ID="txtRateReceived_CalendarExtender" runat="server" ClearTime="True"
                                            CssClass="cal_Theme1" DaysModeTitleFormat="d" TargetControlID="txtRateReceived"
                                            TodaysDateFormat="d" />
                                        <asp:CompareValidator ID="datRateReceived" runat="server" ControlToValidate="txtRateReceived"
                                            CultureInvariantValues="True" Operator="DataTypeCheck" SkinID="skDate" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="datRateReceived_ValidatorCalloutExtender" runat="server"
                                            SkinID="skExtender" TargetControlID="datRateReceived" />
                                        <asp:RequiredFieldValidator ID="reqRRecived" runat="server" ControlToValidate="txtRateReceived"
                                            Display="None" ErrorMessage="Required Field">*</asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="reqxRRecived"
                                            runat="server" Enabled="True" TargetControlID="reqRRecived">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRowClear">
                                        Description
                                    </td>
                                    <td class="GridRowClear">
                                        <asp:TextBox ID="txtDescription" runat="server" CssClass="TextBox" Text='<%# Bind("Description") %>'
                                            TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow2T" colspan="2" style="text-align: right; padding-top: 5px;">
                                        <asp:Button ID="btUpdate" runat="server" Text="Update" SkinID="skBtnBase" 
                                            CommandName="Update" onclick="btnUpdate_Click" />&nbsp;
                                        <asp:Button ID="btCancel" runat="server" Text="Cancel" SkinID="skBtnBase" CommandName="Cancel" CausesValidation="false" />&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <table cellspacing="0" cellpadding="0">
                                <tr>
                                    <td class="GridRow2B" style="width: 100px; text-align: right; font-weight: bold;">
                                        Special&nbsp;
                                    </td>
                                    <td class="GridRow2B" style="width: 300px">
                                        <asp:TextBox ID="txtSpecial" runat="server" CssClass="TextBox" Text='<%# Bind("Title") %>'
                                            Font-Bold="true" />
                                        <asp:TextBoxWatermarkExtender ID="wmSpecial" runat="server" TargetControlID="txtSpecial"
                                            WatermarkCssClass="WaterMark" WatermarkText="Title" />
                                        <asp:RequiredFieldValidator ID="valSpecial" runat="server" ControlToValidate="txtSpecial"
                                            Display="None" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="extSpecial"
                                            runat="server" Enabled="True" TargetControlID="valSpecial">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Hotel
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:DropDownList ID="cbHotelID" runat="server" CssClass="TextBox" DataSourceID="dsHotel"
                                            DataTextField="Hotel" DataValueField="HotelID" SelectedValue='<%# Bind("HotelId") %>'>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Category
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:DropDownList ID="cdCategory" runat="server" CssClass="TextBox" DataSourceID="dsCategory"
                                            DataTextField="SpecialCategory" DataValueField="SpecialCategory" SelectedValue='<%# Bind("Category") %>'>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Booking Code
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtBookingCode" runat="server" CssClass="TextBox" Text='<%# Bind("BookingCode") %>' />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBookingCode"
                                            Display="None" ErrorMessage="Required Field">*</asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="RequiredFieldValidator1_ValidatorCalloutExtender"
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator1">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Rate Type
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:DropDownList ID="ddlRateType" runat="server" CssClass="TextBox" DataSourceID="dsRateType"
                                            DataTextField="RateTypeID" DataValueField="RateTypeID" SelectedValue='<%# Bind("RateTypeId") %>'>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Rate option
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:DropDownList ID="cbRateOption" runat="server" SelectedValue='<%# Bind("RateOption") %>'
                                            CssClass="TextBox">
                                            <asp:ListItem Value="1" Text="PerStay" />
                                            <asp:ListItem Value="0" Text="PerArrival" />
                                            <asp:ListItem Text="Inclusiv" Value="2" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Start
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtStart" runat="server" Text='<%# Bind("Start", "{0:d}") %>' CssClass="TextBox" />
                                        <asp:CalendarExtender ID="extStart" runat="server" TargetControlID="txtStart" TodaysDateFormat="d"
                                            DaysModeTitleFormat="d" ClearTime="True" CssClass="cal_Theme1" />
                                        <asp:CompareValidator ID="datStart" runat="server" ControlToValidate="txtStart" Operator="DataTypeCheck"
                                            Type="Date" SkinID="skDate" ErrorMessage="Date input required" Display="None" />
                                        <asp:ValidatorCalloutExtender ID="valStart" runat="server" TargetControlID="datStart"
                                            SkinID="skExtender" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtStart"
                                            Display="None" ErrorMessage="Required Field">*</asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="RequiredFieldValidator2_ValidatorCalloutExtender"
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator2">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        End
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtFinish" runat="server" Text='<%# Bind("Finish","{0:d}") %>' CssClass="TextBox" />
                                        <asp:CalendarExtender ID="extFinish" runat="server" TargetControlID="txtFinish" TodaysDateFormat="d"
                                            CssClass="cal_Theme1" />
                                        <asp:CompareValidator ID="datFinish" runat="server" ControlToValidate="txtFinish" Display="None"
                                            Operator="DataTypeCheck" Type="Date" SkinID="skDate" ErrorMessage="Date input required" />
                                        <asp:ValidatorCalloutExtender ID="valFinish" runat="server" TargetControlID="datFinish"
                                            SkinID="skExtender" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFinish"
                                            Display="None" ErrorMessage="Required Field">*</asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="RequiredFieldValidator3_ValidatorCalloutExtender"
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator3">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Book.Start
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtBkStart" runat="server" Text='<%# Bind("BkStart","{0:d}") %>'
                                            CssClass="TextBox" />
                                        <asp:CalendarExtender ID="extBkStart" runat="server" TargetControlID="txtBkStart"
                                            TodaysDateFormat="d" CssClass="cal_Theme1" />
                                        <asp:CompareValidator ID="datBkStart" runat="server" ControlToValidate="txtBkStart" Display="None"
                                            Operator="DataTypeCheck" Type="Date" SkinID="skDate" ErrorMessage="Date input required" />
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
                                    <td class="SelectRow1B">
                                        Book.End
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtBkFinish" runat="server" Text='<%# Bind("BkFinish","{0:d}") %>'
                                            CssClass="TextBox" />
                                        <asp:CalendarExtender ID="extBkFinish" runat="server" TargetControlID="txtBkFinish"
                                            TodaysDateFormat="d" CssClass="cal_Theme1" />
                                        <asp:CompareValidator ID="datBkFinish" runat="server" ControlToValidate="txtBkFinish" Display="None"
                                            Operator="DataTypeCheck" Type="Date" SkinID="skDate" ErrorMessage="Date input required" />
                                        <asp:ValidatorCalloutExtender ID="valBkFinish" runat="server" TargetControlID="datBkFinish"
                                            SkinID="skExtender" />
                                        <asp:CompareValidator ID="cmpBkFinish" runat="server" ControlToValidate="txtBkFinish"
                                            Operator="LessThanEqual" Type="Date" SkinID="skDate" ControlToCompare="txtFinish" 
                                             ErrorMessage="Must be less or equal to End date." Display="None" />
                                        <asp:ValidatorCalloutExtender ID="vcmpBkFinish" runat="server" TargetControlID="cmpBkFinish"
                                            SkinID="skExtender" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRowClear" colspan="2">
                                        Discounts
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear" colspan="2">
                                        <table cellpadding="0" cellspacing="2px">
                                            <tr>
                                                <td class="SelectRow1TB" style="width: 100px;">
                                                    Primary
                                                </td>
                                                <td class="GridRow1TB" style="width: 150px;">
                                                    <asp:DropDownList ID="cbPrType" runat="server" CssClass="TextBox" />
                                                    <asp:CascadingDropDown ID="exPrType" runat="server" TargetControlID="cbPrType" Category="PrTypeID"
                                                        ContextKey="Pr" SelectedValue='<%# Bind("PrDiscountTypeId") %>' ServicePath="~/SpecDisc.asmx"
                                                        ServiceMethod="GetTypeID" UseContextKey="True">
                                                    </asp:CascadingDropDown>
                                                </td>
                                                <td class="GridRow1TB" style="width: 50px; padding-right: 5px; text-align: right;">
                                                    On
                                                </td>
                                                <td class="GridRow1TB" style="width: 100px;">
                                                    <asp:DropDownList ID="cbPrOn" runat="server" CssClass="TextBox" />
                                                    <asp:CascadingDropDown ID="exPrOn" runat="server" TargetControlID="cbPrOn" ParentControlID="cbPrType"
                                                        Category="PrTypeOn" ContextKey="Pr" SelectedValue='<%# Bind("PrDiscountOn") %>'
                                                        ServicePath="~/SpecDisc.asmx" ServiceMethod="GetOn" UseContextKey="True">
                                                    </asp:CascadingDropDown>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="SelectRow1B" style="text-indent: 20px">
                                                    Discount
                                                </td>
                                                <td class="GridRow1B">
                                                    <asp:DropDownList ID="cbPrDisc" runat="server" CssClass="TextBox" />
                                                    <asp:CascadingDropDown ID="exPrDisc" runat="server" TargetControlID="cbPrDisc" ParentControlID="cbPrType"
                                                        Category="PrDisc" ContextKey="Pr" SelectedValue='<%# Bind("PrDiscount") %>' ServicePath="~/SpecDisc.asmx"
                                                        ServiceMethod="GetDiscount" UseContextKey="True">
                                                    </asp:CascadingDropDown>
                                                </td>
                                                <td class="GridRow1B">
                                                    &nbsp;
                                                </td>
                                                <td class="GridRow1B">
                                                    <asp:CheckBox ID="cbPropagate" runat="server" Text="Average" Checked='<%# Bind("PrPropagate") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="SelectRow1B">
                                                    Secondary
                                                </td>
                                                <td class="GridRow1B">
                                                    <asp:DropDownList ID="cbScType" runat="server" CssClass="TextBox" />
                                                    <asp:CascadingDropDown ID="exScType" runat="server" TargetControlID="cbScType" Category="ScTypeID"
                                                        ContextKey="Sc" SelectedValue='<%# Bind("ScDiscountTypeId") %>' ServicePath="~/SpecDisc.asmx"
                                                        ServiceMethod="GetTypeID" UseContextKey="True">
                                                    </asp:CascadingDropDown>
                                                </td>
                                                <td class="GridRow1TB" style="width: 50px; padding-right: 5px; text-align: right;">
                                                    On
                                                </td>
                                                <td class="GridRow1B">
                                                    <asp:DropDownList ID="cbScOn" runat="server" CssClass="TextBox" />
                                                    <asp:CascadingDropDown ID="exScOn" runat="server" TargetControlID="cbScOn" ParentControlID="cbScType"
                                                        Category="ScTypeOn" ContextKey="Sc" SelectedValue='<%# Bind("ScDiscountOn") %>'
                                                        ServicePath="~/SpecDisc.asmx" ServiceMethod="GetOn" UseContextKey="True">
                                                    </asp:CascadingDropDown>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="SelectRow1B" style="text-indent: 20px">
                                                    Discount
                                                </td>
                                                <td class="GridRow1B">
                                                    <asp:DropDownList ID="cbScDisc" runat="server" CssClass="TextBox" />
                                                    <asp:CascadingDropDown ID="exScDisc" runat="server" TargetControlID="cbScDisc" ParentControlID="cbScType"
                                                        Category="ScDisc" ContextKey="Sc" SelectedValue='<%# Bind("ScDiscount") %>' ServicePath="~/SpecDisc.asmx"
                                                        ServiceMethod="GetDiscount" UseContextKey="True">
                                                    </asp:CascadingDropDown>
                                                </td>
                                                <td class="GridRow1B">
                                                    &nbsp;
                                                </td>
                                                <td class="GridRow1B">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Payment
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtPayment" runat="server" Text='<%# Bind("Payment","{0:d}") %>'
                                            CssClass="TextBox" />
                                        <asp:CalendarExtender ID="extPayment" runat="server" TargetControlID="txtPayment"
                                            TodaysDateFormat="d" CssClass="cal_Theme1" />
                                        <asp:CompareValidator ID="datPayment" runat="server" ControlToValidate="txtPayment"
                                            Operator="DataTypeCheck" Type="Date" SkinID="skDate" />
                                        <asp:ValidatorCalloutExtender ID="valPayment" runat="server" TargetControlID="datPayment"
                                            SkinID="skExtender" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Rooming list
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtRooming" runat="server" Text='<%# Bind("RoomingList","{0:d}") %>'
                                            CssClass="TextBox" />
                                        <asp:CalendarExtender ID="extRooming" runat="server" TargetControlID="txtRooming"
                                            TodaysDateFormat="d" CssClass="cal_Theme1" />
                                        <asp:CompareValidator ID="datRooming" runat="server" ControlToValidate="txtRooming"
                                            Operator="DataTypeCheck" Type="Date" SkinID="skDate" />
                                        <asp:ValidatorCalloutExtender ID="valRooming" runat="server" TargetControlID="datRooming"
                                            SkinID="skExtender" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Min.Stay
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtStayMin" runat="server" CssClass="TextBox" Text='<%# Bind("StayCriteriaMin") %>'></asp:TextBox>
                                        <asp:CompareValidator ID="intStayMin" runat="server" ControlToValidate="txtStayMin"
                                            Operator="DataTypeCheck" Type="Integer" SkinID="skInteger" />
                                        <asp:ValidatorCalloutExtender ID="extStayMin" runat="server" TargetControlID="intStayMin"
                                            SkinID="skExtender" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Max.Stay
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtStayMax" runat="server" CssClass="TextBox" Text='<%# Bind("StayCriteriaMax") %>'></asp:TextBox>
                                        <asp:CompareValidator ID="intStayMax" runat="server" ControlToValidate="txtStayMax"
                                            Operator="DataTypeCheck" Type="Integer" SkinID="skInteger" />
                                        <asp:ValidatorCalloutExtender ID="extStayMax" runat="server" TargetControlID="intStayMax"
                                            SkinID="skExtender" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Rate Received
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtRateReceived" runat="server" CssClass="TextBox" Text='<%# Bind("RateRecieved", "{0:d}") %>' />
                                        <asp:CalendarExtender ID="txtRateReceived_CalendarExtender" runat="server" ClearTime="True"
                                            CssClass="cal_Theme1" DaysModeTitleFormat="d" TargetControlID="txtRateReceived"
                                            TodaysDateFormat="d" />
                                        <asp:CompareValidator ID="datRateReceived" runat="server" ControlToValidate="txtRateReceived"
                                            CultureInvariantValues="True" Operator="DataTypeCheck" SkinID="skDate" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="datRateReceived_ValidatorCalloutExtender" runat="server"
                                            SkinID="skExtender" TargetControlID="datRateReceived" />
                                        <asp:RequiredFieldValidator ID="reqRRecived" runat="server" ControlToValidate="txtRateReceived"
                                            Display="None" ErrorMessage="Required Field">*</asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="reqxRRecived"
                                            runat="server" Enabled="True" TargetControlID="reqRRecived">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRowClear">
                                        Description
                                    </td>
                                    <td class="GridRowClear">
                                        <asp:TextBox ID="txtDescription" runat="server" CssClass="TextBox" Text='<%# Bind("Description") %>'
                                            TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow2T" colspan="4" style="text-align: right; padding-top: 5px;">
                                        <asp:Button ID="btUpdate" runat="server" Text="Save" SkinID="skBtnBase" CommandName="Insert" />&nbsp;
                                        <asp:Button ID="btCancel" runat="server" Text="Cancel" SkinID="skBtnBase" CommandName="Cancel" 
                                            CausesValidation="false"/>&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="GridRow2B" style="width: 100px; text-align: right;">
                                        [<asp:Label ID="IdLabel" runat="server" Text='<%# Eval("SpecialID") %>' />]&nbsp;
                                    </td>
                                    <td class="GridRow2B" style="width: 300px">
                                        <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' Font-Bold="true" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Hotel
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="HotelIdLabel" runat="server" Text='<%# Eval("Hotel") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Start
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="StartLabel" runat="server" Text='<%# Eval("Start", "{0:d}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        End
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="FinishLabel" runat="server" Text='<%# Eval("Finish", "{0:d}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Rate Received</td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="BkStartLabel" runat="server" 
                                            Text='<%# Eval("RateRecieved", "{0:d}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRowClear">
                                        Description</td>
                                    <td class="GridRowClear">
                                        <asp:Label ID="BkFinishLabel" runat="server" 
                                            Text='<%# Eval("Description") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow2T" style="text-align: left; padding-top: 5px;">
                                        <asp:Button ID="btDeactivate" runat="server" Text="Deactivate" 
                                            SkinID="skBtnBase" CommandName="Deactivate"
                                            Visible='False' />
                                        <asp:Button ID="btActivate" runat="server" Text="Activate" SkinID="skBtnBase" CommandName="Activate"
                                            Visible='False' />
                                    </td>
                                    <td class="GridRow2T" style="text-align: right; padding-top: 5px;">
                                        <asp:Button ID="btEdit" runat="server" Text="Edit" SkinID="skBtnBase" CommandName="Edit"
                                            CommandArgument='<%# Eval("StateId") %>' 
                                            Visible="<%# Master.CanEdit() %>" />&nbsp;
                                        <asp:Button ID="btnDelete" runat="server" Text="Delete" SkinID="skBtnBase" CommandName="Delete"
                                            OnClientClick="return confirm('Are you sure you want to delete the record')"
                                            CommandArgument='<%# Eval("StateId") %>' 
                                            Visible="False" />
                                            <%--Visible="<%# Master.CanEdit() %>" />--%>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:FormView>
                </td>
                <td class="GridBorder" valign="top">
                    <asp:FormView ID="fvSpec" runat="server" DataKeyNames="SpecialID" DataSourceID="dsSpec">
                        <EditItemTemplate>
                            <table cellspacing="0" cellpadding="0">
                                
                                <tr>
                                    <td class="SelectRow1B">
                                        Category
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:DropDownList ID="cdCategory" runat="server" CssClass="TextBox" DataSourceID="dsCategory"
                                            DataTextField="SpecialCategory" DataValueField="SpecialCategory" SelectedValue='<%# Bind("Category") %>'>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Booking Code
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtBookingCode" runat="server" CssClass="TextBox" Text='<%# Bind("BookingCode") %>' />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBookingCode"
                                            Display="None" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="RequiredFieldValidator1_ValidatorCalloutExtender"
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator1">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Rate Type
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="PerPaxIDLabel" runat="server" Text='<%# Eval("RateTypeId") %>' />&nbsp;
                                        <i>(<asp:Label ID="Label2" runat="server" Text='<%# Eval("RateCodeId") %>' />)</i>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Rate option
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:DropDownList ID="cbRateOption" runat="server" SelectedValue='<%# Bind("RateOption") %>'
                                            CssClass="TextBox">
                                            <asp:ListItem Value="1" Text="PerStay" />
                                            <asp:ListItem Value="0" Text="PerArrival" />
                                            <asp:ListItem Text="Inclusiv" Value="2" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Book.Start
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtBkStart" runat="server" Text='<%# Bind("BkStart","{0:d}") %>'
                                            CssClass="TextBox" />
                                        <asp:CalendarExtender ID="extBkStart" runat="server" TargetControlID="txtBkStart"
                                            TodaysDateFormat="d" CssClass="cal_Theme1" />
                                        <asp:CompareValidator ID="datBkStart" runat="server" ControlToValidate="txtBkStart" Display="None"
                                            Operator="DataTypeCheck" Type="Date" SkinID="skDate" ErrorMessage="Date input required" />
                                        <asp:ValidatorCalloutExtender ID="valBkStart" runat="server" TargetControlID="datBkStart"
                                            SkinID="skExtender" />
                                        <%--<asp:CompareValidator ID="cmpBkStart" runat="server" ControlToValidate="txtBkStart"
                                            Operator="LessThanEqual" Type="Date" SkinID="skDate" ControlToCompare="txtFinish" 
                                             ErrorMessage="Must be less or equal to End date." Display="None" />--%>
                                        <%--<asp:ValidatorCalloutExtender ID="vcmpBkStart" runat="server" TargetControlID="cmpBkStart"
                                            SkinID="skExtender" />--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Book.End
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtBkFinish" runat="server" Text='<%# Bind("BkFinish","{0:d}") %>'
                                            CssClass="TextBox" />
                                        <asp:CalendarExtender ID="extBkFinish" runat="server" TargetControlID="txtBkFinish"
                                            TodaysDateFormat="d" CssClass="cal_Theme1" />
                                        <asp:CompareValidator ID="datBkFinish" runat="server" ControlToValidate="txtBkFinish" Display="None"
                                            Operator="DataTypeCheck" Type="Date" SkinID="skDate" ErrorMessage="Date input required" />
                                        <asp:ValidatorCalloutExtender ID="valBkFinish" runat="server" TargetControlID="datBkFinish"
                                            SkinID="skExtender" />
                                        <%--<asp:CompareValidator ID="cmpBkFinish" runat="server" ControlToValidate="txtBkFinish"
                                            Operator="LessThanEqual" Type="Date" SkinID="skDate" ControlToCompare="txtFinish" 
                                             ErrorMessage="Must be less or equal to End date." Display="None" />--%>
                                        <%--<asp:ValidatorCalloutExtender ID="vcmpBkFinish" runat="server" TargetControlID="cmpBkFinish"
                                            SkinID="skExtender" />--%>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td class="SelectRow1B">
                                        Payment
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtPayment" runat="server" Text='<%# Bind("Payment","{0:d}") %>'
                                            CssClass="TextBox" />
                                        <asp:CalendarExtender ID="extPayment" runat="server" TargetControlID="txtPayment"
                                            TodaysDateFormat="d" CssClass="cal_Theme1" />
                                        <asp:CompareValidator ID="datPayment" runat="server" ControlToValidate="txtPayment"
                                            Operator="DataTypeCheck" Type="Date" SkinID="skDate" />
                                        <asp:ValidatorCalloutExtender ID="valPayment" runat="server" TargetControlID="datPayment"
                                            SkinID="skExtender" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Rooming list
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtRooming" runat="server" Text='<%# Bind("RoomingList","{0:d}") %>'
                                            CssClass="TextBox" />
                                        <asp:CalendarExtender ID="extRooming" runat="server" TargetControlID="txtRooming"
                                            TodaysDateFormat="d" CssClass="cal_Theme1" />
                                        <asp:CompareValidator ID="datRooming" runat="server" ControlToValidate="txtRooming"
                                            Operator="DataTypeCheck" Type="Date" SkinID="skDate" />
                                        <asp:ValidatorCalloutExtender ID="valRooming" runat="server" TargetControlID="datRooming"
                                            SkinID="skExtender" />
                                    </td>
                                </tr>
                              
                            </table>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <table cellspacing="0" cellpadding="0">
                                <tr>
                                    <td class="GridRow2B" style="width: 100px; text-align: right; font-weight: bold;">
                                        Special&nbsp;
                                    </td>
                                    <td class="GridRow2B" style="width: 300px">
                                        <asp:TextBox ID="txtSpecial" runat="server" CssClass="TextBox" Text='<%# Bind("Title") %>'
                                            Font-Bold="true" />
                                        <asp:TextBoxWatermarkExtender ID="wmSpecial" runat="server" TargetControlID="txtSpecial"
                                            WatermarkCssClass="WaterMark" WatermarkText="Title" />
                                        <asp:RequiredFieldValidator ID="valSpecial" runat="server" ControlToValidate="txtSpecial"
                                            Display="None" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="extSpecial"
                                            runat="server" Enabled="True" TargetControlID="valSpecial">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Hotel
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:DropDownList ID="cbHotelID" runat="server" CssClass="TextBox" DataSourceID="dsHotel"
                                            DataTextField="Hotel" DataValueField="HotelID" SelectedValue='<%# Bind("HotelId") %>'>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Category
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:DropDownList ID="cdCategory" runat="server" CssClass="TextBox" DataSourceID="dsCategory"
                                            DataTextField="SpecialCategory" DataValueField="SpecialCategory" SelectedValue='<%# Bind("Category") %>'>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Booking Code
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtBookingCode" runat="server" CssClass="TextBox" Text='<%# Bind("BookingCode") %>' />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBookingCode"
                                            Display="None" ErrorMessage="Required Field">*</asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="RequiredFieldValidator1_ValidatorCalloutExtender"
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator1">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Rate Type
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:DropDownList ID="ddlRateType" runat="server" CssClass="TextBox" DataSourceID="dsRateType"
                                            DataTextField="RateTypeID" DataValueField="RateTypeID" SelectedValue='<%# Bind("RateTypeId") %>'>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Rate option
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:DropDownList ID="cbRateOption" runat="server" SelectedValue='<%# Bind("RateOption") %>'
                                            CssClass="TextBox">
                                            <asp:ListItem Value="1" Text="PerStay" />
                                            <asp:ListItem Value="0" Text="PerArrival" />
                                            <asp:ListItem Text="Inclusiv" Value="2" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Start
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtStart" runat="server" Text='<%# Bind("Start", "{0:d}") %>' CssClass="TextBox" />
                                        <asp:CalendarExtender ID="extStart" runat="server" TargetControlID="txtStart" TodaysDateFormat="d"
                                            DaysModeTitleFormat="d" ClearTime="True" CssClass="cal_Theme1" />
                                        <asp:CompareValidator ID="datStart" runat="server" ControlToValidate="txtStart" Operator="DataTypeCheck"
                                            Type="Date" SkinID="skDate" ErrorMessage="Date input required" Display="None" />
                                        <asp:ValidatorCalloutExtender ID="valStart" runat="server" TargetControlID="datStart"
                                            SkinID="skExtender" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtStart"
                                            Display="None" ErrorMessage="Required Field">*</asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="RequiredFieldValidator2_ValidatorCalloutExtender"
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator2">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        End
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtFinish" runat="server" Text='<%# Bind("Finish","{0:d}") %>' CssClass="TextBox" />
                                        <asp:CalendarExtender ID="extFinish" runat="server" TargetControlID="txtFinish" TodaysDateFormat="d"
                                            CssClass="cal_Theme1" />
                                        <asp:CompareValidator ID="datFinish" runat="server" ControlToValidate="txtFinish" Display="None"
                                            Operator="DataTypeCheck" Type="Date" SkinID="skDate" ErrorMessage="Date input required" />
                                        <asp:ValidatorCalloutExtender ID="valFinish" runat="server" TargetControlID="datFinish"
                                            SkinID="skExtender" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFinish"
                                            Display="None" ErrorMessage="Required Field">*</asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="RequiredFieldValidator3_ValidatorCalloutExtender"
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator3">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Book.Start
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtBkStart" runat="server" Text='<%# Bind("BkStart","{0:d}") %>'
                                            CssClass="TextBox" />
                                        <asp:CalendarExtender ID="extBkStart" runat="server" TargetControlID="txtBkStart"
                                            TodaysDateFormat="d" CssClass="cal_Theme1" />
                                        <asp:CompareValidator ID="datBkStart" runat="server" ControlToValidate="txtBkStart" Display="None"
                                            Operator="DataTypeCheck" Type="Date" SkinID="skDate" ErrorMessage="Date input required" />
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
                                    <td class="SelectRow1B">
                                        Book.End
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtBkFinish" runat="server" Text='<%# Bind("BkFinish","{0:d}") %>'
                                            CssClass="TextBox" />
                                        <asp:CalendarExtender ID="extBkFinish" runat="server" TargetControlID="txtBkFinish"
                                            TodaysDateFormat="d" CssClass="cal_Theme1" />
                                        <asp:CompareValidator ID="datBkFinish" runat="server" ControlToValidate="txtBkFinish" Display="None"
                                            Operator="DataTypeCheck" Type="Date" SkinID="skDate" ErrorMessage="Date input required" />
                                        <asp:ValidatorCalloutExtender ID="valBkFinish" runat="server" TargetControlID="datBkFinish"
                                            SkinID="skExtender" />
                                        <asp:CompareValidator ID="cmpBkFinish" runat="server" ControlToValidate="txtBkFinish"
                                            Operator="LessThanEqual" Type="Date" SkinID="skDate" ControlToCompare="txtFinish" 
                                             ErrorMessage="Must be less or equal to End date." Display="None" />
                                        <asp:ValidatorCalloutExtender ID="vcmpBkFinish" runat="server" TargetControlID="cmpBkFinish"
                                            SkinID="skExtender" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRowClear" colspan="2">
                                        Discounts
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear" colspan="2">
                                        <table cellpadding="0" cellspacing="2px">
                                            <tr>
                                                <td class="SelectRow1TB" style="width: 100px;">
                                                    Primary
                                                </td>
                                                <td class="GridRow1TB" style="width: 150px;">
                                                    <asp:DropDownList ID="cbPrType" runat="server" CssClass="TextBox" />
                                                    <asp:CascadingDropDown ID="exPrType" runat="server" TargetControlID="cbPrType" Category="PrTypeID"
                                                        ContextKey="Pr" SelectedValue='<%# Bind("PrDiscountTypeId") %>' ServicePath="~/SpecDisc.asmx"
                                                        ServiceMethod="GetTypeID" UseContextKey="True">
                                                    </asp:CascadingDropDown>
                                                </td>
                                                <td class="GridRow1TB" style="width: 50px; padding-right: 5px; text-align: right;">
                                                    On
                                                </td>
                                                <td class="GridRow1TB" style="width: 100px;">
                                                    <asp:DropDownList ID="cbPrOn" runat="server" CssClass="TextBox" />
                                                    <asp:CascadingDropDown ID="exPrOn" runat="server" TargetControlID="cbPrOn" ParentControlID="cbPrType"
                                                        Category="PrTypeOn" ContextKey="Pr" SelectedValue='<%# Bind("PrDiscountOn") %>'
                                                        ServicePath="~/SpecDisc.asmx" ServiceMethod="GetOn" UseContextKey="True">
                                                    </asp:CascadingDropDown>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="SelectRow1B" style="text-indent: 20px">
                                                    Discount
                                                </td>
                                                <td class="GridRow1B">
                                                    <asp:DropDownList ID="cbPrDisc" runat="server" CssClass="TextBox" />
                                                    <asp:CascadingDropDown ID="exPrDisc" runat="server" TargetControlID="cbPrDisc" ParentControlID="cbPrType"
                                                        Category="PrDisc" ContextKey="Pr" SelectedValue='<%# Bind("PrDiscount") %>' ServicePath="~/SpecDisc.asmx"
                                                        ServiceMethod="GetDiscount" UseContextKey="True">
                                                    </asp:CascadingDropDown>
                                                </td>
                                                <td class="GridRow1B">
                                                    &nbsp;
                                                </td>
                                                <td class="GridRow1B">
                                                    <asp:CheckBox ID="cbPropagate" runat="server" Text="Average" Checked='<%# Bind("PrPropagate") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="SelectRow1B">
                                                    Secondary
                                                </td>
                                                <td class="GridRow1B">
                                                    <asp:DropDownList ID="cbScType" runat="server" CssClass="TextBox" />
                                                    <asp:CascadingDropDown ID="exScType" runat="server" TargetControlID="cbScType" Category="ScTypeID"
                                                        ContextKey="Sc" SelectedValue='<%# Bind("ScDiscountTypeId") %>' ServicePath="~/SpecDisc.asmx"
                                                        ServiceMethod="GetTypeID" UseContextKey="True">
                                                    </asp:CascadingDropDown>
                                                </td>
                                                <td class="GridRow1TB" style="width: 50px; padding-right: 5px; text-align: right;">
                                                    On
                                                </td>
                                                <td class="GridRow1B">
                                                    <asp:DropDownList ID="cbScOn" runat="server" CssClass="TextBox" />
                                                    <asp:CascadingDropDown ID="exScOn" runat="server" TargetControlID="cbScOn" ParentControlID="cbScType"
                                                        Category="ScTypeOn" ContextKey="Sc" SelectedValue='<%# Bind("ScDiscountOn") %>'
                                                        ServicePath="~/SpecDisc.asmx" ServiceMethod="GetOn" UseContextKey="True">
                                                    </asp:CascadingDropDown>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="SelectRow1B" style="text-indent: 20px">
                                                    Discount
                                                </td>
                                                <td class="GridRow1B">
                                                    <asp:DropDownList ID="cbScDisc" runat="server" CssClass="TextBox" />
                                                    <asp:CascadingDropDown ID="exScDisc" runat="server" TargetControlID="cbScDisc" ParentControlID="cbScType"
                                                        Category="ScDisc" ContextKey="Sc" SelectedValue='<%# Bind("ScDiscount") %>' ServicePath="~/SpecDisc.asmx"
                                                        ServiceMethod="GetDiscount" UseContextKey="True">
                                                    </asp:CascadingDropDown>
                                                </td>
                                                <td class="GridRow1B">
                                                    &nbsp;
                                                </td>
                                                <td class="GridRow1B">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Payment
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtPayment" runat="server" Text='<%# Bind("Payment","{0:d}") %>'
                                            CssClass="TextBox" />
                                        <asp:CalendarExtender ID="extPayment" runat="server" TargetControlID="txtPayment"
                                            TodaysDateFormat="d" CssClass="cal_Theme1" />
                                        <asp:CompareValidator ID="datPayment" runat="server" ControlToValidate="txtPayment"
                                            Operator="DataTypeCheck" Type="Date" SkinID="skDate" />
                                        <asp:ValidatorCalloutExtender ID="valPayment" runat="server" TargetControlID="datPayment"
                                            SkinID="skExtender" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Rooming list
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtRooming" runat="server" Text='<%# Bind("RoomingList","{0:d}") %>'
                                            CssClass="TextBox" />
                                        <asp:CalendarExtender ID="extRooming" runat="server" TargetControlID="txtRooming"
                                            TodaysDateFormat="d" CssClass="cal_Theme1" />
                                        <asp:CompareValidator ID="datRooming" runat="server" ControlToValidate="txtRooming"
                                            Operator="DataTypeCheck" Type="Date" SkinID="skDate" />
                                        <asp:ValidatorCalloutExtender ID="valRooming" runat="server" TargetControlID="datRooming"
                                            SkinID="skExtender" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Min.Stay
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtStayMin" runat="server" CssClass="TextBox" Text='<%# Bind("StayCriteriaMin") %>'></asp:TextBox>
                                        <asp:CompareValidator ID="intStayMin" runat="server" ControlToValidate="txtStayMin"
                                            Operator="DataTypeCheck" Type="Integer" SkinID="skInteger" />
                                        <asp:ValidatorCalloutExtender ID="extStayMin" runat="server" TargetControlID="intStayMin"
                                            SkinID="skExtender" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Max.Stay
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtStayMax" runat="server" CssClass="TextBox" Text='<%# Bind("StayCriteriaMax") %>'></asp:TextBox>
                                        <asp:CompareValidator ID="intStayMax" runat="server" ControlToValidate="txtStayMax"
                                            Operator="DataTypeCheck" Type="Integer" SkinID="skInteger" />
                                        <asp:ValidatorCalloutExtender ID="extStayMax" runat="server" TargetControlID="intStayMax"
                                            SkinID="skExtender" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Rate Received
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtRateReceived" runat="server" CssClass="TextBox" Text='<%# Bind("RateRecieved", "{0:d}") %>' />
                                        <asp:CalendarExtender ID="txtRateReceived_CalendarExtender" runat="server" ClearTime="True"
                                            CssClass="cal_Theme1" DaysModeTitleFormat="d" TargetControlID="txtRateReceived"
                                            TodaysDateFormat="d" />
                                        <asp:CompareValidator ID="datRateReceived" runat="server" ControlToValidate="txtRateReceived"
                                            CultureInvariantValues="True" Operator="DataTypeCheck" SkinID="skDate" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="datRateReceived_ValidatorCalloutExtender" runat="server"
                                            SkinID="skExtender" TargetControlID="datRateReceived" />
                                        <asp:RequiredFieldValidator ID="reqRRecived" runat="server" ControlToValidate="txtRateReceived"
                                            Display="None" ErrorMessage="Required Field">*</asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="reqxRRecived"
                                            runat="server" Enabled="True" TargetControlID="reqRRecived">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRowClear">
                                        Description
                                    </td>
                                    <td class="GridRowClear">
                                        <asp:TextBox ID="txtDescription" runat="server" CssClass="TextBox" Text='<%# Bind("Description") %>'
                                            TextMode="MultiLine"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow2T" colspan="4" style="text-align: right; padding-top: 5px;">
                                        <asp:Button ID="btUpdate" runat="server" Text="Save" SkinID="skBtnBase" CommandName="Insert" />&nbsp;
                                        <asp:Button ID="btCancel" runat="server" Text="Cancel" SkinID="skBtnBase" CommandName="Cancel" 
                                            CausesValidation="false" />&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="SelectRow1B">
                                        Category
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Category") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Booking Code
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="BookingCodeLabel" runat="server" Text='<%# Eval("BookingCode") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Rate Type
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="PerPaxIDLabel" runat="server" Text='<%# Bind("RateTypeId") %>' />&nbsp;
                                        <i>(<asp:Label ID="Label2" runat="server" Text='<%# Bind("RateCodeId") %>' />)</i>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Rate Option
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="RateOptionLabel" runat="server" Text='<%# Eval("RateOptionDisp") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Book.Start
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="BkStartLabel" runat="server" Text='<%# Eval("BkStart", "{0:d}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Book.End
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="BkFinishLabel" runat="server" Text='<%# Eval("BkFinish", "{0:d}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Payment
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="PaymentLabel" runat="server" Text='<%# Eval("Payment", "{0:d}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Rooming list
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="RoomingListLabel" runat="server" Text='<%# Eval("RoomingList", "{0:d}") %>' />
                                    </td>
                                </tr>
                                
                            </table>
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:ObjectDataSource ID="dsSpec" runat="server" DeleteMethod="Delete" InsertMethod="InsertQuery"
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataFull" TypeName="dsSpecialTableAdapters.SpecialTableAdapter"
                        UpdateMethod="UpdateFRS">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_SpecialID" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Category" Type="String" />
                            <asp:Parameter Name="BookingCode" Type="String" />
                            <asp:Parameter Name="RateOption" Type="Int16" />
                            <asp:Parameter Name="BkStart" Type="DateTime" />
                            <asp:Parameter Name="BkFinish" Type="DateTime" />
                            <asp:Parameter Name="Payment" Type="DateTime" />
                            <asp:Parameter Name="RoomingList" Type="DateTime" />
                            <asp:ControlParameter ControlID="hfUsername" Name="UserName" 
                                PropertyName="Value" Type="String" />
                            <asp:Parameter Name="Original_SpecialID" Type="Int32" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfSpecialID" DefaultValue="" Name="SpecialID" 
                                PropertyName="Value" Type="Int32" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:Parameter Name="HotelId" Type="Int32" />
                            <asp:Parameter Name="Category" Type="String" />
                            <asp:Parameter Name="BookingCode" Type="String" />
                            <asp:Parameter Name="RateOption" Type="Int16" />
                            <asp:Parameter Name="Start" Type="DateTime" />
                            <asp:Parameter Name="Finish" Type="DateTime" />
                            <asp:Parameter Name="BkStart" Type="DateTime" />
                            <asp:Parameter Name="BkFinish" Type="DateTime" />
                            <asp:Parameter Name="Payment" Type="DateTime" />
                            <asp:Parameter Name="RoomingList" Type="DateTime" />
                            <asp:Parameter Name="StayCriteriaMin" Type="Int16" />
                            <asp:Parameter Name="StayCriteriaMax" Type="Int16" />
                            <asp:Parameter Name="PrDiscountTypeId" Type="Int32" />
                            <asp:Parameter Name="PrPropagate" Type="Boolean" />
                            <asp:Parameter Name="PrDiscountOn" Type="String" />
                            <asp:Parameter Name="PrDiscount" Type="Decimal" />
                            <asp:Parameter Name="ScDiscountTypeId" Type="Int32" />
                            <asp:Parameter Name="ScDiscountOn" Type="String" />
                            <asp:Parameter Name="ScDiscount" Type="Decimal" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="StateId" Type="Int32" />
                            <asp:Parameter Name="CtrEBB" Type="Boolean" DefaultValue="False" />
                            <asp:Parameter Name="RateTypeId" Type="String" />
                            <asp:Parameter Name="Title" Type="String" />
                            <asp:Parameter Name="RateRecieved" Type="DateTime" />
                            <asp:ControlParameter ControlID="hfUsername" Name="UserName" 
                                PropertyName="Value" Type="String" />
                            <asp:Parameter Direction="InputOutput" Name="NewID" Type="Int32" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="dsCategory" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="dsSpecialTableAdapters.SpecialCategoryTableAdapter">
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="dsHotel" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="dsSpecialTableAdapters.HotelTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfUsername" Name="UserName" 
                                PropertyName="Value" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="dsRateType" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetSpecialRate" TypeName="dsSpecialTableAdapters.RateTypeTableAdapter">
                    </asp:ObjectDataSource>
                </td>
                <asp:Panel ID="pnlMP" runat="server" Enabled="false">  <%--Enabled="False"--%>
                    <td class="GridBorder" valign="top">
                        <table>
                            <tr>
                                <td>
                                   <%-- <asp:CheckBox ID="cbAllMP" runat="server" CssClass="GridRow1B" Font-Bold="True" Font-Underline="False"
                                        Text="All Meal Plans" Width="140px" AutoPostBack="True" Style="margin-bottom: 2px;" />--%>
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <asp:GridView ID="gridMealPlan" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        DataKeyNames="MealPlanID,ContractID" DataSourceID="dsMealPlan" SkinID="skGridView" ShowHeader="True">
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
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 30px; text-align: right;">
                                    <asp:Button ID="btnUpdate" runat="server" SkinID="skBtnBase" Text="Update" Visible="False" />
                                </td>
                            </tr>
                        </table>
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
                </asp:Panel>
                <asp:Panel ID="pnlRoom" runat="server" Enabled="false" Visible="False">
                    <td class="GridBorder" valign="top">
                        <table>
                            <tr>
                                <td>
                                    <asp:CheckBox ID="cbAllRooms" runat="server" CssClass="GridRow1B" Font-Bold="True"
                                        Font-Underline="False" Text="All Rooms" Width="140px" AutoPostBack="True" Style="margin-bottom: 2px;" />
                                    <asp:UpdatePanel ID="UpdatePanelRoom" runat="server">
                                        <ContentTemplate>
                                            <asp:GridView ID="gridRoomType" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                                                DataSourceID="dsRoomType" SkinID="skGridView" Width="100%" DataKeyNames="SpecialID,RoomTypeID"
                                                ShowHeader="False">
                                                <Columns>
                                                    <asp:BoundField DataField="SpecialID" HeaderText="SpecialID" ReadOnly="True" SortExpression="SpecialID"
                                                        Visible="False" />
                                                    <asp:TemplateField SortExpression="SelectedRT">
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("SelectedRT") %>' />
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:CheckBox ID="CheckBox3" runat="server" Checked='<%# Bind("SelectedRT") %>' />
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
                        <asp:ObjectDataSource ID="dsRoomType" runat="server" SelectMethod="GetData" TypeName="dsSpecialTableAdapters.SelectSpecialRoomTableAdapter"
                            UpdateMethod="SpecialRoomUpdate" OldValuesParameterFormatString="{0}">
                            <UpdateParameters>
                                <asp:Parameter Name="SpecialID" Type="Int32" />
                                <asp:Parameter Name="RoomTypeId" Type="String" />
                                <asp:Parameter Name="SelectedRT" Type="Boolean" />
                            </UpdateParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="hfSpecialID" DefaultValue="" Name="SpecialID" 
                                PropertyName="Value" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </td>
                </asp:Panel>
            </tr>
        </table>
        <asp:ObjectDataSource ID="dsContractDetail" runat="server" 
            DeleteMethod="Delete" SelectMethod="GetDataByContractID" TypeName="dsSpecialTableAdapters.ContractTableAdapter"
            UpdateMethod="UpdateDetail" InsertMethod="Insert" 
            OldValuesParameterFormatString="original_{0}">
            <DeleteParameters>
                <asp:Parameter Name="Original_ContractID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Start" Type="DateTime" />
                <asp:Parameter Name="Finish" Type="DateTime" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="RateRecieved" Type="DateTime" />
                <asp:Parameter Name="Original_ContractID" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="ContractID" QueryStringField="ContractID" Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="Template" Type="Boolean" />
                <asp:Parameter Name="HotelId" Type="Int32" />
                <asp:Parameter Name="MarketId" Type="String" />
                <asp:Parameter Name="Start" Type="DateTime" />
                <asp:Parameter Name="Finish" Type="DateTime" />
                <asp:Parameter Name="Commision" Type="Decimal" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="Year" Type="Int16" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="StateId" Type="Int32" />
                <asp:Parameter Name="CopyId" Type="Int32" />
                <asp:Parameter Name="TourOpId" Type="Int32" />
                <asp:Parameter Name="RateRecieved" Type="DateTime" />
                <asp:Parameter Name="SpecialID" Type="Int32" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="Created" Type="DateTime" />
                <asp:Parameter Name="LastUpdate" Type="DateTime" />
            </InsertParameters>
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
