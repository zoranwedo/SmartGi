<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" 
    EnableEventValidation="false" CodeFile="RepSeniorFilter.aspx.vb" Inherits="Reports_Accounting_RepSeniorFilter" %>

<%@ Register assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" namespace="System.Web.UI.WebControls" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Senior Reports
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
                        <asp:HyperLink ID="HyperLink1" runat="server" Text="Simple Filter" 
                            style="float:right; color: White; padding: 4px; font-weight: bold;" 
                            NavigateUrl="~/Reports/Accounting/RepSenior.aspx" />
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px">
                    <asp:Panel ID="pnSearch" runat="server" Style="width: 600px" >
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="GridRow1B" style="width: 120px;">Hotel Group</td>
                                <td class="GridRow1B" style="width: 480px;">
                                    <asp:DropDownList ID="ddlHotelGroup" runat="server" BackColor="White" CssClass="TextBox" />
                                    <asp:CascadingDropDown ID="exHotelGroup" runat="server" 
                                        TargetControlID="ddlHotelGroup" Category="HotelGroupID" 
                                        ServicePath="~/HtlGroup.asmx"
                                        ServiceMethod="GetHotelGroups" >
                                    </asp:CascadingDropDown>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Hotel</td>
                                <td class="GridRow1B" >
                                    <asp:DropDownList ID="ddlHotel" runat="server" BackColor="White" CssClass="TextBox" />
                                    <asp:CascadingDropDown ID="exHotel" runat="server" 
                                        ParentControlID="ddlHotelGroup"
                                        TargetControlID="ddlHotel" Category="HotelID" 
                                        ServicePath="~/HtlGroup.asmx"
                                        ServiceMethod="GetHotels" >
                                    </asp:CascadingDropDown>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" >Tour Operator Group</td>
                                <td class="GridRow1B" >
                                    <asp:DropDownList ID="ddlTOGroup" runat="server" BackColor="White" CssClass="TextBox" />
                                    <asp:CascadingDropDown ID="exTOGroup" runat="server" 
                                        TargetControlID="ddlTOGroup" Category="TourOpGroupID" 
                                        ServicePath="~/TOGroup.asmx"
                                        ServiceMethod="GetTOGroups" >
                                    </asp:CascadingDropDown>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Tour Operator</td>
                                <td class="GridRow1B" >
                                    <asp:DropDownList ID="ddlTO" runat="server" BackColor="White" CssClass="TextBox" />
                                    <asp:CascadingDropDown ID="exTO" runat="server" 
                                        ParentControlID="ddlTOGroup"
                                        TargetControlID="ddlTO" Category="TourOpID" 
                                        ServicePath="~/TOGroup.asmx"
                                        ServiceMethod="GetTTOOs" >
                                    </asp:CascadingDropDown>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Payment Condition</td>
                                <td class="GridRow1B" >
                                    <asp:DropDownList ID="ddlPayCond" runat="server" BackColor="White" 
                                        CssClass="TextBox" AppendDataBoundItems="True" DataSourceID="dsPayCond" 
                                        DataTextField="PayCond" DataValueField="PayCondID" >
                                        <asp:ListItem Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsPayCond" runat="server" 
                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                        TypeName="dsMaintBasicTableAdapters.PayCondTableAdapter"></asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Market</td>
                                <td class="GridRow1B" >
                                    <asp:DropDownList ID="ddlMarket" runat="server" BackColor="White" 
                                        CssClass="TextBox" AppendDataBoundItems="True" DataSourceID="dsMarket" 
                                        DataTextField="Market" DataValueField="MarketID" >
                                        <asp:ListItem Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsMarket" runat="server" 
                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                        TypeName="dsMaintBasicTableAdapters.MarketTableAdapter"></asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Date From
                                </td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="txtDocDateFrom" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="txtDocDateFrom_Watermark" runat="server"
                                        TargetControlID="txtDocDateFrom" WatermarkCssClass="WaterMark" WatermarkText="Document date equals or later than" />
                                    <asp:CalendarExtender ID="txtDocDateFrom_Calendar" runat="server" CssClass="cal_Theme1" 
                                        TargetControlID="txtDocDateFrom" Enabled="True" />
                                    <asp:CompareValidator ID="txtDocDateFrom_Date" runat="server" Operator="DataTypeCheck" Type="Date" 
                                        ControlToValidate="txtDocDateFrom" Display="None" ErrorMessage="Not a valid date!" />
                                    <asp:ValidatorCalloutExtender ID="txtDocDateFrom_DateCallout" runat="server" Enabled="True" 
                                        TargetControlID="txtDocDateFrom_Date" />
                                    <asp:RequiredFieldValidator ID="txtDocDateFrom_Required" runat="server" ErrorMessage="Required field!" 
                                        ControlToValidate="txtDocDateFrom" Display="None" />
                                    <asp:ValidatorCalloutExtender ID="txtDocDateFrom_RequiredCallout" runat="server" Enabled="True" 
                                        TargetControlID="txtDocDateFrom_Required" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Date To
                                </td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="txtDocDateTo" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="txtDocDateTo_Watermark" runat="server"
                                        TargetControlID="txtDocDateTo" WatermarkCssClass="WaterMark" WatermarkText="Document Date equals or less than" />
                                    <asp:CalendarExtender ID="txtDocDateTo_Calendar" runat="server" CssClass="cal_Theme1"
                                        TargetControlID="txtDocDateTo" Enabled="True" />
                                    <asp:CompareValidator ID="txtDocDateTo_Date" runat="server" Operator="DataTypeCheck" Type="Date" 
                                        ControlToValidate="txtDocDateTo" Display="None" ErrorMessage="Not a valid date!" />
                                    <asp:ValidatorCalloutExtender ID="txtDocDateTo_DateCallout" runat="server"
                                        TargetControlID="txtDocDateTo_Date" Enabled="True" />
                                    <asp:RequiredFieldValidator ID="txtDocDateTo_Required" runat="server" ErrorMessage="Required field!" 
                                        ControlToValidate="txtDocDateTo" Display="None" />
                                    <asp:ValidatorCalloutExtender ID="txtDocDateTo_RequiredCallout" runat="server" Enabled="True" 
                                        TargetControlID="txtDocDateFrom_Required" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear" style="width: 120px;" >
                                    &nbsp;
                                </td>
                                <td class="GridRowClear" style="width: 480px;">
                                    <asp:CheckBox ID="cbCompare" runat="server" Text="Compare witn previous year" TextAlign="Left" />
                                </td>
                            </tr>
                            <tr>
                                <td class="ComandRow2T" style="height: 28px; padding-top: 5px; text-align: right;" >
                                </td>
                                <td class="ComandRow2T" style="height: 28px; padding-top: 5px; text-align: right;">
                                    &nbsp;<asp:Button ID="btGross" runat="server" SkinID="skBtnBase" />
                                    &nbsp;<asp:Button ID="btAdjustments" runat="server" SkinID="skBtnBase" />
                                    &nbsp;<asp:Button ID="btNet" runat="server" SkinID="skBtnBase" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
   <%-- <br />--%>
    <div class="Blue">
        <div style="height: 40px; width: 600px; padding-top: 5px; text-align: left;" >
            <asp:Button ID="btPrint" runat="server" SkinID="skBtnFilter" Text="Print" Width="150px" Visible="false" />
        </div> 
        <asp:HiddenField ID="hfReport" runat="server" Value="0" />
          <asp:Panel runat="server" ID="pnlRpt" Visible="False">  
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lbSenior" runat="server" SkinID="skGridLabel" Text="Senior Report:" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvSeniorFilter" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="dsFilterGross" ShowFooter="True" SkinID="skGridView">
                        <Columns>
                            <asp:BoundField DataField="Hotel" HeaderText="Hotel" FooterText="TOTAL" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="300px" Wrap="false" />
                            </asp:BoundField>
                            <asp:BoundField DataField="1" HeaderText="Jan" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="13" HeaderText="Jan" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="2" HeaderText="Feb" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="14" HeaderText="Feb" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="3" HeaderText="Mar" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="15" HeaderText="Mar" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="4" HeaderText="Apr" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="16" HeaderText="Apr" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="5" HeaderText="May" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="17" HeaderText="May" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="6" HeaderText="Jun" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="18" HeaderText="Jun" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="7" HeaderText="Jul" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="19" HeaderText="Jul" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="8" HeaderText="Aug" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="20" HeaderText="Aug" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="9" HeaderText="Sep" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="21" HeaderText="Sep" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="10" HeaderText="Oct" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="22" HeaderText="Oct" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="11" HeaderText="Nov" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="23" HeaderText="Nov" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="12" HeaderText="Dec" DataFormatString="{0:N2}" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="24" HeaderText="Dec" DataFormatString="{0:N2}" Visible="false" >
                                <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                                <ItemStyle Width="90px" HorizontalAlign="Right" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
         </asp:Panel>       
        <asp:ObjectDataSource ID="dsFilterGross" runat="server" 
            TypeName="dsSeniorRptTableAdapters.AccRptSeniorGrossTableAdapter"
            SelectMethod="GetFilterData" OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlHotelGroup" Name="HotelGroupID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlHotel" Name="HotelID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlTOGroup" Name="TourOpGroupID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlTO" Name="TourOpID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlMarket" Name="MarketID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddlPayCond" Name="PayCondID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="txtDocDateFrom" Name="DateFrom" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="txtDocDateTo" Name="DateTo" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="cbCompare" Name="RptComp" PropertyName="Checked" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsFilterGrossDet" runat="server" 
            TypeName="dsSeniorRptTableAdapters.AccRptSeniorGrossDetTableAdapter"
            SelectMethod="GetFilterData" OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlHotelGroup" Name="HotelGroupID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlHotel" Name="HotelID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlTOGroup" Name="TourOpGroupID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlTO" Name="TourOpID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlMarket" Name="MarketID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddlPayCond" Name="PayCondID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="txtDocDateFrom" Name="DateFrom" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="txtDocDateTo" Name="DateTo" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="cbCompare" Name="RptComp" PropertyName="Checked" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>

        <asp:ObjectDataSource ID="dsFilterAdjustments" runat="server"
            TypeName="dsSeniorRptTableAdapters.AccRptSeniorAdjustmentsTableAdapter"
            SelectMethod="GetFilterData" 
            OldValuesParameterFormatString="original_{0}" >
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlHotelGroup" Name="HotelGroupID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlHotel" Name="HotelID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlTOGroup" Name="TourOpGroupID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlTO" Name="TourOpID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlMarket" Name="MarketID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddlPayCond" Name="PayCondID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="txtDocDateFrom" Name="DateFrom" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="txtDocDateTo" Name="DateTo" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="cbCompare" Name="RptComp" PropertyName="Checked" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsFilteAdjInGross" runat="server" 
            TypeName="dsSeniorRptTableAdapters.AccRptSeniorAdjInGrossTableAdapter"
            SelectMethod="GetFilterData" OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlHotelGroup" Name="HotelGroupID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlHotel" Name="HotelID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlTOGroup" Name="TourOpGroupID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlTO" Name="TourOpID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlMarket" Name="MarketID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddlPayCond" Name="PayCondID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="txtDocDateFrom" Name="DateFrom" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="txtDocDateTo" Name="DateTo" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="cbCompare" Name="RptComp" PropertyName="Checked" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsFilterAdjustmentsDet" runat="server" 
            TypeName="dsSeniorRptTableAdapters.AccRptSeniorAdjustmentsDetTableAdapter"
            SelectMethod="GetFilterData" OldValuesParameterFormatString="original_{0}">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlHotelGroup" Name="HotelGroupID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlHotel" Name="HotelID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlTOGroup" Name="TourOpGroupID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlTO" Name="TourOpID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlMarket" Name="MarketID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddlPayCond" Name="PayCondID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="txtDocDateFrom" Name="DateFrom" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="txtDocDateTo" Name="DateTo" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="cbCompare" Name="RptComp" PropertyName="Checked" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>

        <asp:ObjectDataSource ID="dsFilterNet" runat="server"          
            TypeName="dsSeniorRptTableAdapters.AccRptSeniorNetTableAdapter"
            SelectMethod="GetFilterData" 
            OldValuesParameterFormatString="original_{0}" >
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlHotelGroup" Name="HotelGroupID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlHotel" Name="HotelID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlTOGroup" Name="TourOpGroupID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlTO" Name="TourOpID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlMarket" Name="MarketID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddlPayCond" Name="PayCondID" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="txtDocDateFrom" Name="DateFrom" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="txtDocDateTo" Name="DateTo" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="cbCompare" Name="RptComp" PropertyName="Checked" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>

        <asp:HiddenField ID="dummy" runat="server" />
        <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
            PopupDragHandleControlID="popLabel" CancelControlID="btnYes" DropShadow="True"
            BackgroundCssClass="modalBackground" TargetControlID="dummy" X="200" Y="200">
        </asp:ModalPopupExtender>
        <asp:Panel ID="popPanel" runat="server" Width="300px" BackColor="White" Style="display: none">
            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td class="GridLabelBG">
                        <asp:Label ID="popLabel" runat="server" Text="Title" SkinID="skGridLabel"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="GridBorder">
                        <p style="text-align: center;">
                            <asp:Label ID="popMessage" runat="server" Text="Message" />
                        </p>
                        <p style="text-align: right;" class="GridRow1T"><br />
                            <asp:Button ID="btnYes" runat="server" Text="OK" SkinID="skBtnBase" />&nbsp;
                        </p>
                    </td>
                </tr>
            </table>
        </asp:Panel>

    </div>
</asp:Content>

