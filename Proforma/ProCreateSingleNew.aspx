<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" 
    CodeFile="ProCreateSingleNew.aspx.vb" Inherits="Proforma_ProCreateSingleNew" 
	MaintainScrollPositionOnPostback="true"
    enableEventValidation="false" %>

<%@ Register src="~/App_UserControls/TourOpExpanderControl.ascx" tagname="TourOpExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/HotelExpanderControl.ascx" tagname="HotelExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/FromToDateControl.ascx" tagname="FromToDateControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/InputDateControl.ascx" tagname="InputDateControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/ProcessingProgressControl.ascx" tagname="ProcessingProgressControl" tagprefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    New Single Proforma(s)
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" Runat="Server">
    <div class="Red">
        <asp:UpdatePanel ID="UpdatePanelMain" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table cellpadding="0" cellspacing="0" >
                    <tr>
                        <td>
                            <asp:Panel ID="pnlPfc" runat="server" Width="630px" >
                                <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                    <tr>
                                        <td class="GridLabelBG" colspan="3">
                                            <asp:Label ID="Label30" runat="server" SkinID="skGridLabel" Text="New Single Proforma" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 30px;" rowspan="7">&nbsp;</td>
                                        <td class="GridRow1B" colspan="2" style="width: 600px;" >
                                            <uc:TourOpExpanderControl ID="ctrlTourOp" runat="server" 
                                                LabelWidth="120px" ControlWidth="480px" 
                                                Mandatory="false"
                                                FixKind="DefaultSingle"
                                                NoLocal="true" />
                                        </td>
                                    </tr>
                                    <tr>
                                       <td class="GridRow1B" colspan="2" style="width: 600px;" >
                                            <uc:HotelExpanderControl ID="ctrlHotel" runat="server" 
                                                LabelWidth="120px" ControlWidth="480px"
                                                Mandatory="false"
                                                NoCCI="true" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="GridRow1B" style="width: 120px;" >Check In</td>
                                        <td class="GridRow1B" style="width: 480px;" >
                                            <uc:FromToDateControl ID="ctrlCheckIn" runat="server"
                                                MandatoryFrom="true"
                                                MandatoryTo="true" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="GridRow1B" style="width: 120px;" >Check Out</td>
                                        <td class="GridRow1B" style="width: 480px;" >
                                            <uc:FromToDateControl ID="ctrlCheckOut" runat="server"
                                                MandatoryFrom="false"
                                                MandatoryTo="false" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 120px;" class="GridRow1B">Booking Date</td>
                                        <td style="width: 480px;" class="GridRow1B">
                                            <uc:InputDateControl ID="ctrlBkDate" runat="server" Mandatory="false" DefaultNow="false" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 120px;" class="GridRowClear">Booking Number</td>
                                        <td style="width: 480px;" class="GridRowClear">
                                            <asp:TextBox ID="txtBkNumber" runat="server" CssClass="TextBox"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="GridRow2T" style="margin-top: 2px; padding-top: 5px; text-align: left;">
                                            &nbsp;
                                        </td>
                                        <td class="GridRow2T" style="margin-top: 2px; padding-top: 5px; text-align: right;">
                                            <asp:CheckBox ID="cbIncludeCancelled" runat="server" Checked="true" TextAlign="Left" Text="Include Cancelled" />&nbsp;&nbsp;
                                            <asp:Button ID="btnCheck" runat="server" SkinID="skBtnBase" Text="Check" />&nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <asp:Panel ID="pnlError" runat="server" style="margin-left: 30px; padding: 10px 10px 10px 10px; width: 700px; height: 40px;" CssClass="WaterMark" Visible="false">
                                <asp:Label ID="lblError" runat="server" Text="This is Create validation message"  />
                            </asp:Panel>
                        </td>
                    </tr>
                    <asp:Panel ID="pnlDetail" runat="server" Visible="False">
                        <tr><td>&nbsp;</td></tr>
                        <tr>
                            <td class="GridLabelBG">
                                <asp:Label ID="lblReservations" runat="server" Text="Available reservations" CssClass="GridLabel" Height="26px" />
                            </td>
                        </tr>
                        <tr>
                            <td >
                                <asp:DataList  ID="dlMulti" runat="server" class="GridBorder" >
                                    <HeaderTemplate>
                                    <table cellpadding="0" cellspacing="0" style="border-collapse: collapse;">
                                        <tr>
                                            <td class="InvHead" style="width: 30px;"></td>
                                            <td class="InvHead" style="width: 120px;">Folio Full</td>
                                            <td class="InvHead" style="width: 60px;">Room</td>
                                            <td class="InvHead" style="width: 80px;">Bk.Voucher</td>
                                            <td class="InvHead" style="width: 80px;">Bk.Date</td>
                                            <td class="InvHead" style="width: 180px;">Guest</td>
                                            <td class="InvHead" style="width: 80px;">Arrival</td>
                                            <td class="InvHead" style="width: 80px;">Departure</td>
                                            <td class="InvHead" style="width: 80px;">Modified</td>
                                            <td class="InvHead" style="width: 80px;">Imported</td>
                                            <td class="InvHead" style="width: 80px;">State</td>
                                        </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Panel ID="pnlHotel" runat="server">
                                        <tr>
                                            <td colspan="11" style="height: 5px;"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="11" class="WaterMark InvRow">
                                                <asp:HiddenField ID="hfTourOpID" runat="server" Value='<%# Eval("TourOpId") %>' />
                                                <asp:HiddenField ID="hfHotelID" runat="server" Value='<%# Eval("HotelId") %>' />
                                                <asp:HiddenField ID="hfCheckIn" runat="server" Value='<%# Eval("CheckIn") %>' />
                                                <asp:HiddenField ID="hfClosed" runat="server" Value='<%# Eval("Closed") %>' />
                                                <asp:HiddenField ID="hfActive" runat="server" Value='<%# Eval("Active") %>' />
                                                <asp:HiddenField ID="hfFree" runat="server" Value='<%# Eval("Free") %>' />
                                                <asp:HiddenField ID="hfSource" runat="server" Value='<%# Eval("Source") %>' />
                                                <b><asp:Label ID="mtTourOp" runat="server" Text='<%# Eval("TourOp") %>' /></b><br />
                                                <span style="padding-left: 30px; border-top: solid 1px;"><b><asp:Label ID="mtHotel" runat="server" Text='<%# Eval("Hotel") %>' /></b></span>
                                            </td>
                                        </tr>
                                        </asp:Panel>
                                        <tr>
                                            <td class="WaterMark InvRow" style="font-weight: normal; width: 30px;">&nbsp</td>
                                            <td colspan="10" class="InvRow" style="font-style: normal;">
                                                <asp:Label ID="mtCheckIn" runat="server" Text='<%# "CheckIn: " & Eval("CheckIn", "{0:d}") %>'
                                                    Font-Bold="true" CssClass="Blue" style="margin: 4px 4px 4px 0px; float: left;"  />
                                                <asp:LinkButton ID="btCreateSingle" runat="server" Text='<%# "Create " & Eval("Source") & " >>" %>'
                                                    style="margin: 4px; float: left;" CommandName="CreateSingle" 
                                                    Visible='<%# Eval("Free") > 0 %>'
                                                    CommandArgument='<%# Eval("TourOpId") & ";" & Eval("HotelId") & ";" & Eval("CheckIn", "{0:d}")& ";" & Eval("Source") %>' />
                                                <asp:Label ID="lblExists" runat="server" Visible='<%# Eval("Active") > 0 %>' 
                                                    style="margin: 4px; float: left;" 
                                                    Text="There is not reviewed proforma for this check in" />
                                                <asp:Label ID="Label8" runat="server" Visible='<%# Eval("Closed") > 0 %>' 
                                                    style="margin: 4px; float: left;" 
                                                    Text="There are reviewed/delivered proformas for this check in" />
                                                <asp:HyperLink runat="server" ID="lnkProforma" Visible="false" style="margin: 4px; float: left;"  />
                                            </td>
                                        </tr>
                                        <asp:DataList  ID="dlRes" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" >
                                            <ItemTemplate>
                                                <tr>
                                                    <td class="WaterMark InvRow" style="font-weight: normal; width: 30px;">
                                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Error.gif" 
                                                            Visible='<%# Eval("ProState") <> "Free" %>' 
                                                            ToolTip="Alreay on proforma"
                                                            style="float: right; margin-right: 3px;" Height="12px" />
                                                    </td>
                                                    <td class="InvRow" style="font-weight: normal; width: 120px;">
                                                        <asp:Label ID="Label18" runat="server" Text='<%# Eval("FolioFull") %>' />
                                                    </td>
                                                    <td class="InvRow" style="font-weight: normal; width: 60px;">
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("RoomTypeId") %>' />
                                                    </td>
                                                    <td class="InvRow" style="font-weight: normal; width: 80px;">
                                                        <asp:Label ID="Label20" runat="server" Text='<%# Eval("BkNumber") %>' />
                                                    </td>
                                                    <td class="InvRow" style="font-weight: normal; width: 80px;">
                                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("BkDate", "{0:d}") %>' />
                                                    </td>
                                                    <td class="InvRow" style="font-weight: normal; width: 180px;">
                                                        <asp:Label ID="Label19" runat="server" Text='<%# Eval("PreInvText") %>' />
                                                    </td>
                                                    <td class="InvRow" style="font-weight: normal; width: 80px;">
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("CheckIn", "{0:d}") %>' />
                                                    </td>
                                                    <td class="InvRow" style="font-weight: normal; width: 80px;">
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("CheckOut", "{0:d}") %>' />
                                                    </td>
                                                    <td class="InvRow" style="font-weight: normal; width: 80px;">
                                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Modified", "{0:d}") %>' />
                                                    </td>
                                                    <td class="InvRow" style="font-weight: normal; width: 80px;">
                                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Imported", "{0:d}") %>' />
                                                    </td>
                                                    <td class="InvRow" style="font-weight: normal; width: 80px;">
                                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("InHouseStateText") %>' />
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:DataList >
                                        <tr>
                                            <td colspan="11" class="WaterMark">
                                                <asp:Label ID="lblAready" runat="server" Visible="false" style="margin-left: 35px; padding-bottom: 5px;"
                                                    Text="One or more reservations are already preinvoiced!" />
                                            </td>
                                        </tr>

                                    </ItemTemplate>
                                    <FooterTemplate>
                                    </table>
                                    </FooterTemplate>
                                </asp:DataList>
                            </td>
                        </tr>
                        <tr>
                            <td style="margin-top: 2px; padding-top: 5px; text-align: right;">
                                <asp:Button ID="btnCreate" runat="server" SkinID="skBtnBase" Text="Create All" Width="70px" />&nbsp;
                            </td>
                        </tr>
                    </asp:Panel>

                </table>
                <uc:ProcessingProgressControl ID="upProcessing" runat="server"  />
                <%--
                <asp:UpdateProgress ID="upProcessing" runat="server">
                    <ProgressTemplate>
                        <div id="Div1" runat="server"
                            style="z-index: 100; 
                                   position: fixed;
                                   top: 50%; left: 50%;
                                   transform: translate(-50%, -50%);
                                   -webkit-transform: translate(-50%, -50%);
                                   -moz-transform: translate(-50%, -50%);
                                   -o-transform: translate(-50%, -50%);
                                   -ms-transform: translate(-50%, -50%);
                                   text-align: center;
                                   width: 90%; height: 50px; padding-top: 20px;
                                   border: dotted 1px; border-radius: 10px; 
                                   background: White; filter: alpha(opacity=20); 
                                   -moz-opacity:.8; opacity:.8;">
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/status_anim.gif" />
                            <b>Processing...</b>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                --%>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="dlMulti" />
                <asp:PostBackTrigger ControlID="btnCheck" />
                <asp:PostBackTrigger ControlID="btnCreate" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
</asp:Content>

