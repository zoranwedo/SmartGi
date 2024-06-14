<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="Invoices.aspx.vb" Inherits="Invoices_Invoices"  
	MaintainScrollPositionOnPostback="true"
    enableEventValidation="false" %>

<%@ Register src="~/App_UserControls/HotelExpanderControl.ascx" tagname="HotelExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/TourOpExpanderControl.ascx" tagname="TourOpExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/InputIntegerControl.ascx" tagname="InputIntegerControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/FromToIntegerControl.ascx" tagname="FromToIntegerControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/FromToDateControl.ascx" tagname="FromToDateControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/MessagePop.ascx" tagname="MessagePop" tagprefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Invoices
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
                    <asp:Panel ID="pnSearchHead" runat="server" Width="100%">
                        <asp:Label ID="lblFilter" runat="server" SkinID="skGridLabel">Search/Filter &nbsp;
                            <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />
                            &nbsp; </asp:Label>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px">
                    <asp:Panel ID="pnSearch" runat="server">
                        <asp:Panel ID="pnEditPart" runat="server" style="padding-left: 8px;" DefaultButton="btnGoTo">
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="GridRow2B" style="width: 120px; text-align: left;">Invoice ID</td>
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
                                    <td class="GridRow1B" colspan="2" >
                                        <uc:HotelExpanderControl ID="ctrlHotel" runat="server" 
                                            LabelWidth="120px" ControlWidth="480px" 
                                            CollapsedDefailt="false"
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
                                    <td class="GridRow1B" style="width: 120px;" >Inv Type</td>
                                    <td class="GridRow1B" style="width: 480px;">
                                        <asp:DropDownList ID="ddlInvType" runat="server" CssClass="TextBox">
                                            <asp:ListItem Selected="True" Value="">all </asp:ListItem>
                                            <asp:ListItem Value="0">Stay</asp:ListItem>
                                            <asp:ListItem Value="1">Group</asp:ListItem>
                                            <asp:ListItem Value="2">Cancel</asp:ListItem>
                                            <asp:ListItem Value="3">No-Show</asp:ListItem>
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
                                    <td class="GridRow1B" style="width: 120px;" >Check Out</td>
                                    <td class="GridRow1B" style="width: 480px;" >
                                        <uc:FromToDateControl ID="ctrlCheckOut" runat="server"
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
                                    <td class="GridRow1B">Bk Number</td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtBkNum" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="wm_txtBkNum" runat="server"
                                            TargetControlID="txtBkNum" WatermarkCssClass="WaterMark" 
                                            WatermarkText="Like Booking Number..." />
                                    </td>
                                </tr>         
                                <tr>
                                    <td class="GridRow1B">Group Name/Code</td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="txtGroup" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="wm_txtGroup" runat="server"
                                            TargetControlID="txtGroup" WatermarkCssClass="WaterMark" 
                                            WatermarkText="Like Group Name or Code..." />
                                    </td>
                                </tr>         
                                <tr>
                                    <td class="GridRowClear">States</td>
                                    <td class="GridRowClear" >
                                        <asp:DropDownList ID="ddlStates" runat="server" CssClass="TextBox"
                                            DataSourceID="dsInvState" DataTextField="InvoiceState" DataValueField="InvoiceStateID" 
                                            AppendDataBoundItems="True" >
                                            <asp:ListItem Selected="True" Value="10">all states</asp:ListItem>
                                            <asp:ListItem Value="20">* Hotel States</asp:ListItem>
                                            <asp:ListItem Value="30">* CCI States</asp:ListItem>
                                            <asp:ListItem Value="40">* Not Reviewed by CCI Flag</asp:ListItem>
                                            <asp:ListItem Value="50">* Reviewed by CCI Flag</asp:ListItem>
                                            <asp:ListItem Value="60">* Canceled States</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsInvState" runat="server"
                                            TypeName="dsInvoicesTableAdapters.InvoiceStateTableAdapter" 
                                            SelectMethod="GetData" >
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="ComandRow2T" colspan="2" style="height: 30px; padding-top: 5px">
                                        <span style="float: left;">
                                            <asp:Button ID="linkNew" runat="server" Text="New Invoice" SkinID="skBtnBase" CssClass="ButtonRed" />
                                        </span>
                                        <asp:CheckBox ID="cbDelivered" runat="server" Text="Include Delivered" TextAlign="Left" Checked="true" />&nbsp;
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
                        <asp:Label ID="lbTitle" runat="server" SkinID="skGridLabel" Text="Invoices" Height="26px" />
                        <asp:CheckBox ID="cbHotel" runat="server" Text="Hotel" ForeColor="White" Height="26px" AutoPostBack="True" />
                        <asp:LinkButton ID="btReport" runat="server" Text="Export to Excel"
                            style="float:right; color: White; padding: 4px; font-weight: bold;" />
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
                                            CommandName='<%# "Details" & Eval("InvSource") %>'
                                            CommandArgument='<%# Eval("InvoiceID") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="30px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="(ID)" SortExpression="InvoiceID">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink1" runat="server" 
                                            NavigateUrl='<%# "~/Invoices/InvoiceForm.aspx?InvoiceID=" & Eval("InvoiceID") %>' 
                                            Text='<%# Eval("InvoiceID","({0})") %>' Visible='<%# Eval("InvSource") = "SH" %>' />
                                         <asp:HyperLink ID="HyperLink2" runat="server" 
                                            NavigateUrl='<%# "~/Invoices/InvoiceFormSX.aspx?InvoiceID=" & Eval("InvoiceID") %>' 
                                            Text='<%# Eval("InvoiceID","({0})") %>' Visible='<%# Eval("InvSource") = "SX" Or Eval("InvSource") = "OP" %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="50px" HorizontalAlign="Right" />
                                    <HeaderStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="InvNumber" HeaderText="Num" SortExpression="InvNumber">
                                    <ItemStyle Width="50px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="InvDate" DataFormatString="{0:d}" HeaderText="InvDate" HtmlEncode="False" SortExpression="InvDate">
                                    <ItemStyle Width="80px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="InvSource" HeaderText="Source" SortExpression="InvSource">
                                    <ItemStyle Width="45px" HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="TypeDisp" HeaderText="InvType" SortExpression="TypeDisp" >
                                    <ItemStyle Width="80px" Wrap="false" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ResGroup" HeaderText="ResGroup" SortExpression="ResGroup" >
                                    <ItemStyle Width="100px" Wrap="false" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Hotel" HeaderText="Hotel" SortExpression="Hotel">
                                    <ItemStyle Width="300px" Wrap="false" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="TourOp" SortExpression="TourOp">
                                    <ItemTemplate>
                                        <asp:Label ID="glblTourOp" runat="server" Text='<%# Eval("TourOp") %>' Visible='<%# Eval("Active") %>' />
                                        <asp:Label ID="glblTourOpI" runat="server" Text='<%# Eval("TourOp") %>' Visible='<%# Not Eval("Active") %>' Font-Strikeout="True" ForeColor="DarkGray" />
                                    </ItemTemplate>
                                    <ItemStyle Width="300px" Wrap="false" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="CheckIn" DataFormatString="{0:d}" HeaderText="CheckIn" HtmlEncode="False" SortExpression="CheckIn">
                                    <ItemStyle Width="80px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CheckOut" DataFormatString="{0:d}" HeaderText="CheckOut" HtmlEncode="False" SortExpression="CheckOut">
                                    <ItemStyle Width="80px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Nights" HeaderText="Nght" ReadOnly="True" SortExpression="Nights" />
                                <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Amount","{0:N2}") %>' Visible="<%# cbHotel.Checked=false %>" />
                                        <asp:Label ID="Label21" runat="server" Text='<%# Eval("HAmount","{0:N2}") %>' Visible="<%# cbHotel.Checked %>" />
                                    </ItemTemplate>
                                    <ItemStyle Wrap="false" Width="90px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="StateDisp" HeaderText="State" SortExpression="StateDisp" >
                                    <ItemStyle Wrap="false" Width="150px" />
                                </asp:BoundField>
                                 <asp:CheckBoxField DataField="CCIReview" HeaderText="CCIRev" SortExpression="CCIReview" />
                                 <asp:CheckBoxField DataField="Delivered" HeaderText="Deliv." SortExpression="Delivered" />
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
        <uc:MessagePop ID="msgPop" runat="server" Title="Account Statement Report" />
    </div>
    <asp:ObjectDataSource ID="dsFilteredInvoices" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" 
        TypeName="dsCRSTableAdapters.FilterUserInvoiceRGTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelID" PropertyName="SelectedHotel" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelGroupID" PropertyName="SelectedHotelGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpID" PropertyName="SelectedTourOp" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpGroupID" PropertyName="SelectedTourOpGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpKindID" PropertyName="SelectedTourOpKind" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="MarketID" PropertyName="SelectedMarket" Type="String" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="PayCondID" PropertyName="SelectedPayCond" Type="String" />
            <asp:Parameter DefaultValue="INV" Name="InvDoc" Type="String" />
            <asp:ControlParameter ControlID="ddlInvType" Name="InvType" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlInvNum" Name="InvNumFrom" PropertyName="IntegerFrom" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlInvNum" Name="InvNumTo" PropertyName="IntegerTo" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlCheckIn" Name="ChkInFrom" PropertyName="DateFrom" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlCheckIn" Name="ChkInTo" PropertyName="DateTo" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlCheckOut" Name="ChkOutFrom" PropertyName="DateFrom" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlCheckOut" Name="ChkOutTo" PropertyName="DateTo" Type="DateTime" />
            <asp:ControlParameter ControlID="txtBkNum" Name="BkNumber" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtGroup" Name="Group" PropertyName="Text" Type="String" />
            <asp:Parameter DefaultValue="" Name="State" Type="Int32" />
            <asp:ControlParameter ControlID="ddlStates" Name="StateSet" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="cbCancel" Name="IncludeCancel" PropertyName="Checked" Type="Boolean" />
            <asp:ControlParameter ControlID="cbDelivered" Name="IncludeDelivered" PropertyName="Checked" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
