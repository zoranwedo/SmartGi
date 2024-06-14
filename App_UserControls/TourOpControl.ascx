<%@ Control Language="VB" AutoEventWireup="false" 
    CodeFile="TourOpControl.ascx.vb" 
    Inherits="App_UserControls_TourOpControl" %>

<table cellpadding="0" cellspacing="0" style="border-collapse:collapse; width: 100%;">
    <tr>
        <td id="td_t_TourOpLabel" class="GridRowClear">Tour Operator</td>
        <td id="td_t_TourOpControl" class="GridRowClear">
            <asp:DropDownList ID="ddlTourOp" runat="server" CssClass="TextBox" />
            <asp:CascadingDropDown ID="exTourOp" runat="server" 
                TargetControlID="ddlTourOp" 
                Category="TourOpID" 
                UseContextKey="true"
                ServicePath="~/App_UserControls/TourOpWebService.asmx"
                ServiceMethod="TourOps" >
            </asp:CascadingDropDown>
        </td>
    </tr>
</table>
