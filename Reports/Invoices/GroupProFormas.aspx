<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" 
    CodeFile="GroupProFormas.aspx.vb" Inherits="Reports_Invoices_GroupProFormas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    ProFormas
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
                        <asp:Label ID="lblFilter" runat="server" SkinID="skGridLabel">
                            Search/Filter &nbsp;
                            <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />&nbsp; 
                        </asp:Label>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px">
                    <asp:Panel ID="pnSearch" runat="server" Style="width: 600px" DefaultButton="btnReport">
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="GridRow1B" style="width: 100px;">Hotel</td>
                                    <td class="GridRow1B" style="width: 480px;" colspan="3">
                                        <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" DataSourceID="dsHotel"
                                            DataTextField="Hotel" DataValueField="HotelID">
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsHotel" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="dsInvoicesTableAdapters.HotelTableAdapter">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Tour Operator</td>
                                    <td class="GridRow1B" colspan="3">
                                        <asp:DropDownList ID="ddlTO" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                            DataSourceID="dsTOAll" DataTextField="TourOp" DataValueField="TourOpID">
                                            <%--<asp:ListItem Selected="True" Value="">all </asp:ListItem>--%>
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
                                    <td class="GridRow1B">Inv Type</td>
                                    <td class="GridRow1B" colspan="3">
                                        <asp:DropDownList ID="ddlInvType" runat="server" AppendDataBoundItems="True" CssClass="TextBox">
                                            <asp:ListItem Selected="True" Value="">all </asp:ListItem>
                                            <asp:ListItem Value="0">Stay</asp:ListItem>
                                            <asp:ListItem Value="1">Group</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Check In From</td>
                                    <td class="GridRow1B" style="width: 200px;">
                                        <asp:TextBox ID="fltCkInStart" runat="server" CssClass="TextBox" Width="185px" />
                                        <asp:TextBoxWatermarkExtender ID="wmCkInStart" runat="server" 
                                            TargetControlID="fltCkInStart"
                                            WatermarkCssClass="WaterMark"
                                            WatermarkText="Check In date equals or later than" />
                                        <asp:CompareValidator ID="cvCkInStart" runat="server" 
                                            ControlToValidate="fltCkInStart"
                                            Operator="DataTypeCheck" Type="Date" 
                                            Display="None" ErrorMessage="Only date input" />
                                        <asp:ValidatorCalloutExtender ID="errCkInStart" runat="server" Enabled="True" 
                                            TargetControlID="cvCkInStart" />
                                        <asp:CalendarExtender ID="calCkInStart" runat="server" Enabled="True" CssClass="cal_Theme1" 
                                            TargetControlID="fltCkInStart" />
                                    </td>
                                    <td class="GridRow1B" style="width: 80px; padding-left: 20px;">Check In To</td>
                                    <td class="GridRow1B" style="width: 200px;">
                                        <asp:TextBox ID="fltCkInFinish" runat="server" CssClass="TextBox" Width="185px" />
                                        <asp:TextBoxWatermarkExtender ID="wmCkInFinish" runat="server" 
                                            TargetControlID="fltCkInFinish"
                                            WatermarkCssClass="WaterMark"
                                            WatermarkText="Check In date equals or before than" />
                                        <asp:CompareValidator ID="cvCkInFinish" runat="server" 
                                            ControlToValidate="fltCkInFinish"
                                            Operator="DataTypeCheck" Type="Date" 
                                            Display="None" ErrorMessage="Only date input" />
                                        <asp:ValidatorCalloutExtender ID="errCkInFinish" runat="server" Enabled="True" 
                                            TargetControlID="cvCkInFinish" />
                                        <asp:CalendarExtender ID="calCkInFinish" runat="server" Enabled="True" CssClass="cal_Theme1" 
                                            TargetControlID="fltCkInFinish" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Check Out From</td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="fltCkOutStart" runat="server" CssClass="TextBox" Width="185px" />
                                        <asp:TextBoxWatermarkExtender ID="wmCkOutStart" runat="server" 
                                            TargetControlID="fltCkOutStart"
                                            WatermarkCssClass="WaterMark"
                                            WatermarkText="Check Out date equals or later than" />
                                        <asp:CompareValidator ID="cvCkOutStart" runat="server" 
                                            ControlToValidate="fltCkOutStart"
                                            Operator="DataTypeCheck" Type="Date" 
                                            Display="None" ErrorMessage="Only date input" />
                                        <asp:ValidatorCalloutExtender ID="errCkOutStart" runat="server" Enabled="True" 
                                            TargetControlID="cvCkOutStart" />
                                        <asp:CalendarExtender ID="calCkOutStart" runat="server" Enabled="True" CssClass="cal_Theme1" 
                                            TargetControlID="fltCkOutStart" />
                                    </td>
                                    <td class="GridRow1B" style="width: 80px; padding-left: 20px;">Check Out To</td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="fltCkOutFinish" runat="server" CssClass="TextBox" Width="185px" />
                                        <asp:TextBoxWatermarkExtender ID="wmCkOutFinish" runat="server" 
                                            TargetControlID="fltCkOutFinish"
                                            WatermarkCssClass="WaterMark"
                                            WatermarkText="Check Out date equals or before than" />
                                        <asp:CompareValidator ID="cvCkOutFinish" runat="server" 
                                            ControlToValidate="fltCkOutFinish"
                                            Operator="DataTypeCheck" Type="Date" 
                                            Display="None" ErrorMessage="Only date input" />
                                        <asp:ValidatorCalloutExtender ID="errCkOutFinish" runat="server" Enabled="True" 
                                            TargetControlID="cvCkOutFinish" />
                                        <asp:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True" CssClass="cal_Theme1"
                                            TargetControlID="fltCkOutFinish" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">InvNumFrom</td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="fltInvFrom" runat="server" CssClass="TextBox" Width="185px" />
                                        <asp:TextBoxWatermarkExtender ID="wmInvFrom" runat="server" 
                                            TargetControlID="fltInvFrom"
                                            WatermarkCssClass="WaterMark"
                                            WatermarkText="Invoice Number equals or greater than" />
                                    </td>
                                    <td class="GridRow1B" style="width: 80px; padding-left: 20px;">InvNumTo</td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="fltInvTo" runat="server" CssClass="TextBox" Width="185px"/>
                                        <asp:TextBoxWatermarkExtender ID="wmInvTo" runat="server" 
                                            TargetControlID="fltInvTo" 
                                            WatermarkCssClass="WaterMark"
                                            WatermarkText="Invoice Number equals or less than" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Group Code</td>
                                    <td class="GridRow1B" colspan="3">
                                        <asp:TextBox ID="fltResGroup" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server"
                                            TargetControlID="fltResGroup" 
                                            WatermarkCssClass="WaterMark" 
                                            WatermarkText="Like Group Code..." />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear">Bk Number</td>
                                    <td class="GridRowClear" colspan="3">
                                        <asp:TextBox ID="txtBkNum" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="wmBkNum" runat="server"
                                            TargetControlID="txtBkNum" 
                                            WatermarkCssClass="WaterMark" WatermarkText="Like Booking Number..." />
                                    </td>
                                </tr>
                                <%--<tr>
                                    <td class="GridRowClear">State</td>
                                    <td class="GridRowClear" colspan="3">
                                        <asp:DropDownList ID="ddlState" runat="server" AppendDataBoundItems="True" CssClass="TextBox">
                                            <asp:ListItem Selected="True" Value="">all states</asp:ListItem>
                                            <asp:ListItem Value="0">Inactive</asp:ListItem>
                                            <asp:ListItem Value="1">Active</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>--%>
                                <tr>
                                    <td class="ComandRow2T" style="height: 28px; padding-top: 5px;" colspan="4" >
                                        <asp:Button ID="btnReport" runat="server" SkinID="skBtnFilter" Text="Filter" />&nbsp;
                                        <asp:Button ID="btnClear" runat="server" SkinID="skBtnClear" />
                                    </td>
                                </tr>
                            </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="dsFilteredProinvoice" runat="server" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetData" 
            TypeName="dsPreInvoicesTableAdapters.GroupProformaTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlHotel" Name="HotelID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlTO" Name="TourOpID" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddlInvType" Name="InvType" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="fltCkInStart" Name="CkInStart" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="fltCkInFinish" Name="CkInFinish" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="fltCkOutStart" Name="CkOutStart" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="fltCkOutFinish" Name="CkOutFinish" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="fltInvFrom" Name="InvNumStart" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="fltInvTo" Name="InvNumFinish" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="fltResGroup" Name="ResGroup" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtBkNum" Name="BkNumber" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
    <br />
    <div class="Blue">
        <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>--%>
                <asp:Panel runat="server" ID="pnlCnt" Visible ="false" >
                    <table cellpadding="0" cellspacing="0">
                       <tr>
                            <td class="GridLabelBG">
                                <asp:Label ID="lbPreinvoices" runat="server" SkinID="skGridLabel" Text="ProForma Preinvoices" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td class="GridBorder">
                                <asp:DetailsView ID="dvProformas" runat="server" AutoGenerateRows="False" 
                                    DataSourceID="dsFilteredProinvoice" SkinID="skDetailView" Width="100%">
                                    <RowStyle CssClass="GridRowClear" BorderStyle="None" />
                                    <Fields>
                                        <asp:BoundField DataField="Hotel" HeaderText="Hotel" SortExpression="Hotel" ShowHeader="False" >
                                            <ItemStyle CssClass="GridRow1B" Font-Bold="true" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="TourOp" HeaderText="TourOp" SortExpression="TourOp" ShowHeader="False" >
                                            <ItemStyle CssClass="GridRow1B" Font-Bold="true" />
                                        </asp:BoundField>
                                    </Fields>
                                    <%--
                                    <FooterTemplate>
                                        <table cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td style="width: 100%" >
                                                    <asp:LinkButton ID="lbSelect" runat="server" onclick="lbSelect_Click">Select All</asp:LinkButton>
                                                    <br />
                                                    <asp:LinkButton ID="lbDeselect" runat="server" onclick="lbDeselect_Click">Deselect All</asp:LinkButton>
                                                </td>
                                                <td style="vertical-align: bottom;" >
                                                    <asp:Button ID="btnExport" runat="server" SkinID="skBtnFilter" Text="Report" />
                                                </td>
                                            </tr>
                                    </FooterTemplate>
                                    --%>
                                </asp:DetailsView>
                                <div style="padding-left: 20px; padding-top: 5px;">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td style="width: 100%" >
                                            <asp:LinkButton ID="lbSelect" runat="server" >Select All</asp:LinkButton>
                                            <br />
                                            <asp:LinkButton ID="lbDeselect" runat="server" >Deselect All</asp:LinkButton>
                                        </td>
                                        <td style="vertical-align: bottom;" >
                                            <asp:Button ID="btnExport" runat="server" SkinID="skBtnFilter" Text="Report" />
                                        </td>
                                    </tr>
                                </table> 
                                <asp:GridView ID="gvProformas" runat="server" SkinID="skGridView" ShowFooter="true"
                                    AutoGenerateColumns="False" DataSourceID="dsFilteredProinvoice">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="cbSelect" runat="server" Checked="true" />
                                                <asp:HiddenField ID="hfID" runat="server" Value='<%# Bind("BillingId") %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="40px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="InvoiceID" HeaderText="InvoiceID" InsertVisible="False" ReadOnly="True" SortExpression="InvoiceID" Visible="False" />
                                        <asp:BoundField DataField="DetailID" HeaderText="DetailID" InsertVisible="False" ReadOnly="True" SortExpression="DetailID" Visible="False" />
                                        <asp:BoundField DataField="BillingId" HeaderText="BillingId" InsertVisible="False" ReadOnly="True" SortExpression="BillingId" Visible="False" />
                                        <asp:BoundField DataField="InvNumber" HeaderText="Proforma #" SortExpression="InvNumber" DataFormatString="PF {0}" >
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="InvDate" HeaderText="Date" SortExpression="InvDate" DataFormatString="{0:d}" >
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ResGroup" HeaderText="Group" SortExpression="ResGroup" >
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="FolioFull" HeaderText="Folio" SortExpression="FolioFull" >
                                            <ItemStyle Width="100px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="BkNumber" HeaderText="Bk.Num." SortExpression="BkNumber" >
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="BookingVoucher" HeaderText="Bk.Voucher" SortExpression="BookingVoucher" Visible="False" >
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="RoomTypeID" HeaderText="Room" SortExpression="RoomTypeID" >
                                            <ItemStyle Width="60px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="RoomType" HeaderText="Room" SortExpression="RoomType" Visible="False" >
                                            <ItemStyle Width="150px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="DetText" HeaderText="Guest Name" SortExpression="DetText" >
                                            <ItemStyle Width="250px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="EnterDate" HeaderText="Arrival" SortExpression="EnterDate" DataFormatString="{0:d}" >
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ExitDate" HeaderText="Depart." SortExpression="ExitDate" DataFormatString="{0:d}" >
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Nights" HeaderText="Ngt" ReadOnly="True" SortExpression="Nights" >
                                            <ItemStyle Width="40px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="AdultNum" HeaderText="Ad." SortExpression="AdultNum" >
                                            <ItemStyle Width="40px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="RateCodeId" HeaderText="Rate" SortExpression="RateCodeId" >
                                            <ItemStyle Width="100px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" DataFormatString="{0:N2}" >
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:CheckBoxField HeaderText="HotelRate" SortExpression="HotelRate" DataField="HotelRate" Visible="False" />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <div style="width:1000px">
                                            No proformas found for search criteria. Try change filters.
                                        </div>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                                </div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            <%--</ContentTemplate>
        </asp:UpdatePanel>--%>
    </div>
</asp:Content>

