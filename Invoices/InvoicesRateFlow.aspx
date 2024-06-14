<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" CodeFile="InvoicesRateFlow.aspx.vb" Inherits="Invoices_InvoicesRateFlow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Invoice Rate Flow  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" Runat="Server">
    <div class="Green">
        <asp:CollapsiblePanelExtender ID="cpeSearch" runat="server" TargetControlID="pnSearch"
            CollapseControlID="lblFilter" ExpandControlID="lblFilter" ImageControlID="imgExpander"
            CollapsedImage="~/Images/expand_.png" ExpandedImage="~/Images/collapse_.png"
            Collapsed="False">
        </asp:CollapsiblePanelExtender>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <asp:Panel ID="pnSearchHead" runat="server" Width="600px">
                    <td class="GridLabelBG" style="width: 600px;">
                        <asp:Label ID="lblFilter" runat="server" SkinID="skGridLabel">Search/Filter &nbsp;
                            <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />&nbsp; 
                        </asp:Label>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px">
                    <asp:Panel ID="pnSearch" runat="server" Style="width: 600px"  DefaultButton="btFilter">
                        <table cellpadding="0" cellspacing="0">
                            <tr style="width: 600px;">
                                <td class="GridRow1B" style="width: 100px;">Hotel</td>
                                <td class="GridRow1B" colspan="3">
                                    <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" DataSourceID="dsHotel"
                                        DataTextField="Hotel" DataValueField="HotelID" AppendDataBoundItems="True">
                                        <asp:ListItem Selected="True" Value="">all hotels</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsHotel" runat="server" 
                                        TypeName="dsInvoicesTableAdapters.HotelTableAdapter"
                                        SelectMethod="GetData" >
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Tour Operator</td>
                                <td class="GridRow1B" colspan="3" >
                                    <asp:DropDownList ID="ddlTO" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsTOAll" DataTextField="TourOp" DataValueField="TourOpID">
                                        <asp:ListItem Selected="True" Value="">all tour operators</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsTOAll" runat="server" 
                                        TypeName="TourOperTableAdapters.TourOpTableAdapter"
                                        SelectMethod="GetDataByUser" >
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="hfUsername" Name="User" PropertyName="Value" Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                             <tr>
                                <td class="GridRow1B">Name</td>
                                <td class="GridRow1B" colspan="3">
                                    <asp:TextBox ID="txtName" runat="server" CssClass="TextBox" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Room Type </td>
                                <td class="GridRow1B" colspan="3">
                                    <asp:DropDownList ID="ddlRoomMap" runat="server" CssClass="TextBox" 
                                        DataSourceID="drRoomMap" DataTextField="RoomTypeID" 
                                        DataValueField="RoomTypeID" AppendDataBoundItems="True">
                                        <asp:ListItem Value="">All</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="drRoomMap" runat="server" 
                                        TypeName="dsMaintHotelTableAdapters.HotelRoomTypeTableAdapter" 
                                        SelectMethod="GetData" >
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 100px;">Check In From</td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="fltStart" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wmStart" runat="server" TargetControlID="fltStart"
                                        WatermarkCssClass="WaterMark" WatermarkText="Check In date equal or greater than..." />
                                    <asp:CompareValidator ID="valStartDate" runat="server" ControlToValidate="fltStart"
                                        Display="None" ErrorMessage="Not a valid date!" Operator="DataTypeCheck" Type="Date" />
                                    <asp:ValidatorCalloutExtender ID="extStartDate" runat="server" Enabled="True" TargetControlID="valStartDate" />
                                    <asp:CalendarExtender ID="calStart" runat="server" CssClass="cal_Theme1" Enabled="True" TargetControlID="fltStart" />
                                </td>
                                <td class="GridRow1B" style="width: 100px; padding-left:5px;">Check In To</td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="fltFinish" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wmFinish" runat="server" TargetControlID="fltFinish" 
                                        WatermarkCssClass="WaterMark" WatermarkText="Check in date equal or less than..." />
                                    <asp:CompareValidator ID="valFinishDate" runat="server" ControlToValidate="fltFinish" 
                                        Display="None" ErrorMessage="Not a valid date!" Operator="DataTypeCheck" Type="Date" />
                                    <asp:ValidatorCalloutExtender ID="extFinishDate" runat="server" Enabled="True" TargetControlID="valFinishDate" />
                                    <asp:CalendarExtender ID="calFinish" runat="server" CssClass="cal_Theme1" Enabled="True" TargetControlID="fltFinish" />
                                </td>
                            </tr>

                            <tr>
                                <td class="GridRow1B" style="width: 100px;">Check Out From</td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="fltCkOutStart" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wmCkOutStart" runat="server" TargetControlID="fltCkOutStart"
                                        WatermarkCssClass="WaterMark" WatermarkText="Check out date equal or greater than..." />
                                    <asp:CompareValidator ID="valCkOutStart" runat="server" ControlToValidate="fltCkOutStart"
                                        Display="None" ErrorMessage="Not a valid date!" Operator="DataTypeCheck" Type="Date" />
                                    <asp:ValidatorCalloutExtender ID="extCkOutStart" runat="server" Enabled="True" TargetControlID="valCkOutStart" />
                                    <asp:CalendarExtender ID="calCkOutStart" runat="server" CssClass="cal_Theme1" Enabled="True" TargetControlID="fltCkOutStart" />
                                </td>
                                <td class="GridRow1B" style="width: 100px; padding-left:5px;">Check Out To</td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="fltCkOutFinish" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wmCkOutFinish" runat="server" TargetControlID="fltCkOutFinish" 
                                        WatermarkCssClass="WaterMark" WatermarkText="Check out date equal or less than..." />
                                    <asp:CompareValidator ID="valCkOutFinish" runat="server" ControlToValidate="fltCkOutFinish" 
                                        Display="None" ErrorMessage="Not a valid date!" Operator="DataTypeCheck" Type="Date" />
                                    <asp:ValidatorCalloutExtender ID="extCkOutFinish" runat="server" Enabled="True" TargetControlID="valCkOutFinish" />
                                    <asp:CalendarExtender ID="calCkOutFinish" runat="server" CssClass="cal_Theme1" Enabled="True" TargetControlID="fltCkOutFinish" />
                                </td>
                            </tr>

                            <tr>
                                <td class="GridRow1B">InvNum From</td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="fltInvFrom" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wmInvFrom" runat="server" TargetControlID="fltInvFrom"
                                        WatermarkCssClass="WaterMark" WatermarkText="Invoice Number equals or greater than" />
                                    <asp:CompareValidator ID="valInvFromInt" runat="server" ControlToValidate="fltInvFrom" 
                                        Display="None" ErrorMessage="Not a valid number!" Operator="DataTypeCheck" Type="Integer" />
                                    <asp:ValidatorCalloutExtender ID="extInvFromInt" runat="server" Enabled="True" TargetControlID="valInvFromInt" />
                                </td>
                                <td class="GridRow1B" style="width: 100px; padding-left:5px;">&nbsp;InvNum To
                                </td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="fltInvTo" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wmInvTo" runat="server" TargetControlID="fltInvTo" 
                                        WatermarkCssClass="WaterMark" WatermarkText="Invoice Number equals or less than" />
                                    <asp:CompareValidator ID="valInvToInt" runat="server" ControlToValidate="fltInvTo" 
                                        Display="None" ErrorMessage="Not a valid number!" Operator="DataTypeCheck" Type="Integer" />
                                    <asp:ValidatorCalloutExtender ID="extInvToInt" runat="server" Enabled="True" TargetControlID="valInvToInt" />
                                </td> 
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 100px;">Booking From</td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="fltStartBk" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wmStartBk" runat="server" TargetControlID="fltStartBk"
                                        WatermarkCssClass="WaterMark" WatermarkText="Booking date equal or greater than..." />
                                    <asp:CompareValidator ID="valStartBkDate" runat="server" ControlToValidate="fltStartBk"
                                        Display="None" ErrorMessage="Not a valid date!" Operator="DataTypeCheck" Type="Date" />
                                    <asp:ValidatorCalloutExtender ID="extStartBkDate" runat="server" Enabled="True" TargetControlID="valStartBkDate" />
                                    <asp:CalendarExtender ID="calStartBkDate" runat="server" Enabled="True" CssClass="cal_Theme1" TargetControlID="fltStartBk" />
                                </td>
                                <td class="GridRow1B" style="width: 100px; padding-left:5px;">Booking To</td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="fltFinishBk" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wmFinishBk" runat="server" TargetControlID="fltFinishBk" 
                                        WatermarkCssClass="WaterMark" WatermarkText="Booking date equal or less than..." />
                                    <asp:CompareValidator ID="valFinishBkDate" runat="server" ControlToValidate="fltFinishBk" 
                                        Display="None" ErrorMessage="Not a valid date!" Operator="DataTypeCheck" Type="Date" />
                                    <asp:ValidatorCalloutExtender ID="extFinishBkDate" runat="server" Enabled="True" TargetControlID="valFinishBkDate" />
                                    <asp:CalendarExtender ID="calFinishBk" runat="server" Enabled="True" CssClass="cal_Theme1" TargetControlID="fltFinishBk">
                                    </asp:CalendarExtender>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Bk Number</td>
                                <td class="GridRow1B" colspan="3">
                                    <asp:TextBox ID="txtBkNum" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wmBkNum" runat="server" TargetControlID="txtBkNum" 
                                        WatermarkCssClass="WaterMark" WatermarkText="Like Booking Number..." />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear">Group Code</td>
                                <td class="GridRowClear" colspan="3">
                                    <asp:TextBox ID="txtResGroup" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wmResGroup" runat="server" TargetControlID="txtResGroup" 
                                        WatermarkCssClass="WaterMark" WatermarkText="Like Group Code..." />
                                </td>
                            </tr>
                            <tr>
                                <td class="ComandRow2T" style="height: 30px; padding-top: 5px; text-align: left;">
                                    <asp:CheckBox ID="cbHotel" runat="server" Text="Hotel Values" TextAlign="Right" ToolTip="Only for Report" />
                                </td>
                                <td class="ComandRow2T" colspan="3" style="height: 30px; padding-top: 5px">
                                    <asp:CheckBox ID="cbSentFromHTL" runat="server" Text="Sent From Hotel Only" TextAlign="Left" />&nbsp;
                                    <asp:Button ID="btFilter" runat="server" SkinID="skBtnFilter" />&nbsp;
                                    <asp:Button ID="btClear" runat="server" SkinID="skBtnClear" />&nbsp;
                                    <asp:Button ID="btnReport" runat="server" SkinID="skBtnBase" Text="Report" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <br />

    <asp:ObjectDataSource ID="dsReservas" runat="server" 
        TypeName="dsRateFlowTableAdapters.SelectRateLogInvTableAdapter"
        SelectMethod="GetData" OldValuesParameterFormatString="original_{0}" >
        <SelectParameters>
            <asp:Parameter DefaultValue="32" Name="HotelID" Type="Int32" />
            <asp:Parameter DefaultValue="" Name="TourOpID" Type="Int32" />
            <asp:Parameter Name="RoomTypeID" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="ResGroup" Type="String" />
            <asp:Parameter Name="CheckInFrom" Type="DateTime" />
            <asp:Parameter Name="CheckInTo" Type="DateTime" />
            <asp:Parameter Name="CheckOutFrom" Type="DateTime" />
            <asp:Parameter Name="CheckOutTo" Type="DateTime" />
            <asp:Parameter DefaultValue="" Name="BkDateFrom" Type="DateTime" />
            <asp:Parameter Name="BkDateTo" Type="DateTime" />
            <asp:Parameter Name="BkNumber" Type="String" />
            <asp:Parameter Name="InvNumFrom" Type="Int32" />
            <asp:Parameter Name="InvNumTo" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <div class="Blue">               
        <asp:Panel runat="server" ID="pnlCnt" Width="1195px" Visible="false" >
            <asp:DataList ID="DataList1" runat="server" Width="1200px" style="margin-right: 0px" >
                <HeaderTemplate>
                    <table cellpadding="2px" cellspacing="0">
                        <tr class="SelectRowClear" style="text-decoration: underline;">
                            <th style="width: 100px;" class="GridRow1TBL">Reservation</th>
                            <th style="width: 100px;" class="GridRow1TBL">Folio</th>
                            <th style="width: 100px;" rowspan="2" class="GridRow1T6B1L">Hotel</th>
                            <th style="width: 100px;" rowspan="2" class="GridRow1T6B1L">Tour Operator</th>
                            <th style="width: 80px;" rowspan="2" class="GridRow1T6B1L">CheckIn</th>
                            <th style="width: 80px;" rowspan="2" class="GridRow1T6B1L">CheckOut</th>
                            <th style="width: 250px;" rowspan="2" class="GridRow1T6B1L">Name</th>
                            <th style="width: 50px;" rowspan="2" class="GridRow1T6B1L">MP</th>
                            <th style="width: 80px;" rowspan="2" class="GridRow1T6B1L">Room Type</th>
                            <th style="width: 80px;" rowspan="2" class="GridRow1T6B1L">Rate Code</th>
                            <th style="width: 80px;" rowspan="2" class="GridRow1T6B1L">Amount</th>
                            <th style="width: 60px;" rowspan="2" class="GridRow1T6B1L"></th>
                            <th style="width: 120px;" class="GridRow1TRBL">Processed</th>
                        </tr>
                        <tr class="SelectRowClear" style="text-decoration: underline;">
                            <th class="GridRow6B1L" style="text-align: right;">Invoice</th>
                            <th class="GridRow6B1L" style="text-align: right;">Number</th>
                            <th class="GridRow1R6B1L" style="text-align: right;">Current State</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                        <%--
                        <tr>
                            <th colspan="12" style="text-align: center;">
                            <asp:Label ID="lblHotelHead" runat="server" Text='<%# Eval("Hotel") %>' style="border-bottom: solid 2px;" />
                            </th>
                        </tr>
                        --%>
                        <tr>
                            <td class="GridRow1BL" style="height: 25px; width: 100px;">
                                <asp:Label ID="ResIDLabel" runat="server" Text='<%# Eval("ResID") %>' />
                            </td>
                            <td class="GridRow1BL" style="height: 25px; width: 100px;">
                                <asp:Label ID="FolioLabel" runat="server" Text='<%# Eval("Folio") %>' />
                            </td>
                            <td class="GridRow1BL" style="height: 25px; width: 100px;">
                                <asp:Label ID="HotelHIDLabel" runat="server" Text='<%# Eval("HotelHID") %>' />
                            </td>
                            <td class="GridRow1BL" style="height: 25px; width: 100px;">
                                <asp:Label ID="TourOpHIDLabel" runat="server" Text='<%# Eval("TourOpHID") %>' />
                            </td>
                            <td class="GridRow1BL" style="height: 25px; width: 80px;">
                                <asp:Label ID="CheckInLabel" runat="server" Text='<%# Eval("CheckIn", "{0:d}") %>' />
                            </td>
                            <td class="GridRow1BL" style="height: 25px; width: 80px;">
                                <asp:Label ID="CheckOutLabel" runat="server" Text='<%# Eval("CheckOut", "{0:d}") %>' />
                            </td>
                            <td class="GridRow1BL" style="height: 25px; width: 250px;">
                                <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                                </td>
                            <td class="GridRow1BL" style="height: 25px; width: 50px;">
                                <asp:Label ID="TipoTarLabel" runat="server" Text='<%# Eval("TipoTar") %>' />
                            </td>
                            <td class="GridRow1BL" style="height: 25px; width: 80px;">
                                <asp:Label ID="RoomTypeHIDLabel" runat="server" Text='<%# Eval("RoomTypeHID") %>' />
                            </td>
                            <td class="GridRow1BL" style="height: 25px; width: 80px;">
                                <asp:Label ID="RateHIDLabel" runat="server" Text='<%# Eval("RateHID") %>' />
                            </td>
                            <td class="GridRow1BL" style="height: 25px; width: 80px; text-align: right;">
                                <asp:Label ID="PStAmountLabel" runat="server" Text='<%# Eval("PStAmount","{0:N2}") %>'  />
                            </td>
                            <td class="GridRow1BL" style="height: 25px; width: 60px;">
                                Res.
                            </td>
                            <td class="GridRow1RBL" style="height: 25px; width: 120px;">
                                <asp:Label ID="CreatedLabel" runat="server" Text='<%# Eval("Created", "{0:d}") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="GridRow2B1L" rowspan="3"; style="width: 100px; text-align: right;">
                                <asp:Label ID="InvoiceIDLabel" runat="server" Text='<%# Eval("InvoiceID") %>' />
                                <asp:Image ID="Image3" runat="server" Height="16px" ImageUrl="~/Images/warning.png" 
                                    Visible='<%# iif(Eval("InvoiceID") is DbNull.value,true ,false) %>' />
                                <asp:Label ID="ResIDLabel0" runat="server" Text="No Facturation" 
                                    Visible='<%# iif(Eval("InvoiceID") is DbNull.value,true ,false) %>' />
                            </td>
                            <td class="GridRow2B1L" rowspan="3" style="width: 100px; text-align: right;">
                                <asp:Label ID="InvNumberLabel" runat="server" Text='<%# "FT " & Eval("InvNumber") %>' />
                            </td>
                            <td class="GridRow2B1L" colspan="4" rowspan="3" style="width: 360px">
                                <table cellpadding="2" cellspacing="0">
                                    <tr>
                                        <td colspan="2" style="width: 360px; border-bottom: solid 1px;">
                                            <asp:Label ID="HotelLabel" runat="server" Text='<%# Eval("Hotel") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 100px;">&nbsp;</td>
                                        <td>
                                            <asp:Label ID="TourOpLabel" runat="server" Text='<%# Eval("TourOp") %>' />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td class="GridRow2B1L" rowspan="3" style="width: 250px">
                                <asp:Label ID="DetTextLabel" runat="server" Text='<%# Eval("DetText") %>' />
                            </td>
                            <td class="GridRow2B1L" rowspan="3" style="width: 50px">
                                <asp:Label ID="MealPlanIdLabel" runat="server" Text='<%# Eval("MealPlanId") %>' />
                            </td>
                            <td class="GridRow1BL" style="width: 80px">
                                <asp:Label ID="insRoomTypeIdLabel" runat="server" Text='<%# Eval("insRoomTypeId") %>' />
                            </td>
                            <td class="GridRow1BL" style="width: 80px">
                                <asp:Label ID="insRateCodeIdLabel" runat="server" Text='<%# Eval("insRateCodeId") %>' />
                            </td>
                            <td class="GridRow1BL" style="width: 80px">
                                &nbsp;
                            </td>
                            <td class="GridRow1BL" style="width: 60px">
                                <i>Ins.</i>
                            </td>
                            <td class="GridRow1R2B1L" rowspan="3" style="width: 120px">
                                <asp:Label ID="InvoiceStateLabel" runat="server" Text='<%# Eval("InvoiceState") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="GridRow1BL">
                                <asp:Label ID="htlRoomTypeIdLabel" runat="server" Text='<%# Eval("htlRoomTypeId") %>' />
                            </td>
                            <td class="GridRow1BL">
                                <asp:Label ID="htlRateCodeIdLabel" runat="server" Text='<%# Eval("htlRateCodeId") %>' />
                            </td>
                            <td class="GridRow1BL" style="text-align: right;" >
                                <asp:Label ID="OStAmountLabel" runat="server" Text='<%# Eval("OStAmount","{0:N2}") %>' />
                            </td>
                            <td class="GridRow1BL">
                                <i>From Htl.</i>
                            </td>
                        </tr>
                        <tr>
                            <td class="GridRow2B1L">
                                <asp:Label ID="RoomTypeIdLabel" runat="server" Text='<%# Eval("RoomTypeId") %>' />
                            </td>
                            <td class="GridRow2B1L">
                                <asp:Label ID="RateCodeId" runat="server" Text='<%# Eval("RateCodeId") %>' />
                            </td>
                            <td class="GridRow2B1L" style="text-align: right;">
                                <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount","{0:N2}") %>' />
                            </td>
                            <td class="GridRow2B1L">
                                <i>Current</i>
                            </td>
                        </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                        <%--
                        <tr style="background-color: #D7F0FF;">
                            <th colspan="12" style="text-align: center; background-color: Transparent;">
                            <asp:Label ID="lblHotelHead" runat="server" Text='<%# Eval("Hotel") %>' style="border-bottom: solid 2px;" />
                            </th>
                        </tr>
                        --%>
                        <tr style="background-color: #D7F0FF;">
                            <td class="GridRow1BL" style="height: 25px; width: 100px;">
                                <asp:Label ID="ResIDLabel" runat="server" Text='<%# Eval("ResID") %>' />
                            </td>
                            <td class="GridRow1BL" style="height: 25px; width: 100px;">
                                <asp:Label ID="FolioLabel" runat="server" Text='<%# Eval("Folio") %>' />
                            </td>
                            <td class="GridRow1BL" style="height: 25px; width: 100px;">
                                <asp:Label ID="HotelHIDLabel" runat="server" Text='<%# Eval("HotelHID") %>' />
                            </td>
                            <td class="GridRow1BL" style="height: 25px; width: 100px;">
                                <asp:Label ID="TourOpHIDLabel" runat="server" Text='<%# Eval("TourOpHID") %>' />
                            </td>
                            <td class="GridRow1BL" style="height: 25px; width: 80px;">
                                <asp:Label ID="CheckInLabel" runat="server" Text='<%# Eval("CheckIn", "{0:d}") %>' />
                            </td>
                            <td class="GridRow1BL" style="height: 25px; width: 80px;">
                                <asp:Label ID="CheckOutLabel" runat="server" Text='<%# Eval("CheckOut", "{0:d}") %>' />
                            </td>
                            <td class="GridRow1BL" style="height: 25px; width: 250px;">
                                <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                                </td>
                            <td class="GridRow1BL" style="height: 25px; width: 50px;">
                                <asp:Label ID="TipoTarLabel" runat="server" Text='<%# Eval("TipoTar") %>' />
                            </td>
                            <td class="GridRow1BL" style="height: 25px; width: 80px;">
                                <asp:Label ID="RoomTypeHIDLabel" runat="server" Text='<%# Eval("RoomTypeHID") %>' />
                            </td>
                            <td class="GridRow1BL" style="height: 25px; width: 80px;">
                                <asp:Label ID="RateHIDLabel" runat="server" Text='<%# Eval("RateHID") %>' />
                            </td>
                            <td class="GridRow1BL" style="height: 25px; width: 80px; text-align: right;">
                                <asp:Label ID="PStAmountLabel" runat="server" Text='<%# Eval("PStAmount","{0:N2}") %>' />
                            </td>
                            <td class="GridRow1BL" style="height: 25px; width: 60px;">
                                Res.
                            </td>
                            <td class="GridRow1RBL" style="height: 25px; width: 120px;">
                                <asp:Label ID="CreatedLabel" runat="server" Text='<%# Eval("Created", "{0:d}") %>' />
                            </td>
                        </tr>
                        <tr style="background-color: #D7F0FF;">
                            <td class="GridRow2B1L" rowspan="3"; style="width: 100px; text-align: right;">
                                <asp:Label ID="InvoiceIDLabel" runat="server" Text='<%# Eval("InvoiceID") %>' />
                                <asp:Image ID="Image3" runat="server" Height="16px" ImageUrl="~/Images/warning.png" 
                                    Visible='<%# iif(Eval("InvoiceID") is DbNull.value,true ,false) %>' />
                                <asp:Label ID="ResIDLabel0" runat="server" Text="No Facturation" 
                                    Visible='<%# iif(Eval("InvoiceID") is DbNull.value,true ,false) %>' />
                            </td>
                            <td class="GridRow2B1L" rowspan="3" style="width: 100px">
                                <asp:Label ID="InvNumberLabel" runat="server" Text='<%# Eval("InvNumber") %>' />
                            </td>
                            <td class="GridRow2B1L" colspan="4" rowspan="3" style="width: 360px">
                                <table cellpadding="2" cellspacing="0">
                                    <tr>
                                        <td colspan="2" style="width: 360px; border-bottom: solid 1px;">
                                            <asp:Label ID="HotelLabel" runat="server" Text='<%# Eval("Hotel") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 100px;">&nbsp;</td>
                                        <td>
                                            <asp:Label ID="TourOpLabel" runat="server" Text='<%# Eval("TourOp") %>' />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td class="GridRow2B1L" rowspan="3" style="width: 250px">
                                <asp:Label ID="DetTextLabel" runat="server" Text='<%# Eval("DetText") %>' />
                            </td>
                            <td class="GridRow2B1L" rowspan="3" style="width: 50px">
                                <asp:Label ID="MealPlanIdLabel" runat="server" Text='<%# Eval("MealPlanId") %>' />
                            </td>
                            <td class="GridRow1BL" style="width: 80px">
                                <asp:Label ID="insRoomTypeIdLabel" runat="server" Text='<%# Eval("insRoomTypeId") %>' />
                            </td>
                            <td class="GridRow1BL" style="width: 80px">
                                <asp:Label ID="insRateCodeIdLabel" runat="server" Text='<%# Eval("insRateCodeId") %>' />
                            </td>
                            <td class="GridRow1BL" style="width: 80px">
                                &nbsp;
                            </td>
                            <td class="GridRow1BL" style="width: 60px">
                                <i>Ins.</i>
                            </td>
                            <td class="GridRow1R2B1L" rowspan="3" style="width: 120px">
                                <asp:Label ID="InvoiceStateLabel" runat="server" Text='<%# Eval("InvoiceState") %>' />
                            </td>
                        </tr>
                        <tr style="background-color: #D7F0FF;">
                            <td class="GridRow1BL">
                                <asp:Label ID="htlRoomTypeIdLabel" runat="server" Text='<%# Eval("htlRoomTypeId") %>' />
                            </td>
                            <td class="GridRow1BL">
                                <asp:Label ID="htlRateCodeIdLabel" runat="server" Text='<%# Eval("htlRateCodeId") %>' />
                            </td>
                            <td class="GridRow1BL" style="text-align: right;">
                                <asp:Label ID="OStAmountLabel" runat="server" Text='<%# Eval("OStAmount","{0:N2}") %>' />
                            </td>
                            <td class="GridRow1BL">
                                <i>From Htl.</i>
                            </td>
                        </tr>
                        <tr style="background-color: #D7F0FF;">
                            <td class="GridRow2B1L">
                                <asp:Label ID="RoomTypeIdLabel" runat="server" Text='<%# Eval("RoomTypeId") %>' />
                            </td>
                            <td class="GridRow2B1L">
                                <asp:Label ID="RateCodeId" runat="server" Text='<%# Eval("RateCodeId") %>' />
                            </td>
                            <td class="GridRow2B1L" style="text-align: right;">
                                <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount","{0:N2}") %>' />
                            </td>
                            <td class="GridRow2B1L">
                                <i>Current</i>
                            </td>
                        </tr>
                </AlternatingItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:DataList>
        </asp:Panel> 
        <asp:HiddenField ID="dummy" runat="server" />
        <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel" CancelControlID="btnOk"  OkControlID="btnOk" 
            DropShadow="True" Enabled="True" BackgroundCssClass="modalBackground" X="200" Y="200" TargetControlID="dummy" />
        <asp:Panel ID="popPanel" runat="server" Width="300px" BackColor="White" Style="display: none">
            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td class="GridLabelBG">
                        <asp:Label ID="popLabel" runat="server" Text="Delete data" SkinID="skGridLabel" />
                    </td>
                </tr>
                <tr>
                    <td class="GridBorder">
                        <p style="text-align: center;">
                            <asp:Label ID="popMessage" runat="server" Text="Message" />
                        </p>
                        <p style="text-align: right;" >
                            <br />
                            <asp:Button ID="btnOk" runat="server" Text="OK" SkinID="skBtnBase" />
                        </p>
                    </td>
                </tr>
            </table>
        </asp:Panel> 
    </ div>
</asp:Content>

