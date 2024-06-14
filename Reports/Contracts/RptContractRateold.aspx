<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" CodeFile="RptContractRateOLD.aspx.vb" Inherits="Reports_Contracts_RptContractRateold" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Contract Rate Report
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
                    <asp:Panel ID="pnSearch" runat="server" >
                        <asp:Panel ID="pnSearchPart" runat="server" Style="width: 600px" DefaultButton="lbCntRates">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td class="GridRow1B" style="width: 100px; text-align: left;">
                                        Title
                                    </td>
                                    <td class="GridRow1B" style="width: 400px" align="left">
                                        <asp:TextBox ID="fltName" runat="server" CssClass="TextBox" Visible="False" />
                                        <asp:TextBoxWatermarkExtender ID="fltNameExt" runat="server" TargetControlID="fltName"
                                            WatermarkCssClass="WaterMark" WatermarkText="Contract title (use % as wildchar)" />
                                        <asp:DropDownList ID="ddlContract" runat="server" AppendDataBoundItems="True" 
                                            CssClass="TextBox" DataSourceID="dsContract" DataTextField="Title" 
                                            DataValueField="Title">
                                            <asp:ListItem Value="">All</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsContract" runat="server" DeleteMethod="Delete" 
                                            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                                            SelectMethod="GetDataByUser" 
                                            TypeName="ContractsTableAdapters.ContractTableAdapter" UpdateMethod="Update">
                                            <DeleteParameters>
                                                <asp:Parameter Name="Original_ContractID" Type="Int32" />
                                            </DeleteParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="Template" Type="Boolean" />
                                                <asp:Parameter Name="HotelId" Type="Int32" />
                                                <asp:Parameter Name="MarketId" Type="String" />
                                                <asp:Parameter Name="Start" Type="DateTime" />
                                                <asp:Parameter Name="Finish" Type="DateTime" />
                                                <asp:Parameter Name="Commision" Type="Decimal" />
                                                <asp:Parameter Name="Title" Type="String" />
                                                <asp:Parameter Name="Year" Type="Int16" />
                                                <asp:Parameter Name="Description" Type="String" />
                                                <asp:Parameter Name="StateId" Type="Int32" />
                                                <asp:Parameter Name="CopyId" Type="Int32" />
                                                <asp:Parameter Name="TourOpId" Type="Int32" />
                                                <asp:Parameter Name="Original_ContractID" Type="Int32" />
                                            </UpdateParameters>
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="hfUsername" Name="UserName" 
                                                    PropertyName="Value" Type="String" />
                                                <asp:Parameter DefaultValue="False" Name="Template" Type="Boolean" />
                                            </SelectParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="Template" Type="Boolean" />
                                                <asp:Parameter Name="HotelId" Type="Int32" />
                                                <asp:Parameter Name="MarketId" Type="String" />
                                                <asp:Parameter Name="Start" Type="DateTime" />
                                                <asp:Parameter Name="Finish" Type="DateTime" />
                                                <asp:Parameter Name="Commision" Type="Decimal" />
                                                <asp:Parameter Name="Title" Type="String" />
                                                <asp:Parameter Name="Year" Type="Int16" />
                                                <asp:Parameter Name="Description" Type="String" />
                                                <asp:Parameter Name="StateId" Type="Int32" />
                                                <asp:Parameter Name="CopyId" Type="Int32" />
                                                <asp:Parameter Name="TourOpId" Type="Int32" />
                                                <asp:Parameter Direction="InputOutput" Name="NewID" Type="Int32" />
                                            </InsertParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                    <td class="GridRow1B" style="width: 100px; text-align: right;">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" style="width: 100px; text-align: left;">
                                        Description
                                    </td>
                                    <td class="GridRow1B" style="width: 400px" align="left">
                                        <asp:TextBox ID="txtDescription" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="fltName"
                                            WatermarkCssClass="WaterMark" WatermarkText="Contract description (use % as wildchar)" />
                                    </td>
                                    <td class="GridRow1B" style="width: 100px; text-align: right;">
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
                                        <asp:ObjectDataSource ID="dsMarkets" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="TourOperTableAdapters.MarketTableAdapter"
                                            UpdateMethod="Update">
                                            <DeleteParameters>
                                                <asp:Parameter Name="Original_MarketID" Type="String" />
                                            </DeleteParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="Market" Type="String" />
                                                <asp:Parameter Name="Original_MarketID" Type="String" />
                                            </UpdateParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="MarketID" Type="String" />
                                                <asp:Parameter Name="Market" Type="String" />
                                            </InsertParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                    <td class="GridRow1B">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Hotel
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" DataSourceID="dsUserHotels"
                                            DataTextField="Hotel" DataValueField="HotelID" AppendDataBoundItems="True">
                                            <asp:ListItem Selected="True" Value="">all hotels.</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsUserHotels" runat="server" OldValuesParameterFormatString="original_{0}"
                                            SelectMethod="GetData" TypeName="ContractsTableAdapters.SelectUserHotelTableAdapter">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value"
                                                    Type="String" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                    <td class="GridRow1B">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" style="width: 110px">
                                        Tour Operator
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:DropDownList ID="ddlTO" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                            DataSourceID="dsTO" DataTextField="TourOp" DataValueField="TourOpID">
                                            <asp:ListItem Selected="True" Value="">all Tour Operators</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsTO" runat="server" OldValuesParameterFormatString="original_{0}"
                                            SelectMethod="GetData" TypeName="ContractsTableAdapters.SelectUserTourOpTableAdapter">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value"
                                                    Type="String" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                    <td class="GridRow1B">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Meal Plan</td>
                                    <td class="GridRow1B">
                                        <asp:DropDownList ID="ddlMealPlan" runat="server" AppendDataBoundItems="True" 
                                            CssClass="TextBox" DataSourceID="dsMealPlan" DataTextField="MealPlan" 
                                            DataValueField="MealPlanID">
                                            <asp:ListItem Selected="True" Value="">all </asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsMealPlan" runat="server" DeleteMethod="Delete" 
                                            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                                            SelectMethod="GetData" 
                                            TypeName="dsMaintBasicTableAdapters.MealPlanTableAdapter" UpdateMethod="Update">
                                            <DeleteParameters>
                                                <asp:Parameter Name="Original_MealPlanID" Type="String" />
                                            </DeleteParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="MealPlan" Type="String" />
                                                <asp:Parameter Name="RateConstrain" Type="Int16" />
                                                <asp:Parameter Name="Original_MealPlanID" Type="String" />
                                            </UpdateParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="MealPlanID" Type="String" />
                                                <asp:Parameter Name="MealPlan" Type="String" />
                                                <asp:Parameter Name="RateConstrain" Type="Int16" />
                                            </InsertParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                    <td class="GridRow1B">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Rate Type </td>
                                    <td class="GridRow1B">
                                        <asp:DropDownList ID="ddlRateType" runat="server" CssClass="TextBox" 
                                            AutoPostBack="True">
                                            <asp:ListItem  Value="">all</asp:ListItem>
                                            <asp:ListItem Value="3">Contract</asp:ListItem>
                                            <asp:ListItem Value="2">EBB</asp:ListItem>
                                            <asp:ListItem Value="1">Special</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="GridRow1B">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Rate Type Sub Category</td>
                                    <td class="GridRow1B">
                                        <asp:DropDownList ID="ddlRateTypeId" runat="server" CssClass="TextBox" 
                                            DataSourceID="dsRateType" DataTextField="RateTypeID" 
                                            DataValueField="RateTypeID" AppendDataBoundItems="True">
                                            <asp:ListItem  Value="">all</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsRateType" runat="server" DeleteMethod="Delete" 
                                            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                                            SelectMethod="GetDataByRateType" 
                                            TypeName="dsMaintBasicTableAdapters.RateTypeTableAdapter" 
                                            UpdateMethod="Update">
                                            <DeleteParameters>
                                                <asp:Parameter Name="Original_RateTypeID" Type="String" />
                                            </DeleteParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="RateType" Type="Int16" />
                                                <asp:Parameter Name="Priority" Type="Int32" />
                                                <asp:Parameter Name="RateSeq" Type="Int32" />
                                                <asp:Parameter Name="Original_RateTypeID" Type="String" />
                                            </UpdateParameters>
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlRateType" Name="RateType" 
                                                    PropertyName="SelectedValue" Type="Int16" />
                                            </SelectParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="RateTypeID" Type="String" />
                                                <asp:Parameter Name="RateType" Type="Int16" />
                                                <asp:Parameter Name="Priority" Type="Int32" />
                                                <asp:Parameter Name="RateSeq" Type="Int32" />
                                            </InsertParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                    <td class="GridRow1B">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Rate Option</td>
                                    <td class="GridRow1B">
                                        <asp:DropDownList ID="ddlRateOption" runat="server" CssClass="TextBox">
                                            <asp:ListItem Value="">all</asp:ListItem>
                                            <asp:ListItem Value="0">Per Arrival</asp:ListItem>
                                            <asp:ListItem Value="1">Per Stay</asp:ListItem>
                                            <asp:ListItem Value="2">Inclusiv</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="GridRow1B">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Room Type</td>
                                    <td class="GridRow1B">
                                        <asp:DropDownList ID="ddlRoomType" runat="server" CssClass="TextBox" 
                                            DataSourceID="dsroomType" DataTextField="RoomTypeID" 
                                            DataValueField="RoomTypeID" AppendDataBoundItems="True">
                                            <asp:ListItem Value="">all</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsroomType" runat="server" DeleteMethod="Delete" 
                                            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                                            SelectMethod="GetData" 
                                            TypeName="dsMaintBasicTableAdapters.RoomTypeTableAdapter" UpdateMethod="Update">
                                            <DeleteParameters>
                                                <asp:Parameter Name="Original_RoomTypeID" Type="String" />
                                            </DeleteParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="RoomType" Type="String" />
                                                <asp:Parameter Name="Description" Type="String" />
                                                <asp:Parameter Name="Original_RoomTypeID" Type="String" />
                                            </UpdateParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="RoomTypeID" Type="String" />
                                                <asp:Parameter Name="RoomType" Type="String" />
                                                <asp:Parameter Name="Description" Type="String" />
                                            </InsertParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                    <td class="GridRow1B">
                                        &nbsp;</td>
                                </tr>
                                                                <tr>
                                    <td class="GridRow1B">
                                        Commisionable</td>
                                    <td class="GridRow1B">
                                        <asp:CheckBox ID="cbCommision" runat="server" />
                                    </td>
                                    <td class="GridRow1B">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Created
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:CompareValidator ID="CompareValidator21" runat="server" 
                                            ControlToValidate="fltCreated" Display="None" ErrorMessage="Only date input" 
                                            Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender21" runat="server" 
                                            Enabled="True" TargetControlID="CompareValidator21">
                                        </asp:ValidatorCalloutExtender>
                                        <asp:TextBox ID="fltCreated" runat="server" CssClass="TextBox" />
                                        <asp:CalendarExtender ID="CalendarExtender21" runat="server" 
                                            CssClass="cal_Theme1" Enabled="True" TargetControlID="fltCreated">
                                        </asp:CalendarExtender>
                                    </td>
                                    <td class="GridRow1B">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Rate Received
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:CompareValidator ID="CompareValidator22" runat="server" ControlToValidate="fltRateReceived"
                                            Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender22" runat="server"
                                            Enabled="True" TargetControlID="CompareValidator22">
                                        </asp:ValidatorCalloutExtender>
                                        <asp:TextBox ID="fltRateReceived" runat="server" CssClass="TextBox" />
                                        <asp:CalendarExtender ID="CalendarExtender22" runat="server" Enabled="True"
                                            TargetControlID="fltRateReceived" CssClass="cal_Theme1">
                                        </asp:CalendarExtender>
                                        <asp:CheckBoxList ID="cblReceived" runat="server">
                                            <asp:ListItem Selected="True" Value="0">All</asp:ListItem>
                                            <asp:ListItem Value="1">Received Date &gt; Start Date</asp:ListItem>
                                            <asp:ListItem Value="2">Creation Date &gt; Received Date</asp:ListItem>
                                        </asp:CheckBoxList>
                                        <asp:Panel ID="Panel1" runat="server" Visible="False">
                                            <asp:CheckBox ID="cbAll" runat="server" Text="All" />
                                            &nbsp;
                                            <asp:CheckBox ID="cbReceivedG" runat="server" 
                                                Text="Received Date &gt; Start Date" />
                                            &nbsp;&nbsp;
                                            <asp:CheckBox ID="cbReceivedS" runat="server" />
                                        </asp:Panel>
                                    </td>
                                    <td class="GridRow1B">
                                        &nbsp;
                                    </td>
                                </tr>

                                <tr>
                                    <td class="GridRow1B">
                                        Start
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="fltStart"
                                            Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                        <asp:ValidatorCalloutExtender ID="CompareValidator7_ValidatorCalloutExtender" runat="server"
                                            Enabled="True" TargetControlID="CompareValidator7">
                                        </asp:ValidatorCalloutExtender>
                                        <asp:TextBox ID="fltStart" runat="server" CssClass="TextBox" />
                                        <asp:CalendarExtender ID="fltStart_CalendarExtender" runat="server" Enabled="True"
                                            TargetControlID="fltStart" CssClass="cal_Theme1">
                                        </asp:CalendarExtender>
                                    </td>
                                    <td class="GridRow1B">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        End
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:CompareValidator ID="CompareValidator8" runat="server" ControlToValidate="fltFinish"
                                            Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                        <asp:ValidatorCalloutExtender ID="CompareValidator8_ValidatorCalloutExtender" runat="server"
                                            Enabled="True" TargetControlID="CompareValidator8">
                                        </asp:ValidatorCalloutExtender>
                                        <asp:TextBox ID="fltFinish" runat="server" CssClass="TextBox" />
                                        <asp:CalendarExtender ID="fltFinish_CalendarExtender" runat="server" Enabled="True"
                                            TargetControlID="fltFinish" CssClass="cal_Theme1">
                                        </asp:CalendarExtender>
                                    </td>
                                    <td class="GridRow1B">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Booking Start
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:CompareValidator ID="CompareValidator14" runat="server" ControlToValidate="fltBkStart"
                                            Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender14" runat="server"
                                            Enabled="True" TargetControlID="CompareValidator14">
                                        </asp:ValidatorCalloutExtender>
                                        <asp:TextBox ID="fltBkStart" runat="server" CssClass="TextBox" />
                                        <asp:CalendarExtender ID="CalendarExtender14" runat="server" Enabled="True"
                                            TargetControlID="fltBkStart" CssClass="cal_Theme1">
                                        </asp:CalendarExtender>
                                    </td>
                                    <td class="GridRow1B">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Booking End
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:CompareValidator ID="CompareValidator15" runat="server" ControlToValidate="fltBkEnd"
                                            Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                        <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender15" runat="server"
                                            Enabled="True" TargetControlID="CompareValidator15">
                                        </asp:ValidatorCalloutExtender>
                                        <asp:TextBox ID="fltBkEnd" runat="server" CssClass="TextBox" />
                                        <asp:CalendarExtender ID="CalendarExtender15" runat="server" Enabled="True"
                                            TargetControlID="fltBkEnd" CssClass="cal_Theme1">
                                        </asp:CalendarExtender>
                                    </td>
                                    <td class="GridRow1B">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        State
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:DropDownList ID="ddlState" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                            DataSourceID="dsCntState" DataTextField="ContractState" DataValueField="ContractStateID">
                                            <asp:ListItem Selected="True" Value="">all states</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsCntState" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ContractsTableAdapters.ContractStateTableAdapter"
                                            UpdateMethod="Update">
                                            <DeleteParameters>
                                                <asp:Parameter Name="Original_ContractStateID" Type="Int32" />
                                            </DeleteParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="ContractState" Type="String" />
                                                <asp:Parameter Name="ContractStateDesc" Type="String" />
                                                <asp:Parameter Name="Original_ContractStateID" Type="Int32" />
                                            </UpdateParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="ContractStateID" Type="Int32" />
                                                <asp:Parameter Name="ContractState" Type="String" />
                                                <asp:Parameter Name="ContractStateDesc" Type="String" />
                                            </InsertParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                    <td class="GridRow1B">
                                        &nbsp;
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td class="GridRowClear">
                                        &nbsp;</td>
                                    <td class="GridRowClear">
                                        <asp:CheckBox ID="cbSupp" runat="server" Text="Print with supplements" />
                                    </td>
                                    <td class="GridRowClear">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="ComandRow2T">
                                        <asp:CheckBox ID="cbHotel" runat="server" Text="Hotel" TextAlign="Left" 
                                            Visible="False" />
                                    </td>
                                    <td align="right" class="ComandRow2T" style="padding-right: 5px; width: 370px">
                                        <asp:CheckBox ID="cbExcel" runat="server" Text="export to Excel" />
                                    </td>
                                    <td class="ComandRow2T" style="height: 30px; padding-top: 5px; width: 130px;">
                                        <asp:Button ID="lbCntRates" runat="server" SkinID="skBtnBase" Text="Report" />
                                        <asp:Button ID="lbCntRates0" runat="server" SkinID="skBtnBase" Text="Report" 
                                            Visible="False" />
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
        <br />
    </div>
    <br />
    <div class="Blue">
    
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table cellpadding="0" cellspacing="0" style="width: 3px">
                    <tr>
                        <td style="text-align: right; padding-top: 5px; height: 30px;">
                            <asp:ObjectDataSource ID="dsCntRatesold" runat="server" 
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                TypeName="CntReportsTableAdapters.FilterContractRateTableAdapter">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="hfUsername" Name="UserName" 
                                        PropertyName="value" Type="String" />
                                    <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="ddlTO" Name="TourOpId" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="ddlMarkets" Name="MarketId" 
                                        PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="fltName" Name="Title" PropertyName="Text" 
                                        Type="String" />
                                    <asp:ControlParameter ControlID="fltCreated" Name="Created" PropertyName="Text" 
                                        Type="DateTime" />
                                    <asp:ControlParameter ControlID="fltRateReceived" Name="RateRecieved" 
                                        PropertyName="Text" Type="DateTime" />
                                    <asp:ControlParameter ControlID="ddlMealPlan" Name="MealPlanID" 
                                        PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddlState" Name="StateId" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="cbCommision" Name="Commisionable" 
                                        PropertyName="Checked" Type="Boolean" />
                                    <asp:ControlParameter ControlID="ddlRateType" Name="RateType" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="ddlRateTypeId" Name="RateTypeId" 
                                        PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddlRoomType" Name="RoomTypeId" 
                                        PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="fltStart" Name="Start" PropertyName="Text" 
                                        Type="DateTime" />
                                    <asp:ControlParameter ControlID="fltFinish" Name="Finish" PropertyName="Text" 
                                        Type="DateTime" />
                                    <asp:ControlParameter ControlID="fltBkStart" Name="BkStart" PropertyName="Text" 
                                        Type="DateTime" />
                                    <asp:ControlParameter ControlID="fltBkEnd" Name="BkFinish" PropertyName="Text" 
                                        Type="DateTime" />
                                    <asp:ControlParameter ControlID="ddlRateOption" Name="RateOption" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <asp:ObjectDataSource ID="dsCntRates" runat="server" 
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                TypeName="CntReportsTableAdapters.FilterContractRate1TableAdapter">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="hfUsername" Name="UserName" 
                                        PropertyName="value" Type="String" />
                                    <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="ddlTO" Name="TourOpId" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="ddlMarkets" Name="MarketId" 
                                        PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddlContract" Name="Title" PropertyName="SelectedValue" 
                                        Type="String" />
                                    <asp:ControlParameter ControlID="fltCreated" Name="Created" PropertyName="Text" 
                                        Type="DateTime" />
                                    <asp:ControlParameter ControlID="fltRateReceived" Name="RateRecieved" 
                                        PropertyName="Text" Type="DateTime" />
                                    <asp:ControlParameter ControlID="ddlMealPlan" Name="MealPlanID" 
                                        PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddlState" Name="StateId" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="cbCommision" Name="Commisionable" 
                                        PropertyName="Checked" Type="Boolean" />
                                    <asp:ControlParameter ControlID="ddlRateType" Name="RateType" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                    <asp:ControlParameter ControlID="ddlRateTypeId" Name="RateTypeId" 
                                        PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="ddlRoomType" Name="RoomTypeId" 
                                        PropertyName="SelectedValue" Type="String" />
                                    <asp:ControlParameter ControlID="fltStart" Name="Start" PropertyName="Text" 
                                        Type="DateTime" />
                                    <asp:ControlParameter ControlID="fltFinish" Name="Finish" PropertyName="Text" 
                                        Type="DateTime" />
                                    <asp:ControlParameter ControlID="fltBkStart" Name="BkStart" PropertyName="Text" 
                                        Type="DateTime" />
                                    <asp:ControlParameter ControlID="fltBkEnd" Name="BkFinish" PropertyName="Text" 
                                        Type="DateTime" />
                                    <asp:ControlParameter ControlID="ddlRateOption" Name="RateOption" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                    <asp:Parameter Name="RateCodeID" Type="String" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:ObjectDataSource ID="dsCntSupp" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="CntReportsTableAdapters.RateSupplTableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsCntSpec" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="CntReportsTableAdapters.SpecForRateReportTableAdapter">
        </asp:ObjectDataSource>
    </div>
    </asp:Content>

