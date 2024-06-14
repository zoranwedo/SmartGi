<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="RepAgingBalance.aspx.vb" Inherits="Reports_Accounting_RepAgingBalance" %>

<%@ Register Assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
    Namespace="System.Web.UI.WebControls" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Aged Balance
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" runat="Server">
    <div class="Green">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <asp:CollapsiblePanelExtender ID="cpeSearch" runat="server" TargetControlID="pnSearch"
                    CollapseControlID="lblFilter" ExpandControlID="lblFilter" ImageControlID="imgExpander"
                    CollapsedImage="~/Images/expand_.png" ExpandedImage="~/Images/collapse_.png"
                    Collapsed="False">
                </asp:CollapsiblePanelExtender>
                <table cellpadding="0" cellspacing="0" style="width: 600px;">
                    <tr>
                        <asp:Panel ID="pnSearchHead" runat="server" Width="600px">
                            <td class="GridLabelBG" style="width: 600px;">
                                <asp:Label ID="lblFilter" runat="server" SkinID="skGridLabel">Search/Filter &nbsp;
                                    <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />
                                    &nbsp; </asp:Label>
                            </td>
                        </asp:Panel>
                    </tr>
                    <tr>
                        <td class="GridBorder" style="width: 600px">
                            <asp:Panel ID="pnSearch" runat="server" Style="width: 600px" DefaultButton="Button1">
                                <table cellpadding="0" cellspacing="0">
                                    <tr style="width: 600px;">
                                        <td class="GridRow1B" style="width: 120px;">
                                            Hotel
                                        </td>
                                        <td class="GridRow1B" style="width: 480px;">
                                            <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" DataSourceID="dsHotel"
                                                DataTextField="Hotel" DataValueField="HotelID" AppendDataBoundItems="True">
                                                <asp:ListItem Value="">all</asp:ListItem>
                                                <asp:ListItem Value="-1">Hotel Group</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:ObjectDataSource ID="dsHotel" runat="server" OldValuesParameterFormatString="original_{0}"
                                                SelectMethod="GetData" TypeName="dsInvoicesTableAdapters.HotelTableAdapter">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
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
                                            <asp:ObjectDataSource ID="dsHotelGroup" runat="server" 
                                                OldValuesParameterFormatString="original_{0}" 
                                                TypeName="dsGroupsTableAdapters.HotelGroupTableAdapter"
                                                SelectMethod="GetData">
                                            </asp:ObjectDataSource>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="GridRow1B">
                                            Tour Operator
                                        </td>
                                        <td class="GridRow1B">
                                            <asp:DropDownList ID="ddlTO" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                                DataSourceID="dsTOAll" DataTextField="TourOp" DataValueField="TourOpID">
                                                <asp:ListItem Selected="True" Value="">all </asp:ListItem>
                                                <asp:ListItem Value="-1">TO Group</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:ObjectDataSource ID="dsTOAll" runat="server" 
                                                OldValuesParameterFormatString="original_{0}" 
                                                TypeName="TourOperTableAdapters.TourOpTableAdapter"
                                                SelectMethod="GetDataByUser" >
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="hfUsername" Name="User" PropertyName="Value" Type="String" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="GridRow1B">
                                            Tour Operator Group
                                        </td>
                                        <td class="GridRow1B">
                                            <asp:DropDownList ID="ddlTOGroup" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                                DataSourceID="dsTOGroup" DataTextField="TourOpGroup" DataValueField="TourOpGroupID">
                                                <asp:ListItem Selected="True" Value="">none</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:ObjectDataSource ID="dsTOGroup" runat="server" OldValuesParameterFormatString="original_{0}"
                                                SelectMethod="GetData" TypeName="dsGroupsTableAdapters.TourOpGroupTableAdapter">
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
                                            <asp:ObjectDataSource ID="dsMarkets" runat="server" 
                                                OldValuesParameterFormatString="original_{0}" 
                                                TypeName="TourOperTableAdapters.MarketTableAdapter"
                                                SelectMethod="GetData">
                                            </asp:ObjectDataSource>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="GridRow1B">
                                            Pymt Conditions
                                        </td>
                                        <td class="GridRow1B" style="width: 400px;">
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
                                            Account Type
                                        </td>
                                        <td class="GridRow1B" >
                                            <%--<asp:DropDownList ID="ddlAccType" runat="server" CssClass="TextBox" DataSourceID="dsAccType"
                                                DataTextField="AccTypeName" DataValueField="AccType" AppendDataBoundItems="True">
                                                <asp:ListItem Value="AT">Both (AR +OR)</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:ObjectDataSource ID="dsAccType" runat="server" 
                                                OldValuesParameterFormatString="original_{0}" 
                                                TypeName="ReportAccountingTableAdapters.AccTypeTableAdapter"
                                                SelectMethod="GetData" >
                                            </asp:ObjectDataSource>--%>
                                            <asp:DropDownList ID="ddlAccType" runat="server" CssClass="TextBox" AppendDataBoundItems="True">
                                                <asp:ListItem Selected="True"  Value="AR">Account Recievables</asp:ListItem>
                                                <asp:ListItem Value="FL">Liabilities</asp:ListItem>
                                                <asp:ListItem Value="OT">Other Account Recievables</asp:ListItem>
                                                <asp:ListItem Value="AT">Both (AR + OR)</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="GridRow1B" >
                                            Inv Type
                                        </td>
                                        <td class="GridRow1B" >
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
                                        <td class="GridRowClear">
                                            As of Date
                                        </td>
                                        <td class="GridRowClear">
                                            <asp:TextBox ID="fltStart" runat="server" CssClass="TextBox" />
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
                                        <td class="ComandRow2T" style="text-align: left;">
                                            <asp:CheckBox ID="cbHotel" runat="server" Text="Hotel" TextAlign="Right" />
                                        </td>
                                        <td class="ComandRow2T">
                                            <asp:CheckBox ID="cbCCI" runat="server" Text="Exclude CCI" TextAlign="Left" />
                                            <asp:CheckBox ID="cbAR" runat="server" Text="AR" TextAlign="Left" Checked="True" />
                                            <asp:CheckBox ID="cbFL" runat="server" Text="FL" TextAlign="Left" Checked="True" />
                                            &nbsp;&nbsp;&nbsp;
                                            <asp:RadioButtonList ID="cbSortL" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                <asp:ListItem Selected="True" Value="0" Text="Sort By Hotel" />
                                                <asp:ListItem Value="1" Text="Sort By Hotel/TO"/>
                                                <asp:ListItem Value="2" Text="Sort By TO" />
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="GridRowClear" style="height: 28px; padding-top: 5px; text-align: right;">
                                            <asp:CheckBox ID="cbExcel" runat="server" Text="export to Excel" TextAlign="Left" />
                                        </td>
                                        <td class="GridRow1T" style="height: 28px; padding-top: 5px; text-align: right;">
                                            &nbsp;&nbsp;<asp:Button ID="Button4" runat="server" SkinID="skBtnBase" Text="Compare" Visible="False" />
                                            &nbsp;&nbsp;<asp:Button ID="Button3" runat="server" SkinID="skBtnBase" Text="Report" />
                                            &nbsp;&nbsp;<asp:Button ID="Button1" runat="server" SkinID="skBtnFilter" Visible="False" />
                                            &nbsp;&nbsp;<asp:Button ID="Button2" runat="server" SkinID="skBtnClear" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <br />
    <div class="Blue">
        <asp:ObjectDataSource ID="dsAgedBalance" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="AgingBalanceTableAdapters.AccRepAgingBalanceTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlHotelGroup" Name="HotelGroupID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlTO" Name="TourOpId" PropertyName="SelectedValue" Type="Int32" DefaultValue="" />
                <asp:ControlParameter ControlID="ddlTOGroup" Name="TourOpGroupID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlMarkets" Name="MarketID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddlPay" Name="PayCondID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="fltStart" Name="AsOffDate" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="cbAR" Name="AR" PropertyName="Checked" Type="Boolean" />
                <asp:ControlParameter ControlID="cbFL" Name="FL" PropertyName="Checked" Type="Boolean" />
                <asp:ControlParameter ControlID="cbHotel" Name="HRate" PropertyName="Checked" Type="Boolean" />
                <asp:ControlParameter ControlID="ddlAccType" Name="AccType" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddlInvType" Name="InvType" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsAgedBalanceSum" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="ReportAccountingTableAdapters.AccRepAgingBalanceTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlHotelGroup" Name="HotelGroupID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlTO" Name="TourOpId" PropertyName="SelectedValue" Type="Int32" DefaultValue="" />
                <asp:ControlParameter ControlID="ddlTOGroup" Name="TourOpGroupID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlMarkets" Name="MarketID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddlPay" Name="PayCondID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="fltStart" Name="AsOffDate" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="cbAR" Name="AR" PropertyName="Checked" Type="Boolean" />
                <asp:ControlParameter ControlID="cbFL" Name="FL" PropertyName="Checked" Type="Boolean" />
                <asp:ControlParameter ControlID="cbHotel" Name="HRate" PropertyName="Checked" Type="Boolean" />
                <asp:ControlParameter ControlID="ddlAccType" Name="AccType" PropertyName="SelectedValue" Type="String" />
                <asp:Parameter Name="InvType" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table cellpadding="0" cellspacing="0">
                    <asp:Panel runat="server" ID="pnlCnt" Visible="False" Width="700px">
                        <tr>
                            <td class="GridLabelBG">
                                <asp:Label ID="lbHotels" runat="server" SkinID="skGridLabel" Text="Aged Balance"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="GridBorder">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dsAgedBalance"
                                    SkinID="skGridView">
                                    <Columns>
                                        <asp:BoundField DataField="HotelId" HeaderText="HotelId" SortExpression="HotelId" />
                                        <asp:BoundField DataField="TourOpId" HeaderText="TourOpId" SortExpression="TourOpId" />
                                        <asp:BoundField DataField="1" HeaderText="1" SortExpression="1" />
                                        <asp:BoundField DataField="2" HeaderText="2" SortExpression="2" />
                                        <asp:BoundField DataField="3" HeaderText="3" SortExpression="3" />
                                        <asp:BoundField DataField="4" HeaderText="4" SortExpression="4" />
                                        <asp:BoundField DataField="Hotel" HeaderText="Hotel" SortExpression="Hotel" />
                                        <asp:BoundField DataField="TourOp" HeaderText="TourOp" SortExpression="TourOp" />
                                        <asp:BoundField DataField="MarketId" HeaderText="MarketId" SortExpression="MarketId" />
                                        <asp:BoundField DataField="CreditDays" HeaderText="CreditDays" SortExpression="CreditDays" />
                                        <asp:BoundField DataField="0" HeaderText="0" SortExpression="0" />
                                        <asp:BoundField DataField="Balance" HeaderText="Balance" ReadOnly="True" SortExpression="Balance" />
                                        <asp:BoundField DataField="ARCredit" HeaderText="ARCredit" ReadOnly="True" SortExpression="ARCredit" />
                                        <asp:BoundField DataField="FLCredit" HeaderText="FLCredit" ReadOnly="True" SortExpression="FLCredit" />
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                    </asp:Panel>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>--%>
    </div>
</asp:Content>
