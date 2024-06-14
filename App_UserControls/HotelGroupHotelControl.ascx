<%@ Control Language="VB" AutoEventWireup="false" 
    CodeFile="HotelGroupHotelControl.ascx.vb" 
    Inherits="App_UserControls_HotelGroupHotelControl"  
    ClassName="HotelGroupHotelControl" %>

<table cellpadding="0" cellspacing="0" style="border-collapse:collapse; width: 100%;">
    <tr>
        <td id="td_hghc_GroupLabel" class="GridRow1B">Hotel Group</td>
        <td id="td_hghc_GroupControl" class="GridRow1B">
            <asp:DropDownList ID="ddlHotelGroup" runat="server" CssClass="TextBox" />
            <asp:CascadingDropDown ID="exHotelGroup" runat="server" 
                TargetControlID="ddlHotelGroup" 
                Category="HotelGroupID" 
                ContextKey="False"
                ServicePath="~/App_UserControls/HotelWebService.asmx"
                ServiceMethod="HotelGroups" >
            </asp:CascadingDropDown>
        </td>
    </tr>
    <tr>
        <td id="td_hghc_HotelLabel" class="GridRowClear">Hotel</td>
        <td id="td_hghc_HotelControl" class="GridRowClear">
            <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" />
            <asp:CascadingDropDown ID="exHotel" runat="server" 
                ParentControlID="ddlHotelGroup"
                TargetControlID="ddlHotel" 
                Category="HotelID" 
                ContextKey="False"
                ServicePath="~/App_UserControls/HotelWebService.asmx"
                ServiceMethod="Hotels" >
            </asp:CascadingDropDown>
        </td>
    </tr>
</table>
