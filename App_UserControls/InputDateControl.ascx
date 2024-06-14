<%@ Control Language="VB" AutoEventWireup="false" 
    CodeFile="InputDateControl.ascx.vb" 
    Inherits="App_UserControls_InputDateControl" %>

<table cellpadding="0" cellspacing="0" style="border-collapse:collapse; width: 100%;">
    <tr>
        <td class="GridRowClear" style="width: 100%;">
            <asp:TextBox ID="txtDate" runat="server" CssClass="TextBox" />
            <asp:CompareValidator ID="date_txtDate" runat="server" Display="None" 
                ErrorMessage="Input a valid date!" Operator="DataTypeCheck" Type="Date"
                ControlToValidate="txtDate"/>
            <asp:ValidatorCalloutExtender ID="ca_date_txtDate" runat="server" 
                TargetControlID="date_txtDate" />
            <asp:RequiredFieldValidator ID="req_txtDate" runat="server" Display="None"
                ErrorMessage="Required field"
                ControlToValidate="txtDate" />
            <asp:ValidatorCalloutExtender ID="ca_req_txtDate" runat="server" 
                TargetControlID="req_txtDate" />
            <asp:CalendarExtender ID="calendar_txtDate" runat="server" CssClass="cal_Theme1" 
                TargetControlID="txtDate" />
        </td>
    </tr>
</table>
