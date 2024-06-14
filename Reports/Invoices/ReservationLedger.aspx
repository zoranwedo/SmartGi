<%@ Page Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" CodeFile="ReservationLedger.aspx.vb" Inherits="Reports_Invoices_ReservationLedger" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Guest Ledger vs. City Ledger
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
                <td class="GridBorder" >
                    <asp:Panel ID="pnSearch" runat="server" DefaultButton="btnReport">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="GridRow1B" style="width: 100px;">Hotel Mapping</td>
                                <td class="GridRow1B" colspan="3">
                                    <asp:DropDownList ID="cbHotelHID" runat="server" CssClass="TextBox" DataSourceID="dsHotelHID"
                                        DataTextField="HotelHID" DataValueField="HotelHID" AppendDataBoundItems="True">
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsHotelHID" runat="server" 
                                        SelectMethod="GetData" 
                                        TypeName="dsRateFlowTableAdapters.HotelHIDTableAdapter" 
                                        OldValuesParameterFormatString="original_{0}" />
                                </td>
                            </tr>
                             <tr>
                                <td class="GridRow1B" style="width: 100px;">Hotel Group</td>
                                <td class="GridRow1B" colspan="3">
                                    <asp:DropDownList ID="cbHotelGroup" runat="server" CssClass="TextBox" DataSourceID="dsHotelGroup"
                                        DataTextField="HotelGroup" DataValueField="HotelGroupID" AppendDataBoundItems="True">
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsHotelGroup" runat="server" 
                                        SelectMethod="GetData" 
                                        TypeName="dsRateFlowTableAdapters.HotelGroupTableAdapter" 
                                        OldValuesParameterFormatString="original_{0}" />
                                </td>
                            </tr>
                           <tr>
                                <td class="GridRow1B" style="width: 100px;">Hotel</td>
                                <td class="GridRow1B" colspan="3">
                                    <asp:DropDownList ID="cbHotel" runat="server" CssClass="TextBox" DataSourceID="dsHotel"
                                        DataTextField="Hotel" DataValueField="HotelID" AppendDataBoundItems="True">
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsHotel" runat="server" 
                                        SelectMethod="GetData" 
                                        TypeName="dsRateFlowTableAdapters.HotelTableAdapter" 
                                        OldValuesParameterFormatString="original_{0}" />
                                </td>
                            </tr>
                             <tr>
                                <td class="GridRow1B">
                                    Tour Op.Group
                                </td>
                                <td class="GridRow1B" colspan="3">
                                    <asp:DropDownList ID="cbTTOOGroup" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsTOGroup" DataTextField="TourOpGroup" DataValueField="TourOpGroupID">
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsTOGroup" runat="server"
                                        SelectMethod="GetData" 
                                        TypeName="dsRateFlowTableAdapters.TourOpGroupTableAdapter" 
                                        OldValuesParameterFormatString="original_{0}" />
                                </td>
                            </tr>
                           <tr>
                                <td class="GridRow1B">
                                    Tour Operator
                                </td>
                                <td class="GridRow1B" colspan="3">
                                    <asp:DropDownList ID="cbTTOO" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsTOAll" DataTextField="TourOp" DataValueField="TourOpID">
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsTOAll" runat="server"
                                        SelectMethod="GetData" 
                                        TypeName="dsRateFlowTableAdapters.TourOpTableAdapter" 
                                        OldValuesParameterFormatString="original_{0}" />
                                </td>
                            </tr>
                           <tr>
                                <td class="GridRow1B">
                                    Market
                                </td>
                                <td class="GridRow1B" colspan="3">
                                    <asp:DropDownList ID="cbMarket" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsMarket" DataTextField="Market" DataValueField="MarketID">
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsMarket" runat="server"
                                        SelectMethod="GetData" 
                                        TypeName="dsRateFlowTableAdapters.MarketTableAdapter" 
                                        OldValuesParameterFormatString="original_{0}" />
                                </td>
                            </tr>
                           <tr>
                                <td class="GridRow1B">
                                    Payment Cond.
                                </td>
                                <td class="GridRow1B" colspan="3">
                                    <asp:DropDownList ID="cbPayCond" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsPayCond" DataTextField="PayCond" DataValueField="PayCondID">
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsPayCond" runat="server"
                                        SelectMethod="GetData" 
                                        TypeName="dsRateFlowTableAdapters.PayCondTableAdapter" 
                                        OldValuesParameterFormatString="original_{0}" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Name</td>
                                <td class="GridRow1B" colspan="3">
                                    <asp:TextBox ID="txtName" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wm_txtName" runat="server" 
                                        WatermarkCssClass="WaterMark" TargetControlID="txtName" 
                                        WatermarkText="Enter part of the name" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Folio</td>
                                <td class="GridRow1B" colspan="3">
                                    <asp:TextBox ID="txtFolio" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wm_txtFolio" runat="server" 
                                        WatermarkCssClass="WaterMark" TargetControlID="txtFolio" 
                                        WatermarkText="Enter part of the folio (centralID)" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Bk.Number</td>
                                <td class="GridRow1B" colspan="3">
                                    <asp:TextBox ID="txtBkNumber" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wm_txtBkNumber" runat="server" 
                                        WatermarkCssClass="WaterMark" TargetControlID="txtBkNumber" 
                                        WatermarkText="Enter part of the booking number (voucher)" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Group Code</td>
                                <td class="GridRow1B" colspan="3">
                                    <asp:TextBox ID="txtResGroup" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wm_txtResGroup" runat="server" 
                                        WatermarkCssClass="WaterMark" TargetControlID="txtResGroup" 
                                        WatermarkText="Enter part of the group or package code" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 100px;">Inv.Num From</td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="txtInvNumFrom" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wm_txtInvNumFrom" runat="server" 
                                        WatermarkCssClass="WaterMark" TargetControlID="txtInvNumFrom" 
                                        WatermarkText="Invoice number equals or greater than" />
                                    <asp:CompareValidator ID="val_txtInvNumFrom" runat="server" 
                                        Display="None" ControlToValidate="txtInvNumFrom" 
                                        Operator="DataTypeCheck" Type="Integer" 
                                        ErrorMessage="Not a valid integer" />
                                    <asp:ValidatorCalloutExtender ID="cal_val_txtInvNumFrom" runat="server" 
                                        Enabled="True" TargetControlID="val_txtInvNumFrom" />
                                </td>
                                <td class="GridRow1B" style="width: 90px; padding-left: 15px;">Inv.Num To</td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="txtInvNumTo" runat="server" CssClass="TextBox" Width="190px" />
                                    <asp:TextBoxWatermarkExtender ID="wm_txtInvNumTo" runat="server" 
                                        WatermarkCssClass="WaterMark" TargetControlID="txtInvNumTo" 
                                        WatermarkText="Invoice number equals or less than" />
                                    <asp:CompareValidator ID="val_txtInvNumTo" runat="server" 
                                        Display="None" ControlToValidate="txtInvNumTo" 
                                        Operator="DataTypeCheck" Type="Integer" 
                                        ErrorMessage="Not a valid integer" />
                                    <asp:ValidatorCalloutExtender ID="cal_val_txtInvNumTo" runat="server" 
                                        Enabled="True" TargetControlID="val_txtInvNumTo" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 100px;">Check In From</td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="txtCkInFrom" runat="server" CssClass="TextBox" />
                                    <asp:CalendarExtender ID="calCkInFrom" runat="server" 
                                        CssClass="cal_Theme1" Enabled="True" TargetControlID="txtCkInFrom" />
                                    <asp:TextBoxWatermarkExtender ID="wm_txtCkInFrom" runat="server" 
                                        WatermarkCssClass="WaterMark" TargetControlID="txtCkInFrom" 
                                        WatermarkText="Check In date equals or after than" />
                                    <asp:CompareValidator ID="val_txtCkInFrom" runat="server" 
                                        Display="None" ControlToValidate="txtCkInFrom" 
                                        Operator="DataTypeCheck" Type="Date" 
                                        ErrorMessage="Not a valid date" />
                                    <asp:ValidatorCalloutExtender ID="cal_val_txtCkInFrom" runat="server" 
                                        Enabled="True" TargetControlID="val_txtCkInFrom" />
                                </td>
                                <td class="GridRow1B" style="width: 90px; padding-left: 15px;">Check In To</td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="txtCkInTo" runat="server" CssClass="TextBox" Width="190px" />
                                    <asp:CalendarExtender ID="calCkInTo" runat="server" 
                                        CssClass="cal_Theme1" Enabled="True" TargetControlID="txtCkInTo" />
                                    <asp:TextBoxWatermarkExtender ID="wm_txtCkInTo" runat="server" 
                                        WatermarkCssClass="WaterMark" TargetControlID="txtCkInTo" 
                                        WatermarkText="Check In date equals or before than" />
                                    <asp:CompareValidator ID="val_txtCkInTo" runat="server" 
                                        Display="None" ControlToValidate="txtCkInTo" 
                                        Operator="DataTypeCheck" Type="Date" 
                                        ErrorMessage="Not a valid date" />
                                    <asp:ValidatorCalloutExtender ID="cal_val_txtCkInTo" runat="server" 
                                        Enabled="True" TargetControlID="val_txtCkInTo" />
                                </td>
                            </tr>
                             <tr>
                                <td class="GridRow1B" style="width: 100px;">Check Out From</td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="txtCkOutFrom" runat="server" CssClass="TextBox" />
                                    <asp:CalendarExtender ID="calCkOutFrom" runat="server" 
                                        CssClass="cal_Theme1" Enabled="True" TargetControlID="txtCkOutFrom" />
                                    <asp:TextBoxWatermarkExtender ID="wm_txtCkOutFrom" runat="server" 
                                        WatermarkCssClass="WaterMark" TargetControlID="txtCkOutFrom" 
                                        WatermarkText="Check Out date equals or after than" />
                                    <asp:CompareValidator ID="val_txtCkOutFrom" runat="server" 
                                        Display="None" ControlToValidate="txtCkOutFrom" 
                                        Operator="DataTypeCheck" Type="Date" 
                                        ErrorMessage="Not a valid date" />
                                    <asp:ValidatorCalloutExtender ID="cal_val_txtCkOutFrom" runat="server" 
                                        Enabled="True" TargetControlID="val_txtCkOutFrom" />
                                </td>
                                <td class="GridRow1B" style="width: 90px; padding-left: 15px;">Check Out To</td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="txtCkOutTo" runat="server" CssClass="TextBox" Width="190px" />
                                    <asp:CalendarExtender ID="calCkOutTo" runat="server" 
                                        CssClass="cal_Theme1" Enabled="True" TargetControlID="txtCkOutTo" />
                                    <asp:TextBoxWatermarkExtender ID="wm_txtCkOutTo" runat="server" 
                                        WatermarkCssClass="WaterMark" TargetControlID="txtCkOutTo" 
                                        WatermarkText="Check Out date equals or before than" />
                                    <asp:CompareValidator ID="val_txtCkOutTo" runat="server" 
                                        Display="None" ControlToValidate="txtCkOutTo" 
                                        Operator="DataTypeCheck" Type="Date" 
                                        ErrorMessage="Not a valid date" />
                                    <asp:ValidatorCalloutExtender ID="cal_val_txtCkOutTo" runat="server" 
                                        Enabled="True" TargetControlID="val_txtCkOutTo" />
                                </td>
                            </tr>
                             <tr>
                                <td class="GridRow1B" style="width: 100px;">Invoiced From</td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="txtInvoicedFrom" runat="server" CssClass="TextBox" />
                                    <asp:CalendarExtender ID="calInvoicedFrom" runat="server" 
                                        CssClass="cal_Theme1" Enabled="True" TargetControlID="txtInvoicedFrom" />
                                    <asp:TextBoxWatermarkExtender ID="wm_txtInvoicedFrom" runat="server" 
                                        WatermarkCssClass="WaterMark" TargetControlID="txtInvoicedFrom" 
                                        WatermarkText="Invoice created on date equals or after than" />
                                    <asp:CompareValidator ID="val_txtInvoicedFrom" runat="server" 
                                        Display="None" ControlToValidate="txtInvoicedFrom" 
                                        Operator="DataTypeCheck" Type="Date" 
                                        ErrorMessage="Not a valid date" />
                                    <asp:ValidatorCalloutExtender ID="cal_val_txtInvoicedFrom" runat="server" 
                                        Enabled="True" TargetControlID="val_txtInvoicedFrom" />
                                </td>
                                <td class="GridRow1B" style="width: 90px; padding-left: 15px;">Invoiced To</td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="txtInvoicedTo" runat="server" CssClass="TextBox" Width="190px" />
                                    <asp:CalendarExtender ID="calInvoicedTo" runat="server" 
                                        CssClass="cal_Theme1" Enabled="True" TargetControlID="txtInvoicedTo" />
                                    <asp:TextBoxWatermarkExtender ID="wm_txtInvoicedTo" runat="server" 
                                        WatermarkCssClass="WaterMark" TargetControlID="txtInvoicedTo" 
                                        WatermarkText="Invoice created on date equals or before than" />
                                    <asp:CompareValidator ID="val_txtInvoicedTo" runat="server" 
                                        Display="None" ControlToValidate="txtInvoicedTo" 
                                        Operator="DataTypeCheck" Type="Date" 
                                        ErrorMessage="Not a valid date" />
                                    <asp:ValidatorCalloutExtender ID="cal_val_txtInvoicedTo" runat="server" 
                                        Enabled="True" TargetControlID="val_txtInvoicedTo" />
                                </td>
                            </tr>
                           <tr>
                                <td class="GridRow1B">
                                    Inv.State
                                </td>
                                <td class="GridRow1B" colspan="3">
                                    <asp:DropDownList ID="cbInvoiceState" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsInvoiceState" DataTextField="InvoiceState" DataValueField="InvoiceStateID">
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsInvoiceState" runat="server"
                                        SelectMethod="GetData" 
                                        TypeName="dsRateFlowTableAdapters.InvoiceStateTableAdapter" 
                                        OldValuesParameterFormatString="original_{0}" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Res.State</td>
                                <td class="GridRow1B" colspan="3">
                                    <asp:DropDownList ID="cbResState" runat="server" AppendDataBoundItems="True" CssClass="TextBox">
                                        <asp:ListItem Value="">all</asp:ListItem>
                                        <asp:ListItem Value="R">booking</asp:ListItem>
                                        <asp:ListItem Value="H">checked in</asp:ListItem>
                                        <asp:ListItem Value="O">checked out</asp:ListItem>
                                        <asp:ListItem Selected="True" Value="HO">checked in/out</asp:ListItem>
                                        <asp:ListItem Value="S">no show</asp:ListItem>
                                        <%--<asp:ListItem Value="EX">excluded</asp:ListItem>--%>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear">Show</td>
                                <td class="GridRowClear" colspan="3">
                                    <asp:CheckBox ID="cbManual" runat="server" Text="Manually Invoiced" />
                                    <asp:CheckBox ID="cbStates" runat="server" Text="States" Checked="true" />
                                    <asp:CheckBox ID="cbCreditDebit" runat="server" Text="Credit/Debit" />
                                    <asp:CheckBox ID="cbRates" runat="server" Text="Applied Rates" Checked="true" />
                                </td>
                            </tr>
                            <tr>
                                <td class="ComandRow2T" >&nbsp;</td>
                                <td class="ComandRow2T" style="text-align: left;">
                                    <asp:CheckBox ID="ckbHotel" runat="server" Text="Hotel Values" />
                                </td>
                                <td colspan="2" class="ComandRow2T" >
                                    <asp:Button ID="btClear" runat="server" SkinID="skBtnClear" />&nbsp;
                                    <asp:Button ID="btnReport" runat="server" SkinID="skBtnBase" Text="Report" Width="98px" />&nbsp;
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="dsResLedger" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="dsRateFlowTableAdapters.ResLedgerTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="cbHotelHID" Name="HotelHID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="cbHotel" Name="HotelId" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="txtFolio" Name="FolioFull" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtName" Name="LastName" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtBkNumber" Name="BkNumber" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="cbTTOO" Name="TourOpID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="txtResGroup" Name="ResGroup" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtCkInFrom" Name="CheckInFrom" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtCkInTo" Name="CheckInTo" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtCkOutFrom" Name="CheckOutFrom" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtCkOutTo" Name="CheckOutTo" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="cbResState" Name="ResState" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="txtInvNumFrom" Name="InvNumFrom" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="txtInvNumTo" Name="InvNumTo" PropertyName="Text" Type="Int32" />
                
                <asp:ControlParameter ControlID="txtInvoicedFrom" Name="InvDateFrom" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtInvoicedTo" Name="InvDateTo" PropertyName="Text" Type="String" />
                
                <asp:ControlParameter ControlID="txtInvoicedFrom" Name="InvoicedFrom" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtInvoicedTo" Name="InvoicedTo" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="cbMarket" Name="MarketID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="cbPayCond" Name="PayContID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="cbTTOOGroup" Name="TourOpGroupID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="cbHotelGroup" Name="HotelGroupID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="cbInvoiceState" Name="InvState" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsInvLedger" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="dsRateFlowTableAdapters.InvLedgerTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="cbHotelHID" Name="HotelHID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="cbHotel" Name="HotelId" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="txtName" Name="LastName" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtBkNumber" Name="BkNumber" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="cbTTOO" Name="TourOpID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="txtResGroup" Name="ResGroup" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtCkInFrom" Name="CheckInFrom" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtCkInTo" Name="CheckInTo" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtCkOutFrom" Name="CheckOutFrom" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtCkOutTo" Name="CheckOutTo" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtInvNumFrom" Name="InvNumFrom" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="txtInvNumTo" Name="InvNumTo" PropertyName="Text" Type="Int32" />
                
                <asp:ControlParameter ControlID="txtInvoicedFrom" Name="InvDateFrom" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtInvoicedTo" Name="InvDateTo" PropertyName="Text" Type="String" />
                
                <asp:ControlParameter ControlID="txtInvoicedFrom" Name="InvoicedFrom" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtInvoicedTo" Name="InvoicedTo" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="cbMarket" Name="MarketID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="cbPayCond" Name="PayContID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="cbTTOOGroup" Name="TourOpGroupID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="cbHotelGroup" Name="HotelGroupID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="cbInvoiceState" Name="InvState" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
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
    </div>
</asp:Content>

