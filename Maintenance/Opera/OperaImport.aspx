<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Opera/OperaRes.master" AutoEventWireup="false"
    CodeFile="OperaImport.aspx.vb" Inherits="Maintenance_Opera_OperaImport"
    EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    OPERA Reservation Imports
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" runat="Server">
    <asp:UpdatePanel runat="server" ID="updPanel">
        <ContentTemplate>
            <div class="Green">
                <asp:CollapsiblePanelExtender ID="cpeSearch" runat="server" TargetControlID="pnSearch"
                    CollapseControlID="lblFilter" ExpandControlID="lblFilter" ImageControlID="imgExpander"
                    CollapsedImage="~/Images/expand_.png" ExpandedImage="~/Images/collapse_.png"
                    Collapsed="False">
                </asp:CollapsiblePanelExtender>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <asp:Panel ID="pnSearchHead" runat="server">
                            <td class="GridLabelBG">
                                <asp:Label ID="lblFilter" runat="server" SkinID="skGridLabel">Search/Filter &nbsp;
                                    <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />&nbsp; 
                                </asp:Label>
                            </td>
                        </asp:Panel>
                    </tr>
                    <tr>
                        <td class="GridBorder">
                            <asp:Panel ID="pnSearch" runat="server" CssClass="popupPanel" DefaultButton="btnFilter">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="GridRowClear" style="width: 100px;">Tasks On
                                        </td>
                                        <td class="GridRowClear" style="width: 380px;">
                                            <asp:TextBox ID="fltDate" runat="server" CssClass="TextBox" />
                                            <asp:TextBoxWatermarkExtender ID="fltDateExt" runat="server" TargetControlID="fltDate"
                                                WatermarkCssClass="WaterMark" WatermarkText="Last 10 tasks if empty" />
                                            <asp:CalendarExtender ID="fltDate_Calendar" runat="server" CssClass="cal_Theme1"
                                                TargetControlID="fltDate" Enabled="True" />
                                            <asp:CompareValidator ID="fltDate_Date" runat="server" Operator="DataTypeCheck" Type="Date"
                                                ControlToValidate="fltDate" Display="None" ErrorMessage="Not a valid date!" />
                                            <asp:ValidatorCalloutExtender ID="fltDate_DateCallout" runat="server" Enabled="True"
                                                TargetControlID="fltDate_Date" />
                                        </td>
                                        <td class="GridRowClear" style="width: 120px; height: 30px; padding-top: 2px; text-align: right;">
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
                            <asp:Label ID="lblToday" runat="server" SkinID="skGridLabel" />
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder">
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="vertical-align: top;">
                                        <div class="GridRow1B"><b>Import Tasks</b></div>
                                        <asp:GridView ID="gvTasks" runat="server" SkinID="skGridView" AutoGenerateColumns="False" 
                                            DataKeyNames="ImportTaskId" DataSourceID="dsTasks" EnableModelValidation="True">
                                            <Columns>
                                                <asp:CommandField SelectImageUrl="~/Images/select_.gif" ShowCancelButton="False"
                                                    ShowSelectButton="True" ButtonType="Image">
                                                    <ItemStyle Width="30px" />
                                                </asp:CommandField>
                                                <asp:BoundField DataField="ImportTaskId" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ImportTaskId">
                                                    <ItemStyle Width="30px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ImportStart" DataFormatString="{0:d}" HeaderText="Started" SortExpression="ImportStart">
                                                    <ItemStyle Width="70px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ImportStart" DataFormatString="{0:T}" HeaderText="at" SortExpression="ImportStart">
                                                    <ItemStyle Width="80px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ImportFinish" DataFormatString="{0:d}" HeaderText="Finished" SortExpression="ImportFinish">
                                                    <ItemStyle Width="70px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ImportFinish" DataFormatString="{0:T}" HeaderText="at" SortExpression="ImportFinish">
                                                    <ItemStyle Width="80px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ImportStatusText" HeaderText="Status" SortExpression="ImportStatusText">
                                                    <ItemStyle Width="60px" />
                                                </asp:BoundField>
                                            </Columns>
                                            <EmptyDataTemplate>
	                                            <table cellpadding="0" cellspacing="0">
		                                            <tr>
			                                            <th class="GridRow2B" style="width:32px;">&nbsp;</th>
			                                            <th class="GridRow2B" style="width:32px;">ID</th>
			                                            <th class="GridRow2B" style="width:72px;">Started</th>
			                                            <th class="GridRow2B" style="width:82px;">at</th>
			                                            <th class="GridRow2B" style="width:72px;">Finished</th>
			                                            <th class="GridRow2B" style="width:82px;">at</th>
			                                            <th class="GridRow2B" style="width:62px;">Status</th>
		                                            </tr>
		                                            <tr>
                                                        <td class="GridRow1B" colspan="7">
                                                            <div style="padding: 10px;">
                                                                No import tasks for selected date
                                                            </div>
                                                        </td>
		                                            </tr>
	                                            </table>
                                            </EmptyDataTemplate>
                                        </asp:GridView>
                                        <asp:ObjectDataSource ID="dsTasks" runat="server" OldValuesParameterFormatString="original_{0}" 
                                            SelectMethod="GetData" TypeName="dsOperaTableAdapters.ImportTaskTableAdapter"/>
                                        <asp:ObjectDataSource ID="dsTasksByDate" runat="server" OldValuesParameterFormatString="original_{0}" 
                                            SelectMethod="GetDataBy" TypeName="dsOperaTableAdapters.ImportTaskTableAdapter">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="fltDate" Name="ImportDate" PropertyName="Text" Type="String" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                    <td style="vertical-align: top; padding-left: 10px;">
                                        <%--<div class="SelectRow1B"><b>Import Task Statistics</b></div>
                                        <asp:GridView ID="GridView1" runat="server"  SkinID="skGridView" AutoGenerateColumns="False" 
                                            DataKeyNames="ImportTaskStatId" DataSourceID="dsStat" EnableModelValidation="True">
                                            <Columns>
                                                <asp:BoundField DataField="OhipHotelId" HeaderText="Hotel" SortExpression="OhipHotelId" >
                                                <ItemStyle Width="50px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ImportStart" HeaderText="Start" SortExpression="ImportStart" DataFormatString="{0:T}" >
                                                <ItemStyle Width="70px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ImportFinish" HeaderText="Finish" SortExpression="ImportFinish" DataFormatString="{0:T}" >
                                                <ItemStyle Width="70px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="Statistic" HeaderText="Statistic" SortExpression="Statistic" >
                                                <ItemStyle Width="50px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ImportStatusText" HeaderText="Status" SortExpression="ImportStatusText" >
                                                <ItemStyle Width="70px" />
                                                </asp:BoundField>
                                            </Columns>
                                            <EmptyDataTemplate>
	                                            <table cellpadding="0" cellspacing="0">
		                                            <tr>
			                                            <th style="width:52px;">&nbsp;</th>
			                                            <th style="width:72px;">&nbsp;</th>
			                                            <th style="width:72px;">&nbsp;</th>
			                                            <th style="width:52px;">&nbsp;</th>
			                                            <th style="width:72px;">&nbsp;</th>
		                                            </tr>
	                                            </table>
                                            </EmptyDataTemplate>
                                        </asp:GridView>
                                        <asp:ObjectDataSource ID="dsStat" runat="server" OldValuesParameterFormatString="original_{0}" 
                                            SelectMethod="GetData" TypeName="dsOperaTableAdapters.ImportTaskStatTableAdapter">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="gvTasks" Name="ImportTaskId" PropertyName="SelectedValue" Type="Int64" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="padding-top: 10px;">
                                        <div class="SelectRow1B"><b>Report</b></div>
                                        <asp:FormView ID="FormView1" runat="server" DataKeyNames="ImportTaskId" DataSourceID="dsReport" EnableModelValidation="True"
                                            Height="100%">
                                            <ItemTemplate>
                                                <asp:TextBox ID="ImportReportLabel" runat="server" Text='<%# Bind("ImportReport")%>' TextMode="MultiLine" 
                                                    CssClass="TextBox" ReadOnly="True" Height="500px" Width="790px"  />
                                            </ItemTemplate>
                                            <EmptyDataTemplate>
                                                <div style="width: 790px; height: 25px;">&nbsp;</div>
                                            </EmptyDataTemplate>
                                        </asp:FormView>--%>
                                        <div class="SelectRow1B"><b>Import Task Report</b></div>
                                        <asp:FormView ID="FormView1" runat="server" DataKeyNames="ImportTaskId" DataSourceID="dsReport" EnableModelValidation="True"
                                            Height="100%">
                                            <ItemTemplate>
                                                <asp:TextBox ID="ImportReportLabel" runat="server" Text='<%# Bind("ImportReport")%>' TextMode="MultiLine" 
                                                    CssClass="TextBox" ReadOnly="True" Height="500px" Width="700px"  />
                                            </ItemTemplate>
                                            <EmptyDataTemplate>
                                                <div style="width: 700px; height: 25px;">&nbsp;</div>
                                            </EmptyDataTemplate>
                                        </asp:FormView>
                                        <asp:ObjectDataSource ID="dsReport" runat="server" OldValuesParameterFormatString="original_{0}" 
                                            SelectMethod="GetData" TypeName="dsOperaTableAdapters.ImportTaskReportTableAdapter">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="gvTasks" Name="ImportTaskId" PropertyName="SelectedValue" Type="Int64" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

