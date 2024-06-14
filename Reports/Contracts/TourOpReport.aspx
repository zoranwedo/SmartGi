<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" 
	CodeFile="TourOpReport.aspx.vb" Inherits="Reports_Contracts_TourOpReport" %>

<%@ Register src="~/App_UserControls/FromToDateControl.ascx" tagname="FromToDateControl" tagprefix="uc" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Tour Operators Report
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
                <asp:Panel ID="Panel1" runat="server">
                    <td class="GridLabelBG" width="600px">
                        <asp:Label ID="lblFilter" runat="server" SkinID="skGridLabel">Search/Filter &nbsp;
                            <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />
                            &nbsp; </asp:Label>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px">
                    <asp:Panel ID="pnSearch" runat="server" DefaultButton="btnRecap" style="padding-left: 8px;">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="GridRow1B" style="width: 120px;">
                                    Name
                                </td>
                                <td class="GridRow1B" style="width: 480px;">
                                    <asp:TextBox ID="fltName" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="fltNameExt" runat="server" TargetControlID="fltName"
                                        WatermarkCssClass="WaterMark" WatermarkText="Tour operator name (use % as wild card)" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Market
                                </td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlMarkets" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsMarkets" DataTextField="MarketDisplay" 
                                        DataValueField="MarketID">
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsMarkets" runat="server" OldValuesParameterFormatString="original_{0}"
                                        TypeName="dsTourOperatorTableAdapters.MarketTableAdapter" 
                                        SelectMethod="GetData"></asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Pay Condition
                                </td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlPay" runat="server" CssClass="TextBox" DataSourceID="dsPayCond"
                                        DataTextField="PayCondDisplay" DataValueField="PayCondID" 
                                        AppendDataBoundItems="True">
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsPayCond" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" 
                                        TypeName="dsTourOperatorTableAdapters.PayCondTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Pay Mode</td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlPaymode" runat="server" CssClass="TextBox" DataSourceID="dsPayMode"
                                        DataTextField="PayModeDisplay" DataValueField="PayModeID" 
                                        AppendDataBoundItems="True">
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsPayMode" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" 
                                        TypeName="dsTourOperatorTableAdapters.PayModeTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>

                            <tr>
                                <td class="GridRow1B" >Created</td>
                                <td class="GridRow1B" >
                                    <uc:FromToDateControl ID="ctrlCreated" runat="server"
                                        MandatoryFrom="false"
                                        MandatoryTo="false" />
                                </td>
                            </tr>

                            <tr>
                                <td class="GridRow1B">
                                    Country
                                </td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlCountryCode" runat="server" CssClass="TextBox" DataSourceID="dsCountryCode"
                                        DataTextField="CountryDisplay" DataValueField="CountryCode" 
                                        AppendDataBoundItems="True">
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsCountryCode" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" 
                                        TypeName="dsTourOperatorTableAdapters.CountryCodeTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    City
                                </td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="fltCity" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="fltCityExt" runat="server" TargetControlID="fltCity"
                                        WatermarkCssClass="WaterMark" WatermarkText="City name (use % as wild card)" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Contact Type</td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlContactType" runat="server" CssClass="TextBox" DataSourceID="dsContactType"
                                        DataTextField="ContactTypeDisplay" DataValueField="ContactTypeID" 
                                        AppendDataBoundItems="True">
                                        <asp:ListItem Selected="True" Value="***">none</asp:ListItem>
                                        <asp:ListItem Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsContactType" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" 
                                        TypeName="dsTourOperatorTableAdapters.ContactTypeTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                    <td class="GridRowClear"></td>
                                    <td class="GridRowClear">
                                        <asp:CheckBox ID="cbActive" runat="server" Text="Only Active" Checked="true" />
                                    </td>
                                </tr>
                            <tr>
                                <td class="ComandRow2T">
                                </td>
                                <td class="ComandRow2T" style="padding-right: 5px">
                                    <asp:CheckBox ID="cbExcel" runat="server" Text="export to Excel" Checked="true" style="margin-right: 15px;" Visible="false" />
                                    &nbsp;<asp:Button ID="btnRecap" runat="server" SkinID="skBtnBase" Text="Recap" />
                                    &nbsp;<asp:Button ID="btnReport" runat="server" SkinID="skBtnBase" Text="Report" />
                                    &nbsp;<asp:Button ID="btnClear" runat="server" SkinID="skBtnClear" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    <asp:ObjectDataSource ID="dsTOSearch" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" 
        TypeName="dsTourOperatorTableAdapters.TourOpReportTableAdapter">
        <SelectParameters>
            <asp:Parameter Name="UserName" Type="String" />
            <asp:ControlParameter ControlID="fltName" Name="TourOp" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="ddlMarkets" Name="MarketID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlPay" Name="PayCondID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlPaymode" Name="PayModeId" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlCountryCode" Name="CountryCode" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="fltCity" Name="City" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="cbActive" Name="ActiveOnly" PropertyName="Checked" Type="Boolean" />
            <asp:ControlParameter ControlID="ddlContactType" Name="ContactTypeId" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <%--<asp:ObjectDataSource ID="dsPlain" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataPlain" 
        TypeName="CntReportsTableAdapters.FilterTOContactTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
            <asp:ControlParameter ControlID="fltName" Name="TourOp" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="ddlMarkets" Name="MarketID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlPay" Name="PayCondID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlPaymode" Name="PayModeId" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="TextBox1" Name="CreditDays" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="fltCity" Name="City" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="fltCountry" Name="Country" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="ddlState" Name="ActiveOnly" PropertyName="SelectedValue" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>--%>
</asp:Content>

