<%@ Control Language="VB" AutoEventWireup="false" 
    CodeFile="HotelControl.ascx.vb" 
    Inherits="App_UserControls_HotelControl" %>

<table cellpadding="0" cellspacing="0" style="border-collapse:collapse; width: 100%;">
    <tr>
        <td id='<%= Me.ID & "_td_hc_HotelLabel" %>' class="GridRowClear">
            <asp:Label ID="lblHotel" runat="server" Text="Hotel"/>
        </td>
        <td id='<%= Me.ID & "_td_hc_HotelControl" %>' class="GridRowClear">
            <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" />
            <asp:CascadingDropDown ID="exHotel" runat="server" 
                TargetControlID="ddlHotel" 
                Category="HotelID" 
                ContextKey="False"
                ServicePath="~/App_UserControls/HotelWebService.asmx"
                ServiceMethod="Hotels" >
            </asp:CascadingDropDown>
        </td>
    </tr>
</table>
