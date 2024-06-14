<%@ Page Title="" Language="VB" MasterPageFile="~/Contracts/Create/masterNewCnt.master" MaintainScrollPositionOnPostback="true" 
    AutoEventWireup="false" CodeFile="CreateFromContract.aspx.vb" Inherits="Contracts_Create_CreateFromContract" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Create From Contract
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CreateCntContent" runat="Server">
    <div class="Green">
        <asp:CollapsiblePanelExtender ID="cpeCtrSearch" runat="server" TargetControlID="pnCtrSearch"
            CollapseControlID="lblCtrFilter" ExpandControlID="lblCtrFilter" ImageControlID="imgExpander"
            CollapsedImage="~/Images/expand_.png" ExpandedImage="~/Images/collapse_.png"
            Collapsed="False">
        </asp:CollapsiblePanelExtender>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG" width="600px">
                    <asp:Label ID="lblCtrFilter" runat="server" SkinID="skGridLabel">Search/Filter for Contract&nbsp;
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/collapse_.png" />&nbsp; 
                    </asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px">
                    <asp:Panel ID="pnCtrSearch" runat="server" DefaultButton="btCtrSearch">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="GridRow2B" style="width: 100px; text-align: left;">Contract ID</td>
                                <td class="GridRow2B" style="width: 400px" align="left">
                                    <asp:TextBox ID="txtContID" runat="server" CssClass="TextBox" Width="400px" />
                                </td>
                                <td class="GridRow2B" style="width: 100px; text-align: right;" >
                                    <asp:Button ID="btnCtrSelect" runat="server" SkinID="skBtnSerach" Text="Select"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Title</td>
                                <td class="GridRow1B" colspan="2">
                                    <asp:TextBox ID="fltName" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="fltName"
                                        WatermarkCssClass="WaterMark" WatermarkText="Contract title (use % as wildchar)" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Hotel</td>
                                <td class="GridRow1B" colspan="2">
                                    <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" DataSourceID="dsHotel"
                                        DataTextField="Hotel" DataValueField="HotelID" AppendDataBoundItems="True" AutoPostBack="false">
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
                                <td class="GridRow1B">Market</td>
                                <td class="GridRow1B" colspan="2">
                                    <asp:DropDownList ID="ddlMarkets" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsCtrMarkets" DataTextField="Market" DataValueField="MarketID">
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsCtrMarkets" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="TourOperTableAdapters.MarketTableAdapter" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Tour Operator</td>
                                <td class="GridRow1B" colspan="2">
                                    <asp:DropDownList ID="ddlTO" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsTO" DataTextField="TourOp" DataValueField="TourOpID">
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsTO" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="ContractsTableAdapters.SelectUserTourOpTableAdapter">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Rate Code</td>
                                <td class="GridRow1B" colspan="2">
                                    <asp:TextBox ID="fltRateCode" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="fltRateCode_TextBoxWatermarkExtender" 
                                        runat="server" TargetControlID="fltRateCode" WatermarkCssClass="WaterMark" 
                                        WatermarkText="Rate Code" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Start</td>
                                <td class="GridRow1B" colspan="2">
                                    <asp:TextBox ID="fltStart" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="wmfltStart" runat="server" TargetControlID="fltStart"
                                            WatermarkCssClass="WaterMark" 
                                            WatermarkText="Contract start date equal or greater than..." />
                                        <asp:CompareValidator ID="fltStart_CompareValidator" runat="server" 
                                            ControlToValidate="fltStart" Display="None" ErrorMessage="Only date input" 
                                            Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                        <asp:ValidatorCalloutExtender ID="fltStart_ValidatorCalloutExtender" runat="server"
                                            Enabled="True" TargetControlID="fltStart_CompareValidator">
                                        </asp:ValidatorCalloutExtender>
                                    <asp:CalendarExtender ID="fltStart_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="fltStart" CssClass="cal_Theme1">
                                    </asp:CalendarExtender>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear">End</td>
                                <td class="GridRowClear" colspan="2">
                                    <asp:TextBox ID="fltFinish" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="wmfltFinish" runat="server" 
                                            TargetControlID="fltFinish" WatermarkCssClass="WaterMark" 
                                            WatermarkText="Contract end date equal or less than..." />
                                        <asp:CompareValidator ID="fltFinish_CompareValidator" runat="server" 
                                            ControlToValidate="fltFinish" Display="None" ErrorMessage="Only date input" 
                                            Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                        <asp:ValidatorCalloutExtender ID="fltFinish_ValidatorCalloutExtender" 
                                            runat="server" Enabled="True" TargetControlID="fltFinish_CompareValidator">
                                        </asp:ValidatorCalloutExtender>
                                    <asp:CalendarExtender ID="fltFinish_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="fltFinish" CssClass="cal_Theme1">
                                    </asp:CalendarExtender>
                                </td>
                            </tr>
                            <%--<tr>
                                <td class="GridRowClear">State</td>
                                <td class="GridRowClear" colspan="2">
                                    <asp:DropDownList ID="ddlState" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsCntState" DataTextField="ContractState" DataValueField="ContractStateID">
                                        <asp:ListItem Selected="True" Value="">all states</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsCntState" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="ContractsTableAdapters.ContractStateTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>--%>
                            <tr>
                                <td colspan="3" class="ComandRow2T">
                                    <asp:Button ID="btCtrSearch" runat="server" SkinID="skBtnFilter" />&nbsp;
                                    <asp:Button ID="btCtrClear" runat="server" SkinID="skBtnClear" />
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
                    <asp:Label ID="lbContracts" runat="server" Text="Contracts" SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder" style="min-width: 616px;">
                    <asp:GridView ID="gvContracts" runat="server" DataSourceID="dsFilteredContracts"
                        DataKeyNames="ContractID,Title" SkinID="skGridView" AutoGenerateColumns="False"
                        AllowPaging="True" SelectedIndex="0" Visible="False" EnableModelValidation="True">
                        <RowStyle Wrap="False" />
                        <Columns>
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" ShowSelectButton="True">
                                <ItemStyle Width="25px" />
                            </asp:CommandField>
                            <asp:TemplateField SortExpression="ContractID">
                                <ItemTemplate>
                                    (<asp:Label ID="Label1" runat="server" Text='<%# Bind("ContractID") %>' />)
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" Width="50px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="RateCodeId" HeaderText="Rt.Code" SortExpression="RateCodeId">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="250px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Hotel" HeaderText="Hotel" SortExpression="Hotel">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="330px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TourOp" HeaderText="Tour Operator" SortExpression="TourOpId">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="330px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Start" DataFormatString="{0:d}" HeaderText="Start"
                                HtmlEncode="False" SortExpression="Start">
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Finish" DataFormatString="{0:d}" HeaderText="End"
                                HtmlEncode="False" SortExpression="Finish">
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div style="width: 600px;">
                                No contract found for specified filter.
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="dsFilteredContracts" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetDataForFilterByID" TypeName="ContractsTableAdapters.ContractTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
                            <asp:Parameter DefaultValue="false" Name="Template" Type="Boolean" />
                            <asp:ControlParameter ControlID="ddlMarkets" Name="MarketId" PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="ddlTO" Name="TourOpId" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="fltName" Name="Title" PropertyName="Text" Type="String" />
                            <asp:Parameter Name="Year" Type="Int32" DefaultValue="" />
                            <asp:ControlParameter ControlID="fltStart" Name="Start" PropertyName="Text" Type="DateTime" />
                            <asp:ControlParameter ControlID="fltFinish" Name="Finish" PropertyName="Text" Type="DateTime" />
                            <asp:Parameter Name="StateId" Type="Int32" DefaultValue="" />
                            <asp:ControlParameter ControlID="fltRateCode" Name="RateCodeID" PropertyName="Text" Type="String" />
                            <asp:Parameter Name="ContractID" Type="Int32" DefaultValue="" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="dsSelectContract" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetDataForFilterByID" TypeName="ContractsTableAdapters.ContractTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
                            <asp:Parameter Name="Template" Type="Boolean" DefaultValue="false" />
                            <asp:Parameter Name="MarketId" Type="String" DefaultValue="" />
                            <asp:Parameter Name="HotelId" Type="Int32" DefaultValue="" />
                            <asp:Parameter Name="TourOpId" Type="Int32" DefaultValue="" />
                            <asp:Parameter Name="Title" Type="String" DefaultValue="" />
                            <asp:Parameter Name="Year" Type="Int32" DefaultValue="" />
                            <asp:Parameter Name="Start" Type="DateTime" DefaultValue="" />
                            <asp:Parameter Name="Finish" Type="DateTime" DefaultValue="" />
                            <asp:Parameter Name="StateId" Type="Int32" DefaultValue="" />
                            <asp:Parameter Name="RateCodeID" Type="String" DefaultValue="" />
                            <asp:ControlParameter ControlID="txtContID" Name="ContractID" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div class="Green">
        <asp:CollapsiblePanelExtender ID="cpeCtrTourOp" runat="server" TargetControlID="pnToSearch"
            CollapseControlID="lblToFilter" ExpandControlID="lblToFilter" ImageControlID="imgExpander"
            CollapsedImage="~/Images/expand_.png" ExpandedImage="~/Images/collapse_.png"
            Collapsed="False">
        </asp:CollapsiblePanelExtender>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG" width="600px">
                    <asp:Label ID="lblToFilter" runat="server" SkinID="skGridLabel">
                        Search/Filter for TO&nbsp;
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/collapse_.png" />&nbsp; 
                    </asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:Panel ID="pnToSearch" runat="server" DefaultButton="btToSearch">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="GridRow1B" style="width: 100px;">Name</td>
                                <td class="GridRow1B" style="width: 500px;">
                                    <asp:TextBox ID="fltNameTO" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="fltNameExt" runat="server" TargetControlID="fltNameTO"
                                        WatermarkCssClass="WaterMark" WatermarkText="TourOperator name (use % as wildchar)"
                                        Enabled="True" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Market</td>
                                <td class="GridRow1B">
                                    <asp:DropDownList ID="ddlMarketsTO" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsMarketsTO" DataTextField="Market" DataValueField="MarketID" >
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsMarketsTO" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="TourOperTableAdapters.MarketTableAdapter" />
                                </td>
                            </tr>
                            <%--<tr>
                                <td class="GridRow1B">City</td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="fltCityTO" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="fltCityExt" runat="server" TargetControlID="fltCityTO"
                                        WatermarkCssClass="WaterMark" WatermarkText="City name (use % as wildchar)" Enabled="True" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Country</td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="fltCountryTO" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="fltCountryExt" runat="server" TargetControlID="fltCountryTO"
                                        WatermarkCssClass="WaterMark" WatermarkText="Country name (use % as wildchar)"
                                        Enabled="True" />
                                </td>
                            </tr>--%>
                            <tr>
                                <td class="GridRowClear">Pay Condition</td>
                                <td class="GridRowClear">
                                    <asp:DropDownList ID="ddlPay" runat="server" CssClass="TextBox" DataSourceID="dsPayCond"
                                        DataTextField="PayCond" DataValueField="PayCondID" AppendDataBoundItems="True" >
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsPayCond" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="TourOperTableAdapters.PayCondTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="ComandRow2T">
                                    <asp:CheckBox ID="fltActiveTO" runat="server" Text="Show only active TO" Checked="True" AutoPostBack="False" />&nbsp;
                                    <asp:Button ID="btToSearch" runat="server" SkinID="skBtnFilter" />&nbsp;
                                    <asp:Button ID="btToClear" runat="server" SkinID="skBtnClear" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    <asp:ObjectDataSource ID="dsTOSearch" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataForFilter" TypeName="TourOperTableAdapters.TourOpTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
            <asp:ControlParameter ControlID="fltNameTO" Name="TourOp" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="ddlMarketsTO" Name="MarketID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlPay" Name="PayCondID" PropertyName="SelectedValue" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="Created" Type="String" />
            <asp:ControlParameter ControlID="fltActiveTO" Name="ActiveOnly" PropertyName="Checked" Type="Boolean" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblTOs" runat="server" Text="Tour Operators" SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder" style="min-width: 616px;">
                    <asp:GridView ID="gvTO" runat="server" DataSourceID="dsTOSearch" SkinID="skGridView"
                        SelectedIndex="-1" DataKeyNames="TourOpID,TourOp" AllowPaging="True" Visible="False"
                        EnableModelValidation="True">
                        <Columns>
                            <asp:TemplateField HeaderText="Create">
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbSel" runat="server" />
                                </ItemTemplate>
                                <ItemStyle Width="50px" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate><div style="text-align:right;">± Rate</div></HeaderTemplate>
                                <ItemTemplate>
                                    <asp:TextBox ID="txtRateChange" runat="server" CssClass="TextBox" Text="0" ToolTip="Enter negative number for discount" />
                                    <asp:RequiredFieldValidator ID="rfvChange" runat="server" ControlToValidate="txtRateChange"
                                        Display="None" ErrorMessage="Required field" Visible="False" />
                                    <asp:ValidatorCalloutExtender ID="rfvChange_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="rfvChange" />
                                    <asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="txtRateChange"
                                        Display="None" ErrorMessage="Number input" Operator="DataTypeCheck" Type="Double" />
                                    <asp:ValidatorCalloutExtender ID="CompareValidator7_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator7" />
                                </ItemTemplate>
                                <ItemStyle Width="60px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Change">
                                <ItemTemplate>
                                    <asp:RadioButtonList ID="rbChType" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Text="%" Value="%" Selected="True" />
                                        <asp:ListItem Text="$" Value="$" Selected="False" />
                                    </asp:RadioButtonList>
                                </ItemTemplate>
                                <ItemStyle Width="80px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="TourOpID" SortExpression="TourOpID" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="txtTOID" runat="server" Text='<%# Bind("TourOpID") %>' />
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="TourOp" HeaderText="TourOperator" SortExpression="TourOp">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="350px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PayCondId" HeaderText="PayCond" SortExpression="PayCondId" >
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle Width="50px" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MarketId" HeaderText="Market" SortExpression="MarketId">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle Width="50px" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <%--<asp:BoundField DataField="Address" Visible="False" HeaderText="Address" SortExpression="Address">
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="120px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="120px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Tel1" HeaderText="Tel" SortExpression="Tel">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="150px" />
                            </asp:BoundField>--%>
                            <asp:CheckBoxField DataField="Active" HeaderText="A" SortExpression="Active" >
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle Width="50px" />
                            </asp:CheckBoxField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div style="width: 600px;">
                                No tour operators found for specified filter.
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                    <div style="text-align: right; padding-top: 10px; height: 30px;">
                        <asp:Button ID="btCtrCreate" runat="server" BorderStyle="None" CssClass="Button" ForeColor="White"
                            Text="Create for selected TO" />
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div class="Blue">
        <asp:HiddenField ID="dummy" runat="server" />
        <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
            PopupDragHandleControlID="popLabel" CancelControlID="btnNo" DropShadow="True"
            BackgroundCssClass="modalBackground" TargetControlID="dummy" X="200" Y="200">
        </asp:ModalPopupExtender>
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
                            <asp:Label ID="popMessage" runat="server" Text="Message" />
                        </p>
                        <p style="text-align: right;" class="GridRow2T">
                            <br />
                            <asp:Button ID="btnNo" runat="server" Text="OK" SkinID="skBtnBase" />&nbsp;
                        </p>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
    <div class="Red">
        <asp:HiddenField ID="hfCreatedContracts" runat="server" Value="" />
        <asp:ModalPopupExtender ID="modResults" runat="server" PopupControlID="popResults"
            DropShadow="True" BackgroundCssClass="modalBackground" TargetControlID="dummy"
            CancelControlID="btResClose" X="10" Y="450">
        </asp:ModalPopupExtender>
        <asp:Panel ID="popResults" runat="server" BackColor="White" Style="display: none">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblResult" runat="server" Text="Created Contracts" SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder" style="min-width: 616px;">
                    <asp:GridView ID="gvResult" runat="server" SkinID="skGridView" AutoGenerateColumns="False"
                        AllowPaging="False" SelectedIndex="-1" Visible="False" EnableModelValidation="True">
                        <RowStyle Wrap="False" />
                        <Columns>
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" ShowSelectButton="True" />
                            <asp:TemplateField SortExpression="ContractID">
                                <ItemTemplate>
                                    (<asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("ContractID") %>' NavigateUrl='<%# "~/Contracts/ContractOverview.aspx?ContractID=" & Eval("ContractID") %>' />)
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" Width="50px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="RateCodeId" HeaderText="Rt.Code" SortExpression="RateCodeId">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="250px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Hotel" HeaderText="Hotel" SortExpression="Hotel">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="330px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TourOp" HeaderText="Tour Operator" SortExpression="TourOpId">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="330px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Start" DataFormatString="{0:d}" HeaderText="Start"
                                HtmlEncode="False" SortExpression="Start">
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Finish" DataFormatString="{0:d}" HeaderText="End"
                                HtmlEncode="False" SortExpression="Finish">
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div style="width: 600px;">
                                No contracts are created.
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                    <br />
                    <asp:Label ID="lblTotalCreated" runat="server" Font-Bold="true" />
                    <br />
                    <asp:Label ID="lblTotalErrors" runat="server" Font-Bold="true" />
                    <div style="text-align: right;">
                        <asp:Button ID="btResClose" runat="server" Text="Close" SkinID="skBtnBase" />
                    </div>
                </td>
            </tr>
        </table>
        </asp:Panel>
    </div>
</asp:Content>
