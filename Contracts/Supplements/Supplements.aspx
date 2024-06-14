<%@ Page Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="Supplements.aspx.vb" Inherits="Contracts_Supplements" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Supplements
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
                    <td class="GridLabelBG" style="width: 600px">
                        <asp:Label ID="lblFilter" runat="server" SkinID="skGridLabel">Search/Filter &nbsp;
                            <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />
                            &nbsp; </asp:Label>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px">
                    <asp:Panel ID="pnSearch" runat="server" CssClass="popupPanel">
                        <table cellpadding="0" cellspacing="0">
                            <asp:Panel ID="pnEditPart" runat="server" Style="width: 600px" DefaultButton="btnSerch">
                                <tr>
                                    <td class="GridRow2B" style="width: 100px; text-align: left;">
                                        Supplement
                                    </td>
                                    <td class="GridRow2B" style="width: 400px" align="left">
                                        <asp:TextBox ID="txtSuppID" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="txtSuppID"
                                            WatermarkCssClass="WaterMark" WatermarkText="Number" />
                                    </td>
                                    <td class="GridRow2B" style="width: 100px; text-align: right; padding-top: 5px; height: 30px;">
                                        <asp:Button ID="btnSerch" runat="server" SkinID="skBtnSerach" Style="margin-bottom: 5px;" />
                                    </td>
                                </tr>
                            </asp:Panel>
                            <asp:Panel ID="pnSearchPart" runat="server" Style="width: 600px" DefaultButton="Button1">
                                <tr>
                                    <td class="GridRow1B">Hotel</td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" DataSourceID="dsHotel"
                                            DataTextField="Hotel" DataValueField="HotelID" AppendDataBoundItems="True">
                                            <asp:ListItem Selected="True" Value="">all hotels.</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsHotel" runat="server" OldValuesParameterFormatString="original_{0}"
                                            SelectMethod="GetData" TypeName="SupplementsTableAdapters.SelectUserHotelTableAdapter">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Category</td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:DropDownList ID="ddlCategory" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                            DataSourceID="dsCategory" DataTextField="SupplementCategory" DataValueField="SupplementCategory">
                                            <asp:ListItem Selected="True" Value="">all categories</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsCategory" runat="server" OldValuesParameterFormatString="original_{0}"
                                            SelectMethod="GetData" TypeName="SupplementsTableAdapters.SupplementCategoryTableAdapter" >
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
                                    <td class="GridRow1B">Title</td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:TextBox ID="fltTitle" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="wmfltTitle" runat="server" TargetControlID="fltTitle"
                                            WatermarkCssClass="WaterMark" WatermarkText="Supplement Title (use% as wild card)" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Start</td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:TextBox ID="fltStart" runat="server" CssClass="TextBox" />
                                        <asp:CalendarExtender ID="fltStart_CalendarExtender" runat="server" Enabled="True"
                                            TargetControlID="fltStart" CssClass="cal_Theme1" />
                                        <asp:CompareValidator ID="fltStartDate" runat="server" ControlToValidate="fltStart"
                                            Display="None" ErrorMessage="Not a valid date!" Operator="DataTypeCheck" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="fltStartDateCallout" runat="server"
                                            Enabled="True" TargetControlID="fltStartDate" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">End</td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:TextBox ID="fltFinish" runat="server" CssClass="TextBox" />
                                        <asp:CalendarExtender ID="fltFinish_CalendarExtender" runat="server" Enabled="True"
                                            TargetControlID="fltFinish" CssClass="cal_Theme1" /> 
                                        <asp:CompareValidator ID="fltFinishDate" runat="server" ControlToValidate="fltFinish"
                                            Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="fltFinishDateCallout" runat="server"
                                            Enabled="True" TargetControlID="fltFinishDate" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Book.Start</td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:TextBox ID="fltBkStart" runat="server" CssClass="TextBox" />
                                        <asp:CalendarExtender ID="fltBkStart_CalendarExtender" runat="server" Enabled="True"
                                            TargetControlID="fltBkStart" CssClass="cal_Theme1" />
                                        <asp:CompareValidator ID="fltBkStartDate" runat="server" ControlToValidate="fltBkStart"
                                            Display="None" ErrorMessage="Not a valid date!" Operator="DataTypeCheck" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="fltBkStartDateCallout" runat="server"
                                            Enabled="True" TargetControlID="fltBkStartDate" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Book.End</td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:TextBox ID="fltBkFinish" runat="server" CssClass="TextBox" />
                                        <asp:CalendarExtender ID="fltBkFinish_CalendarExtender" runat="server" Enabled="True"
                                            TargetControlID="fltFinish" CssClass="cal_Theme1" /> 
                                        <asp:CompareValidator ID="fltBkFinishDate" runat="server" ControlToValidate="fltBkFinish"
                                            Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="fltBkFinishDateCallout" runat="server"
                                            Enabled="True" TargetControlID="fltBkFinishDate" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Options</td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:DropDownList ID="fltIsPercent" runat="server" CssClass="TextBox">
                                            <asp:ListItem Selected="True" Value="">Percent/Amount</asp:ListItem>
                                            <asp:ListItem Value="1">Percent</asp:ListItem>
                                            <asp:ListItem Value="0">Amount</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="fltPerPax" runat="server" CssClass="TextBox">
                                            <asp:ListItem Selected="True" Value="">PerPax/PerRoom</asp:ListItem>
                                            <asp:ListItem Value="1">PerPax</asp:ListItem>
                                            <asp:ListItem Value="0">PerRoom</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="fltPerDay" runat="server" CssClass="TextBox">
                                            <asp:ListItem Selected="True" Value="">PerDay/PerStay</asp:ListItem>
                                            <asp:ListItem Value="1">PerDay</asp:ListItem>
                                            <asp:ListItem Value="0">PerStay</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">State</td>
                                    <td class="GridRow1B" colspan="2">
                                        <asp:DropDownList ID="ddlState" runat="server" CssClass="TextBox">
                                            <asp:ListItem Selected="True" Value="">all states</asp:ListItem>
                                            <asp:ListItem Value="1">Active</asp:ListItem>
                                            <asp:ListItem Value="0">Inactive</asp:ListItem>
                                            <asp:ListItem Value="-2">Suspended</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear">Rate Recieved</td>
                                    <td class="GridRowClear" colspan="2">
                                        <asp:TextBox ID="fltRateRecieved" runat="server" CssClass="TextBox" />
                                        <asp:CalendarExtender ID="fltRateRecieved_CalendarExtender" runat="server" Enabled="True"
                                            TargetControlID="fltRateRecieved" CssClass="cal_Theme1" /> 
                                        <asp:CompareValidator ID="fltRateRecievedDate" runat="server" ControlToValidate="fltRateRecieved"
                                            Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="fltRateRecievedDateCallout" runat="server"
                                            Enabled="True" TargetControlID="fltBkFinishDate" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" class="ComandRow2T" style="height: 30px; padding-top: 5px">
                                        <asp:Button ID="Button1" runat="server" SkinID="skBtnFilter" />
                                        &nbsp;
                                        <asp:Button ID="Button2" runat="server" SkinID="skBtnClear" />
                                    </td>
                                </tr>
                            </asp:Panel>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <asp:Panel runat="server" ID="pnlCnt" Visible="False">
                <tr>
                    <td class="GridLabelBG">
                        <asp:Label ID="lbHotels" runat="server" SkinID="skGridLabel" Text="Supplements"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="GridBorder">
                        <asp:GridView ID="gvSpecials" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            DataKeyNames="SupplementID" DataSourceID="dsFilteredSupplements" PageSize="20"
                            SkinID="skGridView">
                            <RowStyle Wrap="False" />
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandArgument='<%# Eval("SupplementID") %>'
                                            CommandName="Details" ImageUrl="~/Images/Leads.gif" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width="25px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="SupplementID" HeaderText="Nr" ReadOnly="True" SortExpression="SupplementID"
                                    Visible="True">
                                    <ItemStyle HorizontalAlign="Left" Width="50px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title">
                                    <ItemStyle Width="200px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle Width="200px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Hotel" HeaderText="Hotel" SortExpression="Hotel">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle Width="350px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Start" DataFormatString="{0:d}" HeaderText="Start"
                                    HtmlEncode="False" SortExpression="Start">
                                    <ItemStyle Width="90px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Finish" DataFormatString="{0:d}" HeaderText="End"
                                    HtmlEncode="False" SortExpression="Finish">
                                    <ItemStyle Width="90px" />
                                </asp:BoundField>
                            </Columns>
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:GridView>
                        <asp:ObjectDataSource ID="dsFilteredSupplements" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="SupplementsTableAdapters.FilterCSupplementTableAdapter">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
            </asp:Panel>
            <tr>
                <td style="text-align: right; padding-top: 5px; height: 30px;">
                    <asp:Button ID="linkNew" runat="server" Text="New Supplement" SkinID="skBtnBase" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
