<%@ Page Language="VB" MasterPageFile="~/Maintenance/SihotRates/RateSihot.master" AutoEventWireup="false" 
    CodeFile="RateImported.aspx.vb" Inherits="Maintenance_SihotRates_RateImported" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Imported Rate Files 
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
                                    Last Checked On
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
                            <%--
                            <tr>
                                <td class="GridRowClear" style="width: 100px;">
                                    Hotel Code
                                </td>
                                <td class="GridRowClear" style="width: 500px;" colspan="2">
                                    <asp:DropDownList ID="fltHotel" runat="server" CssClass="TextBox" 
                                        DataSourceID="dsHotelCode" DataTextField="HOTEL_NO" DataValueField="HOTEL_NO"
                                        AppendDataBoundItems="True">
                                        <asp:ListItem Text="all" Value="-1" />
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsHotelCode" runat="server" 
                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                        TypeName="dsSIHOTTableAdapters.HotelCodeTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            --%>
                            <tr>
                                <td class="GridRowClear" style="width: 100px;">
                                    Checked From
                                </td>
                                <td class="GridRowClear" style="width: 500px;" colspan="2">
                                    <asp:TextBox ID="fltCFrom" runat="server" CssClass="TextBox" />
                                    <asp:CalendarExtender ID="fltCFrom_Calendar" runat="server" CssClass="cal_Theme1" 
                                        TargetControlID="fltCFrom" Enabled="True" />
                                    <asp:CompareValidator ID="fltCFrom_Date" runat="server" Operator="DataTypeCheck" Type="Date" 
                                        ControlToValidate="fltCFrom" Display="None" ErrorMessage="Not a valid date!" />
                                    <asp:ValidatorCalloutExtender ID="fltCFrom_DateCallout" runat="server" Enabled="True" 
                                        TargetControlID="fltCFrom_Date" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear" style="width: 100px;">
                                    Checked To
                                </td>
                                <td class="GridRowClear" style="width: 500px;" colspan="2">
                                    <asp:TextBox ID="fltCTo" runat="server" CssClass="TextBox" />
                                    <asp:CalendarExtender ID="fltCTo_Calendar" runat="server" CssClass="cal_Theme1" 
                                        TargetControlID="fltCTo" Enabled="True" />
                                    <asp:CompareValidator ID="fltCTo_Date" runat="server" Operator="DataTypeCheck" Type="Date" 
                                        ControlToValidate="fltCTo" Display="None" ErrorMessage="Not a valid date!" />
                                    <asp:ValidatorCalloutExtender ID="fltCTo_DateCallout" runat="server" Enabled="True" 
                                        TargetControlID="fltCTo_Date" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear" style="width: 100px;">
                                    File From
                                </td>
                                <td class="GridRowClear" style="width: 500px;" colspan="2">
                                    <asp:TextBox ID="fltFFrom" runat="server" CssClass="TextBox" />
                                    <asp:CalendarExtender ID="fltFFrom_Calendar" runat="server" CssClass="cal_Theme1" 
                                        TargetControlID="fltFFrom" Enabled="True" />
                                    <asp:CompareValidator ID="fltFFrom_Date" runat="server" Operator="DataTypeCheck" Type="Date" 
                                        ControlToValidate="fltFFrom" Display="None" ErrorMessage="Not a valid date!" />
                                    <asp:ValidatorCalloutExtender ID="fltFFrom_DateCallout" runat="server" Enabled="True" 
                                        TargetControlID="fltFFrom_Date" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear" style="width: 100px;">
                                    File To
                                </td>
                                <td class="GridRowClear" style="width: 500px;" colspan="2">
                                    <asp:TextBox ID="fltFTo" runat="server" CssClass="TextBox" />
                                    <asp:CalendarExtender ID="fltFTo_Calendar" runat="server" CssClass="cal_Theme1" 
                                        TargetControlID="fltFTo" Enabled="True" />
                                    <asp:CompareValidator ID="fltFTo_Date" runat="server" Operator="DataTypeCheck" Type="Date" 
                                        ControlToValidate="fltFTo" Display="None" ErrorMessage="Not a valid date!" />
                                    <asp:ValidatorCalloutExtender ID="fltFTo_DateCallout" runat="server" Enabled="True" 
                                        TargetControlID="fltFTo_Date" />
                                </td>
                            </tr>
                            </asp:Panel>
                            <tr>
                                <td class="ComandRow2T" colspan="2" 
                                    style="width: 200px; height: 30px; padding-top: 5px; text-align: left;">
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
                    <asp:Label ID="lbServiceLog" runat="server" Text="Imported" SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:TabContainer ID="tabImported" runat="server" ActiveTabIndex="0" >
                        <asp:TabPanel ID="tpQueue" runat="server" HeaderText="Files" style="float: left;" >
                            <ContentTemplate>
                                <asp:GridView ID="gvImported" runat="server" DataSourceID="dsImported" DataKeyNames="importUID"
                                    SkinID="skGridView" AutoGenerateColumns="False" 
                                    EnableModelValidation="True">
                                    <HeaderStyle Wrap="False" Font-Names="Calibri" /> 
                                    <RowStyle Wrap="False" Font-Names="Calibri" />
                                    <Columns>
                                        <asp:BoundField DataField="importUID" HeaderText="importUID" ReadOnly="True" Visible="False" SortExpression="importUID" />
                                        <asp:BoundField DataField="importState" HeaderText="importState" Visible="False" SortExpression="importState" />
                                        <asp:BoundField DataField="filePath" HeaderText="filePath" SortExpression="filePath" Visible="False" />
                                        <asp:BoundField DataField="hotelCode" HeaderText="Hotel Code" SortExpression="hotelCode" Visible="False" >
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="fileDate" HeaderText="File Date" DataFormatString="{0:d}" SortExpression="fileDate">
                                            <ItemStyle Width="90px" />
                                        </asp:BoundField>
                                        <asp:CheckBoxField DataField="stateImported" HeaderText="Imported" ReadOnly="True" SortExpression="stateImported">
                                            <ItemStyle Width="70px" />
                                        </asp:CheckBoxField>
                                        <asp:CheckBoxField DataField="stateCanceled" HeaderText="Canceled" ReadOnly="True" SortExpression="stateCanceled">
                                            <ItemStyle Width="70px" />
                                        </asp:CheckBoxField>
                                        <asp:BoundField DataField="fileID" SortExpression="fileID" >
                                            <ItemStyle Width="30px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="fileExpected" HeaderText="File" SortExpression="fileExpected">
                                            <ItemStyle Width="600px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="lastChecked" HeaderText="Processed" SortExpression="lastChecked">
                                            <ItemStyle Width="150px" />
                                        </asp:BoundField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <div style="width: 760px; height: 30px; font-family: Calibri;" >
                                            No imported rate files for filter criteria.
                                        </div> 
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:TabPanel>
                        <asp:TabPanel ID="tpLog" runat="server" HeaderText="Import Log" style="float: left;" >
                            <ContentTemplate>
                                <%--<asp:GridView ID="gvImportLog" runat="server" DataSourceID="dsLog"
                                    SkinID="skGridView" AutoGenerateColumns="False" GridLines="Both"
                                    EnableModelValidation="True">--%>
                                <asp:GridView ID="gvImportLog" runat="server" DataSourceID="dsLog"
                                    SkinID="skGridView" AutoGenerateColumns="False" EnableModelValidation="True"
                                    AllowPaging="true" PageSize="50">
                                    <HeaderStyle Font-Names="Calibri" /> 
                                    <RowStyle Wrap="False" Font-Names="Calibri" /> 
                                    <Columns>
                                        <asp:BoundField DataField="logDate" HeaderText="Date" SortExpression="logDate" >
                                            <ItemStyle Width="150px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="logCode" HeaderText="logCode" SortExpression="logCode" Visible="false" >
                                            <ItemStyle Width="50px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="fileID" HeaderText="FileID" SortExpression="fileID" >
                                            <ItemStyle Width="50px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="rateType" HeaderText="Rate" SortExpression="rateType">
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="rateId" HeaderText="ID" SortExpression="rateId">
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="logMess" HeaderText="Message" SortExpression="logMess">
                                            <ItemStyle Width="825px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="importUID" HeaderText="importUID" SortExpression="importUID" Visible="False" />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <div style="width: 760px; height: 30px; font-family: Calibri;" >
                                            No imported rate logs for filter criteria.
                                        </div> 
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:TabPanel>
                    </asp:TabContainer>
                </td>
            </tr>
        </table>
    </div>
    <asp:ObjectDataSource ID="dsImported" runat="server" OldValuesParameterFormatString="original_{0}"
        TypeName="dsSIHOTTableAdapters.RateQueueTableAdapter" 
        SelectMethod="GetImported" >
        <SelectParameters>
            <asp:ControlParameter ControlID="fltDate" Name="ckDate" PropertyName="Text" Type="DateTime" />
            <%--<asp:ControlParameter ControlID="fltHotel" Name="Hotel" PropertyName="SelectedValue" Type="Int32" />--%>
            <asp:Parameter Name="Hotel" Type="Int32" DefaultValue="-1" />
            <asp:ControlParameter ControlID="fltCFrom" Name="ckFrom" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="fltCTo" Name="ckTo" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="fltFFrom" Name="rsFrom" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="fltFTo" Name="rsTo" PropertyName="Text" Type="DateTime" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsLog" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="dsSIHOTTableAdapters.LogTableTableAdapter">
        <SelectParameters>
            <%--<asp:Parameter Name="ckDate" Type="DateTime" />--%>
            <%--<asp:Parameter Name="ckFrom" Type="DateTime" />--%>
            <%--<asp:Parameter Name="ckTo" Type="DateTime" />--%>
            <asp:ControlParameter ControlID="fltDate" Name="ckDate" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="fltCFrom" Name="ckFrom" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="fltCTo" Name="ckTo" PropertyName="Text" Type="DateTime" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

