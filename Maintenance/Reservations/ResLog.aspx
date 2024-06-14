<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Reservations/masterRes.master"
    AutoEventWireup="false" CodeFile="ResLog.aspx.vb" Inherits="Maintenance_Reservations_ResLog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Imported Files
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ResContent" runat="Server">
    <%--<asp:UpdatePanel runat="server" ID="updPanel">
        <ContentTemplate>--%>
    <asp:HiddenField ID="dummy" runat="server" />
    <div class="Green">
        <br />
        <asp:CollapsiblePanelExtender ID="cpeSearch" runat="server" TargetControlID="pnSearch"
            CollapseControlID="lblFilter" ExpandControlID="lblFilter" ImageControlID="imgExpander"
            CollapsedImage="~/Images/expand_.png" ExpandedImage="~/Images/collapse_.png"
            Collapsed="False">
        </asp:CollapsiblePanelExtender>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <asp:Panel ID="pnSearchHead" runat="server">
                    <td class="GridLabelBG" style="width: 600px;">
                        <asp:Label ID="lblFilter" runat="server" SkinID="skGridLabel">Search/Filter &nbsp;
                            <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />
                            &nbsp; </asp:Label>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px;">
                    <asp:Panel ID="pnSearch" runat="server" CssClass="popupPanel" DefaultButton="btnSerch">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="GridRow2B" style="width: 100px; text-align: left; font-weight: bold;">
                                    Show Log on:
                                </td>
                                <td class="GridRow2B" style="width: 400px; text-align: left;">
                                    <asp:TextBox ID="txtDate" runat="server" CssClass="TextBox" />
                                    <asp:CalendarExtender ID="extDate" runat="server" TargetControlID="txtDate" />
                                    <asp:CompareValidator ID="valDate" runat="server" ErrorMessage="Date input required!"
                                        ControlToValidate="txtDate" Display="None" Operator="DataTypeCheck" Type="Date" />
                                    <asp:ValidatorCalloutExtender ID="calDate" runat="server" TargetControlID="valDate" />
                                </td>
                                <td class="GridRow2B" style="width: 100px; text-align: right; padding-top: 5px; height: 30px;">
                                    <asp:Button ID="btnSerch" runat="server" SkinID="skBtnFilter" Style="margin-bottom: 5px;" />
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
        <br />
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblCtrTitle" runat="server" Text="Import Log" SkinID="skGridLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 730px;" >
                    <asp:GridView ID="gvDTSLog" runat="server" AutoGenerateColumns="False" DataSourceID="dsImportLog"
                        SkinID="skGridView" EnableModelValidation="True">
                        <Columns>
                            <asp:BoundField DataField="hotel" HeaderText="Hotel (mapping)" 
                                SortExpression="hotel">
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="date_txt" DataFormatString="{0:d}" HeaderText="Booking File Date"
                                SortExpression="date_txt">
                                <ItemStyle Width="90px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="date_run" HeaderText="Last Import Date" SortExpression="date_run">
                                <ItemStyle Width="150px" />
                            </asp:BoundField>
                            <asp:CheckBoxField DataField="success" HeaderText="Imported" SortExpression="success">
                                <ItemStyle HorizontalAlign="Center" Width="60px" />
                            </asp:CheckBoxField>
                            <asp:CheckBoxField DataField="cancel" HeaderText="Cancelled" 
                                SortExpression="cancel">
                                <ItemStyle HorizontalAlign="Center" Width="60px" />
                            </asp:CheckBoxField>
                            <asp:BoundField DataField="filename" HeaderText="Import File" SortExpression="filename">
                                <ItemStyle Width="350px" />
                            </asp:BoundField>
                        </Columns>
                        <EmptyDataTemplate>
                            No reservation imports on selected date.
                        </EmptyDataTemplate>
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="dsImportLog" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataByDate" TypeName="dsDTSTableAdapters.dtsImportTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtDate" DefaultValue="" Name="date_run" PropertyName="Text"
                    Type="DateTime" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <br />
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
