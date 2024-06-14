<%@ Page Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" 
    CodeFile="NewContaractRate.aspx.vb" Inherits="Reports_Contracts_NewContaractRate" EnableEventValidation="false" %>

<%@ Register src="~/App_UserControls/HotelControl.ascx" tagname="HotelControl" tagprefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    New Contract Rate Report
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
                            <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />&nbsp; 
                        </asp:Label>
                        <asp:HyperLink ID="btSwitchReport" runat="server"
                            style="float:right; color: White; padding: 4px; font-weight: bold;"
                            NavigateUrl="~/Reports/Contracts/RptContractRate.aspx">
                            Old Rate Report
                        </asp:HyperLink>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px">
                    <asp:Panel ID="pnSearch" runat="server">
                        <asp:Panel ID="pnSearchPart" runat="server" Style="width: 600px" DefaultButton="btReport">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <%--
                                    <td class="GridRow1B">Hotel</td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" 
                                            DataSourceID="dsHotels" DataTextField="Hotel" DataValueField="HotelID" 
                                            AppendDataBoundItems="True">
                                            <asp:ListItem Value="">all hotels</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsHotels" runat="server" 
                                            TypeName="dsNewRateReportTableAdapters.HotelTableAdapter" 
                                            SelectMethod="GetData" />
                                    </td>
                                    --%>
                                    <td class="GridRow1B" colspan="3" >
                                        <uc:HotelControl ID="ddlHotel" runat="server" 
                                            LabelWidth="100px" ControlWidth="500px" 
                                            NoCCI="true"
                                            Mandatory="false" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" >Tour Operator</td>
                                    <td class="GridRow1B" colspan="2" >
                                        <asp:DropDownList ID="ddlTO" runat="server" CssClass="TextBox"
                                            DataSourceID="dsTO" DataTextField="TourOp" DataValueField="TourOpID"
                                            AppendDataBoundItems="True" >
                                            <asp:ListItem Value="">all tour operators</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsTO" runat="server" 
                                            TypeName="dsNewRateReportTableAdapters.TourOpTableAdapter"
                                            SelectMethod="GetData" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Market</td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:DropDownList ID="ddlMarkets" runat="server" CssClass="TextBox"
                                            DataSourceID="dsMarkets" DataTextField="Market" DataValueField="MarketID"
                                            AppendDataBoundItems="True" >
                                            <asp:ListItem Value="">all markets</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsMarkets" runat="server" 
                                            TypeName="dsNewRateReportTableAdapters.MarketTableAdapter" 
                                            SelectMethod="GetData" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Pay.Condition</td>
                                    <td class="GridRow1B" colspan="2" >
                                        <asp:DropDownList ID="ddlPayCond" runat="server" CssClass="TextBox"
                                            DataSourceID="dsPayCond" DataTextField="PayCond" DataValueField="PayCondID" 
                                            AppendDataBoundItems="True">
                                            <asp:ListItem Selected="True" Value="">all </asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsPayCond" runat="server" 
                                            TypeName="dsNewRateReportTableAdapters.PayCondTableAdapter" 
                                            SelectMethod="GetData" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Rate Type</td>
                                    <td class="GridRow1B" colspan="2" >
                                        <asp:DropDownList ID="ddlRType" runat="server" CssClass="TextBox">
                                            <asp:ListItem Value="">all</asp:ListItem>
                                            <asp:ListItem Value="1">Contract</asp:ListItem>
                                            <asp:ListItem Value="2">Specials</asp:ListItem>
                                            <asp:ListItem Value="3">General Supplements</asp:ListItem>
                                            <asp:ListItem Value="4">Free-rate Specials</asp:ListItem>
                                            <asp:ListItem Value="5">Charging Supplements</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Rate Code</td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:TextBox ID="fltRateCode" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="fltRateCode_TextBoxWatermarkExtender" 
                                            runat="server" TargetControlID="fltRateCode" WatermarkCssClass="WaterMark" 
                                            WatermarkText="Enter part of the Rate Code to search" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" style="width: 100px; text-align: left;">Title</td>
                                    <td class="GridRow1B" style="width: 500px; text-align: left" colspan="2">
                                        <asp:TextBox ID="fltName" runat="server" CssClass="TextBox" Visible="True" />
                                        <asp:TextBoxWatermarkExtender ID="fltNameExt" runat="server" TargetControlID="fltName"
                                            WatermarkCssClass="WaterMark" WatermarkText="Enter part of Contract title to search" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Start</td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:TextBox ID="fltStart" runat="server" CssClass="TextBox" />
                                        <asp:CalendarExtender ID="cal_fltStart" runat="server" Enabled="True"
                                            TargetControlID="fltStart" CssClass="cal_Theme1" />
                                        <asp:CompareValidator ID="date_fltStart" runat="server" ControlToValidate="fltStart"
                                            Display="None" ErrorMessage="Not a valid date!" Operator="DataTypeCheck" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="ext_date_fltStart" runat="server"
                                            Enabled="True" TargetControlID="date_fltStart" />
                                        <%--<asp:RequiredFieldValidator ID="req_fltStart" runat="server"  ControlToValidate="fltStart"
                                            ErrorMessage="Mandatory field!" Display="None" />
                                        <asp:ValidatorCalloutExtender ID="ext_req_fltStart" runat="server"
                                            Enabled="True" TargetControlID="req_fltStart" />--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Finish</td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:TextBox ID="fltFinish" runat="server" CssClass="TextBox" />
                                        <asp:CalendarExtender ID="cal_fltFinish" runat="server" Enabled="True"
                                            TargetControlID="fltFinish" CssClass="cal_Theme1" />
                                        <asp:CompareValidator ID="date_fltFinish" runat="server" ControlToValidate="fltFinish"
                                            Display="None" ErrorMessage="Not a valid date!" Operator="DataTypeCheck" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="ex_date_fltFinish" runat="server"
                                            Enabled="True" TargetControlID="date_fltFinish" />
                                        <%--<asp:RequiredFieldValidator ID="req_fltFinish" runat="server"  ControlToValidate="fltFinish"
                                            ErrorMessage="Mandatory field!" Display="None" />
                                        <asp:ValidatorCalloutExtender ID="ext_req_fltFinish" runat="server"
                                            Enabled="True" TargetControlID="req_fltFinish" />--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" style="width: 100px; text-align: left;">Bk.Code</td>
                                    <td class="GridRow1B" style="width: 500px; text-align: left" colspan="2">
                                        <asp:TextBox ID="fltBkCode" runat="server" CssClass="TextBox" Visible="True" />
                                        <asp:TextBoxWatermarkExtender ID="fltBkCode_TextBoxWatermarkExtender" runat="server" TargetControlID="fltBkCode"
                                            WatermarkCssClass="WaterMark" WatermarkText="Enter part of Booking code to search" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Bk.Start</td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:TextBox ID="fltBkStart" runat="server" CssClass="TextBox" />
                                        <asp:CompareValidator ID="date_fltBkStart" runat="server" ControlToValidate="fltBkStart"
                                            Display="None" ErrorMessage="Not a valid date!" Operator="DataTypeCheck" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="ex_date_fltBkStart" runat="server" Enabled="True"
                                            TargetControlID="date_fltBkStart" />
                                        <asp:CalendarExtender ID="cal_fltBkStart" runat="server" Enabled="True" 
                                        TargetControlID="fltBkStart" CssClass="cal_Theme1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">BK.End</td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:TextBox ID="fltBkEnd" runat="server" CssClass="TextBox" />
                                        <asp:CompareValidator ID="date_fltBkEnd" runat="server" ControlToValidate="fltBkEnd"
                                            Display="None" ErrorMessage="Not a valid date!" Operator="DataTypeCheck" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="ex_date_fltBkEnd" runat="server" Enabled="True"
                                            TargetControlID="date_fltBkEnd" />
                                        <asp:CalendarExtender ID="cal_fltBkEnd" runat="server" Enabled="True" 
                                            TargetControlID="fltBkEnd" CssClass="cal_Theme1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear">State</td>
                                    <td class="GridRowClear" colspan="2">
                                        <asp:DropDownList ID="ddlState" runat="server" CssClass="TextBox">
                                            <asp:ListItem Value="">all states</asp:ListItem>
                                            <asp:ListItem Value="1">Active</asp:ListItem>
                                            <asp:ListItem Value="0">Inactive</asp:ListItem>
                                            <asp:ListItem Value="-1">Suspended</asp:ListItem>
                                            <asp:ListItem Value="2">Not Suspended</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="ComandRow2T" rowspan="2" style="text-align: left;">
                                        <asp:CheckBox ID="cbHotel" runat="server" Text="Hotel" TextAlign="Right" />
                                    </td>
                                    <td class="ComandRow2T" align="right">
                                        <asp:RadioButtonList ID="ddlOptions" runat="server" RepeatDirection="Horizontal" >
                                            <asp:ListItem Value="1" Selected="True">Full</asp:ListItem>
                                            <asp:ListItem Value="2" >Summary</asp:ListItem>
                                            <asp:ListItem Value="3" >Details</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                    <td class="ComandRow2T" align="left">
                                        <asp:CheckBox ID="cbComments" runat="server" Text="Include comments" TextAlign="Left" Visible="false"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="GridRow1T" style="padding-right: 5px;">
                                        <asp:CheckBox ID="cbExcel" runat="server" Text="export to Excel" TextAlign="Left" />
                                    </td>
                                    <td class="GridRow1T" style="height: 30px; padding-top: 5px; width: 130px; text-align: right;">
                                        <asp:Button ID="btReport" runat="server" SkinID="skBtnBase" Text="Report" />
                                        &nbsp;<asp:Button ID="btClear" runat="server" SkinID="skBtnClear" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="dsRates" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="dsNewRateReportTableAdapters.ReportRatesDetailAllTableAdapter">
            <SelectParameters>
                <%--<asp:ControlParameter ControlID="ddlHotel" Name="HotelID" PropertyName="SelectedValue" Type="Int32" />--%>
                <asp:ControlParameter ControlID="ddlHotel" Name="HotelID" PropertyName="SelectedHotelValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlTO" Name="TourOpID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlMarkets" Name="MarketID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddlPayCond" Name="PayCondID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddlRType" Name="RType" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="fltStart" Name="Start" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="fltFinish" Name="Finish" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="fltBkStart" Name="BkStart" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="fltBkEnd" Name="BkFinish" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="fltBkCode" Name="BkCode" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="fltRateCode" Name="RateCodeID" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="fltName" Name="Title" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="ddlState" Name="StateID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsRatesHTL" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataHTL" 
            TypeName="dsNewRateReportTableAdapters.ReportRatesDetailAllTableAdapter">
            <SelectParameters>
                <%--<asp:ControlParameter ControlID="ddlHotel" Name="HotelID" PropertyName="SelectedValue" Type="Int32" />--%>
                <asp:ControlParameter ControlID="ddlHotel" Name="HotelID" PropertyName="SelectedHotelValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlTO" Name="TourOpID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlMarkets" Name="MarketID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddlPayCond" Name="PayCondID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddlRType" Name="RType" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="fltStart" Name="Start" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="fltFinish" Name="Finish" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="fltBkStart" Name="BkStart" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="fltBkEnd" Name="BkFinish" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="fltBkCode" Name="BkCode" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="fltRateCode" Name="RateCodeID" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="fltName" Name="Title" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="ddlState" Name="StateID" PropertyName="SelectedValue" Type="Int32" />
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

