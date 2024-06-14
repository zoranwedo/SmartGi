<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" CodeFile="Groups.aspx.vb" Inherits="Contracts_Groups" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Special Groups
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
                    <asp:Panel ID="pnSearch" runat="server" CssClass="popupPanel">
                        <asp:Panel ID="pnEditPart" runat="server" Style="width: 600px" DefaultButton="btnSerch">
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="GridRow2B" style="width: 100px; text-align: left;">
                                        Group
                                    </td>
                                    <td class="GridRow2B" style="width: 400px" align="left">
                                        <asp:TextBox ID="txtGroupID" runat="server" CssClass="TextBox" ></asp:TextBox>
                                        <asp:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server" TargetControlID="txtGroupID"
                                            WatermarkCssClass="WaterMark" WatermarkText="Group ID" />
                                    </td>
                                    <td class="GridRow2B" style="width: 100px; text-align: right; padding-top: 5px; height: 30px;">
                                        <asp:Button ID="btnSerch" runat="server" SkinID="skBtnSerach" Style="margin-bottom: 5px;" Text="Details" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="pnSearchPart" runat="server" Style="width: 600px" DefaultButton="Button1">
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="GridRow1B" style="width: 100px;">
                                        Hotel
                                    </td>
                                    <td class="GridRow1B" style="width: 400px;">
                                        <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" DataSourceID="dsHotel"
                                            DataTextField="Hotel" DataValueField="HotelID" AppendDataBoundItems="True">
                                            <asp:ListItem Selected="True" Value="">all hotels</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="GridRow1B" style="width: 100px;">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Title
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="fltTitle" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="wmfltTitle" runat="server" TargetControlID="fltTitle"
                                            WatermarkCssClass="WaterMark" WatermarkText="Special Title (use% as wild card)" />
                                    </td>
                                    <td class="GridRow1B">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Booking Code
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="fltBookingCode" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="wmfltBookingCode" runat="server" TargetControlID="fltBookingCode"
                                            WatermarkCssClass="WaterMark" WatermarkText="Special Booking Code (use% as wild card)" />
                                    </td>
                                    <td class="GridRow1B" style="width: 100px;">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow1B">
                                        Booking Start
                                    </td>
                                    <td class="GridRow1B">
                                        <asp:TextBox ID="fltStart" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="wmfltStart" runat="server" TargetControlID="fltStart"
                                            WatermarkCssClass="WaterMark" WatermarkText="Booking Start Date equals or later than" />
                                        <asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="fltStart"
                                            Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                        <asp:ValidatorCalloutExtender ID="CompareValidator7_ValidatorCalloutExtender" runat="server"
                                            Enabled="True" TargetControlID="CompareValidator7">
                                        </asp:ValidatorCalloutExtender>
                                        <asp:CalendarExtender ID="fltStart_CalendarExtender" runat="server" Enabled="True"
                                            TargetControlID="fltStart" CssClass="cal_Theme1">
                                        </asp:CalendarExtender>
                                    </td>
                                    <td class="GridRow1B" style="width: 100px;">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear">
                                        Booking End
                                    </td>
                                    <td class="GridRowClear">
                                        <asp:TextBox ID="fltFinish" runat="server" CssClass="TextBox" />
                                        <asp:TextBoxWatermarkExtender ID="wmfltFinish" runat="server" TargetControlID="fltFinish"
                                            WatermarkCssClass="WaterMark" WatermarkText="Booking End Date equals or before than" />
                                        <asp:CompareValidator ID="CompareValidator8" runat="server" ControlToValidate="fltFinish"
                                            Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                        <asp:ValidatorCalloutExtender ID="CompareValidator8_ValidatorCalloutExtender" runat="server"
                                            Enabled="True" TargetControlID="CompareValidator8">
                                        </asp:ValidatorCalloutExtender>
                                        <asp:CalendarExtender ID="fltFinish_CalendarExtender" runat="server" Enabled="True"
                                            TargetControlID="fltFinish" CssClass="cal_Theme1">
                                        </asp:CalendarExtender>
                                    </td>
                                    <td class="GridRowClear" style="width: 100px;">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" class="ComandRow2T" style="height: 30px; padding-top: 5px">
                                        <asp:Button ID="Button1" runat="server" SkinID="skBtnFilter" />&nbsp;
                                        <asp:Button ID="Button2" runat="server" SkinID="skBtnClear" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="dsHotel" runat="server" 
            TypeName="dsSpecialTableAdapters.HotelTableAdapter"
            SelectMethod="GetData">
            <SelectParameters>
                <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>

    <br />
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <asp:Panel runat="server" ID="pnlGroups" Visible="False">
                <tr>
                    <td class="GridLabelBG">
                        <asp:Label ID="lbHotels" runat="server" SkinID="skGridLabel" Text="Special Groups" />
                    </td>
                </tr>
                <tr>
                    <td class="GridBorder">
                        <asp:GridView ID="gvSpecGroup" runat="server" SkinID="skGridView" 
                            AutoGenerateColumns="False" DataSourceID="dsFilteredGroups" 
                            AllowSorting="false" 
                            EnableModelValidation="True" >
                            <RowStyle Wrap="False" />
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                            CommandName="Details" CommandArgument='<%# Eval("SpecGroupID") %>' 
                                            ImageUrl="~/Images/Leads.gif" 
                                            Visible='<%# Eval("l")=1 %>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width="25px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Group" >
                                    <ItemTemplate>
                                        <asp:HyperLink ID="hlGroup" runat="server"
                                            Text='<%# "Group #" & Eval("SpecGroupID") %>'
                                            NavigateUrl='<%# "~/Contracts/Special/SpecialGroup.aspx?SpecGroupID=" & Eval("SpecGroupID") %>' 
                                            Visible='<%# Eval("l")=1 %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="80px" />
                                </asp:TemplateField>
                                <asp:TemplateField InsertVisible="False" SortExpression="SpecialID">
                                    <ItemTemplate>
                                        <%--(<asp:Label ID="Label2" runat="server" Text='<%# Bind("SpecialID") %>' />)--%>
                                        (<asp:HyperLink ID="hlSpecial" runat="server" 
                                            NavigateUrl='<%# "~/Contracts/Special/DetailSpec.aspx?SpecialID=" & Eval("SpecialID") %>' 
                                            Text='<%# Eval("SpecialID") %>' />)
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" Width="60px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title">
                                <ItemStyle Width="300px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Hotel" HeaderText="Hotel" SortExpression="Hotel">
                                <ItemStyle Width="300px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="RateCodeId" HeaderText="Rate Code" SortExpression="RateCodeId">
                                <ItemStyle Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="BookingCode" HeaderText="Book.Code" SortExpression="BookingCode">
                                <ItemStyle Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="BkStart" DataFormatString="{0:d}" HeaderText="Book.Start" SortExpression="BkStart">
                                <ItemStyle Width="80px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="BkFinish" DataFormatString="{0:d}" HeaderText="Book.Finish" SortExpression="BkFinish">
                                <ItemStyle Width="80px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Start" DataFormatString="{0:d}" HeaderText="Start" SortExpression="Start">
                                <ItemStyle Width="80px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Finish" DataFormatString="{0:d}" HeaderText="Finish" SortExpression="Finish">
                                <ItemStyle Width="80px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" Visible="False" />
                                <asp:TemplateField HeaderText="Active" SortExpression="StateId">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="cbActive" runat="server" Checked='<%# Eval("StateId")>0 %>' Enabled="false" />
                                    </ItemTemplate>
                                    <ItemStyle Width="50px" />
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <div style="width: 1098px; height: 20px;">
                                    No special group mach search criteria.
                                </div> 
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </td>
                </tr>
            </asp:Panel>
        </table>
        <asp:ObjectDataSource ID="dsFilteredGroups" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByFilter" 
            TypeName="dsSpecAssociationTableAdapters.SpecialGroupTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
                <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="fltTitle" Name="Title" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="fltBookingCode" Name="BookingCode" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="fltStart" Name="BkStart" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="fltFinish" Name="BkFinish" PropertyName="Text" Type="DateTime" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:HiddenField ID="hfUsername" runat="server" />
    </div>

</asp:Content>


