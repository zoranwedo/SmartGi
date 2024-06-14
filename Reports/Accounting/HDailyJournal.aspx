<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" CodeFile="HDailyJournal.aspx.vb" Inherits="Reports_Accounting_HDailyJournal" %>

<%@ Register assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" namespace="System.Web.UI.WebControls" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Daily Journal
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
                    <asp:Panel ID="pnSearch" runat="server" Style="width: 600px" DefaultButton="Button3">
                            <table cellpadding="0" cellspacing="0">
                                <tr style="width: 600px;">
                                    <td class="GridRow1B" style="width: 120px;" >
                                        Hotel<span class="Red">*</span>
                                    </td>
                                    <td class="GridRow1B" style="width: 480px;" >
                                        <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" DataSourceID="dsHotel"
                                            DataTextField="Hotel" DataValueField="HotelID" AppendDataBoundItems="True" 
                                            AutoPostBack="True">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" >
                                        Tour&nbsp;Operator
                                        </td>
                                    <td class="GridRow1B" >
                                        <asp:DropDownList ID="ddlTO" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                            DataSourceID="dsTOAll" DataTextField="TourOp" DataValueField="TourOpID">
                                            <asp:ListItem Selected="True" Value="">all </asp:ListItem>
                                            <asp:ListItem Value="-1">TO Group</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsTOAll" runat="server" OldValuesParameterFormatString="original_{0}" 
                                            SelectMethod="GetDataByUser" 
                                            TypeName="TourOperTableAdapters.TourOpTableAdapter">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="hfUsername" Name="User" PropertyName="Value" Type="String" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" >
                                        Tour&nbsp;Operator Group
                                        </td>
                                    <td class="GridRow1B" >
                                        <asp:DropDownList ID="ddlTOGroup" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                            DataSourceID="dsTOGroup" DataTextField="TourOpGroup" DataValueField="TourOpGroupID">
                                            <asp:ListItem Selected="True" Value="">none</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsTOGroup" runat="server" OldValuesParameterFormatString="original_{0}" 
                                            SelectMethod="GetData" 
                                            TypeName="dsGroupsTableAdapters.TourOpGroupTableAdapter">
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Market
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:DropDownList ID="ddlMarkets" runat="server" AppendDataBoundItems="True" 
                                            CssClass="TextBox" DataSourceID="dsMarkets" DataTextField="Market" 
                                            DataValueField="MarketID">
                                            <asp:ListItem Selected="True" Value="">all markets</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsMarkets" runat="server" OldValuesParameterFormatString="original_{0}" 
                                            SelectMethod="GetData" TypeName="TourOperTableAdapters.MarketTableAdapter" >
                                        </asp:ObjectDataSource>
                                    </td>
                                    <td class="GridRow1B">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                <td class="GridRow1B">
                                    Pay Condition
                                </td>
                                <td class="GridRow1B" style="width: 400px;">
                                    <asp:DropDownList ID="ddlPay" runat="server" CssClass="TextBox" DataSourceID="dsPayCond"
                                        DataTextField="PayCond" DataValueField="PayCondID" 
                                        AppendDataBoundItems="True" EnableViewState="False">
                                        <asp:ListItem Selected="True" Value="">all pay cond.</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsPayCond" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="TourOperTableAdapters.PayCondTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                                <td class="GridRow1B">
                                </td>
                            </tr>
                            <tr>
                                    <td class="GridRow1B">
                                        From Date
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="fltStart" runat="server" CssClass="TextBox" />
                                        <asp:CalendarExtender ID="fltStart_CalendarExtender" runat="server" 
                                            CssClass="cal_Theme1" Enabled="True" TargetControlID="fltStart">
                                        </asp:CalendarExtender>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="fltStart"
                                            Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                    </td>
                                    <td class="GridRow1B">
                                        &nbsp;
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
                                    <td class="GridRow1B">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" >
                                        Doc Class</td>
                                    <td class="GridRow1B">
                                        <asp:DropDownList ID="ddlDocClass" runat="server" AppendDataBoundItems="True" 
                                            CssClass="TextBox" DataSourceID="dsTrDocClass" DataTextField="TrDocClass" 
                                            DataValueField="TrDocClass" EnableViewState="False">
                                            <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsTrDocClass" runat="server" OldValuesParameterFormatString="original_{0}" 
                                            SelectMethod="GetDataDocClassByHotel" 
                                            TypeName="ReportAccountingTableAdapters.DocClassByHotelTableAdapter">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" >
                                        Class</td>
                                    <td class="GridRow1B">
                                        <asp:DropDownList ID="ddlClass" runat="server" AppendDataBoundItems="True" 
                                            CssClass="TextBox" DataSourceID="dsTrClass" DataTextField="TrClass" 
                                            DataValueField="TrClass" EnableViewState="False">
                                            <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsTrClass" runat="server" OldValuesParameterFormatString="original_{0}" 
                                            SelectMethod="GetDataClassByHotel" 
                                            TypeName="ReportAccountingTableAdapters.ClassByHotelTableAdapter">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" >
                                        Tr Code</td>
                                    <td class="GridRow1B">
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
             <ContentTemplate>
                                            <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" Text="All" 
                                                Checked="True" />
                                            <asp:TextBox ID="ddlTrSearch" runat="server" CssClass="TextBox" 
                                                ReadOnly="False" AutoPostBack="True" />
                                            <asp:PopupControlExtender ID="pceDocApply" runat="server" CommitProperty="Text" PopupControlID="gvDocToApply"
                                                    Position="Center" TargetControlID="ddlTrSearch">
                                                </asp:PopupControlExtender>
                                                <asp:GridView ID="gvDocToApply" runat="server" AutoGenerateColumns="False" BackColor="White"
                                                    CssClass="GridBorder"
                                                    DataSourceID="dsTrCode" GridLines="None" OnSelectedIndexChanged="gvDocToApply_SelectedIndexChanged"
                                                    ShowHeader="False" Width="397px" DataKeyNames="ApplyTo">
                                                    <RowStyle CssClass="GridRowClear" HorizontalAlign="Left" />
                                                    <Columns>
                                                        <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" 
                                                            ShowSelectButton="True">
                                                            <ItemStyle Width="20px" />
                                                        </asp:CommandField>
                                                        <asp:BoundField DataField="ApplyTo" HeaderText="ApplyTo" 
                                                            SortExpression="ApplyTo">
                                                            <ItemStyle Width="100px" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="TrDescription" HeaderText="TrDescription" 
                                                            SortExpression="TrDescription" />
                                                    </Columns>
                                                    <SelectedRowStyle CssClass="SelectRowClear" />
                                                </asp:GridView>
                                            <asp:ObjectDataSource ID="dsTrCode" runat="server" OldValuesParameterFormatString="original_{0}"
                                                SelectMethod="GetDataByHotel" 
                                                TypeName="dsAccountingTableAdapters.AccVwDocFilterTableAdapter">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" 
                                                        PropertyName="SelectedValue" Type="Int32" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                                </ContentTemplate>
    </asp:UpdatePanel>
                                        </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" >
                                        Account Type</td>
                                    <td class="GridRow1B">
                                        <asp:DropDownList ID="ddlAccType" runat="server" AppendDataBoundItems="True" 
                                            CssClass="TextBox" DataSourceID="dsAccType" DataTextField="AccountType" 
                                            DataValueField="AccountTypeID" EnableViewState="False">
                                            <asp:ListItem Selected="True" Value="">all </asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsAccType" runat="server" OldValuesParameterFormatString="original_{0}" 
                                            SelectMethod="GetDataAccTypeByHotel" 
                                            TypeName="ReportAccountingTableAdapters.AccTypeByHotelTableAdapter">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" >
                                        Transaction Type</td>
                                    <td class="GridRow1B">
                                        <asp:DropDownList ID="ddlTranType" runat="server" AppendDataBoundItems="True" 
                                            CssClass="TextBox" DataSourceID="dsTranType" DataTextField="TranType" 
                                            DataValueField="TranTypeID" EnableViewState="False">
                                            <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsTranType" runat="server" OldValuesParameterFormatString="original_{0}" 
                                            SelectMethod="GetDataRegTypeByHotel" 
                                            TypeName="ReportAccountingTableAdapters.TransTypeByHotelTableAdapter">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" 
                                                    PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" >
                                        Document Type</td>
                                    <td class="GridRow1B">
                                        <asp:DropDownList ID="ddlDocType" runat="server" AppendDataBoundItems="True" 
                                            CssClass="TextBox" DataSourceID="dsDocType" DataTextField="AccDocType" 
                                            DataValueField="AccDocTypeID" EnableViewState="False">
                                            <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsDocType" runat="server" OldValuesParameterFormatString="original_{0}" 
                                            SelectMethod="GetData" 
                                            TypeName="dsAccountTableAdapters.AccDocTypeTableAdapter">
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" >
                                        Document Sign</td>
                                    <td class="GridRow1B">
                                        <asp:DropDownList ID="ddlSign" runat="server" AppendDataBoundItems="True" 
                                            CssClass="TextBox">
                                            <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                            <asp:ListItem>Debit</asp:ListItem>
                                            <asp:ListItem>Credit</asp:ListItem>
                                        </asp:DropDownList>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Inv Type</td>
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
                                        <asp:CheckBox ID="cbHotel" runat="server" Text="Hotel" TextAlign="Left" 
                                            Checked="True" Visible="False" />
                                    </td>
                                    <td class="GridRowClear">
                                        <asp:CheckBox ID="cbCancel" runat="server" Text="Include cancel" TextAlign="Left" />
                                        &nbsp;<asp:CheckBox ID="cbSort" runat="server" Text="Sort by TO" TextAlign="Left" />
                                        &nbsp;<asp:CheckBox ID="cbNote" runat="server" Text="Print Notes" TextAlign="Left" />
                                        &nbsp;<asp:CheckBox ID="cbExcel" runat="server" 
                                            style="padding-right: 5px; width : 370px" Text="export to Excel" 
                                            TextAlign="Left" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="ComandRow2T" style="height: 30px; padding-top: 5px">
                                        &nbsp;</td>
                                    <td class="ComandRow2T" colspan="2" style="height: 30px; padding-top: 5px">
                                        &nbsp; &nbsp;&nbsp;&nbsp;<asp:Button ID="Button3" runat="server" SkinID="skBtnBase" Text="Report" />
                                        &nbsp;&nbsp;<asp:Button ID="Button1" runat="server" SkinID="skBtnFilter" 
                                            Visible="False" />
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
        
                <asp:ObjectDataSource ID="dsHotel" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" 
                    TypeName="dsInvoicesTableAdapters.HotelTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="hfUsername" Name="UserName" 
                            PropertyName="Value" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                
                <table cellpadding="0" cellspacing="0">
                 
                 <asp:Panel runat="server" ID="pnlCnt" Width="700px" Visible="False">  <%--Visible="False"--%> 
                 
                        <tr>
                            <td class="GridLabelBG">
                                <asp:Label ID="lbHotels" runat="server" SkinID="skGridLabel" Text="Invoices"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="GridBorder">
                             <asp:GridView ID="GridView1" runat="server" DataSourceID="dsDailyJournal" 
                    SkinID="skGridView">
                    <Columns>
                        
                        <asp:BoundField DataField="HotelId" HeaderText="HotelId" 
                            SortExpression="HotelId" >
                        </asp:BoundField>
                        <asp:BoundField DataField="Hotel" HeaderText="Hotel" 
                            SortExpression="Hotel" />
                        <asp:BoundField DataField="TourOpId" HeaderText="TourOpId" 
                            SortExpression="TourOpId" >
                        </asp:BoundField>
                        <asp:BoundField DataField="TourOp" HeaderText="TourOp" 
                            SortExpression="TourOp" />
                        <asp:BoundField DataField="MarketId" HeaderText="MarketId" 
                            SortExpression="MarketId" />
                        <asp:BoundField DataField="PayModeID" HeaderText="PayModeID" 
                            SortExpression="PayModeID" >
                        </asp:BoundField>
                        <asp:BoundField DataField="CreditDays" 
                            HeaderText="CreditDays" SortExpression="CreditDays" >
                        </asp:BoundField>
                        <asp:BoundField DataField="TransDate" 
                            HeaderText="TransDate" SortExpression="TransDate" DataFormatString="{0:d}" 
                            HtmlEncode="False" >
                        </asp:BoundField>
                        
                        <asp:BoundField DataField="DocNumber" HeaderText="DocNumber" 
                            SortExpression="DocNumber" />
                        
                        <asp:BoundField DataField="DocOrd" HeaderText="DocOrd" 
                            SortExpression="DocOrd" >
                        </asp:BoundField>
                        <asp:BoundField DataField="DocCode" HeaderText="DocCode" 
                            SortExpression="DocCode" />
                        
                        <asp:BoundField DataField="Amount" HeaderText="Amount" 
                            SortExpression="Amount" />
                        <asp:BoundField DataField="TrDocClass" HeaderText="TrDocClass" 
                            SortExpression="TrDocClass" />
                        <asp:BoundField DataField="TrClass" HeaderText="TrClass" 
                            SortExpression="TrClass" />
                        
                        <asp:BoundField DataField="TrAccount" HeaderText="TrAccount" 
                            SortExpression="TrAccount" />
                        
                    </Columns>
                </asp:GridView>   
                                
                                
                                
                                
                            </td>
                        </tr>
                 </asp:Panel>       
                  
                   
                </table>
                <asp:ObjectDataSource ID="dsDailyJournal" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" 
          
            TypeName="ReportAccountingTableAdapters.AccRepHDocJournalTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="ddlTO" Name="TourOpId" PropertyName="SelectedValue"
                            Type="Int32" DefaultValue="" />
                        <asp:ControlParameter ControlID="ddlTOGroup" Name="TourOpGroupID" PropertyName="SelectedValue" 
                            Type="Int32" />
                        <asp:ControlParameter ControlID="ddlMarkets" Name="MarketID" PropertyName="SelectedValue" 
                            Type="String" />
                        <asp:ControlParameter ControlID="ddlPay" Name="PayCondID" PropertyName="SelectedValue" 
                            Type="String" />
                        <asp:ControlParameter ControlID="fltStart" Name="DateFrom" PropertyName="Text" 
                            Type="DateTime" />
                        <asp:ControlParameter ControlID="fltFinish" Name="DateTo" PropertyName="Text" 
                            Type="DateTime" />
                        <asp:ControlParameter ControlID="cbCancel" Name="Canceled" PropertyName="Checked" 
                            Type="Boolean" />
                        <asp:ControlParameter ControlID="ddlDocClass" Name="TrDocClass" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="ddlClass" Name="TrClass" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="ddlTrSearch" Name="TrCode" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="ddlAccType" Name="AccTypeID" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="ddlTranType" Name="TranTypeID" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="ddlDocType" Name="DocTypeID" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="ddlSign" Name="TrSign" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="ddlInvType" Name="InvType" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <%--Visible="False"--%>
    </div>
</asp:Content>

