<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" 
    CodeFile="ProCreate.aspx.vb" Inherits="Proforma_ProCreate" enableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    New Group Proforma
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" Runat="Server">
    <script type="text/javascript">
        function adjustDivs(){
            var df = document.getElementById('<%=upProcessing.ClientID %>');
            df.style.position = 'absolute';
            df.style.height = '100%';
            df.style.width = '100%';
            df.style.left = (document.documentElement.scrollLeft+5) + '%';
            df.style.top = (document.documentElement.scrollTop + 50) + 'px';
        }
        window.onload = adjustDivs;
        window.onpageshow = adjustDivs;
        window.onresize=adjustDivs;
        window.onscroll=adjustDivs;
    </script>
    <div class="Red">
        <asp:UpdatePanel ID="UpdatePanelMain" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table cellpadding="0" cellspacing="0" >
                    <tr>
                        <td>
                            <asp:FormView ID="fvInvoiceHead" runat="server" Width="100%" DefaultMode="Insert" >
                                <InsertItemTemplate>
                                    <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                        <tr>
                                            <td class="GridLabelBG" colspan="4">
                                                <asp:Label ID="Label30" runat="server" SkinID="skGridLabel" Text="New Group Proforma" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 30px;" rowspan="6">&nbsp;</td>
                                            <td style="width: 120px;" class="GridRow1B"><b>Group Code</b></td>
                                            <td style="width: 580px;" class="GridRow1B">
                                                <asp:TextBox ID="txtGroup" runat="server" CssClass="TextBox"/>
                                                <asp:AutoCompleteExtender 
                                                    runat="server" ID="aceGroup"
                                                    ServicePath="~/AutoCompleteResGroup.asmx"
                                                    ServiceMethod="SearchGroup"
                                                    MinimumPrefixLength="3" CompletionInterval="10"
                                                    EnableCaching="false" CompletionSetCount="10"
                                                    TargetControlID="txtGroup"
                                                    FirstRowSelected="true" />
                                                <asp:RequiredFieldValidator ID="reqtxtGroup" runat="server" ControlToValidate="txtGroup"
                                                    Display="None" ErrorMessage="Required Field" />
                                                <asp:ValidatorCalloutExtender runat="server" Enabled="True" ID="extreqtxtGroup" TargetControlID="reqtxtGroup" />
                                            </td>
                                            <td rowspan="6">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="width: 120px;" class="GridRow1B"><b>Tour Operator</b></td>
                                            <td style="width: 580px;" class="GridRow1B">
                                                <%--
                                                <asp:TextBox ID="txtTourOp" runat="server" CssClass="TextBox" />
                                                <asp:AutoCompleteExtender 
                                                    runat="server" ID="aceTourOp"
                                                    ServicePath="~/AutoCompleteTTOO.asmx"
                                                    ServiceMethod="SearchGroupTTOO"
                                                    MinimumPrefixLength="3" CompletionInterval="10"
                                                    EnableCaching="false" CompletionSetCount="10"
                                                    TargetControlID="txtTourOp"
                                                    FirstRowSelected="true"
                                                    OnClientItemSelected="ClientItemSelected" />
                                                <asp:RequiredFieldValidator ID="reqtxtTourOp" runat="server" ControlToValidate="txtTourOp"
                                                    Display="None" ErrorMessage="Required Field" />
                                                <asp:ValidatorCalloutExtender runat="server" Enabled="True" ID="exttxtTourOp" TargetControlID="reqtxtTourOp" />
                                                --%>
                                                <asp:DropDownList ID="ddlTO" runat="server" CssClass="TextBox" />
                                                <asp:CascadingDropDown ID="exTO" runat="server" 
                                                    TargetControlID="ddlTO" Category="TourOpID" 
                                                    ServicePath="~/TOGroup.asmx"
                                                    ServiceMethod="GetGroupTTOOs" >
                                                </asp:CascadingDropDown>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 120px;" class="GridRow1B"><b>Check In</b></td>
                                            <td style="width: 580px;" class="GridRow1B">
                                                <asp:TextBox ID="txtCheckInFrom" runat="server" CssClass="TextBox" Width="46%" />
                                                <asp:CalendarExtender ID="txtCheckInFrom_Calendar" runat="server" CssClass="cal_Theme1" 
                                                    TargetControlID="txtCheckInFrom" />
                                                <asp:CompareValidator ID="valCheckInFromDate" runat="server" Display="None" 
                                                    Operator="DataTypeCheck" Type="Date" ErrorMessage="Not a valid date!"
                                                    ControlToValidate="txtCheckInFrom" />
                                                <asp:ValidatorCalloutExtender ID="extCheckInFromDate" runat="server"
                                                    TargetControlID="valCheckInFromDate" Enabled="True" />
                                                &nbsp;to&nbsp;
                                                <asp:TextBox ID="txtCheckInTo" runat="server" CssClass="TextBox" Width="47%" />
                                                <asp:CalendarExtender ID="txtCheckInTo_Calendar" runat="server" CssClass="cal_Theme1" 
                                                    TargetControlID="txtCheckInTo" />
                                                <asp:CompareValidator ID="valCheckInToDate" runat="server" Display="None" 
                                                    Operator="DataTypeCheck" Type="Date" ErrorMessage="Not a valid date!"
                                                    ControlToValidate="txtCheckInTo" />
                                                <asp:ValidatorCalloutExtender ID="extCheckInToDate" runat="server"
                                                    TargetControlID="valCheckInToDate" Enabled="True" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 120px;" class="GridRow1B"><b>Check Out</b></td>
                                            <td style="width: 580px;" class="GridRow1B">
                                                <asp:TextBox ID="txtCheckOutFrom" runat="server" CssClass="TextBox" Width="46%" />
                                                <asp:CalendarExtender ID="txtCheckOutFrom_Calendar" runat="server" CssClass="cal_Theme1" 
                                                    TargetControlID="txtCheckOutFrom" />
                                                <asp:CompareValidator ID="valCheckOutFromDate" runat="server" Display="None" 
                                                    Operator="DataTypeCheck" Type="Date" ErrorMessage="Not a valid date!"
                                                    ControlToValidate="txtCheckOutFrom" />
                                                <asp:ValidatorCalloutExtender ID="extCheckOutFromDate" runat="server"
                                                    TargetControlID="valCheckOutFromDate" Enabled="True" />
                                                &nbsp;to&nbsp;
                                                <asp:TextBox ID="txtCheckOutTo" runat="server" CssClass="TextBox" Width="47%" />
                                                <asp:CalendarExtender ID="txtCheckOutTo_Calendar" runat="server" CssClass="cal_Theme1" 
                                                    TargetControlID="txtCheckOutTo" />
                                                <asp:CompareValidator ID="valCheckOutToDate" runat="server" Display="None" 
                                                    Operator="DataTypeCheck" Type="Date" ErrorMessage="Not a valid date!"
                                                    ControlToValidate="txtCheckOutTo" />
                                                <asp:ValidatorCalloutExtender ID="extCheckOutToDate" runat="server"
                                                    TargetControlID="valCheckOutToDate" Enabled="True" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 120px; vertical-align: top;" class="GridRowClear"><b>Hotel</b></td>
                                            <td style="width: 580px;" class="GridRowClear">
                                                <asp:ListBox ID="lbHotel" runat="server" CssClass="TextBox" Width="95%" Rows="2" />
                                                <asp:ImageButton ID="btnCloseHotel" runat="server" ImageUrl="~/Images/Collapse.gif" 
                                                    BorderStyle="Dotted" BorderWidth="1px" BackColor="Control" 
                                                    onclick="btnCloseHotel_Click" />
                                                <asp:PopupControlExtender ID="popHotel" runat="server" CommitProperty="Text" PopupControlID="tvPanel"
                                                    Position="Bottom" TargetControlID="lbHotel">
                                                </asp:PopupControlExtender>
                                                <asp:Panel ID="tvPanel" runat="server" BackColor="White" 
                                                    BorderStyle="solid" BorderWidth="1px"
                                                    ScrollBars="Auto" Height="250px" Width="572px">
                                                    <asp:CheckBoxList ID="listHotels" runat="server" DataSourceID="dsAllHotels" 
                                                        DataTextField="Hotel" DataValueField="HotelID">
                                                    </asp:CheckBoxList>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="GridRow2T" style="margin-top: 2px; padding-top: 5px; text-align: left;">
                                                &nbsp;
                                            </td>
                                            <td class="GridRow2T" style="margin-top: 2px; padding-top: 5px; text-align: right;">
                                                <asp:CheckBox ID="cbIncludeCancelled" runat="server" Checked="true" TextAlign="Left" Text="Include Cancelled" />&nbsp;&nbsp;
                                                <asp:Button ID="btnCheck" runat="server" CommandName="Check" SkinID="skBtnBase" 
                                                    Text="Check" onclick="btnCheck_Click" />&nbsp;
                                                <asp:Button ID="btnCancelCreate" runat="server" CommandName="CancelCreate" SkinID="skBtnBase" Text="Cancel" CausesValidation="false"
                                                    OnClientClick="return confirm('Are you sure you don\'t want to create invoice?');" />
                                            </td>
                                        </tr>
                                    </table>
                                </InsertItemTemplate>
                            </asp:FormView>
                            <asp:Panel ID="pnlError" runat="server" style="margin-left: 30px; padding: 10px 10px 10px 10px; width: 700px; height: 40px;" CssClass="WaterMark" Visible="false">
                                <asp:Label ID="lblError" runat="server" Text="This is Create validation message"  />
                            </asp:Panel>
                        </td>
                    </tr>
                    <asp:Panel ID="pnlDetail" runat="server" Visible="False">
                        <tr><td>&nbsp;</td></tr>
                        <tr>
                            <td class="GridLabelBG">
                                <asp:Label ID="Label31" runat="server" Text="Available reservations" CssClass="GridLabel" Height="26px" />
                            </td>
                        </tr>
                        <tr>
                            <td >
                                <div style="border-collapse: collapse; padding: 0px; margin: 4px 0px 0px 0px; border: none 0px;">
                                <asp:DataList  ID="dlRes" runat="server"  class="GridBorder" >
                                    <HeaderTemplate>
                                    <table cellpadding="0" cellspacing="0" style="border-collapse: collapse;">
                                        <tr>
                                            <td class="InvHead" style="width: 30px;"></td>
                                            <td class="InvHead" style="width: 120px;">Folio Full</td>
                                            <td class="InvHead" style="width: 350px;">Hotel</td>
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
                                        <tr>
                                            <td class="InvRow">
                                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Error.gif" Visible='<%# Eval("Preinvoiced") %>' />
                                            </td>
                                            <td class="InvRow">
                                                <asp:Label ID="Label18" runat="server" Text='<%# Eval("FolioFull") %>' />
                                            </td>
                                            <td class="InvRow">
                                                <asp:Label ID="Label39" runat="server" Text='<%# Eval("Hotel") %>' />
                                            </td>
                                            <td class="InvRow">
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("RoomTypeId") %>' />
                                            </td>
                                            <td class="InvRow">
                                                <asp:Label ID="Label20" runat="server" Text='<%# Eval("BkNumber") %>' />
                                            </td>
                                            <td class="InvRow">
                                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("BkDate", "{0:d}") %>' />
                                            </td>
                                            <td class="InvRow">
                                                <asp:Label ID="Label19" runat="server" Text='<%# Eval("PreInvText") %>' />
                                            </td>
                                            <td class="InvRow">
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("CheckIn", "{0:d}") %>' />
                                            </td>
                                            <td class="InvRow">
                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("CheckOut", "{0:d}") %>' />
                                            </td>
                                            <td class="InvRow">
                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Modified", "{0:d}") %>' />
                                            </td>
                                            <td class="InvRow">
                                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("Imported", "{0:d}") %>' />
                                            </td>
                                            <td class="InvRow">
                                                <asp:Label ID="Label7" runat="server" Text='<%# Eval("InHouseStateText") %>' />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                    </table>
                                    </FooterTemplate>
                                </asp:DataList >
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            <div class="WaterMark">
                                <asp:Label ID="lblAready" runat="server" Visible="false" Text="One or more reservations are already preinvoiced!" />
                            </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="margin-top: 2px; padding-top: 5px; text-align: right;">
                                <asp:Button ID="btnCreate" runat="server" SkinID="skBtnBase" Text="Create" />&nbsp;
                            </td>
                        </tr>
                    </asp:Panel>
                </table>
                
                <asp:ObjectDataSource runat="server" OldValuesParameterFormatString="original_{0}" 
                    ID="dsAllHotels"
                    TypeName="dsProformaTableAdapters.HotelTableAdapter"
                    SelectMethod="GetData" />
                
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
    
                <asp:UpdateProgress ID="upProcessing" runat="server" >
                    <ProgressTemplate>
                        <div id="Div1" runat="server" align="center" valign="center" 
                            style="position: fixed; left: 5%; top: 5%; visibility: visible; border: none; z-index: 100; 
                                   width: 90%; height: 95%; background: White; filter: alpha(opacity=80); -moz-opacity:.8; opacity:.8;">
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/status_anim.gif" style="padding-top: 150px;" />&nbsp;Processing...
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </ContentTemplate>
            <%--<Triggers>
                <asp:PostBackTrigger ControlID="fvInvoiceHead" />
                <asp:PostBackTrigger ControlID="btnCreate" />
            </Triggers>--%>
        </asp:UpdatePanel>
    </div>
</asp:Content>

