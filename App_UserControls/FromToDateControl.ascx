<%@ Control Language="VB" AutoEventWireup="false" 
    CodeFile="FromToDateControl.ascx.vb" 
    Inherits="App_UserControls_FromToDateControl" 
    ClassName="FromToDateControl" %>

<table cellpadding="0" cellspacing="0" style="border-collapse:collapse; width: 98%;">
    <tr>
        <td class="GridRowClear" style="width: 40%;">
            <asp:TextBox ID="txtFrom" runat="server" CssClass="TextBox" />
            <asp:TextBoxWatermarkExtender ID="wm_txtFrom" runat="server" 
                WatermarkCssClass="WaterMark" WatermarkText="from"
                TargetControlID="txtFrom" />
            <asp:CompareValidator ID="date_txtFrom" runat="server" Display="None" 
                ErrorMessage="Input a valid date!" Operator="DataTypeCheck" Type="Date"
                ControlToValidate="txtFrom"/>
            <asp:ValidatorCalloutExtender ID="ca_date_txtFrom" runat="server" 
                TargetControlID="date_txtFrom" />
            <asp:RequiredFieldValidator ID="req_txtFrom" runat="server" Display="None"
                ErrorMessage="Required field"
                ControlToValidate="txtFrom" />
            <asp:ValidatorCalloutExtender ID="ca_req_txtFrom" runat="server" 
                TargetControlID="req_txtFrom" />
            <asp:CalendarExtender ID="calendar_txtFrom" runat="server" CssClass="cal_Theme1" 
                TargetControlID="txtFrom" />
        </td>
        <td class="GridRowClear" style="width: 10%; text-align: center;">&ndash;</td>
        <td class="GridRowClear" style="width: 40%;">
            <asp:TextBox ID="txtTo" runat="server" CssClass="TextBox" Width="100%" />
            <asp:TextBoxWatermarkExtender ID="wm_txtTo" runat="server"
                WatermarkCssClass="WaterMark" WatermarkText="to" 
                TargetControlID="txtTo" />
            <asp:CompareValidator ID="date_txtTo" runat="server" Display="None" 
                ErrorMessage="Input a valid date!" Operator="DataTypeCheck" Type="Date"
                ControlToValidate="txtTo"/>
            <asp:ValidatorCalloutExtender ID="ca_date_txtTo" runat="server" 
                TargetControlID="date_txtTo" />
            <asp:RequiredFieldValidator ID="req_txtTo" runat="server" Display="None"
                ErrorMessage="Required field"
                ControlToValidate="txtTo" />
            <asp:ValidatorCalloutExtender ID="ca_req_txtTo" runat="server" 
                TargetControlID="req_txtTo" />
            <asp:CalendarExtender ID="calendar_txtTo" runat="server" CssClass="cal_Theme1" 
                TargetControlID="txtTo" />
        </td>
    </tr>
</table>
