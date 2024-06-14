<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" CodeFile="InvoiceJournal_RT.aspx.vb" Inherits="Reports_Invoices_InvoiceJournal_RT" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Invoice Journal Room Types 
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
                            &nbsp; </asp:Label>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px">
                    <asp:Panel ID="pnSearch" runat="server" DefaultButton="btReport" Width="600px">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="GridRow1B" style="width: 130px">Hotel</td>
                                <td class="GridRow1B" style="width: 470px" colspan="3">
                                    <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" DataSourceID="dsHotel"
                                        DataTextField="Hotel" DataValueField="HotelID" AppendDataBoundItems="True" AutoPostBack="true">
                                        <asp:ListItem Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsHotel" runat="server" SelectMethod="GetData" 
                                        TypeName="ReportsInvoiceTableAdapters.Hotel4UserTableAdapter">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Room Type</td>
                                <td class="GridRow1B" style="width: 470px; vertical-align: middle;" colspan="3">
                                    <asp:UpdatePanel ID="upRooms" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td style="width: 470px;">
                                                        <asp:TextBox ID="fltRooms" runat="server" CssClass="TextBox" Text="all" />
                                                        <asp:PopupControlExtender ID="pceRooms" runat="server" CommitProperty="Text" PopupControlID="tvPanel"
                                                            Position="Bottom" TargetControlID="fltRooms">
                                                        </asp:PopupControlExtender>
                                                        <asp:Panel ID="tvPanel" runat="server" BackColor="White" 
                                                            BorderStyle="solid" BorderWidth="1px"
                                                            ScrollBars="Auto" Height="350px" Width="460px">
                                                            <asp:CheckBoxList ID="cblRooms" runat="server" DataSourceID="dsRoom" 
                                                                DataTextField="Room" DataValueField="RoomTypeID" >
                                                            </asp:CheckBoxList>
                                                            <asp:ObjectDataSource ID="dsRoom" runat="server" SelectMethod="GetData" 
                                                                TypeName="ReportsInvoiceTableAdapters.Room4HotelTableAdapter" >
                                                                <SelectParameters>
                                                                    <asp:ControlParameter ControlID="ddlHotel" Name="HotelID" PropertyName="SelectedValue" Type="Int32" />
                                                                </SelectParameters>
                                                            </asp:ObjectDataSource>
                                                        </asp:Panel>
                                                    </td>
                                                    <td>
                                                        <asp:ImageButton ID="btnCloseTV" runat="server" ImageUrl="~/Images/Collapse.gif" 
                                                            BorderStyle="Dotted" BorderWidth="1px" BackColor="Control" />
                                                    </td>
                                                </tr> 
                                            </table> 
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnCloseTV" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" >Tour&nbsp;Operator</td>
                                <td class="GridRow1B" colspan="3" >
                                    <asp:DropDownList ID="ddlTO" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsTOAll" DataTextField="TourOp" DataValueField="TourOpID">
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsTOAll" runat="server" OldValuesParameterFormatString="original_{0}" 
                                        SelectMethod="GetDataByUser" 
                                        TypeName="TourOperTableAdapters.TourOpTableAdapter">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="hfUsername" Name="User" PropertyName="Value" Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" >Pay Condition</td>
                                <td class="GridRow1B" colspan="3" >
                                    <asp:DropDownList ID="ddlPayCond" runat="server" AppendDataBoundItems="True" 
                                        CssClass="TextBox" DataSourceID="dsPayCond" DataTextField="PayCond" 
                                        DataValueField="PayCondID">
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsPayCond" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" 
                                        TypeName="TourOperTableAdapters.PayCondTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                                <td class="GridRow1B">
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" >Market</td>
                                <td class="GridRow1B" colspan="3" >
                                    <asp:DropDownList ID="ddlMarkets" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsMarkets" DataTextField="Market" DataValueField="MarketID">
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsMarkets" runat="server" OldValuesParameterFormatString="original_{0}"
                                        TypeName="TourOperTableAdapters.MarketTableAdapter" SelectMethod="GetData"></asp:ObjectDataSource>
                                </td>
                                <td class="GridRow1B">
                                </td>
                            </tr>
                            <tr>
                                    <td class="GridRow1B" >Inv Type</td>
                                    <td class="GridRow1B" colspan="3">
                                        <asp:DropDownList ID="ddlInvType" runat="server" AppendDataBoundItems="True" 
                                            CssClass="TextBox">
                                            <asp:ListItem Selected="True" Value="">all </asp:ListItem>
                                            <asp:ListItem Value="0">Stay</asp:ListItem>
                                            <asp:ListItem Value="1">Group</asp:ListItem>
                                            <asp:ListItem Value="2">Cancel</asp:ListItem>
                                            <asp:ListItem Value="3">No-Show</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" >Check In From</td>
                                    <td class="GridRow1B" style="width: 200px;">
                                        <asp:TextBox ID="fltStart" runat="server" CssClass="TextBox" Width="185px" />
                                        <asp:TextBoxWatermarkExtender ID="fltStart_TextBoxWatermarkExtender" 
                                            runat="server" TargetControlID="fltStart" WatermarkCssClass="WaterMark" 
                                            WatermarkText="Check In date equals or later than" />
                                        <asp:CompareValidator ID="fltStart_CompareValidator" runat="server" 
                                            ControlToValidate="fltStart" Display="None" ErrorMessage="Only date input" 
                                            Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                        <asp:ValidatorCalloutExtender ID="fltStart_ValidatorCalloutExtender" runat="server"
                                            Enabled="True" TargetControlID="fltStart_CompareValidator">
                                        </asp:ValidatorCalloutExtender>
                                        <asp:CalendarExtender ID="fltStart_CalendarExtender" runat="server" 
                                            Enabled="True" TargetControlID="fltStart" CssClass="cal_Theme1">
                                        </asp:CalendarExtender>
                                    </td>
                                    <td class="GridRow1B" style="width: 80px; padding-left: 40px;">Check In To</td>
                                    <td class="GridRow1B" style="width: 200px;">
                                        <asp:TextBox ID="fltFinish" runat="server" CssClass="TextBox" Width="185px" />
                                        <asp:CompareValidator ID="fltFinish_CompareValidator" runat="server" 
                                            ControlToValidate="fltFinish" Display="None" ErrorMessage="Only date input" 
                                            Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                        <asp:ValidatorCalloutExtender ID="fltFinish_ValidatorCalloutExtender" 
                                            runat="server" Enabled="True" TargetControlID="fltFinish_CompareValidator">
                                        </asp:ValidatorCalloutExtender>
                                        <asp:TextBoxWatermarkExtender ID="fltFinish_TextBoxWatermarkExtender" 
                                            runat="server" TargetControlID="fltFinish" WatermarkCssClass="WaterMark" 
                                            WatermarkText="Check In date equals or before than" />
                                        <asp:CalendarExtender ID="fltFinish_CalendarExtender" runat="server" 
                                            CssClass="cal_Theme1" Enabled="True" TargetControlID="fltFinish">
                                        </asp:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" >Num From</td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="fltInvFrom" runat="server" CssClass="TextBox" Width="185px" />
                                        <asp:TextBoxWatermarkExtender ID="fltInvFrom_TextBoxWatermarkExtender" 
                                            runat="server" TargetControlID="fltInvFrom" WatermarkCssClass="WaterMark" 
                                            WatermarkText="Invoice Number equals or greater than" />
                                    </td>
                                    <td class="GridRow1B" style="padding-left: 40px;">Inv Num To</td>
                                    <td class="GridRow1B" >
                                        <asp:TextBox ID="fltInvTo" runat="server" CssClass="TextBox" Width="185px" />
                                        <asp:TextBoxWatermarkExtender ID="fltInvTo_TextBoxWatermarkExtender" 
                                            runat="server" TargetControlID="fltInvTo" WatermarkCssClass="WaterMark" 
                                            WatermarkText="Invoice Number equals or less than" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B" >Date From</td>
                                    <td class="GridRow1B" >
                                        <asp:TextBox ID="fltInvDateFrom" runat="server" CssClass="TextBox" Width="185px" />
                                        <asp:TextBoxWatermarkExtender ID="fltInvDateFrom_TextBoxWatermarkExtender" 
                                            runat="server" TargetControlID="fltInvDateFrom" WatermarkCssClass="WaterMark" 
                                            WatermarkText="Inv date equals or later than" />
                                        <asp:CalendarExtender ID="fltInvDateFrom_CalendarExtender" runat="server" 
                                            CssClass="cal_Theme1" Enabled="True" TargetControlID="fltInvDateFrom">
                                        </asp:CalendarExtender>
                                        <asp:CompareValidator ID="fltInvDateFrom_CompareValidator" runat="server" 
                                            ControlToValidate="fltInvDateFrom" Display="None" ErrorMessage="Only date input" 
                                            Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                        <asp:ValidatorCalloutExtender ID="fltInvDateFrom_ValidatorCalloutExtender" 
                                            runat="server" Enabled="True" TargetControlID="fltInvDateFrom_CompareValidator">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                    <td class="GridRow1B" style="padding-left: 40px;">Date To</td>
                                    <td class="GridRow1B" >
                                        <asp:TextBox ID="fltInvDateTo" runat="server" CssClass="TextBox" Width="185px" />
                                        <asp:TextBoxWatermarkExtender ID="fltInvDateTo_TextBoxWatermarkExtender" 
                                            runat="server" TargetControlID="fltInvDateTo" WatermarkCssClass="WaterMark" 
                                            WatermarkText="Inv date equals or before than" />
                                        <asp:CalendarExtender ID="fltInvDateTo_CalendarExtender" runat="server" 
                                            CssClass="cal_Theme1" Enabled="True" TargetControlID="fltInvDateTo">
                                        </asp:CalendarExtender>
                                        <asp:CompareValidator ID="fltInvDateTo_CompareValidator" runat="server" 
                                            ControlToValidate="fltInvDateTo" Display="None" ErrorMessage="Only date input" 
                                            Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                        <asp:ValidatorCalloutExtender ID="fltInvDateTo_ValidatorCalloutExtender" 
                                            runat="server" Enabled="True" TargetControlID="fltInvDateTo_CompareValidator">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear" >State</td>
                                    <td class="GridRowClear">
                                        <asp:DropDownList ID="ddlState" runat="server" CssClass="TextBox"
                                            DataSourceID="dsInvState" DataTextField="InvoiceState" DataValueField="InvoiceStateID" 
                                            AppendDataBoundItems="True" >
                                            <asp:ListItem Selected="True" Value="10">all states</asp:ListItem>
                                            <asp:ListItem Value="20">* Hotel States</asp:ListItem>
                                            <asp:ListItem Value="30">* CCI States</asp:ListItem>
                                            <asp:ListItem Value="40">* Not Reviewed by CCI Flag</asp:ListItem>
                                            <asp:ListItem Value="50">* Reviewed by CCI Flag</asp:ListItem>
                                            <asp:ListItem Value="60">* Canceled States</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsInvState" runat="server"
                                            TypeName="dsInvoicesTableAdapters.InvoiceStateTableAdapter" 
                                            SelectMethod="GetData" >
                                        </asp:ObjectDataSource>
                                    </td>
                                    <td class="GridRowClear" style="padding-left: 40px;">Document</td>
                                    <td class="GridRowClear" >
                                        <asp:DropDownList ID="ddlInv" runat="server" CssClass="TextBox" >
                                            <asp:ListItem Value="INV">Invoice</asp:ListItem>
                                            <asp:ListItem Value="PRO">Proforma</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="ComandRow2T" style="text-align: left; vertical-align: middle;">
                                        <asp:CheckBox ID="cbHotel" runat="server" Text="Hotel" TextAlign="Right" Visible="False" />
                                    </td> 
                                    <td class="ComandRow2T" colspan="3" >
                                        <asp:RadioButton ID="rbPlain" runat="server" Text="Plain" GroupName="rptType" 
                                            ToolTip="Invoice journal grouped by hotel and tour operator" />
                                        <asp:RadioButton ID="rbTTOO" runat="server" Text="Group by TTOO" GroupName="rptType" Checked="true" 
                                            ToolTip="Invoice journal grouped by hotel tour operator and room type" />
                                        <asp:RadioButton ID="rbRoomType" runat="server" Text="Group by Room Type" GroupName="rptType" 
                                            ToolTip="Invoice journal grouped by hotel room type and tour operator"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear" style="height: 28px; padding-top: 5px; text-align: right;">
                                        <asp:CheckBox ID="cbExcel" runat="server" Text="export to Excel" TextAlign="Left" />
                                    </td>
                                    <td class="GridRow1T" style="height: 28px; padding-top: 5px; text-align: right;" colspan="2">
                                        <asp:CheckBox ID="cbCancel" runat="server" Text="Incl.cancel" TextAlign="Left" />
                                    </td>
                                    <td class="GridRow1T" style="height: 28px; padding-top: 5px; text-align: right;">
                                        <asp:Button ID="btReport" runat="server" SkinID="skBtnBase" Text="Report" />
                                        &nbsp;<asp:Button ID="btClear" runat="server" SkinID="skBtnClear" />
                                    </td>
                                </tr>
                            </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    <asp:ObjectDataSource ID="dsInvoiceReport" runat="server" SelectMethod="GetData" 
        TypeName="ReportsInvoiceTableAdapters.InvoiceJournal_DetailTableAdapter" 
        OldValuesParameterFormatString="original_{0}">
        <SelectParameters>
            <asp:ControlParameter ControlID="cbHotel" Name="HRate" PropertyName="Checked" Type="Boolean" />
            <asp:ControlParameter ControlID="ddlInv" DefaultValue="" Name="InvDoc" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlHotel" Name="HotelID" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="ddlTO" Name="TourOpId" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="ddlPayCond" Name="PayCondId" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlMarkets" Name="MarketId" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlInvType" DefaultValue="" Name="InvType" PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter Name="GroupCode" Type="String" />
            <asp:ControlParameter ControlID="fltInvFrom" Name="InvNumFrom" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="fltInvTo" Name="InvNumTo" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="fltStart" Name="ChkInFrom" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="fltFinish" Name="ChkInTo" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="fltInvDateFrom" Name="InvDateFrom" PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="fltInvDateTo" Name="InvDateTo" PropertyName="Text" Type="DateTime" />
            <asp:Parameter Name="State" Type="Int32" />
            <asp:ControlParameter ControlID="ddlState" Name="StateSet" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="cbCancel" Name="IncludeCancel" PropertyName="Checked" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

