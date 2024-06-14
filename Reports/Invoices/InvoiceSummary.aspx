<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="InvoiceSummary.aspx.vb" Inherits="Reports_Invoices_InvoiceSummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Summary Invoices
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
                                <td class="GridRow1B" colspan="2">
                                    Hotel
                                    <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                </td>
                                <td class="GridRow1B" colspan="3">
                                    <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" DataSourceID="dsHotel"
                                        DataTextField="Hotel" DataValueField="HotelID">
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                    </asp:DropDownList>                                        
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" colspan="2">
                                    Tour Operator
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
                                <td class="GridRow1B" colspan="2">
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
                                <td class="GridRow1B" colspan="2">
                                    Check In From
                                </td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="fltStart" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wmfltStart" runat="server" TargetControlID="fltStart"
                                        WatermarkCssClass="WaterMark" WatermarkText="Check In date equals or later than ..." />
                                    <asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="fltStart"
                                        Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator7_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator7">
                                    </asp:ValidatorCalloutExtender>
                                    <asp:CalendarExtender ID="fltStart_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="fltStart" CssClass="cal_Theme1">
                                    </asp:CalendarExtender>
                                </td>
                                <td class="GridRow1B" style="width: 100px; padding-left: 5px;">
                                    Check In To&nbsp;
                                </td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="fltFinish" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wmfltFinish" runat="server" TargetControlID="fltFinish"
                                        WatermarkCssClass="WaterMark" WatermarkText="Check in date equals or before than..." />
                                    <asp:CompareValidator ID="CompareValidator8" runat="server" ControlToValidate="fltFinish"
                                        Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator8_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator8">
                                    </asp:ValidatorCalloutExtender>
                                    <asp:CalendarExtender ID="fltFinish_CalendarExtender" runat="server" CssClass="cal_Theme1"
                                        Enabled="True" TargetControlID="fltFinish">
                                    </asp:CalendarExtender>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" colspan="2">
                                    InvNumFrom
                                </td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="fltInvFrom" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wmfltBookingCode" runat="server" TargetControlID="fltInvFrom"
                                        WatermarkCssClass="WaterMark" WatermarkText="Invoice Number equals or greater than" />
                                </td>
                                <td class="GridRow1B" style="width: 100px; padding-left: 5px;">
                                    &nbsp;InvNumTo
                                </td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="fltInvTo0" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="fltInvTo0_TextBoxWatermarkExtender" runat="server"
                                        TargetControlID="fltInvTo0" WatermarkCssClass="WaterMark" WatermarkText="Invoice Number equals or less than" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" colspan="2">
                                    Inv Date From
                                </td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="fltInvDateFrom" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="fltInvDateFrom_TextBoxWatermarkExtender" runat="server"
                                        TargetControlID="fltInvDateFrom" WatermarkCssClass="WaterMark" WatermarkText="Inv date equals or later than" />
                                    <asp:CalendarExtender ID="fltInvDateFrom_CalendarExtender" runat="server" CssClass="cal_Theme1"
                                        Enabled="True" TargetControlID="fltInvDateFrom">
                                    </asp:CalendarExtender>
                                </td>
                                <td class="GridRow1B" style="width: 100px; padding-left: 5px;">
                                    Inv Date To
                                </td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="fltInvDateTo" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="fltInvDateTo_TextBoxWatermarkExtender" runat="server"
                                        TargetControlID="fltInvDateTo" WatermarkCssClass="WaterMark" WatermarkText="Inv date equals or before than" />
                                    <asp:CalendarExtender ID="fltInvDateTo_CalendarExtender" runat="server" CssClass="cal_Theme1"
                                        Enabled="True" TargetControlID="fltInvDateTo">
                                    </asp:CalendarExtender>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear" colspan="2">
                                    State
                                </td>
                                <td class="GridRowClear" colspan="3">
                                    <asp:DropDownList ID="ddlState" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsInvState" DataTextField="InvoiceState" DataValueField="InvoiceStateID">
                                        <asp:ListItem Selected="True" Value="">all states</asp:ListItem>
                                        <asp:ListItem Value="100">Modified and Reviewed</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsInvState" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="dsInvoicesTableAdapters.InvoiceStateTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="ComandRow2T" style="height: 30px; padding-top: 5px; width: 101px;">
                                    <asp:DropDownList ID="ddlInv" runat="server" CssClass="TextBox">
                                        <asp:ListItem Value="INV">Invoice</asp:ListItem>
                                        <asp:ListItem Value="PRO">Proforma</asp:ListItem>
                                    </asp:DropDownList>
                                    <br />
                                    <asp:CheckBox ID="cbCancel" runat="server" Text="Include cancel" TextAlign="Left"
                                        Visible="False" />
                                </td>
                                <td class="ComandRow2T" colspan="4" style="height: 30px; padding-top: 5px">
                                    &nbsp;<asp:CheckBox ID="cbHotel" runat="server" Text="Hotel" TextAlign="Left" />
                                    &nbsp;&nbsp;<asp:CheckBox ID="cbExcel" runat="server" Style="padding-right: 5px;
                                        width: 370px" Text="export to Excel" TextAlign="Left" />
                                    &nbsp;<asp:Button ID="Button3" runat="server" SkinID="skBtnBase" Text="ReportOld"
                                        Visible="False" />
                                    &nbsp;<asp:Button ID="Button4" runat="server" SkinID="skBtnBase" Text="Report" />
                                    &nbsp;<asp:Button ID="Button1" runat="server" SkinID="skBtnFilter" Visible="False" />
                                    &nbsp;
                                    <asp:Button ID="Button2" runat="server" SkinID="skBtnClear" />
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
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
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
                                <asp:Label ID="lbHotels" runat="server" SkinID="skGridLabel" Text="Invoices"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="GridBorder">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="InvoiceID"
                                    DataSourceID="dsFilteredInvoices" SkinID="skGridView" AllowPaging="False">
                                    <Columns>
                                        <asp:TemplateField ShowHeader="False" Visible="False">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Details"
                                                    CommandArgument='<%# Eval("InvoiceID") %>' ImageUrl="~/Images/Leads.gif" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="InvoiceID" HeaderText="InvID" ReadOnly="True" SortExpression="InvoiceID">
                                            <ItemStyle Width="30px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="InvNumber" HeaderText="InvNum" SortExpression="InvNumber">
                                            <ItemStyle Width="30px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="InvOrder" HeaderText="InvOrder" SortExpression="InvOrder"
                                            Visible="False" />
                                        <asp:BoundField DataField="InvDate" DataFormatString="{0:d}" HeaderText="InvDate"
                                            HtmlEncode="False" SortExpression="InvDate">
                                            <ItemStyle Width="75px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="InvDoc" HeaderText="InvDoc" SortExpression="InvDoc" Visible="False" />
                                        <asp:BoundField DataField="ResGroup" HeaderText="ResGroup" SortExpression="ResGroup"
                                            Visible="False" />
                                        <asp:BoundField DataField="Hotel" HeaderText="Hotel" SortExpression="Hotel">
                                            <ItemStyle Width="200px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="HotelId" HeaderText="HotelId" SortExpression="HotelId"
                                            Visible="False" />
                                        <asp:BoundField DataField="TourOp" HeaderText="TourOp" SortExpression="TourOp">
                                            <ItemStyle Width="200px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="TourOpId" HeaderText="TourOpId" SortExpression="TourOpId"
                                            Visible="False" />
                                        <asp:BoundField DataField="CheckIn" DataFormatString="{0:d}" HeaderText="CheckIn"
                                            HtmlEncode="False" SortExpression="CheckIn">
                                            <ItemStyle Width="75px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="CheckOut" DataFormatString="{0:d}" HeaderText="CheckOut"
                                            HtmlEncode="False" SortExpression="CheckOut">
                                            <ItemStyle Width="75px" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="Nights" SortExpression="Nights">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# iif(Eval("CheckOut") is DBNULL.Value,0,Eval("CheckOut")) - iif(Eval("CheckIn") is DBNULL.Value,0,Eval("CheckIn")) %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("CheckOut") %>'></asp:Label>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" Visible="False" />
                                        <asp:BoundField DataField="HAmount" HeaderText="HAmount" SortExpression="HAmount"
                                            Visible="False" />
                                        <asp:BoundField DataField="ITBIS" HeaderText="ITBIS" SortExpression="ITBIS" Visible="False" />
                                        <asp:BoundField DataField="InvRefText" HeaderText="InvRefText" SortExpression="InvRefText" />
                                        <asp:BoundField DataField="InvPrnText" HeaderText="InvPrnText" SortExpression="InvPrnText"
                                            Visible="False" />
                                        <asp:BoundField DataField="InvComment" HeaderText="InvComment" SortExpression="InvComment"
                                            Visible="False" />
                                        <asp:TemplateField HeaderText="State" SortExpression="State" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("State") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                    </asp:Panel>
                </table>
                <asp:ObjectDataSource ID="dsFilteredInvoices" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="ReportsInvoiceTableAdapters.Invoice_Print_GroupHeaderTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="ddlTO" Name="TourOpId" PropertyName="SelectedValue"
                            Type="Int32" DefaultValue="" />
                        <asp:ControlParameter ControlID="cbHotel" Name="HRate" PropertyName="Checked" Type="Boolean" />
                        <asp:ControlParameter ControlID="fltInvFrom" Name="InvNumFrom" PropertyName="Text"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="fltInvTo0" Name="InvNumTo" PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="fltStart" Name="ChkInFrom" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="fltFinish" Name="ChkInTo" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="fltInvDateFrom" Name="InvDateFrom" PropertyName="Text"
                            Type="DateTime" />
                        <asp:ControlParameter ControlID="fltInvDateTo" Name="InvDateTo" PropertyName="Text"
                            Type="DateTime" />
                        <asp:ControlParameter ControlID="ddlInv" DefaultValue="INV" Name="InvDoc" PropertyName="SelectedValue"
                            Type="String" />
                        <asp:ControlParameter ControlID="ddlInvType" Name="InvType" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="ddlState" Name="State" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="cbCancel" Name="IncludeCancel" PropertyName="Checked"
                            Type="Boolean" />
                        <asp:Parameter Name="CCIReview" Type="Boolean" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsInvoiceReport" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="ReportsInvoiceTableAdapters.Invoice_Print_GroupTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlHotel" Name="HotelID" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="ddlTO" Name="TourOpId" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="cbHotel" Name="HRate" PropertyName="Checked" Type="Boolean" />
                        <asp:ControlParameter ControlID="fltInvFrom" Name="InvNumFrom" PropertyName="Text"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="fltInvTo0" Name="InvNumTo" PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="fltStart" Name="ChkInFrom" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="fltFinish" Name="ChkInTo" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="fltInvDateFrom" Name="InvDateFrom" PropertyName="Text"
                            Type="DateTime" />
                        <asp:ControlParameter ControlID="fltInvDateTo" Name="InvDateTo" PropertyName="Text"
                            Type="DateTime" />
                        <asp:ControlParameter ControlID="ddlInv" DefaultValue="INV" Name="InvDoc" PropertyName="SelectedValue"
                            Type="String" />
                        <asp:ControlParameter ControlID="ddlInvType" DefaultValue="" Name="InvType" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="ddlState" Name="State" PropertyName="SelectedValue"
                            Type="Int32" />
                        <asp:ControlParameter ControlID="cbCancel" Name="IncludeCancel" PropertyName="Checked"
                            Type="Boolean" />
                        <asp:Parameter Name="CCIReview" Type="Boolean" />
                        <asp:Parameter Name="MarketId" Type="String" />
                        <asp:Parameter Name="PayCondId" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
