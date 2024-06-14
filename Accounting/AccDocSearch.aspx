<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" 
    AutoEventWireup="false" EnableEventValidation="false" 
    CodeFile="AccDocSearch.aspx.vb" Inherits="Accounting_AccDocSearch" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Accounting Documents
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
                <td class="GridBorder">
                    <asp:Panel ID="pnSearch" runat="server" DefaultButton="btSearch">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="GridRow1B" style="width: 120px;">Hotel Group</td>
                                <td class="GridRow1B" style="width: 480px;">
                                    <asp:DropDownList ID="ddlHotelGroup" runat="server" BackColor="White" CssClass="TextBox" />
                                    <asp:CascadingDropDown ID="exHotelGroup" runat="server" 
                                        TargetControlID="ddlHotelGroup" Category="HotelGroupID" 
                                        ServicePath="~/HtlGroup.asmx"
                                        ServiceMethod="GetHotelGroups" >
                                    </asp:CascadingDropDown>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Hotel</td>
                                <td class="GridRow1B" >
                                    <asp:DropDownList ID="ddlHotel" runat="server" BackColor="White" CssClass="TextBox" />
                                    <asp:CascadingDropDown ID="exHotel" runat="server" 
                                        ParentControlID="ddlHotelGroup"
                                        TargetControlID="ddlHotel" Category="HotelID" 
                                        ServicePath="~/HtlGroup.asmx"
                                        ServiceMethod="GetHotels" >
                                    </asp:CascadingDropDown>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" >Tour Operator Group</td>
                                <td class="GridRow1B" >
                                    <asp:DropDownList ID="ddlTOGroup" runat="server" BackColor="White" CssClass="TextBox" />
                                    <asp:CascadingDropDown ID="exTOGroup" runat="server" 
                                        TargetControlID="ddlTOGroup" Category="TourOpGroupID" 
                                        ServicePath="~/TOGroup.asmx"
                                        ServiceMethod="GetTOGroups" >
                                    </asp:CascadingDropDown>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Tour Operator</td>
                                <td class="GridRow1B" >
                                    <asp:DropDownList ID="ddlTO" runat="server" BackColor="White" CssClass="TextBox" />
                                    <asp:CascadingDropDown ID="exTO" runat="server" 
                                        ParentControlID="ddlTOGroup"
                                        TargetControlID="ddlTO" Category="TourOpID" 
                                        ServicePath="~/TOGroup.asmx"
                                        ServiceMethod="GetTTOOs" >
                                    </asp:CascadingDropDown>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Payment Condition</td>
                                <td class="GridRow1B" >
                                    <asp:DropDownList ID="ddlPayCond" runat="server" BackColor="White" 
                                        CssClass="TextBox" AppendDataBoundItems="True" DataSourceID="dsPayCond" 
                                        DataTextField="PayCond" DataValueField="PayCondID" >
                                        <asp:ListItem Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsPayCond" runat="server" 
                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                        TypeName="dsMaintBasicTableAdapters.PayCondTableAdapter"></asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">Market</td>
                                <td class="GridRow1B" >
                                    <asp:DropDownList ID="ddlMarket" runat="server" BackColor="White" 
                                        CssClass="TextBox" AppendDataBoundItems="True" DataSourceID="dsMarket" 
                                        DataTextField="Market" DataValueField="MarketID" >
                                        <asp:ListItem Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsMarket" runat="server" 
                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                        TypeName="dsMaintBasicTableAdapters.MarketTableAdapter"></asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Document/Class
                                </td>
                                <td class="GridRow1B">
                                    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:TextBox ID="ddlTrSearch" runat="server" CssClass="TextBox" ReadOnly="False" />
                                            <asp:PopupControlExtender ID="pceDocApply" runat="server" CommitProperty="Text" PopupControlID="gvDocToApply"
                                                Position="Center" TargetControlID="ddlTrSearch">
                                            </asp:PopupControlExtender>
                                            <asp:GridView ID="gvDocToApply" runat="server" AutoGenerateColumns="False" BackColor="White"
                                                CssClass="GridBorder" DataSourceID="dsTrDocClass" GridLines="None" OnSelectedIndexChanged="gvDocToApply_SelectedIndexChanged"
                                                ShowHeader="False" Width="397px" DataKeyNames="ApplyTo">
                                                <RowStyle CssClass="GridRowClear" HorizontalAlign="Left" />
                                                <Columns>
                                                    <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" ShowSelectButton="True">
                                                        <ItemStyle Width="20px" />
                                                    </asp:CommandField>
                                                    <asp:BoundField DataField="ApplyTo" HeaderText="ApplyTo" SortExpression="ApplyTo">
                                                        <ItemStyle Width="100px" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="TrDescription" HeaderText="TrDescription" SortExpression="TrDescription" />
                                                </Columns>
                                                <SelectedRowStyle CssClass="SelectRowClear" />
                                            </asp:GridView>
                                            <asp:ObjectDataSource ID="dsTrDocClass" runat="server" OldValuesParameterFormatString="original_{0}"
                                                SelectMethod="GetData" TypeName="dsAccountingTableAdapters.AccVwDocFilterTableAdapter">
                                            </asp:ObjectDataSource>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>--%>
                                    <asp:DropDownList ID="ddlTrSearch" runat="server" AppendDataBoundItems="True" CssClass="TextBox" 
                                        DataSourceID="dsTrDocClass" DataTextField="TrCombo" DataValueField="ApplyTo">
                                        <asp:ListItem Selected="True" Value="">all</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsTrDocClass" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="dsAccountingTableAdapters.AccVwDocFilterTableAdapter">
                                    </asp:ObjectDataSource>

                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Number From
                                </td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="txtDocNumFrom" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wmfltBookingCode" runat="server" TargetControlID="txtDocNumFrom"
                                        WatermarkCssClass="WaterMark" WatermarkText="Document Number equals or greater than" />
                                    <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="txtDocNumFrom"
                                        Display="None" ErrorMessage="Input Number!" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator3_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator3">
                                    </asp:ValidatorCalloutExtender>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Number To
                                </td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="txtDocNumTo" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="txtDocNumTo_TextBoxWatermarkExtender" runat="server"
                                        TargetControlID="txtDocNumTo" WatermarkCssClass="WaterMark" WatermarkText="Document Number equals or less than" />
                                    <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="txtDocNumTo"
                                        Display="None" ErrorMessage="Input Number!" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator4_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator4">
                                    </asp:ValidatorCalloutExtender>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Date From
                                </td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="txtDocDateFrom" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="txtDocDateFrom_TextBoxWatermarkExtender" runat="server"
                                        TargetControlID="txtDocDateFrom" WatermarkCssClass="WaterMark" WatermarkText="Document date equals or later than" />
                                    <asp:CalendarExtender ID="txtDocDateFrom_CalendarExtender" runat="server" CssClass="cal_Theme1"
                                        Enabled="True" TargetControlID="txtDocDateFrom">
                                    </asp:CalendarExtender>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtDocDateFrom"
                                        Display="None" ErrorMessage="Input Date!" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator1_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator1">
                                    </asp:ValidatorCalloutExtender>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B">
                                    Date To
                                </td>
                                <td class="GridRow1B" style="width: 200px;">
                                    <asp:TextBox ID="txtDocDateTo" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="txtDocDateTo_TextBoxWatermarkExtender" runat="server"
                                        TargetControlID="txtDocDateTo" WatermarkCssClass="WaterMark" WatermarkText="Document Date equals or less than" />
                                    <asp:CalendarExtender ID="txtDocDateTo_CalendarExtender" runat="server" CssClass="cal_Theme1"
                                        Enabled="True" TargetControlID="txtDocDateTo">
                                    </asp:CalendarExtender>
                                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtDocDateTo"
                                        Display="None" ErrorMessage="Input Date!" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                    <asp:ValidatorCalloutExtender ID="CompareValidator2_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator2">
                                    </asp:ValidatorCalloutExtender>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear">
                                    &nbsp;
                                </td>
                                <td class="GridRowClear" style="height: 30px; padding-top: 5px">
                                    <asp:CheckBox ID="cbZero" runat="server" Text="Include zero balance" /><br />
                                    <asp:CheckBox ID="cbCancel" runat="server" Text="Include cancel" /><br />
                                    <asp:CheckBox ID="cbUnapproved" runat="server" Text="Unapproved only" Checked="true" />
                                </td>
                            </tr>
                            <tr>
                                <td class="ComandRow2T" colspan="2" style="height: 30px; padding-top: 5px">
                                    <asp:Button ID="btSearch" runat="server" SkinID="skBtnFilter" />&nbsp;
                                    <asp:Button ID="btClear" runat="server" SkinID="skBtnClear" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    <br />
