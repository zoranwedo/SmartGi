<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="RptTourOp.aspx.vb" Inherits="Reports_Contracts__RptTourOp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Tour Operators
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
                    <asp:Panel ID="pnSearch" runat="server" DefaultButton="Button5" style="padding-left: 8px;">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="GridRow1B" style="width: 100px;">
                                    Name
                                </td>
                                <td class="GridRow1B" style="width: 500px;">
                                    <asp:TextBox ID="fltName" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="fltNameExt" runat="server" TargetControlID="fltName"
                                        WatermarkCssClass="WaterMark" WatermarkText="Tour operator name (use % as wild card)" />
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
                                    Country
                                </td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="fltCountry" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="fltCountryExt" runat="server" TargetControlID="fltCountry"
                                        WatermarkCssClass="WaterMark" WatermarkText="Country name (use % as wild card)" />
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
                                    <asp:ObjectDataSource ID="dsMarkets" runat="server" OldValuesParameterFormatString="original_{0}"
                                        TypeName="TourOperTableAdapters.MarketTableAdapter" SelectMethod="GetData"></asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Pay Condition
                                </td>
                                <td class="GridRow1B">
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
                                    Pay Mode</td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlPaymode" runat="server" CssClass="TextBox" DataSourceID="dsPayMode"
                                        DataTextField="PayMode" DataValueField="PayModeID" 
                                        AppendDataBoundItems="True">
                                        <asp:ListItem Selected="True" Value="">all pay mode</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsPayMode" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" 
                                        TypeName="TourOperTableAdapters.PayModeTableAdapter" DeleteMethod="Delete" 
                                        InsertMethod="Insert" UpdateMethod="Update">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Original_PayModeID" Type="String" />
                                        </DeleteParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="PayMode" Type="String" />
                                            <asp:Parameter Name="Original_PayModeID" Type="String" />
                                        </UpdateParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="PayModeID" Type="String" />
                                            <asp:Parameter Name="PayMode" Type="String" />
                                        </InsertParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Credit Days
                                </td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="TextBox" />
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                        ControlToValidate="TextBox1" Display="None" 
                                        ErrorMessage="Must be integer input" Operator="DataTypeCheck" Type="Integer">Must be integer input</asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator1_ValidatorCalloutExtender" 
                                        runat="server" Enabled="True" TargetControlID="CompareValidator1">
                                    </asp:ValidatorCalloutExtender>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Contact Type</td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlContactType" runat="server" CssClass="TextBox" DataSourceID="dsContactType"
                                        DataTextField="ContactType" DataValueField="ContactTypeID" 
                                        AppendDataBoundItems="True">
                                        <asp:ListItem Selected="True" Value="">all </asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsContactType" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" 
                                        TypeName="TourOperTableAdapters.ContactTypeTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                    <td class="GridRowClear">
                                        State
                                    </td>
                                    <td class="GridRowClear">
                                        <asp:DropDownList ID="ddlState" runat="server" 
                                            CssClass="TextBox" DataTextField="ContractState" 
                                            DataValueField="ContractStateID">
                                            <asp:ListItem Selected="True" Value="">all states</asp:ListItem>
                                            <asp:ListItem Value="True">Active</asp:ListItem>
                                            <asp:ListItem Value="False">Inactive</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            <tr>
                                <td class="ComandRow2T">
                                </td>
                                <td class="ComandRow2T" style="padding-right: 5px">
                                    <asp:CheckBox ID="cbExcel" runat="server" Text="export to Excel" style="margin-right: 15px;" />
                                    &nbsp;<asp:Button ID="btnRecap" runat="server" SkinID="skBtnBase" Text="Recap" />
                                    &nbsp;<asp:Button ID="Button5" runat="server" SkinID="skBtnBase" Text="Report" />
                                    &nbsp;<asp:Button ID="Button2" runat="server" SkinID="skBtnClear" />
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
        TypeName="CntReportsTableAdapters.FilterTOContactTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
            <asp:ControlParameter ControlID="fltName" Name="TourOp" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="ddlMarkets" Name="MarketID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlPay" Name="PayCondID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlPaymode" Name="PayModeId" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="TextBox1" Name="CreditDays" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="ddlContactType" Name="ContactTypeId" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="fltCity" Name="City" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="fltCountry" Name="Country" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="ddlState" Name="ActiveOnly" PropertyName="SelectedValue" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsPlain" runat="server" OldValuesParameterFormatString="original_{0}"
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
    </asp:ObjectDataSource>
    </asp:Content>
