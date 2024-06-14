<%@ Control Language="VB" AutoEventWireup="false" 
    CodeFile="TourOpExpanderControl.ascx.vb" 
    Inherits="App_UserControls_TourOpExpanderControl"
    ClassName="TourOpExpanderControl" %>

<asp:CollapsiblePanelExtender ID="exMore" runat="server" 
    TargetControlID="pnlMore"
    CollapseControlID="lblExpand" 
    ExpandControlID="lblExpand" 
    ImageControlID="imgExpander"
    CollapsedImage="~/Images/dwn.gif" 
    ExpandedImage="~/Images/up.gif"
    Collapsed="True" />
<asp:Panel ID="pnlMore" runat="server">
<table cellpadding="0" cellspacing="0" style="border-collapse:collapse; width: 100%;">
    <tr>
        <td id="td_tex_KindLabel" class="GridRow1B" style="width: <%= LabelWidth.ToString() %>;" >
            <span style="padding-left: 13px;">Tour Op. Kind</span>
        </td>
        <td id="td_tex_KindpControl" class="GridRow1B" style="width: <%= ControlWidth.ToString() %>;">
            <asp:DropDownList ID="ddlTourOpKind" runat="server" CssClass="TextBox" />
            <asp:CascadingDropDown ID="exTourOpKind" runat="server" 
                TargetControlID="ddlTourOpKind" 
                Category="Kind" 
                UseContextKey="true"
                ServicePath="~/App_UserControls/TourOpExpanderService.asmx"
                ServiceMethod="TourOpKinds" >
            </asp:CascadingDropDown>
        </td>
    </tr>
    <tr>
        <td id="td_tex_GroupLabel" class="GridRow1B">
            <span style="padding-left: 13px;">Tour Op. Group</span>
        </td>
        <td id="td_tex_GroupControl" class="GridRow1B" >
            <asp:DropDownList ID="ddlTourOpGroup" runat="server" CssClass="TextBox" />
            <asp:CascadingDropDown ID="exTourOpGroup" runat="server" 
                ParentControlID="ddlTourOpKind"
                TargetControlID="ddlTourOpGroup" 
                Category="TourOpGroupID" 
                UseContextKey="true"
                ServicePath="~/App_UserControls/TourOpExpanderService.asmx"
                ServiceMethod="TourOpGroups" >
            </asp:CascadingDropDown>
        </td>
    </tr>
    <tr>
        <td id="td_tex_MarketLabel" class="GridRow1B" >
            <span style="padding-left: 13px;">Market</span>
        </td>
        <td id="td_tex_MarketControl" class="GridRow1B">
            <asp:DropDownList ID="ddlMarket" runat="server" CssClass="TextBox" />
            <asp:CascadingDropDown ID="exMarket" runat="server" 
                ParentControlID="ddlTourOpGroup"
                TargetControlID="ddlMarket" 
                Category="MarketID" 
                UseContextKey="true"
                ServicePath="~/App_UserControls/TourOpExpanderService.asmx"
                ServiceMethod="Markets" >
            </asp:CascadingDropDown>
        </td>
    </tr>
    <tr>
        <td id="td_tex_PayCondLabel" class="GridRow1B">
            <span style="padding-left: 13px;">Pay Cond.</span>
        </td>
        <td id="td_tex_PayCondControl" class="GridRow1B" >
            <asp:DropDownList ID="ddlPayCond" runat="server" CssClass="TextBox" />
            <asp:CascadingDropDown ID="exPayCond" runat="server" 
                ParentControlID="ddlMarket"
                TargetControlID="ddlPayCond" 
                Category="PayCondID" 
                UseContextKey="true"
                ServicePath="~/App_UserControls/TourOpExpanderService.asmx"
                ServiceMethod="PayConditions" >
            </asp:CascadingDropDown>
        </td>
    </tr>
</table>
</asp:Panel>
<table cellpadding="0" cellspacing="0" style="border-collapse:collapse; width: 100%;">
    <tr>
        <td id="td_tex_TourOpLabel" class="GridRowClear" style="width: <%= LabelWidth.ToString() %>;">
            <asp:Label ID="lblExpand" runat="server" style="cursor: pointer; text-decoration: underline;">
                <asp:Image ID="imgExpander" runat="server" style="margin-right: 3px;" />
                Tour Operator
            </asp:Label >
        </td>
        <td id="td_tex_TourOpControl" class="GridRowClear" style="width: <%= ControlWidth.ToString() %>;">
            <asp:DropDownList ID="ddlTourOp" runat="server" CssClass="TextBox" />
            <asp:CascadingDropDown ID="exTourOp" runat="server" 
                ParentControlID="ddlPayCond"
                TargetControlID="ddlTourOp" 
                Category="TourOpID" 
                UseContextKey="true"
                ServicePath="~/App_UserControls/TourOpExpanderService.asmx"
                ServiceMethod="TourOps" >
            </asp:CascadingDropDown>
        </td>
    </tr>
</table>

