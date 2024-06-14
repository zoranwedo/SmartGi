<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Reservations/masterRes.master"
    AutoEventWireup="false" CodeFile="ResHLog.aspx.vb" Inherits="Maintenance_Reservations_ResHLog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Invoicing Reservation Log
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ResContent" runat="Server">
    <%--<asp:UpdatePanel runat="server" ID="updPanel">
        <ContentTemplate>--%>
    <asp:HiddenField ID="dummy" runat="server" />
    <div class="Green">
        <br />
        <%--<asp:CollapsiblePanelExtender ID="cpeSearch" runat="server" TargetControlID="pnSearch"
            CollapseControlID="lblFilter" ExpandControlID="lblFilter" ImageControlID="imgExpander"
            CollapsedImage="~/Images/expand_.png" ExpandedImage="~/Images/collapse_.png"
            Collapsed="False">
        </asp:CollapsiblePanelExtender>--%>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <%--<asp:Panel ID="pnSearchHead" runat="server">--%>
                <td class="GridLabelBG" style="width: 600px;">
                    <asp:Label ID="lblFilter" runat="server" SkinID="skGridLabel">Search/Filter &nbsp;
                        <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />
                        &nbsp; </asp:Label>
                </td>
                <%--</asp:Panel>--%>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px;">
                    <%--<asp:Panel ID="pnSearch" runat="server" Style="width: 600px"  DefaultButton="btnSerch">--%>
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="GridRow1B" style="width: 100px; text-align: left; font-weight: bold;">
                                Hotel:
                            </td>
                            <td class="GridRow1B" style="width: 400px; text-align: left;">
                                <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" DataSourceID="dsHotel"
                                    DataTextField="HotelHID" DataValueField="HotelHID" AppendDataBoundItems="True">
                                    <asp:ListItem Selected="True" Value="">all hotels</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="GridRow1B" style="width: 100px;">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="GridRow1B">
                                Imported From
                            </td>
                            <td class="GridRow1B">
                                <asp:TextBox ID="fltStart" runat="server" CssClass="TextBox" />
                                <asp:TextBoxWatermarkExtender ID="wmfltStart" runat="server" TargetControlID="fltStart"
                                    WatermarkCssClass="WaterMark" WatermarkText="Importing date equals or later than" />
                                <asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="fltStart"
                                    Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date" />
                                <asp:ValidatorCalloutExtender ID="CompareValidator7_ValidatorCalloutExtender" runat="server"
                                    Enabled="True" TargetControlID="CompareValidator7" />
                                <asp:CalendarExtender ID="fltStart_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="fltStart" CssClass="cal_Theme1" />
                                <asp:CompareValidator ID="CompareValidator10" runat="server" ControlToValidate="fltStart"
                                    Display="None" ErrorMessage="This search can run from March 2013" Operator="GreaterThan"
                                    ValueToCompare="2013-02-28" Type="Date" />
                                <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" Enabled="True"
                                    TargetControlID="CompareValidator10" />
                            </td>
                            <td class="GridRow1B" style="width: 100px;">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="GridRow1B">
                                Imported To
                            </td>
                            <td class="GridRow1B">
                                <asp:TextBox ID="fltFinish" runat="server" CssClass="TextBox" />
                                <asp:TextBoxWatermarkExtender ID="wmfltFinish" runat="server" TargetControlID="fltFinish"
                                    WatermarkCssClass="WaterMark" WatermarkText="Importing date equals or before than" />
                                <asp:CompareValidator ID="CompareValidator8" runat="server" ControlToValidate="fltFinish"
                                    Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date" />
                                <asp:ValidatorCalloutExtender ID="CompareValidator8_ValidatorCalloutExtender" runat="server"
                                    Enabled="True" TargetControlID="CompareValidator8" />
                                <asp:CalendarExtender ID="fltFinish_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="fltFinish" CssClass="cal_Theme1" />
                            </td>
                            <td class="GridRow1B" style="width: 100px;">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="GridRowClear">
                                Messages
                            </td>
                            <td class="GridRowClear">
                                <asp:CheckBoxList ID="cblLogCodes" runat="server" DataSourceID="dsLogCodes" DataTextField="LogCodeGroupDesc"
                                    DataValueField="LogCodeGroup">
                                </asp:CheckBoxList>
                            </td>
                            <td class="GridRowClear" style="width: 100px;">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="ComandRow2T" style="height: 30px; padding-top: 5px">
                                &nbsp;
                            </td>
                            <td colspan="2" class="ComandRow2T" style="height: 30px; padding-top: 5px">
                                <asp:Button ID="btnSerch" runat="server" SkinID="skBtnFilter" Style="margin-bottom: 5px;" />
                            </td>
                        </tr>
                    </table>
                    <%--</asp:Panel>--%>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div class="Blue">
        <br />
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG" style="width: 1032px;">
                    <asp:Label ID="lblHTitle" runat="server" Text="Imported Checked In Reservations"
                        SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvLog" runat="server" AutoGenerateColumns="False" DataSourceID="dsLog"
                        SkinID="skGridView" DataKeyNames="LogID,LogCodeID" EnableModelValidation="True">
                        <Columns>
                            <asp:BoundField DataField="LogID" HeaderText="LogID" SortExpression="LogID" ReadOnly="True"
                                Visible="False"></asp:BoundField>
                            <asp:BoundField DataField="HotelHID" HeaderText="Hotel (maping)" SortExpression="HotelHID">
                                <ItemStyle Width="60px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FolioFull" HeaderText="Folio" SortExpression="FolioFull">
                                <ItemStyle Width="120px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ResID" HeaderText="ResID" SortExpression="ResID" Visible="False">
                            </asp:BoundField>
                            <asp:BoundField DataField="PreinvID" HeaderText="PreinvID" SortExpression="PreinvID"
                                Visible="False"></asp:BoundField>
                            <asp:BoundField DataField="InvoiceID" HeaderText="Invoice (ID)" SortExpression="InvoiceID">
                                <ItemStyle Width="60px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Folio" HeaderText="Folio" SortExpression="Folio" Visible="False">
                                <ItemStyle Width="120px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FolioOrd" HeaderText="FolioOrd" SortExpression="FolioOrd"
                                Visible="False"></asp:BoundField>
                            <asp:BoundField DataField="ResType" HeaderText="ResType" SortExpression="ResType"
                                Visible="False"></asp:BoundField>
                            <asp:BoundField DataField="Modified" HeaderText="Modified" SortExpression="Modified"
                                Visible="False"></asp:BoundField>
                            <asp:BoundField DataField="Procesed" HeaderText="Procesed" SortExpression="Processed"
                                DataFormatString="{0:G}">
                                <ItemStyle Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="LogCode" SortExpression="LogCode" Visible="False">
                                <ItemStyle Width="30px" Font-Italic="False" Font-Underline="False" ForeColor="Gray"
                                    HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Note" HeaderText="Log Message" SortExpression="Note">
                                <ItemStyle Width="700px" Wrap="True" />
                            </asp:BoundField>
                            <asp:BoundField DataField="LogCodeID" HeaderText="LogCodeID" SortExpression="LogCodeID"
                                Visible="False" ReadOnly="True" />
                            <asp:BoundField DataField="LogCodeGroup" HeaderText="LogCodeGroup" SortExpression="LogCodeGroup"
                                Visible="False" />
                            <asp:BoundField DataField="LogCodeGroupDesc" HeaderText="LogCodeGroupDesc" SortExpression="LogCodeGroupDesc"
                                Visible="False" />
                            <asp:BoundField DataField="LogCodeDesc" HeaderText="LogCodeDesc" SortExpression="LogCodeDesc"
                                Visible="False" />
                        </Columns>
                        <EmptyDataTemplate>
                            No filter specified or no import log entries on selected date.
                        </EmptyDataTemplate>
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="dsLogCodes" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="dsDTSTableAdapters.dtsImportLogCodeTableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsHotel" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="dsDTSTableAdapters.HotelTableAdapter"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsLog" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="dsDTSTableAdapters.FilterImportLogTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlHotel" Name="HotelHID" PropertyName="SelectedValue"
                    Type="String" />
                <asp:ControlParameter ControlID="fltStart" Name="ProcFrom" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="fltFinish" Name="ProcTo" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
            PopupDragHandleControlID="popLabel" CancelControlID="btnNo" DropShadow="True"
            BackgroundCssClass="modalBackground" TargetControlID="dummy" X="200" Y="200">
        </asp:ModalPopupExtender>
        <asp:Panel ID="popPanel" runat="server" Width="300px" BackColor="White" Style="display: none">
            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td class="GridLabelBG">
                        <asp:Label ID="popLabel" runat="server" Text="Delete Market" SkinID="skGridLabel"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="GridBorder">
                        <p style="text-align: center;">
                            <asp:Label ID="popMessage" runat="server" Text="Message"></asp:Label>
                        </p>
                        <p style="text-align: right;" class="GridRow2TB">
                            <br />
                            <asp:Button ID="btnYes" runat="server" Text="Yes" SkinID="skBtnBase" />&nbsp;
                            <asp:Button ID="btnNo" runat="server" Text="No" SkinID="skBtnBase" />&nbsp;
                        </p>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
    <%--</ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>
