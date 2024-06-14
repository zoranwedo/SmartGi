<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="AccRepDocBalanceDetail.aspx.vb" Inherits="Reports_Accounting_AccRepDocBalanceDetail"
    EnableEventValidation="false" %>

<%@ Register src="~/App_UserControls/HotelExpanderControl.ascx" tagname="HotelExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/TourOpExpanderControl.ascx" tagname="TourOpExpanderControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/InputDateControl.ascx" tagname="InputDateControl" tagprefix="uc" %>
<%@ Register src="../../App_UserControls/MessagePop.ascx" tagname="MessagePop" tagprefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Document Balance
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
                    <asp:Panel ID="pnSearch" runat="server" DefaultButton="tbReport" style="padding-left: 8px;">
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
                                        UseContextKey="True"
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
                                <td class="GridRow1B">Doc From</td>
                                <td class="GridRow1B">
                                    <uc:InputDateControl ID="fltDocFrom" runat="server" 
                                        DefaultNow="false" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Doc Class</td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlDocClass" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsTrDocClass" DataTextField="TrDocClass" DataValueField="TrDocClass">
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsTrDocClass" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="ReportAccountingTableAdapters.TrDocClassTableAdapter" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Class</td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlClass" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsTrClass" DataTextField="TrClass" DataValueField="TrClass">
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsTrClass" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="ReportAccountingTableAdapters.TrClassTableAdapter" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Tr Code</td>
                                <td class="GridRow1B">
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:TextBox ID="ddlTrSearch" runat="server" CssClass="TextBox" ReadOnly="False" />
                                            <asp:PopupControlExtender ID="pceDocApply" runat="server" CommitProperty="Text" PopupControlID="gvDocToApply"
                                                Position="Center" TargetControlID="ddlTrSearch" />
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
                                                SelectMethod="GetData" TypeName="dsAccountingTableAdapters.AccVwDocFilterTableAdapter" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Account Type</td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlAccType" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsAccType" DataTextField="DisplayType" DataValueField="AccTypeID">
                                        <asp:ListItem Selected="True" Value="">all </asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsAccType" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="AgingBalanceTableAdapters.AccTypeTableAdapter" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Transaction Type</td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlTranType" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsTranType" DataTextField="AccTranType" DataValueField="AccTranTypeID">
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsTranType" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="dsAccountTableAdapters.AccTranTypeTableAdapter" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Document Type</td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlDocType" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsDocType" DataTextField="AccDocType" DataValueField="AccDocTypeID">
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsDocType" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="dsAccountTableAdapters.AccDocTypeTableAdapter" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Document Sign</td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlSign" runat="server" AppendDataBoundItems="True" CssClass="TextBox">
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                        <asp:ListItem Value="D">Debit</asp:ListItem>
                                        <asp:ListItem Value="C">Credit</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Affects Income
                                </td>
                                <td class="GridRow1B" colspan="2">
                                    <asp:DropDownList ID="ddlIncome" runat="server" CssClass="TextBox">
                                        <asp:ListItem Text="all" Value="" Selected="True" />
                                        <asp:ListItem Text="Yes" Value="True" />
                                        <asp:ListItem Text="No" Value="False" />
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear">Balance</td>
                                <td class="GridRowClear">
                                    <asp:DropDownList ID="ddlOptions" runat="server" CssClass="TextBox" >
                                        <asp:ListItem Selected="True" Value="4">All Pending Balance</asp:ListItem>
                                        <asp:ListItem Value="0" >All</asp:ListItem>
                                        <asp:ListItem Value="1" >Pending Balance</asp:ListItem>
                                        <asp:ListItem Value="2" >Fully Applied</asp:ListItem>
                                        <asp:ListItem Value="3" >Non Applied</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="ComandRow2T" style="text-align: left; height: 28px;">
                                    <asp:CheckBox ID="cbHotel" runat="server" Text="Hotel" TextAlign="Right" />
                                </td>
                                <td class="ComandRow2T" style="text-align: right; height: 28px;">
                                    <asp:CheckBox ID="cbCCI" runat="server" Text="Exclude CCI" TextAlign="Left" style="float: left;" />
                                    <asp:Label ID="lblShow" runat="server" Text="Show:" style="margin-right: 5px;"/>
                                    <asp:CheckBox ID="cbNote" runat="server" Text="Notes" TextAlign="Left" />
                                    <asp:CheckBox ID="cbDepartment" runat="server" Text="Responsible" TextAlign="Left" />
                                    <asp:CheckBox ID="cbSource" runat="server" Text="Source Doc." TextAlign="Left" />
                                    <asp:CheckBox ID="cbZero" runat="server" Text="Zero App." TextAlign="Left" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear" style="height: 28px; padding-top: 5px; text-align: right;" >
                                    <asp:CheckBox ID="cbCancel" runat="server" Text="Include cancel" TextAlign="Left" Visible="False" />
                                    <asp:CheckBox ID="cbExcel" runat="server" TextAlign="Left" Text="export to Excel" Checked="true" />
                                </td>
                                <td class="GridRow1T" style="height: 28px; padding-top: 5px; text-align: right;" >
                                    &nbsp;&nbsp;<asp:Button ID="tbReport" runat="server" SkinID="skBtnBase" Text="Report" />
                                    &nbsp;&nbsp;<asp:Button ID="btDetail" runat="server" SkinID="skBtnBase" Text="Detail Report" />
                                    &nbsp;&nbsp;<asp:Button ID="btClear" runat="server" SkinID="skBtnClear" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <uc:MessagePop ID="msgPop" runat="server" Title="Document Balance Report" />
    </div>
    <asp:ObjectDataSource ID="dsBalanceDetail_new" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByIncome" TypeName="AccRepDocBalanceDetailTableAdapters.AccRepDocBalanceDetail_newTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelId" PropertyName="SelectedHotel" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelGroupID" PropertyName="SelectedHotelGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpId" PropertyName="SelectedTourOp" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpGroupID" PropertyName="SelectedTourOpGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="MarketID" PropertyName="SelectedMarket" Type="String" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="PayCondID" PropertyName="SelectedPayCond" Type="String" />
            <asp:ControlParameter ControlID="fltDate" Name="AsOffDate" PropertyName="DateValue" Type="DateTime" />
            <asp:ControlParameter ControlID="fltDocFrom" Name="DocFrom" PropertyName="TextValue" Type="DateTime" />
            <asp:ControlParameter ControlID="ddlDocClass" Name="TrDocClass" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlClass" Name="TrClass" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlTrSearch" Name="TrCode" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="ddlAccType" Name="AccTypeID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlTranType" Name="TranTypeID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlDocType" Name="DocTypeID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlSign" Name="TrSign" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlOptions" Name="RptOption" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="ddlDep" Name="DepID" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="ddlEmp" Name="EmpID" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="cbZero" Name="Zero" PropertyName="Checked" Type="Boolean" />
            <asp:ControlParameter ControlID="ddlIncome" Name="Income" PropertyName="SelectedValue" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsBalance_new" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataByIncome" TypeName="AccRepDocBalanceDetailTableAdapters.AccRepDocBalance_newTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelId" PropertyName="SelectedHotel" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelGroupID" PropertyName="SelectedHotelGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpId" PropertyName="SelectedTourOp" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpGroupID" PropertyName="SelectedTourOpGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="MarketID" PropertyName="SelectedMarket" Type="String" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="PayCondID" PropertyName="SelectedPayCond" Type="String" />
            <asp:ControlParameter ControlID="fltDate" Name="AsOffDate" PropertyName="DateValue" Type="DateTime" />
            <asp:ControlParameter ControlID="fltDocFrom" Name="DocFrom" PropertyName="TextValue" Type="DateTime" />
            <asp:ControlParameter ControlID="ddlDocClass" Name="TrDocClass" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlClass" Name="TrClass" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlTrSearch" Name="TrCode" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="ddlAccType" Name="AccTypeID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlTranType" Name="TranTypeID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlDocType" Name="DocTypeID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlSign" Name="TrSign" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlOptions" Name="RptOption" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlDep" Name="DepID" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="ddlEmp" Name="EmpID" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="ddlIncome" Name="Income" PropertyName="SelectedValue" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <%--<asp:ObjectDataSource ID="dsBalanceDetail" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="AccRepDocBalanceDetailTableAdapters.AccRepDocBalanceDetailTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelId" PropertyName="SelectedHotel" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelGroupID" PropertyName="SelectedHotelGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpId" PropertyName="SelectedTourOp" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpGroupID" PropertyName="SelectedTourOpGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="MarketID" PropertyName="SelectedMarket" Type="String" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="PayCondID" PropertyName="SelectedPayCond" Type="String" />
            <asp:ControlParameter ControlID="fltDate" Name="AsOffDate" PropertyName="DateValue" Type="DateTime" />
            <asp:ControlParameter ControlID="fltDocFrom" Name="DocFrom" PropertyName="TextValue" Type="DateTime" />
            <asp:ControlParameter ControlID="ddlDocClass" Name="TrDocClass" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlClass" Name="TrClass" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlTrSearch" Name="TrCode" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="ddlAccType" Name="AccTypeID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlTranType" Name="TranTypeID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlDocType" Name="DocTypeID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlSign" Name="TrSign" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlOptions" Name="RptOption" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="ddlDep" Name="DepID" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="ddlEmp" Name="EmpID" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="cbZero" Name="Zero" PropertyName="Checked" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsBalance" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="AccRepDocBalanceDetailTableAdapters.AccRepDocBalanceTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelId" PropertyName="SelectedHotel" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlHotel" Name="HotelGroupID" PropertyName="SelectedHotelGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpId" PropertyName="SelectedTourOp" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpGroupID" PropertyName="SelectedTourOpGroup" Type="Int32" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="MarketID" PropertyName="SelectedMarket" Type="String" />
            <asp:ControlParameter ControlID="ctrlTourOp" Name="PayCondID" PropertyName="SelectedPayCond" Type="String" />
            <asp:ControlParameter ControlID="fltDate" Name="AsOffDate" PropertyName="DateValue" Type="DateTime" />
            <asp:ControlParameter ControlID="fltDocFrom" Name="DocFrom" PropertyName="TextValue" Type="DateTime" />
            <asp:ControlParameter ControlID="ddlDocClass" Name="TrDocClass" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlClass" Name="TrClass" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlTrSearch" Name="TrCode" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="ddlAccType" Name="AccTypeID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlTranType" Name="TranTypeID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlDocType" Name="DocTypeID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlSign" Name="TrSign" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlOptions" Name="RptOption" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlDep" Name="DepID" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="ddlEmp" Name="EmpID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>--%>
</asp:Content>
