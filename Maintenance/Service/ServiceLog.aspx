<%@ Page Language="VB" MasterPageFile="~/Maintenance/Service/Service.master" AutoEventWireup="false" 
    CodeFile="ServiceLog.aspx.vb" Inherits="Maintenance_Service_ServiceLog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    SMART Service Log
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" Runat="Server">
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
                        <asp:LinkButton ID="btFilterMode" runat="server" Text="Advanced Filter" 
                            style="float:right; color: White; padding: 4px; font-weight: bold;" />
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
                                    Log On Date
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
                                    Log From Date
                                </td>
                                <td class="GridRowClear" style="width: 500px;" colspan="2">
                                    <asp:TextBox ID="fltFrom" runat="server" CssClass="TextBox" />
                                    <asp:CalendarExtender ID="fltFrom_Calendar" runat="server" CssClass="cal_Theme1" 
                                        TargetControlID="fltFrom" Enabled="True" />
                                    <asp:CompareValidator ID="fltFrom_Date" runat="server" Operator="DataTypeCheck" Type="Date" 
                                        ControlToValidate="fltFrom" Display="None" ErrorMessage="Not a valid date!" />
                                    <asp:ValidatorCalloutExtender ID="fltFrom_DateCallout" runat="server" Enabled="True" 
                                        TargetControlID="fltFrom_Date" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear" style="width: 100px;">
                                    Log To Date
                                </td>
                                <td class="GridRowClear" style="width: 500px;" colspan="2">
                                    <asp:TextBox ID="fltTo" runat="server" CssClass="TextBox" />
                                    <asp:CalendarExtender ID="fltTo_Calendar" runat="server" CssClass="cal_Theme1" 
                                        TargetControlID="fltTo" Enabled="True" />
                                    <asp:CompareValidator ID="fltTo_Date" runat="server" Operator="DataTypeCheck" Type="Date" 
                                        ControlToValidate="fltTo" Display="None" ErrorMessage="Not a valid date!" />
                                    <asp:ValidatorCalloutExtender ID="fltTo_DateCallout" runat="server" Enabled="True" 
                                        TargetControlID="fltTo_Date" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear" style="width: 100px;">
                                    Service
                                </td>
                                <td class="GridRowClear" style="width: 500px;" colspan="2">
                                    <asp:DropDownList ID="fltSerevice" runat="server" CssClass="TextBox" 
                                        DataSourceID="dsService" DataTextField="ServiceName" DataValueField="ServiceID"
                                        AppendDataBoundItems="true">
                                        <asp:ListItem Text="all" Value="-1" />
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsService" runat="server" 
                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                        TypeName="dsSmartServiceTableAdapters.ServiceTimeTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            </asp:Panel>
                            <tr>
                                <td colspan="2" class="ComandRow2T" style="width: 200px; height: 30px; padding-top: 5px; text-align: left;">
                                    &nbsp;</td> 
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
                    <asp:Label ID="lbServiceLog" runat="server" Text="Service Log" 
                        SkinID="skGridLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvServiceLog" runat="server" DataSourceID="dsServiceLog" DataKeyNames="LogID"
                        SkinID="skGridView" AutoGenerateColumns="False"
                        EnableModelValidation="True">
                        <RowStyle Wrap="False" />
                        <Columns>
                            <asp:BoundField DataField="LogID" HeaderText="LogID" InsertVisible="False"  ReadOnly="True" Visible="False" />
                            <asp:BoundField DataField="LogService" HeaderText="LogService" Visible="False" />
                            <asp:BoundField DataField="ServiceName" HeaderText="Service" >
                                <ItemStyle Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="LogTime" HeaderText="Time" SortExpression="LogTime" >
                                <ItemStyle Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="LogCode" HeaderText="Code" >
                                <ItemStyle Width="30px" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="LogNote" HeaderText="Note">
                                <ItemStyle Width="400px" />
                            </asp:BoundField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div style="width: 760px; height: 30px;" >
                                No service log for filter criteria.
                            </div> 
                        </EmptyDataTemplate>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
    <asp:ObjectDataSource ID="dsServiceLog" runat="server" OldValuesParameterFormatString="original_{0}"
        TypeName="dsSmartServiceTableAdapters.ServiceLogTableAdapter" 
        SelectMethod="GetData" >
        <SelectParameters>
            <asp:ControlParameter ControlID="fltDate" Name="LogOn" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="fltFrom" Name="LogFrom" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="fltTo" Name="LogTo" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="fltSerevice" Name="Service" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

