<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="AccRepStatement_Old.aspx.vb" Inherits="Reports_Accounting_AccRepStatement_Old" %>

<%@ Register Assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
    Namespace="System.Web.UI.WebControls" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Account Statement
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
                <asp:Panel ID="pnSearchHead" runat="server" Width="600px">
                    <td class="GridLabelBG" style="width: 600px;">
                        <asp:Label ID="lblFilter" runat="server" SkinID="skGridLabel">Search/Filter &nbsp;
                            <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />
                            &nbsp; </asp:Label>
                        <asp:HyperLink ID="btSwitchReport" runat="server"
                            style="float:right; color: White; padding: 4px; font-weight: bold;"
                            NavigateUrl="~/Reports/Accounting/AccRepStatement.aspx">
                            New Account of Statement
                        </asp:HyperLink>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px">
                    <asp:Panel ID="pnSearch" runat="server" Style="width: 600px" DefaultButton="Button1">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="GridRow1B" style="width: 150px;">
                                    Hotel
                                </td>
                                <td class="GridRow1B" style="width: 450px;">
                                    <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" DataSourceID="dsHotel"
                                        DataTextField="Hotel" DataValueField="HotelID" AppendDataBoundItems="True">
                                        <asp:ListItem Value="">all</asp:ListItem>
                                        <asp:ListItem Value="-1">Hotel Group</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsHotel" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="dsInvoicesTableAdapters.HotelTableAdapter">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value"
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Hotel Group
                                </td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlHotelGroup" runat="server" CssClass="TextBox" DataSourceID="dsHotelGroup"
                                        DataTextField="HotelGroup" DataValueField="HotelGroupID" AppendDataBoundItems="True">
                                        <asp:ListItem Value="">none</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsHotelGroup" runat="server" OldValuesParameterFormatString="original_{0}"
                                        TypeName="dsGroupsTableAdapters.HotelGroupTableAdapter" SelectMethod="GetData">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Tour&nbsp;Operator
                                </td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlTO" runat="server" CssClass="TextBox" DataSourceID="dsTOAll"
                                        DataTextField="TourOp" DataValueField="TourOpID" AppendDataBoundItems="True">
                                        <asp:ListItem Selected="True" Value="">all </asp:ListItem>
                                        <asp:ListItem Value="-1">TO Group</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsTOAll" runat="server" OldValuesParameterFormatString="original_{0}"
                                        TypeName="TourOperTableAdapters.TourOpTableAdapter" SelectMethod="GetDataByUser">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="hfUsername" Name="User" PropertyName="Value" Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Tour&nbsp;Operator Group
                                </td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlTOGroup" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsTOGroup" DataTextField="TourOpGroup" DataValueField="TourOpGroupID">
                                        <asp:ListItem Selected="True" Value="">none</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsTOGroup" runat="server" OldValuesParameterFormatString="original_{0}"
                                        TypeName="dsGroupsTableAdapters.TourOpGroupTableAdapter" SelectMethod="GetData">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Market
                                </td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlMarkets" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsMarkets" DataTextField="Market" DataValueField="MarketID">
                                        <asp:ListItem Selected="True" Value="">all markets</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsMarkets" runat="server" OldValuesParameterFormatString="original_{0}"
                                        TypeName="TourOperTableAdapters.MarketTableAdapter" SelectMethod="GetData">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Pymt Conditions
                                </td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlPay" runat="server" CssClass="TextBox" DataSourceID="dsPayCond"
                                        DataTextField="PayCond" DataValueField="PayCondID" AppendDataBoundItems="True">
                                        <asp:ListItem Selected="True" Value="">All Pymt cond.</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsPayCond" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="TourOperTableAdapters.PayCondTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Inv Type
                                </td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlInvType" runat="server" AppendDataBoundItems="True" CssClass="TextBox">
                                        <asp:ListItem Selected="True" Value="">all </asp:ListItem>
                                        <asp:ListItem Value="0">Stay</asp:ListItem>
                                        <asp:ListItem Value="1">Group</asp:ListItem>
                                        <asp:ListItem Value="2">Cancel</asp:ListItem>
                                        <asp:ListItem Value="3">No-Show</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Account Type
                                </td>
                                <td class="GridRow1B">
                                    <%--
                                    <asp:DropDownList ID="ddlAccType" runat="server" CssClass="TextBox" DataSourceID="dsAccType"
                                        DataTextField="AccTypeName" DataValueField="AccType" AppendDataBoundItems="True">
                                        <asp:ListItem Value="AT">Both (AR + OR)</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsAccType" runat="server" OldValuesParameterFormatString="original_{0}"
                                        TypeName="ReportAccountingTableAdapters.AccTypeTableAdapter" SelectMethod="GetData">
                                    </asp:ObjectDataSource>
                                    --%>
                                    <asp:DropDownList ID="ddlAccType" runat="server" CssClass="TextBox" AppendDataBoundItems="True">
                                        <asp:ListItem Selected="True"  Value="AR">Account Recievables</asp:ListItem>
                                        <asp:ListItem Value="FL">Liabilities</asp:ListItem>
                                        <asp:ListItem Value="OT">Other Account Recievables</asp:ListItem>
                                        <asp:ListItem Value="AT">Both (AR + OR)</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    As of Date
                                </td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="fltStart" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wmfltStart" runat="server" TargetControlID="fltStart"
                                        WatermarkCssClass="WaterMark" WatermarkText="Check In date equal or greater than..." />
                                    <asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="fltStart"
                                        Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator7_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator7">
                                    </asp:ValidatorCalloutExtender>
                                    <asp:CalendarExtender ID="fltStart_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="fltStart" CssClass="cal_Theme1">
                                    </asp:CalendarExtender>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear">
                                    &nbsp;
                                </td>
                                <td class="GridRowClear" style="height: 27px;" >
                                    <asp:CheckBox ID="cbCancel" runat="server" Text="Include Aging Balance" TextAlign="Left" />
                                    &nbsp;
                                    <asp:CheckBox ID="cbPayed" runat="server" Text="Include Paid" TextAlign="Left" />
                                    &nbsp;
                                    <asp:CheckBox ID="cbAR" runat="server" Checked="True" Text="AR" TextAlign="Left" />
                                    &nbsp;
                                    <asp:CheckBox ID="cbFL" runat="server" Checked="True" Text="FL" TextAlign="Left" />
                                    &nbsp;
                                    <asp:CheckBox ID="cbNote" runat="server" Text="Print Notes" TextAlign="Left" />
                                    <%--&nbsp;<asp:CheckBox ID="cbExcel" runat="server" Style="padding-right: 5px; width: 370px" Text="export to Excel" TextAlign="Left" />--%>
                                </td>
                            </tr>
                            <tr>
                                <td class="ComandRow2T" style="height: 30px; padding-top: 5px; text-align: left;" >
                                    <asp:CheckBox ID="cbHotel" runat="server" Text="Hotel" />
                                </td>
                                <td class="ComandRow2T" colspan="2" style="height: 30px; padding-top: 5px">
                                    <asp:CheckBox ID="cbExcel" runat="server" Text="export to Excel" TextAlign="Left" />
                                    &nbsp;&nbsp;&nbsp;<asp:Button ID="Button3" runat="server" SkinID="skBtnBase" Text="Report" />
                                    &nbsp;<asp:Button ID="Button5" runat="server" SkinID="skBtnBase" Text=" By Booking" Visible="False" />
                                    &nbsp;<asp:Button ID="Button6" runat="server" SkinID="skBtnBase" Text=" By Booking" />
                                    &nbsp;<asp:Button ID="Button4" runat="server" SkinID="skBtnBase" Text="Compare" Visible="False" />
                                    &nbsp;<asp:Button ID="Button1" runat="server" SkinID="skBtnFilter" Visible="False" />
                                    &nbsp;
                                    <asp:Button ID="Button2" runat="server" SkinID="skBtnClear" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div class="Blue">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table cellpadding="0" cellspacing="0">
                    <asp:Panel runat="server" ID="pnlCnt" Visible="False" Width="700px">
                        <tr>
                            <td class="GridLabelBG">
                                <asp:Label ID="lbHotels" runat="server" SkinID="skGridLabel" Text="Account Statement"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="GridBorder">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dsAccRepStatment"
                                    SkinID="skGridView">
                                    <Columns>
                                        <asp:BoundField DataField="HotelId" HeaderText="HotelId" SortExpression="HotelId">
                                        </asp:BoundField>
                                        <asp:BoundField DataField="TourOpId" HeaderText="TourOpId" SortExpression="TourOpId">
                                        </asp:BoundField>
                                        <asp:BoundField DataField="TransDate" HeaderText="TransDate" SortExpression="TransDate" />
                                        <asp:BoundField DataField="DebitDocID" HeaderText="DebitDocID" SortExpression="DebitDocID">
                                        </asp:BoundField>
                                        <asp:BoundField DataField="DebitCode" HeaderText="DebitCode" SortExpression="DebitCode" />
                                        <asp:BoundField DataField="DebitNumber" HeaderText="DebitNumber" SortExpression="DebitNumber" />
                                        <asp:BoundField DataField="DebitOrd" HeaderText="DebitOrd" SortExpression="DebitOrd">
                                        </asp:BoundField>
                                        <asp:BoundField DataField="DebitAmount" HeaderText="DebitAmount" SortExpression="DebitAmount" />
                                        <asp:BoundField DataField="DebitHAmount" HeaderText="DebitHAmount" SortExpression="DebitHAmount">
                                        </asp:BoundField>
                                        <asp:BoundField DataField="CreditDocID" HeaderText="CreditDocID" SortExpression="CreditDocID" />
                                        <asp:BoundField DataField="CreditCode" HeaderText="CreditCode" SortExpression="CreditCode">
                                        </asp:BoundField>
                                        <asp:BoundField DataField="CreditNumber" HeaderText="CreditNumber" SortExpression="CreditNumber">
                                        </asp:BoundField>
                                        <asp:BoundField DataField="CreditOrd" HeaderText="CreditOrd" SortExpression="CreditOrd" />
                                        <asp:BoundField DataField="Reference" HeaderText="Reference" SortExpression="Reference" />
                                        <asp:BoundField DataField="CreditAmount" HeaderText="CreditAmount" SortExpression="CreditAmount" />
                                        <asp:BoundField DataField="CreditHAmount" HeaderText="CreditHAmount" SortExpression="CreditHAmount" />
                                        <asp:BoundField DataField="SortField" HeaderText="SortField" SortExpression="SortField" />
                                        <asp:BoundField DataField="Hotel" HeaderText="Hotel" SortExpression="Hotel" />
                                        <asp:BoundField DataField="TourOp" HeaderText="TourOp" SortExpression="TourOp" />
                                        <asp:BoundField DataField="MarketId" HeaderText="MarketId" SortExpression="MarketId" />
                                        <asp:BoundField DataField="CreditDays" HeaderText="CreditDays" SortExpression="CreditDays" />
                                        <asp:BoundField DataField="DebitAccount" HeaderText="DebitAccount" SortExpression="DebitAccount" />
                                        <asp:BoundField DataField="Balance" HeaderText="Balance" SortExpression="Balance" />
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                    </asp:Panel>
                </table>
                <asp:ObjectDataSource ID="dsAccRepStatment" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="ReportAccountingTableAdapters.AccRepStatementOfAccArFlTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="ddlHotelGroup" Name="HotelGroupID" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="ddlTO" Name="TourOpId" PropertyName="SelectedValue"
                            Type="Int32" DefaultValue="" />
                        <asp:ControlParameter ControlID="ddlTOGroup" Name="TourOpGroupID" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="ddlMarkets" Name="MarketID" PropertyName="SelectedValue"
                            Type="String" />
                        <asp:ControlParameter ControlID="ddlPay" Name="PayCondID" PropertyName="SelectedValue"
                            Type="String" />
                        <asp:ControlParameter ControlID="fltStart" Name="AsOffDate" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="cbPayed" Name="Payed" PropertyName="Checked" Type="Boolean" />
                        <asp:ControlParameter ControlID="cbCancel" Name="Canceled" PropertyName="Checked"
                            Type="Boolean" />
                        <asp:ControlParameter ControlID="ddlAccType" Name="AccType" PropertyName="SelectedValue"
                            Type="String" />
                        <asp:ControlParameter ControlID="ddlInvType" Name="InvType" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsAccRepStatmentBooking" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="AccStatementTableAdapters.AccRepStatementOfAccBookingTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="ddlHotelGroup" Name="HotelGroupID" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="ddlTO" DefaultValue="" Name="TourOpId" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="ddlTOGroup" Name="TourOpGroupID" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="ddlMarkets" Name="MarketID" PropertyName="SelectedValue"
                            Type="String" />
                        <asp:ControlParameter ControlID="ddlPay" Name="PayCondID" PropertyName="SelectedValue"
                            Type="String" />
                        <asp:ControlParameter ControlID="fltStart" Name="AsOffDate" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="cbPayed" Name="Payed" PropertyName="Checked" Type="Boolean" />
                        <asp:ControlParameter ControlID="cbCancel" Name="Canceled" PropertyName="Checked"
                            Type="Boolean" />
                        <asp:ControlParameter ControlID="ddlAccType" Name="AccType" PropertyName="SelectedValue"
                            Type="String" />
                        <asp:ControlParameter ControlID="ddlInvType" Name="InvType" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsAccRepStatmentH" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetHData" TypeName="ReportAccountingTableAdapters.AccRepStatementOfAccArFlTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="ddlHotelGroup" Name="HotelGroupID" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="ddlTO" DefaultValue="" Name="TourOpId" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="ddlTOGroup" Name="TourOpGroupID" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="ddlMarkets" Name="MarketID" PropertyName="SelectedValue"
                            Type="String" />
                        <asp:ControlParameter ControlID="ddlPay" Name="PayCondID" PropertyName="SelectedValue"
                            Type="String" />
                        <asp:ControlParameter ControlID="fltStart" Name="AsOffDate" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="cbPayed" Name="Payed" PropertyName="Checked" Type="Boolean" />
                        <asp:ControlParameter ControlID="cbCancel" Name="Canceled" PropertyName="Checked"
                            Type="Boolean" />
                        <asp:ControlParameter ControlID="ddlAccType" Name="AccType" PropertyName="SelectedValue"
                            Type="String" />
                        <asp:ControlParameter ControlID="ddlInvType" Name="InvType" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsAccRepStatmentBk" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="AccStatementTableAdapters.AccRepStatementOfAccBookTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="ddlHotelGroup" Name="HotelGroupID" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="ddlTO" DefaultValue="" Name="TourOpId" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="ddlTOGroup" Name="TourOpGroupID" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="ddlMarkets" Name="MarketID" PropertyName="SelectedValue"
                            Type="String" />
                        <asp:ControlParameter ControlID="ddlPay" Name="PayCondID" PropertyName="SelectedValue"
                            Type="String" />
                        <asp:ControlParameter ControlID="fltStart" Name="AsOffDate" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="cbPayed" Name="Payed" PropertyName="Checked" Type="Boolean" />
                        <asp:ControlParameter ControlID="cbCancel" Name="Canceled" PropertyName="Checked"
                            Type="Boolean" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <br />
                <asp:ObjectDataSource ID="dsAccAgedBalance" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="ReportAccountingTableAdapters.AccRepAgingBalanceTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="ddlHotelGroup" Name="HotelGroupID" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="ddlTO" DefaultValue="" Name="TourOpId" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="ddlTOGroup" Name="TourOpGroupID" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="ddlMarkets" Name="MarketID" PropertyName="SelectedValue"
                            Type="String" />
                        <asp:ControlParameter ControlID="ddlPay" Name="PayCondID" PropertyName="SelectedValue"
                            Type="String" />
                        <asp:ControlParameter ControlID="fltStart" Name="AsOffDate" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="cbAR" Name="AR" PropertyName="Checked" Type="Boolean" />
                        <asp:ControlParameter ControlID="cbFL" Name="FL" PropertyName="Checked" Type="Boolean" />
                        <asp:ControlParameter ControlID="cbHotel" Name="HRate" PropertyName="Checked" Type="Boolean" />
                        <asp:ControlParameter ControlID="ddlAccType" Name="AccType" PropertyName="SelectedValue"
                            Type="String" />
                        <asp:ControlParameter ControlID="ddlInvType" Name="InvType" PropertyName="SelectedValue"
                            Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
