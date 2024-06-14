<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="UnapprovedJournal.aspx.vb" Inherits="Reports_Accounting_UnapprovedJournal" %>

<%@ Register Assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
    Namespace="System.Web.UI.WebControls" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Unapproved Documents Journal 
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
                    <asp:Panel ID="pnSearch" runat="server" Style="width: 600px" DefaultButton="btReport">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="GridRow1B" style="width: 120px;">
                                    Hotel
                                </td>
                                <td class="GridRow1B" style="width: 480px;">
                                    <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" DataSourceID="dsHotel"
                                        DataTextField="Hotel" DataValueField="HotelID" AppendDataBoundItems="True">
                                        <asp:ListItem Value="">all</asp:ListItem>
                                        <asp:ListItem Value="-1">Hotel Group</asp:ListItem>
                                    </asp:DropDownList>
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
                                        TypeName="dsGroupsTableAdapters.HotelGroupTableAdapter"
                                        SelectMethod="GetData">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Tour&nbsp;Operator
                                </td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlTO" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsTOAll" DataTextField="TourOp" DataValueField="TourOpID">
                                        <asp:ListItem Selected="True" Value="">all </asp:ListItem>
                                        <asp:ListItem Value="-1">TO Group</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsTOAll" runat="server" 
                                        TypeName="TourOperTableAdapters.TourOpTableAdapter"
                                        SelectMethod="GetDataByUser">
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
                                        SelectMethod="GetData" >
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Pay Condition
                                </td>
                                <td class="GridRow1B" style="width: 400px;">
                                    <asp:DropDownList ID="ddlPay" runat="server" CssClass="TextBox" DataSourceID="dsPayCond"
                                        DataTextField="PayCond" DataValueField="PayCondID" AppendDataBoundItems="True">
                                        <asp:ListItem Selected="True" Value="">all pay cond.</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsPayCond" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="TourOperTableAdapters.PayCondTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    From Date
                                </td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="fltStart" runat="server" CssClass="TextBox" />
                                    <asp:CalendarExtender ID="fltStart_CalendarExtender" runat="server" CssClass="cal_Theme1"
                                        Enabled="True" TargetControlID="fltStart">
                                    </asp:CalendarExtender>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="fltStart"
                                        Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date">
                                    </asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    To Date
                                </td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="fltFinish" runat="server" CssClass="TextBox" />
                                    <asp:CompareValidator ID="CompareValidator8" runat="server" ControlToValidate="fltFinish"
                                        Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator8_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator8">
                                    </asp:ValidatorCalloutExtender>
                                    <asp:CalendarExtender ID="fltFinish_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="fltFinish" CssClass="cal_Theme1">
                                    </asp:CalendarExtender>
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
                                <td class="GridRow1B">
                                    Tr Code
                                </td>
                                <td class="GridRow1B">
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" Text="All" Checked="True" />
                                            <asp:TextBox ID="ddlTrSearch" runat="server" CssClass="TextBox" ReadOnly="False" AutoPostBack="True" Width="88%" />
                                            <asp:PopupControlExtender ID="pceDocApply" runat="server" CommitProperty="Text" PopupControlID="gvDocToApply"
                                                Position="Center" TargetControlID="ddlTrSearch">
                                            </asp:PopupControlExtender>
                                            <asp:GridView ID="gvDocToApply" runat="server" AutoGenerateColumns="False" BackColor="White"
                                                CssClass="GridBorder" DataSourceID="dsTrCode" GridLines="None" OnSelectedIndexChanged="gvDocToApply_SelectedIndexChanged"
                                                ShowHeader="False" Width="397px" DataKeyNames="ApplyTo">
                                                <RowStyle CssClass="GridRowClear" HorizontalAlign="Left" />
                                                <Columns>
                                                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" ShowSelectButton="True">
                                                        <ItemStyle Width="20px" />
                                                    </asp:CommandField>
                                                    <asp:BoundField DataField="ApplyTo" HeaderText="ApplyTo" SortExpression="ApplyTo">
                                                        <ItemStyle Width="100px" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="TrDescription" HeaderText="TrDescription" SortExpression="TrDescription" />
                                                </Columns>
                                                <SelectedRowStyle CssClass="SelectRowClear" />
                                            </asp:GridView>
                                            <asp:ObjectDataSource ID="dsTrCode" runat="server" OldValuesParameterFormatString="original_{0}"
                                                SelectMethod="GetData" TypeName="dsAccountingTableAdapters.AccVwDocFilterTableAdapter">
                                            </asp:ObjectDataSource>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Account Type
                                </td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlAccType" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsAccType" DataTextField="AccType" DataValueField="AccTypeID">
                                        <asp:ListItem Selected="True" Value="">all </asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsAccType" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="dsAccountTableAdapters.AccTypeTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Transaction Type
                                </td>
                                <td class="GridRow1B">
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
                                <td class="GridRow1B">
                                    Document Type
                                </td>
                                <td class="GridRow1B">
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
                                <td class="GridRow1B">
                                    Document Sign
                                </td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlSign" runat="server" AppendDataBoundItems="True" CssClass="TextBox">
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                        <asp:ListItem>Debit</asp:ListItem>
                                        <asp:ListItem>Credit</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Inv Type
                                </td>
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
                                <td class="GridRow1B">
                                    Department
                                </td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlDep" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsDept" DataTextField="DepName" DataValueField="DepID" AutoPostBack="True">
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsDept" runat="server" 
                                        OldValuesParameterFormatString="original_{0}" 
                                        TypeName="dsMaintBasicTableAdapters.DepartmentTableAdapter"
                                        SelectMethod="GetData">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear">
                                    Employee
                                </td>
                                <td class="GridRowClear">
                                    <asp:DropDownList ID="ddlEmp" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsEmp" DataTextField="EmpName" DataValueField="EmpID">
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsEmp" runat="server" 
                                        OldValuesParameterFormatString="original_{0}" 
                                        TypeName="dsMaintBasicTableAdapters.EmployeeTableAdapter"
                                        SelectMethod="GetDataByDepID">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlDep" Name="DepID" PropertyName="SelectedValue" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="ComandRow2T" style="text-align: left;">
                                    <asp:CheckBox ID="cbHotel" runat="server" Text="Hotel" TextAlign="Right" />
                                </td>
                                <td class="ComandRow2T" >
                                    &nbsp;&nbsp;<asp:CheckBox ID="cbGroup" runat="server" Text="Group by TO" TextAlign="Left" Visible="False" />
                                    &nbsp;&nbsp;<asp:CheckBox ID="cbCancel" runat="server" Text="Include cancel" TextAlign="Left" Visible="False" />
                                    &nbsp;&nbsp;<asp:CheckBox ID="cbSort" runat="server" Text="Group by TO" TextAlign="Left" />
                                    &nbsp;&nbsp;<asp:CheckBox ID="cbNote" runat="server" Text="Print Notes" TextAlign="Left" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear" style="height: 28px; padding-top: 5px; text-align: right;">
                                    <asp:CheckBox ID="cbExcel" runat="server" Text="export to Excel" TextAlign="Left" />
                                </td>
                                <td class="GridRow1T" style="height: 28px; padding-top: 5px; text-align: right;">
                                    &nbsp;&nbsp;<asp:Button ID="btReport" runat="server" SkinID="skBtnBase" Text="Report" />
                                    &nbsp;&nbsp;<asp:Button ID="Button1" runat="server" SkinID="skBtnFilter" Visible="False" />
                                    &nbsp;&nbsp;<asp:Button ID="btClear" runat="server" SkinID="skBtnClear" />
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
        <asp:ObjectDataSource ID="dsHotel" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="dsInvoicesTableAdapters.HotelTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value"
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <table cellpadding="0" cellspacing="0">
            <asp:Panel runat="server" ID="pnlCnt" Width="700px" Visible="False">
                <tr>
                    <td class="GridLabelBG">
                        <asp:Label ID="lbHotels" runat="server" SkinID="skGridLabel" Text="Invoices"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="GridBorder">
                        <asp:GridView ID="GridView1" runat="server" DataSourceID="dsDailyJournal" SkinID="skGridView">
                            <Columns>
                                <asp:BoundField DataField="HotelId" HeaderText="HotelId" SortExpression="HotelId" />
                                <asp:BoundField DataField="Hotel" HeaderText="Hotel" SortExpression="Hotel" />
                                <asp:BoundField DataField="TourOpId" HeaderText="TourOpId" SortExpression="TourOpId"/>
                                <asp:BoundField DataField="TourOp" HeaderText="TourOp" SortExpression="TourOp" />
                                <asp:BoundField DataField="MarketId" HeaderText="MarketId" SortExpression="MarketId" />
                                <asp:BoundField DataField="PayModeID" HeaderText="PayModeID" SortExpression="PayModeID"/>
                                <asp:BoundField DataField="CreditDays" HeaderText="CreditDays" SortExpression="CreditDays"/>
                                <asp:BoundField DataField="TransDate" HeaderText="TransDate" SortExpression="TransDate" DataFormatString="{0:d}" HtmlEncode="False"/>
                                <asp:BoundField DataField="DocNumber" HeaderText="DocNumber" SortExpression="DocNumber" />
                                <asp:BoundField DataField="DocOrd" HeaderText="DocOrd" SortExpression="DocOrd" />
                                <asp:BoundField DataField="DocCode" HeaderText="DocCode" SortExpression="DocCode" />
                                <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                                <asp:BoundField DataField="TrDocClass" HeaderText="TrDocClass" SortExpression="TrDocClass" />
                                <asp:BoundField DataField="TrClass" HeaderText="TrClass" SortExpression="TrClass" />
                                <asp:BoundField DataField="TrAccount" HeaderText="TrAccount" SortExpression="TrAccount" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </asp:Panel>
        </table>
        <asp:ObjectDataSource ID="dsDailyJournal" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetUnapproved" TypeName="ReportAccountingTableAdapters.AccRepDocJournalTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlHotelGroup" Name="HotelGroupID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlTO" Name="TourOpId" PropertyName="SelectedValue" Type="Int32" DefaultValue="" />
                <asp:ControlParameter ControlID="ddlTOGroup" Name="TourOpGroupID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlMarkets" Name="MarketID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddlPay" Name="PayCondID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="fltStart" Name="DateFrom" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="fltFinish" Name="DateTo" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="cbCancel" Name="Canceled" PropertyName="Checked" Type="Boolean" />
                <asp:ControlParameter ControlID="ddlDocClass" Name="TrDocClass" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddlClass" Name="TrClass" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddlTrSearch" Name="TrCode" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="ddlAccType" Name="AccTypeID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddlTranType" Name="TranTypeID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddlDocType" Name="DocTypeID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddlSign" Name="TrSign" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddlInvType" Name="InvType" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
