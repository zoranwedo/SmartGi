<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" 
    CodeFile="DailyQueryReport.aspx.vb" Inherits="Reports_Accounting_DailyQueryReport" 
    enableEventValidation="false" %>

<%@ Register src="~/App_UserControls/FromToDateControl.ascx" tagname="FromToDateControl" tagprefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Daily Query Report
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" Runat="Server">
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
                    <asp:Panel ID="pnSearch" runat="server" DefaultButton="btReport" style="padding-left: 8px;">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="GridRowClear" style="width: 120px;" >Document Type</td>
                                <td class="GridRowClear" style="width: 480px;" >
                                    <asp:DropDownList ID="ddlDocType" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsDocType" DataTextField="AccDocType" DataValueField="AccDocTypeID">
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsDocType" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="dsAccountTableAdapters.AccDocTypeTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear" style="width: 120px;" >Document Date</td>
                                <td class="GridRowClear" style="width: 480px;" >
                                    <uc:FromToDateControl ID="ctrlDocDate" runat="server"
                                        MandatoryFrom="true"
                                        MandatoryTo="true" />
                                </td>
                            </tr>
                            <tr>
                                <td class="ComandRow2T" style="height: 28px; padding-top: 5px; text-align: right;" >
                                    <asp:CheckBox ID="cbExcel" runat="server" Text="export to Excel" TextAlign="Left" Checked="true" Enabled="false" />
                                </td>
                                <td class="ComandRow2T" style="height: 28px; padding-top: 5px; text-align: right;">
                                    &nbsp;&nbsp;<asp:Button ID="btReport" runat="server" SkinID="skBtnBase" Text="Report" />
                                    &nbsp;&nbsp;<asp:Button ID="btClear" runat="server" SkinID="skBtnClear" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    <asp:ObjectDataSource ID="dsReport" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="dsDailyQueryReportTableAdapters.DailyQueryTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="ctrlDocDate" Name="DocDateFrom" PropertyName="DateFrom" Type="DateTime" />
            <asp:ControlParameter ControlID="ctrlDocDate" Name="DocDateTo" PropertyName="DateTo" Type="DateTime" />
            <asp:ControlParameter ControlID="ddlDocType" Name="DocTypeID" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

