<%@ Control Language="VB" AutoEventWireup="false" 
    CodeFile="InputIntegerControl.ascx.vb" 
    Inherits="App_UserControls_InputIntegerControl" %>
 
 <table cellpadding="0" cellspacing="0" style="border-collapse:collapse; width: 100%;">
    <tr>
        <td class="GridRowClear" style="width: 100%;">
            <asp:TextBox ID="txtInteger" runat="server" CssClass="TextBox" />
            <asp:CompareValidator ID="int_txtInteger" runat="server" Display="None" 
                ErrorMessage="Input a valid number!" Operator="DataTypeCheck" Type="Integer"
                ControlToValidate="txtInteger"/>
            <asp:ValidatorCalloutExtender ID="ca_int_txtInteger" runat="server" 
                TargetControlID="int_txtInteger" />
            <asp:RequiredFieldValidator ID="req_txtInteger" runat="server" Display="None"
                ErrorMessage="Required field"
                ControlToValidate="txtInteger" />
            <asp:ValidatorCalloutExtender ID="ca_req_txtInteger" runat="server" 
                TargetControlID="req_txtInteger" />
        </td>
    </tr>
</table>

