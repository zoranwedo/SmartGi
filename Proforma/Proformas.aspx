<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="Proformas.aspx.vb" Inherits="Proforma_Proformas"  
	MaintainScrollPositionOnPostback="true"
    enableEventValidation="false" %>

<%@ Register src="~/App_UserControls/InputIntegerControl.ascx" tagname="InputIntegerControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/InputDateControl.ascx" tagname="InputDateControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/HotelExpanderControl.ascx" tagname="HotelExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/TourOpExpanderControl.ascx" tagname="TourOpExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/FromToDateControl.ascx" tagname="FromToDateControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/FromToIntegerControl.ascx" tagname="FromToIntegerControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/MessagePop.ascx" tagname="MessagePop" tagprefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Proformas
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" runat="Server">
    <div class="Green">
        <asp:CollapsiblePanelExtender ID="cpeSearch" runat="server" TargetControlID="pnSearch"
            CollapseControlID="lblFilter" ExpandControlID="lblFilter" ImageControlID="imgExpander"
            CollapsedImage="~/Images/expand_.png" ExpandedImage="~/Images/collapse_.png"
            Collapsed="False">
        </asp:CollapsiblePanelExtender>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG" style="width: 600px;">
                    <asp:Panel ID="pnSearchHead" runat="server" Width="600px">
                        <asp:Label ID="lblFilter" runat="server" SkinID="skGridLabel">Search/Filter &nbsp;
                            <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />&nbsp; 
                        </asp:Label>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px">
                    <asp:Panel ID="pnSearch" runat="server">
                        <asp:Panel ID="pnEditPart" runat="server" style="padding-left: 8px;" DefaultButton="btnGoTo">
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="GridRow2B" style="width: 120px; text-align: left;">Proforma ID</td>
                                    <td class="GridRow2B" style="width: 70px" align="left">
                                        <uc:InputIntegerControl ID="txtInvID" runat="server" Mandatory="false" />
                                    </td>
                                    <td class="GridRow2B" style="width: 10px;">&nbsp;</td>
                                    <td class="GridRow2B" style="width: 400px; padding-top: 5px; height: 30px;">
                                        <asp:Button ID="btnGoTo" runat="server" SkinID="skBtnSerach" Style="margin-bottom: 5px;" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="pnSearchPart" runat="server" style="padding-left: 8px;" DefaultButton="btnSearch">
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="GridRow1B" style="width: 120px;" >Proformas</td>
                                    <td class="GridRow1B" style="width: 480px;" >
                                        <asp:RadioButtonList ID="rbType" runat="server" RepeatLayout="Table" RepeatDirection="Horizontal" AutoPostBack="true">
                                            <asp:ListItem Value="0" Selected="True">All</asp:ListItem>
                                            <asp:ListItem Value="1">Single</asp:ListItem>
                                            <asp:ListItem Value="2">Group</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" colspan="2" >
                                        <uc:TourOpExpanderControl ID="ctrlTourOp" runat="server" 
                                            LabelWidth="120px" ControlWidth="480px"
                                            CollapsedDefailt="false"
                                            NoLocal="true" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" colspan="2" >
                                        <uc:HotelExpanderControl ID="ctrlHotel" runat="server" 
                                            LabelWidth="120px" ControlWidth="480px" 
                                            CollapsedDefailt="false"
                                            NoCCI="false" />
                                    </td>
                                </tr>
                                <asp:Panel ID="pnlGroup" runat="server">
                                <tr>
                                    <td class="GridRow1B" >Group Code/Name</td>
                                    <td class="GridRow1B" >
                                            <asp:TextBox ID="txtGroup" runat="server" CssClass="TextBox" />
                                            <asp:TextBoxWatermarkExtender ID="wmGroup" runat="server" TargetControlID="txtGroup"
                                                WatermarkCssClass="WaterMark" WatermarkText="Like Group Code or Name" />
                                    </td>
                                </tr>
                                </asp:Panel>
                                <tr>
                                    <td class="GridRow1B" style="width: 120px;" >Proforma Num</td>
                                    <td class="GridRow1B" style="width: 480px;" >
                                        <uc:FromToIntegerControl ID="ctrlNum" runat="server"
                                            MandatoryFrom="false"
                                            MandatoryTo="false" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" >Check In</td>
                                    <td class="GridRow1B" >
                                        <uc:FromToDateControl ID="ctrlCheckIn" runat="server"
                                            MandatoryFrom="false"
                                            MandatoryTo="false" />
                                    </td>
                                </tr>
                                    <tr>
                                        <td class="GridRow1B" >Check Out</td>
                                        <td class="GridRow1B" >
                                            <uc:FromToDateControl ID="ctrlCheckOut" runat="server"
                                                MandatoryFrom="false"
                                                MandatoryTo="false" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="GridRow1B">Booking Date</td>
                                        <td class="GridRow1B">
                                            <uc:InputDateControl ID="ctrlBkDate" runat="server" Mandatory="false" DefaultNow="false" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="GridRow1B">Booking Number</td>
                                        <td class="GridRow1B">
                                            <asp:TextBox ID="txtBkNumber" runat="server" CssClass="TextBox"/>
                                        </td>
                                    </tr>
                                <tr>
                                    <td class="GridRowClear">Status</td>
                                    <td class="GridRowClear">
                                        <asp:DropDownList ID="ddlStates" runat="server" AppendDataBoundItems="True" 
                                            CssClass="TextBox" DataSourceID="dsStates" DataTextField="InvDocStateText" 
                                            DataValueField="InvDocStateID">
                                            <asp:ListItem Selected="True" Value="">All</asp:ListItem>
                                            <asp:ListItem Value="100">*Created/Modified</asp:ListItem>
                                            <asp:ListItem Value="200">*All Updated</asp:ListItem>
                                            <asp:ListItem Value="300">*Not Reviewed</asp:ListItem>
                                            <asp:ListItem Value="400">*Not Delivered</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsStates" runat="server" 
                                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                            TypeName="dsProformaSearchTableAdapters.InvDocumentStateTableAdapter"></asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="ComandRow2T" colspan="2" style="height: 30px; padding-top: 5px">
                                        <span class="Red" style="float: left; border: solid 1px; padding: 4px;">
                                            <b>New Proforma: </b>
                                            <asp:Button ID="btSingle" runat="server" Text="Single" SkinID="skBtnBase" CssClass="ButtonRed" />
                                            <asp:Button ID="btGroup" runat="server" Text="Group" SkinID="skBtnBase" CssClass="ButtonRed" />
                                            <asp:Button ID="btGroupMulti" runat="server" Text="Multiple Group" SkinID="skBtnBase" CssClass="ButtonRed" />
                                        </span>
                                        <asp:Button ID="btnSearch" runat="server" SkinID="skBtnFilter" style="margin-top: 7px; margin-right: 7px;" />
                                        <asp:Button ID="btnClear" runat="server" SkinID="skBtnClear" style="margin-top: 7px;" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div class="Blue">
        <asp:Panel runat="server" ID="pnlCnt" Visible="False">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td class="GridLabelBG">
                        <asp:Label ID="lbTitle" runat="server" SkinID="skGridLabel" Text="Proformas" Height="26px" />
                        <asp:LinkButton ID="btPrint" runat="server" style="float:right; color: White; padding: 4px; font-weight: bold;">
                            Export to excel
                        </asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="GridBorder">
                        <asp:Panel ID="pnlScroll" runat="server" ScrollBars="Auto" style="max-height: 600px; padding: 2px 4px;">
                            <asp:Repeater ID="rptProforma" runat="server" DataSourceID="dsFiltered" >
                                <HeaderTemplate>
                                    <table cellpadding="0" cellspacing="0">
                                        <tr style="font-weight: bold;">
                                            <td class="GridRow1B" style="width: 30px;">&nbsp;</td>
                                            <td class="GridRow1B" style="width: 50px;">(ID)</td>
                                            <td class="GridRow1B" style="width: 200px; text-align: center;">Proforma Number</td>
                                            <td class="GridRow1B" style="width: 350px; text-align: center;">Hotels</td>
                                            <td class="GridRow1B" style="width: 150px; text-align: center;">Check In</td>
                                            <td class="GridRow1B" style="width: 150px; text-align: center;">Check Out</td>
                                            <td class="GridRow1B" style="width: 150px; text-align: center;">
                                            <asp:Label ID="minmax" runat="server" Text="Stay period" ToolTip="Check In min - Check Out max" />
                                            </td>
                                            <td class="GridRow1B" style="width: 150px; text-align: center;">Status</td>
                                            <td class="GridRow1B" style="width: 100px; text-align: center;">Delivery Date</td>
                                        </tr>
                                        <tr><td colspan="9" style="height:2px;"></td></tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Panel ID="pnlHotel" runat="server" Visible='<%# Eval("rnk")=1 %>'>
                                        <tr style="font-weight: bold;">
                                            <td class="SelectRow1T" colspan="9" style="text-align: left;">
                                                <%#Eval("TourOp")%>
                                            </td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="Panel1" runat="server" Visible='<%# Eval("rnkh")=1 %>'>
                                        <tr style="padding-top: 1px; padding-bottom: 2px;">
                                            <td class="GridRow1T" style="text-align: center;padding-top: 1px; padding-bottom: 3px;">
                                                <asp:HyperLink ID="HyperLink1" runat="server" 
                                                    NavigateUrl='<%# "~/Proforma/ProformDetails.aspx?ProformaID=" & Eval("InvDocID") %>'>
                                                    <asp:Image ID="ibOpen" runat="server" ImageUrl="~/Images/Leads.gif" />
                                                </asp:HyperLink>
                                            </td>
                                            <td class="GridRow1T" style="text-align: left;padding-top: 1px; padding-bottom: 3px;">
                                                <asp:HyperLink ID="HyperLink2" runat="server" Text='<%# Eval("InvDocID","({0})") %>' 
                                                    NavigateUrl='<%# "~/Proforma/ProformDetails.aspx?ProformaID=" & Eval("InvDocID") %>' />
                                            </td>
                                            <td class="GridRow1T" style="text-align: left;padding-top: 1px; padding-bottom: 3px;">
                                                <asp:HyperLink ID="HyperLink3" runat="server" Text='<%# Eval("InvDocNum") %>' 
                                                    NavigateUrl='<%# "~/Proforma/ProformDetails.aspx?ProformaID=" & Eval("InvDocID") %>' />
                                            </td>
                                            <td class="GridRow1T" style="text-align: left;padding-top: 1px; padding-bottom: 3px;">
                                                <%#Eval("Hotel")%>
                                            </td>
                                            <td class="GridRow1T" style="text-align: center;padding-top: 1px; padding-bottom: 3px;">
                                                <asp:Label ID="CheckInLabel" runat="server" Visible='<%# Eval("IsGroup") %>'
                                                    Text='<%# GetCheckDates(Eval("CheckInFrom","{0:d}"), Eval("CheckInTo","{0:d}")) %>' />
                                                <asp:Label ID="Label4" runat="server" Visible='<%# Not Eval("IsGroup") %>'
                                                    Text='<%# Eval("CheckInFrom","{0:d}") %>' />
                                            </td>
                                            <td class="GridRow1T" style="text-align: center;padding-top: 1px; padding-bottom: 3px;">
                                                <asp:Label ID="Label2" runat="server" 
                                                    Text='<%# GetCheckDates(Eval("CheckOutFrom","{0:d}"), Eval("CheckOutTo","{0:d}")) %>' />
                                            </td>
                                            <td class="GridRow1T" style="text-align: center;padding-top: 1px; padding-bottom: 3px;">
                                                <asp:Label ID="Label5" runat="server" 
                                                    Text='<%# GetCheckDates(Eval("MinCheckIn","{0:d}"), Eval("MaxCheckOut","{0:d}")) %>' />
                                            </td>
                                            <td class="GridRow1T" style="text-align: center; padding-top: 1px; padding-bottom: 3px;">
                                                <%#Eval("InvDocStateDesc")%>
                                            </td>
                                            <td class="GridRow1T" style="text-align: center; padding-top: 1px; padding-bottom: 3px;">
                                                <%#Eval("DeliveryDate", "{0:d}")%>
                                            </td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="Panel2" runat="server" Visible='<%# Eval("rnkh")>1 %>'>
                                        <tr>
                                            <td class="GridRowClear" style="text-align: left;">&nbsp</td>
                                            <td class="GridRowClear" style="text-align: left;">&nbsp</td>
                                            <td class="GridRowClear" style="text-align: left;">&nbsp</td>
                                            <td class="GridRowClear" style="text-align: left;"><%#Eval("Hotel")%></td>
                                            <td class="GridRowClear" style="text-align: left;">&nbsp</td>
                                            <td class="GridRowClear" style="text-align: left;">&nbsp</td>
                                            <td class="GridRowClear" style="text-align: left;">&nbsp</td>
                                            <td class="GridRowClear" style="text-align: left;">&nbsp</td>
                                            <td class="GridRowClear" style="text-align: left;">&nbsp</td>
                                        </tr>
                                    </asp:Panel>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:Panel ID="pnlFootNoData" runat="server" Visible='<%# rptProforma.Items.Count < 1 %>'>
                                        <tr>
                                            <td class="PreRowHeadSel" style="height: 25px;" colspan="9">
                                                Proforma has no reservations at the moment
                                            </td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="Panel3" runat="server" Visible='<%# rptProforma.Items.Count > 0 %>'>
                                        <tr>
                                            <td class="GridRow2B" colspan="9"></td>
                                        </tr>
                                    </asp:Panel>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
            <uc:MessagePop ID="msgPop" runat="server" Title="Proforma Production" />
        </asp:Panel>
    </div>
    <asp:ObjectDataSource ID="dsFiltered" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="dsProformaSearchTableAdapters.InvDocSearchTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelID" PropertyName="SelectedHotel" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelGroupID" PropertyName="SelectedHotelGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpID" PropertyName="SelectedTourOp" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpGroupID" PropertyName="SelectedTourOpGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="MarketID" PropertyName="SelectedMarket" Type="String" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="PayCondID" PropertyName="SelectedPayCond" Type="String" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpKind" PropertyName="SelectedTourOpKind" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlNum" Name="NumberFrom" PropertyName="IntegerFrom" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlNum" Name="NumberTo" PropertyName="IntegerTo" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlCheckIn" Name="CheckInFrom" PropertyName="DateFrom" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlCheckIn" Name="CheckInTo" PropertyName="DateTo" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlCheckOut" Name="CheckOutFrom" PropertyName="DateFrom" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlCheckOut" Name="CheckOutTo" PropertyName="DateTo" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlBkDate" Name="BkDate" PropertyName="DateValue" Type="DateTime" />
            <asp:ControlParameter ControlID="txtBkNumber" Name="BkNumber" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="rbType" Name="ProformaType" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="txtGroup" Name="GroupName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="ddlStates" Name="State" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
