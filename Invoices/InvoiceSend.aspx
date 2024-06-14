<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="InvoiceSend.aspx.vb" Inherits="Reports_Invoices_InvoiceSend" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Invoices For Sending
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
                            <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />&nbsp; 
                        </asp:Label>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px">
                    <asp:Panel ID="pnSearch" runat="server" Style="width: 600px" DefaultButton="Button1">
                        <table cellpadding="0" cellspacing="0">
                            <tr style="width: 600px;">
                                <td class="GridRow1B" style="width: 100px;">
                                    Hotel
                                    <%--<asp:Label ID="Label3" runat="server" ForeColor="Red" Text="*" />--%>
                                </td>
                                <td class="GridRow1B" colspan="3">
                                    <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" DataSourceID="dsHotel"
                                        DataTextField="Hotel" DataValueField="HotelID" AppendDataBoundItems="True">
                                        <asp:ListItem Selected="True" Value="">all hotels</asp:ListItem>
                                    </asp:DropDownList>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Tour Operator
                                </td>
                                <td class="GridRow1B" colspan="3">
                                    <asp:DropDownList ID="ddlTO" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsTOAll" DataTextField="TourOp" DataValueField="TourOpID">
                                        <asp:ListItem Selected="True" Value="">all </asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsTOAll" runat="server" 
                                        SelectMethod="GetDataByUser" 
                                        TypeName="TourOperTableAdapters.TourOpTableAdapter">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="hfUsername" Name="User" PropertyName="Value" Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Inv Type
                                </td>
                                <td class="GridRow1B" colspan="3">
                                    <asp:DropDownList ID="ddlInvType" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsTOAll" DataTextField="TourOp" DataValueField="TourOpID">
                                        <asp:ListItem Selected="True" Value="">all </asp:ListItem>
                                        <asp:ListItem Value="0">Stay</asp:ListItem>
                                        <asp:ListItem Value="1">Group</asp:ListItem>
                                        <asp:ListItem Value="2">Cancel</asp:ListItem>
                                        <asp:ListItem Value="3">No-Show</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 100px;">
                                    Chechk In From
                                </td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="fltStart" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wmfltStart" runat="server" TargetControlID="fltStart"
                                        WatermarkCssClass="WaterMark" WatermarkText="Check In date equal or greater than..." />
                                    <asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="fltStart"
                                        Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date" />
                                    <asp:ValidatorCalloutExtender ID="CompareValidator7_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator7" />
                                    <asp:CalendarExtender ID="fltStart_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="fltStart" CssClass="cal_Theme1" />
                                </td>
                                <td class="GridRow1B" style="width: 100px; padding-left: 15px;">
                                    Check In To
                                </td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="fltFinish" runat="server" CssClass="TextBox" />
                                    <asp:CompareValidator ID="CompareValidator8" runat="server" ControlToValidate="fltFinish"
                                        Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date" />
                                    <asp:ValidatorCalloutExtender ID="CompareValidator8_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator8" />
                                    <asp:TextBoxWatermarkExtender ID="wmfltFinish" runat="server" TargetControlID="fltFinish"
                                        WatermarkCssClass="WaterMark" WatermarkText="Check in date equal or less than..." />
                                    <asp:CalendarExtender ID="fltFinish_CalendarExtender" runat="server" CssClass="cal_Theme1"
                                        Enabled="True" TargetControlID="fltFinish" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 100px;">
                                    InvNumFrom
                                </td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="fltInvFrom" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wmfltBookingCode" runat="server" TargetControlID="fltInvFrom"
                                        WatermarkCssClass="WaterMark" WatermarkText="Invoice Number equal or greater than..." />
                                    <asp:CompareValidator ID="CompareValidator9" runat="server" ControlToValidate="fltInvFrom"
                                        Display="None" ErrorMessage="Only number input" Operator="DataTypeCheck" Type="Integer" />
                                    <asp:ValidatorCalloutExtender ID="CompareValidator9_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator9" />
                                </td>
                                <td class="GridRow1B" style="width: 100px; padding-left: 15px;">
                                    InvNumTo
                                </td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="fltInvTo0" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="fltInvTo0_TextBoxWatermarkExtender" runat="server"
                                        TargetControlID="fltInvTo0" WatermarkCssClass="WaterMark" WatermarkText="Invoice Number equal or less than..." />
                                    <asp:CompareValidator ID="CompareValidator11" runat="server" ControlToValidate="fltInvTo0"
                                        Display="None" ErrorMessage="Only number input" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator11_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator11">
                                    </asp:ValidatorCalloutExtender>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 100px;">
                                    Inv Date From
                                </td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="fltInvDateFrom" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="fltInvDateFrom_TextBoxWatermarkExtender" runat="server"
                                        TargetControlID="fltInvDateFrom" WatermarkCssClass="WaterMark" WatermarkText="Check In date equal or greater than..." />
                                    <asp:CalendarExtender ID="fltInvDateFrom_CalendarExtender" runat="server" CssClass="cal_Theme1"
                                        Enabled="True" TargetControlID="fltInvDateFrom" />
                                    <asp:CompareValidator ID="CompareValidator10" runat="server" ControlToValidate="fltInvTo0"
                                        Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date" />
                                    <asp:ValidatorCalloutExtender ID="CompareValidator10_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator10" />
                                </td>
                                <td class="GridRow1B" style="width: 100px; padding-left: 15px;">
                                    Inv Date To
                                </td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="fltInvDateTo" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="fltInvDateTo_TextBoxWatermarkExtender" runat="server"
                                        TargetControlID="fltInvDateTo" WatermarkCssClass="WaterMark" WatermarkText="Check In date equal or greater than..." />
                                    <asp:CalendarExtender ID="fltInvDateTo_CalendarExtender" runat="server" CssClass="cal_Theme1"
                                        Enabled="True" TargetControlID="fltInvDateTo" />
                                    <asp:CompareValidator ID="CompareValidator12" runat="server" ControlToValidate="fltInvDateTo"
                                        Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date" />
                                    <asp:ValidatorCalloutExtender ID="CompareValidator12_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator12" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear">
                                    Bk Number
                                </td>
                                <td class="GridRowClear">
                                    <asp:TextBox ID="txtBkNum" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender21" runat="server" TargetControlID="txtBkNum"
                                        WatermarkCssClass="WaterMark" WatermarkText="Like Booking Number..." />
                                </td>
                                <td class="GridRowClear" colspan="2">
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" class="ComandRow2T" style="height: 30px; padding-top: 5px">
                                    <asp:Button ID="Button1" runat="server" SkinID="skBtnFilter" />&nbsp;
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
                <asp:ObjectDataSource ID="dsCategory" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="dsSpecialTableAdapters.SpecialCategoryTableAdapter">
                </asp:ObjectDataSource>
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
                                <asp:GridView ID="gvInvoices" runat="server" AutoGenerateColumns="False" DataKeyNames="InvoiceID"
                                    DataSourceID="dsFilteredInvoices" SkinID="skGridView" ShowFooter="False">
                                    <Columns>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="cbSend" runat="server" />
                                            </ItemTemplate>
                                            <ItemStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="(ID)" SortExpression="InvoiceID">
                                            <ItemTemplate>
                                                (<asp:HyperLink ID="HyperLink1" runat="server" 
                                                    NavigateUrl='<%# "~/Invoices/InvoiceCreate.aspx?InvoiceID=" & Eval("InvoiceID") %>' 
                                                    Text='<%# Eval("InvoiceID") %>' />)
                                            </ItemTemplate>
                                            <ItemStyle Width="50px" HorizontalAlign="Right" />
                                            <HeaderStyle HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="InvNumber" HeaderText="InvNum" SortExpression="InvNumber">
                                            <ItemStyle Width="50px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="InvDate" DataFormatString="{0:d}" HeaderText="InvDate"
                                            HtmlEncode="False" SortExpression="InvDate">
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="TypeDisp" HeaderText="InvType" SortExpression="TypeDisp" >
                                            <ItemStyle Width="80px" Wrap="false" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ResGroup" HeaderText="ResGroup" SortExpression="ResGroup" >
                                            <ItemStyle Width="100px" Wrap="false" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Hotel" HeaderText="Hotel" SortExpression="Hotel">
                                            <ItemStyle Width="300px" Wrap="false" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="TourOp" HeaderText="TourOp" SortExpression="TourOp">
                                            <ItemStyle Width="300px" Wrap="false" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="CheckIn" DataFormatString="{0:d}" HeaderText="CheckIn" HtmlEncode="False" SortExpression="CheckIn">
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="CheckOut" DataFormatString="{0:d}" HeaderText="CheckOut" HtmlEncode="False" SortExpression="CheckOut">
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <%--<asp:BoundField DataField="Nights" HeaderText="Nights" ReadOnly="True" SortExpression="Nights" />--%>
                                        <asp:BoundField DataField="HAmount" HeaderText="Amount" SortExpression="HAmount">
                                            <ItemStyle Width="90px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="InvRefText" HeaderText="InvRefText" SortExpression="InvRefText" />
                                        <asp:BoundField DataField="InvPrnText" HeaderText="InvPrnText" SortExpression="InvPrnText" Visible="False" />
                                        <asp:BoundField DataField="InvComment" HeaderText="InvComment" SortExpression="InvComment" Visible="False" />
                                    </Columns>
                                </asp:GridView>
                                <asp:LinkButton ID="lbSelect" runat="server" OnClick="lbSelect_Click">Select All</asp:LinkButton>
                                <br />
                                <asp:LinkButton ID="lbDeselect" runat="server" OnClick="lbDeselect_Click">Deselect All</asp:LinkButton>
                                <div style="text-align: right; float: right;">
                                    <asp:Button ID="linkNew" runat="server" Text="Send To CCI" SkinID="skBtnBase" OnClick="LinkButton2_Click"/>
                                </div> 
                            </td>
                        </tr>
                    </asp:Panel>
                </table>
                <asp:ObjectDataSource ID="dsFilteredInvoices" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetInvoicesForSend" TypeName="dsInvoicesTableAdapters.FilterUserInvoiceTableAdapter">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
                        <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="ddlTO" DefaultValue="" Name="TourOpId" PropertyName="SelectedValue" Type="Int32" />
                        <asp:Parameter DefaultValue="INV" Name="InvDoc" Type="String" />
                        <asp:ControlParameter ControlID="ddlInvType" Name="InvType" PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="fltInvFrom" Name="InvNumFrom" PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="fltInvTo0" Name="InvNumTo" PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="fltStart" Name="ChkInFrom" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="fltFinish" Name="ChkInTo" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="txtBkNum" Name="BkNumber" PropertyName="Text" Type="String" />
                        <asp:Parameter DefaultValue="2" Name="State" Type="Int32" />
                        <asp:Parameter DefaultValue="False" Name="IncludeCancel" Type="Boolean" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
