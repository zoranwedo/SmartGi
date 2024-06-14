<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" CodeFile="ReservationsRateFlow.aspx.vb" Inherits="Invoices_ReservationsRateFlow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Reservations Rate Flow 
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
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/collapse_.png" />&nbsp; 
                        </asp:Label>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px">
                    <asp:Panel ID="pnSearch" runat="server" Style="width: 600px" DefaultButton="btFilter">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="GridRow1B" style="width: 100px;">Hotel<br />(<i>mapping</i>)</td>
                                <td class="GridRow1B" colspan="3">
                                    <asp:DropDownList ID="cbHotel" runat="server" CssClass="TextBox" DataSourceID="dsHotel"
                                        DataTextField="HotelHID" DataValueField="HotelHID" AppendDataBoundItems="True">
                                        <asp:ListItem Selected="True" Value="">all hotels</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsHotel" runat="server" 
                                        SelectMethod="GetData" TypeName="dsDTSTableAdapters.HotelTableAdapter" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Tour Operator<br />(<i>mapping</i>)</td>
                                <td class="GridRow1B" colspan="3">
                                    <asp:TextBox ID="txtTO" runat="server" CssClass="TextBox" />
                                </td>
                            </tr>
                            <%--
                            <tr>
                                <td class="GridRow1B">
                                    Tour Operator
                                </td>
                                <td class="GridRow1B" colspan="3">
                                    <asp:DropDownList ID="ddlTO" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsTOAll" DataTextField="TourOp" DataValueField="TourOpID">
                                        <asp:ListItem Selected="True" Value="">all </asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsTOAll" runat="server" OldValuesParameterFormatString="original_{0}" 
                                        SelectMethod="GetDataByUser" 
                                        TypeName="TourOperTableAdapters.TourOpTableAdapter">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="hfUsername" Name="User" PropertyName="Value" Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            --%>
                            <tr>
                                <td class="GridRow1B">Name</td>
                                <td class="GridRow1B" colspan="3">
                                    <asp:TextBox ID="txtName" runat="server" CssClass="TextBox" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Room Type<br />(<i>mapping</i>)</td>
                                <td class="GridRow1B" colspan="3">
                                    <asp:DropDownList ID="ddlRoomMap" runat="server" CssClass="TextBox" 
                                        DataSourceID="drRoomMap" DataTextField="RoomTypeHID" 
                                        DataValueField="RoomTypeHID" AppendDataBoundItems="True" >
                                        <asp:ListItem Value="">All</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="drRoomMap" runat="server" 
                                        SelectMethod="GetData" 
                                        TypeName="dsDTSTableAdapters.HotelRoomMapTableAdapter">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="cbHotel" Name="HotelHID" PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 100px;">Check In From</td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="fltStart" runat="server" CssClass="TextBox" />
                                    <asp:CalendarExtender ID="cal_fltStart" runat="server" 
                                        CssClass="cal_Theme1" Enabled="True" TargetControlID="fltStart">
                                    </asp:CalendarExtender>
                                    <asp:TextBoxWatermarkExtender ID="wm_fltStart" runat="server" 
                                        WatermarkCssClass="WaterMark" TargetControlID="fltStart" 
                                        WatermarkText="Check In date equals or later than" />
                                    <asp:CompareValidator ID="cv_fltStart" runat="server" 
                                        Display="None" ControlToValidate="fltStart" 
                                        Operator="DataTypeCheck" Type="Date" 
                                        ErrorMessage="Only date input" />
                                    <asp:ValidatorCalloutExtender ID="cve_fltStart" runat="server" 
                                        Enabled="True" TargetControlID="cv_fltStart" />
                                </td>
                                <td class="GridRow1B" style="width: 100px; padding-left:5px;">Check In To</td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="fltFinish" runat="server" CssClass="TextBox" />
                                    <asp:CalendarExtender ID="cal_fltFinish" runat="server" 
                                        CssClass="cal_Theme1" Enabled="True" TargetControlID="fltFinish" />
                                    <asp:TextBoxWatermarkExtender ID="wm_fltFinish" runat="server" 
                                        WatermarkCssClass="WaterMark" TargetControlID="fltFinish" 
                                        WatermarkText="Check In date equals or before than" />
                                    <asp:CompareValidator ID="cv_fltFinish" runat="server" 
                                        Display="None" ControlToValidate="fltFinish" 
                                        Operator="DataTypeCheck" Type="Date" 
                                        ErrorMessage="Only date input" />
                                    <asp:ValidatorCalloutExtender ID="cve_fltFinish" runat="server" 
                                        Enabled="True" TargetControlID="cv_fltFinish" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 100px;">Folio From</td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="txtFolioFrom" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wmFolioFrom" runat="server" 
                                        TargetControlID="txtFolioFrom" WatermarkCssClass="WaterMark" 
                                        WatermarkText="Folio Number equals or greater than" />
                                    <asp:CompareValidator ID="valFolioFrom" runat="server" 
                                        ControlToValidate="txtFolioFrom" Display="None" 
                                        ErrorMessage="Number input required!" Operator="DataTypeCheck" Type="Integer" />
                                    <asp:ValidatorCalloutExtender ID="calFolioFrom" runat="server" 
                                        TargetControlID="valFolioFrom" />
                                </td>
                                <td class="GridRow1B" style="width: 100px; padding-left:5px;">Folio To</td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="txtFolioTo" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wmFolioTo" runat="server" 
                                        TargetControlID="txtFolioTo" WatermarkCssClass="WaterMark" 
                                        WatermarkText="Folio Number equals or less than" />
                                    <asp:CompareValidator ID="valFolioTo" runat="server" 
                                        ControlToValidate="txtFolioTo" Display="None" 
                                        ErrorMessage="Number input required!" Operator="DataTypeCheck" Type="Integer" />
                                    <asp:ValidatorCalloutExtender ID="calFolioTo" runat="server" 
                                        TargetControlID="valFolioTo" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 100px;">Booking From</td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="fltBkDateFrom" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wm_fltBkDateFrom" runat="server" 
                                        WatermarkCssClass="WaterMark" TargetControlID="fltBkDateFrom" 
                                        WatermarkText="Booking date equals or later than" />
                                    <asp:CalendarExtender ID="cal_fltBkDateFrom" runat="server" 
                                        CssClass="cal_Theme1" Enabled="True" TargetControlID="fltBkDateFrom">
                                    </asp:CalendarExtender>
                                    <asp:CompareValidator ID="cv_fltBkDateFrom" runat="server" 
                                        Display="None" ControlToValidate="fltBkDateFrom" 
                                        Operator="DataTypeCheck" Type="Date" 
                                        ErrorMessage="Only date input" />
                                    <asp:ValidatorCalloutExtender ID="cve_fltBkDateFrom" runat="server" 
                                        Enabled="True" TargetControlID="cv_fltBkDateFrom" />
                                </td>
                                <td class="GridRow1B" style="width: 100px; padding-left:5px;">Booking To</td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="fltBkDateTo" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wm_fltBkDateTo" runat="server" 
                                        WatermarkCssClass="WaterMark" TargetControlID="fltBkDateTo" 
                                        WatermarkText="Booking date equals or before than" />
                                    <asp:CalendarExtender ID="cal_fltBkDateTo" runat="server" 
                                        CssClass="cal_Theme1" Enabled="True" TargetControlID="fltBkDateTo" />
                                    <asp:CompareValidator ID="cv_fltBkDateTo" runat="server" 
                                        Display="None" ControlToValidate="fltBkDateTo" 
                                        Operator="DataTypeCheck" Type="Date" 
                                        ErrorMessage="Only date input" />
                                    <asp:ValidatorCalloutExtender ID="cve_fltBkDateTo" runat="server" 
                                        Enabled="True" TargetControlID="cv_fltBkDateTo" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 100px;">Bk Number</td>
                                <td class="GridRow1B" colspan="3">
                                    <asp:TextBox ID="fltBkNumber" runat="server" CssClass="TextBox" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear">Group Code</td>
                                <td class="GridRowClear" colspan="3">
                                    <asp:TextBox ID="txtResGroup" runat="server" CssClass="TextBox" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" class="ComandRow2T" style="height: 30px; padding-top: 5px">
                                    <asp:Button ID="btFilter" runat="server" SkinID="skBtnFilter" />&nbsp;
                                    <asp:Button ID="btClear" runat="server" SkinID="skBtnClear" />&nbsp;
                                    <asp:Button ID="btnReport" runat="server" SkinID="skBtnBase" Text="Report - layout" Width="98px" />&nbsp;
                                    <asp:Button ID="btnReportInOne" runat="server" SkinID="skBtnBase" Text="Report-rate match" Width="110px" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <asp:ObjectDataSource ID="dsReservas" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="dsRateFlowTableAdapters.SelectRateLogResTableAdapter" >
            <SelectParameters>
                <asp:ControlParameter ControlID="cbHotel" Name="HotelHID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="txtTO" Name="TourOpHID" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="ddlRoomMap" Name="RoomTypeHID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="txtName" Name="Name" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtResGroup" Name="ResGroup" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="fltStart" Name="CheckInFrom" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="fltFinish" Name="CheckInTo" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="fltBkDateFrom" Name="BkDateFrom" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="fltBkDateTo" Name="BkDateTo" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="fltBkNumber" Name="BkNumber" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtFolioFrom" Name="FolioFrom" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="txtFolioTo" Name="FolioTo" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    <div class="Blue"> 
        <asp:Panel runat="server" ID="pnlCnt" Visible="false" >
            <asp:DataList ID="DataList1" runat="server" DataSourceID="dsReservas" style="margin-right: 0px">
                <HeaderTemplate>
                    <table cellpadding="2px" cellspacing="0">
                        <tr class="SelectRowClear" style="text-decoration: underline;">
                            <th style="width: 80px;" class="GridRow1TBL">Reservation</th>
                            <th style="width: 80px;" class="GridRow1TBL">Folio</th>
                            <th style="width: 100px;" rowspan="2" class="GridRow1T6B1L">Hotel</th>
                            <th style="width: 100px;" rowspan="2" class="GridRow1T6B1L">Tour Operator</th>
                            <th style="width: 100px;" rowspan="2" class="GridRow1T6B1L">CheckIn</th>
                            <th style="width: 100px;" rowspan="2" class="GridRow1T6B1L">CheckOut</th>
                            <th style="width: 250px;" rowspan="2" class="GridRow1T6B1L">Name</th>
                            <th style="width: 50px;" rowspan="2" class="GridRow1T6B1L">MP</th>
                            <th style="width: 80px;" rowspan="2" class="GridRow1T6B1L">Room Type</th>
                            <th style="width: 90px;" rowspan="2" class="GridRow1T6B1L">Rate Code</th>
                            <th style="width: 90px;" rowspan="2" class="GridRow1T6B1L">Amount</th>
                            <th style="width: 65px;" rowspan="2" class="GridRow1T6B1L"></th>
                            <th style="width: 150px;" class="GridRow1TRBL">Processed</th>
                        </tr>
                        <tr class="SelectRowClear" style="text-decoration: underline;">
                            <th class="GridRow6B1L" style="text-align: right;">Invoice</th>
                            <th class="GridRow6B1L" style="text-align: right;">Number</th>
                            <th class="GridRow1R6B1L" style="text-align: right;">Current State</th>
                        </tr>
                </HeaderTemplate>                 
                <ItemTemplate>
                        <asp:Panel runat="server" ID="Panel2" Visible='<%# Eval("RateMatch") = -10 %>' >
                        <tr>
                            <td class="GridRow2B1L" style="width: 80px">
                                <asp:Label ID="ResIDLabel" runat="server" Text='<%# Eval("ResID") %>' />
                            </td>
                            <td class="GridRow2B1L" style="width: 80px; font-weight: bold; color: Red;">
                                <asp:Label ID="FolioLabel" runat="server" Text='<%# Eval("FolioFull") %>' />
                            </td>
                            <td class="GridRow2B1L" style="width: 100px">
                                <asp:Label ID="HotelHIDLabel" runat="server" Text='<%# Eval("HotelHID") %>' />
                            </td>
                            <td class="GridRow2B1L" style="width: 100px">
                                <asp:Label ID="TourOpHIDLabel" runat="server" Text='<%# Eval("TourOpHID") %>' />
                            </td>
                            <td class="GridRow2B1L" style="width: 100px">
                                <asp:Label ID="CheckInLabel" runat="server" Text='<%# Eval("CheckIn", "{0:d}") %>' />
                            </td>
                            <td class="GridRow2B1L" style="width: 100px">
                                <asp:Label ID="CheckOutLabel" runat="server" Text='<%# Eval("CheckOut", "{0:d}") %>' />
                            </td>
                            <td class="GridRow2B1L" style="width: 250px">
                                <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") & " " & Eval("Name") %>' />
                            </td>
                            <td class="GridRow2B1L" style="width: 50px">
                                <asp:Label ID="TipoTarLabel" runat="server" Text='<%# Eval("TipoTar") %>' />
                            </td>
                            <td class="GridRow2B1L" style="width: 80px; font-weight: bold; color: Red;">
                                <asp:Label ID="RoomTypeHIDLabel" runat="server" Text='<%# Eval("RoomTypeHID") %>' />
                            </td>
                            <td class="GridRow2B1L" style="width: 90px">
                                <asp:Label ID="RateHIDLabel" runat="server" Text='<%# Eval("RateHID") %>' />
                            </td>
                            <td class="GridRow2B1L" style="width: 90px; text-align: right;">
                                <asp:Label ID="PStAmountLabel" runat="server" Text='<%# Eval("PStAmount","{0:N2}") %>' />
                            </td>
                            <td class="GridRow2B1L" style="width: 65px">&nbsp;</td>
                            <td class="GridRow1R2B1L" style="width: 150px; text-align: right; font-weight: bold; color: Red;">
                                Reservation not invoiced!&nbsp;
                            </td>
                        </tr>
                        </asp:Panel>
                        <asp:Panel runat="server" ID="pnlInvoice" Visible='<%# Eval("RateMatch") <> -10 %>' >
                        <tr>
                            <td class="GridRow1BL" style="width: 80px">
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("ResID") %>' />
                            </td>
                            <td class="GridRow1BL" style="width: 80px">
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("FolioFull") %>' />
                            </td>
                            <td class="GridRow1BL" style="width: 100px">
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("HotelHID") %>' />
                            </td>
                            <td class="GridRow1BL" style="width: 100px">
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("TourOpHID") %>' />
                            </td>
                            <td class="GridRow1BL" style="width: 100px">
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("CheckIn", "{0:d}") %>' />
                            </td>
                            <td class="GridRow1BL" style="width: 100px">
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("CheckOut", "{0:d}") %>' />
                            </td>
                            <td class="GridRow1BL" style="width: 250px">
                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("LastName") & " " & Eval("Name") %>' />
                            </td>
                            <td class="GridRow1BL" style="width: 50px">
                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("TipoTar") %>' />
                            </td>
                            <td class="GridRow1BL" style="width: 80px">
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("RoomTypeHID") %>' />
                            </td>
                            <td class="GridRow1BL" style="width: 90px">
                                <asp:Label ID="Label11" runat="server" Text='<%# Eval("RateHID") %>' />
                            </td>
                            <td class="GridRow1BL" style="width: 90px; text-align: right;">
                                <asp:Label ID="Label112" runat="server" Text='<%# Eval("PStAmount","{0:N2}") %>' />
                            </td>
                            <td class="GridRow1BL" style="width: 65px">Res.</td>
                            <td class="GridRow1RBL" style="width: 150px">
                                <asp:Label ID="Label12" runat="server" Text='<%# Eval("Created", "{0:d}") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="GridRow2B1L" rowspan="3" style="text-align: right;" >
                                <asp:Label ID="InvoiceIDLabel" runat="server" Text='<%# Eval("InvoiceID") %>' />
                            </td>
                            <td class="GridRow2B1L" rowspan="3" style="text-align: right;" >
                                <asp:Label ID="InvNumberLabel" runat="server" Text='<%# Eval("InvNumber") %>' />
                            </td>
                            <td class="GridRow2B1L" colspan="4" rowspan="3" >
                                <table cellpadding="2" cellspacing="0">
                                    <tr>
                                        <td style="width: 390px; border-bottom: solid 1px;">
                                            <asp:Label ID="HotelLabel" runat="server" Text='<%# Eval("Hotel") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            <asp:Label ID="TourOpLabel" runat="server" Text='<%# Eval("TourOp") %>' />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td class="GridRow2B1L" rowspan="3" >
                                <asp:Label ID="DetTextLabel" runat="server" Text='<%# Eval("DetText") %>' />
                            </td>
                            <td class="GridRow2B1L" rowspan="3" >
                                <asp:Label ID="MealPlanIdLabel" runat="server" Text='<%# Eval("MealPlanId") %>' />
                            </td>
                            <td class="GridRow1BL" >
                                <asp:Label ID="insRoomTypeIdLabel" runat="server" Text='<%# Eval("insRoomTypeId") %>' />
                            </td>
                            <td class="GridRow1BL" >
                                <asp:Label ID="insRateCodeIdLabel" runat="server" Text='<%# Eval("insRateCodeId") %>' />
                            </td>
                            <td class="GridRow1BL" >
                                &nbsp;
                            </td>
                            <td class="GridRow1BL" ><i>Ins.</i></td>
                            <td class="GridRow1RBL" rowspan="2" style="text-align: right;" >
                                <asp:Label ID="MatchLabel" runat="server" Text="OK" Visible='<%# Eval("RateMatch") = 1 %>' />
                                <asp:Label ID="DeletedLabel" runat="server" Text="Deleted" Visible='<%# Eval("RateMatch") = 0 %>' ForeColor="Red" />
                                <asp:Label ID="NotMatchLabel" runat="server" Text="Rate changed" Visible='<%# Eval("RateMatch") = -1 %>' ForeColor="Orange" />
                                <b>
                                <asp:Label ID="NoRateLabel" runat="server" Text="No rate found" Visible='<%# Eval("RateMatch") = -5 %>' ForeColor="Orange" />
                                <asp:Label ID="NotInvoicedLabel" runat="server" Text="Not invoiced" Visible='<%# Eval("RateMatch") = -10 %>' ForeColor="Red" />
                                </b>
                            </td>
                        </tr>
                        <tr>
                            <td class="GridRow1BL">
                                <asp:Label ID="htlRoomTypeIdLabel" runat="server" Text='<%# Eval("htlRoomTypeId") %>' />
                            </td>
                            <td class="GridRow1BL">
                                <asp:Label ID="htlRateCodeIdLabel" runat="server" Text='<%# Eval("htlRateCodeId") %>' />
                            </td>
                            <td class="GridRow1BL" style="text-align: right;">
                                <asp:Label ID="OStAmountLabel" runat="server" Text='<%# Eval("OStAmount","{0:N2}") %>' />
                            </td>
                            <td class="GridRow1BL"><i>From Htl.</i></td>
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
                            <td class="GridRow2B1L"><i>Current</i></td>
                            <td class="GridRow1R2B1L" style="text-align: right;" >
                                <asp:Label ID="InvoiceStateLabel" runat="server" Text='<%# Eval("InvoiceState") %>' />
                                <asp:Label ID="InvoiceDeletedLabel" runat="server" Text="Invoice detail deleted!"
                                    Visible='<%# Eval("InvoiceID") is DbNull.value %>' 
                                    Font-Bold="True" ForeColor="Red" />
                            </td>
                        </tr>
                        </asp:Panel>
                </ItemTemplate>
                <AlternatingItemTemplate>
                        <asp:Panel runat="server" ID="Panel2" Visible='<%# Eval("RateMatch") = -10 %>' >
                        <tr style="background-color: #D7F0FF;">
                            <td class="GridRow2B1L" style="width: 80px">
                                <asp:Label ID="ResIDLabel" runat="server" Text='<%# Eval("ResID") %>' />
                            </td>
                            <td class="GridRow2B1L" style="width: 80px; font-weight: bold; color: Red;">
                                <asp:Label ID="FolioLabel" runat="server" Text='<%# Eval("FolioFull") %>' />
                            </td>
                            <td class="GridRow2B1L" style="width: 100px">
                                <asp:Label ID="HotelHIDLabel" runat="server" Text='<%# Eval("HotelHID") %>' />
                            </td>
                            <td class="GridRow2B1L" style="width: 100px">
                                <asp:Label ID="TourOpHIDLabel" runat="server" Text='<%# Eval("TourOpHID") %>' />
                            </td>
                            <td class="GridRow2B1L" style="width: 100px">
                                <asp:Label ID="CheckInLabel" runat="server" Text='<%# Eval("CheckIn", "{0:d}") %>' />
                            </td>
                            <td class="GridRow2B1L" style="width: 100px">
                                <asp:Label ID="CheckOutLabel" runat="server" Text='<%# Eval("CheckOut", "{0:d}") %>' />
                            </td>
                            <td class="GridRow2B1L" style="width: 250px">
                                <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") & " " & Eval("Name") %>' />
                            </td>
                            <td class="GridRow2B1L" style="width: 50px">
                                <asp:Label ID="TipoTarLabel" runat="server" Text='<%# Eval("TipoTar") %>' />
                            </td>
                            <td class="GridRow2B1L" style="width: 80px; font-weight: bold; color: Red;">
                                <asp:Label ID="RoomTypeHIDLabel" runat="server" Text='<%# Eval("RoomTypeHID") %>' />
                            </td>
                            <td class="GridRow2B1L" style="width: 90px">
                                <asp:Label ID="RateHIDLabel" runat="server" Text='<%# Eval("RateHID") %>' />
                            </td>
                            <td class="GridRow2B1L" style="width: 90px; text-align: right;">
                                <asp:Label ID="PStAmountLabel" runat="server" Text='<%# Eval("PStAmount","{0:N2}") %>' />
                            </td>
                            <td class="GridRow2B1L" style="width: 65px">&nbsp;</td>
                            <td class="GridRow1R2B1L" style="width: 150px; text-align: right; font-weight: bold; color: Red;">
                                Reservation not invoiced!&nbsp;
                            </td>
                        </tr>
                        </asp:Panel>
                        <asp:Panel runat="server" ID="pnlInvoice" Visible='<%# Eval("RateMatch") <> -10 %>' >
                        <tr style="background-color: #D7F0FF;">
                            <td class="GridRow1BL" style="width: 80px">
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("ResID") %>' />
                            </td>
                            <td class="GridRow1BL" style="width: 80px">
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("FolioFull") %>' />
                            </td>
                            <td class="GridRow1BL" style="width: 100px">
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("HotelHID") %>' />
                            </td>
                            <td class="GridRow1BL" style="width: 100px">
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("TourOpHID") %>' />
                            </td>
                            <td class="GridRow1BL" style="width: 100px">
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("CheckIn", "{0:d}") %>' />
                            </td>
                            <td class="GridRow1BL" style="width: 100px">
                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("CheckOut", "{0:d}") %>' />
                            </td>
                            <td class="GridRow1BL" style="width: 250px">
                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("LastName") & " " & Eval("Name") %>' />
                            </td>
                            <td class="GridRow1BL" style="width: 50px">
                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("TipoTar") %>' />
                            </td>
                            <td class="GridRow1BL" style="width: 80px">
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("RoomTypeHID") %>' />
                            </td>
                            <td class="GridRow1BL" style="width: 90px">
                                <asp:Label ID="Label11" runat="server" Text='<%# Eval("RateHID") %>' />
                            </td>
                            <td class="GridRow1BL" style="width: 90px; text-align: right;">
                                <asp:Label ID="Label112" runat="server" Text='<%# Eval("PStAmount","{0:N2}") %>' />
                            </td>
                            <td class="GridRow1BL" style="width: 65px">Res.</td>
                            <td class="GridRow1RBL" style="width: 150px">
                                <asp:Label ID="Label12" runat="server" Text='<%# Eval("Created", "{0:d}") %>' />
                            </td>
                        </tr>
                        <tr style="background-color: #D7F0FF;">
                            <td class="GridRow2B1L" rowspan="3" style="text-align: right;" >
                                <asp:Label ID="InvoiceIDLabel" runat="server" Text='<%# Eval("InvoiceID") %>' />
                            </td>
                            <td class="GridRow2B1L" rowspan="3" style="text-align: right;" >
                                <asp:Label ID="InvNumberLabel" runat="server" Text='<%# Eval("InvNumber") %>' />
                            </td>
                            <td class="GridRow2B1L" colspan="4" rowspan="3" >
                                <table cellpadding="2" cellspacing="0">
                                    <tr>
                                        <td style="width: 390px; border-bottom: solid 1px;">
                                            <asp:Label ID="HotelLabel" runat="server" Text='<%# Eval("Hotel") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            <asp:Label ID="TourOpLabel" runat="server" Text='<%# Eval("TourOp") %>' />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td class="GridRow2B1L" rowspan="3" >
                                <asp:Label ID="DetTextLabel" runat="server" Text='<%# Eval("DetText") %>' />
                            </td>
                            <td class="GridRow2B1L" rowspan="3" >
                                <asp:Label ID="MealPlanIdLabel" runat="server" Text='<%# Eval("MealPlanId") %>' />
                            </td>
                            <td class="GridRow1BL" >
                                <asp:Label ID="insRoomTypeIdLabel" runat="server" Text='<%# Eval("insRoomTypeId") %>' />
                            </td>
                            <td class="GridRow1BL" >
                                <asp:Label ID="insRateCodeIdLabel" runat="server" Text='<%# Eval("insRateCodeId") %>' />
                            </td>
                            <td class="GridRow1BL" >
                                &nbsp;
                            </td>
                            <td class="GridRow1BL" ><i>Ins.</i></td>
                            <td class="GridRow1RBL" rowspan="2" style="text-align: right;" >
                                <asp:Label ID="MatchLabel" runat="server" Text="OK" Visible='<%# Eval("RateMatch") = 1 %>' />
                                <asp:Label ID="DeletedLabel" runat="server" Text="Deleted" Visible='<%# Eval("RateMatch") = 0 %>' ForeColor="Red" />
                                <asp:Label ID="NotMatchLabel" runat="server" Text="Rate changed" Visible='<%# Eval("RateMatch") = -1 %>' ForeColor="Orange" />
                                <b>
                                <asp:Label ID="NoRateLabel" runat="server" Text="No rate found" Visible='<%# Eval("RateMatch") = -5 %>' ForeColor="Orange" />
                                <asp:Label ID="NotInvoicedLabel" runat="server" Text="Not invoiced" Visible='<%# Eval("RateMatch") = -10 %>' ForeColor="Red" />
                                </b>
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
                            <td class="GridRow1BL"><i>From Htl.</i></td>
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
                            <td class="GridRow2B1L"><i>Current</i></td>
                            <td class="GridRow1R2B1L" style="text-align: right;" >
                                <asp:Label ID="InvoiceStateLabel" runat="server" Text='<%# Eval("InvoiceState") %>' />
                                <asp:Label ID="InvoiceDeletedLabel" runat="server" Text="Invoice detail deleted!"
                                    Visible='<%# Eval("InvoiceID") is DbNull.value %>' 
                                    Font-Bold="True" ForeColor="Red" />
                            </td>
                        </tr>
                        </asp:Panel>
                </AlternatingItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:DataList>
    
        </asp:Panel>
        
        <asp:Panel ID="pnlEmpty" runat="server" Visible="False" >
            <asp:Label ID="lblPnl" runat="server" 
                Text="No results for filter criteria or filter is too wide!" 
                CssClass="RowTitle" Height="25px"></asp:Label>
        </asp:Panel >
        
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
                            <asp:Label ID="popMessage" runat="server" Text="Message"></asp:Label>
                        </p>
                        <%--<p style="text-align: right;" class="GridRow2TB">--%>
                        <p style="text-align: right;" >
                            <br />
                            <asp:Button ID="btnOk" runat="server" Text="OK" SkinID="skBtnBase" />
                        </p>
                    </td>
                </tr>
            </table>
        </asp:Panel> 
    </div>
                
</asp:Content>

