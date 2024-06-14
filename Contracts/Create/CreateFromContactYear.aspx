<%@ Page Title="" Language="VB" MasterPageFile="~/Contracts/Create/masterNewCnt.master" MaintainScrollPositionOnPostback="true" 
    AutoEventWireup="false" CodeFile="CreateFromContactYear.aspx.vb" Inherits="Contracts_Create_CreateFromContactYear" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Create For Specified Year
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
                                    <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" runat="server" TargetControlID="fltName"
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
    <div class="Red">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG" width="600px">
                    <asp:Label ID="lblParams" runat="server" Text="Contracts Parameters" SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:Panel ID="pnParams" runat="server" DefaultButton="btnCreate">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="width: 100px" class="GridRow1B">Year</td>
                                <td style="width: 500px" class="GridRow1B" colspan="2">
                                    <asp:TextBox ID="txtYear" runat="server" CssClass="TextBox" MaxLength="4" />
                                    <asp:CompareValidator ID="intYear" runat="server" ControlToValidate="txtYear"
                                        ValidationGroup="Params" Display="None" ErrorMessage="Four digit input is required" Operator="DataTypeCheck" Type="Integer" />
                                    <asp:ValidatorCalloutExtender ID="intYear_ValidatorCalloutExtender" runat="server" 
                                        Enabled="True" TargetControlID="intYear" />
                                    <asp:RequiredFieldValidator ID="reqYear" runat="server" ControlToValidate="txtYear"
                                        ValidationGroup="Params" Display="None" ErrorMessage="Required field" />
                                    <asp:ValidatorCalloutExtender ID="reqYear_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="reqYear" />
                                    <asp:RangeValidator ID="rngYear" runat="server" Type="Integer"
                                        ValidationGroup="Params" Display="None" ErrorMessage="Pemited values are from 2010 to 2100" 
                                        ControlToValidate="txtYear" MaximumValue="2100" MinimumValue="2010" />
                                    <asp:ValidatorCalloutExtender ID="rngYear_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="rngYear" />
                                    <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" Enabled="True"
                                        TargetControlID="txtYear" WatermarkCssClass="WaterMark" WatermarkText="Year of start date for the new contract" />
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Title</td>
                                <td class="GridRow1B" colspan="2">
                                    <asp:DropDownList ID="ddlTitle" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                        DataSourceID="dsContractTitle" DataTextField="ContractTitle" DataValueField="ContractTitle">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsContractTitle" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="ContractsTableAdapters.ContractTitleTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear">± Rate Change</td>
                                <td class="GridRowClear" style="width: 60px;">
                                    <asp:TextBox ID="txtRateChange" runat="server" CssClass="TextBox" Text="0" ToolTip="Enter negative number for discount" />
                                    <asp:RequiredFieldValidator ID="reqChange" runat="server" ControlToValidate="txtRateChange"
                                        ValidationGroup="Params" Display="None" ErrorMessage="Required field"/>
                                    <asp:ValidatorCalloutExtender ID="reqChange_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="reqChange" />
                                    <asp:CompareValidator ID="decChange" runat="server" ControlToValidate="txtRateChange"
                                        ValidationGroup="Params" Display="None" ErrorMessage="Number input" Operator="DataTypeCheck" Type="Double" />
                                    <asp:ValidatorCalloutExtender ID="decChange_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="decChange" />
                                </td>
                                <td class="GridRowClear">
                                    <asp:RadioButtonList ID="rbChType" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Text="%" Value="%" Selected="True" />
                                        <asp:ListItem Text="$" Value="$" Selected="False" />
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" class="ComandRow2T">
                                    <asp:Button ID="btnCreate" runat="server" SkinID="skBtnBase" Text="Create Contract" ValidationGroup="Params" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel> 
                </td>
            </tr>
        </table>
    </div>
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
            CancelControlID="btResClose" X="10" Y="250">
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
