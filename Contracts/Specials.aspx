<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="true"
    CodeFile="Specials.aspx.vb" Inherits="Contracts_Specials" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Specials
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" runat="Server">
    <asp:HiddenField ID="hfUsername" runat="server" />
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
                    <asp:Panel ID="pnSearch" runat="server" CssClass="popupPanel">
                        <asp:Panel ID="pnEditPart" runat="server" Style="width: 600px" DefaultButton="btnSerch">
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="GridRow2B" style="width: 100px; text-align: left;">
                                        Special
                                    </td>
                                    <td class="GridRow2B" style="width: 400px" align="left">
                                        <asp:TextBox ID="txtSpecID" runat="server" CssClass="TextBox" ></asp:TextBox>
                                        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="txtSpecID"
                                            WatermarkCssClass="WaterMark" WatermarkText="Special ID" />
                                    </td>
                                    <td class="GridRow2B" style="width: 100px; text-align: right; padding-top: 5px; height: 30px;">
                                        <asp:Button ID="btnSerch" runat="server" SkinID="skBtnSerach" Style="margin-bottom: 5px;" Text="Details" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="pnSearchPart" runat="server" Style="width: 600px" DefaultButton="btnFilter">
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="GridRow1B" style="width: 100px;">Hotel</td>
                                    <td class="GridRow1B" style="width: 500px;">
                                        <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" DataSourceID="dsHotel"
                                            DataTextField="Hotel" DataValueField="HotelID" AppendDataBoundItems="True">
                                            <asp:ListItem Selected="True" Value="">all hotels</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsHotel" runat="server" OldValuesParameterFormatString="original_{0}"
                                            SelectMethod="GetData" TypeName="dsSpecialTableAdapters.HotelTableAdapter">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Tour Operator</td>
                                    <td class="GridRow1B">
                                        <asp:DropDownList ID="ddlTO" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                            DataSourceID="dsTO" DataTextField="TourOp" DataValueField="TourOpID">
                                            <asp:ListItem Selected="True" Value="">all Tour Operators</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsTO" runat="server" 
                                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByUser" 
                                            TypeName="TourOperTableAdapters.TourOpTableAdapter">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="hfUsername" Name="User" PropertyName="Value" Type="String" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Rate Type</td>
                                    <td class="GridRow1B">
                                        <asp:DropDownList ID="ddlRateType" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                            DataSourceID="dsRateType" DataTextField="RateTypeID" DataValueField="RateTypeID">
                                            <asp:ListItem Selected="True" Value="">all rate types</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsRateType" runat="server" OldValuesParameterFormatString="original_{0}"
                                            SelectMethod="GetSpecialRate" TypeName="dsSpecialTableAdapters.RateTypeTableAdapter">
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Rate Code</td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="fltRateCode" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="fltRateCode_TextBoxWatermarkExtender" 
                                            runat="server" TargetControlID="fltRateCode" WatermarkCssClass="WaterMark" 
                                            WatermarkText="Rate Code" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Book.Code</td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="fltBkCode" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="wmfltBkCode" 
                                            runat="server" TargetControlID="fltBkCode" WatermarkCssClass="WaterMark" 
                                            WatermarkText="Booking Code" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Title</td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="fltTitle" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="wmfltTitle" runat="server" TargetControlID="fltTitle"
                                            WatermarkCssClass="WaterMark" WatermarkText="Special title (use % as wildchar)" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Start</td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="fltStart" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="wmfltStart" runat="server" TargetControlID="fltStart"
                                            WatermarkCssClass="WaterMark" WatermarkText="Travel start date equal or greater than..." />
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
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="fltFinish" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="wmfltFinish" runat="server" TargetControlID="fltFinish"
                                            WatermarkCssClass="WaterMark" WatermarkText="Travel end date equal or less than..." />
                                        <asp:CalendarExtender ID="fltFinish_CalendarExtender" runat="server" Enabled="True"
                                            TargetControlID="fltFinish" CssClass="cal_Theme1" /> 
                                        <asp:CompareValidator ID="fltFinishDate" runat="server" ControlToValidate="fltFinish"
                                            Display="None" ErrorMessage="Not a valid date!" Operator="DataTypeCheck" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="fltFinishDateCallout" runat="server"
                                            Enabled="True" TargetControlID="fltFinishDate" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Book.Start</td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="fltBkStart" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="wmfltBkStart" runat="server" TargetControlID="fltBkStart"
                                            WatermarkCssClass="WaterMark" WatermarkText="Booking start date equal or less than..." />
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
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="fltBkFinish" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="wmfltBkFinish" runat="server" TargetControlID="fltBkFinish"
                                            WatermarkCssClass="WaterMark" WatermarkText="Booking end date equal or less than..." />
                                        <asp:CalendarExtender ID="fltBkFinish_CalendarExtender" runat="server" Enabled="True"
                                            TargetControlID="fltBkFinish" CssClass="cal_Theme1" /> 
                                        <asp:CompareValidator ID="fltBkFinishDate" runat="server" ControlToValidate="fltBkFinish"
                                            Display="None" ErrorMessage="Not a valid date!" Operator="DataTypeCheck" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="fltBkFinishDateCallout" runat="server"
                                            Enabled="True" TargetControlID="fltBkFinishDate" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">Discount</td>
                                    <td class="GridRow1B">
                                        <asp:DropDownList ID="ddlDiscount" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                            DataSourceID="dsDiscount" DataTextField="DiscountType" DataValueField="DiscountTypeID">
                                            <asp:ListItem Selected="True" Value="">all discount types</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsDiscount" runat="server" OldValuesParameterFormatString="original_{0}"
                                            SelectMethod="GetData" TypeName="dsSpecialTableAdapters.SpecialDiscountTypeTableAdapter">
                                        </asp:ObjectDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">State</td>
                                    <td class="GridRow1B">
                                        <asp:DropDownList ID="ddlState" runat="server" CssClass="TextBox">
                                            <asp:ListItem Selected="True" Value="">all states</asp:ListItem>
                                            <asp:ListItem Value="1">Active</asp:ListItem>
                                            <asp:ListItem Value="0">Inactive</asp:ListItem>
                                            <asp:ListItem Value="-1">Suspended</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear">Rate Recieved</td>
                                    <td class="GridRowClear">
                                        <asp:TextBox ID="fltRateRecieved" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="wmfltRateRecieved" runat="server" TargetControlID="fltRateRecieved"
                                            WatermarkCssClass="WaterMark" WatermarkText="Booking end date equal or less than..." />
                                        <asp:CalendarExtender ID="fltRateRecieved_CalendarExtender" runat="server" Enabled="True"
                                            TargetControlID="fltRateRecieved" CssClass="cal_Theme1" /> 
                                        <asp:CompareValidator ID="fltRateRecievedDate" runat="server" ControlToValidate="fltRateRecieved"
                                            Display="None" ErrorMessage="Not a valid date!" Operator="DataTypeCheck" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="fltRateRecievedDateCallout" runat="server"
                                            Enabled="True" TargetControlID="fltBkFinishDate" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="ComandRow2T" style="height: 30px; padding-top: 5px">
                                        <asp:Button ID="btnFilter" runat="server" SkinID="skBtnFilter" />&nbsp;
                                        <asp:Button ID="btnClear" runat="server" SkinID="skBtnClear" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div class="Blue">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table cellpadding="0" cellspacing="0">
                    <asp:Panel runat="server" ID="pnlCnt" Visible="False">
                        <tr>
                            <td class="GridLabelBG">
                                <asp:Label ID="lbHotels" runat="server" SkinID="skGridLabel" Text="Specials"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="GridBorder">
                                <asp:Panel ID="Panel1" runat="server" ScrollBars="Vertical" Height="600">
                                <asp:GridView ID="gvSpecials" runat="server" AutoGenerateColumns="False"
                                    DataKeyNames="SpecialID" DataSourceID="dsFilteredSpecials" SkinID="skGridView">
                                    <RowStyle Wrap="False" />
                                    <Columns>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Details"
                                                    CommandArgument='<%# Eval("SpecialID") %>' ImageUrl="~/Images/Leads.gif" />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" Width="25px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="" SortExpression="ContractID">
                                            <ItemTemplate>
                                                (<asp:HyperLink ID="hypID" runat="server" 
                                                    NavigateUrl='<%# "~/Contracts/Special/DetailSpec.aspx?SpecialID=" & Eval("SpecialID") %>' 
                                                    Text='<%# Eval("SpecialID") %>' />)
                                            </ItemTemplate>
                                            <ItemStyle Width="50px" HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Rate Code" SortExpression="RateCodeId">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="hypRateCode" runat="server" 
                                                    NavigateUrl='<%# "~/Contracts/Special/DetailSpec.aspx?SpecialID=" & Eval("SpecialID") %>' 
                                                    Text='<%# Eval("RateCodeId") %>'
                                                    ToolTip='<%# Eval("Description") %>'  />
                                            </ItemTemplate>
                                            <ItemStyle Width="100px" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Title" SortExpression="Title">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="hypTitle" runat="server" 
                                                    NavigateUrl='<%# "~/Contracts/Special/DetailSpec.aspx?SpecialID=" & Eval("SpecialID") %>' 
                                                    Text='<%# Eval("Title") %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="400px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="RateTypeId" HeaderText="Rate Type" SortExpression="RateTypeId">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Hotel" HeaderText="Hotel" SortExpression="Hotel">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle Width="350px" Wrap="True" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Start" DataFormatString="{0:d}" HeaderText="Start"
                                            HtmlEncode="False" SortExpression="Start">
                                            <ItemStyle Width="90px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Finish" DataFormatString="{0:d}" HeaderText="End"
                                            HtmlEncode="False" SortExpression="Finish">
                                            <ItemStyle Width="90px" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="FR" SortExpression="PrDiscountTypeId">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("PrDiscountTypeId")=6 %>' Enabled="False" />
                                            </ItemTemplate>
                                            <ItemStyle Width="50px" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="State" SortExpression="StateId">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="Suspended" Visible='<%# Eval("StateId")<0 %>' />
                                                <asp:Label ID="Label2" runat="server" Text="Inactive" Visible='<%# Eval("StateId")=0 %>' />
                                                <asp:Label ID="Label3" runat="server" Text="Active" Visible='<%# Eval("StateId")>0 %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="60px" HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                    <div style="width:500px">
                                        No specials found for search criteria. Try change filters.
                                    </div>
                                    </EmptyDataTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:GridView>
                                </asp:Panel>
                            </td>
                        </tr>
                    </asp:Panel>
                    <tr>
                        <td style="text-align: right; padding-top: 5px; height: 30px;">
                            <asp:Button ID="linkNew" runat="server" Text="New Special" SkinID="skBtnBase" />
                        </td>
                    </tr>
                </table>
                <asp:ObjectDataSource ID="dsFilteredSpecials" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" 
                    TypeName="dsSpecialTableAdapters.FilterUserSpecialFullTableAdapter" >
                    <SelectParameters>
                        <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
                        <asp:ControlParameter ControlID="txtSpecID" Name="SpecialID" PropertyName="Text" Type="Int32" />
                        <asp:ControlParameter ControlID="ddlHotel" Name="HotelID" PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="fltRateCode" Name="RateCodeID" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="ddlRateType" Name="RateTypeID" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="fltTitle" Name="Title" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="fltStart" Name="Start" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="fltFinish" Name="Finish" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="fltBkStart" Name="BkStart" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="fltBkFinish" Name="BkFinish" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="fltBkCode" Name="BookingCode" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="ddlDiscount" Name="DiscountType" PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="ddlState" Name="State" PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="fltRateRecieved" Name="RateRecieved" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="ddlTO" Name="TourOpId" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
