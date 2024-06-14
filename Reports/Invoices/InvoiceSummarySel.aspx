<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="InvoiceSummarySel.aspx.vb" Inherits="Reports_Invoices_InvoiceSummarySel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Summary Invoices with selection
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
                            <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />
                            &nbsp; </asp:Label>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px">
                    <asp:Panel ID="pnSearch" runat="server" Style="width: 600px" DefaultButton="Button1">
                        <table cellpadding="0" cellspacing="0">
                            <tr style="width: 600px;">
                                <td class="GridRow1B" style="width: 120px">
                                    Hotel
                                </td>
                                <td class="GridRow1B" style="width: 480px" colspan="3">
                                    <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" DataSourceID="dsHotel"
                                        DataTextField="Hotel" DataValueField="HotelID">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Tour&nbsp;Operator
                                </td>
                                <td class="GridRow1B" colspan="3">
                                    <asp:DropDownList ID="ddlTO" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsTOAll" DataTextField="TourOp" DataValueField="TourOpID">
                                        <asp:ListItem Selected="True" Value="">all </asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsTOAll" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetDataByUser" TypeName="TourOperTableAdapters.TourOpTableAdapter">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="hfUsername" Name="User" PropertyName="Value" Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Inv Type
                                </td>
                                <td class="GridRow1B" colspan="3">
                                    <asp:DropDownList ID="ddlInvType" runat="server" AppendDataBoundItems="True" CssClass="TextBox">
                                        <asp:ListItem Selected="True" Value="">all </asp:ListItem>
                                        <asp:ListItem Value="0">Stay</asp:ListItem>
                                        <asp:ListItem Value="1">Group</asp:ListItem>
                                        <asp:ListItem Value="2">Cancel</asp:ListItem>
                                        <asp:ListItem Value="3">No-Show</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Check In From
                                </td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="fltStart" runat="server" CssClass="TextBox" Width="185px" />
                                    <asp:TextBoxWatermarkExtender ID="wmfltStart" runat="server" TargetControlID="fltStart"
                                        WatermarkCssClass="WaterMark" WatermarkText="Check In date equals or later than ..." />
                                    <asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="fltStart"
                                        Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date" />
                                    <asp:ValidatorCalloutExtender ID="CompareValidator7_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator7" />
                                    <asp:CalendarExtender ID="fltStart_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="fltStart" CssClass="cal_Theme1" />
                                </td>
                                <td class="GridRow1B" style="width: 80px; padding-left: 40px;">
                                    Check In To
                                </td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="fltFinish" runat="server" CssClass="TextBox" Width="185px" />
                                    <asp:TextBoxWatermarkExtender ID="wmfltFinish" runat="server" TargetControlID="fltFinish"
                                        WatermarkCssClass="WaterMark" WatermarkText="Check in date equals or before than..." />
                                    <asp:CompareValidator ID="CompareValidator8" runat="server" ControlToValidate="fltFinish"
                                        Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date" />
                                    <asp:ValidatorCalloutExtender ID="CompareValidator8_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator8" />
                                    <asp:CalendarExtender ID="fltFinish_CalendarExtender" runat="server" CssClass="cal_Theme1"
                                        Enabled="True" TargetControlID="fltFinish" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Num From
                                </td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="fltInvFrom" runat="server" CssClass="TextBox" Width="185px" />
                                    <asp:TextBoxWatermarkExtender ID="wmfltBookingCode" runat="server" TargetControlID="fltInvFrom"
                                        WatermarkCssClass="WaterMark" WatermarkText="Invoice Number equals or greater than" />
                                </td>
                                <td class="GridRow1B" style="padding-left: 40px;">
                                    Num To
                                </td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="fltInvTo0" runat="server" CssClass="TextBox" Width="185px" />
                                    <asp:TextBoxWatermarkExtender ID="fltInvTo0_TextBoxWatermarkExtender" runat="server"
                                        TargetControlID="fltInvTo0" WatermarkCssClass="WaterMark" WatermarkText="Invoice Number equals or less than" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Date From
                                </td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="fltInvDateFrom" runat="server" CssClass="TextBox" Width="185px" />
                                    <asp:TextBoxWatermarkExtender ID="fltInvDateFrom_TextBoxWatermarkExtender" runat="server"
                                        TargetControlID="fltInvDateFrom" WatermarkCssClass="WaterMark" WatermarkText="Inv date equals or later than" />
                                    <asp:CalendarExtender ID="fltInvDateFrom_CalendarExtender" runat="server" CssClass="cal_Theme1"
                                        Enabled="True" TargetControlID="fltInvDateFrom">
                                    </asp:CalendarExtender>
                                </td>
                                <td class="GridRow1B" style="padding-left: 40px;">
                                    Date To
                                </td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="fltInvDateTo" runat="server" CssClass="TextBox" Width="185px" />
                                    <asp:TextBoxWatermarkExtender ID="fltInvDateTo_TextBoxWatermarkExtender" runat="server"
                                        TargetControlID="fltInvDateTo" WatermarkCssClass="WaterMark" WatermarkText="Inv date equals or before than" />
                                    <asp:CalendarExtender ID="fltInvDateTo_CalendarExtender" runat="server" CssClass="cal_Theme1"
                                        Enabled="True" TargetControlID="fltInvDateTo">
                                    </asp:CalendarExtender>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear">
                                    State
                                </td>
                                <td class="GridRowClear">
                                    <asp:DropDownList ID="ddlState" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsInvState" DataTextField="InvoiceState" DataValueField="InvoiceStateID">
                                        <asp:ListItem Selected="True" Value="">all states</asp:ListItem>
                                        <asp:ListItem Value="100">Modified and Reviewed</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsInvState" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="dsInvoicesTableAdapters.InvoiceStateTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                                <td class="GridRowClear" style="padding-left: 40px;">
                                    Document
                                </td>
                                <td class="GridRowClear">
                                    <asp:DropDownList ID="ddlInv" runat="server" CssClass="TextBox">
                                        <asp:ListItem Value="INV">Invoice</asp:ListItem>
                                        <asp:ListItem Value="PRO">Proforma</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="ComandRow2T" style="vertical-align: bottom; padding-bottom: 5px; text-align: left;" >
                                    <%--<div style="text-align: left;">--%>
                                        <asp:CheckBox ID="cbHotel" runat="server" Text="Hotel" TextAlign="Right" />
                                    <%--</div>--%>
                                </td>
                                <td class="ComandRow2T" style="vertical-align: bottom; padding-bottom: 5px; text-align: left;" >
                                    <asp:CheckBox ID="cbCancel" runat="server" Text="Include cancel" TextAlign="Right" />
                                </td>
                                <td class="ComandRow2T" style="vertical-align: bottom; padding-bottom: 5px; text-align: right;" >
                                    <%--<div style="text-align: right;">--%>
                                        <asp:CheckBox ID="cbExcel" runat="server" Text="export to Excel" TextAlign="Left" />
                                    <%--</div>--%>
                                </td>
                                <td class="ComandRow2T" style="vertical-align: bottom; padding-bottom: 5px">
                                    <asp:Button ID="Button3" runat="server" SkinID="skBtnBase" Text="Report" Visible="False" />
                                    &nbsp;<asp:Button ID="Button1" runat="server" SkinID="skBtnFilter" Text="Filter" />
                                    &nbsp;<asp:Button ID="Button2" runat="server" SkinID="skBtnClear" />
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
        <asp:ObjectDataSource ID="dsHotel" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="dsInvoicesTableAdapters.HotelTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value"
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <table cellpadding="0" cellspacing="0">
            <asp:Panel runat="server" ID="pnlCnt" Visible="False" Width="700px">
                <tr>
                    <td class="GridLabelBG">
                        <<a name="Top"><asp:Label ID="lbHotels" runat="server" SkinID="skGridLabel" Text="Invoices"></asp:Label></a>
                    </td>
                    <td>
                        <a href="#Bottom">»</a>
                    </td>
                </tr>
                <tr>
                    <td class="GridBorder">
                        <asp:GridView ID="gvInvoicesSel" runat="server" AutoGenerateColumns="False" DataKeyNames="InvoiceID"
                            DataSourceID="dsSelectInvoice" SkinID="skGridView" ShowFooter="True">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("SelectInv") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="InvID" SortExpression="InvoiceID">
                                    <ItemTemplate>
                                        <asp:Label ID="lblInvID" runat="server" Text='<%# Bind("InvoiceID") %>' />
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:LinkButton ID="lnkSelectAll" runat="server" OnClick="lnkSelectAll_Click" SkinID="HomeButton">SelectAll</asp:LinkButton>
                                        <br />
                                        <asp:LinkButton ID="lnkDeselectAll" runat="server" OnClick="lnkDeselectAll_Click" SkinID="HomeButton">DeselectAll</asp:LinkButton>
                                    </FooterTemplate>
                                    <ItemStyle Width="80px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="InvNumber" HeaderText="InvNum" ReadOnly="True" SortExpression="InvNumber">
                                    <ItemStyle Width="70px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="InvDate" HeaderText="InvDate" SortExpression="InvDate" DataFormatString="{0:d}">
                                    <ItemStyle Width="75px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ResGroup" HeaderText="ResGroup" SortExpression="ResGroup" >
                                    <ItemStyle Width="120px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Hotel" HeaderText="Hotel" SortExpression="Hotel">
                                    <ItemStyle Width="350px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="TourOp" HeaderText="TourOp" SortExpression="TourOp">
                                    <ItemStyle Width="300px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CheckIn" HeaderText="CheckIn" SortExpression="CheckIn" DataFormatString="{0:d}" >
                                    <ItemStyle Width="75px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="CheckOut" HeaderText="CheckOut" SortExpression="CheckOut" DataFormatString="{0:d}" >
                                    <ItemStyle Width="75px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" Visible="False" />
                                <asp:TemplateField HeaderText="InvRefText" SortExpression="InvRefText" >
                                    <ItemTemplate>
                                        <asp:Label ID="Label22" runat="server" Text='<%# Bind("InvRefText") %>' />
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Button ID="lnkSelect" runat="server" SkinID="skBtnClear" OnClick="lnkSelect_Click" Text="Report" />
                                    </FooterTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField SortExpression="State" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text="" ForeColor="Red" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField SortExpression="StateDisp" Visible="False" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td height="25">
                        <a name="Bottom">
                            <asp:Button ID="btnReport2" runat="server" SkinID="skBtnBase" Text="Update" OnClick="lnkSelect_Click"
                                Visible="false" />
                        </a>
                    </td>
                    <td style="width: 25px;">
                        <a href="#Top">«</a>
                    </td>
                </tr>
            </asp:Panel>
        </table>
        <asp:ObjectDataSource ID="dsInvoiceReport" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="ReportsInvoiceTableAdapters.Invoice_Print_GroupSelTableAdapter"
            EnableCaching="True">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlHotel" Name="HotelID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlTO" Name="TourOpId" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="cbHotel" Name="HRate" PropertyName="Checked" Type="Boolean" />
                <asp:ControlParameter ControlID="fltInvFrom" Name="InvNumFrom" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="fltInvTo0" Name="InvNumTo" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="fltStart" Name="ChkInFrom" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="fltFinish" Name="ChkInTo" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="fltInvDateFrom" Name="InvDateFrom" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="fltInvDateTo" Name="InvDateTo" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="ddlInv" DefaultValue="INV" Name="InvDoc" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddlInvType" Name="InvType" PropertyName="SelectedValue" Type="Int32" DefaultValue="" />
                <asp:ControlParameter ControlID="ddlState" Name="State" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="cbCancel" Name="IncludeCancel" PropertyName="Checked" Type="Boolean" />
                <asp:Parameter Name="CCIReview" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsSelectInvoice" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="ReportsInvoiceTableAdapters.Invoice_Print_GroupHeaderSelTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlHotel" Name="HotelID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlTO" Name="TourOpId" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="cbHotel" Name="HRate" PropertyName="Checked" Type="Boolean" />
                <asp:ControlParameter ControlID="fltInvFrom" Name="InvNumFrom" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="fltInvTo0" Name="InvNumTo" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="fltStart" Name="ChkInFrom" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="fltFinish" Name="ChkInTo" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="fltInvDateFrom" Name="InvDateFrom" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="fltInvDateTo" Name="InvDateTo" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="ddlInv" DefaultValue="INV" Name="InvDoc" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddlInvType" DefaultValue="" Name="InvType" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlState" Name="State" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="cbCancel" Name="IncludeCancel" PropertyName="Checked" Type="Boolean" />
                <asp:Parameter Name="CCIReview" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
