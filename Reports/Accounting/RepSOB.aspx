<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" CodeFile="RepSOB.aspx.vb" Inherits="Reports_Accounting_RepSOB" %>

<%@ Register assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" namespace="System.Web.UI.WebControls" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Source of Business
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
                            &nbsp; 
                        </asp:Label>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px">
                    <asp:Panel ID="pnSearch" runat="server" Style="width: 600px" DefaultButton="Button1">
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="GridRow1B" style="width: 120px;" >
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
                                <tr >
                                    <td class="GridRow1B" >
                                        Hotel Group
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:DropDownList ID="ddlHotelGroup" runat="server" CssClass="TextBox" DataSourceID="dsHotelGroup"
                                            DataTextField="HotelGroup" DataValueField="HotelGroupID" 
                                            AppendDataBoundItems="True">
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
                                    <td class="GridRow1B" >
                                        Tour Operator
                                    </td>
                                    <td class="GridRow1B" >
                                        <asp:DropDownList ID="ddlTO" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                            DataSourceID="dsTOAll" DataTextField="TourOp" DataValueField="TourOpID">
                                            <asp:ListItem Selected="True" Value="">all </asp:ListItem>
                                            <asp:ListItem Value="-1">TO Group</asp:ListItem>
                                            <asp:ListItem Value="-2">Market</asp:ListItem>
                                            <asp:ListItem Value="-3">Pay Condition</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsTOAll" runat="server" 
                                            OldValuesParameterFormatString="original_{0}"                                             
                                            TypeName="TourOperTableAdapters.TourOpTableAdapter" 
                                            SelectMethod="GetDataByUser">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="hfUsername" Name="User" PropertyName="Value" Type="String" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" >
                                        Tour Operator Group
                                    </td>
                                    <td class="GridRow1B" >
                                        <asp:DropDownList ID="ddlTOGroup" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                            DataSourceID="dsTOGroup" DataTextField="TourOpGroup" 
                                            DataValueField="TourOpGroupID">
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
                                    <td class="GridRow1B" >
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
                                        <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="fltStart" runat="server" CssClass="TextBox" />
                                        <asp:CalendarExtender ID="fltStart_CalendarExtender" runat="server" 
                                            CssClass="cal_Theme1" Enabled="True" TargetControlID="fltStart">
                                        </asp:CalendarExtender>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="fltStart"
                                            Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear">
                                        To Date
                                        <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                    </td>
                                    <td class="GridRowClear">
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
                                    <td class="ComandRow2T" style="text-align: left;">
                                        <asp:CheckBox ID="cbHotel" runat="server" AutoPostBack="True" Text="Hotel" TextAlign="Right" Visible="False" />
                                    </td>
                                    <td class="ComandRow2T">
                                        <asp:CheckBox ID="cbPenalty" runat="server" Text="Include No Show and Cancelation" />
                                        &nbsp;<asp:CheckBox ID="cbCorrections" runat="server" Text="Include accounting correction documents" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear" style="height: 28px; padding-top: 5px; text-align: right;" >
                                        <asp:CheckBox ID="cbExcel" runat="server" Text="export to Excel" TextAlign="Left" />
                                    </td>
                                    <td class="GridRow1T" style="height: 28px; padding-top: 5px; text-align: right;">
                                        <asp:Button ID="Button4" runat="server" SkinID="skBtnBase" Text="Report By TO" Visible="False" />
                                        &nbsp;<asp:Button ID="Button6" runat="server" SkinID="skBtnBase" Text="MP/HTL/MA" Width="75px" />
                                        &nbsp;<asp:Button ID="Button7" runat="server" SkinID="skBtnBase" Text="MP/MA/HTL" Width="75px" />
                                        &nbsp;<asp:Button ID="Button5" runat="server" SkinID="skBtnBase" Text="MP/TO/HTL" Width="75px" />
                                        &nbsp;<asp:Button ID="Button3" runat="server" SkinID="skBtnBase" Text="MP/MA/TO" Width="75px" />
                                        &nbsp;<asp:Button ID="Button8" runat="server" SkinID="skBtnBase" Text="Cnt Rate" Width="75px" />
                                        &nbsp;&nbsp;<asp:Button ID="Button1" runat="server" SkinID="skBtnFilter" Visible="False" />
                                        &nbsp;&nbsp;<asp:Button ID="Button2" runat="server" SkinID="skBtnClear" />
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
                                <asp:Label ID="lbHotels" runat="server" SkinID="skGridLabel" 
                                    Text="Source of Business"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="GridBorder">
                             <%--<asp:GridView ID="GridView1" runat="server" DataSourceID="dsSOB" 
                    SkinID="skGridView" AutoGenerateColumns="False">
                    <Columns>
                        
                        <asp:BoundField DataField="HotelId" HeaderText="HotelId" 
                            SortExpression="HotelId" />
                        <asp:BoundField DataField="Hotel" 
                            HeaderText="Hotel" SortExpression="Hotel" >
                        <ItemStyle Width="150px" />
                        </asp:BoundField>
                        
                        <asp:BoundField DataField="MarketId" HeaderText="MarketId" 
                            SortExpression="MarketId" >
                        </asp:BoundField>
                        <asp:BoundField DataField="TourOpId" HeaderText="TourOpId" 
                            SortExpression="TourOpId" />
                        
                        <asp:BoundField DataField="TourOp" HeaderText="TourOp" 
                            SortExpression="TourOp" >
                        
                        <ItemStyle Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Rooms" HeaderText="Rooms" 
                            SortExpression="Rooms" >
                        </asp:BoundField>
                        <asp:BoundField DataField="ChldNum" HeaderText="ChldNum" 
                            SortExpression="ChldNum" />
                        <asp:BoundField DataField="Pax" HeaderText="Pax" 
                            SortExpression="Pax" />
                        <asp:TemplateField HeaderText="Revenue" SortExpression="Revenue">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Revenue") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Revenue", "{0:N2}") %>' 
                                    Visible="<%# iif(cbHotel.Checked,false,true) %>"></asp:Label>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("HRevenue", "{0:N2}") %>' 
                                    Visible="<%# cbHotel.Checked %>"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="80px" />
                        </asp:TemplateField>
                        
                    </Columns>
                </asp:GridView>--%>   
                                
                                
                                
                                
                            </td>
                        </tr>
                 </asp:Panel>       
                  
                   
                </table>
                <asp:ObjectDataSource ID="dsSOB_Mp_Mk_To" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData_Mp_Mk_To" 
          
            TypeName="AgingBalanceTableAdapters.AccRepSOBTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="ddlHotelGroup" Name="HotelGroupID" 
                            PropertyName="SelectedValue" Type="Int32" />
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
                        <asp:ControlParameter ControlID="cbPenalty" Name="Penalty" 
                            PropertyName="Checked" Type="Boolean" />
                        <asp:ControlParameter ControlID="cbCorrections" Name="Corrections" 
                            PropertyName="Checked" Type="Boolean" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsSOB_Mp_To_Htl" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataBy_Mp_To_Htl" 
          
            TypeName="AgingBalanceTableAdapters.AccRepSOBTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="ddlHotelGroup" Name="HotelGroupID" 
                            PropertyName="SelectedValue" Type="Int32" />
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
                        <asp:ControlParameter ControlID="cbPenalty" Name="Penalty" 
                            PropertyName="Checked" Type="Boolean" />
                        <asp:ControlParameter ControlID="cbCorrections" Name="Corrections" 
                            PropertyName="Checked" Type="Boolean" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsSOB_Mp_Htl_Mk" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataBy_Mp_Htl_Mk" 
          
            TypeName="AgingBalanceTableAdapters.AccRepSOBTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="ddlHotelGroup" Name="HotelGroupID" 
                            PropertyName="SelectedValue" Type="Int32" />
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
                        <asp:ControlParameter ControlID="cbPenalty" Name="Penalty" 
                            PropertyName="Checked" Type="Boolean" />
                        <asp:ControlParameter ControlID="cbCorrections" Name="Corrections" 
                            PropertyName="Checked" Type="Boolean" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsSOB_Mp_Mk_Htl" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataBy_Mp_Mk_Htl" 
          
            TypeName="AgingBalanceTableAdapters.AccRepSOBTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="ddlHotelGroup" Name="HotelGroupID" 
                            PropertyName="SelectedValue" Type="Int32" />
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
                        <asp:ControlParameter ControlID="cbPenalty" Name="Penalty" 
                            PropertyName="Checked" Type="Boolean" />
                        <asp:ControlParameter ControlID="cbCorrections" Name="Corrections" 
                            PropertyName="Checked" Type="Boolean" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsSOB_CntRate" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetDataBy_Rate" 
          
            TypeName="AgingBalanceTableAdapters.AccRepSOBTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="ddlHotelGroup" Name="HotelGroupID" 
                            PropertyName="SelectedValue" Type="Int32" />
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
                        <asp:ControlParameter ControlID="cbPenalty" Name="Penalty" 
                            PropertyName="Checked" Type="Boolean" />
                        <asp:ControlParameter ControlID="cbCorrections" Name="Corrections" 
                            PropertyName="Checked" Type="Boolean" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                &nbsp;</div>
</asp:Content>

