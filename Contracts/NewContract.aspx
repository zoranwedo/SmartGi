<%@ Page Title="" Language="VB" MasterPageFile="~/Contracts/masterNewCnt.master" AutoEventWireup="false" CodeFile="NewContract.aspx.vb" Inherits="Contracts_NewContract" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CreateCntContent" Runat="Server">
    <div class="Green">
        <asp:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="server" 
            CollapseControlID="lblFilter" CollapsedImage="~/Images/expand_.png" 
            ExpandControlID="lblFilter" ExpandedImage="~/Images/collapse_.png" 
            ImageControlID="imgExpander" TargetControlID="pnSearch">
        </asp:CollapsiblePanelExtender>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <asp:Panel ID="Panel1" runat="server">
                    <td class="GridLabelBG" width="600px">
                        <asp:Label ID="lblFilter" runat="server" SkinID="skGridLabel">
                            Search/Filter
                            &nbsp;
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/collapse_.png" />
                           &nbsp;
                        </asp:Label>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px">
                    <asp:Panel ID="pnSearch" runat="server">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="GridRow1B">
                                    Market
                                    <asp:Label ID="Label7" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                </td>
                                <td class="ComandRow2b" style="width: 400px;">
                                    <asp:DropDownList ID="ddlMarkets" runat="server" AppendDataBoundItems="True" 
                                        CssClass="TextBox" DataSourceID="dsMarkets" DataTextField="Market" 
                                        DataValueField="MarketID">
                                        <asp:ListItem Selected="True" Value="">all markets</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="GridRow1B">
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Name
                                </td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="fltName" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="fltNameExt" runat="server" 
                                        TargetControlID="fltName" WatermarkCssClass="WaterMark" 
                                        WatermarkText="TourOperator name (use % as wildchar)" />
                                </td>
                                <td class="GridRow1B">
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    City
                                </td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="fltCity" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="fltCityExt" runat="server" 
                                        TargetControlID="fltCity" WatermarkCssClass="WaterMark" 
                                        WatermarkText="City name (use % as wildchar)" />
                                </td>
                                <td class="GridRow1B">
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Country
                                </td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="fltCountry" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="fltCountryExt" runat="server" 
                                        TargetControlID="fltCountry" WatermarkCssClass="WaterMark" 
                                        WatermarkText="Country name (use % as wildchar)" />
                                </td>
                                <td class="GridRow1B">
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Pay Condition
                                </td>
                                <td class="ComandRow2b" style="width: 400px;">
                                    <asp:DropDownList ID="ddlPay" runat="server" AppendDataBoundItems="True" 
                                        CssClass="TextBox" DataSourceID="dsPayCond" DataTextField="PayCond" 
                                        DataValueField="PayCondID">
                                        <asp:ListItem Selected="True" Value="">all pay cond.</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsPayCond" runat="server" DeleteMethod="Delete" 
                                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                                        SelectMethod="GetData" TypeName="TourOperTableAdapters.PayCondTableAdapter" 
                                        UpdateMethod="Update">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Original_PayCondID" Type="String" />
                                        </DeleteParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="PayCond" Type="String" />
                                            <asp:Parameter Name="Original_PayCondID" Type="String" />
                                        </UpdateParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="PayCondID" Type="String" />
                                            <asp:Parameter Name="PayCond" Type="String" />
                                        </InsertParameters>
                                    </asp:ObjectDataSource>
                                </td>
                                <td class="GridRow1B">
                                </td>
                            </tr>
                            <tr>
                                <td class="FilterRow">
                                </td>
                                <td class="FilterRow">
                                    <asp:CheckBox ID="fltActive" runat="server" AutoPostBack="False" Checked="True" 
                                        Text="Show only active TO" />
                                </td>
                                <td class="FilterRow">
                                </td>
                            </tr>
                            <tr>
                                <td class="ComandRow2T" colspan="3">
                                    <asp:Button ID="Button1" runat="server" SkinID="skBtnFilter" />
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
    <asp:ObjectDataSource ID="dsTOSearch" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataForFilter" 
        TypeName="TourOperTableAdapters.TourOpTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_TourOpID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="MarketId" Type="String" />
            <asp:Parameter Name="ParentTourOpId" Type="Int32" />
            <asp:Parameter Name="TourOp" Type="String" />
            <asp:Parameter Name="BillingName" Type="String" />
            <asp:Parameter Name="RNC" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="Tel1" Type="String" />
            <asp:Parameter Name="Tel2" Type="String" />
            <asp:Parameter Name="Tel3" Type="String" />
            <asp:Parameter Name="Fax" Type="String" />
            <asp:Parameter Name="URL" Type="String" />
            <asp:Parameter Name="Email1" Type="String" />
            <asp:Parameter Name="Email2" Type="String" />
            <asp:Parameter Name="PayModeId" Type="String" />
            <asp:Parameter Name="PayCondId" Type="String" />
            <asp:Parameter Name="PayCondExtId" Type="Int32" />
            <asp:Parameter Name="CreditDays" Type="Int32" />
            <asp:Parameter Name="BillingParent" Type="Boolean" />
            <asp:Parameter Name="Active" Type="Boolean" />
            <asp:Parameter Name="Note" Type="String" />
            <asp:Parameter Name="Original_TourOpID" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="hfUsername" Name="UserName" 
                PropertyName="Value" Type="String" />
            <asp:ControlParameter ControlID="fltName" Name="TourOp" PropertyName="Text" 
                Type="String" />
            <asp:ControlParameter ControlID="ddlMarkets" Name="MarketID" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlPay" Name="PayCondID" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="fltCity" Name="City" PropertyName="Text" 
                Type="String" />
            <asp:ControlParameter ControlID="fltCountry" Name="Country" PropertyName="Text" 
                Type="String" />
            <asp:ControlParameter ControlID="fltActive" Name="ActiveOnly" 
                PropertyName="Checked" Type="Boolean" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="TourOpID" Type="Int32" />
            <asp:Parameter Name="MarketId" Type="String" />
            <asp:Parameter Name="ParentTourOpId" Type="Int32" />
            <asp:Parameter Name="TourOp" Type="String" />
            <asp:Parameter Name="BillingName" Type="String" />
            <asp:Parameter Name="RNC" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="Tel1" Type="String" />
            <asp:Parameter Name="Tel2" Type="String" />
            <asp:Parameter Name="Tel3" Type="String" />
            <asp:Parameter Name="Fax" Type="String" />
            <asp:Parameter Name="URL" Type="String" />
            <asp:Parameter Name="Email1" Type="String" />
            <asp:Parameter Name="Email2" Type="String" />
            <asp:Parameter Name="PayModeId" Type="String" />
            <asp:Parameter Name="PayCondId" Type="String" />
            <asp:Parameter Name="PayCondExtId" Type="Int32" />
            <asp:Parameter Name="CreditDays" Type="Int32" />
            <asp:Parameter Name="BillingParent" Type="Boolean" />
            <asp:Parameter Name="Active" Type="Boolean" />
            <asp:Parameter Name="Note" Type="String" />
            <asp:Parameter Direction="InputOutput" Name="NewID" Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <br />
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="Label1" runat="server" SkinID="skGridLabel" 
                        Text="Tour Operators"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvTO" runat="server" AllowPaging="True" 
                        DataKeyNames="TourOpID,TourOp" DataSourceID="dsTOSearch" SelectedIndex="0" 
                        SkinID="skGridView" Visible="False">
                        <Columns>
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" 
                                ShowSelectButton="True" />
                            <asp:BoundField DataField="TourOpID" HeaderText="TourOpID" ReadOnly="True" 
                                SortExpression="TourOpID" Visible="False">
                            <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TourOp" HeaderText="TourOperator" 
                                SortExpression="TourOp">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="250px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PayCondId" HeaderText="PayCond" 
                                SortExpression="PayCondId" />
                            <asp:BoundField DataField="MarketId" HeaderText="Market" 
                                SortExpression="MarketId">
                            <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Address" HeaderText="Address" 
                                SortExpression="Address" Visible="False">
                            <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="120px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Country" HeaderText="Country" 
                                SortExpression="Country">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="120px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Tel1" HeaderText="Tel" SortExpression="Tel">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Fax" HeaderText="Fax" SortExpression="Fax">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Email1" HeaderText="Email" SortExpression="Email" 
                                Visible="False">
                            <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:CheckBoxField DataField="Active" HeaderText="A" SortExpression="Active" />
                        </Columns>
                    </asp:GridView>
                    <br />
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="dummy" runat="server" />
        <div class="Green">
            <asp:CollapsiblePanelExtender ID="cpeSearch" runat="server" 
                CollapseControlID="lblFilter" CollapsedImage="~/Images/expand_.png" 
                ExpandControlID="lblFilter" ExpandedImage="~/Images/collapse_.png" 
                ImageControlID="imgExpander" TargetControlID="pnSearch">
            </asp:CollapsiblePanelExtender>
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <asp:Panel ID="pnSearchHead" runat="server">
                        <td class="GridLabelBG" style="width: 600px;">
                            <asp:Label ID="lblFilter0" runat="server" SkinID="skGridLabel">
                            Search/Filter
                            &nbsp;
                            <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />
                            &nbsp;
                        </asp:Label>
                        </td>
                    </asp:Panel>
                </tr>
                <tr>
                    <td class="GridBorder" style="width: 600px">
                        <asp:Panel ID="pnSearch0" runat="server">
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="GridRow1B">
                                        Name
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="fltName0" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="fltNameExt0" runat="server" 
                                            TargetControlID="fltName" WatermarkCssClass="WaterMark" 
                                            WatermarkText="Hotel name (use % as wildchar)" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        City
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="fltCity0" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="fltCityExt0" runat="server" 
                                            TargetControlID="fltCity" WatermarkCssClass="WaterMark" 
                                            WatermarkText="City name (use % as wildchar)" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Country
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="fltCountry0" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="fltCountryExt0" runat="server" 
                                            TargetControlID="fltCountry" WatermarkCssClass="WaterMark" 
                                            WatermarkText="Country name (use % as wildchar)" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear">
                                    </td>
                                    <td class="GridRowClear">
                                        <asp:CheckBox ID="fltActive0" runat="server" AutoPostBack="False" 
                                            Checked="True" Text="Show only active hotels" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="ComandRow2T" colspan="2">
                                        <asp:Button ID="btnFilter" runat="server" SkinID="skBtnFilter" />
                                        &nbsp;
                                        <asp:Button ID="btnClear" runat="server" SkinID="skBtnClear" />
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
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td class="GridLabelBG">
                        <asp:Label ID="lbHotels" runat="server" SkinID="skGridLabel" Text="Hotels">
                    </asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="GridBorder">
                        <asp:GridView ID="gvHotels" runat="server" AutoGenerateColumns="False" 
                            DataKeyNames="HotelID" DataSourceID="dsHotels" SkinID="skGridView">
                            <RowStyle Wrap="False" />
                            <Columns>
                                <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" 
                                    ShowSelectButton="True" />
                                <asp:BoundField DataField="HotelID" HeaderText="" ReadOnly="True" 
                                    SortExpression="HotelID" Visible="True">
                                <ItemStyle HorizontalAlign="Right" Width="50px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Hotel" HeaderText="Hotel" SortExpression="Hotel">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="350px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="200px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Country" HeaderText="Country" 
                                    SortExpression="Country">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="200px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Tel" HeaderText="Tel" SortExpression="Tel">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="150px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Fax" HeaderText="Fax" SortExpression="Fax">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="150px" />
                                </asp:BoundField>
                                <asp:CheckBoxField DataField="Flat" HeaderText="F" SortExpression="Flat">
                                <ItemStyle Width="25px" />
                                </asp:CheckBoxField>
                                <asp:CheckBoxField DataField="Active" HeaderText="A" SortExpression="Active">
                                <ItemStyle Width="25px" />
                                </asp:CheckBoxField>
                            </Columns>
                        </asp:GridView>
                        <asp:Panel ID="Panel2" runat="server" 
                            style="text-align: right; padding-top:10px; height: 30px;">
                            <asp:Button ID="linkNew" runat="server" BorderStyle="None" CssClass="Button" 
                                ForeColor="White" Text="New Contract" />
                        </asp:Panel>
                    <%--<asp:HyperLink ID="linkNew" runat="server" 
                        NavigateUrl="~/Maintenance/Hotel/HotelDetails.aspx?HotelID=0">New Hotel</asp:HyperLink>--%>
                    </td>
                </tr>
            </table>
        </div>
        <asp:ObjectDataSource ID="dsHotels" runat="server" DeleteMethod="Delete" 
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetDataByFilter" 
            TypeName="dsMaintHotelTableAdapters.HotelTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_HotelID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="HotelHID" Type="String" />
                <asp:Parameter Name="Hotel" Type="String" />
                <asp:Parameter Name="RNC" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="ZipCode" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="Tel" Type="String" />
                <asp:Parameter Name="Fax" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Contact" Type="String" />
                <asp:Parameter Name="Bank" Type="String" />
                <asp:Parameter Name="BankAccount" Type="String" />
                <asp:Parameter Name="Rooms" Type="Int32" />
                <asp:Parameter Name="Htl_Titulo" Type="String" />
                <asp:Parameter Name="AdultOnly" Type="Boolean" />
                <asp:Parameter Name="Flat" Type="Boolean" />
                <asp:Parameter Name="Active" Type="Boolean" />
                <asp:Parameter Name="Logo" Type="Object" />
                <asp:Parameter Name="MaxOccupancy" Type="Int16" />
                <asp:Parameter Name="Original_HotelID" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="hfUsername" Name="UserName" 
                    PropertyName="Value" Type="String" />
                <asp:ControlParameter ControlID="fltName" Name="Hotel" PropertyName="Text" 
                    Type="String" />
                <asp:ControlParameter ControlID="fltCity" Name="City" PropertyName="Text" 
                    Type="String" />
                <asp:ControlParameter ControlID="fltCountry" Name="Country" PropertyName="Text" 
                    Type="String" />
                <asp:ControlParameter ControlID="fltActive" Name="ActiveOnly" 
                    PropertyName="Checked" Type="Boolean" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="HotelID" Type="Int32" />
                <asp:Parameter Name="HotelHID" Type="String" />
                <asp:Parameter Name="Hotel" Type="String" />
                <asp:Parameter Name="RNC" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="ZipCode" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="Tel" Type="String" />
                <asp:Parameter Name="Fax" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Contact" Type="String" />
                <asp:Parameter Name="Bank" Type="String" />
                <asp:Parameter Name="BankAccount" Type="String" />
                <asp:Parameter Name="Rooms" Type="Int32" />
                <asp:Parameter Name="Htl_Titulo" Type="String" />
                <asp:Parameter Name="AdultOnly" Type="Boolean" />
                <asp:Parameter Name="Flat" Type="Boolean" />
                <asp:Parameter Name="Active" Type="Boolean" />
                <asp:Parameter Name="Logo" Type="Object" />
                <asp:Parameter Name="MaxOccupancy" Type="Int16" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <asp:ModalPopupExtender ID="popExtender" runat="server" 
            BackgroundCssClass="modalBackground" CancelControlID="btnNo" DropShadow="True" 
            PopupControlID="popPanel" PopupDragHandleControlID="popLabel" 
            TargetControlID="dummy" X="200" Y="200">
        </asp:ModalPopupExtender>
        <asp:Panel ID="popPanel" runat="server" BackColor="White" Style="display: none" 
            Width="300px">
            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td class="GridLabelBG">
                        <asp:Label ID="popLabel" runat="server" SkinID="skGridLabel" Text="Title"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="GridBorder">
                        <p style="text-align: center;">
                            <asp:Label ID="popMessage" runat="server" Text="Message"></asp:Label>
                        </p>
                        <p class="GridRow2T" style="text-align: right;">
                            <br />
                            <asp:Button ID="btnYes" runat="server" SkinID="skBtnBase" Text="Yes" />
                            &nbsp;
                            <asp:Button ID="btnNo" runat="server" SkinID="skBtnBase" Text="No" />
                            &nbsp;
                        </p>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
    <br />
</asp:Content>

