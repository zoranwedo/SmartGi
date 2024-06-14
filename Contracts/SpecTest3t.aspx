<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SpecTest3t.aspx.vb" Inherits="Contracts_SpecTest3t" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="Blue">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
        <asp:ObjectDataSource ID="dsCategory" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="dsSpecialTableAdapters.SpecialCategoryTableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsHotel" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="dsSpecialTableAdapters.HotelTableAdapter"></asp:ObjectDataSource>
        <asp:FormView ID="fvSpec" runat="server" DataKeyNames="SpecialID" DataSourceID="dsSpec"
            DefaultMode="Edit" >
            <EditItemTemplate>
                <table cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="GridRow2B" style="width: 100px">
                            Special
                            <asp:Label ID="lblSpecialID" runat="server" Text='<%# " [" & Eval("HotelId") & "]" %>' />
                        </td>
                        <td class="GridRow2B" colspan="3" style="width: 300px">
                            <asp:TextBox ID="txtSpecial" runat="server" CssClass="TextBox" />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Hotel
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:HiddenField ID="hfHotelID" runat="server" Value='<%# Bind("HotelId") %>' />
                            <asp:Label ID="lblHotel" runat="server" Text='<%# Eval("Hotel") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Category
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:DropDownList ID="cdCategory" runat="server" CssClass="TextBox" DataSourceID="dsCategory"
                                DataTextField="SpecialCategory" DataValueField="SpecialCategory" SelectedValue='<%# Bind("Category") %>'>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Booking Code
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtBookingCode" runat="server" CssClass="TextBox" Text='<%# Bind("BookingCode") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRowClear">
                            Rate options
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:DropDownList ID="cbPerPax" runat="server" SelectedValue='<%# Bind("PerPax") %>'
                                CssClass="TextBox">
                                <asp:ListItem Value="True" Text="PerRoom" />
                                <asp:ListItem Value="False" Text="PerPax" />
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            &nbsp;
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:DropDownList ID="cbRateOption" runat="server" CssClass="TextBox" SelectedValue='<%# Bind("RateOption") %>'>
                                <asp:ListItem Value="0" Text="PerArrival" />
                                <asp:ListItem Value="1" Text="PerStay" />
                                <asp:ListItem Value="2" Text="Inclusiv" />
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Start
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtStart" runat="server" Text='<%# Bind("Start", "{0:d}") %>' CssClass="TextBox" />
                            <asp:ImageButton ID="imgStart" runat="server" SkinID="skCalendarButton" />
                            <asp:CalendarExtender ID="extStart" runat="server" TargetControlID="txtStart" PopupButtonID="imgStart"
                                TodaysDateFormat="d" DaysModeTitleFormat="d" ClearTime="True" />
                            <asp:CompareValidator ID="datStart" runat="server" ControlToValidate="txtStart" Operator="DataTypeCheck"
                                Type="Date" SkinID="skDate" CultureInvariantValues="True" />
                            <asp:ValidatorCalloutExtender ID="valStart" runat="server" TargetControlID="datStart"
                                SkinID="skExtender" />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            End
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtFinish" runat="server" Text='<%# Bind("Finish","{0:d}") %>' CssClass="TextBox" />
                            <asp:ImageButton ID="imgFinish" runat="server" SkinID="skCalendarButton" />
                            <asp:CalendarExtender ID="extFinish" runat="server" TargetControlID="txtFinish" PopupButtonID="imgFinish"
                                TodaysDateFormat="d" />
                            <asp:CompareValidator ID="datFinish" runat="server" ControlToValidate="txtFinish"
                                Operator="DataTypeCheck" Type="Date" SkinID="skDate" />
                            <asp:ValidatorCalloutExtender ID="valFinish" runat="server" TargetControlID="datFinish"
                                SkinID="skExtender" />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Booking Start
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtBkStart" runat="server" Text='<%# Bind("BkStart","{0:d}") %>'
                                CssClass="TextBox" />
                            <asp:ImageButton ID="imgBkStart" runat="server" SkinID="skCalendarButton" />
                            <asp:CalendarExtender ID="extBkStart" runat="server" TargetControlID="txtBkStart"
                                PopupButtonID="imgBkStart" TodaysDateFormat="d" />
                            <asp:CompareValidator ID="datBkStart" runat="server" ControlToValidate="txtBkStart"
                                Operator="DataTypeCheck" Type="Date" SkinID="skDate" />
                            <asp:ValidatorCalloutExtender ID="valBkStart" runat="server" TargetControlID="datBkStart"
                                SkinID="skExtender" />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Booking End
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtBkFinish" runat="server" Text='<%# Bind("BkFinish","{0:d}") %>'
                                CssClass="TextBox" />
                            <asp:ImageButton ID="imgBkFinish" runat="server" SkinID="skCalendarButton" />
                            <asp:CalendarExtender ID="extBkFinish" runat="server" TargetControlID="txtBkFinish"
                                PopupButtonID="imgBkFinish" TodaysDateFormat="d" />
                            <asp:CompareValidator ID="datBkFinish" runat="server" ControlToValidate="txtBkFinish"
                                Operator="DataTypeCheck" Type="Date" SkinID="skDate" />
                            <asp:ValidatorCalloutExtender ID="valBkFinish" runat="server" TargetControlID="datBkFinish"
                                SkinID="skExtender" />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Payment
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtPayment" runat="server" Text='<%# Bind("Payment","{0:d}") %>'
                                CssClass="TextBox" />
                            <asp:ImageButton ID="imgPayment" runat="server" SkinID="skCalendarButton" />
                            <asp:CalendarExtender ID="extPayment" runat="server" TargetControlID="txtPayment"
                                PopupButtonID="imgPayment" TodaysDateFormat="d" />
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
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtRooming" runat="server" Text='<%# Bind("RoomingList","{0:d}") %>'
                                CssClass="TextBox" />
                            <asp:ImageButton ID="imgRooming" runat="server" SkinID="skCalendarButton" />
                            <asp:CalendarExtender ID="extRooming" runat="server" TargetControlID="txtRooming"
                                PopupButtonID="imgRooming" TodaysDateFormat="d" />
                            <asp:CompareValidator ID="datRooming" runat="server" ControlToValidate="txtRooming"
                                Operator="DataTypeCheck" Type="Date" SkinID="skDate" />
                            <asp:ValidatorCalloutExtender ID="valRooming" runat="server" TargetControlID="datRooming"
                                SkinID="skExtender" />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Min. Stay
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtStayMin" runat="server" CssClass="TextBox" Text='<%# Bind("StayCriteriaMin") %>'></asp:TextBox>
                            <asp:CompareValidator ID="intStayMin" runat="server" ControlToValidate="txtStayMin"
                                Operator="DataTypeCheck" Type="Integer" SkinID="skInteger" />
                            <asp:ValidatorCalloutExtender ID="extStayMin" runat="server" TargetControlID="intStayMin"
                                SkinID="skExtender" />
                            <asp:TextBoxWatermarkExtender ID="wmStayMin" runat="server" TargetControlID="txtStayMin"
                                WatermarkText="(Minimum)" />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Max. Stay
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtStayMax" runat="server" CssClass="TextBox" Text='<%# Bind("StayCriteriaMax") %>'></asp:TextBox>
                            <asp:CompareValidator ID="intStayMax" runat="server" ControlToValidate="txtStayMax"
                                Operator="DataTypeCheck" Type="Integer" SkinID="skInteger" />
                            <asp:ValidatorCalloutExtender ID="extStayMax" runat="server" TargetControlID="intStayMax"
                                SkinID="skExtender" />
                            <asp:TextBoxWatermarkExtender ID="wmStayMax" runat="server" TargetControlID="txtStayMax"
                                WatermarkText="(Maximum)" />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B" colspan="4">
                            Discounts
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Primary
                        </td>
                        <td class="GridRow1B">
                                <asp:DropDownList ID="cbPrType" runat="server" CssClass="TextBox" />
                                <asp:CascadingDropDown ID="exPrType" runat="server" 
                                    TargetControlID="cbPrType" 
                                    Category="PrTypeID" 
                                    ContextKey="Pr"
                                    SelectedValue='<%# Bind("PrDiscountTypeId") %>'
                                    ServicePath="~/SpecDisc.asmx" 
                                    ServiceMethod="GetTypeID"
                                    UseContextKey="True">
                                </asp:CascadingDropDown>
                        </td>
                        <td class="GridRow1B">
                            On
                        </td>
                        <td class="GridRow1B">
                                <asp:DropDownList ID="cbPrOn" runat="server" CssClass="TextBox" />
                                <asp:CascadingDropDown ID="exPrOn" runat="server" 
                                    TargetControlID="cbPrOn" 
                                    ParentControlID="cbPrType" 
                                    Category="PrTypeOn"
                                    ContextKey="Pr"
                                    SelectedValue='<%# Bind("PrDiscountOn") %>'
                                    ServicePath="~/SpecDisc.asmx" 
                                    ServiceMethod="GetOn"
                                    UseContextKey="True">
                                </asp:CascadingDropDown>
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B" style="text-indent: 20px">
                            Discount
                        </td>
                        <td class="GridRow1B">
                                <asp:DropDownList ID="cbPrDisc" runat="server" CssClass="TextBox" />
                                <asp:CascadingDropDown ID="exPrDisc" runat="server" 
                                    TargetControlID="cbPrDisc" 
                                    ParentControlID="cbPrType" 
                                    Category="PrDisc"
                                    ContextKey="Pr"
                                    SelectedValue='<%# Bind("PrDiscount") %>'
                                    ServicePath="~/SpecDisc.asmx" 
                                    ServiceMethod="GetDiscount"
                                    UseContextKey="True">
                                </asp:CascadingDropDown>
                        </td>
                        <td class="GridRow1B">
                            &nbsp;
                        </td>
                        <td class="GridRow1B">
                            <asp:CheckBox ID="cbPropagate" runat="server" Text="Propagate" Checked='<%# Bind("PrPropagate") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Secondary
                        </td>
                        <td class="GridRow1B">
                                <asp:DropDownList ID="cbScType" runat="server" CssClass="TextBox" />
                                <asp:CascadingDropDown ID="exScType" runat="server" 
                                    TargetControlID="cbScType" 
                                    Category="ScTypeID" 
                                    ContextKey="Sc"
                                    SelectedValue='<%# Bind("ScDiscountTypeId") %>'
                                    ServicePath="~/SpecDisc.asmx" 
                                    ServiceMethod="GetTypeID"
                                    UseContextKey="True">
                                </asp:CascadingDropDown>
                        </td>
                        <td class="GridRow1B">
                            On
                        </td>
                        <td class="GridRow1B">
                                <asp:DropDownList ID="cbScOn" runat="server" CssClass="TextBox" />
                                <asp:CascadingDropDown ID="exScOn" runat="server" 
                                    TargetControlID="cbScOn" 
                                    ParentControlID="cbScType" 
                                    Category="ScTypeOn"
                                    ContextKey="Sc"
                                    SelectedValue='<%# Bind("ScDiscountOn") %>'
                                    ServicePath="~/SpecDisc.asmx" 
                                    ServiceMethod="GetOn"
                                    UseContextKey="True">
                                </asp:CascadingDropDown>
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRowClear" style="text-indent: 20px">
                            Discount
                        </td>
                        <td class="GridRowClear">
                                <asp:DropDownList ID="cbScDisc" runat="server" CssClass="TextBox" />
                                <asp:CascadingDropDown ID="exScDisc" runat="server" 
                                    TargetControlID="cbScDisc" 
                                    ParentControlID="cbScType" 
                                    Category="ScDisc"
                                    ContextKey="Sc"
                                    SelectedValue='<%# Bind("ScDiscount") %>'
                                    ServicePath="~/SpecDisc.asmx" 
                                    ServiceMethod="GetDiscount"
                                    UseContextKey="True">
                                </asp:CascadingDropDown>
                        </td>
                        <td class="GridRowClear">
                            &nbsp;
                        </td>
                        <td class="GridRowClear">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="GridRow2T" colspan="4" style="text-align: right; padding-top: 5px;">
                            <asp:Button ID="btUpdate" runat="server" Text="Update" SkinID="skBtnBase" CommandName="Update" />&nbsp;
                            <asp:Button ID="btCancel" runat="server" Text="Cancel" SkinID="skBtnBase" CommandName="Cancel" />&nbsp;
                        </td>
                    </tr>
                </table>
            </EditItemTemplate>
            <InsertItemTemplate>
                <table cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="GridRow2B" style="width: 100px">
                            Special
                            <asp:Label ID="lblSpecialID" runat="server" Text='<%# " [" & Eval("HotelId") & "]" %>' />
                        </td>
                        <td class="GridRow2B" colspan="3" style="width: 300px">
                            <asp:TextBox ID="txtSpecial" runat="server" CssClass="TextBox" />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Hotel
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:DropDownList ID="cbHotelID" runat="server" CssClass="TextBox" 
                                DataSourceID="dsHotel" DataTextField="Hotel" DataValueField="HotelID" 
                                SelectedValue='<%# Bind("HotelId") %>'>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Category
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:DropDownList ID="cdCategory" runat="server" CssClass="TextBox" DataSourceID="dsCategory"
                                DataTextField="SpecialCategory" DataValueField="SpecialCategory" SelectedValue='<%# Bind("Category") %>'>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Booking Code
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtBookingCode" runat="server" CssClass="TextBox" Text='<%# Bind("BookingCode") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRowClear">
                            Rate options
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:DropDownList ID="cbPerPax" runat="server" SelectedValue='<%# Bind("PerPax") %>'
                                CssClass="TextBox">
                                <asp:ListItem Value="True" Text="PerRoom" />
                                <asp:ListItem Value="False" Text="PerPax" />
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            &nbsp;
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:DropDownList ID="cbRateOption" runat="server" CssClass="TextBox" SelectedValue='<%# Bind("RateOption") %>'>
                                <asp:ListItem Value="0" Text="PerArrival" />
                                <asp:ListItem Value="1" Text="PerStay" />
                                <asp:ListItem Value="2" Text="Inclusiv" />
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Start
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtStart" runat="server" Text='<%# Bind("Start", "{0:d}") %>' CssClass="TextBox" />
                            <asp:ImageButton ID="imgStart" runat="server" SkinID="skCalendarButton" />
                            <asp:CalendarExtender ID="extStart" runat="server" TargetControlID="txtStart" PopupButtonID="imgStart"
                                TodaysDateFormat="d" DaysModeTitleFormat="d" ClearTime="True" />
                            <asp:CompareValidator ID="datStart" runat="server" ControlToValidate="txtStart" Operator="DataTypeCheck"
                                Type="Date" SkinID="skDate" CultureInvariantValues="True" />
                            <asp:ValidatorCalloutExtender ID="valStart" runat="server" TargetControlID="datStart"
                                SkinID="skExtender" />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            End
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtFinish" runat="server" Text='<%# Bind("Finish","{0:d}") %>' CssClass="TextBox" />
                            <asp:ImageButton ID="imgFinish" runat="server" SkinID="skCalendarButton" />
                            <asp:CalendarExtender ID="extFinish" runat="server" TargetControlID="txtFinish" PopupButtonID="imgFinish"
                                TodaysDateFormat="d" />
                            <asp:CompareValidator ID="datFinish" runat="server" ControlToValidate="txtFinish"
                                Operator="DataTypeCheck" Type="Date" SkinID="skDate" />
                            <asp:ValidatorCalloutExtender ID="valFinish" runat="server" TargetControlID="datFinish"
                                SkinID="skExtender" />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Booking Start
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtBkStart" runat="server" Text='<%# Bind("BkStart","{0:d}") %>'
                                CssClass="TextBox" />
                            <asp:ImageButton ID="imgBkStart" runat="server" SkinID="skCalendarButton" />
                            <asp:CalendarExtender ID="extBkStart" runat="server" TargetControlID="txtBkStart"
                                PopupButtonID="imgBkStart" TodaysDateFormat="d" />
                            <asp:CompareValidator ID="datBkStart" runat="server" ControlToValidate="txtBkStart"
                                Operator="DataTypeCheck" Type="Date" SkinID="skDate" />
                            <asp:ValidatorCalloutExtender ID="valBkStart" runat="server" TargetControlID="datBkStart"
                                SkinID="skExtender" />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Booking End
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtBkFinish" runat="server" Text='<%# Bind("BkFinish","{0:d}") %>'
                                CssClass="TextBox" />
                            <asp:ImageButton ID="imgBkFinish" runat="server" SkinID="skCalendarButton" />
                            <asp:CalendarExtender ID="extBkFinish" runat="server" TargetControlID="txtBkFinish"
                                PopupButtonID="imgBkFinish" TodaysDateFormat="d" />
                            <asp:CompareValidator ID="datBkFinish" runat="server" ControlToValidate="txtBkFinish"
                                Operator="DataTypeCheck" Type="Date" SkinID="skDate" />
                            <asp:ValidatorCalloutExtender ID="valBkFinish" runat="server" TargetControlID="datBkFinish"
                                SkinID="skExtender" />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Payment
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtPayment" runat="server" Text='<%# Bind("Payment","{0:d}") %>'
                                CssClass="TextBox" />
                            <asp:ImageButton ID="imgPayment" runat="server" SkinID="skCalendarButton" />
                            <asp:CalendarExtender ID="extPayment" runat="server" TargetControlID="txtPayment"
                                PopupButtonID="imgPayment" TodaysDateFormat="d" />
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
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtRooming" runat="server" Text='<%# Bind("RoomingList","{0:d}") %>'
                                CssClass="TextBox" />
                            <asp:ImageButton ID="imgRooming" runat="server" SkinID="skCalendarButton" />
                            <asp:CalendarExtender ID="extRooming" runat="server" TargetControlID="txtRooming"
                                PopupButtonID="imgRooming" TodaysDateFormat="d" />
                            <asp:CompareValidator ID="datRooming" runat="server" ControlToValidate="txtRooming"
                                Operator="DataTypeCheck" Type="Date" SkinID="skDate" />
                            <asp:ValidatorCalloutExtender ID="valRooming" runat="server" TargetControlID="datRooming"
                                SkinID="skExtender" />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Min. Stay
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtStayMin" runat="server" CssClass="TextBox" Text='<%# Bind("StayCriteriaMin") %>'></asp:TextBox>
                            <asp:CompareValidator ID="intStayMin" runat="server" ControlToValidate="txtStayMin"
                                Operator="DataTypeCheck" Type="Integer" SkinID="skInteger" />
                            <asp:ValidatorCalloutExtender ID="extStayMin" runat="server" TargetControlID="intStayMin"
                                SkinID="skExtender" />
                            <asp:TextBoxWatermarkExtender ID="wmStayMin" runat="server" TargetControlID="txtStayMin"
                                WatermarkText="(Minimum)" />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Max. Stay
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtStayMax" runat="server" CssClass="TextBox" Text='<%# Bind("StayCriteriaMax") %>'></asp:TextBox>
                            <asp:CompareValidator ID="intStayMax" runat="server" ControlToValidate="txtStayMax"
                                Operator="DataTypeCheck" Type="Integer" SkinID="skInteger" />
                            <asp:ValidatorCalloutExtender ID="extStayMax" runat="server" TargetControlID="intStayMax"
                                SkinID="skExtender" />
                            <asp:TextBoxWatermarkExtender ID="wmStayMax" runat="server" TargetControlID="txtStayMax"
                                WatermarkText="(Maximum)" />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B" colspan="4">
                            Discounts
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Primary
                        </td>
                        <td class="GridRow1B">
                                <asp:DropDownList ID="cbPrType" runat="server" CssClass="TextBox" />
                                <asp:CascadingDropDown ID="exPrType" runat="server" 
                                    TargetControlID="cbPrType" 
                                    Category="PrTypeID" 
                                    ContextKey="Pr"
                                    SelectedValue='<%# Bind("PrDiscountTypeId") %>'
                                    ServicePath="~/SpecDisc.asmx" 
                                    ServiceMethod="GetTypeID"
                                    UseContextKey="True">
                                </asp:CascadingDropDown>
                        </td>
                        <td class="GridRow1B">
                            On
                        </td>
                        <td class="GridRow1B">
                                <asp:DropDownList ID="cbPrOn" runat="server" CssClass="TextBox" />
                                <asp:CascadingDropDown ID="exPrOn" runat="server" 
                                    TargetControlID="cbPrOn" 
                                    ParentControlID="cbPrType" 
                                    Category="PrTypeOn"
                                    ContextKey="Pr"
                                    SelectedValue='<%# Bind("PrDiscountOn") %>'
                                    ServicePath="~/SpecDisc.asmx" 
                                    ServiceMethod="GetOn"
                                    UseContextKey="True">
                                </asp:CascadingDropDown>
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B" style="text-indent: 20px">
                            Discount
                        </td>
                        <td class="GridRow1B">
                                <asp:DropDownList ID="cbPrDisc" runat="server" CssClass="TextBox" />
                                <asp:CascadingDropDown ID="exPrDisc" runat="server" 
                                    TargetControlID="cbPrDisc" 
                                    ParentControlID="cbPrType" 
                                    Category="PrDisc"
                                    ContextKey="Pr"
                                    SelectedValue='<%# Bind("PrDiscount") %>'
                                    ServicePath="~/SpecDisc.asmx" 
                                    ServiceMethod="GetDiscount"
                                    UseContextKey="True">
                                </asp:CascadingDropDown>
                        </td>
                        <td class="GridRow1B">
                            &nbsp;
                        </td>
                        <td class="GridRow1B">
                            <asp:CheckBox ID="cbPropagate" runat="server" Text="Propagate" Checked='<%# Bind("PrPropagate") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Secondary
                        </td>
                        <td class="GridRow1B">
                                <asp:DropDownList ID="cbScType" runat="server" CssClass="TextBox" />
                                <asp:CascadingDropDown ID="exScType" runat="server" 
                                    TargetControlID="cbScType" 
                                    Category="ScTypeID" 
                                    ContextKey="Sc"
                                    SelectedValue='<%# Bind("ScDiscountTypeId") %>'
                                    ServicePath="~/SpecDisc.asmx" 
                                    ServiceMethod="GetTypeID"
                                    UseContextKey="True">
                                </asp:CascadingDropDown>
                        </td>
                        <td class="GridRow1B">
                            On
                        </td>
                        <td class="GridRow1B">
                                <asp:DropDownList ID="cbScOn" runat="server" CssClass="TextBox" />
                                <asp:CascadingDropDown ID="exScOn" runat="server" 
                                    TargetControlID="cbScOn" 
                                    ParentControlID="cbScType" 
                                    Category="ScTypeOn"
                                    ContextKey="Sc"
                                    SelectedValue='<%# Bind("ScDiscountOn") %>'
                                    ServicePath="~/SpecDisc.asmx" 
                                    ServiceMethod="GetOn"
                                    UseContextKey="True">
                                </asp:CascadingDropDown>
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRowClear" style="text-indent: 20px">
                            Discount
                        </td>
                        <td class="GridRowClear">
                                <asp:DropDownList ID="cbScDisc" runat="server" CssClass="TextBox" />
                                <asp:CascadingDropDown ID="exScDisc" runat="server" 
                                    TargetControlID="cbScDisc" 
                                    ParentControlID="cbScType" 
                                    Category="ScDisc"
                                    ContextKey="Sc"
                                    SelectedValue='<%# Bind("ScDiscount") %>'
                                    ServicePath="~/SpecDisc.asmx" 
                                    ServiceMethod="GetDiscount"
                                    UseContextKey="True">
                                </asp:CascadingDropDown>
                        </td>
                        <td class="GridRowClear">
                            &nbsp;
                        </td>
                        <td class="GridRowClear">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="GridRow2T" colspan="4" style="text-align: right; padding-top: 5px;">
                            <asp:Button ID="btUpdate" runat="server" Text="Save" SkinID="skBtnBase" 
                                CommandName="Insert" />&nbsp;
                            <asp:Button ID="btCancel" runat="server" Text="Cancel" SkinID="skBtnBase" CommandName="Cancel" />&nbsp;
                        </td>
                    </tr>
                </table>
            </InsertItemTemplate>
            <ItemTemplate>
                SpecialID:
                <asp:Label ID="SpecialIDLabel" runat="server" Text='<%# Eval("SpecialID") %>' />
                <br />
                HotelId:
                <asp:Label ID="HotelIdLabel" runat="server" Text='<%# Bind("HotelId") %>' />
                <br />
                Category:
                <asp:Label ID="CategoryLabel" runat="server" Text='<%# Bind("Category") %>' />
                <br />
                BookingCode:
                <asp:Label ID="BookingCodeLabel" runat="server" Text='<%# Bind("BookingCode") %>' />
                <br />
                PerPax:
                <asp:CheckBox ID="PerPaxCheckBox" runat="server" Checked='<%# Bind("PerPax") %>'
                    Enabled="false" />
                <br />
                RateOption:
                <asp:Label ID="RateOptionLabel" runat="server" Text='<%# Bind("RateOption") %>' />
                <br />
                Start:
                <asp:Label ID="StartLabel" runat="server" Text='<%# Bind("Start") %>' />
                <br />
                Finish:
                <asp:Label ID="FinishLabel" runat="server" Text='<%# Bind("Finish") %>' />
                <br />
                BkStart:
                <asp:Label ID="BkStartLabel" runat="server" Text='<%# Bind("BkStart") %>' />
                <br />
                BkFinish:
                <asp:Label ID="BkFinishLabel" runat="server" Text='<%# Bind("BkFinish") %>' />
                <br />
                Payment:
                <asp:Label ID="PaymentLabel" runat="server" Text='<%# Bind("Payment") %>' />
                <br />
                RoomingList:
                <asp:Label ID="RoomingListLabel" runat="server" Text='<%# Bind("RoomingList") %>' />
                <br />
                StayCriteriaMin:
                <asp:Label ID="StayCriteriaMinLabel" runat="server" Text='<%# Bind("StayCriteriaMin") %>' />
                <br />
                StayCriteriaMax:
                <asp:Label ID="StayCriteriaMaxLabel" runat="server" Text='<%# Bind("StayCriteriaMax") %>' />
                <br />
                PrDiscountTypeId:
                <asp:Label ID="PrDiscountTypeIdLabel" runat="server" Text='<%# Bind("PrDiscountTypeId") %>' />
                <br />
                PrPropagate:
                <asp:CheckBox ID="PrPropagateCheckBox" runat="server" Checked='<%# Bind("PrPropagate") %>'
                    Enabled="false" />
                <br />
                PrDiscountOn:
                <asp:Label ID="PrDiscountOnLabel" runat="server" Text='<%# Bind("PrDiscountOn") %>' />
                <br />
                PrDiscount:
                <asp:Label ID="PrDiscountLabel" runat="server" Text='<%# Bind("PrDiscount") %>' />
                <br />
                ScDiscountTypeId:
                <asp:Label ID="ScDiscountTypeIdLabel" runat="server" Text='<%# Bind("ScDiscountTypeId") %>' />
                <br />
                ScDiscountOn:
                <asp:Label ID="ScDiscountOnLabel" runat="server" Text='<%# Bind("ScDiscountOn") %>' />
                <br />
                ScDiscount:
                <asp:Label ID="ScDiscountLabel" runat="server" Text='<%# Bind("ScDiscount") %>' />
                <br />
                Description:
                <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Bind("Description") %>' />
                <br />
                StateId:
                <asp:Label ID="StateIdLabel" runat="server" Text='<%# Bind("StateId") %>' />
                <br />
                CtrEBB:
                <asp:CheckBox ID="CtrEBBCheckBox" runat="server" Checked='<%# Bind("CtrEBB") %>'
                    Enabled="false" />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                    Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                    Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                    Text="New" />
            </ItemTemplate>
        </asp:FormView>
        <asp:ObjectDataSource ID="dsSpec" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataFull" TypeName="dsSpecialTableAdapters.SpecialTableAdapter"
            UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_SpecialID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="HotelId" Type="Int32" />
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="BookingCode" Type="String" />
                <asp:Parameter Name="PerPax" Type="Boolean" />
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
                <asp:Parameter Name="CtrEBB" Type="Boolean" />
                <asp:Parameter Name="Original_SpecialID" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="SpecialID" Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="HotelId" Type="Int32" />
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="BookingCode" Type="String" />
                <asp:Parameter Name="PerPax" Type="Boolean" />
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
                <asp:Parameter Name="CtrEBB" Type="Boolean" />
            </InsertParameters>
        </asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
