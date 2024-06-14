<%@ Control Language="VB" AutoEventWireup="false" 
    CodeFile="FromToIntegerControl.ascx.vb" 
    Inherits="App_UserControls_FromToIntegerControl" 
    Classname="FromToIntegerControl" %>

<table cellpadding="0" cellspacing="0" style="border-collapse:collapse; width: 98%;">
    <tr>
        <td class="GridRowClear" style="width: 40%;">
            <asp:TextBox ID="txtFrom" runat="server" CssClass="TextBox" />
            <asp:TextBoxWatermarkExtender ID="wm_txtFrom" runat="server" 
                WatermarkCssClass="WaterMark" WatermarkText="from"
                TargetControlID="txtFrom" />
            <asp:CompareValidator ID="int_txtFrom" runat="server" Display="None" 
                ErrorMessage="Input a valid number!" Operator="DataTypeCheck" Type="Integer"
                ControlToValidate="txtFrom"/>
            <asp:ValidatorCalloutExtender ID="ca_int_txtFrom" runat="server" 
                TargetControlID="int_txtFrom" />
            <asp:RequiredFieldValidator ID="req_txtFrom" runat="server" Display="None"
                ErrorMessage="Required field"
                ControlToValidate="txtFrom" />
            <asp:ValidatorCalloutExtender ID="ca_req_txtFrom" runat="server" 
                TargetControlID="req_txtFrom" />
        </td>
        <td class="GridRowClear" style="width: 10%; text-align: center;">&ndash;</td>
        <td class="GridRowClear" style="width: 40%;">
            <asp:TextBox ID="txtTo" runat="server" CssClass="TextBox" Width="100%" />
            <asp:TextBoxWatermarkExtender ID="wm_txtTo" runat="server"
                WatermarkCssClass="WaterMark" WatermarkText="to" 
                TargetControlID="txtTo" />
            <asp:CompareValidator ID="int_txtTo" runat="server" Display="None" 
                ErrorMessage="Input a valid number!" Operator="DataTypeCheck" Type="Integer"
                ControlToValidate="txtTo"/>
            <asp:ValidatorCalloutExtender ID="ca_int_txtTo" runat="server" 
                TargetControlID="int_txtTo" />
            <asp:RequiredFieldValidator ID="req_txtTo" runat="server" Display="None"
                ErrorMessage="Required field"
                ControlToValidate="txtTo" />
            <asp:ValidatorCalloutExtender ID="ca_req_txtTo" runat="server" 
                TargetControlID="req_txtTo" />
        </td>
    </tr>
</table>
