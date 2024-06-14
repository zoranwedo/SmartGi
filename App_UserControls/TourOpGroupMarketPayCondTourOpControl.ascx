<%@ Control Language="VB" AutoEventWireup="false" 
    CodeFile="TourOpGroupMarketPayCondTourOpControl.ascx.vb" 
    Inherits="App_UserControls_TourOpGroupMarketPayCondTourOpControl"
    ClassName="TourOpGroupMarketPayCondTourOpControl" %>

<table cellpadding="0" cellspacing="0" style="border-collapse:collapse; width: 100%;">
    <tr>
        <td id="td_tgmpt_GroupLabel" class="GridRow1B">Tour Op. Group</td>
        <td id="td_tgmpt_GroupControl" class="GridRow1B">
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
        <td id="td_tgmpt_MarketLabel" class="GridRow1B">Market</td>
        <td id="td_tgmpt_MarketControl" class="GridRow1B">
            <asp:DropDownList ID="ddlMarket" runat="server" CssClass="TextBox" />
            <asp:CascadingDropDown ID="exMarket" runat="server" 
                ParentControlID="ddlTourOpGroup"
                TargetControlID="ddlMarket" 
                Category="MarketID" 
                UseContextKey="true"
                ServicePath="~/App_UserControls/TourOpWebService.asmx"
                ServiceMethod="Markets" >
            </asp:CascadingDropDown>
        </td>
    </tr>
    <tr>
        <td id="td_tgmpt_PayCondLabel" class="GridRow1B">Pay Cond.</td>
        <td id="td_tgmpt_PayCondControl" class="GridRow1B">
            <asp:DropDownList ID="ddlPayCond" runat="server" CssClass="TextBox" />
            <asp:CascadingDropDown ID="exPayCond" runat="server" 
                ParentControlID="ddlMarket"
                TargetControlID="ddlPayCond" 
                Category="PayCondID" 
                UseContextKey="true"
                ServicePath="~/App_UserControls/TourOpWebService.asmx"
                ServiceMethod="PayConditions" >
            </asp:CascadingDropDown>
        </td>
    </tr>
    <tr>
        <td id="td_tgmpt_TourOpLabel" class="GridRowClear">Tour Operator</td>
        <td id="td_tgmpt_TourOpControl" class="GridRowClear">
            <asp:DropDownList ID="ddlTourOp" runat="server" CssClass="TextBox" />
            <asp:CascadingDropDown ID="exTourOp" runat="server" 
                ParentControlID="ddlPayCond"
                TargetControlID="ddlTourOp" 
                Category="TourOpID" 
                UseContextKey="true"
                ServicePath="~/App_UserControls/TourOpWebService.asmx"
                ServiceMethod="TourOps" >
            </asp:CascadingDropDown>
        </td>
    </tr>
</table>

