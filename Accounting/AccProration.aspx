<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" 
    CodeFile="AccProration.aspx.vb" Inherits="Accounting_AccProration" 
    EnableEventValidation="false" %>

<%@ Register src="~/App_UserControls/HotelExpanderControl.ascx" tagname="HotelExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/TourOpExpanderControl.ascx" tagname="TourOpExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/InputIntegerControl.ascx" tagname="InputIntegerControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/FromToIntegerControl.ascx" tagname="FromToIntegerControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/FromToDateControl.ascx" tagname="FromToDateControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/InputDateControl.ascx" tagname="InputDateControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/MessagePop.ascx" tagname="MessagePop" tagprefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Proration Application
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" runat="Server">
    <script language="javascript" type="text/javascript">
        function convertToDec(str) {
            var n = Number.parseFloat(str);
            if (!str || isNaN(n) || n < 0) return 0;
            return n.toFixed(2);
        }

        function changedText(txt) {
            if (convertToDec(txt.value) != 0) {
                txt.style.fontWeight = 'bold';
                txt.parentElement.parentElement.style.fontWeight = 'bold';
                txt.parentElement.parentElement.style.backgroundColor = 'SeaShell';
                txt.parentElement.parentElement.nextElementSibling.style.backgroundColor = 'SeaShell';
                txt.parentElement.parentElement.nextElementSibling.firstElementChild.firstElementChild.style.display = 'inline';
            }
            else           
            {
                txt.style.fontWeight = '';
                txt.parentElement.parentElement.style.fontWeight = '';
                txt.parentElement.parentElement.style.backgroundColor = '';
                txt.parentElement.parentElement.nextElementSibling.style.backgroundColor = '';
                txt.parentElement.parentElement.nextElementSibling.firstElementChild.firstElementChild.style.display = 'none';
            }
        }

        function amountSet(txt, amount) {
            var t = document.getElementById(txt)
            t.value = amount;
            changedText(t)
        }

        function changePayMode(dl, txt, hf) {
            var h = document.getElementById(hf);
            var t = document.getElementById(txt);
            var newText = "(" + dl.value.trim() + ")";
            var r = t.value;

            t.value = r.replace(h.value, newText);
            h.value = newText;
        }

        function CreateClick(bt) {
            bt.style.display = "none";
            //var img = document.getElementById('<%= imgWait.ClientID %>');
            //img.style.display = "inline";
            document.getElementById('<%= lblWaiting.ClientID %>').style.display = "inline";
            document.getElementById('<%= btnSearch.ClientID %>').style.disabled = "true";
            document.getElementById('<%= btnClear.ClientID %>').style.disabled = "true";
        }
    </script>
    <asp:HiddenField ID="hfUser" runat="server" />
    <asp:HiddenField ID="hfProLimit" runat="server" />
    <asp:HiddenField ID="hfProrationID" runat="server" />
    <div class="Green">
        <asp:CollapsiblePanelExtender ID="cpeSearch" runat="server" TargetControlID="pnSearch"
            CollapseControlID="lblFilter" ExpandControlID="lblFilter" ImageControlID="imgExpander"
            CollapsedImage="~/Images/expand_.png" ExpandedImage="~/Images/collapse_.png"
            Collapsed="False">
        </asp:CollapsiblePanelExtender>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG" style="width: 600px;">
                    <asp:Panel ID="pnSearchHead" runat="server" Width="100%">
                        <asp:Label ID="lblFilter" runat="server" SkinID="skGridLabel">Search/Filter &nbsp; <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />
                            &nbsp; </asp:Label>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px">
                    <asp:Panel ID="pnSearch" runat="server" style="padding-left: 8px;" DefaultButton="btnSearch">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="GridRow1B" colspan="2" >
                                    <uc:HotelExpanderControl ID="ctrlHotel" runat="server" 
                                        LabelWidth="120px" ControlWidth="480px" 
                                        CollapsedDefailt="true"
                                        Mandatory="true"
                                        NoCCI="true" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" colspan="2" >
                                    <uc:TourOpExpanderControl ID="ctrlTourOp" runat="server" 
                                        LabelWidth="120px" ControlWidth="480px"
                                        CollapsedDefailt="true"
                                        Mandatory="true"
                                        NoLocal="true" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 120px;" >Check In</td>
                                <td class="GridRow1B" style="width: 480px;" >
                                    <uc:FromToDateControl ID="ctrlCheckIn" runat="server"
                                        MandatoryFrom="false"
                                        MandatoryTo="false" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 120px;" >Invoice Num</td>
                                <td class="GridRow1B" style="width: 480px;" >
                                    <uc:FromToIntegerControl ID="ctrlInvNum" runat="server"
                                        MandatoryFrom="false"
                                        MandatoryTo="false" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 120px;" >Folio</td>
                                <td class="GridRow1B" style="width: 480px;" >
                                    <uc:FromToIntegerControl ID="ctrlFolio" runat="server"
                                        MandatoryFrom="false"
                                        MandatoryTo="false" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear">Bk Number</td>
                                <td class="GridRowClear">
                                    <asp:TextBox ID="txtBkNum" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wm_txtBkNum" runat="server"
                                        TargetControlID="txtBkNum" WatermarkCssClass="WaterMark" 
                                        WatermarkText="Like Booking Number..." />
                                </td>
                            </tr>         
                            <tr>
                                <td class="ComandRow2T" colspan="2" style="height: 30px; padding-top: 5px">
                                    <asp:Button ID="btnSearch" runat="server" SkinID="skBtnFilter" />&nbsp;
                                    <asp:Button ID="btnClear" runat="server" SkinID="skBtnClear" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <asp:Panel ID="pnlApplication" runat="server" class="Red" Visible="false">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="Label1" runat="server" SkinID="skGridLabel" Text="Apply Proration" />
                    <a name="Top" href="#Bottom" style="float: right;"><img src="../Images/Expand.gif" style="padding: 5px 5px 0px 0px;" alt="bottom" /></a>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <div style="width: 1008px; background-color: SeaShell; padding-bottom: 5px;">
                    <table cellpadding="0" cellspacing="0">
                        <tr style="height: 30px; font-weight: bold;">
                            <td class="GridRow2B" style="width: 88px;">Hotel</td>
                            <td class="GridRow2B" style="width: 80px;">&nbsp;</td>
                            <td class="GridRow2B" style="width: 80px;">&nbsp;</td>
                            <td class="GridRow2B" style="width: 10px;">&nbsp;</td>
                                                        
                            <td class="GridRow2B" style="width: 158px;">Tour Operator</td>
                            <td class="GridRow2B" style="width: 90px;">&nbsp;</td>
                            <td class="GridRow2B" style="width: 10px;">&nbsp;</td>
                            
                            <td class="GridRow2B" style="width: 80px;">Reg.Date</td>
                            <td class="GridRow2B" style="width: 10px;">&nbsp;</td>
                            
                            <td class="GridRow2B" style="width: 100px;">Department</td>
                            <td class="GridRow2B" style="width: 80px;">&nbsp;</td>
                            <td class="GridRow2B" style="width: 20px;">&nbsp;</td>
                            
                            <td class="GridRow2B" style="width: 70px;">Employee</td>
                            <td class="GridRow2B" style="width: 70px;">&nbsp;</td>
                            <td class="GridRow2B" style="width: 60px;">&nbsp;</td>
                        </tr>
                        <tr style="height: 30px; vertical-align: middle;">
                            <td colspan="3" style="white-space: nowrap; overflow: hidden;">
                                <asp:TextBox ID="lblPrHotel" runat="server" CssClass="TextBox" ReadOnly="true" style="text-overflow: ellipsis;"/>
                            </td>
                            <td>&nbsp;</td>
                            
                            <td colspan="2">
                                <asp:TextBox ID="lblPrTourOp" runat="server" CssClass="TextBox" ReadOnly="true" style="text-overflow: ellipsis;"/>
                            </td>
                            <td>&nbsp;</td>
                            
                            <td>
                                <uc:InputDateControl ID="ctr_transDate" runat="server" />
                            </td>
                            <td>&nbsp;</td>
                            
                            <td colspan="3">
                                <asp:DropDownList ID="ddlDep" runat="server" CssClass="TextBox" />
                                <asp:CascadingDropDown ID="exDep" runat="server" 
                                    TargetControlID="ddlDep" Category="DepID" 
                                    ServicePath="~/DepEmp.asmx"
                                    ServiceMethod="GetDepID"
                                    UseContextKey="true"
                                    ContextKey=""
                                    />
                            </td>
                            
                            <td colspan="3">
                                <asp:DropDownList ID="ddlEmp" runat="server" CssClass="TextBox" />
                                <asp:CascadingDropDown ID="exEmp" runat="server" 
                                    ParentControlID="ddlDep"
                                    TargetControlID="ddlEmp" Category="EmpID" 
                                    ServicePath="~/DepEmp.asmx"
                                    ServiceMethod="GetEmpID" />
                            </td>
                        </tr>
                    </table>
                    </div>
                    
                    <asp:DataList ID="dsBookings" runat="server" DataSourceID="dsProration">
                        <HeaderTemplate>
                            <table cellpadding="0" cellspacing="0">
                            <tr style="height: 30px; font-weight: bold;">
                                <td class="GridRow2B" style="width: 100px;">Invoice</td>
                                <td class="GridRow2B" style="width: 90px;  text-align: center;">Bk.Num</td>
                                <td class="GridRow2B" style="width: 80px;  text-align: center;">Bk.Date</td>
                                <td class="GridRow2B" style="width: 80px;  text-align: center;">Check In</td>
                                <td class="GridRow2B" style="width: 80px;  text-align: center;">CheckOut</td>
                                <td class="GridRow2B" style="width: 60px;  text-align: center;">Room</td>
                                <td class="GridRow2B" style="width: 150px;">Guest</td>
                                <td class="GridRow2B" style="width: 70px;  text-align: center;">Amount</td>
                                <td class="GridRow2B" style="width: 70px;  text-align: center;">Balance</td>
                                <td class="GridRow2B" style="width: 20px;  text-align: right; ">&nbsp;</td>
                                <td class="GridRow2B" style="width: 80px;  text-align: center;">Apply</td>
                                <td class="GridRow2B" style="width: 20px;  text-align: left;  ">&nbsp;</td>
                                <td class="GridRow2B" style="width: 80px;  text-align: center;">Pay mode</td>
                            </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td class="GridRowClear">
                                    <asp:HiddenField ID="hfFtID" runat="server" Value='<%# Eval("DocID") %>'/>
                                    <asp:HiddenField ID="hfDetailID" runat="server" Value='<%# Eval("DetailID") %>'/>
                                    <%#Eval("DocCode")%>&nbsp;<%#Eval("DocNumber")%>
                                </td>
                                <td class="GridRowClear" style="text-align: center;"><%#Eval("BookingVoucher")%></td>
                                <td class="GridRowClear" style="text-align: center;"><%#Eval("BookingDate", "{0:d}")%></td>
                                <td class="GridRowClear" style="text-align: center;"><%#Eval("CheckIn", "{0:d}")%></td>
                                <td class="GridRowClear" style="text-align: center;"><%#Eval("CheckOut", "{0:d}")%></td>
                                <td class="GridRowClear" style="text-align: center;"><%#Eval("RoomTypeId")%></td>
                                <td class="GridRowClear"><%#Eval("DetText")%></td>
                                <td class="GridRowClear" style="text-align: right;"><%#Eval("Amount", "{0:N2}")%></td>
                                <td class="GridRowClear" style="text-align: right;"><%#Eval("stayBalance", "{0:N2}")%></td>
                                <td class="GridRowClear" style="width: 20px;  text-align: right; ">
                                    <asp:ImageButton ID="btSetAmount" runat="server" ImageUrl="~/Images/right_one_red.png" />
                                </td>
                                <td class="GridRowClear" style="width: 80px;  text-align: center;">
                                    <asp:TextBox ID="txt_detailAmount" runat="server" CssClass="TextBox" style="text-align: right;" 
                                        Text="0.00" Width="75px" />
                                    <asp:CompareValidator ID="dec_txt_detailAmount" runat="server" Display="None" 
                                        ErrorMessage="Input a valid amount (group separator is not allowed)!" 
                                        Operator="DataTypeCheck" Type="Double"
                                        ControlToValidate="txt_detailAmount"/>
                                    <asp:ValidatorCalloutExtender ID="ca_dec_txt_detailAmount" runat="server" 
                                        TargetControlID="dec_txt_detailAmount" />
                                    <asp:RequiredFieldValidator ID="req_txt_detailAmount" runat="server" Display="None"
                                        ErrorMessage="Required field"
                                        ControlToValidate="txt_detailAmount" />
                                    <asp:ValidatorCalloutExtender ID="ca_req_txt_detailAmount" runat="server" 
                                        TargetControlID="req_txt_detailAmount" />
                                    <asp:RangeValidator ID="rng_txt_detailAmount" runat="server" Display="None" 
                                        ControlToValidate="txt_detailAmount" Type="Double" 
                                        MinimumValue="0" MaximumValue='<%# ProLimit(Eval("stayBalance")) %>' 
                                        ErrorMessage="Amount is out of range!" />
                                    <asp:ValidatorCalloutExtender ID="ca_rng_txt_detailAmount" runat="server" 
                                        TargetControlID="rng_txt_detailAmount" />
                                </td>
                                <td class="GridRowClear" style="width: 20px;  text-align: left;  ">
                                    <asp:ImageButton ID="btResetAmount" runat="server" ImageUrl="~/Images/cancel_big.gif" style="float: left;" />
                                </td>
                                <td class="GridRowClear">
                                    <asp:DropDownList ID="dlPayMode" runat="server" CssClass="TextBox" 
                                        DataSourceID="dsPayMode" DataTextField="PayModeID" DataValueField="PayModeID">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="1" class="GridRow1B" style="font-weight: bold; text-align: right;">
                                    <asp:Image ID="imgApp" runat="server" ImageUrl="~/Images/Actions-flag-icon.png" style="display: none; float: left;" />
                                    Reference&nbsp;
                                </td>
                                <td colspan="12" class="GridRow1B">
                                    <asp:HiddenField ID="hfPayMode" runat="server" />
                                    <asp:TextBox ID="txt_detailRef" runat="server" CssClass="TextBox" Text='<%# Eval("refText") %>' Width="900px" />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:DataList>

                    <a name="Bottom" href="#Top" ><img src="../Images/Collapse.gif" alt="top" style="margin-top: 10px;" /></a>
                    <asp:Button ID="btnApply" runat="server" SkinID="skBtnBase" Text="Register and Apply" 
                        style="float: right; margin-top: 10px; margin-bottom: 5px;" OnClientClick="CreateClick(this)" />
                    <asp:Label ID="lblWaiting" runat="server" style="float: right; margin-top: 10px; margin-bottom: 5px; padding: 1px 5px; border: solid 1px; display: none;">
                        <asp:Image ID="imgWait" runat="server"  src="../Images/status_anim.gif"/>
                        <b>Registering and Applying ...</b>
                    </asp:Label>
                </td>
            </tr>
        </table>
        
        <asp:ObjectDataSource ID="dsPayMode" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="dsAccProrationTableAdapters.PayModeTableAdapter" ></asp:ObjectDataSource>
    </asp:Panel>
    <asp:Panel ID="pnlReport" runat="server" CssClass="Blue" Visible="false">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="Label2" runat="server" SkinID="skGridLabel" Text="Proration Application Result" />
                    <a name="resTop" href="#resBottom" style="float: right;"><img src="../Images/Expand.gif" style="padding: 5px 5px 0px 0px;" alt="bottom" /></a>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:DataList ID="dlReport" runat="server" DataSourceID="dsBatch">
                        <HeaderTemplate>
                            <table cellpadding="0" cellspacing="0">
                            <tr style="height: 30px; font-weight: bold;">
                                <td class="GridRow2B" style="width: 150px;">Operation Date</td>
                                <td class="GridRow2B" style="width: 100px;" >Debit Doc.</td>
                                <td class="GridRow2B" style="width: 100px; text-align: center;">Bk.Num</td>
                                <td class="GridRow2B" style="width: 200px;">Guest</td>
                                <td class="GridRow2B" style="width: 80px;" >Trans.</td>
                                <td class="GridRow2B" style="width: 85px;" >Trans.Date</td>
                                <td class="GridRow2B" style="width: 110px;" >Credit Doc.</td>
                                <td class="GridRow2B" style="width: 60px;" >Amount</td>
                            </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Panel ID="pnlOK" runat="server" Visible='<%# Not Eval("ErrorFlag") %>'>
                            <tr>
                                <td class="GridRow1B"><%#Eval("ProrationDate")%></td>
                                <td class="GridRow1B">
                                    <asp:HyperLink ID="hlDebit" runat="server" Text='<%# Eval("ftDocCode") & " " & Eval("ftDocNumber") %>' 
                                        NavigateUrl='<%# "~/Accounting/AccDocDetail.aspx?DocumentID=" & Eval("FtDocID") %>' />
                                </td>
                                <td class="GridRow1B" style="text-align: center;"><%#Eval("BookingVoucher")%></td>
                                <td class="GridRow1B"><%#Eval("DetText")%></td>
                                <td class="GridRow1B"><%#Eval("TransID")%></td>
                                <td class="GridRow1B"><%#Eval("TransDate", "{0:d}")%></td>
                                <td class="GridRow1B">
                                    <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("ncDocCode") & " " & Eval("ncDocNumber") %>' 
                                        NavigateUrl='<%# "~/Accounting/AccDocDetail.aspx?DocumentID=" & Eval("NcDocID") %>' />
                                </td>
                                <td class="GridRow1B" style="text-align: right; padding-right: 2px;"><%#Eval("TransAmount", "{0:N2}")%></td>
                            </tr>
                            </asp:Panel>
                            <asp:Panel ID="pnlErr" runat="server" Visible='<%# Eval("ErrorFlag") %>'>
                            <tr>
                                <td class="GridRowClear"><%#Eval("ProrationDate")%></td>
                                <td class="GridRowClear">
                                    <asp:HyperLink ID="HyperLink2" runat="server" Text='<%# Eval("ftDocCode") & " " & Eval("ftDocNumber") %>' 
                                        NavigateUrl='<%# "~/Accounting/AccDocDetail.aspx?DocumentID=" & Eval("FtDocID") %>' />
                                </td>
                                <td class="GridRowClear" style="text-align: center;"><%#Eval("BookingVoucher")%></td>
                                <td class="GridRowClear"><%#Eval("DetText")%></td>
                                <td class="GridRowClear"><%#Eval("TransID")%></td>
                                <td class="GridRowClear"><%#Eval("TransDate", "{0:d}")%></td>
                                <td class="GridRowClear">
                                    <asp:HyperLink ID="HyperLink3" runat="server" Text='<%# Eval("ncDocCode") & " " & Eval("ncDocNumber") %>' 
                                        NavigateUrl='<%# "~/Accounting/AccDocDetail.aspx?DocumentID=" & Eval("NcDocID") %>' />
                                </td>
                                <td class="GridRowClear" style="text-align: right; padding-right: 2px;"><%#Eval("TransAmount", "{0:N2}")%></td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="vertical-align: top; text-align: center; font-style: italic; color: Red;">Error:</td>
                                <td class="GridRow1B" colspan="7" style="color: Red; font-style: italic;" ><%#Eval("ErrorMsg")%></td>
                            </tr>
                            </asp:Panel>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:DataList>

                    <a name="resBottom" href="#resTop" ><img src="../Images/Collapse.gif" alt="top" style="margin-top: 10px;" /></a>
                    <asp:Button ID="btnNew" runat="server" SkinID="skBtnBase" Text="New Proration Application" 
                        style="float: right; margin: 10px 0px 5px 0px;" />
                    <asp:Button ID="btnPrint" runat="server" SkinID="skBtnBase" Text="Batch" style="float: right; margin: 10px 10px 5px 0px;" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:ObjectDataSource ID="dsProration" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="dsAccProrationTableAdapters.FilterAccProrationTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="hfUser" Name="UserName" PropertyName="Value" Type="String" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelID" PropertyName="SelectedHotel" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpID" PropertyName="SelectedTourOp" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlInvNum" Name="InvNumFrom" PropertyName="IntegerFrom" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlInvNum" Name="InvNumTo" PropertyName="IntegerTo" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlCheckIn" Name="ChkInFrom" PropertyName="DateFrom" Type="String" />
            <asp:ControlParameter ControlID="ctrlCheckIn" Name="ChkInTo" PropertyName="DateTo" Type="String" />
            <asp:ControlParameter ControlID="txtBkNum" Name="BkNumber" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="ctrlFolio" Name="FolioFrom" PropertyName="IntegerFrom" Type="Int64" />
            <asp:ControlParameter ControlID="ctrlFolio" Name="FolioTo" PropertyName="IntegerTo" Type="Int64" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsBatch" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="dsAccProrationTableAdapters.ReportProrationTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="hfProrationID" Name="ProrationID" PropertyName="Value" DbType="Guid" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsBatchReport" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        
        TypeName="dsAccProrationTableAdapters.SelectAccProrateBatchBookingTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="hfProrationID" Name="ProrationID" PropertyName="Value" DbType="Guid" />
        </SelectParameters>
    </asp:ObjectDataSource>

    
</asp:Content>

