<%@ Page Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="RptSupplements.aspx.vb" Inherits="Reports_Contracts_Supplements" Title="Supplements Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Supplements
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
                    <td class="GridLabelBG" style="width: 600px">
                        <asp:Label ID="lblFilter" runat="server" SkinID="skGridLabel">Search/Filter &nbsp;
                            <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />&nbsp; 
                        </asp:Label>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px">
                    <asp:Panel ID="pnSearch" runat="server" Width="600px">
                        <asp:Panel ID="pnSearchPart" runat="server" Style="width: 600px" DefaultButton="Button1">
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="GridRow1B" style="width: 100px;">Title</td>
                                    <td class="GridRow1B" style="width: 500px;" colspan="2">
                                        <asp:TextBox ID="fltTitle" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="wmfltTitle" runat="server" TargetControlID="fltTitle"
                                            WatermarkCssClass="WaterMark" WatermarkText="Suplement title (use % as wildchar)" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" >Hotel</td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" DataSourceID="dsHotel"
                                            DataTextField="Hotel" DataValueField="HotelID" AppendDataBoundItems="True">
                                            <asp:ListItem Selected="True" Value="">all hotels</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Market</td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:DropDownList ID="ddlMarkets" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                            DataSourceID="dsMarkets" DataTextField="Market" DataValueField="MarketID">
                                            <asp:ListItem Selected="True" Value="">all markets</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsMarkets" runat="server" 
                                            TypeName="TourOperTableAdapters.MarketTableAdapter"
                                            SelectMethod="GetData">
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" >Tour Operator</td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:DropDownList ID="ddlTO" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                            DataSourceID="dsTO" DataTextField="TourOp" DataValueField="TourOpID">
                                            <asp:ListItem Selected="True" Value="">all Tour Operators</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsTO" runat="server" 
                                            TypeName="TourOperTableAdapters.TourOpTableAdapter"
                                            SelectMethod="GetDataByUser" >
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="hfUsername" Name="User" PropertyName="Value" Type="String" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Meal Plan</td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:DropDownList ID="ddlMealPlan" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                            DataSourceID="dsMealPlan" DataTextField="MealPlan" DataValueField="MealPlanID">
                                            <asp:ListItem Selected="True" Value="">all </asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsMealPlan" runat="server" 
                                            TypeName="dsMaintBasicTableAdapters.MealPlanTableAdapter"
                                            SelectMethod="GetData" >
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Rate Type Gr</td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:DropDownList ID="ddlRateType" runat="server" CssClass="TextBox">
                                            <asp:ListItem Value="">all</asp:ListItem>
                                            <asp:ListItem Value="3">Contract</asp:ListItem>
                                            <asp:ListItem Value="2">EBB</asp:ListItem>
                                            <asp:ListItem Value="1">Special</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Rate Type</td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:DropDownList ID="ddlRateTypeId" runat="server" CssClass="TextBox" DataSourceID="dsRateType"
                                            DataTextField="RateTypeID" DataValueField="RateTypeID" AppendDataBoundItems="True">
                                            <asp:ListItem Value="">all</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsRateType" runat="server" 
                                            TypeName="dsMaintBasicTableAdapters.RateTypeTableAdapter"
                                            SelectMethod="GetData">
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Rate Option</td>
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
                                    <td class="GridRow1B">Room Type</td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:DropDownList ID="ddlRoomType" runat="server" CssClass="TextBox" DataSourceID="dsroomType"
                                            DataTextField="RoomTypeID" DataValueField="RoomTypeID" AppendDataBoundItems="True">
                                            <asp:ListItem Value="">all</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsroomType" runat="server" 
                                            TypeName="dsMaintBasicTableAdapters.RoomTypeTableAdapter"
                                            SelectMethod="GetData" >
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Created</td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:CompareValidator ID="CompareValidator21" runat="server" ControlToValidate="fltCreated"
                                            Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender21" runat="server" Enabled="True" TargetControlID="CompareValidator21" />
                                        <asp:TextBox ID="fltCreated" runat="server" CssClass="TextBox" />
                                        <asp:CalendarExtender ID="CalendarExtender21" runat="server" CssClass="cal_Theme1" Enabled="True" TargetControlID="fltCreated" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Rate Received</td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:CompareValidator ID="CompareValidator22" runat="server" ControlToValidate="fltRateReceived"
                                            Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender22" runat="server" Enabled="True" TargetControlID="CompareValidator22" />
                                        <asp:TextBox ID="fltRateReceived" runat="server" CssClass="TextBox" />
                                        <asp:CalendarExtender ID="CalendarExtender22" runat="server" Enabled="True" TargetControlID="fltRateReceived" CssClass="cal_Theme1" />
                                        <asp:CheckBoxList ID="cblReceived" runat="server" AutoPostBack="true">
                                            <asp:ListItem Selected="True" Value="0">All</asp:ListItem>
                                            <asp:ListItem Value="1">Received Date &gt; Start Date</asp:ListItem>
                                            <asp:ListItem Value="2">Creation Date &gt; Received Date</asp:ListItem>
                                        </asp:CheckBoxList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Start</td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:TextBox ID="fltStart" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="wmfltStart" runat="server" TargetControlID="fltStart"
                                            WatermarkCssClass="WaterMark" WatermarkText="Travel start date equal or greater than..." />
                                        <asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="fltStart"
                                            Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="CompareValidator7_ValidatorCalloutExtender" runat="server"
                                            Enabled="True" TargetControlID="CompareValidator7" />
                                        <asp:CalendarExtender ID="fltStart_CalendarExtender" runat="server" Enabled="True"
                                            TargetControlID="fltStart" CssClass="cal_Theme1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">End</td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:TextBox ID="fltFinish" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="wmfltFinish" runat="server" TargetControlID="fltFinish"
                                            WatermarkCssClass="WaterMark" WatermarkText="Travel end date equal or less than..." />
                                        <asp:CompareValidator ID="CompareValidator8" runat="server" ControlToValidate="fltFinish"
                                            Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="CompareValidator8_ValidatorCalloutExtender" runat="server" 
                                            Enabled="True" TargetControlID="CompareValidator8" />
                                        <asp:CalendarExtender ID="fltFinish_CalendarExtender" runat="server" Enabled="True"
                                            TargetControlID="fltFinish" CssClass="cal_Theme1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Booking Start</td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:TextBox ID="fltBkStart" runat="server" CssClass="TextBox" />
                                        <asp:CompareValidator ID="CompareValidator14" runat="server" ControlToValidate="fltBkStart"
                                            Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender14" runat="server" Enabled="True" TargetControlID="CompareValidator14" />
                                        <asp:CalendarExtender ID="CalendarExtender14" runat="server" Enabled="True" TargetControlID="fltBkStart" CssClass="cal_Theme1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Booking End</td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:TextBox ID="fltBkEnd" runat="server" CssClass="TextBox" />
                                        <asp:CompareValidator ID="CompareValidator15" runat="server" ControlToValidate="fltBkEnd"
                                            Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender15" runat="server" Enabled="True" TargetControlID="CompareValidator15" />
                                        <asp:CalendarExtender ID="CalendarExtender15" runat="server" Enabled="True" TargetControlID="fltBkEnd" CssClass="cal_Theme1">
                                        </asp:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear">Category</td>
                                    <td class="GridRowClear" colspan="2">
                                        <asp:DropDownList ID="ddlCategory" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                            DataSourceID="dsCategory" DataTextField="SupplementCategory" DataValueField="SupplementCategory">
                                            <asp:ListItem Selected="True" Value="">all categories</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="ComandRow2T">
                                        <asp:CheckBox ID="cbHotel" runat="server" Text="Hotel" />
                                    </td>
                                    <td class="ComandRow2T">
                                        <asp:CheckBox ID="cbExcel" runat="server" Text="export to Excel" Style="padding-right: 5px; width: 370px" />
                                    </td>
                                    <td class="ComandRow2T" style="height: 30px; padding-top: 5px; width: 130px">
                                        <asp:Button ID="Button1" runat="server" SkinID="skBtnBase" Text="Report" />&nbsp;
                                        <asp:Button ID="Button2" runat="server" SkinID="skBtnClear" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <asp:ObjectDataSource ID="dsCategory" runat="server" 
        TypeName="SupplementsTableAdapters.SupplementCategoryTableAdapter"
        SelectMethod="GetData" >
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsHotel" runat="server" 
        TypeName="SupplementsTableAdapters.SelectUserHotelTableAdapter" 
        SelectMethod="GetData" >
        <SelectParameters>
            <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsFilteredSupplements" runat="server" 
        TypeName="CntReportsTableAdapters.FilterSupplementRate1TableAdapter"
        SelectMethod="GetData" >
        <SelectParameters>
            <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
            <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="ddlTO" Name="TourOpId" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="ddlMarkets" Name="MarketId" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="fltTitle" Name="Title" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="fltCreated" Name="Created" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="fltRateReceived" Name="RateRecieved" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="ddlMealPlan" Name="MealPlanID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlCategory" Name="Category" PropertyName="SelectedValue" Type="String" />
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
    <asp:ObjectDataSource ID="dsFilteredSupplementsH" runat="server" 
        TypeName="CntReportsTableAdapters.FilterSupplementRate1TableAdapter"
        SelectMethod="GetHData" >
        <%--SelectMethod="GetHtlData" >--%>
        <SelectParameters>
            <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
            <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="ddlTO" Name="TourOpId" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="ddlMarkets" Name="MarketId" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="fltTitle" Name="Title" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="fltCreated" Name="Created" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="fltRateReceived" Name="RateRecieved" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="ddlMealPlan" Name="MealPlanID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlCategory" Name="Category" PropertyName="SelectedValue" Type="String" />
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
</asp:Content>
