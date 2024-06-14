<%@ Page Title="" Language="VB" MasterPageFile="~/Contracts/Special/masterSpecial.master"
    AutoEventWireup="false" EnableEventValidation="false" CodeFile="DetailSpec.aspx.vb"
    Inherits="Contracts_Special_DetailSpec" %>

<%@ MasterType VirtualPath="~/Contracts/Special/masterSpecial.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Special Detail
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="WizardContent" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <div class="Blue">
        <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
        </asp:ScriptManagerProxy>
        <table cellpadding="0" cellspacing="2">
            <tr>
                <td class="GridLabelBG" colspan="3">
                    <asp:Label ID="lbDetails" runat="server" Text="Special details" SkinID="skGridLabel" />
                    <asp:LinkButton ID="btCopy" runat="server" CssClass="GridLabel" Text="Copy Special"
                        Style="float: right; background-color: transparent; color: White; padding-right: 20px;" />
                </td>
            </tr>
            <asp:Panel ID="pnlCopy" runat="server" Visible="false">
            <tr class="Red">
                <td valign="top" class="GridBorder" colspan="3">
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
                                            runat="server" Enabled="True" TargetControlID="RequiredFieldValidator2" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow2B">
                                        Hotel
                                    </td>
                                    <td class="GridRow2B">
                                        <asp:DropDownList ID="ddlCopyHotels" runat="server" CssClass="TextBox" DataSourceID="dsHotel"
                                            DataTextField="Hotel" DataValueField="HotelID" SelectedValue='<%# Bind("HotelId") %>'
                                            Enabled='<%# Eval("NotFR") %>'>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow2B">
                                        Modify ±
                                    </td>
                                    <td class="GridRow2B">
                                        <asp:TextBox ID="txtCopyModify" runat="server" CssClass="TextBox" Width="50px"/>
                                        &nbsp;<b>%</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: right; padding-top: 5px;">
                                        <asp:Button ID="btCopySave" runat="server" Text="Copy" SkinID="skBtnBase" OnClientClick="return confirm('Are you sure you want to copy this special?')"
                                            OnClick="btCopySave_Click" />&nbsp;
                                        <asp:Button ID="btCopyCancel" runat="server" Text="Cancel" SkinID="skBtnBase" CausesValidation="false"
                                            OnClick="btCopyCancel_Click" />
                                    </td>
                                </tr>
                            </table>
                        </EditItemTemplate>
                    </asp:FormView>
                    <asp:ObjectDataSource ID="dsCopy" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="dsSpecialTableAdapters.SpecialCopyTableAdapter">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="SpecialID" QueryStringField="SpecialID" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    &nbsp;
                </td>
            </tr>
            </asp:Panel>
            <tr>
                <td class="GridBorder" valign="top" rowspan="3">
                    <asp:FormView ID="fvSpec" runat="server" DataKeyNames="SpecialID" DataSourceID="dsSpec">
                        <EditItemTemplate>
                            <table cellspacing="0" cellpadding="0">
                                <tr>
                                    <td class="GridRow2B" style="width: 100px; text-align: right;">
                                        [<asp:Label ID="IdLabel" runat="server" Text='<%# Eval("SpecialID") %>' />]&nbsp;
                                    </td>
                                    <td class="GridRow2B" style="width: 300px">
                                        <asp:TextBox ID="txtSpecial" runat="server" CssClass="TextBox" Text='<%# Bind("Title") %>'
                                            Font-Bold="true" />
                                        <asp:RequiredFieldValidator ID="valSpecial" runat="server" ControlToValidate="txtSpecial"
                                            Display="None" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="extSpecial" runat="server" Enabled="True" TargetControlID="valSpecial">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Hotel
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Hotel") %>' />
                                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("HotelId") %>' />
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
                                        <asp:Label ID="PerPaxIDLabel" runat="server" Text='<%# Bind("RateTypeId") %>' />&nbsp;
                                        <i>(<asp:Label ID="Label2" runat="server" Text='<%# Bind("RateCodeId") %>' />)</i>
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
                                        <asp:CompareValidator ID="datFinish" runat="server" ControlToValidate="txtFinish"
                                            Display="None" Operator="DataTypeCheck" Type="Date" SkinID="skDate" ErrorMessage="Date input required" />
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
                                    <td class="SelectRow1B">
                                        Book.End
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtBkFinish" runat="server" Text='<%# Bind("BkFinish","{0:d}") %>'
                                            CssClass="TextBox" />
                                        <asp:CalendarExtender ID="extBkFinish" runat="server" TargetControlID="txtBkFinish"
                                            TodaysDateFormat="d" CssClass="cal_Theme1" />
                                        <asp:CompareValidator ID="datBkFinish" runat="server" ControlToValidate="txtBkFinish"
                                            Display="None" Operator="DataTypeCheck" Type="Date" SkinID="skDate" ErrorMessage="Date input required" />
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
                                        <asp:Panel ID="pnlNotFR" runat="server" Visible='<%# Eval("PrDiscountTypeId")<>6 %>'>
                                            <table cellpadding="0" cellspacing="2px">
                                                <tr>
                                                    <td class="SelectRow1TB" style="width: 100px;">
                                                        Primary
                                                    </td>
                                                    <td class="GridRow1TB" style="width: 150px;">
                                                        <asp:DropDownList ID="cbPrType" runat="server" CssClass="TextBox" />
                                                        <asp:CascadingDropDown ID="exPrType" runat="server" TargetControlID="cbPrType" Category="PrTypeID"
                                                            ContextKey="Pr" SelectedValue='<%# Bind("PrDiscountTypeId") %>' ServicePath="~/SpecDisc.asmx"
                                                            ServiceMethod="GetEdTypeID" UseContextKey="True">
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
                                                        <%--<asp:CascadingDropDown ID="exPrDisc" runat="server" TargetControlID="cbPrDisc" ParentControlID="cbPrType"
                                                            Category="PrDisc" ContextKey="Pr" SelectedValue='<%# Bind("PrDiscount") %>' ServicePath="~/SpecDisc.asmx"
                                                            ServiceMethod="GetDiscount" UseContextKey="True">
                                                        </asp:CascadingDropDown>--%>
                                                        <asp:CascadingDropDown ID="exPrDisc" runat="server" TargetControlID="cbPrDisc" ParentControlID="cbPrType"
                                                            Category='<%#  Iif(Eval("PrDiscount") is DBNull.Value,"0",Eval("PrDiscount")) %>' ContextKey="Pr" SelectedValue='<%# Bind("PrDiscount") %>' ServicePath="~/SpecDisc.asmx"
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
                                                    <td class="GridRow1B" style="width: 50px; padding-right: 5px; text-align: right;">
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
                                                        <%--<asp:CascadingDropDown ID="exScDisc" runat="server" TargetControlID="cbScDisc" ParentControlID="cbScType"
                                                            Category="ScDisc" ContextKey="Sc" SelectedValue='<%# Bind("ScDiscount") %>' ServicePath="~/SpecDisc.asmx"
                                                            ServiceMethod="GetDiscount" UseContextKey="True">
                                                        </asp:CascadingDropDown>--%>
                                                        <asp:CascadingDropDown ID="exScDisc" runat="server" TargetControlID="cbScDisc" ParentControlID="cbScType"
                                                            Category='<%# Iif(Eval("ScDiscount") is DBNull.Value,"0",Eval("ScDiscount")) %>' ContextKey="Sc" SelectedValue='<%# Bind("ScDiscount") %>' ServicePath="~/SpecDisc.asmx"
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
                                        </asp:Panel>
                                        <asp:Panel ID="pnlFR" runat="server" Visible='<%# Eval("PrDiscountTypeId")=6 %>'>
                                            <table cellpadding="0" cellspacing="2px">
                                                <tr>
                                                    <td class="SelectRow1TB" style="width: 100px;">
                                                        Primary
                                                    </td>
                                                    <td class="GridRow1TB" style="width: 150px;">
                                                        <asp:Label ID="PrOnLabel0" runat="server" Text='<%# Eval("PrType") %>' />&nbsp;
                                                    </td>
                                                    <td class="GridRow1TB" style="width: 50px; padding-right: 5px; text-align: right;">
                                                        <asp:Label ID="PrOnLabel1" runat="server" Text="on" Visible='<%# Eval("PrOn")<>"-" %>' />
                                                    </td>
                                                    <td class="GridRow1TB" style="width: 100px;">
                                                        <asp:Label ID="PrOnLabel2" runat="server" Text='<%# Eval("PrOn") %>' Visible='<%# Eval("PrOn")<>"-" %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="SelectRow1B" style="text-indent: 20px">
                                                        Discount
                                                    </td>
                                                    <td class="GridRow1B">
                                                        <asp:Label ID="ScDiscountOnLabel1" runat="server" Text='<%# Eval("PrDiscount") %>' />
                                                    </td>
                                                    <td class="GridRow1B">
                                                        &nbsp;
                                                    </td>
                                                    <td class="GridRow1B">
                                                        <asp:CheckBox ID="cbEPropagate" runat="server" Text="Average" Checked='<%# Eval("PrPropagate") %>'
                                                            Enabled="false" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="SelectRow1B">
                                                        Secondary
                                                    </td>
                                                    <td class="GridRow1B">
                                                        <asp:Label ID="ScOnLabel0" runat="server" Text='<%# Eval("ScType") %>' />
                                                    </td>
                                                    <td class="GridRow1B" style="width: 50px; padding-right: 5px; text-align: right;">
                                                        <asp:Label ID="ScOnLabel1" runat="server" Text="on" Visible='<%# Eval("ScOn")<>"-" %>' />
                                                    </td>
                                                    <td class="GridRow1B">
                                                        <asp:Label ID="ScOnLabel2" runat="server" Text='<%# Eval("ScOn") %>' Visible='<%# Eval("ScOn")<>"-" %>' />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="SelectRow1B" style="text-indent: 20px">
                                                        Discount
                                                    </td>
                                                    <td class="GridRow1B">
                                                        <asp:Label ID="ScDiscountOnLabel3" runat="server" Text='<%# Eval("ScDiscount") %>' />
                                                    </td>
                                                    <td class="GridRow1B">
                                                        &nbsp;
                                                    </td>
                                                    <td class="GridRow1B">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
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
                                        <asp:ValidatorCalloutExtender ID="reqxRRecived" runat="server" Enabled="True" TargetControlID="reqRRecived">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRowClear">
                                        Description
                                    </td>
                                    <td class="GridRowClear">
                                        <asp:TextBox ID="txtDescription" runat="server" CssClass="TextBox" Text='<%# Bind("Description") %>'
                                            TextMode="MultiLine" MaxLength="512"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow2T" colspan="4" style="text-align: right; padding-top: 5px;">
                                        <asp:Button ID="btUpdate" runat="server" Text="Update" SkinID="skBtnBase" CommandName="Update" />&nbsp;
                                        <asp:Button ID="btCancel" runat="server" Text="Cancel" SkinID="skBtnBase" CommandName="Cancel"
                                            CausesValidation="false" />&nbsp;
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
                                            Font-Bold="true" MaxLength="30" />
                                        <asp:TextBoxWatermarkExtender ID="wmSpecial" runat="server" TargetControlID="txtSpecial"
                                            WatermarkCssClass="WaterMark" WatermarkText="Title" />
                                        <asp:RequiredFieldValidator ID="valSpecial" runat="server" ControlToValidate="txtSpecial"
                                            Display="None" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="extSpecial" runat="server" Enabled="True" TargetControlID="valSpecial">
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
                                        <asp:TextBox ID="txtBookingCode" runat="server" CssClass="TextBox" Text='<%# Bind("BookingCode") %>'
                                            MaxLength="10" />
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
                                        <asp:CompareValidator ID="datFinish" runat="server" ControlToValidate="txtFinish"
                                            Display="None" Operator="DataTypeCheck" Type="Date" SkinID="skDate" ErrorMessage="Date input required" />
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
                                    <td class="SelectRow1B">
                                        Book.End
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtBkFinish" runat="server" Text='<%# Bind("BkFinish","{0:d}") %>'
                                            CssClass="TextBox" />
                                        <asp:CalendarExtender ID="extBkFinish" runat="server" TargetControlID="txtBkFinish"
                                            TodaysDateFormat="d" CssClass="cal_Theme1" />
                                        <asp:CompareValidator ID="datBkFinish" runat="server" ControlToValidate="txtBkFinish"
                                            Display="None" Operator="DataTypeCheck" Type="Date" SkinID="skDate" ErrorMessage="Date input required" />
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
                                        <asp:ValidatorCalloutExtender ID="reqxRRecived" runat="server" Enabled="True" TargetControlID="reqRRecived">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRowClear">
                                        Description
                                    </td>
                                    <td class="GridRowClear">
                                        <asp:TextBox ID="txtDescription" runat="server" CssClass="TextBox" Text='<%# Bind("Description") %>'
                                            TextMode="MultiLine" MaxLength="250"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow2T" colspan="2" style="text-align: right; padding-top: 5px;">
                                        <asp:Button ID="btUpdate" runat="server" Text="Save" SkinID="skBtnBase" CommandName="Insert" />&nbsp;
                                        <asp:Button ID="btCancel" runat="server" Text="Cancel" SkinID="skBtnBase" CommandName="Cancel"
                                            CausesValidation="false" OnClick="btCancel_Click" />&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="GridRow2B" colspan="2">
                                        <asp:FormView ID="fvTitle" runat="server" DataKeyNames="SpecialID" DataSourceID="dsSpecTitle">
                                            <ItemTemplate>
                                                <table cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td style="width: 345px;">
                                                            [<asp:Label ID="IdLabel" runat="server" Text='<%# Eval("SpecialID") %>' />]&nbsp;
                                                            <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' Font-Bold="true" />
                                                        </td>
                                                        <td style="width: 50px;">
                                                            <asp:ImageButton ID="btTitleEdit" runat="server" CausesValidation="False" CommandName="Edit"
                                                                ImageUrl="~/Images/edit_inline.gif" Visible='<%# Eval("StateId") > 0 %>' />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <table cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td style="width: 345px;">
                                                            [<asp:Label ID="IdLabel" runat="server" Text='<%# Eval("SpecialID") %>' />]&nbsp;
                                                            <asp:TextBox ID="txtSpecial" runat="server" CssClass="TextBox" Font-Bold="true" Width="290px"
                                                                Text='<%# Bind("Title") %>' />
                                                            <asp:RequiredFieldValidator ID="valSpecial" runat="server" Display="None" ErrorMessage="Required Field"
                                                                ControlToValidate="txtSpecial" />
                                                            <asp:ValidatorCalloutExtender ID="extSpecial" runat="server" Enabled="True" TargetControlID="valSpecial" />
                                                        </td>
                                                        <td style="width: 50px;">
                                                            <asp:ImageButton ID="btTitleUpdate" runat="server" CausesValidation="True" CommandName="Update"
                                                                ImageUrl="~/Images/accept_inline.gif" CssClass="ImgButton" />
                                                            <asp:ImageButton ID="btTitleCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                                                ImageUrl="~/Images/decline_inline.gif" CssClass="ImgButton" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </EditItemTemplate>
                                        </asp:FormView>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="width: 100px;">
                                        Hotel
                                    </td>
                                    <td class="GridRow1B" style="width: 300px;">
                                        <asp:Label ID="HotelIdLabel" runat="server" Text='<%# Eval("Hotel") %>' />
                                    </td>
                                </tr>
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
                                                    <asp:Label ID="PrOnLabel0" runat="server" Text='<%# Eval("PrType") %>' />&nbsp;
                                                </td>
                                                <td class="GridRow1TB" style="width: 50px; padding-right: 5px; text-align: right;">
                                                    <asp:Label ID="PrOnLabel1" runat="server" Text="on" Visible='<%# Eval("PrOn")<>"-" %>' />
                                                </td>
                                                <td class="GridRow1TB" style="width: 100px;">
                                                    <asp:Label ID="PrOnLabel2" runat="server" Text='<%# Eval("PrOn") %>' Visible='<%# Eval("PrOn")<>"-" %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="SelectRow1B" style="text-indent: 20px">
                                                    Discount
                                                </td>
                                                <td class="GridRow1B">
                                                    <asp:Label ID="ScDiscountOnLabel1" runat="server" Text='<%# Eval("PrDiscount") %>' />
                                                </td>
                                                <td class="GridRow1B">
                                                    &nbsp;
                                                </td>
                                                <td class="GridRow1B">
                                                    <asp:CheckBox ID="cbEPropagate" runat="server" Text="Average" Checked='<%# Eval("PrPropagate") %>'
                                                        Enabled="false" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="SelectRow1B">
                                                    Secondary
                                                </td>
                                                <td class="GridRow1B">
                                                    <asp:Label ID="ScOnLabel0" runat="server" Text='<%# Eval("ScType") %>' />
                                                </td>
                                                <td class="GridRow1B" style="width: 50px; padding-right: 5px; text-align: right;">
                                                    <asp:Label ID="ScOnLabel1" runat="server" Text="on" Visible='<%# Eval("ScOn")<>"-" %>' />
                                                </td>
                                                <td class="GridRow1B">
                                                    <asp:Label ID="ScOnLabel2" runat="server" Text='<%# Eval("ScOn") %>' Visible='<%# Eval("ScOn")<>"-" %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="SelectRow1B" style="text-indent: 20px">
                                                    Discount
                                                </td>
                                                <td class="GridRow1B">
                                                    <asp:Label ID="ScDiscountOnLabel3" runat="server" Text='<%# Eval("ScDiscount") %>' />
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
                                <tr>
                                    <td class="SelectRow1B">
                                        Min.Stay
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="StayCriteriaMinLabel" runat="server" Text='<%# Eval("StayCriteriaMin") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Max.Stay
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="StayCriteriaMaxLabel" runat="server" Text='<%# Eval("StayCriteriaMax") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B">
                                        Rate Received
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:Label ID="RateReceivedLabel" runat="server" Text='<%# Eval("RateRecieved", "{0:d}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRowClear">
                                        Description
                                    </td>
                                    <td class="GridRowClear">
                                        <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Description") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow2T" style="text-align: left; padding-top: 5px;">
                                        &nbsp;
                                        <%--
                                        <asp:Button ID="btDeactivate" runat="server" Text="Deactivate" 
                                            SkinID="skBtnBase" CommandName="Deactivate"
                                            Visible='False' />
                                        <asp:Button ID="btActivate" runat="server" Text="Activate" SkinID="skBtnBase" CommandName="Activate"
                                            Visible='False' />
                                        --%>
                                    </td>
                                    <td class="GridRow2T" style="text-align: right; padding-top: 5px;">
                                        <asp:Button ID="btEdit" runat="server" Text="Edit" SkinID="skBtnBase" CommandName="Edit"
                                            CommandArgument='<%# Eval("StateId") %>' Visible='<%# Eval("StateId")=0 %>' />&nbsp;
                                        <%--Visible="<%# Master.CanEdit() And Not Master.IsNewFreeRate() %>" />&nbsp;--%>
                                        <asp:Button ID="btnDelete" runat="server" Text="Delete" SkinID="skBtnBase" CommandName="Delete"
                                            OnClientClick="return confirm('Are you sure you want to delete the special')"
                                            CommandArgument='<%# Eval("StateId") %>' Visible='<%# Eval("StateId")=0 %>' />&nbsp;
                                        <%--Visible="<%# Master.CanEdit() And Not Master.IsFreeRate() %>" />&nbsp;--%>
                                        <asp:Button ID="btExtend" runat="server" Text="Extend Booking" SkinID="skBtnBase"
                                            CommandName="Extend" Visible='<%# Eval("StateId")>0 %>' />
                                        <%--Visible='<%# Not Master.CanEdit() %>' />--%>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:ObjectDataSource ID="dsSpec" runat="server" DeleteMethod="Delete" InsertMethod="InsertQuery"
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataFull" TypeName="dsSpecialTableAdapters.SpecialTableAdapter"
                        UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_SpecialID" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
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
                            <asp:Parameter Name="RateCodeId" Type="String" />
                            <asp:Parameter Name="Title" Type="String" />
                            <asp:Parameter Name="RateRecieved" Type="DateTime" />
                            <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value"
                                Type="String" />
                            <asp:Parameter Name="Original_SpecialID" Type="Int32" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter DefaultValue="" Name="SpecialID" QueryStringField="SpecialID" Type="Int32" />
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
                            <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value"
                                Type="String" />
                            <asp:Parameter Direction="InputOutput" Name="NewID" Type="Int32" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="dsSpecTitle" runat="server" TypeName="dsSpecialTableAdapters.SpecialTableAdapter"
                        UpdateMethod="SpecialTitleUpdate" SelectMethod="GetDataFull">
                        <SelectParameters>
                            <asp:QueryStringParameter DefaultValue="" Name="SpecialID" QueryStringField="SpecialID"
                                Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="SpecialID" Type="Int32" />
                            <asp:Parameter Name="Title" Type="String" />
                            <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value"
                                Type="String" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="dsCategory" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="dsSpecialTableAdapters.SpecialCategoryTableAdapter">
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="dsHotel" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="dsSpecialTableAdapters.HotelTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value"
                                Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="dsRateType" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetSpecialRate" TypeName="dsSpecialTableAdapters.RateTypeTableAdapter">
                    </asp:ObjectDataSource>
                </td>
                <td class="GridBorder" valign="top" style="height: auto;">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblBlackOuts" runat="server" CssClass="GridRow2B" Font-Bold="True"
                                    Font-Underline="False" Text="BlackOuts" Width="350px" Style="margin-bottom: 2px;" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="gvBlackoutsRO" runat="server" AutoGenerateColumns="False" DataSourceID="dsBlackouts"
                                    EnableModelValidation="True" ShowHeader="False" SkinID="skGridView" Width="350px">
                                    <Columns>
                                        <asp:BoundField DataField="SpecialId" HeaderText="SpecialId" SortExpression="SpecialId"
                                            Visible="False" />
                                        <asp:BoundField DataField="SpcPeriodID" HeaderText="SpcPeriodID" InsertVisible="False"
                                            ReadOnly="True" SortExpression="SpcPeriodID" Visible="False" />
                                        <asp:BoundField DataField="Start" DataFormatString="{0:d}" HeaderText="Start" SortExpression="Start">
                                            <ItemStyle HorizontalAlign="Center" Width="80px" />
                                        </asp:BoundField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Literal ID="Literal1" runat="server" Text="-" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="10px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Finish" DataFormatString="{0:d}" HeaderText="Finish" SortExpression="Finish">
                                            <ItemStyle HorizontalAlign="Center" Width="80px" />
                                        </asp:BoundField>
                                        <asp:TemplateField>
                                            <%--<ItemStyle Width="75px" />--%>
                                            <ItemStyle Width="180px" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <RowStyle CssClass="GridRow1B" />
                                </asp:GridView>
                                <asp:GridView ID="gvBlackouts" runat="server" AutoGenerateColumns="False" DataKeyNames="SpcPeriodID"
                                    DataSourceID="dsBlackouts" EnableModelValidation="True" SkinID="skGridView" ShowHeader="False"
                                    Width="350px">
                                    <Columns>
                                        <asp:BoundField DataField="SpecialId" HeaderText="SpecialId" SortExpression="SpecialId"
                                            Visible="False" />
                                        <asp:BoundField DataField="SpcPeriodID" HeaderText="SpcPeriodID" InsertVisible="False"
                                            ReadOnly="True" SortExpression="SpcPeriodID" Visible="False" />
                                        <asp:TemplateField HeaderText="Start" SortExpression="Start">
                                            <ItemTemplate>
                                                <asp:Label ID="lblBlcStart" runat="server" Text='<%# Bind("Start", "{0:d}") %>' />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtBlcStart" runat="server" Text='<%# Bind("Start", "{0:d}") %>'
                                                    CssClass="TextBox" />
                                                <asp:CalendarExtender ID="calBlcStart" runat="server" Enabled="True" TargetControlID="txtBlcStart"
                                                    CssClass="cal_Theme1" />
                                                <asp:CompareValidator ID="cvBlcStart" runat="server" ControlToValidate="txtBlcStart"
                                                    Display="None" ErrorMessage="Required date input!" Operator="DataTypeCheck" Type="Date" />
                                                <asp:ValidatorCalloutExtender ID="cvBlcStart_ValidatorCalloutExtender" runat="server"
                                                    Enabled="True" TargetControlID="cvBlcStart" />
                                                <asp:RequiredFieldValidator ID="reqBlcStart" runat="server" ControlToValidate="txtBlcStart"
                                                    Display="None" ErrorMessage="Required field!" />
                                                <asp:ValidatorCalloutExtender ID="reqBlcStart_ValidatorCalloutExtender" runat="server"
                                                    Enabled="True" TargetControlID="reqBlcStart" />
                                            </EditItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="80px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Literal runat="server" Text="-" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="10px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Finish" SortExpression="Finish">
                                            <ItemTemplate>
                                                <asp:Label ID="lblBlcFinish" runat="server" Text='<%# Bind("Finish", "{0:d}") %>' />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtBlcFinish" runat="server" Text='<%# Bind("Finish", "{0:d}") %>'
                                                    CssClass="TextBox" />
                                                <asp:CalendarExtender ID="calBlcFinish" runat="server" Enabled="True" TargetControlID="txtBlcFinish"
                                                    CssClass="cal_Theme1" />
                                                <asp:CompareValidator ID="cvBlcFinish" runat="server" ControlToValidate="txtBlcFinish"
                                                    Display="None" ErrorMessage="Required date input!" Operator="DataTypeCheck" Type="Date" />
                                                <asp:ValidatorCalloutExtender ID="cvBlcFinish_ValidatorCalloutExtender" runat="server"
                                                    Enabled="True" TargetControlID="cvBlcFinish" />
                                                <asp:RequiredFieldValidator ID="reqBlcFinish" runat="server" ControlToValidate="txtBlcFinish"
                                                    Display="None" ErrorMessage="Required field!" />
                                                <asp:ValidatorCalloutExtender ID="reqBlcFinish_ValidatorCalloutExtender" runat="server"
                                                    Enabled="True" TargetControlID="reqBlcFinish" />
                                            </EditItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="80px" />
                                        </asp:TemplateField>
                                        <asp:CommandField ButtonType="Image" CancelImageUrl="~/Images/decline_inline.gif"
                                            EditImageUrl="~/Images/edit_inline.gif" ShowEditButton="True" UpdateImageUrl="~/Images/accept_inline.gif">
                                            <ItemStyle Width="50px" />
                                        </asp:CommandField>
                                        <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/delete_inline.gif"
                                            ShowDeleteButton="True">
                                            <%--<ItemStyle Width="25px" />--%>
                                            <ItemStyle Width="130px" />
                                        </asp:CommandField>
                                    </Columns>
                                    <RowStyle CssClass="GridRow1B" />
                                </asp:GridView>
                                <asp:FormView ID="fvBlackouts" runat="server" DataSourceID="dsBlackouts" DataKeyNames="SpcPeriodID"
                                    EnableModelValidation="True">
                                    <InsertItemTemplate>
                                        <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                            <tr class="GridRowClear">
                                                <td style="width: 80px;">
                                                    <asp:TextBox ID="StartTextBox" runat="server" Text='<%# Bind("Start", "{0:d}") %>'
                                                        CssClass="TextBox" />
                                                    <asp:CalendarExtender ID="calStartTextBox" runat="server" CssClass="cal_Theme1" Enabled="True"
                                                        TargetControlID="StartTextBox" />
                                                    <asp:RequiredFieldValidator ID="reqStartTextBox" runat="server" ErrorMessage="This is required field!"
                                                        ControlToValidate="StartTextBox" Display="None" />
                                                    <asp:ValidatorCalloutExtender ID="reqStartTextBox_ValidatorCalloutExtender" runat="server"
                                                        TargetControlID="reqStartTextBox" HighlightCssClass="WaterMark">
                                                    </asp:ValidatorCalloutExtender>
                                                    <asp:CompareValidator ID="cvStartTextBox" runat="server" ControlToValidate="StartTextBox"
                                                        Display="None" ErrorMessage="Required date input!" Operator="DataTypeCheck" Type="Date" />
                                                    <asp:ValidatorCalloutExtender ID="cvStartTextBox_ValidatorCalloutExtender" runat="server"
                                                        TargetControlID="cvStartTextBox" HighlightCssClass="WaterMark">
                                                    </asp:ValidatorCalloutExtender>
                                                </td>
                                                <td style="width: 10px; text-align: center;">
                                                    <asp:Literal runat="server" Text="-" />
                                                </td>
                                                <td style="width: 80px;">
                                                    <asp:TextBox ID="FinishTextBox" runat="server" Text='<%# Bind("Finish", "{0:d}") %>'
                                                        CssClass="TextBox" />
                                                    <asp:CalendarExtender ID="calFinishTextBox" runat="server" CssClass="cal_Theme1"
                                                        Enabled="True" TargetControlID="FinishTextBox" />
                                                    <asp:RequiredFieldValidator ID="reqFinishTextBox" runat="server" ErrorMessage="This is required field!"
                                                        ControlToValidate="FinishTextBox" Display="None" />
                                                    <asp:ValidatorCalloutExtender ID="reqFinishTextBox_ValidatorCalloutExtender" runat="server"
                                                        TargetControlID="reqFinishTextBox" HighlightCssClass="WaterMark">
                                                    </asp:ValidatorCalloutExtender>
                                                    <asp:CompareValidator ID="cvFinishTextBox" runat="server" ControlToValidate="FinishTextBox"
                                                        Display="None" ErrorMessage="Required date input!" Operator="DataTypeCheck" Type="Date" />
                                                    <asp:ValidatorCalloutExtender ID="cvFinishTextBox_ValidatorCalloutExtender" runat="server"
                                                        TargetControlID="cvFinishTextBox" HighlightCssClass="WaterMark">
                                                    </asp:ValidatorCalloutExtender>
                                                </td>
                                                <%--<td style="width: 75px;">--%>
                                                <td style="width: 180px;">
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
                                            <tr class="GridRowClear">
                                                <td style="width: 170px; height: 30px;">
                                                    &nbsp;
                                                </td>
                                                <%--<td style="width: 70px; padding-left: 5px;">--%>
                                                <td style="width: 175px; padding-left: 5px; text-align: right;">
                                                    <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <EmptyDataTemplate>
                                        <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                            <tr class="GridRowClear">
                                                <td style="width: 170px; height: 30px;">
                                                    &nbsp;
                                                </td>
                                                <%--<td style="width: 70px; padding-left: 5px;">--%>
                                                <td style="width: 175px; padding-left: 5px;">
                                                    <asp:Button ID="btnNew0" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </EmptyDataTemplate>
                                </asp:FormView>
                                <asp:ObjectDataSource ID="dsBlackouts" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                    OldValuesParameterFormatString="{0}" SelectMethod="GetDataBySpecial" TypeName="dsSpecialTableAdapters.SpecialBlackoutTableAdapter"
                                    UpdateMethod="Update">
                                    <DeleteParameters>
                                        <asp:Parameter Name="SpcPeriodID" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:QueryStringParameter Name="SpecialID" QueryStringField="SpecialID" Type="Int32" />
                                        <asp:Parameter Name="Start" Type="DateTime" />
                                        <asp:Parameter Name="Finish" Type="DateTime" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="SpecialID" QueryStringField="SpecialID" Type="Int32" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="SpcPeriodID" Type="Int32" />
                                        <asp:Parameter Name="Start" Type="DateTime" />
                                        <asp:Parameter Name="Finish" Type="DateTime" />
                                    </UpdateParameters>
                                </asp:ObjectDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 30px; text-align: right;">
                                <asp:Button ID="Button1" runat="server" SkinID="skBtnBase" Text="Update" Visible="False" />
                            </td>
                        </tr>
                    </table>
                </td>
                <asp:Panel ID="pnlRoom" runat="server" Enabled="False">
                <td class="GridBorder" valign="top" rowspan="4">
                    <table>
                        <tr>
                            <td>
                                <div class="GridRow1B" style="margin-bottom: 2px; font-weight: bold;">
                                    <asp:CheckBox ID="cbAllRooms" runat="server" TextAlign="Left" Text="All Rooms" AutoPostBack="True" />
                                </div>
                                <asp:UpdatePanel ID="UpdatePanelRoom" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="gridRoomType" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                                            DataSourceID="dsRoomType" SkinID="skGridView" Width="100%" DataKeyNames="SpecialID,RoomTypeID" >
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
                    <asp:ObjectDataSource ID="dsRoomType" runat="server" SelectMethod="GetData" TypeName="dsSpecialTableAdapters.SelectSpecialRoomTableAdapter"
                            UpdateMethod="SpecialRoomUpdate" OldValuesParameterFormatString="{0}">
                            <UpdateParameters>
                                <asp:Parameter Name="SpecialID" Type="Int32" />
                                <asp:Parameter Name="RoomTypeId" Type="String" />
                                <asp:Parameter Name="SelectedRT" Type="Boolean" />
                            </UpdateParameters>
                            <SelectParameters>
                                <asp:QueryStringParameter Name="SpecialID" QueryStringField="SpecialID" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                </td>
                </asp:Panel>
            </tr>
            <tr>
            <asp:Panel ID="pnlMP" runat="server" Enabled="False">
                <td class="GridBorder" valign="top" style="height: auto;">
                    <table>
                        <tr>
                            <td>
                                <asp:CheckBox ID="cbAllMP" runat="server" CssClass="GridRow1B" Font-Bold="True" Font-Underline="False"
                                    Text="All Meal Plans" Width="350px" AutoPostBack="True" Style="margin-bottom: 2px;" />
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="gridMealPlan" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                                            DataKeyNames="MealPlanID,SpecialID" DataSourceID="dsMealPlan" SkinID="skGridView"
                                            ShowHeader="False">
                                            <Columns>
                                                <asp:BoundField DataField="SpecialID" HeaderText="SpecialID" ReadOnly="True" SortExpression="SpecialID"
                                                    Visible="False" />
                                                <asp:TemplateField SortExpression="SelectedMP">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("SelectedMP") %>' />
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("SelectedMP") %>' />
                                                    </EditItemTemplate>
                                                    <ItemStyle Width="40px" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="MealPlanID" HeaderText="Meal Plan" ReadOnly="True">
                                                    <HeaderStyle Font-Bold="True" HorizontalAlign="Left" />
                                                    <ItemStyle Width="306px" />
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
                    <asp:ObjectDataSource ID="dsMealPlan" runat="server" SelectMethod="GetData" TypeName="dsSpecialTableAdapters.SelectSpecialMealPlanTableAdapter"
                        UpdateMethod="SpecialMealPlanUpdate">
                        <UpdateParameters>
                            <asp:Parameter Name="SpecialID" Type="Int32" />
                            <asp:Parameter Name="MealPlanID" Type="String" />
                            <asp:Parameter Name="SelectedMP" Type="Boolean" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="SpecialID" QueryStringField="SpecialID" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td> 
            </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder" valign="top">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label3" runat="server" CssClass="GridRow2B" Font-Bold="True"
                                    Font-Underline="False" Text="Special Terms" Width="350px" Style="margin-bottom: 2px;" />
                            </td>
                        </tr>
                        <tr>
                            <td >
                                <asp:FormView ID="fvTerms" runat="server" DataKeyNames="SpecialID" 
                                    DataSourceID="dsTerms" EnableModelValidation="True">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="SpecialTermsTextTextBox" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("SpecialTermsText") %>' TextMode="MultiLine" 
                                            Height="350px" Width="345px" />
                                        <br />
                                        <div style="text-align: right;">
                                        <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" 
                                            CommandName="Update" Text="Update" SkinID="skBtnBase" />
                                        &nbsp;
                                        <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" Text="Cancel" SkinID="skBtnBase" />
                                        </div>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="SpecialTermsTextTextBox" runat="server" CssClass="TextBox" 
                                            Text='<%# Bind("SpecialTermsText") %>' TextMode="MultiLine"
                                            Height="350px" Width="345px" />
                                        <br />
                                        <div style="text-align: right;">
                                        <asp:Button ID="InsertButton" runat="server" CausesValidation="True" 
                                            CommandName="Insert" Text="Update" SkinID="skBtnBase" />
                                        &nbsp;
                                        <asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" Text="Cancel" SkinID="skBtnBase" />
                                        </div>
                                    </InsertItemTemplate>
                                    <EmptyDataTemplate>
                                        <div style="text-align: right; width: 350px;">
                                        <asp:Button ID="AddButton" runat="server" CausesValidation="True" 
                                            CommandName="New" Text="Add" SkinID="skBtnBase" />
                                        </div>
                                    </EmptyDataTemplate> 
                                    <ItemTemplate>
                                        <asp:Label ID="SpecialTermsTextLabel" runat="server" 
                                            Text='<%# Bind("SpecialTermsText") %>' 
                                            Width="350px" />
                                        <br />
                                        <div style="text-align: right;">
                                        <asp:Button ID="EditButton" runat="server" CausesValidation="False" 
                                            CommandName="Edit" Text="Edit" SkinID="skBtnBase" />
                                        &nbsp;
                                        <asp:Button ID="DeleteButton" runat="server" CausesValidation="False" 
                                            CommandName="Delete" Text="Delete" SkinID="skBtnBase" />
                                        </div>
                                    </ItemTemplate>
                                </asp:FormView>
                                <asp:ObjectDataSource ID="dsTerms" runat="server" DeleteMethod="Delete" 
                                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                                    SelectMethod="GetDataBySpecial" 
                                    TypeName="dsSpecialTableAdapters.SpecialTermsTableAdapter" 
                                    UpdateMethod="Update">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Original_SpecialID" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:QueryStringParameter Name="SpecialID" QueryStringField="SpecialID" Type="Int32" />
                                        <asp:Parameter Name="SpecialTermsText" Type="String" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="SpecialID" QueryStringField="SpecialID" Type="Int32" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="SpecialTermsText" Type="String" />
                                        <asp:Parameter Name="Original_SpecialID" Type="Int32" />
                                    </UpdateParameters>
                                </asp:ObjectDataSource>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="GridBorder" colspan="2">
                
                    <asp:FormView ID="fvComment" runat="server" DataSourceID="dsOvwComment" >
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td class="SelectRow1B" style="width: 760px">
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
                        TypeName="dsSpecialTableAdapters.SpecialCommentTableAdapter">
                        <SelectParameters>
                            <asp:QueryStringParameter DefaultValue="" Name="SpecialID" QueryStringField="SpecialID" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="hfDummy" runat="server" />
        <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
            Enabled="true" PopupDragHandleControlID="popLabel" CancelControlID="btnNo" DropShadow="True"
            BackgroundCssClass="modalBackground" TargetControlID="hfDummy" X="200" Y="200">
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
