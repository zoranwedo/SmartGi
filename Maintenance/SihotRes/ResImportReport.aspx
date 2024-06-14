<%@ Page Language="VB" MasterPageFile="~/Maintenance/SihotRes/ResSihot.master" AutoEventWireup="false"
    CodeFile="ResImportReport.aspx.vb" Inherits="Maintenance_SihotRes_ResImportReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Reservation Import Overview
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" runat="Server">
    <asp:HiddenField ID="hfMode" runat="server" Value="0" />
    <div class="Green">
        <asp:CollapsiblePanelExtender ID="cpeSearch" runat="server" TargetControlID="pnSearch"
            CollapseControlID="lblFilter" ExpandControlID="lblFilter" ImageControlID="imgExpander"
            CollapsedImage="~/Images/expand_.png" ExpandedImage="~/Images/collapse_.png"
            Collapsed="False">
        </asp:CollapsiblePanelExtender>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <asp:Panel ID="pnSearchHead" runat="server">
                    <td class="GridLabelBG" style="width: 600px;">
                        <asp:Label ID="lblFilter" runat="server" SkinID="skGridLabel">Search/Filter &nbsp;
                            <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />&nbsp;
                        </asp:Label>
                        <asp:LinkButton ID="btFilterMode" runat="server" Text="Advanced Filter" Style="float: right;
                            color: White; padding: 4px; font-weight: bold;" />
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px;">
                    <asp:Panel ID="pnSearch" runat="server" CssClass="popupPanel" DefaultButton="btnFilter">
                        <table cellpadding="0" cellspacing="0">
                            <asp:Panel ID="simpleDiv" runat="server">
                                <tr>
                                    <td class="GridRowClear" style="width: 100px;">
                                        Import On
                                    </td>
                                    <td class="GridRowClear" style="width: 500px;" colspan="2">
                                        <asp:TextBox ID="fltDate" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="fltDateExt" runat="server" TargetControlID="fltDate"
                                            WatermarkCssClass="WaterMark" WatermarkText="Today if empty" />
                                        <asp:CalendarExtender ID="fltDate_Calendar" runat="server" CssClass="cal_Theme1"
                                            TargetControlID="fltDate" Enabled="True" />
                                        <asp:CompareValidator ID="fltDate_Date" runat="server" Operator="DataTypeCheck" Type="Date"
                                            ControlToValidate="fltDate" Display="None" ErrorMessage="Not a valid date!" />
                                        <asp:ValidatorCalloutExtender ID="fltDate_DateCallout" runat="server" Enabled="True"
                                            TargetControlID="fltDate_Date" />
                                    </td>
                                </tr>
                            </asp:Panel>
                            <asp:Panel ID="advancedDiv" runat="server" Visible="false">
                                <tr>
                                    <td class="GridRowClear" style="width: 100px;">
                                        Hotel Code
                                    </td>
                                    <td class="GridRowClear" style="width: 500px;" colspan="2">
                                        <asp:DropDownList ID="fltHotel" runat="server" CssClass="TextBox" DataSourceID="dsHotelCode"
                                            DataTextField="HOTEL_NO" DataValueField="HOTEL_NO" AppendDataBoundItems="True">
                                            <asp:ListItem Text="all" Value="-1" />
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsHotelCode" runat="server" OldValuesParameterFormatString="original_{0}"
                                            SelectMethod="GetData" TypeName="dsSIHOTTableAdapters.HotelCodeTableAdapter">
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear" style="width: 100px;">
                                        Import From
                                    </td>
                                    <td class="GridRowClear" style="width: 500px;" colspan="2">
                                        <asp:TextBox ID="fltCFrom" runat="server" CssClass="TextBox" />
                                        <asp:CalendarExtender ID="fltCFrom_Calendar" runat="server" CssClass="cal_Theme1"
                                            TargetControlID="fltCFrom" Enabled="True" />
                                        <%--<asp:CompareValidator ID="fltCFrom_Date" runat="server" Operator="DataTypeCheck"
                                            Type="Date" ControlToValidate="fltCFrom" Display="None" ErrorMessage="Not a valid date!" />
                                        <asp:ValidatorCalloutExtender ID="fltCFrom_DateCallout" runat="server" Enabled="True"
                                            TargetControlID="fltCFrom_Date" />--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear" style="width: 100px;">
                                        Import To
                                    </td>
                                    <td class="GridRowClear" style="width: 500px;" colspan="2">
                                        <asp:TextBox ID="fltCTo" runat="server" CssClass="TextBox" />
                                        <asp:CalendarExtender ID="fltCTo_Calendar" runat="server" CssClass="cal_Theme1" TargetControlID="fltCTo"
                                            Enabled="True" />
                                        <%--<asp:CompareValidator ID="fltCTo_Date" runat="server" Operator="DataTypeCheck" Type="Date"
                                            ControlToValidate="fltCTo" Display="None" ErrorMessage="Not a valid date!" />
                                        <asp:ValidatorCalloutExtender ID="fltCTo_DateCallout" runat="server" Enabled="True"
                                            TargetControlID="fltCTo_Date" />--%>
                                    </td>
                                </tr>
                            </asp:Panel>
                            <tr>
                                <td class="ComandRow2T" style="height: 30px; padding-top: 5px;
                                    text-align: left;">
                                    &nbsp;
                                </td>
                                <td class="ComandRow2T" style="height: 30px; padding-top: 5px">
                                    <asp:Button ID="btnFilter" runat="server" SkinID="skBtnFilter" />&nbsp;
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
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lbServiceLog" runat="server" Text="Imported" SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvImported" runat="server" DataSourceID="dsImported" DataKeyNames="LogID"
                        SkinID="skGridView" AutoGenerateColumns="False" EnableModelValidation="True">
                        <Columns>
                            <asp:BoundField DataField="HotelHID" HeaderText="HID" SortExpression="HotelHID">
                                <ItemStyle HorizontalAlign="Center" Width="40px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FileID" HeaderText="FileID" SortExpression="FileID">
                                <ItemStyle HorizontalAlign="Center" Width="40px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Procesed" HeaderText="Procesed" SortExpression="Procesed">
                                <ItemStyle Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note">
                                <ItemStyle Width="600px" />
                            </asp:BoundField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div style="width: 760px; height: 30px; font-family: Calibri;">
                                No imported reservation files for filter criteria.
                            </div>
                        </EmptyDataTemplate>
                        <HeaderStyle Wrap="False" Font-Names="Calibri" />
                        <RowStyle Wrap="False" Font-Names="Calibri" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
    <asp:ObjectDataSource ID="dsImported" runat="server" OldValuesParameterFormatString="original_{0}"
        TypeName="dsSIHOTTableAdapters.ResImportLogTableAdapter" SelectMethod="GetData">
        <SelectParameters>
            <asp:Parameter Name="HotelHID" Type="Int32" />
            <asp:Parameter Name="OnDate" Type="DateTime" />
            <asp:Parameter Name="FromDate" Type="DateTime" />
            <asp:Parameter Name="ToDate" Type="DateTime" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
