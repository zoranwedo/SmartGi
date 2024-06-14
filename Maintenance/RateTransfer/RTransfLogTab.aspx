<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/RateTransfer/masterRtTransf.master" AutoEventWireup="false" CodeFile="RTransfLogTab.aspx.vb" Inherits="Maintenance_RateTransfer_RTransfLogTab" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Rate Export Log
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ProFormaContent" Runat="Server">
    <div class="Green">
        <%--<asp:Panel ID="pnSearch" runat="server" CssClass="popupPanel" DefaultButton="btnSerch">--%>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG" style="width: 600px;">
                    <asp:Label ID="lblFilter" runat="server" SkinID="skGridLabel">Search/Filter &nbsp; <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />
                        &nbsp; </asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px;">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="GridRow1B" style="width: 100px; text-align: left; font-weight: bold;">
                                Hotel:
                            </td>
                            <td class="GridRow1B" style="width: 400px; text-align: left;">
                                <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" DataSourceID="dsHotel"
                                    DataTextField="HotelEHID" DataValueField="HotelEHID">
                                </asp:DropDownList>
                            </td>
                            <td class="GridRow2B" style="width: 100px; text-align: right; vertical-align: bottom;"
                                rowspan="2">
                                <asp:Button ID="btnSerch" runat="server" SkinID="skBtnFilter" Style="margin-bottom: 5px;" />
                            </td>
                        </tr>
                        <tr>
                            <td class="GridRow2B" style="width: 100px; text-align: left; font-weight: bold;">
                                Exported on:
                            </td>
                            <td class="GridRow2B" style="width: 400px; text-align: left;">
                                <asp:TextBox ID="txtDate" runat="server" CssClass="TextBox" />
                                <asp:CalendarExtender ID="extDate" runat="server" TargetControlID="txtDate" />
                                <asp:CompareValidator ID="valDate" runat="server" ErrorMessage="Date input required!"
                                    ControlToValidate="txtDate" Display="None" Operator="DataTypeCheck" Type="Date" />
                                <asp:ValidatorCalloutExtender ID="calDate" runat="server" TargetControlID="valDate" />
                            </td>
                        </tr>
                    </table>
                    <asp:CheckBox ID="cbOnlyError" runat="server" Text="Show only errors" Checked="true" />
                </td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="dsHotel" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="dsRateTransferTableAdapters.smartHotelTableAdapter">
        </asp:ObjectDataSource>
    </div>
    <br />
    <div class="Blue">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:TabContainer ID="TabContainer1" runat="server">
                    <asp:TabPanel runat="server" HeaderText="Rows A" CssClass="GridBorder">
                    <ContentTemplate>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="GridLabelBG">
                            <asp:Label ID="lblInSection" runat="server" Text="Rate Export Response" SkinID="skGridLabel" />
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder" >
                            <asp:GridView ID="gvPMS_A" runat="server" SkinID="skGridView" CellSpacing="2" AutoGenerateColumns="False"
                                DataKeyNames="F00" DataSourceID="dsPMS_A">
                                <RowStyle CssClass="GridRow1TB" />
                                <Columns>
                                    <asp:BoundField DataField="ExpDate" DataFormatString="{0:d}" HeaderText="ExpDate"
                                        SortExpression="ExpDate" />
                                    <asp:BoundField DataField="F01" HeaderText="Rec." SortExpression="F01" />
                                    <asp:BoundField DataField="F02" HeaderText="Mov." SortExpression="F02" />
                                    <asp:BoundField DataField="ResponseID" HeaderText="R" ReadOnly="True" ShowHeader="False"
                                        SortExpression="ResponseID" />
                                    <asp:BoundField DataField="Response" HeaderText="Resp." SortExpression="Response" />
                                    <asp:BoundField DataField="F00" HeaderText="F00" InsertVisible="False" ReadOnly="True"
                                        SortExpression="F00" Visible="False" />
                                    <asp:BoundField DataField="F03" HeaderText="F03" SortExpression="F03" />
                                    <asp:BoundField DataField="F04" HeaderText="F04" SortExpression="F04" />
                                    <asp:BoundField DataField="F05" HeaderText="F05" SortExpression="F05" />
                                    <asp:BoundField DataField="F06" HeaderText="F06" SortExpression="F06" />
                                    <asp:BoundField DataField="F07" HeaderText="F07" SortExpression="F07" />
                                    <asp:BoundField DataField="F08" HeaderText="F08" SortExpression="F08" />
                                    <asp:BoundField DataField="F09" HeaderText="F09" SortExpression="F09" />
                                    <asp:BoundField DataField="F10" HeaderText="F10" SortExpression="F10" />
                                    <asp:BoundField DataField="F11" HeaderText="F11" SortExpression="F11" />
                                    <asp:BoundField DataField="F12" HeaderText="F12" SortExpression="F12" />
                                    <asp:BoundField DataField="F13" HeaderText="F13" SortExpression="F13" DataFormatString="{0:d}" />
                                    <asp:BoundField DataField="F14" HeaderText="F14" SortExpression="F14" DataFormatString="{0:d}" />
                                    <asp:BoundField DataField="F15" HeaderText="F15" SortExpression="F15" />
                                    <asp:BoundField DataField="F16" HeaderText="F16" SortExpression="F16" />
                                    <asp:BoundField DataField="F17" HeaderText="F17" SortExpression="F17" />
                                    <asp:BoundField DataField="F18" HeaderText="F18" SortExpression="F18" />
                                    <asp:BoundField DataField="F19" HeaderText="F19" SortExpression="F19" />
                                    <asp:BoundField DataField="F20" HeaderText="F20" SortExpression="F20" />
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
                        <asp:ObjectDataSource ID="dsPMS_A" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="dsRateTransferTableAdapters.smart_PMS_ATableAdapter">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlHotel" Name="HotelEHID" PropertyName="SelectedValue"
                                    Type="String" />
                                <asp:ControlParameter ControlID="txtDate" Name="ExpDate" PropertyName="Text" Type="DateTime" />
                                <asp:ControlParameter ControlID="cbOnlyError" Name="_Error" PropertyName="Checked"
                                    Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="Rows B" CssClass="GridBorder">
                    <ContentTemplate>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="GridLabelBG">
                            <asp:Label ID="Label1" runat="server" Text="Rate Export Response" SkinID="skGridLabel" />
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder">
                            <asp:GridView ID="gvPMS_B" runat="server" SkinID="skGridView" AutoGenerateColumns="False"
                                DataKeyNames="F00" DataSourceID="dsPMS_B" CellSpacing="2">
                                <RowStyle CssClass="GridRow1TB" />
                                <Columns>
                                    <asp:BoundField DataField="ExpDate" DataFormatString="{0:d}" HeaderText="ExpDate"
                                        SortExpression="ExpDate" />
                                    <asp:BoundField DataField="F01" HeaderText="Rec." SortExpression="F01" />
                                    <asp:BoundField DataField="F02" HeaderText="Mov." SortExpression="F02" />
                                    <asp:BoundField DataField="ResponseID" HeaderText="R" ReadOnly="True" ShowHeader="False"
                                        SortExpression="ResponseID" />
                                    <asp:BoundField DataField="Response" HeaderText="Resp." SortExpression="Response" />
                                    <asp:BoundField DataField="F00" HeaderText="F00" InsertVisible="False" ReadOnly="True"
                                        SortExpression="F00" Visible="False" />
                                    <asp:BoundField DataField="F03" HeaderText="F03" SortExpression="F03" />
                                    <asp:BoundField DataField="F04" HeaderText="F04" SortExpression="F04" />
                                    <asp:BoundField DataField="F05" HeaderText="F05" SortExpression="F05" />
                                    <asp:BoundField DataField="F06" HeaderText="F06" SortExpression="F06" />
                                    <asp:BoundField DataField="F07" HeaderText="F07" SortExpression="F07" DataFormatString="{0:d}" />
                                    <asp:BoundField DataField="F08" HeaderText="F08" SortExpression="F08" DataFormatString="{0:d}" />
                                    <asp:BoundField DataField="F09" HeaderText="F09" SortExpression="F09" />
                                    <asp:BoundField DataField="F10" HeaderText="F10" SortExpression="F10" />
                                    <asp:BoundField DataField="F11" HeaderText="F11" SortExpression="F11" />
                                    <asp:BoundField DataField="F12" HeaderText="F12" SortExpression="F12" />
                                    <asp:BoundField DataField="F13" HeaderText="F13" SortExpression="F13" />
                                    <asp:BoundField DataField="F14" HeaderText="F14" SortExpression="F14" />
                                    <asp:BoundField DataField="F15" HeaderText="F15" SortExpression="F15" />
                                    <asp:BoundField DataField="F16" HeaderText="F16" SortExpression="F16" />
                                    <asp:BoundField DataField="F17" HeaderText="F17" SortExpression="F17" />
                                    <asp:BoundField DataField="F18" HeaderText="F18" SortExpression="F18" />
                                    <asp:BoundField DataField="F19" HeaderText="F19" SortExpression="F19" />
                                    <asp:BoundField DataField="F20" HeaderText="F20" SortExpression="F20" />
                                    <asp:BoundField DataField="F21" HeaderText="F21" SortExpression="F21" />
                                    <asp:BoundField DataField="F22" HeaderText="F22" SortExpression="F22" />
                                    <asp:BoundField DataField="F23" HeaderText="F23" SortExpression="F23" />
                                    <asp:BoundField DataField="F24" HeaderText="F24" SortExpression="F24" />
                                    <asp:BoundField DataField="F25" HeaderText="F25" SortExpression="F25" />
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
                        <asp:ObjectDataSource ID="dsPMS_B" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="dsRateTransferTableAdapters.smart_PMS_BTableAdapter">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlHotel" Name="HotelEHID" PropertyName="SelectedValue"
                                    Type="String" />
                                <asp:ControlParameter ControlID="txtDate" Name="ExpDate" PropertyName="Text" Type="DateTime" />
                                <asp:ControlParameter ControlID="cbOnlyError" Name="_Error" PropertyName="Checked"
                                    Type="Boolean" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </ContentTemplate>
                    </asp:TabPanel>
                    <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="Rows C" CssClass="GridBorder">
                    <ContentTemplate>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="GridLabelBG" >
                            <asp:Label ID="Label2" runat="server" Text="Rate Export Response" SkinID="skGridLabel" />
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder" >
                            <asp:GridView ID="gvPMS_C" runat="server" SkinID="skGridView" AutoGenerateColumns="False"
                                DataKeyNames="F00" DataSourceID="dsPMS_C" CellSpacing="2">
                                <RowStyle CssClass="GridRow1TB" />
                                <Columns>
                                    <asp:BoundField DataField="ExpDate" DataFormatString="{0:d}" HeaderText="ExpDate"
                                        SortExpression="ExpDate" />
                                    <asp:BoundField DataField="F01" HeaderText="Rec." SortExpression="F01" />
                                    <asp:BoundField DataField="F02" HeaderText="Mov." SortExpression="F02" />
                                    <asp:BoundField DataField="ResponseID" HeaderText="R" ReadOnly="True" ShowHeader="False"
                                        SortExpression="ResponseID" />
                                    <asp:BoundField DataField="Response" HeaderText="Resp." SortExpression="Response" />
                                    <asp:BoundField DataField="F00" HeaderText="F00" InsertVisible="False" ReadOnly="True"
                                        SortExpression="F00" Visible="False" />
                                    <asp:BoundField DataField="F03" HeaderText="F03" SortExpression="F03" />
                                    <asp:BoundField DataField="F04" HeaderText="F04" SortExpression="F04" />
                                    <asp:BoundField DataField="F05" HeaderText="F05" SortExpression="F05" />
                                    <asp:BoundField DataField="F06" HeaderText="F06" SortExpression="F06" />
                                    <asp:BoundField DataField="F07" HeaderText="F07" SortExpression="F07" />
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
                        <asp:ObjectDataSource ID="dsPMS_C" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="dsRateTransferTableAdapters.smart_PMS_CTableAdapter">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlHotel" Name="HotelEHID" PropertyName="SelectedValue"
                                    Type="String" />
                                <asp:ControlParameter ControlID="txtDate" Name="ExpDate" PropertyName="Text" Type="DateTime" />
                                <asp:ControlParameter ControlID="cbOnlyError" Name="_Error" PropertyName="Checked"
                                    Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </ContentTemplate>
                    </asp:TabPanel>
                </asp:TabContainer>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
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
                            <asp:Label ID="popMessage" runat="server" Text="Message"></asp:Label>
                        </p>
                        <p style="text-align: right;" class="GridRow1T">
                            <br />
                            <asp:Button ID="btnYes" runat="server" Text="OK" SkinID="skBtnBase" />&nbsp;
                        </p>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
</asp:Content>

