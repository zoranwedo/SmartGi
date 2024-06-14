﻿<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" 
    CodeFile="AccRegisterDoc.aspx.vb" Inherits="Accounting_AccRegisterDoc" 
    EnableEventValidation="false" MaintainScrollPositionOnPostback="true" %>

<%@ Register Src="~/App_UserControls/HotelControl.ascx" TagName="HotelControl" TagPrefix="uc" %>
<%@ Register Src="~/App_UserControls/TourOpControl.ascx" TagName="TourOpControl" TagPrefix="uc" %>
<%@ Register Src="~/App_UserControls/InputDateControl.ascx" TagName="InputDateControl" TagPrefix="uc" %>
<%@ Register Src="~/App_UserControls/InputIntegerControl.ascx" TagName="InputIntegerControl" TagPrefix="uc" %>
<%@ Register Src="~/App_UserControls/MessagePop.ascx" TagName="MessagePop" TagPrefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Accounting Document Registration
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" Runat="Server">
    <script type="text/javascript">
        function checkMaxLen(txt, maxLen) {
            try {
                if (txt.value.length > (maxLen - 1)) {
                    var cont = txt.value;
                    txt.value = cont.substring(0, (maxLen - 1));
                    return false;
                };
            } catch (e) { }
        }

        function HAmountCalc() {
            var txtAmount = document.getElementById("<%=txtAmount.ClientID %>");
            var txtPercent = document.getElementById("<%=txtHPercent.ClientID %>");
            var amount = 0, percent = 0, hotel = 0;

            if (txtAmount.value != "") amount = parseFloat(txtAmount.value);
            if (txtPercent.value != "") percent = parseFloat(txtPercent.value);
            hotel = amount * percent / 100

            var hAmount = document.getElementById("<%=txtHAmount.ClientID %>")
            hAmount.value = hotel;
        }    
    </script>

    <div class="Blue">
        <asp:HiddenField ID="dummy" runat="server" />
        <asp:HiddenField ID="hfStep" runat="server" Value="0" />
        <asp:HiddenField ID="hfHotelID" runat="server" Value="-1" />
        <div class="LocalMenuRow" style="margin-bottom: 5px;">
            <asp:HyperLink ID="linkBack" runat="server" SkinID="skHypLink" NavigateUrl="~/Accounting/AccDocSearch.aspx"
                Text="&lt;&lt; Back to Documents" />
        </div>
        <div class="GridLabelBG">
            <asp:Label ID="lblTitle" runat="server" SkinID="skGridLabel" Text="Register New Document" />
            <asp:HiddenField ID="hfApproved" runat="server" Value="False" />
        </div>
        <table style="padding-left: 32px;">
            <tr>
                <td class="GridBorder" valign="top">
                    <table cellpadding="0" cellspacing="0">
                        <asp:Panel runat="server" ID="pnlInsert">
                            <tr>
                                <td class="SelectRow1B" style="width: 120px;">
                                    Document
                                </td>
                                <td class="GridRow1B" style="width: 480px;">
                                    <asp:DropDownList ID="ddlDocType" runat="server" CssClass="TextBox" DataSourceID="dsDocCodeReg"
                                        DataTextField="TrCode" DataValueField="TrCode" />
                                    <asp:ObjectDataSource ID="dsDocCodeReg" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="dsAccountingTableAdapters.DocForRegistrationTableAdapter" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" colspan="2">
                                    <uc:HotelControl ID="ctrlHotel" runat="server" LabelCssClass="SelectRowClear" LabelWidth="120px"
                                        ControlWidth="480px" NoCCI="false" Mandatory="true" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" colspan="2">
                                    <uc:TourOpControl ID="ctrlTourOp" runat="server" LabelCssClass="SelectRowClear" LabelWidth="120px"
                                        ControlWidth="480px" NoLocal="true" Mandatory="true" />
                                </td>
                            </tr>
                            <tr>
                                <td class="SelectRow1B">Date</td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="txtDate" runat="server" CssClass="TextBox" />
                                    <asp:CalendarExtender ID="cal_txtDate" runat="server" CssClass="cal_Theme1" TargetControlID="txtDate" />
                                    <asp:RequiredFieldValidator ID="req_txtDate" runat="server" Display="None" ControlToValidate="txtDate"
                                        ErrorMessage="Required Field" />
                                    <asp:ValidatorCalloutExtender ID="ex_req_txtDate" runat="server" TargetControlID="req_txtDate" />
                                    <asp:CompareValidator ID="date_txtDate" runat="server" Display="None" Operator="DataTypeCheck"
                                        Type="Date" ErrorMessage="Input Date!" ControlToValidate="txtDate" />
                                    <asp:ValidatorCalloutExtender ID="ex_date_txtDate" runat="server" TargetControlID="date_txtDate" />
                                </td>
                            </tr>
                            <tr>
                                <td class="SelectRowClear">Amount</td>
                                <td class="GridRowClear">
                                    <asp:TextBox ID="txtAmount" runat="server" CssClass="TextBox" />
                                    <asp:RequiredFieldValidator ID="req_txtAmount" runat="server" Display="None" ControlToValidate="txtAmount"
                                        ErrorMessage="Required field" />
                                    <asp:ValidatorCalloutExtender ID="ex_req_txtAmount" runat="server" TargetControlID="req_txtAmount" />
                                    <asp:CompareValidator ID="dec_txtAmount" runat="server" Display="None" Operator="DataTypeCheck"
                                        Type="Currency" ErrorMessage="Imput valid amount" ControlToValidate="txtAmount" />
                                    <asp:ValidatorCalloutExtender ID="ex_dec_txtAmount" runat="server" TargetControlID="dec_txtAmount" />
                                    <asp:CompareValidator ID="val_txtAmount" runat="server" Display="None" Operator="GreaterThan"
                                        Type="Currency" ValueToCompare="0" ErrorMessage="Amount has to be greater than 0"
                                        ControlToValidate="txtAmount" />
                                    <asp:ValidatorCalloutExtender ID="ex_val_txtAmount" runat="server" TargetControlID="val_txtAmount" />
                                </td>
                            </tr>
                        </asp:Panel>
                        <asp:Panel runat="server" ID="pnlHotel" Visible="false">
                            <tr>
                                <td class="GridRow1TB" style="height: 5px;" colspan="2"></td>
                            </tr>
                            <tr>
                                <td class="SelectRow1B">Hotel %</td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="txtHPercent" runat="server" CssClass="TextBox" onblur="HAmountCalc()"/>
                                    <asp:TextBoxWatermarkExtender ID="wm_txtHPercent" runat="server" WatermarkCssClass="WaterMark"
                                        WatermarkText="Hotel percent applies if empty" TargetControlID="txtHPercent" />
                                    <asp:CompareValidator ID="double_txtHPercent" runat="server" ControlToValidate="txtHPercent"
                                        Operator="DataTypeCheck" Type="Double" SkinID="skInteger" />
                                    <asp:ValidatorCalloutExtender ID="ex_double_txtHPercent" runat="server"
                                        TargetControlID="double_txtHPercent" SkinID="skExtender" />
                                </td>
                            </tr>
                            <tr>
                                <td class="SelectRow1B">Hotel Amount</td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="txtHAmount" runat="server" CssClass="TextBox" Enabled="false" />
                                </td>
                            </tr>
                        </asp:Panel>
                        <asp:Panel runat="server" ID="pnlDepartment" Visible="false">
                            <tr>
                                <td class="SelectRow1B" style="width: 120px;">Department</td>
                                <td class="GridRow1B" style="width: 480px;">
                                    <asp:DropDownList ID="ddlDep" runat="server" BackColor="White" CssClass="TextBox" />
                                    <asp:CascadingDropDown ID="exDep" runat="server" TargetControlID="ddlDep" Category="DepID"
                                        ServicePath="~/DepEmp.asmx" ServiceMethod="GetDepID" UseContextKey="true" ContextKey="-1">
                                    </asp:CascadingDropDown>
                                </td>
                            </tr>
                            <tr>
                                <td class="SelectRow1B">Employee</td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlEmp" runat="server" BackColor="White" CssClass="TextBox" />
                                    <asp:CascadingDropDown ID="exEmp" runat="server" ParentControlID="ddlDep" TargetControlID="ddlEmp"
                                        Category="EmpID" ServicePath="~/DepEmp.asmx" ServiceMethod="GetEmpID">
                                    </asp:CascadingDropDown>
                                </td>
                            </tr>
                            <tr>
                                <td class="SelectRow1B">Unit</td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlUnit" runat="server" BackColor="White" CssClass="TextBox" />
                                    <asp:CascadingDropDown ID="exUnit" runat="server" ParentControlID="ddlDep" TargetControlID="ddlUnit"
                                        Category="UnitID" ServicePath="~/DepEmp.asmx" ServiceMethod="GetUnitID">
                                    </asp:CascadingDropDown>
                                </td>
                            </tr>
                            <tr>
                                <td class="SelectRowClear">Adjustment Type</td>
                                <td class="GridRowClear">
                                    <asp:DropDownList ID="ddlAdjustment" runat="server" BackColor="White" CssClass="TextBox"
                                        DataSourceID="dsAdjustment" DataTextField="AccAdjustmentTypeName" DataValueField="AccAdjustmentTypeID" />
                                    <asp:ObjectDataSource ID="dsAdjustment" runat="server" OldValuesParameterFormatString="original_{0}"
                                        TypeName="AccUnitsTableAdapters.AccAdjustmentTypeTableAdapter" SelectMethod="GetData" />
                                </td>
                            </tr>
                        </asp:Panel>
                        <asp:Panel runat="server" ID="pnlAcount" Visible="false">
                            <tr>
                                <td class="GridRow1TB" style="height: 5px;" colspan="2"></td>
                            </tr>
                            <tr>
                                <td class="SelectRow1B">Pay Mode</td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlPayMode" runat="server" BackColor="White" CssClass="TextBox"
                                        DataSourceID="dsPayMode" DataTextField="PayModeID" DataValueField="PayModeID" />
                                    <asp:ObjectDataSource ID="dsPayMode" runat="server" OldValuesParameterFormatString="original_{0}"
                                        TypeName="TourOperTableAdapters.PayModeTableAdapter" SelectMethod="GetData" />
                                </td>
                            </tr>
                            <tr>
                                <td class="SelectRow1B">Bank Charge</td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="txtBankCharge" runat="server" CssClass="TextBox"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="SelectRow1B">Bank Account</td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlAccount" runat="server" BackColor="White" CssClass="TextBox" AppendDataBoundItems="true"
                                        DataSourceID="dsAccount" DataTextField="Account" DataValueField="HotelBankID" >
                                        <%--<asp:ListItem Text="none" Value="" />--%>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsAccount" runat="server" OldValuesParameterFormatString="original_{0}"
                                        TypeName="AccUnitsTableAdapters.HotelBankAccountTableAdapter" SelectMethod="GetData" >
                                        <SelectParameters>
                                            <asp:ControlParameter Name="HotelID" Type="Int32" ControlID="ctrlHotel" PropertyName="SelectedHotel" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="SelectRowClear">Income Type</td>
                                <td class="GridRowClear">
                                    <asp:DropDownList ID="ddlIncome" runat="server" BackColor="White" CssClass="TextBox" AppendDataBoundItems="true"
                                        DataSourceID="dsInclome" DataTextField="AccIncomeTypeName" DataValueField="AccIncomeTypeID"  >
                                        <asp:ListItem Text="none" Value="" />
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsInclome" runat="server" OldValuesParameterFormatString="original_{0}"
                                        TypeName="AccUnitsTableAdapters.AccIncomeTypeTableAdapter" SelectMethod="GetActive" >
                                        <SelectParameters>
                                            <asp:Parameter Name="ActiveOnly" Type="Boolean" DefaultValue="True" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                        </asp:Panel>
                        <asp:Panel runat="server" ID="pnlInvoice" Visible="false">
                            <asp:UpdatePanel ID="upInvoice" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <tr>
                                        <td class="GridRow1TB" style="height: 5px;" colspan="2"></td>
                                    </tr>
                                    <tr>
                                        <td class="SelectRow1B">Invoice Number</td>
                                        <td class="GridRow1B">
                                            <asp:DropDownList ID="ddlInvoice" runat="server" BackColor="White" CssClass="TextBox" AppendDataBoundItems="true"
                                                DataSourceID="dsInvoices" DataTextField="InvText" DataValueField="InvoiceID"
                                                AutoPostBack="true">
                                                <asp:ListItem Text="none" Value="" />
                                            </asp:DropDownList>
                                            <asp:ObjectDataSource ID="dsInvoices" runat="server" OldValuesParameterFormatString="original_{0}"
                                                SelectMethod="GetData" TypeName="dsAccRegistrationTableAdapters.vwAccRegInvoicesTableAdapter">
                                                <SelectParameters>
                                                    <asp:ControlParameter Name="HotelID" Type="Int32" ControlID="ctrlHotel" PropertyName="SelectedHotel" />
                                                    <asp:ControlParameter Name="TourOpID" Type="Int32" ControlID="ctrlTourOp" PropertyName="SelectedTourOp" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                            <asp:CheckBox ID="cbInvoiceDate" runat="server" Text="Document Date Same as Invoice" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="SelectRowClear" style="height: 25px;">Booking</td>
                                        <td class="GridRowClear">
                                            <asp:CheckBoxList ID="cblBooking" runat="server" CssClass="TextBox" DataSourceID="dsBooking"
                                                DataTextField="ResText" DataValueField="DetailID" />
                                            <asp:ObjectDataSource ID="dsBooking" runat="server" OldValuesParameterFormatString="original_{0}"
                                                SelectMethod="GetData" TypeName="dsAccRegistrationTableAdapters.vwAccRegInvoicesResTableAdapter">
                                                <SelectParameters>
                                                    <asp:ControlParameter Name="InvoiceID" Type="Int32" ControlID="ddlInvoice" PropertyName="SelectedValue" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                        </td>
                                    </tr>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </asp:Panel>
                        <asp:Panel runat="server" ID="pnlStatistic" Visible="false">
                            <tr>
                                <td class="SelectRow1T">Statistics</td>
                                <td class="GridRow1T" align="left" valign="middle">
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td style="width: 70px; text-align: right; padding-right: 5px;">
                                                Nights
                                            </td>
                                            <td style="width: 80px;">
                                                <uc:InputIntegerControl ID="txtNights" runat="server" IntegerValue='<%# Bind("RoomNights") %>' />
                                            </td>
                                            <td style="width: 77px; text-align: right; padding-right: 5px;">
                                                Adult Pax
                                            </td>
                                            <td style="width: 80px;">
                                                <uc:InputIntegerControl ID="txtAPax" runat="server" IntegerValue='<%# Bind("AdultPax") %>' />
                                            </td>
                                            <td style="width: 70px; text-align: right; padding-right: 5px;">
                                                Child Pax
                                            </td>
                                            <td style="width: 80px;">
                                                <uc:InputIntegerControl ID="txtCPax" runat="server" IntegerValue='<%# Bind("ChildPax") %>' />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </asp:Panel>
                        <asp:Panel runat="server" ID="pnlAdditional" style="padding-left: 5px;" Visible="false">
                            <tr>
                                <td class="GridRow1TB" style="height: 5px;" colspan="2"></td>
                            </tr>
                            <tr>
                                <td class="SelectRow1B">Invoice #</td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="AdditionalInvoice" runat="server" CssClass="TextBox" />
                                </td>
                            </tr>
                            <tr>
                                <td class="SelectRow1B">First Name</td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="AdditionalName" runat="server" CssClass="TextBox" />
                                </td>
                            </tr>
                            <tr>
                                <td class="SelectRow1B">Last Name</td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="AdditionalLastName" runat="server" CssClass="TextBox" />
                                </td>
                            </tr>
                            <tr>
                                <td class="SelectRow1B">Booking #</td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="AdditionalBooking" runat="server" CssClass="TextBox" />
                                </td>
                            </tr>
                            <tr>
                                <td class="SelectRow1B">Check In</td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="AdditionalCheckIn" runat="server" CssClass="TextBox" />
                                </td>
                            </tr>
                            <tr>
                                <td class="SelectRowClear">Check Out</td>
                                <td class="GridRowClear">
                                    <asp:TextBox ID="AdditionalCheckOut" runat="server" CssClass="TextBox" />
                                </td>
                            </tr>
                        </asp:Panel>
                        <asp:Panel runat="server" ID="pnlInfo" Visible="false">
                            <tr>
                                <td class="GridRow1TB" style="height: 5px;" colspan="2"></td>
                            </tr>
                            <tr>
                                <td class="SelectRow1B">Reference</td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="txtReference" runat="server" CssClass="TextBox" />
                                </td>
                            </tr>
                            <tr>
                                <td class="SelectRow1B">Reception Date</td>
                                <td class="GridRow1B">
                                    <uc:InputDateControl ID="dateReception" runat="server" DefaultNow="false" Mandatory="false" />
                                </td>
                            </tr>
                            <tr>
                                <td class="SelectRow1B">Approval Date</td>
                                <td class="GridRow1B">
                                    <uc:InputDateControl ID="dateApproval" runat="server" DefaultNow="false" Mandatory="false" />
                                </td>
                            </tr>
                            <tr>
                                <td class="SelectRowClear">Note</td>
                                <td class="GridRowClear">
                                    <asp:TextBox ID="txtNote" runat="server" CssClass="TextBox" MaxLength="2000" TextMode="MultiLine"
                                        onkeyup="return checkMaxLen(this,2001)" />
                                    <asp:RegularExpressionValidator ID="len_txtNote" runat="server" Display="None" ValidationExpression="^[\s\S]{0,2000}$"
                                        ErrorMessage="Not more than 2000 charcters" ControlToValidate="txtNote" />
                                    <asp:ValidatorCalloutExtender ID="ex_len_txtNote" runat="server" TargetControlID="len_txtNote" />
                                </td>
                            </tr>
                        </asp:Panel>
                        <tr>
                            <td class="GridRow2T" colspan="2" style="padding-top: 5px; text-align: right;" >
                                <asp:Button ID="btnBack" runat="server" SkinID="skBtnBase" Text="< Back" Visible="false" />&nbsp;
                                <asp:Button ID="btnRegister" runat="server" SkinID="skBtnBase" Text="Register" Visible="false" />&nbsp;
                                <asp:Button ID="btnCancel" runat="server" SkinID="skBtnBase" Text="Cancel" Visible="false" />&nbsp;
                                <asp:Button ID="btnUpdate" runat="server" SkinID="skBtnBase" Text="Next >" />&nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <uc:MessagePop ID="msgPop" runat="server" Title="Accounting Document Registration" />

    </div>
</asp:Content>

