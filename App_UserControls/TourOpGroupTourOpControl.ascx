<%@ Control Language="VB" AutoEventWireup="false" 
    CodeFile="TourOpGroupTourOpControl.ascx.vb" 
    Inherits="App_UserControls_TourOpGroupTourOpControl" %>

<table cellpadding="0" cellspacing="0" style="border-collapse:collapse; width: 100%;">
    <tr>
        <td id="td_tgt_GroupLabel" class="GridRow1B">Tour Op. Group</td>
        <td id="td_tgt_GroupControl" class="GridRow1B">
            <asp:DropDownList ID="ddlTourOpGroup" runat="server" CssClass="TextBox" />
            <asp:CascadingDropDown ID="exTourOpGroup" runat="server" 
                TargetControlID="ddlTourOpGroup" 
                Category="TourOpGroupID" 
                UseContextKey="true"
                ServicePath="~/App_UserControls/TourOpWebService.asmx"
                ServiceMethod="TourOpGroups" >
            </asp:CascadingDropDown>
        </td>
    </tr>
    <tr>
        <td id="td_tgt_TourOpLabel" class="GridRowClear">Tour Operator</td>
        <td id="td_tgt_TourOpControl" class="GridRowClear">
            <asp:DropDownList ID="ddlTourOp" runat="server" CssClass="TextBox" />
            <asp:CascadingDropDown ID="exTourOp" runat="server" 
                ParentControlID="ddlTourOpGroup"
                TargetControlID="ddlTourOp" 
                Category="TourOpID" 
                UseContextKey="true"
                ServicePath="~/App_UserControls/TourOpWebService.asmx"
                ServiceMethod="TourOps" >
            </asp:CascadingDropDown>
        </td>
    </tr>
</table>

