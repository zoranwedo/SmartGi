<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" MaintainScrollPositionOnPostback="true" CodeFile="InvoiceFormNew.aspx.vb" Inherits="Invoices_InvoiceFormNew" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    New Invoice
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" runat="Server">

    <div id="InvDet" class="Red" >
        <asp:UpdatePanel ID="UpdatePanelMain" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:HiddenField ID="hfHotelID" runat="server" />
                <asp:HiddenField ID="hfHotel" runat="server" />
                <asp:HiddenField ID="hfTourOpID" runat="server" />
                <asp:HiddenField ID="hfTourOp" runat="server" />
                <asp:HiddenField ID="hfInvType" runat="server" />
                <asp:HiddenField ID="hfCheckIn" runat="server" />
                <asp:HiddenField ID="hfCheckOut" runat="server" />
                <asp:HiddenField ID="hfNights" runat="server" />
                                        
                <table cellpadding="0" cellspacing="0" >
                    <tr>
                        <td>
                            <asp:FormView ID="fvInvoiceHead" runat="server" Width="100%" DefaultMode="Insert" >
                                <ItemTemplate>
                                        <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                            <tr>
                                                <td class="GridLabelBG" colspan="6">
                                                    <asp:Label ID="Label30" runat="server" SkinID="skGridLabel" Text='<%# "New " & Iif(Eval("InvType")=1,"Group","Stay") & " Invoice" %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 30px;" rowspan="3">&nbsp;</td>
                                                <td style="width: 120px;" class="GridRow1B"><b>Hotel</b></td>
                                                <td style="width: 580px;" class="GridRow1B">
                                                    (<asp:Label ID="Label2" runat="server" Text='<%# hfHotelID.Value %>' />)
                                                    <asp:Label ID="Label1" runat="server" Text='<%# hfHotel.Value %>' />
                                                </td>
                                                <td rowspan="3">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="width: 120px;" class="GridRow1B"><b>Tour Operator</b></td>
                                                <td style="width: 580px;" class="GridRow1B">
                                                    (<asp:Label ID="Label25" runat="server" Text='<%# hfTourOpID.Value %>' />)
                                                    <asp:Label ID="Label24" runat="server" Text='<%# hfTourOp.Value %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 120px;" class="GridRow1B"><b>Travel</b></td>
                                                <td style="width: 580px;" class="GridRow1B">
                                                    <asp:Label ID="Label14" runat="server" Text='<%# Eval("CheckIn", "{0:d}") %>' style="width: 100px; text-align:center;" />
                                                    <asp:Label ID="Label4" runat="server" Text="-" style="width: 50px; text-align:center;" />
                                                    <asp:Label ID="Label16" runat="server" Text='<%# Eval("CheckOut", "{0:d}") %>' style="width: 100px; text-align:center;" />
                                                    <asp:Label ID="Label17" runat="server" Text='<%# "(" & hfNights.Value & " Nights)" %>' style="width: 100px; text-align:left;" />
                                                </td>
                                            </tr>
                                        </table>
                                </ItemTemplate>
                                <InsertItemTemplate>
                                    <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                        <tr>
                                            <td class="GridLabelBG" colspan="4">
                                                <asp:Label ID="Label30" runat="server" SkinID="skGridLabel" Text="New Invoice" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 30px;" rowspan="5">&nbsp;</td>
                                            <td style="width: 120px;" class="GridRow1B"><b>Hotel</b></td>
                                            <td style="width: 580px;" class="GridRow1B">
                                                <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" 
                                                    DataSourceID="dsHotel" DataTextField="Hotel" DataValueField="HotelID" >
                                                </asp:DropDownList>
                                            </td>
                                            <td rowspan="5">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="width: 120px;" class="GridRow1B"><b>Tour Operator</b></td>
                                            <td style="width: 580px;" class="GridRow1B">
                                                <asp:DropDownList ID="ddlTO" runat="server" CssClass="TextBox"
                                                    DataSourceID="dsTO" DataTextField="TourOp" DataValueField="TourOpID" >
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 120px;" class="GridRow1B"><b>Invoice Type</b></td>
                                            <td style="width: 580px;" class="GridRow1B">
                                                <asp:DropDownList ID="ddlInvType" runat="server" CssClass="TextBox" Width="205" >
                                                    <asp:ListItem Value="0">Stay</asp:ListItem>
                                                    <asp:ListItem Value="1">Group</asp:ListItem>
                                                    <asp:ListItem Value="2">Cancel</asp:ListItem>
                                                    <asp:ListItem Value="3">No-Show</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 120px;" class="GridRowClear"><b>Travel</b></td>
                                            <td style="width: 580px;" class="GridRowClear">
                                                <asp:TextBox ID="txtCheckIn" runat="server" CssClass="TextBox" Width="200" />
                                                <asp:CalendarExtender ID="txtCheckIn_Calendar" runat="server" CssClass="cal_Theme1" 
                                                    TargetControlID="txtCheckIn" />
                                                <asp:CompareValidator ID="valCheckInDate" runat="server" Display="None" 
                                                    Operator="DataTypeCheck" Type="Date" ErrorMessage="Input valid date!"
                                                    ControlToValidate="txtCheckIn" />
                                                <asp:ValidatorCalloutExtender ID="extCheckInDate" runat="server"
                                                    TargetControlID="valCheckInDate" Enabled="True" />
                                                <asp:RequiredFieldValidator ID="valCheckInReq" runat="server" Display="None" ErrorMessage="Required field" 
                                                    ControlToValidate="txtCheckIn" Enabled="True" />
                                                <asp:ValidatorCalloutExtender ID="extCheckInReq" runat="server"
                                                    TargetControlID="valCheckInReq" Enabled="True" />
                                                &nbsp;-&nbsp;
                                                <asp:TextBox ID="txtCheckOut" runat="server" CssClass="TextBox" Width="200" />
                                                <asp:CalendarExtender ID="txtCheckOut_Calendar" runat="server" CssClass="cal_Theme1" 
                                                    TargetControlID="txtCheckOut" />
                                                <asp:CompareValidator ID="valCheckOutDate" runat="server" Display="None" 
                                                    Operator="DataTypeCheck" Type="Date" ErrorMessage="Input valid date!"
                                                    ControlToValidate="txtCheckOut" />
                                                <asp:ValidatorCalloutExtender ID="extCheckOutDate" runat="server"
                                                    TargetControlID="valCheckOutDate" Enabled="True" />
                                                <asp:RequiredFieldValidator ID="valCheckOutReq" runat="server" Display="None" ErrorMessage="Required field" 
                                                    ControlToValidate="txtCheckOut" Enabled="True" />
                                                <asp:ValidatorCalloutExtender ID="extCheckOutReq" runat="server"
                                                    TargetControlID="valCheckOutReq" Enabled="True" />
                                                <asp:CompareValidator ID="valCheckOutComp" runat="server" Display="None"
                                                    Operator="GreaterThan" Type="Date" ErrorMessage="CheckOut date must be greater than Check In date!"
                                                    ControlToValidate="txtCheckOut" ControlToCompare="txtCheckIn" />
                                                <asp:ValidatorCalloutExtender ID="extCheckOutComp" runat="server"
                                                    TargetControlID="valCheckOutComp" Enabled="True" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="GridRow2T" style="margin-top: 2px; padding-top: 5px; text-align: left;">
                                                &nbsp;
                                            </td>
                                            <td class="GridRow2T" style="margin-top: 2px; padding-top: 5px; text-align: right;">
                                                <asp:Button ID="btnCreate" runat="server" CommandName="Create" SkinID="skBtnBase" Text="Create" />&nbsp;
                                                <asp:Button ID="btnCancelCreate" runat="server" CommandName="CancelCreate" SkinID="skBtnBase" Text="Cancel" CausesValidation="false"
                                                    OnClientClick="return confirm('Are you sure you don\'t want to create invoice?');" />
                                            </td>
                                        </tr>
                                    </table>
                                </InsertItemTemplate>
                            </asp:FormView>
                            <asp:FormView ID="fvInvoice" runat="server" Width="100%" >
                                <EditItemTemplate>
                                    <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                        <asp:Panel ID="pnlGroup" runat="server" Visible='<%# hfInvType.Value=1 %>' >
                                        <tr>
                                            <td style="width: 30px;" >&nbsp;</td>
                                            <td style="width: 120px;" class="GridRow1B"><b>Group Code</b></td>
                                            <td style="width: 580px;" class="GridRow1B">
                                                <asp:TextBox ID="txtGroupName" runat="server" CssClass="TextBox" Text='<%# Bind("ResGroup") %>' />
                                                <asp:RequiredFieldValidator ID="valGroupNameReq" runat="server" ErrorMessage="Required field" 
                                                    ControlToValidate="txtGroupName" Enabled="True" Display="None" />
                                                <asp:ValidatorCalloutExtender ID="extGroupNameReq" runat="server"
                                                    TargetControlID="valGroupNameReq" Enabled="True" />
                                            </td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        </asp:Panel>
                                        <tr>
                                            <td style="width: 30px;" rowspan="4" >&nbsp;</td>
                                            <td style="width: 120px;" class="GridRow1B"><b>Invoice Date</b></td>
                                            <td style="width: 580px;" class="GridRow1B">
                                                <asp:TextBox ID="txtInvDate" runat="server" CssClass="TextBox" Text='<%# Eval("InvDate", "{0:d}") %>'
                                                    ToolTip="Leave empty if check out date is invoice date"  />
                                                <asp:CalendarExtender ID="txtInvDate_Calendar" runat="server" CssClass="cal_Theme1" 
                                                    TargetControlID="txtInvDate" />
                                                <asp:CompareValidator ID="valInvDateDate" runat="server" Display="None" 
                                                    Operator="DataTypeCheck" Type="Date" ErrorMessage="Input valid date!"
                                                    ControlToValidate="txtInvDate" />
                                                <asp:ValidatorCalloutExtender ID="extInvDateDate" runat="server"
                                                    TargetControlID="valInvDateDate" Enabled="True" />
                                            </td>
                                            <td rowspan="4">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="width: 120px;" class="GridRow1B"><b>Reference</b></td>
                                            <td style="width: 580px;" class="GridRow1B">
                                                <asp:TextBox ID="txtInvRefText" runat="server" CssClass="TextBox" Text='<%# Eval("InvRefText") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 120px;" class="GridRow1B"><b>Note</b></td>
                                            <td style="width: 580px;" class="GridRow1B">
                                                <asp:TextBox ID="txtInvPrnText" runat="server" CssClass="TextBox" Text='<%# Eval("InvPrnText") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 120px;" class="GridRow2B"><b>Comment</b></td>
                                            <td style="width: 580px;" class="GridRow2B">
                                                <asp:TextBox ID="txtInvComment" runat="server" CssClass="TextBox" Text='<%# Eval("InvComment") %>' />
                                            </td>
                                        </tr>
                                    </table>
                                </EditItemTemplate>
                            </asp:FormView>
                        </td>
                    </tr>
                    <asp:Panel ID="pnlDetail" runat="server" Visible="False">
                        <tr><td>&nbsp;</td></tr>
                        <tr>
                            <td class="GridLabelBG">
                                <asp:Label ID="Label31" runat="server" Text="Details" CssClass="GridLabel" Height="26px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="GridBorder" style="vertical-align: top;">
                                <div style="border-collapse: collapse; padding: 0px; margin: 4px 0px 0px 0px; border: none 0px;">
                                <asp:DataList  ID="dlStayNew" runat="server" >
                                    <HeaderTemplate>
                                    <table cellpadding="0" cellspacing="0" style="border-collapse: collapse;">
                                        <tr>
                                            <td class="InvHead" style="width: 380px;">Guest Name</td>
                                            <td class="InvHead" style="width: 80px; ">Bk Date</td>
                                            <td class="InvHead" style="width: 80px;">Bk Voucher</td>
                                            <td class="InvHead" style="width: 50px;">Room</td>
                                            <td class="InvHead" style="width: 40px;">MP</td>
                                            <td class="InvHead" style="width: 25px;">Ad</td>
                                            <td class="InvHead" style="width: 25px;">
                                                <asp:Label ID="lblHCh1" runat="server" Text='<%# ChLabel(1) %>' ToolTip='<%# ChTTip(1) %>' />
                                            </td>
                                            <td class="InvHead" style="width: 25px;">
                                                <asp:Label ID="lblHCh2" runat="server" Text='<%# ChLabel(2) %>' ToolTip='<%# ChTTip(2) %>' />
                                            </td>
                                            <td class="InvHead" style="width: 25px;">
                                                <asp:Label ID="lblHCh3" runat="server" Text='<%# ChLabel(3) %>' ToolTip='<%# ChTTip(3) %>' />
                                            </td>
                                            <td class="InvHead" style="width: 25px;">
                                                <asp:Label ID="lblHCh4" runat="server" Text='<%# ChLabel(4) %>' ToolTip='<%# ChTTip(4) %>' />
                                            </td>
                                            <td class="InvHead" style="width: 35px;">Rms#</td>
                                        </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td class="InvRow" style="width: 380px;">
                                                <asp:Label ID="Label18" runat="server" Text='<%# Eval("DetText") %>' />
                                            </td>
                                            <td class="InvRow" style="width: 80px;">
                                                <asp:Label ID="Label19" runat="server" Text='<%# Eval("BookingDate", "{0:d}") %>' />
                                            </td>
                                            <td class="InvRow" style="width: 80px;">
                                                <asp:Label ID="Label20" runat="server" Text='<%# Eval("BookingVoucher") %>' />
                                            </td>
                                            <td class="InvRow" style="width: 50px;">
                                                <asp:Label ID="Label21" runat="server" Text='<%# Eval("RoomTypeId") %>' />
                                            </td>
                                            <td class="InvRow" style="width: 40px;">
                                                <asp:Label ID="Label22" runat="server" Text='<%# Eval("MealPlanId") %>' />
                                            </td>
                                            <td class="InvRowNum" style="text-align: right; width: 25px;">
                                                <asp:Label ID="Label39" runat="server" Text='<%# Eval("AdultNum") %>' />
                                            </td>
                                            <td class="InvRowNum" style="text-align: right; width: 25px;">
                                                <asp:Label ID="lblHCh1" runat="server" Text='<%# Eval("Chld1Num") %>' Width="25px" />
                                            </td>
                                            <td class="InvRowNum" style="text-align: right; width: 25px;">
                                                <asp:Label ID="lblHCh2" runat="server" Text='<%# Eval("Chld2Num") %>' Width="25px"  />
                                            </td>
                                            <td class="InvRowNum" style="text-align: right; width: 25px;">
                                                <asp:Label ID="lblHCh3" runat="server" Text='<%# Eval("Chld3Num") %>' Width="25px"  />
                                            </td>
                                            <td class="InvRowNum" style="text-align: right; width: 25px;">
                                                <asp:Label ID="lblHCh4" runat="server" Text='<%# Eval("Chld4Num") %>' Width="25px"  />
                                            </td>
                                            <td class="InvRowNum" style="text-align: right; width: 35px;">
                                                <asp:Label ID="Label40" runat="server" Text='<%# Eval("RoomsNum") %>' />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <tr>
                                            <td class="InvRow" style="width: 380px;">
                                                <asp:TextBox ID="sdn_DetText" runat="server" CssClass="TextBox" Text='<%# Eval("DetText") %>' />
                                                <asp:RequiredFieldValidator ID="valDetTextReq" runat="server" ControlToValidate="sdn_DetText" Display="None" ErrorMessage="Required Field" />
                                                <asp:ValidatorCalloutExtender runat="server" Enabled="True" ID="extDetTextReq" TargetControlID="valDetTextReq" />
                                            </td>
                                            <td class="InvRow" style="width: 80px;">
                                                <asp:TextBox ID="sdn_BookingDate" runat="server" CssClass="TextBox" Text='<%# Eval("BookingDate", "{0:d}") %>' Width="75px" />
                                                <asp:CalendarExtender ID="calBookingDate" runat="server" CssClass="cal_Theme1" Enabled="True" TargetControlID="sdn_BookingDate" />
                                                <asp:CompareValidator ID="valBookingDateDate" runat="server" ControlToValidate="sdn_BookingDate"
                                                    Display="None" ErrorMessage="Not a valid date!" Operator="DataTypeCheck" Type="Date" />
                                                <asp:ValidatorCalloutExtender ID="extBookingDateDate" runat="server" Enabled="True" 
                                                    SkinID="skExtender" TargetControlID="valBookingDateDate" />
                                            </td>
                                            <td class="InvRow" style="width: 80px;">
                                                <asp:TextBox ID="sdn_BookingVoucher" runat="server" CssClass="TextBox" Text='<%# Eval("BookingVoucher") %>' Width="75px" />
                                            </td>
                                            <td class="InvRow" style="width: 50px;">
                                                <asp:DropDownList ID="sdn_RoomTypeId" runat="server" CssClass="TextBox" 
                                                    DataSourceID="dsHtlRooms" DataTextField="RoomTypeID" DataValueField="RoomTypeID" />
                                                <asp:ObjectDataSource runat="server" ID="dsHtlRooms" 
                                                    TypeName="dsMaintHotelTableAdapters.HotelRoomTypeTableAdapter"
                                                    SelectMethod="GetDataByHotelID" >
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="hfHotelID" Name="HotelId" PropertyName="Value" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:ObjectDataSource>
                                            </td>
                                            <td class="InvRow" style="width: 40px;">
                                                <asp:DropDownList ID="sdn_MealPlanId" runat="server" CssClass="TextBox" 
                                                    DataSourceID="dsHtlMP" DataTextField="MealPlanID" DataValueField="MealPlanID" />
                                                <asp:ObjectDataSource ID="dsHtlMP" runat="server" 
                                                    TypeName="dsMaintHotelTableAdapters.HotelMealPlanTableAdapter"
                                                    SelectMethod="GetHotelMP" >
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="hfHotelID" Name="HotelId" PropertyName="Value" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:ObjectDataSource>
                                            </td>
                                            <td class="InvRowNum" style="text-align: right; width: 25px;">
                                                <asp:TextBox ID="sdn_AdultNum" runat="server" CssClass="TextBox" Text='<%# Eval("AdultNum") %>' Width="19px" />
                                                <asp:CompareValidator ID="valAdultNumInt" runat="server" ControlToValidate="sdn_AdultNum"
                                                    Display="None" ErrorMessage="Not a valid number!" Operator="DataTypeCheck" Type="Integer" />
                                                <asp:ValidatorCalloutExtender ID="extAdultNumInt" runat="server" Enabled="True" 
                                                    SkinID="skExtender" TargetControlID="valAdultNumInt" />
                                            </td>
                                            <td class="InvRowNum" style="text-align: right; width: 25px;">
                                                <asp:TextBox ID="sdn_Chld1Num" runat="server" CssClass="TextBox" Text='<%# Eval("Chld1Num") %>' Width="19px" />
                                                <asp:CompareValidator ID="valChld1NumInt" runat="server" ControlToValidate="sdn_Chld1Num"
                                                    Display="None" ErrorMessage="Not a valid number!" Operator="DataTypeCheck" Type="Integer" />
                                                <asp:ValidatorCalloutExtender ID="extChld1NumInt" runat="server" Enabled="True"
                                                        SkinID="skExtender" TargetControlID="valChld1NumInt" />
                                            </td>
                                            <td class="InvRowNum" style="text-align: right; width: 25px;">
                                                <asp:TextBox ID="sdn_Chld2Num" runat="server" CssClass="TextBox" Text='<%# Eval("Chld2Num") %>' Width="19px" />
                                                <asp:CompareValidator ID="valChld2NumInt" runat="server" ControlToValidate="sdn_Chld2Num"
                                                    Display="None" ErrorMessage="Not a valid number!" Operator="DataTypeCheck" Type="Integer" />
                                                <asp:ValidatorCalloutExtender ID="extChld2NumInt" runat="server" Enabled="True"
                                                        SkinID="skExtender" TargetControlID="valChld2NumInt" />
                                            </td>
                                            <td class="InvRowNum" style="text-align: right; width: 25px;">
                                                <asp:TextBox ID="sdn_Chld3Num" runat="server" CssClass="TextBox" Text='<%# Eval("Chld3Num") %>' Width="19px" />
                                                <asp:CompareValidator ID="valChld3NumInt" runat="server" ControlToValidate="sdn_Chld3Num"
                                                    Display="None" ErrorMessage="Not a valid number!" Operator="DataTypeCheck" Type="Integer" />
                                                <asp:ValidatorCalloutExtender ID="extChld3NumInt" runat="server" Enabled="True"
                                                        SkinID="skExtender" TargetControlID="valChld3NumInt" />
                                            </td>
                                            <td class="InvRowNum" style="text-align: right; width: 25px;">
                                                <asp:TextBox ID="sdn_Chld4Num" runat="server" CssClass="TextBox" Text='<%# Eval("Chld4Num") %>' Width="19px" />
                                                <asp:CompareValidator ID="valChld4NumInt" runat="server" ControlToValidate="sdn_Chld4Num"
                                                    Display="None" ErrorMessage="Not a valid number!" Operator="DataTypeCheck" Type="Integer" />
                                                <asp:ValidatorCalloutExtender ID="extChld4NumInt" runat="server" Enabled="True"
                                                        SkinID="skExtender" TargetControlID="valChld4NumInt" />
                                            </td>
                                            <td class="InvRowNum" style="text-align: right; width: 35px;">
                                                <asp:TextBox ID="sdn_RoomsNum" runat="server" CssClass="TextBox" Text='<%# Eval("RoomsNum") %>' Width="30px" />
                                                <asp:CompareValidator ID="valRoomsNumInt" runat="server" ControlToValidate="sdn_RoomsNum"
                                                    Display="None" ErrorMessage="Not a valid number!" Operator="DataTypeCheck" Type="Integer" />
                                                <asp:ValidatorCalloutExtender ID="extRoomsNumInt" runat="server" Enabled="True"
                                                    SkinID="skExtender" TargetControlID="valRoomsNumInt" />
                                            </td>
                                        </tr>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                    </table>
                                    </FooterTemplate>
                                </asp:DataList >
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="margin-top: 2px; padding-top: 5px; text-align: right;">
                                <asp:Button ID="btnCreateInvoice" runat="server" SkinID="skBtnBase" Text="Save" />&nbsp;
                                <asp:Button ID="btnCancelInvoice" runat="server" SkinID="skBtnBase" Text="Cancel" CausesValidation="false"
                                    OnClientClick="return confirm('Are you sure you don\'t want to create invoice?');" />
                            </td>
                        </tr>
                    </asp:Panel>
                </table>

                <asp:HiddenField ID="dummy" runat="server" />
                <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
                    PopupDragHandleControlID="popLabel" CancelControlID="btnYes" DropShadow="True"
                    BackgroundCssClass="modalBackground" TargetControlID="dummy" X="200" Y="200">
                </asp:ModalPopupExtender>
                <asp:Panel ID="popPanel" runat="server" Width="300px" BackColor="White" Style="display: none">
                    <table cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                            <td class="GridLabelBG">
                                <asp:Label ID="popLabel" runat="server" Text="Title" SkinID="skGridLabel"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="GridBorder">
                                <p style="text-align: center;">
                                    <asp:Label ID="popMessage" runat="server" Text="Message" />
                                </p>
                                <p style="text-align: right;" class="GridRow1T"><br />
                                    <asp:Button ID="btnYes" runat="server" Text="OK" SkinID="skBtnBase" />&nbsp;
                                </p>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>

                <br />
                <asp:ObjectDataSource ID="dsInvoice" runat="server" 
                    TypeName="dsInvoiceFormTableAdapters.InvoiceHeadTableAdapter"
                    SelectMethod="GetDataByID"
                    UpdateMethod="UpdateQuery">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="InvoiceID" QueryStringField="InvoiceID" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="InvDate" Type="DateTime" DefaultValue="" />
                        <asp:Parameter Name="InvRefText" Type="String" />
                        <asp:Parameter Name="InvPrnText" Type="String" />
                        <asp:Parameter Name="InvComment" Type="String" />
                        <asp:ControlParameter ControlID="hfUsername" Name="EditUser" PropertyName="Value" Type="String" />
                        <asp:Parameter Name="EditDate" Type="DateTime" DefaultValue="" />
                        <asp:Parameter Name="InvoiceID" Type="Int32" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource runat="server" ID="dsHotel"
                    TypeName="dsInvoiceFormTableAdapters.HotelTableAdapter"
                    SelectMethod="GetDataByUser" >
                    <SelectParameters>
                        <asp:Parameter Name="UserName" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsTO" runat="server" 
                    TypeName="dsInvoiceFormTableAdapters.TourOpTableAdapter"
                    SelectMethod="GetDataByUser">
                    <SelectParameters>
                        <asp:Parameter Name="UserName" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