<%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lbDocuments" runat="server" SkinID="skGridLabel" Text="Documents"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvDocuments" runat="server" AutoGenerateColumns="False" DataKeyNames="DocumentID"
                        DataSourceID="dsFilteredDocuments" SkinID="skGridView" ShowFooter="True" 
                        AllowPaging="True" PageSize="100">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Details"
                                        CommandArgument='<%# Eval("DocumentID") %>' ImageUrl="~/Images/Leads.gif" />
                                </ItemTemplate>
                                <ItemStyle Width="30px" />
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    (<asp:HyperLink ID="HyperLink1" runat="server" 
                                        NavigateUrl='<%# "~/Accounting/AccDocDetailNew.aspx?DocumentID=" & Eval("DocumentID") %>' 
                                        Text='<%# Eval("DocumentID") %>' />)
                                </ItemTemplate>
                                <ItemStyle Width="60px" HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Document" SortExpression="DocCode,DocNumber">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("DocCode") %>'></asp:Label>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("DocNumber") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="DocOrd" HeaderText="Ord" SortExpression="DocOrd" Visible="False" />
                            <asp:TemplateField HeaderText="Hotel" SortExpression="SortPriority">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtHotel" runat="server" Text='<%# Eval("Hotel") %>' ToolTip='<%# "(" & Eval("HotelId") & ") " & Eval("Hotel") %>'
                                        style="border: none 0pt; width: 190px; color: inherit; font: inherit; text-overflow: ellipsis;" ReadOnly="true" />
                                </ItemTemplate>
                                <ItemStyle Width="200px" />
                            </asp:TemplateField> 
                            <asp:BoundField DataField="TourOpId" HeaderText="TOId" SortExpression="TourOpId" Visible="False" />
                            <asp:TemplateField HeaderText="Tour Operator" SortExpression="TourOp">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtTourOp" runat="server" Text='<%# Eval("TourOp") %>' ToolTip='<%# "(" & Eval("TourOpId") & ") " & Eval("TourOp") %>'
                                        style="border: none 0pt; width: 190px; color: inherit; font: inherit; text-overflow: ellipsis;" ReadOnly="true" />
                                </ItemTemplate>
                                <ItemStyle Width="200px" />
                            </asp:TemplateField> 
                            <%--
                            <asp:BoundField DataField="TourOp" HeaderText="Tour Operator" SortExpression="TourOp">
                                <ItemStyle Width="300px" />
                            </asp:BoundField>
                            --%>
                            <asp:BoundField DataField="DocDate" HeaderText="Doc.Date" SortExpression="DocDate" DataFormatString="{0:d}" HtmlEncode="False">
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" DataFormatString="{0:N2}">
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="AppAmount" HeaderText="Applied" SortExpression="AppAmount" DataFormatString="{0:N2}">
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Balance" HeaderText="Balance" SortExpression="Balance" DataFormatString="{0:N2}">
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="HBalance" DataFormatString="{0:N2}" Visible="false" HeaderText="Htl.Balance" SortExpression="HBalance">
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="BalanceDate" DataFormatString="{0:d}" HeaderText="Bal.Date" HtmlEncode="False" SortExpression="BalanceDate">
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:TemplateField SortExpression="Canceled">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" ForeColor="Red" ToolTip="Canceled" Text='<%# "C" %>' Visible='<%# Eval("Canceled") %>' Font-Bold="true" />
                                </ItemTemplate>
                                <ItemStyle Width="30px" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Warning.gif" ToolTip='<%# "Different Balances: " & Eval("Balance","{0:N2}") & "/" & Eval("HBalance","{0:N2}") %>'
                                        Visible='<%# iif(Eval("HBalance")<>0 AND Eval("Balance")=0 AND Eval("Canceled")=False ,True,False) %>' />
                                </ItemTemplate>
                                <ItemStyle Width="30px" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbApply" runat="server" Text="Apply" CommandName="Apply" 
                                        CommandArgument='<%# Eval("DocumentID") %>' Enabled='<%# Eval("Balance")<>0 %>' Visible='<%# Eval("Approved") <> 0%>' />
                                    <asp:Label ID="lblNot" runat="server" Text="Not" Visible='<%# Not Eval("Approved")%>' Width="45px" Style="text-align: right; color: GrayText; font-style: italic;" />
                                </ItemTemplate>
                                <ItemStyle Width="50px" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbTransfer" runat="server" Text="Transfer" CommandName="Transfer" 
                                        CommandArgument='<%# Eval("DocumentID") %>' Enabled='<%# Eval("Balance")<>0 %>' Visible='<%# Eval("Approved") <> 0%>' />
                                    <asp:Label ID="lblApproved" runat="server" Text="approved" Visible='<%# Not Eval("Approved")%>' Width="45px" Style="text-align: left; color: GrayText; font-style: italic;" />
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:Button ID="linkNew" runat="server" Text="Register" SkinID="skBtnBase" OnClick="linkNew_Click" />
                                </FooterTemplate>
                                <ItemStyle Width="45px" />
                                <FooterStyle HorizontalAlign="Right" Height="30px" VerticalAlign="Middle" />
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <b>Filter empty, or no documents for filter criteria.</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; padding-top: 5px; height: 30px; width: 1032px;">
                                        <asp:Button ID="linkNew" runat="server" Text="Register" SkinID="skBtnBase" OnClick="linkNew_Click" />
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="dsFilteredDocuments" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="dsAccountingTableAdapters.FilterUserAccTransDocTableAdapter">
            <SelectParameters>
                <asp:ControlParameter Name="UserName" ControlID="hfUsername" PropertyName="Value" Type="String" />
                <asp:ControlParameter Name="HotelGroupId" ControlID="ddlHotelGroup" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter Name="HotelID" ControlID="ddlHotel" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter Name="TourOpGroupId" ControlID="ddlTOGroup" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter Name="TourOpId" ControlID="ddlTO" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter Name="PayCondId" ControlID="ddlPayCond" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter Name="MarketId" ControlID="ddlMarket" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter Name="TrCode" ControlID="ddlTrSearch" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter Name="DocNumFrom" ControlID="txtDocNumFrom" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter Name="DocNumTo" ControlID="txtDocNumTo" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter Name="DocDateFrom" ControlID="txtDocDateFrom" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter Name="DocDateTo" ControlID="txtDocDateTo" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter Name="ShowCancel" ControlID="cbCancel" PropertyName="Checked" Type="Boolean" />
                <asp:ControlParameter Name="ShowZero" ControlID="cbZero" PropertyName="Checked" Type="Boolean" />
                <asp:ControlParameter Name="UnapprovedOnly" ControlID="cbUnapproved" PropertyName="Checked" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
