<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="Reservations.aspx.vb" Inherits="Invoices_Reservations" 
	MaintainScrollPositionOnPostback="true"
    enableEventValidation="false" %>

<%@ Register src="~/App_UserControls/HotelGroupHotelControl.ascx" tagname="HotelGroupHotelControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/TourOpGroupMarketPayCondTourOpControl.ascx" tagname="TourOpGroupMarketPayCondTourOpControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/InputIntegerControl.ascx" tagname="InputIntegerControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/FromToIntegerControl.ascx" tagname="FromToIntegerControl" tagprefix="uc" %>
<%@ Register src="~/App_UserControls/FromToDateControl.ascx" tagname="FromToDateControl" tagprefix="uc" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Reservations
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
                <td class="GridLabelBG" style="width: 600px;">
                    <asp:Panel ID="pnSearchHead" runat="server" Width="100%">
                        <asp:Label ID="lblFilter" runat="server" SkinID="skGridLabel">Search/Filter &nbsp;
                            <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />
                            &nbsp; </asp:Label>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px">
                    <asp:Panel ID="pnSearch" runat="server" style="padding-left: 8px;" DefaultButton="btnSearch">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="GridRow1B">Hotel (map)</td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlHotelMap" runat="server" CssClass="TextBox" DataSourceID="dsHotel"
                                        DataTextField="HID" DataValueField="HOTEL-NO" AppendDataBoundItems="true">
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                    </asp:DropDownList>                                        
                                    <asp:ObjectDataSource ID="dsHotel" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" 
                                        TypeName="dsHotelMapTableAdapters.recursiveHotelMapTableAdapter" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Tour Operator (map)</td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="fltTOMap" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wm_fltTOMap" runat="server" WatermarkCssClass="WaterMark"
                                        TargetControlID="fltTOMap" WatermarkText="Tour Operator mapping code (use % as wildcard)" />
                                </td>
                            </tr>
                                <tr>
                                    <td class="GridRow1B" colspan="2" >
                                        <uc:TourOpGroupMarketPayCondTourOpControl ID="ctrlTourOp" runat="server" 
                                            LabelWidth="120px" ControlWidth="480px"
                                            NoLocal="true" />
                                    </td>
                                </tr>

                            <tr>
                                <td class="GridRow1B" style="width: 120px;">Name</td>
                                <td class="GridRow1B" style="width: 480px;">
                                    <asp:TextBox ID="fltName" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wo_fltName" runat="server" WatermarkCssClass="WaterMark"
                                        TargetControlID="fltName" WatermarkText="Name on reservation (use % as wildcard)" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Group Code/Name</td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="fltResGroup" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wo_fltResGroup" runat="server" WatermarkCssClass="WaterMark"
                                        TargetControlID="fltResGroup" WatermarkText="Group name or code (use % as wildcard)" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Bk Number</td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="fltBkNumber" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wo_fltBkNumber" runat="server" WatermarkCssClass="WaterMark"
                                        TargetControlID="fltBkNumber" WatermarkText="Booking number (use % as wildcard)" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Room Type (map)
                                </td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="fltRoomMap" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wo_fltRoomMap" runat="server" WatermarkCssClass="WaterMark"
                                        TargetControlID="fltRoomMap" WatermarkText="Hotel Room Type (use % as wildcard)" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 120px;" >Folio Num</td>
                                <td class="GridRow1B" style="width: 480px;" >
                                    <uc:FromToIntegerControl ID="ctrlFolioNum" runat="server"
                                        MandatoryFrom="false"
                                        MandatoryTo="false" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 120px;" >Check In</td>
                                <td class="GridRow1B" style="width: 480px;" >
                                    <uc:FromToDateControl ID="ctrlCheckIn" runat="server"
                                        MandatoryFrom="false"
                                        MandatoryTo="false" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 120px;" >Bk Date</td>
                                <td class="GridRow1B" style="width: 480px;" >
                                    <uc:FromToDateControl ID="ctrlBook" runat="server"
                                        MandatoryFrom="false"
                                        MandatoryTo="false" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 120px;" >Created</td>
                                <td class="GridRow1B" style="width: 480px;" >
                                    <uc:FromToDateControl ID="ctrlCreated" runat="server"
                                        MandatoryFrom="false"
                                        MandatoryTo="false" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 120px;" >Modified</td>
                                <td class="GridRow1B" style="width: 480px;" >
                                    <uc:FromToDateControl ID="ctrlModified" runat="server"
                                        MandatoryFrom="false"
                                        MandatoryTo="false" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear">State</td>
                                <td class="GridRowClear" colspan="3">
                                    <asp:DropDownList ID="ddlState" runat="server" CssClass="TextBox" >
                                        <asp:ListItem Selected="True" Value="All">all states</asp:ListItem>
                                        <asp:ListItem Value="Active">Active</asp:ListItem>
                                        <asp:ListItem Value="CheckIn">Check In</asp:ListItem>
                                        <asp:ListItem Value="CheckOut">Check Out</asp:ListItem>
                                        <asp:ListItem Value="NoShow">No Show</asp:ListItem>
                                        <asp:ListItem Value="Cancelled">Cancelled</asp:ListItem>
                                        <asp:ListItem Value="NotCancelled">Exclude Cancelled</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="ComandRow2T" style="height: 28px; padding-top: 5px; text-align: left;" />
                                <td class="ComandRow2T" style="height: 28px; padding-top: 5px; text-align: right;">
                                    <asp:CheckBox ID="cbGroup" runat="server" Text="Only group reservations" TextAlign="Left" />
                                    <%-- <asp:CheckBox ID="cbCancel" runat="server" Text="Include cancel" TextAlign="Left" /> --%>
                                    &nbsp;&nbsp;<asp:Button ID="btnSearch" runat="server" SkinID="skBtnFilter" />
                                    &nbsp;&nbsp;<asp:Button ID="btnClear" runat="server" SkinID="skBtnClear" />
                                    &nbsp;&nbsp;<asp:Button ID="btnReport" runat="server" SkinID="skBtnBase" Text="Report" />
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
        <asp:UpdatePanel ID="updResult" runat="server">
            <ContentTemplate>
                <asp:Panel runat="server" ID="pnlCnt" Visible="False">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="GridLabelBG">
                                <asp:Label ID="lbHotels" runat="server" SkinID="skGridLabel" Text="Reservations" />
                            </td>
                        </tr>
                        <tr>
                            <td class="GridBorder">
                                <asp:GridView ID="gvReservas" runat="server" DataKeyNames="ResID" DataSourceID="dsReservas"
                                    SkinID="skGridView" AutoGenerateColumns="False" AllowPaging="True" PageSize="50"
                                    EnableModelValidation="True">
                                    <Columns>
                                        <asp:BoundField DataField="ResID" HeaderText="ResID" ReadOnly="True" SortExpression="ResID" Visible="False" />
                                        <asp:BoundField DataField="FolioFull" HeaderText="FolioFull" SortExpression="FolioFull">
                                            <ItemStyle Width="150px"/>
                                        </asp:BoundField>
                                        <%--<asp:BoundField DataField="TourOpHID" HeaderText="TourOp HID" SortExpression="TourOpHID">
                                            <ItemStyle Width="60px"/>
                                        </asp:BoundField>--%>
                                        <asp:BoundField DataField="TourOp" HeaderText="TourOp" SortExpression="TourOp">
                                            <ItemStyle Width="300px"/>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ResGroup" HeaderText="Group Code" SortExpression="ResGroup">
                                            <ItemStyle Width="100px"/>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="BkNumber" HeaderText="Bk.Number" SortExpression="BkNumber">
                                            <ItemStyle Width="100px"/>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="BkDate" HeaderText="Bk.Date" SortExpression="BkDate" DataFormatString="{0:d}">
                                            <ItemStyle Width="80px"/>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="RoomTypeHID" HeaderText="Room Type" SortExpression="RoomTypeHID">
                                            <ItemStyle Width="60px"/>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="CheckIn" HeaderText="Arrival" SortExpression="CheckIn" DataFormatString="{0:d}" >
                                            <ItemStyle Width="80px"/>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="CheckOut" HeaderText="Departure" SortExpression="CheckOut" DataFormatString="{0:d}">
                                            <ItemStyle Width="80px"/>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Nights" HeaderText="Ngts" >
                                            <ItemStyle Width="40px"/>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="StateText" HeaderText="State" SortExpression="StateText" >
                                            <ItemStyle Width="50px"/>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Adult" HeaderText="Ad" >
                                            <ItemStyle Width="30px"/>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Junior" HeaderText="Jun" >
                                            <ItemStyle Width="30px"/>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Child" HeaderText="Chd" >
                                            <ItemStyle Width="30px"/>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Infant" HeaderText="Inf" >
                                            <ItemStyle Width="30px"/>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Created" HeaderText="Created" SortExpression="Created" DataFormatString="{0:d}">
                                            <ItemStyle Width="150px"/>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Modified" HeaderText="Modified" SortExpression="Modified" DataFormatString="{0:d}">
                                            <ItemStyle Width="150px"/>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="genericName" HeaderText="Guest" SortExpression="genericName">
                                            <ItemStyle Width="300px"/>
                                        </asp:BoundField>
                                        <asp:BoundField DataField="CHILD-TYPE" HeaderText="">
                                            <ItemStyle Width="30px"/>
                                        </asp:BoundField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="Excluded" Visible='<%# Eval("Excluded")=1 %>' Font-Italic="true" ForeColor="Red" />
                                            </ItemTemplate>
                                            <ItemStyle Width="40px" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <div style="width: 614px;">
                                            No reservations found for filter criteria.
                                        </div>
                                    </EmptyDataTemplate>
                                    <HeaderStyle Wrap="True" HorizontalAlign="Center" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                    <asp:ObjectDataSource ID="dsReservas" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetDataGroup" TypeName="dsDTS_ResReportTableAdapters.ReservationReportTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlHotelMap" Name="HotelHID" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="fltTOMap" Name="TourOpHID" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpId" PropertyName="SelectedTourOp" Type="Int32" />
                            <asp:ControlParameter ControlID="ctrlFolioNum" Name="FolioFrom" PropertyName="IntegerFrom" Type="Int64" />
                            <asp:ControlParameter ControlID="ctrlFolioNum" Name="FolioTo" PropertyName="IntegerTo" Type="Int64" />
                            <asp:ControlParameter ControlID="fltName" Name="Name" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="ctrlBook" Name="BkDateFrom" PropertyName="DateFrom" Type="DateTime" />
                            <asp:ControlParameter ControlID="ctrlBook" Name="BkDateTo" PropertyName="DateTo" Type="DateTime" />
                            <asp:ControlParameter ControlID="fltBkNumber" Name="BkNumber" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="fltResGroup" Name="ResGroup" PropertyName="Text" Type="String" />
                            <asp:Parameter Name="State" Type="String" />
                            <asp:ControlParameter ControlID="ctrlCheckIn" Name="ChkInFrom" PropertyName="DateFrom" Type="DateTime" />
                            <asp:ControlParameter ControlID="ctrlCheckIn" Name="ChkInTo" PropertyName="DateTo" Type="DateTime" />
                            <asp:ControlParameter ControlID="fltRoomMap" Name="RoomTypeHID" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="ctrlCreated" Name="CreatedFrom" PropertyName="DateFrom" Type="DateTime" />
                            <asp:ControlParameter ControlID="ctrlCreated" Name="CreatedTo" PropertyName="DateTo" Type="DateTime" />
                            <asp:ControlParameter ControlID="ctrlModified" Name="ModifiedFrom" PropertyName="DateFrom" Type="DateTime" />
                            <asp:ControlParameter ControlID="ctrlModified" Name="ModifiedTo" PropertyName="DateTo" Type="DateTime" />
                            <asp:ControlParameter ControlID="ctrlTourOp" Name="PayCondId" PropertyName="SelectedPayCond" Type="String" />
                            <asp:ControlParameter ControlID="cbGroup" Name="OnlyGroup" PropertyName="Checked" Type="Int32" />
                            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpGroupId" PropertyName="SelectedTourOpGroup" Type="Int32" />
                            <asp:ControlParameter ControlID="ctrlTourOp" Name="MarketID" PropertyName="SelectedMarket" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="dsReservasNew" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataGroup" 
                        TypeName="dsDTS_ResReportTableAdapters.ResReportTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlHotelMap" Name="HotelHID" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="fltTOMap" Name="TourOpHID" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpId" PropertyName="SelectedTourOp" Type="Int32" />
                            <asp:ControlParameter ControlID="ctrlFolioNum" Name="FolioFrom" PropertyName="IntegerFrom" Type="Int64" />
                            <asp:ControlParameter ControlID="ctrlFolioNum" Name="FolioTo" PropertyName="IntegerTo" Type="Int64" />
                            <asp:ControlParameter ControlID="fltName" Name="Name" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="ctrlBook" Name="BkDateFrom" PropertyName="DateFrom" Type="DateTime" />
                            <asp:ControlParameter ControlID="ctrlBook" Name="BkDateTo" PropertyName="DateTo" Type="DateTime" />
                            <asp:ControlParameter ControlID="fltBkNumber" Name="BkNumber" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="fltResGroup" Name="ResGroup" PropertyName="Text" Type="String" />
                            <asp:Parameter Name="State" Type="String" />
                            <asp:ControlParameter ControlID="ctrlCheckIn" Name="ChkInFrom" PropertyName="DateFrom" Type="DateTime" />
                            <asp:ControlParameter ControlID="ctrlCheckIn" Name="ChkInTo" PropertyName="DateTo" Type="DateTime" />
                            <asp:ControlParameter ControlID="fltRoomMap" Name="RoomTypeHID" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="ctrlCreated" Name="CreatedFrom" PropertyName="DateFrom" Type="DateTime" />
                            <asp:ControlParameter ControlID="ctrlCreated" Name="CreatedTo" PropertyName="DateTo" Type="DateTime" />
                            <asp:ControlParameter ControlID="ctrlModified" Name="ModifiedFrom" PropertyName="DateFrom" Type="DateTime" />
                            <asp:ControlParameter ControlID="ctrlModified" Name="ModifiedTo" PropertyName="DateTo" Type="DateTime" />
                            <asp:ControlParameter ControlID="ctrlTourOp" Name="PayCondId" PropertyName="SelectedPayCond" Type="String" />
                            <asp:ControlParameter ControlID="cbGroup" Name="OnlyGroup" PropertyName="Checked" Type="Int32" />
                            <asp:ControlParameter ControlID="ctrlTourOp" Name="TourOpGroupId" PropertyName="SelectedTourOpGroup" Type="Int32" />
                            <asp:ControlParameter ControlID="ctrlTourOp" Name="MarketID" PropertyName="SelectedMarket" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
