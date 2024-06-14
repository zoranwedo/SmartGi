<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="RptContractRate.aspx.vb" Inherits="Reports_Contracts_RptContractRate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Contract Rate Report
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
                            <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />&nbsp; 
                        </asp:Label>
                        <asp:HyperLink ID="btSwitchReport" runat="server"
                            style="float:right; color: White; padding: 4px; font-weight: bold;"
                            NavigateUrl="~/Reports/Contracts/NewContaractRate.aspx">
                            Try New Rate Report !!!
                        </asp:HyperLink>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px">
                    <asp:Panel ID="pnSearch" runat="server">
                        <asp:Panel ID="pnSearchPart" runat="server" Style="width: 600px" DefaultButton="lbCntRates">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td class="GridRow1B" style="width: 100px; text-align: left;">
                                        Title
                                    </td>
                                    <td class="GridRow1B" style="width: 500px; text-align: left" colspan="2">
                                        <asp:TextBox ID="fltName" runat="server" CssClass="TextBox" Visible="True" />
                                        <asp:TextBoxWatermarkExtender ID="fltNameExt" runat="server" TargetControlID="fltName"
                                            WatermarkCssClass="WaterMark" WatermarkText="Contract title (use % as wildchar)" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Description
                                    </td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:TextBox ID="txtDescription" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="fltName"
                                            WatermarkCssClass="WaterMark" WatermarkText="Contract description (use % as wildchar)" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Market
                                    </td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:DropDownList ID="ddlMarkets" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                            DataSourceID="dsMarkets" DataTextField="Market" DataValueField="MarketID">
                                            <asp:ListItem Selected="True" Value="">all markets</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsMarkets" runat="server" OldValuesParameterFormatString="original_{0}" 
                                            SelectMethod="GetData" TypeName="TourOperTableAdapters.MarketTableAdapter" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Hotel
                                    </td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" DataSourceID="dsUserHotels"
                                            DataTextField="Hotel" DataValueField="HotelID" AppendDataBoundItems="True">
                                            <asp:ListItem Selected="True" Value="">all hotels.</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsUserHotels" runat="server" OldValuesParameterFormatString="original_{0}"
                                            SelectMethod="GetData" TypeName="ContractsTableAdapters.SelectUserHotelTableAdapter">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" >
                                        Tour Operator
                                    </td>
                                    <td class="GridRow1B" colspan="2" >
                                        <asp:DropDownList ID="ddlTO" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                            DataSourceID="dsTO" DataTextField="TourOp" DataValueField="TourOpID">
                                            <asp:ListItem Selected="True" Value="">all Tour Operators</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsTO" runat="server" 
                                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByUser" 
                                            TypeName="TourOperTableAdapters.TourOpTableAdapter">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="hfUsername" Name="User" PropertyName="Value" Type="String" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Meal Plan
                                    </td>
                                    <td class="GridRow1B" colspan="2" >
                                        <asp:DropDownList ID="ddlMealPlan" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                            DataSourceID="dsMealPlan" DataTextField="MealPlan" DataValueField="MealPlanID">
                                            <asp:ListItem Selected="True" Value="">all </asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsMealPlan" runat="server" OldValuesParameterFormatString="original_{0}" 
                                            SelectMethod="GetData" TypeName="dsMaintBasicTableAdapters.MealPlanTableAdapter" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Rate Type
                                    </td>
                                    <td class="GridRow1B" colspan="2" >
                                        <asp:DropDownList ID="ddlRateType" runat="server" CssClass="TextBox" AutoPostBack="True">
                                            <asp:ListItem Value="">all</asp:ListItem>
                                            <asp:ListItem Value="3">Contract</asp:ListItem>
                                            <asp:ListItem Value="2">EBB</asp:ListItem>
                                            <asp:ListItem Value="1">Special</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Rate Type Sub Category
                                    </td>
                                    <td class="GridRow1B" colspan="2" >
                                        <asp:DropDownList ID="ddlRateTypeId" runat="server" CssClass="TextBox" DataSourceID="dsRateType"
                                            DataTextField="RateTypeID" DataValueField="RateTypeID" AppendDataBoundItems="True">
                                            <asp:ListItem Value="">all</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsRateType" runat="server" OldValuesParameterFormatString="original_{0}" 
                                            SelectMethod="GetDataByRateType" TypeName="dsMaintBasicTableAdapters.RateTypeTableAdapter">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlRateType" Name="RateType" PropertyName="SelectedValue" Type="Int16" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Rate Option
                                    </td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:DropDownList ID="ddlRateOption" runat="server" CssClass="TextBox">
                                            <asp:ListItem Value="">all</asp:ListItem>
                                            <asp:ListItem Value="0">Per Arrival</asp:ListItem>
                                            <asp:ListItem Value="1">Per Stay</asp:ListItem>
                                            <asp:ListItem Value="2">Inclusiv</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Rate Code</td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:TextBox ID="fltRateCode" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="fltRateCode_TextBoxWatermarkExtender" 
                                            runat="server" TargetControlID="fltRateCode" WatermarkCssClass="WaterMark" 
                                            WatermarkText="Rate Code" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Room Type
                                    </td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:DropDownList ID="ddlRoomType" runat="server" CssClass="TextBox" DataSourceID="dsroomType"
                                            DataTextField="RoomTypeID" DataValueField="RoomTypeID" AppendDataBoundItems="True">
                                            <asp:ListItem Value="">all</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsroomType" runat="server" OldValuesParameterFormatString="original_{0}" 
                                            SelectMethod="GetData" TypeName="dsMaintBasicTableAdapters.RoomTypeTableAdapter" />
                                    </td>
                                </tr>
                                <%--
                                <tr>
                                    <td class="GridRow1B">
                                        Commisionable
                                    </td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:CheckBox ID="cbCommision" runat="server" />
                                    </td>
                                </tr>
                                --%>
                                <tr>
                                    <td class="GridRow1B">
                                        Created
                                    </td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:CompareValidator ID="CompareValidator21" runat="server" ControlToValidate="fltCreated"
                                            Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender21" runat="server" Enabled="True"
                                            TargetControlID="CompareValidator21" />
                                        <asp:TextBox ID="fltCreated" runat="server" CssClass="TextBox" />
                                        <asp:CalendarExtender ID="CalendarExtender21" runat="server" CssClass="cal_Theme1"
                                            Enabled="True" TargetControlID="fltCreated" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Rate Received
                                    </td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:CompareValidator ID="CompareValidator22" runat="server" ControlToValidate="fltRateReceived"
                                            Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender22" runat="server" Enabled="True"
                                            TargetControlID="CompareValidator22" />
                                        <asp:TextBox ID="fltRateReceived" runat="server" CssClass="TextBox" Visible="False" />
                                        <asp:CalendarExtender ID="CalendarExtender22" runat="server" Enabled="True" TargetControlID="fltRateReceived"
                                            CssClass="cal_Theme1" />
                                        <asp:CheckBoxList ID="cblReceived" runat="server">
                                            <asp:ListItem Selected="True" Value="0">All</asp:ListItem>
                                            <asp:ListItem Value="1">Received Date &gt; Start Date</asp:ListItem>
                                            <asp:ListItem Value="2">Creation Date &gt; Received Date</asp:ListItem>
                                        </asp:CheckBoxList>
                                        <asp:Panel ID="Panel1" runat="server" Visible="False">
                                            <asp:CheckBox ID="cbAll" runat="server" Text="All" />
                                            &nbsp;
                                            <asp:CheckBox ID="cbReceivedG" runat="server" Text="Received Date &gt; Start Date" />
                                            &nbsp;&nbsp;
                                            <asp:CheckBox ID="cbReceivedS" runat="server" />
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Start
                                    </td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="fltStart"
                                            Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="CompareValidator7_ValidatorCalloutExtender" runat="server"
                                            Enabled="True" TargetControlID="CompareValidator7" />
                                        <asp:TextBox ID="fltStart" runat="server" CssClass="TextBox" />
                                        <asp:CalendarExtender ID="fltStart_CalendarExtender" runat="server" Enabled="True"
                                            TargetControlID="fltStart" CssClass="cal_Theme1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        End
                                    </td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:CompareValidator ID="CompareValidator8" runat="server" ControlToValidate="fltFinish"
                                            Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="CompareValidator8_ValidatorCalloutExtender" runat="server"
                                            Enabled="True" TargetControlID="CompareValidator8" />
                                        <asp:TextBox ID="fltFinish" runat="server" CssClass="TextBox" />
                                        <asp:CalendarExtender ID="fltFinish_CalendarExtender" runat="server" Enabled="True"
                                            TargetControlID="fltFinish" CssClass="cal_Theme1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Booking Start
                                    </td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:CompareValidator ID="CompareValidator14" runat="server" ControlToValidate="fltBkStart"
                                            Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender14" runat="server" Enabled="True"
                                            TargetControlID="CompareValidator14" />
                                        <asp:TextBox ID="fltBkStart" runat="server" CssClass="TextBox" />
                                        <asp:CalendarExtender ID="CalendarExtender14" runat="server" Enabled="True" TargetControlID="fltBkStart"
                                            CssClass="cal_Theme1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Booking End
                                    </td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:CompareValidator ID="CompareValidator15" runat="server" ControlToValidate="fltBkEnd"
                                            Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender15" runat="server" Enabled="True"
                                            TargetControlID="CompareValidator15" />
                                        <asp:TextBox ID="fltBkEnd" runat="server" CssClass="TextBox" />
                                        <asp:CalendarExtender ID="CalendarExtender15" runat="server" Enabled="True" TargetControlID="fltBkEnd"
                                            CssClass="cal_Theme1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        State
                                    </td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:DropDownList ID="ddlState" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                            DataSourceID="dsCntState" DataTextField="ContractState" DataValueField="ContractStateID">
                                            <asp:ListItem Selected="True" Value="">all states</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsCntState" runat="server" OldValuesParameterFormatString="original_{0}" 
                                            SelectMethod="GetData" TypeName="ContractsTableAdapters.ContractStateTableAdapter" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear">
                                        &nbsp;
                                    </td>
                                    <td class="GridRowClear" colspan="2">
                                        <asp:CheckBox ID="cbSupp" runat="server" Text="Print with supplements" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="ComandRow2T">
                                        <asp:CheckBox ID="cbHotel" runat="server" Text="Hotel" TextAlign="Left" Visible="False" />
                                    </td>
                                    <td align="right" class="ComandRow2T" style="padding-right: 5px; width: 370px">
                                        <asp:CheckBox ID="cbExcel" runat="server" Text="export to Excel" />
                                    </td>
                                    <td class="ComandRow2T" style="height: 30px; padding-top: 5px; width: 130px;">
                                        <asp:Button ID="lbCntRates" runat="server" SkinID="skBtnBase" Text="Report" />
                                        &nbsp;
                                        <asp:Button ID="Button2" runat="server" SkinID="skBtnClear" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="dsCntRates" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" 
            TypeName="CntReportsTableAdapters.FilterContractRate1TableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="value" Type="String" />
                <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlTO" Name="TourOpId" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlMarkets" Name="MarketId" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="fltName" Name="Title" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="fltCreated" Name="Created" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="fltRateReceived" Name="RateRecieved" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="ddlMealPlan" Name="MealPlanID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddlState" Name="StateId" PropertyName="SelectedValue" Type="Int32" />
                <asp:Parameter Name="Commisionable" Type="Boolean" />
                <asp:ControlParameter ControlID="ddlRateType" Name="RateType" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlRateTypeId" Name="RateTypeId" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddlRoomType" Name="RoomTypeId" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="fltStart" Name="Start" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="fltFinish" Name="Finish" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="fltBkStart" Name="BkStart" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="fltBkEnd" Name="BkFinish" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="ddlRateOption" Name="RateOption" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="fltRateCode" Name="RateCodeID" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsCntHRates" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetHData" TypeName="CntReportsTableAdapters.FilterContractRate1TableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="value" Type="String" />
                <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlTO" Name="TourOpId" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlMarkets" Name="MarketId" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="fltName" Name="Title" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="fltCreated" Name="Created" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="fltRateReceived" Name="RateRecieved" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="ddlMealPlan" Name="MealPlanID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddlState" Name="StateId" PropertyName="SelectedValue" Type="Int32" />
                <asp:Parameter Name="Commisionable" Type="Boolean" />
                <asp:ControlParameter ControlID="ddlRateType" Name="RateType" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlRateTypeId" Name="RateTypeId" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddlRoomType" Name="RoomTypeId" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="fltStart" Name="Start" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="fltFinish" Name="Finish" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="fltBkStart" Name="BkStart" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="fltBkEnd" Name="BkFinish" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="ddlRateOption" Name="RateOption" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="fltRateCode" Name="RateCodeID" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsCntSupp" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" 
            TypeName="CntReportsTableAdapters.RateSupp1TableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="hfUsername" Name="Username" PropertyName="value" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsCntSuppRoom" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataBySel" 
            TypeName="SupplementsTableAdapters.SelectSupplementRoomTableAdapter">
            <SelectParameters>
                <asp:Parameter Name="SupplementID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsCntSpec" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="CntReportsTableAdapters.SpecForRateReportTableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsFilteredSupplements" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="CntReportsTableAdapters.FilterSupplementRate1TableAdapter" >
            <SelectParameters>
                <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
                <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlTO" Name="TourOpId" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlMarkets" Name="MarketId" PropertyName="SelectedValue" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:ControlParameter ControlID="fltCreated" Name="Created" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="fltRateReceived" Name="RateRecieved" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="ddlMealPlan" Name="MealPlanID" PropertyName="SelectedValue" Type="String" />
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="PerPax" Type="Boolean" />
                <asp:Parameter Name="PerDay" Type="Boolean" />
                <asp:ControlParameter ControlID="fltStart" Name="Start" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="fltFinish" Name="Finish" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="fltBkStart" Name="BkStart" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="fltBkEnd" Name="BkFinish" PropertyName="Text" Type="DateTime" />
                <asp:Parameter Name="IsPercent" Type="Boolean" />
                <asp:Parameter Name="HotelVisible" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsFilteredSupplementsH" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetHData" TypeName="CntReportsTableAdapters.FilterSupplementRate1TableAdapter" >
            <SelectParameters>
                <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
                <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlTO" Name="TourOpId" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlMarkets" Name="MarketId" PropertyName="SelectedValue" Type="String" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:ControlParameter ControlID="fltCreated" Name="Created" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="fltRateReceived" Name="RateRecieved" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="ddlMealPlan" Name="MealPlanID" PropertyName="SelectedValue" Type="String" />
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="PerPax" Type="Boolean" />
                <asp:Parameter Name="PerDay" Type="Boolean" />
                <asp:ControlParameter ControlID="fltStart" Name="Start" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="fltFinish" Name="Finish" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="fltBkStart" Name="BkStart" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="fltBkEnd" Name="BkFinish" PropertyName="Text" Type="DateTime" />
                <asp:Parameter Name="IsPercent" Type="Boolean" />
                <asp:Parameter Name="HotelVisible" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        
        <asp:HiddenField ID="dummy" runat="server" />
        <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
            PopupDragHandleControlID="popLabel" CancelControlID="btnYes" DropShadow="True"
            BackgroundCssClass="modalBackground" TargetControlID="dummy" X="120" Y="200">
        </asp:ModalPopupExtender>
        <asp:Panel ID="popPanel" runat="server" Width="400px" BackColor="White" Style="display: none">
            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td class="GridLabelBG">
                        <asp:Label ID="popLabel" runat="server" Text="Title" SkinID="skGridLabel" />
                    </td>
                </tr>
                <tr>
                    <td class="GridBorder" style="text-align: center;">
                        <asp:Label ID="popMessage" runat="server" Text="Message" />
                        <div style="text-align: right; padding: 10px;" class="GridRow1T">
                            <asp:Button ID="btnYes" runat="server" Text="OK" SkinID="skBtnBase" Width="80px" />
                        </div>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:ModalPopupExtender ID="popWarning" runat="server" PopupControlID="pnlWarning"
            PopupDragHandleControlID="popLabel" CancelControlID="btnWarningNo" DropShadow="True"
            BackgroundCssClass="modalBackground" TargetControlID="dummy" X="120" Y="200"
            BehaviorID="WarningPop" >
        </asp:ModalPopupExtender>
        <asp:Panel ID="pnlWarning" runat="server" Width="400px" BackColor="White" Style="display: none">
            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td class="GridLabelBG">
                        <asp:Label ID="Label1" runat="server" Text="Warning" SkinID="skGridLabel" />
                    </td>
                </tr>
                <tr>
                    <td class="GridBorder" style="text-align: center;">
                        <asp:Label ID="lblWarning" runat="server" Text="Message" />
                        <div style="text-align: right; padding: 10px;" class="GridRow1T">
                            <asp:Button ID="btnWarningYes" runat="server" Text="Yes" SkinID="skBtnBase" Width="80px" OnClientClick="{$find('WarningPop').hide();}" />
                            <asp:Button ID="btnWarningNo" runat="server" Text="No" SkinID="skBtnBase" Width="80px" />
                        </div>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
</asp:Content>
