<%@ Page Title="" Language="VB" MasterPageFile="~/Accounting/masterAccounting.master" 
    AutoEventWireup="false" EnableEventValidation="false" CodeFile="AccDocDetailNew.aspx.vb" 
    Inherits="Accounting_AccDocDetailNew" MaintainScrollPositionOnPostback="true" %>

<%@ MasterType VirtualPath="~/Accounting/masterAccounting.master" %>
<%@ Register Src="~/App_UserControls/HotelControl.ascx" TagName="HotelControl" TagPrefix="uc" %>
<%@ Register Src="~/App_UserControls/TourOpControl.ascx" TagName="TourOpControl" TagPrefix="uc" %>
<%@ Register Src="~/App_UserControls/InputDateControl.ascx" TagName="InputDateControl" TagPrefix="uc" %>
<%@ Register Src="~/App_UserControls/InputIntegerControl.ascx" TagName="InputIntegerControl" TagPrefix="uc" %>
<%@ Register Src="~/App_UserControls/MessagePop.ascx" TagName="MessagePop" TagPrefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Accounting Document Detail
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AccountContent" runat="Server">
    <script type="text/javascript">
        function checkMaxLen(txt, maxLen) {
            try {
                if (txt.value.length > (maxLen - 1)) {
                    var cont = txt.value;
                    txt.value = cont.substring(0, (maxLen - 1));
                    return false;
                };
            } catch (e) {
            }
        }
        
        function BookingUpdated() {
            document.getElementById('<%=btnRefresh.ClientID%>').click();
        }
    </script>
    <asp:HiddenField ID="hfLocal" runat="server" />
    <table cellpadding="0" cellspacing="2">
        <tr>
            <td class="GridLabelBG">
                <asp:Label ID="lbDetails" runat="server" Text="Document Details" SkinID="skGridLabel" />
                <asp:CheckBox ID="cbHotel" runat="server" Text="Show Htl.Amount" TextAlign="Left" 
                    AutoPostBack="True" style="float: right; margin-right: 5px; color: White;"/>
            </td>
        </tr>
        <tr>
            <td class="GridBorder" valign="top">
                <table cellpadding="0" cellspacing="2">
                    <tr>
                        <td> 
                            <asp:HiddenField ID="hfUser" runat="server" />
                            <asp:HiddenField ID="hfEditMode" runat="server" Value="Preview" />
                            <asp:FormView ID="fvDocDetail" runat="server" DataKeyNames="DocumentID" DataSourceID="dsAccTransDoc">
                                <EditItemTemplate>
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="GridRow1B" style="text-align: right; padding-right: 2px;">
                                                <b><%#Eval("DocCode")%></b>
                                            </td>
                                            <td class="GridRow1B" style="text-align: left; padding-left: 4px;" >
                                                <b><%#Eval("DocNumber")%></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="SelectRow1B" style="width: 100px; padding-left: 4px;"> Tour Operator </td>
                                            <td class="GridRow1B" style="width: 470px;" >
                                                <asp:DropDownList ID="ddlTourOp" runat="server" CssClass="TextBox" SelectedValue='<%# Bind("TourOpId") %>'
                                                    DataSourceID="wsTourOp" DataValueField="TourOpID" DataTextField="TourOp" 
                                                    AutoPostBack="true" Enabled='<%# Master.CanEdit()%>' /> 
                                                <asp:ObjectDataSource ID="wsTourOp" runat="server" 
                                                    TypeName="dsAccRegistrationTableAdapters.UserTourOpsTableAdapter" SelectMethod="GetData" >
                                                    <SelectParameters>
                                                        <asp:ControlParameter Name="UserName" Type="String" ControlID="hfUser" PropertyName="Value" />
                                                    </SelectParameters>
                                                </asp:ObjectDataSource>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="SelectRow1B" style="padding-left: 4px;"> Date </td>
                                            <td class="GridRow1B" >
                                                <asp:TextBox ID="txtDate" runat="server" CssClass="TextBox" 
                                                    Text='<%# Bind("DocDate","{0:d}") %>' Enabled='<%# Master.CanEdit()%>' />
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
                                            <td class="SelectRow1B" style="width: 100px; padding-left: 4px;"> Department </td>
                                            <td class="GridRow1B" style="width: 470px;" >
                                                <asp:DropDownList ID="ddlDep" runat="server" BackColor="White" CssClass="TextBox" />
                                                <asp:CascadingDropDown ID="exDep" runat="server" 
                                                    TargetControlID="ddlDep" Category="DepID" 
                                                    ServicePath="~/DepEmp.asmx"
                                                    ServiceMethod="GetDepID"
                                                    UseContextKey="true"
                                                    ContextKey=""
                                                    SelectedValue='<%# Bind("DepID") %>' >
                                                </asp:CascadingDropDown>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="SelectRow1B" style="padding-left: 4px;"> Employee </td>
                                            <td class="GridRow1B" >
                                                <asp:DropDownList ID="ddlEmp" runat="server" BackColor="White" CssClass="TextBox" />
                                                <asp:CascadingDropDown ID="exEmp" runat="server" 
                                                    ParentControlID="ddlDep"
                                                    TargetControlID="ddlEmp" Category="EmpID" 
                                                    ServicePath="~/DepEmp.asmx"
                                                    ServiceMethod="GetEmpID"
                                                    SelectedValue='<%# Bind("EmpID") %>' >
                                                </asp:CascadingDropDown>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="SelectRow1B" style="padding-left: 4px;"> Unit </td>
                                            <td class="GridRow1B" >
                                                <asp:DropDownList ID="ddlUnit" runat="server" BackColor="White" CssClass="TextBox" />
                                                <asp:CascadingDropDown ID="exUnit" runat="server" 
                                                    ParentControlID="ddlDep"
                                                    TargetControlID="ddlUnit" Category="UnitID" 
                                                    ServicePath="~/DepEmp.asmx"
                                                    ServiceMethod="GetUnitID"
                                                    SelectedValue='<%# Bind("AccBusinessUnitID") %>' >
                                                </asp:CascadingDropDown>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="SelectRow1B" style="padding-left: 4px;"> Adjustment Type </td>
                                            <td class="GridRow1B">
                                                <asp:DropDownList ID="ddlAdjustment" runat="server" BackColor="White" CssClass="TextBox"
                                                    DataSourceID="dsAdjustment" SelectedValue='<%# Bind("AccAdjustmentTypeID") %>'
                                                    DataTextField="AccAdjustmentTypeName" DataValueField="AccAdjustmentTypeID" 
                                                    AppendDataBoundItems="true">
                                                    <asp:ListItem Text="...pleease select adjustment type" Value="" />
                                                </asp:DropDownList>
                                                <asp:ObjectDataSource ID="dsAdjustment" runat="server" OldValuesParameterFormatString="original_{0}"
                                                    TypeName="AccUnitsTableAdapters.AccAdjustmentTypeTableAdapter" SelectMethod="GetData" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="SelectRow1B" style="padding-left: 4px;"> Amount </td>
                                            <td class="GridRow1B" >
                                                <asp:TextBox ID="txtAmount" runat="server" CssClass="TextBox" 
                                                    Text='<%# Bind("Amount","{0:N2}") %>' Enabled='<%# Master.CanEdit()%>' />
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
                                        <asp:Panel runat="server" ID="pnlPayMode" Visible='<%# Master.ShwPayMode() %>'>
                                        <tr>
                                            <td class="SelectRow1B" style="padding-left: 4px;"> Pay Mode </td>
                                            <td class="GridRow1B">
                                                <asp:DropDownList ID="ddlPayMode" runat="server" BackColor="White"
                                                    CssClass="TextBox" DataSourceID="dsPayMode" DataTextField="PayModeID" AppendDataBoundItems="true"
                                                    DataValueField="PayModeID" SelectedValue='<%# Bind("PayModeID") %>' >
                                                    <asp:ListItem Value="">-</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:ObjectDataSource ID="dsPayMode" runat="server" OldValuesParameterFormatString="original_{0}" 
                                                    SelectMethod="GetData" TypeName="TourOperTableAdapters.PayModeTableAdapter">
                                                </asp:ObjectDataSource>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="SelectRow1B" style="padding-left: 4px;"> Bank Charge </td>
                                            <td class="GridRow1B">
                                                <asp:TextBox ID="txtBankCharge" runat="server" CssClass="TextBox" 
                                                    Text='<%# Bind("BAmount","{0:F2}") %>' Enabled='<%# Master.CanEdit()%>' />
                                                <asp:CompareValidator ID="txtBankCharge_CompareValidator" runat="server" ControlToValidate="txtBankCharge"
                                                    Operator="DataTypeCheck" Type="Double" SkinID="skInteger" />
                                                <asp:ValidatorCalloutExtender ID="txtBankCharge_ValidatorCalloutExtender" runat="server"
                                                    TargetControlID="txtBankCharge_CompareValidator" SkinID="skExtender" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="SelectRow1B" style="padding-left: 4px;"> Income Type </td>
                                            <td class="GridRow1B">
                                                <asp:DropDownList ID="ddlIncome" runat="server" BackColor="White" CssClass="TextBox" AppendDataBoundItems="true"
                                                    DataSourceID="dsInclome" DataTextField="AccIncomeTypeName" DataValueField="AccIncomeTypeID" 
                                                    SelectedValue='<%# Bind("AccIncomeTypeID") %>'>
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
                                        <tr>
                                            <td class="SelectRow1B" style="padding-left: 4px;">Hotel % </td>
                                            <td class="GridRow1B">
                                                <asp:TextBox ID="txtHPercent" runat="server" CssClass="TextBox" 
                                                    Text='<%# Bind("HPercent","{0:F2}") %>' Enabled='<%# Master.CanEdit()%>' />
                                                <asp:CompareValidator ID="double_txtHPercent" runat="server" ControlToValidate="txtHPercent"
                                                    Operator="DataTypeCheck" Type="Double" SkinID="skInteger" />
                                                <asp:ValidatorCalloutExtender ID="ex_double_txtHPercent" runat="server"
                                                    TargetControlID="double_txtHPercent" SkinID="skExtender" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="SelectRow1B" style="padding-left: 4px;"> Hotel Amount </td>
                                            <td class="GridRow1B">
                                                <asp:TextBox ID="txtHAmount" runat="server" CssClass="TextBox" 
                                                    Text='<%# Eval("HAmount","{0:N2}") %>' Enabled="false" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="SelectRow1B" style="padding-left: 4px;"> Reference </td>
                                            <td class="GridRow1B">
                                                <asp:TextBox ID="txtReference" runat="server" CssClass="TextBox" Text='<%# Bind("Reference") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="SelectRow1B" style="padding-left: 4px;">Invoice Number</td>
                                            <td class="GridRow1B">
                                                <asp:HiddenField ID="hfHotelID" runat="server" Value='<%# Bind("HotelId") %>' />
                                                <asp:HiddenField ID="hfRefInvoice" runat="server" Value='<%# Bind("RefInvoice") %>' />
                                                <asp:DropDownList ID="ddlInvoice" runat="server" CssClass="TextBox" AppendDataBoundItems="true"
                                                    DataSourceID="dsInvoices" DataTextField="InvText" DataValueField="InvoiceID" 
                                                    AutoPostBack="true" OnDataBound="ddlInvoice_DataBound" EnableViewState="false" >
                                                    <asp:ListItem Text="none" Value="" />
                                                </asp:DropDownList>
                                                <asp:ObjectDataSource ID="dsInvoices" runat="server" OldValuesParameterFormatString="original_{0}"
                                                    SelectMethod="GetData" TypeName="dsAccRegistrationTableAdapters.vwAccRegInvoicesTableAdapter" >
                                                    <SelectParameters>
                                                        <asp:ControlParameter Name="HotelID" Type="Int32" ControlID="hfHotelID" PropertyName="Value" />
                                                        <asp:ControlParameter Name="TourOpID" Type="Int32" ControlID="ddlTourOp" PropertyName="SelectedValue" />
                                                    </SelectParameters>
                                                </asp:ObjectDataSource>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="SelectRow1B" style="height: 25px; padding-left: 4px;">Booking</td>
                                            <td class="GridRow1B">
                                                <asp:HiddenField ID="hfRefReservation" runat="server" Value='<%# Bind("RefReservation") %>' />
                                                <asp:CheckBoxList ID="cblBooking" runat="server" CssClass="TextBox" DataSourceID="dsBooking"
                                                    DataTextField="ResText" DataValueField="DetailID" 
                                                    ondatabound="cblBooking_DataBound" />
                                                <asp:ObjectDataSource ID="dsBooking" runat="server" OldValuesParameterFormatString="original_{0}"
                                                    SelectMethod="GetData" TypeName="dsAccRegistrationTableAdapters.vwAccRegInvoicesResTableAdapter">
                                                    <SelectParameters>
                                                        <asp:ControlParameter Name="InvoiceID" Type="Int32" ControlID="ddlInvoice" PropertyName="SelectedValue" />
                                                    </SelectParameters>
                                                </asp:ObjectDataSource>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="SelectRow1B" style="padding-left: 4px;">Reception Date</td>
                                            <td class="GridRow1B">
                                                <uc:InputDateControl ID="dateReception" runat="server" DefaultNow="false" Mandatory="false" TextValue='<%# Bind("InfoReceptionDate","{0:d}") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="SelectRow1B" style="padding-left: 4px;">Approval Date</td>
                                            <td class="GridRow1B">
                                                <uc:InputDateControl ID="dateApproval" runat="server" DefaultNow="false" Mandatory="false" TextValue='<%# Bind("InfoApprovalDate","{0:d}") %>' />
                                            </td>
                                        </tr>
                                        <asp:Panel runat="server" ID="pnlStatisticE" Visible='<%# Eval("Statistic") %>'>
                                        <tr>
                                            <td class="SelectRow1B" style="padding-left: 4px;">Statistics</td>
                                            <td class="GridRow1B" align="left" valign="middle">
                                                <table cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td style="width: 61px; text-align: right; padding-right: 5px;">
                                                            Nights
                                                        </td>
                                                        <td style="width: 80px;">
                                                            <uc:InputIntegerControl ID="txtNights" runat="server" TextValue='<%# Bind("RoomNights") %>' />
                                                        </td>
                                                        <td style="width: 77px; text-align: right; padding-right: 5px;">
                                                            Adult Pax
                                                        </td>
                                                        <td style="width: 80px;">
                                                            <uc:InputIntegerControl ID="txtAPax" runat="server" TextValue='<%# Bind("AdultPax") %>' />
                                                        </td>
                                                        <td style="width: 70px; text-align: right; padding-right: 5px;">
                                                            Child Pax
                                                        </td>
                                                        <td style="width: 80px;">
                                                            <uc:InputIntegerControl ID="txtCPax" runat="server" TextValue='<%# Bind("ChildPax") %>' />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        </asp:Panel>
                            <tr>
                                <td class="SelectRow1B">Invoice #</td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="AdditionalInvoice" runat="server" CssClass="TextBox" Text='<%# Bind("AdditionalInvoicenumber") %>'/>
                                </td>
                            </tr>
                            <tr>
                                <td class="SelectRow1B">Name</td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="AdditionalName" runat="server" CssClass="TextBox" Text='<%# Bind("AdditionalFirstName") %>'/>
                                </td>
                            </tr>
                            <tr>
                                <td class="SelectRow1B">Last Name</td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="AdditionalLastName" runat="server" CssClass="TextBox" Text='<%# Bind("AdditionalLastName") %>'/>
                                </td>
                            </tr>
                            <tr>
                                <td class="SelectRow1B">Booking #</td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="AdditionalBooking" runat="server" CssClass="TextBox" Text='<%# Bind("AdditionalBookingName") %>'/>
                                </td>
                            </tr>
                            <tr>
                                <td class="SelectRow1B">Check In</td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="AdditionalCheckIn" runat="server" CssClass="TextBox" Text='<%# Bind("AdditionalCheckIn") %>'/>
                                </td>
                            </tr>
                            <tr>
                                <td class="SelectRow1B">Check Out</td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="AdditionalCheckOut" runat="server" CssClass="TextBox" Text='<%# Bind("AdditionalCheckOut") %>'/>
                                </td>
                            </tr>
                                        <tr>
                                            <td class="SelectRowClear" style="padding-left: 4px;"> Note </td>
                                            <td class="GridRowClear">
                                                <asp:TextBox ID="txtNote" runat="server" CssClass="TextBox" TextMode="MultiLine"
                                                    Text='<%# Bind("Note") %>' MaxLength="2000" onkeyup="return checkMaxLen(this,2001)" />
                                                <asp:RegularExpressionValidator ID="len_txtNote" runat="server" Display="None" ValidationExpression="^[\s\S]{0,2000}$"
                                                    ErrorMessage="Not more than 2000 charcters" ControlToValidate="txtNote" />
                                                <asp:ValidatorCalloutExtender ID="ex_len_txtNote" runat="server" TargetControlID="len_txtNote" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="GridRow2T" style="text-align: right; padding-top: 5px;" colspan="2">
                                                <asp:Button ID="btnUpdate" runat="server" SkinID="skBtnBase" Text="Update" CommandName="UpdateDoc" style="margin-left: 5px;"/>
                                                <asp:Button ID="btnCancel" runat="server" SkinID="skBtnBase" Text="Cancel" CommandName="Cancel" CausesValidation="False" />
                                            </td>
                                        </tr>
                                    </table>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="GridRow1B" style="text-align: right; padding-right: 2px;">
                                                <b><%#Eval("DocCode")%></b>
                                            </td>
                                            <td class="GridRow1B" style="text-align: left; padding-left: 4px;" >
                                                <b><%#Eval("DocNumber")%></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="SelectRow1B" style="width: 100px; padding-left: 4px;"> Tour Operator </td>
                                            <td class="GridRow1B" style="width: 470px; padding-left: 4px;"><%#Eval("TourOp")%></td>
                                        </tr>
                                        <tr>
                                            <td class="SelectRow1B" style="padding-left: 4px;"> Date </td>
                                            <td class="GridRow1B" style="padding-left: 4px;"><%#Eval("DocDate", "{0:d}")%></td>
                                        </tr>
                                        <tr>
                                            <td class="SelectRow1B" style="padding-left: 4px;"> Department </td>
                                            <td class="GridRow1B" style="padding-left: 4px;">
                                                <%#Eval("DepName")%>
                                                <asp:ImageButton runat="server" ID="btDepartment" ImageUrl="~/Images/edit_inline.gif"
                                                    Visible='<%# CanApprove() %>' style="float: right;" />
                                                <asp:ModalPopupExtender runat="server" BackgroundCssClass="modalBackground" 
                                                    ID="popDepartment" X="100" Y="310" 
                                                    TargetControlID="btDepartment" 
                                                    OkControlID="DepartmentOK" 
                                                    CancelControlID="DepartmentOK"
                                                    PopupControlID="popDepartmentDiv" >
                                                </asp:ModalPopupExtender>
                                                <div style="display: none">
                                                    <input id="DepartmentOK" value="Done" type="button" onclick="BookingUpdated();" />
                                                </div>
                                                <div id="popDepartmentDiv" style="display: none; overflow: auto;">
                                                    <iframe id="IframeBook" frameborder="0" style="width: 1920px; height: 5000px; overflow: visible;"
                                                        scrolling="no" marginheight="10px" marginwidth="10px" src='<%=DepartmentSrc()%>'  >
                                                    </iframe>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="SelectRow1B" style="padding-left: 4px;"> Employee </td>
                                            <td class="GridRow1B" style="padding-left: 4px;"><%#Eval("EmpName")%></td>
                                        </tr>
                                        <tr>
                                            <td class="SelectRow1B" style="padding-left: 4px;"> Unit </td>
                                            <td class="GridRow1B" style="padding-left: 4px;"><%#Eval("AccBusinessUnitName")%></td>
                                        </tr>
                                        <tr>
                                            <td class="SelectRow1B" style="padding-left: 4px;"> Adjustment Type </td>
                                            <td class="GridRow1B" style="padding-left: 4px;"><%#Eval("AccAdjustmentTypeName")%></td>
                                        </tr>
                                        <tr>
                                            <td class="SelectRow1B" style="padding-left: 4px;"> Amount </td>
                                            <td class="GridRow1B">
                                                <asp:Label ID="txtAmount" runat="server" Text='<%# Eval("Amount", "{0:N2}") %>' 
                                                    Font-Bold="true" Width="100px" style="text-align: right;" />
                                            </td>
                                        </tr>
                                        <asp:Panel runat="server" ID="pnlPayMode" Visible='<%# Master.ShwPayMode() %>'>
                                            <tr>
                                                <td class="SelectRow1B" style="padding-left: 4px;"> Pay Mode </td>
                                                <td class="GridRow1B" style="padding-left: 4px;"><%#Eval("PayModeID")%></td>
                                            </tr>
                                            <tr>
                                                <td class="SelectRow1B" style="padding-left: 4px;"> Bank Charge </td>
                                                <td class="GridRow1B" style="padding-left: 4px;"><%#Eval("BAmount", "{0:N2}")%></td>
                                            </tr>
                                            <tr>
                                                <td class="SelectRow1B" style="padding-left: 4px;"> Bank Account </td>
                                                <td class="GridRow1B" style="padding-left: 4px;"><%#Eval("BankName")%>,&nbsp;<%#Eval("BankAccount")%></td>
                                            </tr>
                                            <tr>
                                                <td class="SelectRow1B" style="padding-left: 4px;"> Income Type </td>
                                                <td class="GridRow1B" style="padding-left: 4px;"><%#Eval("AccIncomeTypeName")%></td>
                                            </tr>
                                        </asp:Panel>
                                        <asp:Panel runat="server" ID="pnlHCheck" Visible='<%# cbHotel.Checked %>' >
                                            <tr>
                                                <td class="SelectRow1B" style="padding-left: 4px;"> Hotel % </td>
                                                <td class="GridRow1B" style="padding-left: 4px;"><%#Eval("HPercent", "{0:N2}")%></td>
                                            </tr>
                                            <tr>
                                                <td class="SelectRow1B" style="padding-left: 4px;"> Hotel Amount </td>
                                                <td class="GridRow1B" >
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("HAmount", "{0:N2}") %>' 
                                                        Font-Bold="true" Width="100px" style="text-align: right;" />
                                                </td>
                                            </tr>
                                        </asp:Panel> 
                                        <tr>
                                            <td class="SelectRow1B" style="padding-left: 4px;"> Reference </td>
                                            <td class="GridRow1B" style="padding-left: 4px;"><%#Eval("Reference")%></td>
                                        </tr>
                                        <tr>
                                            <td class="SelectRow1B" style="padding-left: 4px;">Info</td>
                                            <td class="GridRow1B" style="padding-left: 4px;">
                                                <%#InfoInvoice(Eval("InfoInvoice"))%>
                                                <%#InfoReservations(Eval("InfoReservation"))%>
                                                <%#InfoDates(Eval("InfoReceptionDate", "{0:d}"), Eval("InfoApprovalDate", "{0:d}"))%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="SelectRow1B" style="padding-left: 4px;">Additional</td>
                                            <td class="GridRow1B" style="padding-left: 4px;">
                                                <%#Liability(Eval("AccLiabilityConceptName"))%>
                                                <%#Transfer(Eval("AccTransferTypeName"))%>
                                                <%#AdditionalInvoice(Eval("AdditionalInvoicenumber"))%>
                                                <%#AdditionalBooking(Eval("AdditionalBookingName"))%>
                                                <%#AdditionalName(Eval("AdditionalFirstName"), Eval("AdditionalLastName"))%>
                                                <%#AdditionalDates(Eval("AdditionalCheckIn"), Eval("AdditionalCheckOut"))%>
                                            </td>
                                        </tr>
                                        <asp:Panel runat="server" ID="pnlStatistic" Visible='<%# Eval("Statistic") %>'>
                                            <tr>
                                                <td class="SelectRow1B" style="padding-left: 4px;">Statistics</td>
                                                <td class="GridRow1B" style="padding-left: 4px;">
                                                    Nights:&nbsp;
                                                    <asp:Label ID="lblNights" runat="server" Text='<%# Eval("RoomNights") %>' style="margin-right: 15px;" />
                                                    Adult Pax:&nbsp;
                                                    <asp:Label ID="lblPax" runat="server" Text='<%# Eval("AdultPax") %>' style="margin-right: 15px;" />
                                                    Child Pax:&nbsp;
                                                    <asp:Label ID="lblChldPax" runat="server" Text='<%# Eval("ChildPax") %>' style="margin-right: 15px;" />
                                                </td>
                                            </tr>
                                        </asp:Panel>
                                        <tr>
                                            <td class="SelectRowClear" style="padding-left: 4px;"> Note </td>
                                            <td class="GridRowClear" style="padding-left: 4px;">
                                                <asp:Label ID="lblNote" runat="server" TextMode="MultiLine" Text='<%# Eval("Note") %>' Visible='<%# Not Eval("Note") Is DBNull.Value %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="GridRow2T" colspan="2" style="text-align: right; padding-top: 5px;">
                                                <asp:Panel ID="pnlEdit" runat="server" CssClass="GridRow1B" Visible='<%# Master.CanEdit() Or Master.CanModify() %>' 
                                                    style="padding-bottom: 4px; margin-bottom: 4px;">
                                                    <asp:Button ID="btCancel" runat="server" Text="Cancel" OnClientClick="return confirm('Are you sure you want to CANCEL this document?')"
                                                        CommandName="CancelDoc" CommandArgument='<%# Eval("DocumentID") %>' Visible='<%# Master.CanEdit() %>'
                                                        CssClass="ButtonRed" style="float: left;" />
                                                    <asp:Button ID="btUnCancel" runat="server" Text="Uncancel" OnClientClick="return confirm('Are you sure you want to UNCANCEL this document?')"
                                                        CommandName="CancelDoc" CommandArgument='<%# Eval("DocumentID") %>' Visible='False' 
                                                        CssClass="ButtonRed" style="float: left;" />
                                                    <asp:Button ID="btEdit" runat="server" CommandName="DocEdit" SkinID="skBtnBase" Text="Edit" Visible='<%# Master.CanEdit() %>' />
                                                    <asp:Button ID="btModify" runat="server" CommandName="DocModify" SkinID="skBtnBase" Text="Modify" Visible='<%# Not Master.CanEdit() And Master.CanModify() %>' />
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:FormView>
                        </td>
                    </tr>
                    <asp:PlaceHolder ID="pnlFunctions" runat="server">
                    <tr>
                        <td colspan="2" style="text-align: right; padding: 0px 0px 4px 0px;">
                            <asp:Button ID="btnGroup" runat="server" SkinID="skBtnBase" Text="Apply to Group Invoices" style="margin-left: 5px;" />
                            <asp:Button ID="btnByBooking" runat="server" SkinID="skBtnBase" Text="Apply by Bookings" style="margin-left: 5px;" />
                            <asp:Button ID="btnApply" runat="server" SkinID="skBtnBase" Text="Apply" style="margin-left: 5px;" />
                            <asp:Button ID="btnTransfer" runat="server" SkinID="skBtnBase" Text="Transfer" style="margin-left: 5px;" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: left; padding: 4px 0px 4px 0px; border: solid 1px;">
                            <asp:CheckBox ID="cbCanceled" runat="server" AutoPostBack="True" Text="Show Cancelled" TextAlign="Left" style="margin-left: 10px;" />
                            <asp:Button ID="btnPrintA_InitButton" runat="server" SkinID="skBtnBase" Text="Initial ACCT" style="margin-left: 5px;" />
                            <asp:Button ID="btnPrintA" runat="server" SkinID="skBtnBase" Text="Report ACCT" style="margin-left: 5px;" />
                            <asp:Button ID="btnPrintT" runat="server" SkinID="skBtnBase" Text="Report Tr" style="margin-left: 5px;" />
                        </td>
                    </tr>
                    </asp:PlaceHolder>
                </table>
            </td>
        </tr>
    </table>
    <uc:MessagePop ID="msgPopMain" runat="server" Title="Accounting Document Details" />

    <asp:Button ID="btnRefresh" runat="server" Style="display: none;"  />
    <asp:ModalPopupExtender runat="server" BackgroundCssClass="modalBackground" 
        ID="popByBookExtender" X="0" Y="160" 
        TargetControlID="btnByBooking" 
        OkControlID="byBookOK" 
        CancelControlID="byBookCancel"
        PopupControlID="popByBookDiv" >
    </asp:ModalPopupExtender>
    <div style="display: none">
        <input id="byBookOK" value="Done" type="button" />
        <input id="byBookCancel" value="Cancel" type="button" />
    </div>
    <div id="popByBookDiv" style="display: none; overflow: auto;">
        <iframe id="IframeBook" frameborder="0" style="width: 1920px; height: 5000px; overflow: visible;"
            scrolling="no" marginheight="10px" marginwidth="10px" src='<%=ByBookingSrc()%>'  >
        </iframe>
    </div>

    <asp:ModalPopupExtender runat="server" BackgroundCssClass="modalBackground" 
        ID="popByAnyExtender" X="0" Y="160" 
        TargetControlID="btnApply" 
        OkControlID="byAnyOK" 
        CancelControlID="byAnyCancel"
        PopupControlID="popByAnyDiv" >
    </asp:ModalPopupExtender>
    <div style="display: none">
        <input id="byAnyOK" value="Done" type="button" />
        <input id="byAnyCancel" value="Cancel" type="button" />
    </div>
    <div id="popByAnyDiv" style="display: none; overflow: auto;">
        <iframe id="IframeAny" frameborder="0" style="width: 1920px; height: 5000px; overflow: visible;"
            scrolling="no" marginheight="10px" marginwidth="10px" src='<%=ByAnySrc()%>'  >
        </iframe>
    </div>

    <asp:ModalPopupExtender runat="server" BackgroundCssClass="modalBackground" 
        ID="popGroupExtender" X="0" Y="160" 
        TargetControlID="btnGroup" 
        OkControlID="groupOK" 
        CancelControlID="groupCancel"
        PopupControlID="popGroupDiv" >
    </asp:ModalPopupExtender>
    <div style="display: none">
        <input id="groupOK" value="Done" type="button" />
        <input id="groupCancel" value="Cancel" type="button" />
    </div>
    <div id="popGroupDiv" style="display: none; overflow: auto;">
        <iframe id="Iframe1" frameborder="0" style="width: 1920px; height: 5000px; overflow: visible;"
            scrolling="no" marginheight="10px" marginwidth="10px" src='<%=GroupSrc()%>'  >
        </iframe>
    </div>
   
    
    <asp:ObjectDataSource ID="dsAccDocStatus" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="dsAccountingTableAdapters.SelectAccDocStatusTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
            <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsAccTransDoc" runat="server" 
        TypeName="AccDocumentTableAdapters.AccTransDocumentTableAdapter" 
        SelectMethod="GetData" OldValuesParameterFormatString="original_{0}">
        <SelectParameters>
            <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

    <%--Printing--%>
    <asp:ObjectDataSource ID="dsAppStatus" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="dsAccountingTableAdapters.SelectAccDocStatusTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
            <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsApplications" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="AccDocApplicationTableAdapters.SelectAccDocApplTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
            <asp:ControlParameter ControlID="cbCanceled" DefaultValue="" Name="ShowCancel" PropertyName="Checked" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsTransactionsRpt" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="AccDocApplicationTableAdapters.RptTransferDetailTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
            <asp:ControlParameter ControlID="cbCanceled" Name="ShowCancel" PropertyName="Checked" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsDocHeader" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="dsAccountingTableAdapters.DocHeaderTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>

