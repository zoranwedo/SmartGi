<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="ProFormas.aspx.vb" Inherits="Invoices_ProFormas"  
	MaintainScrollPositionOnPostback="true"
    enableEventValidation="false" %>

<%--<%@ Register src="~/App_UserControls/HotelGroupHotelControl.ascx" tagname="HotelGroupHotelControl" tagprefix="uc" %>--%>
<%--<%@ Register src="~/App_UserControls/TourOpGroupMarketPayCondTourOpControl.ascx" tagname="TourOpGroupMarketPayCondTourOpControl" tagprefix="uc" %>--%>
<%@ Register src="~/App_UserControls/HotelExpanderControl.ascx" tagname="HotelExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/TourOpExpanderControl.ascx" tagname="TourOpExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/InputIntegerControl.ascx" tagname="InputIntegerControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/FromToIntegerControl.ascx" tagname="FromToIntegerControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/FromToDateControl.ascx" tagname="FromToDateControl" tagprefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Proformas (single)
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
                                        <asp:HyperLink ID="btMy" runat="server" CssClass="Button" Text="My Proformas"
                                            style="float:right; color: White; padding: 0px 10px 0px 10px; text-decoration: none;"
                                            NavigateUrl="~/Invoices/ProFormasGenerated.aspx" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="pnSearchPart" runat="server" style="padding-left: 8px;" DefaultButton="btnSearch">
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="GridRow1B" colspan="2" >
                                        <uc:HotelExpanderControl ID="ctrlHotel" runat="server" 
                                            LabelWidth="120px" ControlWidth="480px" 
                                            CollapsedDefailt="true"
                                            NoCCI="true" />
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
                                    <td class="GridRow1B" style="width: 120px;" >Pro Type</td>
                                    <td class="GridRow1B" style="width: 480px;">
                                        <asp:DropDownList ID="ddlInvType" runat="server" CssClass="TextBox">
                                            <asp:ListItem Value="">all </asp:ListItem>
                                            <asp:ListItem Selected="True" Value="0">Single</asp:ListItem>
                                            <asp:ListItem Value="1">Group</asp:ListItem>
                                        </asp:DropDownList>
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
                                    <td class="GridRow1B" style="width: 120px;" >Proforma Num</td>
                                    <td class="GridRow1B" style="width: 480px;" >
                                        <uc:FromToIntegerControl ID="ctrlInvNum" runat="server"
                                            MandatoryFrom="false"
                                            MandatoryTo="false" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Bk Number</td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtBkNum" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="wm_txtBkNum" runat="server" 
                                            TargetControlID="txtBkNum" WatermarkCssClass="WaterMark" 
                                            WatermarkText="Like Booking Number..." />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear">State</td>
                                    <td class="GridRowClear">
                                        <asp:DropDownList ID="ddlStates" runat="server" AppendDataBoundItems="True" CssClass="TextBox">
                                            <asp:ListItem Selected="True" Value="10">all states</asp:ListItem>
                                            <asp:ListItem Value="30">Active</asp:ListItem>
                                            <asp:ListItem Value="40">* Not Reviewed by CCI Flag</asp:ListItem>
                                            <asp:ListItem Value="50">* Reviewed by CCI Flag</asp:ListItem>
                                            <asp:ListItem Value="60">Cancelled</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="ComandRow2T" colspan="2" style="height: 30px; padding-top: 5px">
                                        <span style="float: left;">
                                            <asp:Button ID="linkNew" runat="server" Text="New ProForma" SkinID="skBtnBase" ToolTip="Create New ProForma" Visible="false" />
                                            <asp:Button ID="btFromRes" runat="server" SkinID="skBtnBase" Text="From Reseservations" CssClass="ButtonRed" Visible="false"/>
                                            <asp:Button ID="btMultiple" runat="server" SkinID="skBtnBase" Text="Multiple Proforma" CssClass="ButtonRed"/>
                                        </span>
                                        <asp:CheckBox ID="cbCancel" runat="server" Text="Include cancel" TextAlign="Left" />&nbsp;
                                        <asp:Button ID="btnSearch" runat="server" SkinID="skBtnFilter" />&nbsp;
                                        <asp:Button ID="btnClear" runat="server" SkinID="skBtnClear" />
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
    <div class="Blue" style="min-width: 1350px;">
        <asp:Panel runat="server" ID="pnlCnt" Visible="False">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td class="GridLabelBG">
                        <asp:Label ID="lbTitle" runat="server" SkinID="skGridLabel" Text="Proformas" Height="26px" />
                    </td>
                </tr>
                <tr>
                    <td class="GridBorder">
                        <asp:Panel ID="pnlScroll" runat="server" ScrollBars="Vertical" Height="600">
                        <asp:GridView ID="gvSearch" runat="server" AutoGenerateColumns="False" DataKeyNames="InvoiceID"
                            DataSourceID="dsFilteredInvoices" SkinID="skGridView" AllowPaging="False" EnableViewState="True">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImageButton1" runat="server" 
                                            ImageUrl="~/Images/Leads.gif" 
                                            CausesValidation="False"
                                            CommandName="Details" 
                                            CommandArgument='<%# Eval("InvoiceID") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="30px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="(ID)" SortExpression="InvoiceID">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink1" runat="server" 
                                            NavigateUrl='<%# "~/Invoices/ProformaForm.aspx?InvoiceID=" & Eval("InvoiceID") %>'
                                            Text='<%# Eval("InvoiceID","({0})") %>' Visible='<%# Eval("InvSource") = "SH" %>' />
                                        <asp:HyperLink ID="HyperLink2" runat="server" 
                                            NavigateUrl='<%# "~/Invoices/ProformaFormSX.aspx?InvoiceID=" & Eval("InvoiceID") %>'
                                            Text='<%# Eval("InvoiceID","({0})") %>' Visible='<%# Eval("InvSource") = "SX" %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="50px" HorizontalAlign="Right" />
                                    <HeaderStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="InvNumber" HeaderText="Num" SortExpression="InvNumber">
                                    <ItemStyle Width="50px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="InvDate" DataFormatString="{0:d}" HeaderText="ProDate" HtmlEncode="False" SortExpression="InvDate">
                                    <ItemStyle Width="80px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="InvSource" HeaderText="Source" SortExpression="InvSource">
                                    <ItemStyle Width="45px" HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ResGroup" HeaderText="ResGroup" SortExpression="ResGroup" >
                                    <ItemStyle Width="100px" Wrap="false" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Hotel" HeaderText="Hotel" SortExpression="Hotel">
                                    <ItemStyle Width="300px" Wrap="false" />
                                </asp:BoundField>
                                <asp:BoundField DataField="TourOp" HeaderText="TourOp" SortExpression="TourOp">
                                    <ItemStyle Width="300px" Wrap="false" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CheckIn" DataFormatString="{0:d}" HeaderText="CheckIn" HtmlEncode="False" SortExpression="CheckIn">
                                    <ItemStyle Width="80px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CheckOut" DataFormatString="{0:d}" HeaderText="CheckOut" HtmlEncode="False" SortExpression="CheckOut">
                                    <ItemStyle Width="80px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Nights" HeaderText="Nght" ReadOnly="True" SortExpression="Nights" />
                                <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" >
                                    <ItemStyle Wrap="false" Width="90px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="StateDisp" HeaderText="State" SortExpression="StateDisp" >
                                    <ItemStyle Wrap="false" Width="150px" />
                                </asp:BoundField>
                                 <asp:CheckBoxField DataField="CCIReview" HeaderText="CCIRev" SortExpression="CCIReview" />
                            </Columns>
                            <EmptyDataTemplate>
                            <div style="width:1000px">
                                No invoices found for search criteria. Try change filters.
                            </div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
    <asp:ObjectDataSource ID="dsFilteredInvoices" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataPRO" 
        TypeName="dsCRSTableAdapters.FilterUserInvoiceNewTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelID" PropertyName="SelectedHotel" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelGroupID" PropertyName="SelectedHotelGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpID" PropertyName="SelectedTourOp" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpGroupID" PropertyName="SelectedTourOpGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="MarketID" PropertyName="SelectedMarket" Type="String" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="PayCondID" PropertyName="SelectedPayCond" Type="String" />
            <asp:Parameter DefaultValue="PRO" Name="InvDoc" Type="String" />
            <asp:ControlParameter ControlID="ddlInvType" Name="InvType" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlInvNum" Name="InvNumFrom" PropertyName="IntegerFrom" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlInvNum" Name="InvNumTo" PropertyName="IntegerTo" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlCheckIn" Name="ChkInFrom" PropertyName="DateFrom" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlCheckIn" Name="ChkInTo" PropertyName="DateTo" Type="DateTime" />
            <asp:ControlParameter ControlID="txtBkNum" Name="BkNumber" PropertyName="Text" Type="String" />
            <asp:Parameter DefaultValue="" Name="State" Type="Int32" />
            <asp:ControlParameter ControlID="ddlStates" Name="StateSet" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="cbCancel" Name="IncludeCancel" PropertyName="Checked" Type="Boolean" />
            <asp:Parameter DefaultValue="" Name="IncludeDelivered" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
