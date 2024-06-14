<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="DailyJournal.aspx.vb" Inherits="Reports_Accounting_DailyJournal" 
    EnableEventValidation="false" %>

<%@ Register src="~/App_UserControls/HotelExpanderControl.ascx" tagname="HotelExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/TourOpExpanderControl.ascx" tagname="TourOpExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/InputDateControl.ascx" tagname="InputDateControl" tagprefix="uc" %>
<%@ Register src="../../App_UserControls/MessagePop.ascx" tagname="MessagePop" tagprefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Daily Journal
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
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px">
                    <asp:Panel ID="pnSearch" runat="server" DefaultButton="btnReport" style="padding-left: 8px;">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="GridRow1B" colspan="2" >
                                    <uc:HotelExpanderControl ID="ctrlHotel" runat="server" 
                                        LabelWidth="120px" ControlWidth="480px" 
                                        CollapsedDefailt="false"
                                        NoCCI="false" />
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
                                <td class="GridRow1B" style="width: 120px;" >As of Date</td>
                                <td class="GridRow1B" style="width: 480px;">
                                    <uc:InputDateControl ID="fltDate" runat="server" 
                                        DefaultNow="true" Mandatory="true" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Department</td>
                                <td class="GridRow1B" >
                                    <asp:DropDownList ID="ddlDep" runat="server" BackColor="White" CssClass="TextBox" />
                                    <asp:CascadingDropDown ID="exDep" runat="server" 
                                        TargetControlID="ddlDep" Category="DepID" 
                                        ServicePath="~/DepEmp.asmx"
                                        ServiceMethod="GetDepID"
                                        UseContextKey="true"
                                        ContextKey="">
                                    </asp:CascadingDropDown>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Employee</td>
                                <td class="GridRow1B" >
                                    <asp:DropDownList ID="ddlEmp" runat="server" BackColor="White" CssClass="TextBox" />
                                    <asp:CascadingDropDown ID="exEmp" runat="server" 
                                        ParentControlID="ddlDep"
                                        TargetControlID="ddlEmp" Category="EmpID" 
                                        ServicePath="~/DepEmp.asmx"
                                        ServiceMethod="GetEmpID">
                                    </asp:CascadingDropDown>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">From Date</td>
                                <td class="GridRow1B">
                                    <uc:InputDateControl ID="fltDocFrom" runat="server" 
                                        DefaultNow="false" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Doc Class
                                </td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlDocClass" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsTrDocClass" DataTextField="TrDocClass" DataValueField="TrDocClass">
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsTrDocClass" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="ReportAccountingTableAdapters.TrDocClassTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Class
                                </td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlClass" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsTrClass" DataTextField="TrClass" DataValueField="TrClass">
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsTrClass" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="ReportAccountingTableAdapters.TrClassTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Tr Code</td>
                                <td class="GridRow1B">
                                    <table cellpadding="0" cellspacing="0" style="border-collapse:collapse; width: 100%;">
                                        <tr>
                                            <td style="width: 445px;">
                                                <asp:UpdatePanel ID="upDocuments" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <asp:TextBox ID="fltDocuments" runat="server" CssClass="TextBox" Width="100%" />
                                                        <asp:PopupControlExtender ID="pceDocApply" runat="server" CommitProperty="Text" PopupControlID="tvPanel"
                                                            Position="Bottom" TargetControlID="fltDocuments">
                                                        </asp:PopupControlExtender>
                                                        <asp:Panel ID="tvPanel" runat="server" BackColor="White" 
                                                            BorderStyle="solid" BorderWidth="1px"
                                                            ScrollBars="Auto" Height="400px" Width="440px">
                                                           <asp:TreeView ID="tvDocuments" runat="server" Width="400px" >
                                                                <NodeStyle CssClass="GridRowClear" />
                                                            </asp:TreeView>
                                                        </asp:Panel>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="btnCloseTV" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </td>
                                            <td style="padding-left: 8px;" >
                                                <asp:ImageButton ID="btnCloseTV" runat="server" ImageUrl="~/Images/Collapse.gif" BorderStyle="Dotted" BorderWidth="1px" BackColor="Control" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Account Type
                                </td>
                                <td class="GridRow1B" colspan="2">
                                    <asp:DropDownList ID="ddlAccType" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsAccType" DataTextField="DisplayType" DataValueField="AccTypeID">
                                        <asp:ListItem Selected="True" Value="">all </asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsAccType" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="AgingBalanceTableAdapters.AccTypeTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Transaction Type</td>
                                <td class="GridRow1B" colspan="2">
                                    <asp:DropDownList ID="ddlTranType" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsTranType" DataTextField="AccTranType" DataValueField="AccTranTypeID">
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsTranType" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="dsAccountTableAdapters.AccTranTypeTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Document Type</td>
                                <td class="GridRow1B" colspan="2">
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
                                <td class="GridRow1B">Document Sign</td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlSign" runat="server" AppendDataBoundItems="True" CssClass="TextBox">
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                        <asp:ListItem>Debit</asp:ListItem>
                                        <asp:ListItem>Credit</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Inv Type</td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlInvType" runat="server" AppendDataBoundItems="True" 
                                        CssClass="TextBox">
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
                                    Affects Income
                                </td>
                                <td class="GridRowClear" colspan="2">
                                    <asp:DropDownList ID="ddlIncome" runat="server" CssClass="TextBox">
                                        <asp:ListItem Text="all" Value="" Selected="True" />
                                        <asp:ListItem Text="Yes" Value="True" />
                                        <asp:ListItem Text="No" Value="False" />
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="ComandRow2T" style="text-align: left;">
                                    <asp:CheckBox ID="cbHotel" runat="server" Text="Hotel" TextAlign="Right" />
                                </td>
                                <td class="ComandRow2T"  colspan="2">
                                    <asp:CheckBox ID="cbGroup" runat="server" Text="Group by TO" TextAlign="Left" Visible="False" />
                                    <asp:CheckBox ID="cbCM" runat="server" Text="Incl.Coop.Marketing" TextAlign="Left" />&nbsp;
                                    <asp:CheckBox ID="cbResp" runat="server" Text="Show Responsibles" TextAlign="Left" />&nbsp;
                                    <asp:CheckBox ID="cbCCI" runat="server" Text="Exclude CCI" TextAlign="Left" /><br />
                                    <asp:CheckBox ID="cbCancel" runat="server" Text="Include cancel" TextAlign="Left" />&nbsp;
                                    <asp:CheckBox ID="cbSort" runat="server" Text="Group by TO" TextAlign="Left" />&nbsp;
                                    <asp:CheckBox ID="cbNote" runat="server" Text="Print Notes" TextAlign="Left" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear" style="height: 28px; padding-top: 5px; text-align: right;">
                                    <asp:CheckBox ID="cbExcel" runat="server" Text="export to Excel" TextAlign="Left" />
                                </td>
                                <td class="GridRow1T" style="height: 28px; padding-top: 5px; text-align: right;" colspan="2">
                                    &nbsp;&nbsp;<asp:Button ID="btnReport" runat="server" SkinID="skBtnBase" Text="Report" />
                                    &nbsp;&nbsp;<asp:Button ID="btnClear" runat="server" SkinID="skBtnClear" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <uc:MessagePop ID="msgPop" runat="server" Title="Document Balance Report" />
    </div>
    <asp:ObjectDataSource ID="dsDailyJournal" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByIncome" TypeName="dsCoopMarketingTableAdapters.AccRepDocJournalTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelId" PropertyName="SelectedHotel" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelGroupID" PropertyName="SelectedHotelGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpId" PropertyName="SelectedTourOp" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpGroupID" PropertyName="SelectedTourOpGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="MarketID" PropertyName="SelectedMarket" Type="String" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="PayCondID" PropertyName="SelectedPayCond" Type="String" />
            <asp:ControlParameter ControlID="fltDocFrom" Name="DateFrom" PropertyName="TextValue" Type="DateTime" />
            <asp:ControlParameter ControlID="fltDate" Name="DateTo" PropertyName="DateValue" Type="DateTime" />
            <asp:ControlParameter ControlID="cbCancel" Name="Canceled" PropertyName="Checked" Type="Boolean" />
            <asp:ControlParameter ControlID="ddlDocClass" Name="TrDocClass" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlClass" Name="TrClass" PropertyName="SelectedValue" Type="String" />
            <asp:Parameter Name="TrCode" Type="String" DefaultValue="" />
            <asp:ControlParameter ControlID="ddlAccType" Name="AccTypeID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlTranType" Name="TranTypeID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlDocType" Name="DocTypeID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlSign" Name="TrSign" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlInvType" Name="InvType" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="ddlIncome" Name="Income" PropertyName="SelectedValue" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
