<%@ Control Language="VB" AutoEventWireup="false" 
    CodeFile="HotelExpanderControl.ascx.vb" 
    Inherits="App_UserControls_HotelExpanderControl" 
    ClassName="HotelExpanderControl" %>

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
        <td id="td_hghc_GroupLabel" class="GridRow1B" style="width: <%= LabelWidth.ToString() %>;" >
            <span style="padding-left: 13px;">Hotel Group</span>
        </td>
        <td id="td_hghc_GroupControl" class="GridRow1B" style="width: <%= ControlWidth.ToString() %>;">
            <asp:DropDownList ID="ddlHotelGroup" runat="server" CssClass="TextBox" />
            <asp:CascadingDropDown ID="exHotelGroup" runat="server" 
                TargetControlID="ddlHotelGroup" 
                Category="HotelGroupID" 
                ContextKey="False"
                ServicePath="~/App_UserControls/HotelExpanderService.asmx"
                ServiceMethod="HotelGroups" >
            </asp:CascadingDropDown>
        </td>
    </tr>
</table>
</asp:Panel>
<table cellpadding="0" cellspacing="0" style="border-collapse:collapse; width: 100%;">
    <tr>
        <td id="td_hghc_HotelLabel" class="GridRowClear" style="width: <%= LabelWidth.ToString() %>;" >
            <asp:Label ID="lblExpand" runat="server" style="cursor: pointer; text-decoration: underline;">
                <asp:Image ID="imgExpander" runat="server" style="margin-right: 3px;" />
                Hotel
            </asp:Label >
        </td>
        <td id="td_hghc_HotelControl" class="GridRowClear" style="width: <%= ControlWidth.ToString() %>;">
            <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" />
            <asp:CascadingDropDown ID="exHotel" runat="server" 
                ParentControlID="ddlHotelGroup"
                TargetControlID="ddlHotel" 
                Category="HotelID" 
                ContextKey="False"
                ServicePath="~/App_UserControls/HotelExpanderService.asmx"
                ServiceMethod="Hotels" >
            </asp:CascadingDropDown>
        </td>
    </tr>
</table>
