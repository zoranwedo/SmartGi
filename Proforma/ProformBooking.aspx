<%@ Page Language="VB" CodeFile="ProformBooking.aspx.vb" Inherits="Proforma_ProformBooking"
    AutoEventWireup="false" enableEventValidation="false" %>
    
<%@ Register src="~/App_UserControls/MessagePop.ascx" tagname="MessagePop" tagprefix="uc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Proforma Booking</title>
</head>
<body>
    <form id="form_booking" runat="server">
    <asp:ToolkitScriptManager ID="tkScriptManager" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true" />

    <script language="javascript" type="text/javascript">
        function cancel() {
            window.parent.document.getElementById('dummyBookingCancel').click();
        }
        function okay() {
            window.parent.document.getElementById('dummyBookingOK').click();
        }

        function ShowSplitModal(BookingID) {
            var frame = $get('IframeSplit');
            var popup = $find('SplitModalPopup');
            frame.src = "ProFormStaySplit.aspx?BookingID=" + BookingID;
            popup._backgroundElement.onclick = function() { document.getElementById("dumySplitClose").click(); }
            popup.show();
        }
        function SplitUpdated() {
            document.getElementById('<%=dumyRefresh.ClientID%>').click();
        }
    </script>

    <asp:Button ID="dumyRefresh" runat="server" Style="display: none;" />

    <div class="Blue" style="background-color: Transparent; vertical-align: top;" >
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
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG" >
                    <asp:Label ID="lblTitle" runat="server" SkinID="skGridLabel" Text="Proforma Detail" />
                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CssClass="InvButton" 
                        ImageUrl="~/Images/cancel_big.gif" OnClientClick="okay();" 
                        style="float: right; background: white; border-radius: 10px; margin: 3px;" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder" style="background-color: White;">
                    <asp:UpdatePanel ID="upBooking" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                    <asp:FormView ID="fvBooking" runat="server" DataKeyNames="GuestName, InHouseState, Penalty" DataSourceID="dsBooking">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0" style="border-collapse: collapse; border: solid 1px;">
                                <tr>
                                    <td class="PreRowHeadSel" style="width: 60px;">
                                        <asp:Label ID="Label14" runat="server" Text='<%# Eval("HotelCode") %>' />
                                    </td>
                                    <td class="PreRowHeadSel" colspan="2" style="width: 180px;">
                                        <asp:Label ID="FolioFullLabel" runat="server" Text='<%# Eval("FolioFull") %>' />
                                        <asp:Label ID="Label5" runat="server" style="color: Red; border-radius: 4px; font-style: italic; float: left;"
                                            Text='<%# SourcePMS %>' />
                                    </td>
                                    <td class="PreRowHeadSel" colspan="6" style="text-align: left; vertical-align: middle; padding: 2px 2px 0px 2px;">
                                        <asp:LinkButton ID="lbGuestName" runat="server"  Text='<%# Eval("GuestName") %>' />
                                        <asp:Label ID="ibBookingInfo" runat="server" Style="float: right;" ToolTip="Booking info">
                                            <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/infoIcon.gif" />
                                        </asp:Label>
                                        
                                        <asp:HiddenField ID="hfPreinvoiceId" runat="server" Value='<%# Eval("BookingId") %>' />
                                        <!-- Rooming List -->
                                        <asp:PopupControlExtender ID="infoRoomEx" runat="server"
                                            TargetControlID="lbGuestName"
                                            PopupControlID="infoRoomDiv"
                                            Position="Bottom" OffsetX="-3" OffsetY="-17" />
                                        <asp:Panel id="infoRoomDiv" runat="server" Style="display: none; border-top: none;" CssClass="PreRowHeadSel" >
                                            <asp:ObjectDataSource ID="dsRooming" runat="server" OldValuesParameterFormatString="original_{0}"
                                                TypeName="dsProformaTableAdapters.BookingRoomingTableAdapter"
                                                SelectMethod="GetData" >
                                                <SelectParameters>
                                                    <asp:QueryStringParameter Name="BookingID" Type="Int32" QueryStringField="BookingID" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                            <asp:DataList ID="dlRooming" runat="server" DataKeyField="BookingID" DataSourceID="dsRooming">
                                                <ItemTemplate>
                                                    <table cellpadding="0" cellspacing="0" style="border: none; border-collapse: collapse;">
                                                        <tr>
                                                            <td style="text-align: left; vertical-align: middle; padding: 2px 2px 0px 2px; width: 374px;">
                                                                <asp:Label ID="lblgName" runat="server" Text='<%# Eval("genericName") %>' Font-Bold="true" />
                                                                <asp:Label ID="lblgType" runat="server" Style="float: right;" Text='<%# Eval("CHILD-TYPE") %>'/>
                                                            </td>
                                                        </tr>
                                                    </table> 
                                                </ItemTemplate>
                                            </asp:DataList>
                                        </asp:Panel>
                                        <!-- /Rooming List -->

                                        <!-- Booking Info -->
                                        <asp:PopupControlExtender ID="infoBookEx" runat="server"
                                            TargetControlID="ibBookingInfo"
                                            PopupControlID="infoBookDiv"
                                            Position="Bottom"
                                            OffsetX="-440" />
                                        <asp:Panel id="infoBookDiv" runat="server" Style="display: none; background-color: White;" CssClass="GridBorderThin" >
                                            <asp:ObjectDataSource ID="dsPInfo" runat="server" 
                                                TypeName="dsProformaTableAdapters.BookingInfoTableAdapter" 
                                                SelectMethod="GetData" >
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="hfPreinvoiceId" Name="BookingID" PropertyName="Value" Type="Int32" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                            <asp:FormView ID="fvPInfo" runat="server" DataSourceID="dsPInfo" Width="100%" >
                                                <RowStyle CssClass="GridRowClear" Font-Size="Small" />
                                                <ItemTemplate>
                                                    <table cellpadding="0" cellspacing="0" style="border: solid 1px;">
                                                        <tr>
                                                            <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px; font-weight: normal; width: 80px;">
                                                                <i>Reservation:</i>
                                                            </td>
                                                            <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px; width: 190px;">
                                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("FolioFull") %>' Font-Bold="true" />
                                                            </td>
                                                            <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px; font-weight: normal; width: 80px;">
                                                                <i>Preinvoice:</i>
                                                            </td>
                                                            <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px; width: 190px;">
                                                                <asp:Label ID="Label18" runat="server" Text='<%# Eval("BookingID") %>' Font-Bold="true" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px; font-weight: normal;">
                                                                <i>Imported:</i>
                                                            </td>
                                                            <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px;">
                                                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("ImportDate") %>' Font-Bold="true" />
                                                            </td>
                                                            <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px; font-weight: normal;">
                                                                <i>Created:</i>
                                                            </td>
                                                            <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px;">
                                                                <asp:Label ID="Label24" runat="server" Text='<%# Eval("DateCreated") %>' Font-Bold="true" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px; font-weight: normal;">
                                                                <i>Last update:</i>
                                                            </td>
                                                            <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px;" colspan="3">
                                                                <asp:Label ID="Label25" runat="server" Text='<%# Eval("DateModified") %>' Font-Bold="true" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px; text-align: center;" colspan="4">
                                                                <asp:Label ID="Label29" runat="server" Text='<%# Eval("FileID","({0})") %>' Font-Bold="true" />
                                                                <asp:Label ID="Label31" runat="server" Text='<%# Eval("fileExpected") %>' Font-Bold="true" />
                                                            </td>
                                                        </tr>
                                                    </table> 
                                                </ItemTemplate>
                                            </asp:FormView>
                                        </asp:Panel>
                                        <!-- /Booking Info -->
                                        
                                    </td>
                                    <td class="PreRowHeadSel" colspan="1" style="width: 140px; text-align: right;">
                                        <asp:Label ID="InvResCAmountLabel" runat="server" Text='<%# Eval("InvResAmount","{0:N2}") %>' ToolTip='<%# Eval("BookingId") %>' />
                                        <%--<asp:Label ID="Label5" runat="server" Text='<%# SourcePMS %>' style="float: left;" />--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="PreRowHead" colspan="2" style="width: 120px;">
                                        Bk.Number
                                    </td>
                                    <td class="PreRowHead" colspan="1" style="width: 120px;">
                                        Bk.Date
                                    </td>
                                    <td class="PreRowHead" colspan="2" style="width: 120px;">
                                        Check In
                                    </td>
                                    <td class="PreRowHead" colspan="2" style="width: 120px;">
                                        Check Out
                                    </td>
                                    <td class="PreRowHead" colspan="2" style="width: 120px; border-right: solid 1px;">
                                        Nights
                                    </td>
                                    <td class="PreRowHead" colspan="1" rowspan="5" style="width: 140px; vertical-align: top;
                                        border-bottom: solid 1px;">
                                        <table style="border-collapse: collapse; border: none; width: 100%; margin: 5px;">
                                            <tr>
                                                <td style="width: 30%; vertical-align: middle; text-align: right; padding-right: 5px;">
                                                    <asp:Image ID="imgState" runat="server" Height="16px" Width="16px" ImageUrl='<%# BookingStateIcon(Eval("InHouseState")) %>' />
                                                </td>
                                                <td style="width: 70%; vertical-align: middle; text-align: left; font-style: italic;">
                                                    <asp:Label ID="lblState" runat="server" Text='<%# BookingState(Eval("InHouseState")) %>' />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="PreRow" colspan="2" style="text-align: center;">
                                        <asp:Label ID="BkNumberLabel" runat="server" Text='<%# Eval("BkNumber") %>' />
                                    </td>
                                    <td class="PreRow" style="text-align: center;">
                                        <asp:Label ID="BkDateLabel" runat="server" Text='<%# Eval("BkDate","{0:d}") %>' />
                                    </td>
                                    <td class="PreRow" colspan="2" style="text-align: center;">
                                        <asp:Label ID="CheckInLabel" runat="server" Text='<%# Eval("CheckIn","{0:d}") %>' />
                                    </td>
                                    <td class="PreRow" colspan="2" style="text-align: center;">
                                        <asp:Label ID="CheckOutLabel" runat="server" Text='<%# Eval("CheckOut","{0:d}") %>' />
                                    </td>
                                    <td class="PreRow" colspan="2" style="text-align: center; border-right: solid 1px;">
                                        <asp:Label ID="StayNightsLabel" runat="server" Text='<%# Eval("StayNights") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="PreRowHead" colspan="2">
                                        Meal Plan
                                    </td>
                                    <td class="PreRowHead" colspan="1">
                                        Room
                                    </td>
                                    <td class="PreRowHead" colspan="1" style="width: 60px;">
                                        &#160;&nbsp;
                                    </td>
                                    <td class="PreRowHead" colspan="1" style="width: 60px;">
                                        Ad
                                    </td>
                                    <td class="PreRowHead" colspan="1" style="width: 60px;">
                                        Inf
                                    </td>
                                    <td class="PreRowHead" colspan="1" style="width: 60px;">
                                        Ch
                                    </td>
                                    <td class="PreRowHead" colspan="1" style="width: 60px;">
                                        Jun
                                    </td>
                                    <td class="PreRowHead" colspan="1" style="width: 60px; border-right: solid 1px;">
                                        Jun2
                                    </td>
                                </tr>
                                <tr>
                                    <td class="PreRow" colspan="2" rowspan="2" style="text-align: center;">
                                        <asp:Label ID="MealPlanIdLabel" runat="server" Text='<%# Eval("MealPlanId") %>' />
                                    </td>
                                    <td class="PreRow" rowspan="2" style="text-align: center;">
                                        <asp:Label ID="RoomTypeIdLabel" runat="server" Text='<%# Eval("RoomTypeId") %>' />
                                    </td>
                                    <td class="PreRow" style="font-style: italic; font-weight: bold;">
                                        Pax
                                    </td>
                                    <td class="PreRow">
                                        <asp:Label ID="AdultLabel" runat="server" Text='<%# Eval("Adult") %>' />
                                    </td>
                                    <td class="PreRow">
                                        <asp:Label ID="InfantLabel" runat="server" Text='<%# Eval("Infant") %>' />
                                    </td>
                                    <td class="PreRow">
                                        <asp:Label ID="ChildLabel" runat="server" Text='<%# Eval("Child") %>' />
                                    </td>
                                    <td class="PreRow">
                                        <asp:Label ID="JuniorLabel" runat="server" Text='<%# Eval("Junior") %>' />
                                    </td>
                                    <td class="PreRow">
                                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("Junior2") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="PreRow" style="font-style: italic; font-weight: bold;">
                                        Comp.
                                    </td>
                                    <td class="PreRow">
                                        <asp:Label ID="CompAdultLabel" runat="server" Text='<%# Eval("CompAdult") %>' />
                                    </td>
                                    <td class="PreRow" colspan="2">
                                        <asp:Label ID="CompChildLabel" runat="server" Text='<%# Eval("CompChild") %>' />
                                    </td>
                                    <td class="PreRow" colspan="2" style="text-align: center;">
                                        <asp:Label ID="CompJuniorLabel" runat="server" Text='<%# Eval("CompJunior") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear" colspan="9" rowspan="1" style="border: solid 1px; text-align: left; vertical-align: middle;">
                                        <asp:FormView ID="fvPenalty" runat="server" DataKeyNames="BookingID" DataSourceID="dsBooking"
                                            OnItemCommand="fvPenalty_ItemCommand">
                                            <ItemTemplate>
                                                <table cellpadding="5px" cellspacing="0" style="border: none; border-collapse: collapse;">
                                                    <tr>
                                                        <td style="width: 114px; border-right: solid 1px; text-align: right;">
                                                            <asp:LinkButton ID="lbPenalty" runat="server" OnClick="lbPenalty_Click" 
                                                                Enabled='<%# Not (IsDefinitive OR IsCancelled OR IsSX) %>'
                                                                CommandArgument='<%# Eval("BookingID") & ";" & Eval("Penalty") %>'
                                                                OnClientClick='<%# PenaltyChangeText(Eval("Penalty")) %>' 
                                                                Text="Penalize" />
                                                            <asp:ImageButton ID="ibPenalty" runat="server" OnClick="ibPenalty_Click" 
                                                                Enabled='<%# Not (IsDefinitive OR IsCancelled OR IsSX) %>'
                                                                CommandArgument='<%# Eval("BookingID") & ";" & Eval("Penalty") %>'
                                                                OnClientClick='<%# PenaltyChangeText(Eval("Penalty")) %>' 
                                                                ImageUrl='<%# PenaltyStateIcon(Eval("Penalty")) %>'
                                                                CssClass="InvButton" />
                                                        </td>
                                                        <td style="width: 430px;">
                                                            <asp:Label ID="PenaltyConceptLabel" runat="server" Text='<%# Eval("PenaltyConcept") %>' Visible='<%# Eval("Penalty") %>' />
                                                        </td>
                                                        <td style="width: 50px;">
                                                            <asp:ImageButton ID="ibEdit" runat="server" CausesValidation="False" CssClass="InvButton"
                                                                ImageUrl="~/Images/edit_inline.gif" CommandName="Edit" 
                                                                Visible='<%# Eval("Penalty") AND  Not (IsDefinitive OR IsCancelled OR IsSX) %>' />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <table cellpadding="5px" cellspacing="0" style="border: none;">
                                                    <tr>
                                                        <td style="width: 114px; border-right: solid 1px; text-align: right;">
                                                            <asp:LinkButton ID="lbPenalty" runat="server" Text="Penalize" Enabled="false" />
                                                            <asp:ImageButton ID="ibPenalty" runat="server" ImageUrl='<%# PenaltyStateIcon(Eval("Penalty")) %>'
                                                                CssClass="InvButton" Enabled="false" />
                                                        </td>
                                                        <td style="width: 430px;">
                                                            <asp:TextBox ID="txtPenaltyConcept" runat="server" CssClass="TextBox" Text='<%# Bind("PenaltyConcept") %>' />
                                                        </td>
                                                        <td style="width: 50px;">
                                                            <asp:ImageButton ID="ibEditUpdate" runat="server" CausesValidation="False" CommandName="PenUpdate"
                                                                CssClass="InvButton" ImageUrl="~/Images/accept_inline.gif" CommandArgument='<%# Eval("BookingID") %>' />
                                                            <asp:ImageButton ID="ibEditCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                                                CssClass="InvButton" ImageUrl="~/Images/decline_inline.gif" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </EditItemTemplate>
                                        </asp:FormView>
                                    </td>
                                    <td class="GridRowClear" colspan="1" rowspan="1" style="border: none; text-align: right; padding: 5px;">
                                        <asp:Button ID="btnEdit" runat="server" SkinID="skBtnBase" Text="Edit" CommandName="Edit"
                                            Visible='<%# Not (IsDefinitive OR IsCancelled OR IsSX) %>' />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <table cellpadding="0" cellspacing="0" style="border-collapse: collapse; border: solid 1px;">
                                <tr>
                                    <td class="PreRowHeadSel" style="width: 60px;">
                                        <asp:Label ID="Label14" runat="server" Text='<%# Eval("HotelCode") %>' />
                                    </td>
                                    <td class="PreRowHeadSel" colspan="2" style="width: 180px;">
                                        <asp:Label ID="FolioFullLabel" runat="server" Text='<%# Eval("FolioFull") %>' />
                                    </td>
                                    <td class="PreRowHeadSel" colspan="6" style="text-align: left; vertical-align: middle; padding: 2px 2px 0px 2px;">
                                        <asp:TextBox ID="txtGuestName" runat="server" Width="370px" CssClass="TextBox" Text='<%# Bind("GuestName") %>' />
                                        <asp:RequiredFieldValidator ID="req_txtGuestName" runat="server" Display="None" ErrorMessage="Required Field" 
                                            ControlToValidate="txtGuestName" />
                                        <asp:ValidatorCalloutExtender runat="server" ID="ext_req_txtGuestName" TargetControlID="req_txtGuestName" />
                                    </td>
                                    <td class="PreRowHeadSel" colspan="1" style="width: 140px; text-align: right;">
                                        <asp:Label ID="InvResCAmountLabel" runat="server" Text='<%# Eval("InvResAmount","{0:N2}") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="PreRowHead" colspan="2" style="width: 120px;">
                                        Bk.Number
                                    </td>
                                    <td class="PreRowHead" colspan="1" style="width: 120px;">
                                        Bk.Date
                                    </td>
                                    <td class="PreRowHead" colspan="2" style="width: 120px;">
                                        Check In
                                    </td>
                                    <td class="PreRowHead" colspan="2" style="width: 120px;">
                                        Check Out
                                    </td>
                                    <td class="PreRowHead" colspan="2" style="width: 120px; border-right: solid 1px;">
                                        Nights
                                    </td>
                                    <td class="PreRowHead" colspan="1" rowspan="5" style="width: 140px; vertical-align: top;
                                        border-bottom: solid 1px;">
                                        <table style="border-collapse: collapse; border: none; width: 100%; margin: 5px;">
                                            <tr>
                                                <td style="width: 30%; vertical-align: middle; text-align: right; padding-right: 5px;">
                                                    <asp:Image ID="imgState" runat="server" Height="16px" Width="16px" ImageUrl='<%# BookingStateIcon(Eval("InHouseState")) %>' />
                                                </td>
                                                <td style="width: 70%; vertical-align: middle; text-align: left; font-style: italic;">
                                                    <asp:Label ID="lblState" runat="server" Text='<%# BookingState(Eval("InHouseState")) %>' />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="PreRow" colspan="2" style="text-align: center;">
                                        <asp:TextBox ID="txtBkNumber" runat="server" Width="100px" CssClass="TextBox" Text='<%# Bind("BkNumber") %>' />
                                    </td>
                                    <td class="PreRow" style="text-align: center;">
                                        <asp:TextBox ID="txtBkDate" runat="server" Width="100px" CssClass="TextBox" Text='<%# Bind("BkDate","{0:d}") %>' />
                                        <asp:CalendarExtender ID="cal_txtBkDate" runat="server" CssClass="cal_Theme1" TargetControlID="txtBkDate" />
                                        <asp:CompareValidator ID="cmp_txtBkDate" runat="server" Display="None" Operator="DataTypeCheck"
                                            ControlToValidate="txtBkDate" Type="Date" ErrorMessage="Please enter a valid date" />
                                        <asp:ValidatorCalloutExtender runat="server" ID="exp_cmp_txtBkDate" TargetControlID="cmp_txtBkDate" />
                                    </td>
                                    <td class="PreRow" colspan="2" style="text-align: center;">
                                        <asp:TextBox ID="txtCheckIn" runat="server" Width="100px" CssClass="TextBox" Text='<%# Bind("CheckIn","{0:d}") %>' 
                                             Enabled='<%# Eval("ResGroup") IsNot DbNull.Value %>'/>
                                        <asp:CalendarExtender ID="cal_txtCheckIn" runat="server" CssClass="cal_Theme1" TargetControlID="txtCheckIn" />
                                        <asp:RequiredFieldValidator ID="req_txtCheckIn" runat="server" Display="None" ErrorMessage="Required Field" 
                                            ControlToValidate="txtCheckIn" />
                                        <asp:ValidatorCalloutExtender runat="server" ID="ext_req_txtCheckIn" TargetControlID="req_txtCheckIn" />
                                        <asp:CompareValidator ID="cmp_txtCheckIn" runat="server" Display="None" Operator="DataTypeCheck"
                                            ControlToValidate="txtCheckIn" Type="Date" ErrorMessage="Please enter a valid date" />
                                        <asp:ValidatorCalloutExtender runat="server" ID="ext_cmp_txtCheckIn" TargetControlID="cmp_txtCheckIn" />
                                    </td>
                                    <td class="PreRow" colspan="2" style="text-align: center;">
                                        <asp:TextBox ID="txtCheckOut" runat="server" Width="100px" CssClass="TextBox" Text='<%# Bind("CheckOut","{0:d}") %>' />
                                        <asp:CalendarExtender ID="cal_txtCheckOut" runat="server" CssClass="cal_Theme1" TargetControlID="txtCheckOut" />
                                        <asp:RequiredFieldValidator ID="req_txtCheckOut" runat="server" Display="None" ErrorMessage="Required Field" 
                                            ControlToValidate="txtCheckOut"  />
                                        <asp:ValidatorCalloutExtender runat="server" ID="ext_req_txtCheckOut" TargetControlID="req_txtCheckOut" />
                                        <asp:CompareValidator ID="cmp_txtCheckOut" runat="server" Display="None" Operator="DataTypeCheck"
                                            ControlToValidate="txtCheckOut" Type="Date" ErrorMessage="Please enter a valid date" />
                                        <asp:ValidatorCalloutExtender runat="server" ID="exp_cmp_txtCheckOut" TargetControlID="cmp_txtCheckOut" />
                                    </td>
                                    <td class="PreRow" colspan="2" style="text-align: center; border-right: solid 1px;">
                                        <asp:Label ID="StayNightsLabel" runat="server" Text='<%# Eval("StayNights") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="PreRowHead" colspan="2">
                                        Meal Plan
                                    </td>
                                    <td class="PreRowHead" colspan="1">
                                        Room
                                    </td>
                                    <td class="PreRowHead" colspan="1" style="width: 60px;">
                                        &#160;&nbsp;
                                    </td>
                                    <td class="PreRowHead" colspan="1" style="width: 60px;">
                                        Ad
                                    </td>
                                    <td class="PreRowHead" colspan="1" style="width: 60px;">
                                        Inf
                                    </td>
                                    <td class="PreRowHead" colspan="1" style="width: 60px;">
                                        Ch
                                    </td>
                                    <td class="PreRowHead" colspan="1" style="width: 60px;">
                                        Jun
                                    </td>
                                    <td class="PreRowHead" colspan="1" style="width: 60px; border-right: solid 1px;">
                                        Jun2
                                    </td>
                                </tr>
                                <tr>
                                    <td class="PreRow" colspan="2" rowspan="2" style="text-align: center;">
                                        <asp:Label ID="MealPlanIdLabel" runat="server" Text='<%# Eval("MealPlanId") %>' />
                                    </td>
                                    <td class="PreRow" rowspan="2" style="text-align: center;">
                                        <asp:HiddenField ID="hfHotelID" runat="server" Value='<%# Eval("HotelID") %>' />
                                        <asp:DropDownList ID="ddlRoomTypeID" runat="server" CssClass="TextBox" DataSourceID="dsHtlRooms"
                                            DataTextField="RoomTypeID" DataValueField="RoomTypeID" SelectedValue='<%# Bind("RoomTypeId") %>' />
                                        <asp:ObjectDataSource runat="server" ID="dsHtlRooms" SelectMethod="GetData" 
                                            TypeName="dsProformaTableAdapters.HotelRoomTypeTableAdapter" >
                                            <SelectParameters>
                                                <asp:ControlParameter Name="HotelID" ControlID="hfHotelID" PropertyName="Value" Type="Int32" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                    <td class="PreRow" style="font-style: italic; font-weight: bold;">
                                        Pax
                                    </td>
                                    <td class="PreRow" style="text-align: center;">
                                        <asp:TextBox ID="txtAdult" runat="server" Width="40" CssClass="TextBox" Text='<%# Bind("Adult") %>' />
                                        <asp:RequiredFieldValidator ID="req_txtAdult" runat="server" Display="None" ErrorMessage="Required Field" 
                                            ControlToValidate="txtAdult"  />
                                        <asp:ValidatorCalloutExtender runat="server" ID="ext_req_txtAdult" TargetControlID="req_txtAdult" />
                                        <asp:CompareValidator ID="cmp_txtAdult" runat="server" Display="None" Operator="DataTypeCheck"
                                            ControlToValidate="txtAdult" Type="Integer" ErrorMessage="Please enter a valid number" />
                                        <asp:ValidatorCalloutExtender runat="server" ID="exp_cmp_txtAdult" TargetControlID="cmp_txtAdult" />
                                        
                                    </td>
                                    <td class="PreRow" style="text-align: center;">
                                        <asp:TextBox ID="txtInfant" runat="server" Width="40" CssClass="TextBox" Text='<%# Bind("Infant") %>' />
                                        <asp:RequiredFieldValidator ID="req_txtInfant" runat="server" Display="None" ErrorMessage="Required Field" 
                                            ControlToValidate="txtInfant"  />
                                        <asp:ValidatorCalloutExtender runat="server" ID="ext_req_txtInfant" TargetControlID="req_txtInfant" />
                                        <asp:CompareValidator ID="cmp_txtInfant" runat="server" Display="None" Operator="DataTypeCheck"
                                            ControlToValidate="txtInfant" Type="Integer" ErrorMessage="Please enter a valid number" />
                                        <asp:ValidatorCalloutExtender runat="server" ID="exp_cmp_txtInfant" TargetControlID="cmp_txtInfant" />
                                        
                                    </td>
                                    <td class="PreRow" style="text-align: center;">
                                        <asp:TextBox ID="txtChild" runat="server" Width="40" CssClass="TextBox" Text='<%# Bind("Child") %>' />
                                        <asp:RequiredFieldValidator ID="req_txtChild" runat="server" Display="None" ErrorMessage="Required Field" 
                                            ControlToValidate="txtChild"  />
                                        <asp:ValidatorCalloutExtender runat="server" ID="ext_req_txtChild" TargetControlID="req_txtChild" />
                                        <asp:CompareValidator ID="cmp_txtChild" runat="server" Display="None" Operator="DataTypeCheck"
                                            ControlToValidate="txtChild" Type="Integer" ErrorMessage="Please enter a valid number" />
                                        <asp:ValidatorCalloutExtender runat="server" ID="exp_cmp_txtChild" TargetControlID="cmp_txtChild" />
                                        
                                    </td>
                                    <td class="PreRow" style="text-align: center;">
                                        <asp:TextBox ID="txtJunior" runat="server" Width="40" CssClass="TextBox" Text='<%# Bind("Junior") %>' />
                                        <asp:RequiredFieldValidator ID="req_txtJunior" runat="server" Display="None" ErrorMessage="Required Field" 
                                            ControlToValidate="txtJunior"  />
                                        <asp:ValidatorCalloutExtender runat="server" ID="ext_req_txtJunior" TargetControlID="req_txtJunior" />
                                        <asp:CompareValidator ID="cmp_txtJunior" runat="server" Display="None" Operator="DataTypeCheck"
                                            ControlToValidate="txtJunior" Type="Integer" ErrorMessage="Please enter a valid number" />
                                        <asp:ValidatorCalloutExtender runat="server" ID="exp_cmp_txtJunior" TargetControlID="cmp_txtJunior" />
                                        
                                    </td>
                                    <td class="PreRow" style="text-align: center;">
                                        <asp:TextBox ID="txtJunior2" runat="server" Width="40" CssClass="TextBox" Text='<%# Bind("Junior2") %>' />
                                        <asp:RequiredFieldValidator ID="req_txtJunior2" runat="server" Display="None" ErrorMessage="Required Field" 
                                            ControlToValidate="txtJunior2"  />
                                        <asp:ValidatorCalloutExtender runat="server" ID="ext_req_txtJunior2" TargetControlID="req_txtJunior2" />
                                        <asp:CompareValidator ID="cmp_txtJunior2" runat="server" Display="None" Operator="DataTypeCheck"
                                            ControlToValidate="txtJunior2" Type="Integer" ErrorMessage="Please enter a valid number" />
                                        <asp:ValidatorCalloutExtender runat="server" ID="exp_cmp_txtJunior2" TargetControlID="cmp_txtJunior2" />
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td class="PreRow" style="font-style: italic; font-weight: bold;">
                                        Comp.
                                    </td>
                                    <td class="PreRow" style="text-align: center;">
                                        <asp:TextBox ID="txtCompAdult" runat="server" Width="40" CssClass="TextBox" Text='<%# Bind("CompAdult") %>' />
                                        <asp:RequiredFieldValidator ID="req_txtCompAdult" runat="server" Display="None" ErrorMessage="Required Field" 
                                            ControlToValidate="txtCompAdult"  />
                                        <asp:ValidatorCalloutExtender runat="server" ID="ext_req_txtCompAdult" TargetControlID="req_txtCompAdult" />
                                        <asp:CompareValidator ID="cmp_txtCompAdult" runat="server" Display="None" Operator="DataTypeCheck"
                                            ControlToValidate="txtCompAdult" Type="Integer" ErrorMessage="Please enter a valid number" />
                                        <asp:ValidatorCalloutExtender runat="server" ID="exp_cmp_txtCompAdult" TargetControlID="cmp_txtCompAdult" SkinID="skExtender" />
                                        
                                    </td>
                                    <td class="PreRow" colspan="2" style="text-align: center;">
                                        <asp:TextBox ID="txtCompChild" runat="server" Width="40" CssClass="TextBox" Text='<%# Bind("CompChild") %>' />
                                        <asp:RequiredFieldValidator ID="req_txtCompChild" runat="server" Display="None" ErrorMessage="Required Field" 
                                            ControlToValidate="txtCompChild"  />
                                        <asp:ValidatorCalloutExtender runat="server" ID="ext_req_txtCompChild" TargetControlID="req_txtCompChild" />
                                        <asp:CompareValidator ID="cmp_txtCompChild" runat="server" Display="None" Operator="DataTypeCheck"
                                            ControlToValidate="txtCompChild" Type="Integer" ErrorMessage="Please enter a valid number" />
                                        <asp:ValidatorCalloutExtender runat="server" ID="exp_cmp_txtCompChild" TargetControlID="cmp_txtCompChild" />
                                        
                                    </td>
                                    <td class="PreRow" colspan="2" style="text-align: center;">
                                        <asp:TextBox ID="txtCompJunior" runat="server" Width="40" CssClass="TextBox" Text='<%# Bind("CompJunior") %>' />
                                        <asp:RequiredFieldValidator ID="req_txtCompJunior" runat="server" Display="None" ErrorMessage="Required Field" 
                                            ControlToValidate="txtCompJunior"  />
                                        <asp:ValidatorCalloutExtender runat="server" ID="ext_req_txtCompJunior" TargetControlID="req_txtCompJunior" />
                                        <asp:CompareValidator ID="cmp_txtCompJunior" runat="server" Display="None" Operator="DataTypeCheck"
                                            ControlToValidate="txtCompJunior" Type="Integer" ErrorMessage="Please enter a valid number" />
                                        <asp:ValidatorCalloutExtender runat="server" ID="exp_cmp_txtCompJunior" TargetControlID="cmp_txtCompJunior" />
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear" colspan="2" rowspan="1" style="border: none; text-align: right; padding: 5px;">
                                        <asp:LinkButton ID="lbPenalty" runat="server" Text="Penalize" Enabled="false" />
                                        <asp:ImageButton ID="ibPenalty" runat="server" ImageUrl='<%# PenaltyStateIcon(Eval("Penalty")) %>' CssClass="InvButton" Enabled="false" />
                                    </td>
                                    <td class="GridRowClear" colspan="7" rowspan="1" style="border: solid 1px; text-align: left; vertical-align: middle; padding: 5px;">
                                        <asp:Label ID="PenaltyConceptLabel" runat="server" Text='<%# Eval("PenaltyConcept") %>' Visible='<%# Eval("Penalty") %>' />
                                    </td>
                                    <td class="GridRowClear" colspan="1" rowspan="1" style="border: none; text-align: right; padding: 5px;">
                                        <asp:Button ID="btnUpdate" runat="server" SkinID="skBtnBase" Text="Update" CommandName="BkUpdate" 
                                            CommandArgument='<%# Eval("BookingID") %>' />
                                        <asp:Button ID="btnCancel" runat="server" SkinID="skBtnBase" Text="Cancel" CommandName="Cancel" CausesValidation="false" />
                                    </td>
                                </tr>
                            </table>
                        </EditItemTemplate>
                    </asp:FormView>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="dlBooking" />
                            <asp:AsyncPostBackTrigger ControlID="dumyRefresh" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <asp:UpdatePanel ID="upRates" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                    <asp:HiddenField ID="dlBookingEdit" runat="server" Value="" />
                    <asp:DataList ID="dlBooking" runat="server" DataKeyField="BookingID" DataSourceID="dsBooking">
                        <HeaderTemplate>
                            <table cellpadding="0" cellspacing="0" style="border-collapse: collapse;">
                                <tr>
                                    <td style="width: 66px; text-align: right;">
                                        <asp:ImageButton ID="ibSplit" runat="server" CssClass="ImgButton" ImageUrl="~/Images/unpublish_inline.gif" 
                                            ToolTip="Split Charge" Visible='<%# Not (IsDefinitive OR IsSX) %>' />
                                        <asp:PopupControlExtender ID="splitPopUp" runat="server"
                                            TargetControlID="ibSplit"
                                            PopupControlID="splitPopDiv"
                                            Position="Bottom" OffsetX="-30" OffsetY="-67" />
                                        <div id="splitPopDiv" style="display: none;">
                                            <iframe id="IframeSplit" frameborder="0" style="width: 600px; height: 600px;"
                                                scrolling="no" marginheight="10px" marginwidth="10px"
                                                src='<%# ShowSplitPopupText() %>'>
                                            </iframe>
                                        </div>
                                    </td>
                                    <td class="PreRowHead" colspan="1" style="width: 180px; border-left: solid 1px;">
                                        Rate
                                    </td>
                                    <td class="PreRowHead" colspan="1" style="width: 124px;">
                                        Arrival
                                    </td>
                                    <td class="PreRowHead" colspan="1" style="width: 124px;">
                                        Departure
                                    </td>
                                    <td class="PreRowHead" colspan="2">
                                        Nights
                                    </td>
                                    <td class="PreRowHead" colspan="1" style="width: 139px; border-right: solid 1px;">
                                        Amount
                                    </td>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:HiddenField ID="hfResID" runat="server" Value='<%# Eval("InvResID") %>' />
                                </td>
                                <td class="PreRow" style="text-align: left; font-style: italic; font-weight: bold;
                                    vertical-align: middle; padding: 2px 2px 0px 5px;">
                                    <asp:ImageButton ID="btnSuppDel" runat="server" ImageUrl="~/Images/delete.gif" 
                                        ToolTip="Remove supplement charge"
                                        CommandName="Delete" CommandArgument='<%# Eval("InvResID") %>'
                                        OnClientClick="return confirm('Are you sure you want to remove supplement charge?')"
                                        Visible='<%# (Not RateTypeNot9(Eval("RateType")) AND Not IsDefinitive) OR RateType9Empty(Eval("AddOn"), Eval("RateCodeID")) %>' />
                                    <asp:LinkButton ID="lnkEditRate" runat="server" 
                                        Text='<%# Iif(Eval("RateCodeID") Is DbNull.Value,"NO RATE", Eval("RateCodeID")) %>'
                                        Visible='<%# RateTypeNot9(Eval("RateType")) AND Not IsDefinitive %>' 
                                        Enabled='<%# NotComplimentary(Eval("RateCodeId")) AND Not IsSX %>' />
                                    <asp:Label ID="lblSuppRate" runat="server" Text='<%# Eval("RateCodeID") %>' 
                                        Visible='<%# Not (RateTypeNot9(Eval("RateType")) AND Not IsDefinitive) %>' />
                                    <asp:Label ID="ibRateInfo" runat="server" Style="float: right;" ToolTip="Rate info" 
                                        Visible='<%# NotComplimentary(Eval("RateCodeID")) AND NotNoRate(Eval("RateCodeID")) %>'>
                                        <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/infoIcon.gif" />
                                    </asp:Label>
                                    <!-- Rate Popup -->
                                    <asp:PopupControlExtender ID="stayPopUp" runat="server"
                                        TargetControlID="lnkEditRate"
                                        PopupControlID="stayPopDiv"
                                        Position="Bottom" OffsetX="-85" OffsetY="-195" />
                                    <asp:Panel ID="stayPopDiv" runat="server" style="display: none;">
                                        <iframe id="IframeStay" frameborder="0" style="width: 1320px; height: 550px; "
                                            scrolling="no" marginheight="10px" marginwidth="10px" 
                                            src='<%# "ProFormSGrid.aspx?BillingID=" & Eval("InvResID") %>' >
                                        </iframe>
                                    </asp:Panel>
                                    <!-- /Rate Popup -->
                                    <!-- Rate Info -->
                                        <asp:HiddenField ID="hfRateId" runat="server" Value='<%# Eval("RateId") %>' />
                                        <asp:PopupControlExtender ID="infoPopEx" runat="server"
                                            TargetControlID="ibRateInfo"
                                            PopupControlID="infoPopDiv"
                                            Position="Bottom"
                                            OffsetX="-85" />
                                        <asp:Panel id="infoPopDiv" runat="server" Style="display: none; background-color: White;" CssClass="GridBorderThin" >
                                            <asp:ObjectDataSource ID="dsRInfo" runat="server" 
                                                TypeName="dsInvoiceFormTableAdapters.Rate_SelectByBillInfoTableAdapter" 
                                                SelectMethod="GetData" >
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="hfRateId" Name="RateID" PropertyName="Value" Type="Int64" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                            <asp:FormView ID="fvRInfo" runat="server" DataSourceID="dsRInfo" Width="100%" Visible='<%# RateTypeNot9(Eval("RateType")) %>' >
                                                <RowStyle CssClass="GridRowClear" Font-Size="Small" />
                                                <ItemTemplate>
                                                    <table cellpadding="0" cellspacing="0" style="border: solid 1px;">
                                                        <asp:Panel ID="pnlSPO" runat="server" Visible='<%# Not (Eval("SpecialID") Is DBNull.Value) %>'>
                                                            <tr>
                                                                <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px; font-weight: bold;">
                                                                    <asp:Label ID="SpoLabel" runat="server" Text='<%# Iif(Eval("SpoDiscount1ID")=6,"Free-rate special:","Special:") %>' />
                                                                </td>
                                                                <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px;">
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("RateCodeId") %>' Font-Bold="true" />
                                                                    /
                                                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("SpoTitle") %>' />
                                                                    &nbsp;
                                                                    <i>
                                                                    <asp:Label ID="Label12" runat="server" Text='<%# "&nbsp;-&nbsp;" & Eval("SpoDiscount1") %>' Visible='<%# Eval("SpoDiscount1ID")<>6 %>' />
                                                                    <asp:Label ID="Label13" runat="server" Text='<%# Iif(Eval("SpoOn1") Is DBNull.Value,""," on " & Eval("SpoOn1")) %>' />
                                                                    <asp:Label ID="Label14" runat="server" Text='<%# Iif(Eval("SpoDiscount2ID")<>-1,"AND " & Eval("SpoDiscount2"),"") %>' />
                                                                    <asp:Label ID="Label15" runat="server" Text='<%# Iif(Eval("SpoOn2") Is DBNull.Value,""," on " & Eval("SpoOn2")) %>' />
                                                                    </i>
                                                                </td>
                                                            </tr>
                                                        </asp:Panel>
                                                        <asp:Panel ID="pnlCTR" runat="server" Visible='<%# Eval("SpoDiscount1ID")<>6 %>'>
                                                            <tr>
                                                                <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px; font-weight: bold;">
                                                                    <asp:Label ID="Label2" runat="server" Text='<%# Iif(Eval("SpoDiscount1ID")>-1,"On Contract:","Contract:") %>' />
                                                                </td>
                                                                <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px;">
                                                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("CtrRateCode") %>' Font-Bold="true" />
                                                                    /
                                                                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("CtrTitle") %>' />
                                                                </td>
                                                            </tr>
                                                        </asp:Panel>
                                                        <tr>
                                                            <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px; font-weight: bold;">
                                                                Children Policy:&nbsp;
                                                            </td>
                                                            <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px;">
                                                                <asp:Label ID="Label48" runat="server" Text="Adult Only" 
                                                                    Visible='<%# Eval("ChldCategories") = 0 %>' />
                                                                <asp:Label ID="Label3" runat="server" Text='<%# "<b>C1</b> " & Eval("Chld1Label") & " (" & Eval("Chld1ShLabel") & ") " & Eval("Chld1From") & "-" & Eval("Chld1Max") %>'
                                                                    Visible='<%# Eval("ChldCategories") > 0 %>' />
                                                                <asp:Label ID="Label8" runat="server" Text='<%# "<br /><b>C2</b> " & Eval("Chld2Label") & " (" & Eval("Chld2ShLabel") & "): " & Eval("Chld2From") & "-" & Eval("Chld2Max") %>'
                                                                    Visible='<%# Eval("ChldCategories") > 1 %>' />
                                                                <asp:Label ID="Label10" runat="server" Text='<%# "<br /><b>C3</b> " & Eval("Chld3Label") & " (" & Eval("Chld3ShLabel") & "): " & Eval("Chld3From") & "-" & Eval("Chld3Max") %>'
                                                                    Visible='<%# Eval("ChldCategories") > 2 %>' />
                                                                <asp:Label ID="Label11" runat="server" Text='<%# "<br /><b>C4</b> " & Eval("Chld4Label") & " (" & Eval("Chld4ShLabel") & "): " & Eval("Chld4From") & "-" & Eval("Chld4Max") %>'
                                                                    Visible='<%# Eval("ChldCategories") > 3 %>' />
                                                            </td>
                                                        </tr>
                                                    </table> 
                                                </ItemTemplate>
                                                <EmptyDataTemplate>
                                                    <table cellpadding="0" cellspacing="0" style="border: solid 1px;">
                                                            <tr>
                                                                <td class="SelectRowClear" style="vertical-align: top; padding: 4px 20px 4px 20px; font-weight: bold;">
                                                                    <asp:Label ID="Label59" runat="server" Text="Rate amount set manually" />
                                                                </td>
                                                            </tr>
                                                    </table>
                                                </EmptyDataTemplate>
                                            </asp:FormView>
                                            <asp:ObjectDataSource ID="dsSInfo" runat="server" 
                                                TypeName="dsInvoiceFormTableAdapters.Rate_SuppSelectByStayInfoTableAdapter" 
                                                SelectMethod="GetData" OldValuesParameterFormatString="original_{0}" >
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="hfRateId" Name="RateID" PropertyName="Value" Type="Int64" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                            <asp:FormView ID="fvSInfo" runat="server" DataSourceID="dsSInfo" Width="100%" Visible='<%# Not RateTypeNot9(Eval("RateType")) %>'>
                                                <RowStyle CssClass="GridRowClear" Font-Size="Small" />
                                                <ItemTemplate>
                                                    <table cellpadding="0" cellspacing="0" style="border: solid 1px;">
                                                        <tr>
                                                            <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px; font-weight: bold;">
                                                                Supplement:
                                                            </td>
                                                            <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px;">
                                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("RateCodeId") %>' Font-Bold="true" />
                                                                /
                                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("SupTitle") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px; font-weight: bold;">
                                                                &nbsp;
                                                            </td>
                                                            <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px;">
                                                                <asp:CheckBox ID="CheckBox1" runat="server" Enabled="false" AutoPostBack="false" Text="Mandatory" Checked='<%# Eval("IsMandatory") %>' TextAlign="Left" />
                                                                <asp:CheckBox ID="CheckBox2" runat="server" Enabled="false" AutoPostBack="false" Text="Combinable" Checked='<%# Eval("Combinable") %>' TextAlign="Left" />
                                                                <asp:CheckBox ID="CheckBox3" runat="server" Enabled="false" AutoPostBack="false" Text="Restrict on EBB" Checked='<%# Eval("RestrictEBB") %>' TextAlign="Left" />
                                                                <asp:CheckBox ID="CheckBox4" runat="server" Enabled="false" AutoPostBack="false" Text="All Week Days" Checked="true" TextAlign="Left" Visible='<%# Eval("WeekDays")="YYYYYYY" %>' />
                                                                &nbsp;
                                                                <asp:Label ID="Label3" runat="server" Text="Week Days:" Visible='<%# Eval("WeekDays")<>"YYYYYYY" %>' />
                                                                <asp:CheckBox ID="CheckBox12" runat="server" Enabled="false" AutoPostBack="false" Text="Su" Checked='<%# Eval("WeekDays").Chars(0)="Y" %>' Visible='<%# Eval("WeekDays")<>"YYYYYYY" %>' />
                                                                <asp:CheckBox ID="CheckBox13" runat="server" Enabled="false" AutoPostBack="false" Text="Mo" Checked='<%# Eval("WeekDays").Chars(1)="Y" %>' Visible='<%# Eval("WeekDays")<>"YYYYYYY" %>' />
                                                                <asp:CheckBox ID="CheckBox14" runat="server" Enabled="false" AutoPostBack="false" Text="Tu" Checked='<%# Eval("WeekDays").Chars(2)="Y" %>' Visible='<%# Eval("WeekDays")<>"YYYYYYY" %>' />
                                                                <asp:CheckBox ID="CheckBox15" runat="server" Enabled="false" AutoPostBack="false" Text="We" Checked='<%# Eval("WeekDays").Chars(3)="Y" %>' Visible='<%# Eval("WeekDays")<>"YYYYYYY" %>' />
                                                                <asp:CheckBox ID="CheckBox16" runat="server" Enabled="false" AutoPostBack="false" Text="Th" Checked='<%# Eval("WeekDays").Chars(4)="Y" %>' Visible='<%# Eval("WeekDays")<>"YYYYYYY" %>' />
                                                                <asp:CheckBox ID="CheckBox17" runat="server" Enabled="false" AutoPostBack="false" Text="Fr" Checked='<%# Eval("WeekDays").Chars(5)="Y" %>' Visible='<%# Eval("WeekDays")<>"YYYYYYY" %>' />
                                                                <asp:CheckBox ID="CheckBox18" runat="server" Enabled="false" AutoPostBack="false" Text="Sa" Checked='<%# Eval("WeekDays").Chars(6)="Y" %>' Visible='<%# Eval("WeekDays")<>"YYYYYYY" %>' />
                                                            </td>
                                                        </tr> 
                                                        <tr>
                                                            <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px; font-weight: bold;">
                                                                On Contract:
                                                            </td>
                                                            <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px;">
                                                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("CtrRateCode") %>' Font-Bold="true" />
                                                                /
                                                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("CtrTitle") %>' />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px; font-weight: bold;">
                                                                Children Policy:&nbsp;
                                                            </td>
                                                            <td class="SelectRowClear" style="vertical-align: top; padding: 0px 4px 0px 4px;">
                                                                <asp:Label ID="Label48" runat="server" Text="Adult Only" 
                                                                    Visible='<%# Eval("ChldCategories") = 0 %>' />
                                                                <asp:Label ID="Label49" runat="server" Text='<%# "<b>C1</b> " & Eval("Chld1Label") & " (" & Eval("Chld1ShLabel") & ") " & Eval("Chld1From") & "-" & Eval("Chld1Max") %>'
                                                                    Visible='<%# Eval("ChldCategories") > 0 %>' />
                                                                <asp:Label ID="Label8" runat="server" Text='<%# "<br /><b>C2</b> " & Eval("Chld2Label") & " (" & Eval("Chld2ShLabel") & "): " & Eval("Chld2From") & "-" & Eval("Chld2Max") %>'
                                                                    Visible='<%# Eval("ChldCategories") > 1 %>' />
                                                                <asp:Label ID="Label10" runat="server" Text='<%# "<br /><b>C3</b> " & Eval("Chld3Label") & " (" & Eval("Chld3ShLabel") & "): " & Eval("Chld3From") & "-" & Eval("Chld3Max") %>'
                                                                    Visible='<%# Eval("ChldCategories") > 2 %>' />
                                                                <asp:Label ID="Label11" runat="server" Text='<%# "<br /><b>C4</b> " & Eval("Chld4Label") & " (" & Eval("Chld4ShLabel") & "): " & Eval("Chld4From") & "-" & Eval("Chld4Max") %>'
                                                                    Visible='<%# Eval("ChldCategories") > 3 %>' />
                                                            </td>
                                                        </tr>
                                                    </table> 
                                                </ItemTemplate>
                                            </asp:FormView>
                                            
                                            <asp:ObjectDataSource ID="dsRLog" runat="server" 
                                                TypeName="dsInvoiceFormTableAdapters.RateSuspendLogTableAdapter" 
                                                SelectMethod="GetData" >
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="hfRateId" Name="RateID" PropertyName="Value" Type="Int64" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                            <asp:FormView ID="fvRLog" runat="server" DataSourceID="dsRLog" Width="100%" >
                                                <RowStyle CssClass="Red" Font-Size="Small" Font-Bold="false" Font-Italic="true" />
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSTime" runat="server" Text='<%# "[" & Eval("SuspendTime") & "]:" %>' />&nbsp;
                                                    <asp:Label ID="lblSMsg" runat="server" Text='<%# Eval("SuspendMsg") %>' Font-Bold="true" />
                                                </ItemTemplate>
                                            </asp:FormView>
                                            
                                        </asp:Panel>                                                                
                                    <!-- /Rate Info -->
                                </td>
                                <td class="PreRow" style="text-align: center;">
                                    <asp:Label ID="ArrivalLabel" runat="server" Text='<%# Eval("Arrival","{0:d}") %>' />
                                </td>
                                <td class="PreRow" style="text-align: center;">
                                    <asp:Label ID="DepartureLabel" runat="server" Text='<%# Eval("Departure","{0:d}") %>' />
                                </td>
                                <td class="PreRow" style="width: 60px; text-align: center;">
                                    <asp:Label ID="TravelNightsLabel" runat="server" Text='<%# Eval("TravelNights") %>' ToolTip="Travel nights" />
                                </td>
                                <td class="PreRow" style="width: 60px; text-align: center;">
                                    <asp:Label ID="ChargedNightsLabel" runat="server" Text='<%# Eval("ChargedNights") %>' ToolTip="Charged nights" />
                                    <asp:ImageButton ID="imgChNts" runat="server" style="float: right; padding-right: 2px; padding-top: 2px;" 
                                        ImageUrl="~/Images/edit.gif" 
                                        CommandName="Edit" CommandArgument="0"
                                        Visible='<%# Eval("Penalty") AND Not (IsDefinitive OR IsCancelled) %>' />
                                </td>
                                <td class="PreRow" style="text-align: right;">
                                    <asp:ImageButton ID="ibEdit" runat="server" CausesValidation="False" CssClass="InvButton" 
                                        style="float: left; margin-top: 2px;"
                                        ImageUrl="~/Images/edit_inline.gif" 
                                        CommandName="Edit" CommandArgument='<%# Eval("InvResID") %>'
                                        Visible='<%# CanEditRate(Eval("RateType")) %>' />
                                    <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount","{0:N2}") %>' 
                                        ToolTip='<%# Eval("InvResID") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <tr>
                                <td>
                                    <asp:HiddenField ID="hfResID" runat="server" Value='<%# Eval("InvResID") %>' />
                                </td>
                                <td class="PreRow" style="text-align: left; font-style: italic; font-weight: bold;
                                    vertical-align: middle; padding: 2px 2px 0px 5px;">
                                    <asp:Label ID="lblRateCode" runat="server" Text='<%# Eval("RateCodeID") %>'
                                        Visible='<%# dlBookingEdit.Value = "Nights" %>' />
                                    <asp:TextBox ID="txtStayRate" runat="server" Text='<%# RateCodeText(Eval("RateCodeId")) %>' CssClass="TextBox"
                                        Visible='<%# dlBookingEdit.Value = "Rate" %>' Enabled='<%# Not IsSx %>' />
                                    <asp:RequiredFieldValidator ID="req_txtStayRate" runat="server" ControlToValidate="txtStayRate"
                                        Display="None" ErrorMessage="Required Field" />
                                    <asp:ValidatorCalloutExtender ID="ex_req_txtStayRate" runat="server" TargetControlID="req_txtStayRate" />
                                </td>
                                <td class="PreRow" style="text-align: center;">
                                    <asp:Label ID="ArrivalLabel" runat="server" Text='<%# Eval("Arrival","{0:d}") %>' />
                                </td>
                                <td class="PreRow" style="text-align: center;">
                                    <asp:Label ID="DepartureLabel" runat="server" Text='<%# Eval("Departure","{0:d}") %>' />
                                </td>
                                <td class="PreRow" style="width: 60px; text-align: center;">
                                    <asp:Label ID="TravelNightsLabel" runat="server" Text='<%# Eval("TravelNights") %>' ToolTip="Travel nights" />
                                </td>
                                <td class="PreRow" style="width: 60px; text-align: center;">
                                    <asp:DropDownList ID="ddlChgNhs" runat="server" ToolTip="Charged nights" CssClass="TextBox" Width="40px"
                                        Visible='<%# dlBookingEdit.Value = "Nights" %>'
                                        SelectedValue='<%# Eval("ChargedNights") %>'
                                        AutoPostBack="true"
                                        OnDataBinding="ddlChgNts_DataBinding"
                                        OnSelectedIndexChanged="ddlChgNts_SelectedIndexChanged" />
                                    <asp:ImageButton ID="imgChNts" runat="server" style="float:right; padding-top: 2px;" 
                                        Visible='<%# dlBookingEdit.Value = "Nights" %>'
                                        ImageUrl="~/Images/cancel_big.gif" CommandName="Cancel" />
                                    <asp:Label ID="ChargedNightsLabel" runat="server" Text='<%# Eval("ChargedNights") %>' ToolTip="Charged nights" 
                                        Visible='<%# dlBookingEdit.Value = "Rate" %>'/>
                                </td>
                                <td class="PreRow" style="text-align: right;">
                                    <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount","{0:N2}") %>' 
                                        Visible='<%# dlBookingEdit.Value = "Nights" %>' />
                                    <asp:ImageButton ID="ibEditUpdate" runat="server" CausesValidation="False" CommandName="Update"
                                        style="float: left; margin-top: 2px;"
                                        CommandArgument='<%# Eval("InvResID") %>'
                                        Visible='<%# dlBookingEdit.Value = "Rate" %>'
                                        CssClass="InvButton" ImageUrl="~/Images/accept_inline.gif" />
                                    <asp:ImageButton ID="ibEditCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                        style="float: left; margin-top: 2px;"
                                        Visible='<%# dlBookingEdit.Value = "Rate" %>'
                                        CssClass="InvButton" ImageUrl="~/Images/decline_inline.gif" />
                                    <asp:TextBox ID="txtBillAmount" runat="server" Text='<%# Eval("Amount") %>' CssClass="TextBox"
                                        Visible='<%# dlBookingEdit.Value = "Rate" %>' Width="80px" />
                                    <asp:CompareValidator ID="val_txtBillAmount" runat="server" ControlToValidate="txtBillAmount"
                                        Display="None" ErrorMessage="Please input a valid amount" Operator="DataTypeCheck" Type="Double" />
                                    <asp:ValidatorCalloutExtender ID="ex_val_txtBillAmount" runat="server" TargetControlID="val_txtBillAmount" />
                                    <asp:RequiredFieldValidator ID="req_txtBillAmount" runat="server" ControlToValidate="txtBillAmount"
                                        Display="None" ErrorMessage="Required Field" />
                                    <asp:ValidatorCalloutExtender ID="ex_req_txtBillAmount" runat="server" TargetControlID="req_txtBillAmount" />
                                </td>
                            </tr>
                        </EditItemTemplate>
                        
                        <FooterTemplate>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <%--<td colspan="5" style="text-align: left; font-style: italic; font-weight: bold; border-top: solid 2px; padding-top: 5px;">
                                    &nbsp;
                                </td>--%>
                                <td colspan="6" style="text-align: right; font-style: italic; font-weight: bold; border-top: solid 2px; padding-top: 5px;">
                                    <asp:LinkButton ID="lnkSupplement" runat="server" Text="Add Supplement" 
                                        Visible='<%# Not IsDefinitive AND ShowSuppLink %>' />
                                    <asp:PopupControlExtender ID="suppPopUp" runat="server"
                                        TargetControlID="lnkSupplement"
                                        PopupControlID="suppPopDiv"
                                        Position="Bottom" OffsetX="-703" OffsetY="-222" />
                                    <div id="suppPopDiv"style="display: none;">
                                        <iframe id="IframeSupp" frameborder="0" style="width: 1320px; height: 550px; "
                                            scrolling="yes" marginheight="10px" marginwidth="10px" 
                                            src='<%# ShowSuppPopupText(false) %>' >
                                        </iframe>
                                    </div>
                                    &nbsp;
                                    <asp:LinkButton ID="lnkSupplementAll" runat="server" Text="Add to All" 
                                        Visible='<%# Not IsDefinitive AND ShowSuppLink %>' />
                                    <asp:PopupControlExtender ID="suppAllPopUp" runat="server"
                                        TargetControlID="lnkSupplementAll"
                                        PopupControlID="suppAllPopDiv"
                                        Position="Bottom" OffsetX="-755" OffsetY="-222" />
                                    <div id="suppAllPopDiv"style="display: none;">
                                        <iframe id="IframeSuppAll" frameborder="0" style="width: 1320px; height: 550px; "
                                            scrolling="yes" marginheight="10px" marginwidth="10px" 
                                            src='<%# ShowSuppPopupText(true) %>' >
                                        </iframe>
                                    </div>
                                </td>
                            </tr>
                            </table>
                        </FooterTemplate>
                    </asp:DataList>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="fvBooking" />
                            <asp:AsyncPostBackTrigger ControlID="dumyRefresh" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
        <uc:MessagePop ID="msgPop" runat="server" Title="Proforma Detail" />
    </div>
    <asp:ObjectDataSource ID="dsBooking" runat="server" OldValuesParameterFormatString="original_{0}"
        TypeName="dsProformaTableAdapters.InvDocDetailTableAdapter"
        SelectMethod="GetDataByID" 
        UpdateMethod="BookingUpdate" >
        <SelectParameters>
            <asp:QueryStringParameter Name="BookingID" Type="Int32" QueryStringField="BookingID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="User" Type="String" />
            <asp:QueryStringParameter Name="InvDocID" Type="Int32" QueryStringField="ProformaID" />
            <asp:QueryStringParameter Name="BookingID" Type="Int32" QueryStringField="BookingID" />
            <asp:Parameter Name="BkDate" Type="DateTime" />
            <asp:Parameter Name="BkNumber" Type="String" />
            <asp:Parameter Name="CheckIn" Type="DateTime" />
            <asp:Parameter Name="CheckOut" Type="DateTime" />
            <asp:Parameter Name="RoomTypeId" Type="String" />
            <asp:Parameter Name="GuestName" Type="String" />
            <asp:Parameter Name="Adult" Type="Int32" />
            <asp:Parameter Name="Infant" Type="Int32" />
            <asp:Parameter Name="Child" Type="Int32" />
            <asp:Parameter Name="Junior" Type="Int32" />
            <asp:Parameter Name="Junior2" Type="Int32" />
            <asp:Parameter Name="CompAdult" Type="Int32" />
            <asp:Parameter Name="CompChild" Type="Int32" />
            <asp:Parameter Name="CompJunior" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    </form>
</body>
</html>
