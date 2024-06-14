<%@ Page Title="" Language="VB" MasterPageFile="~/Contracts/Special/masterSpecial.master"
    AutoEventWireup="false" CodeFile="FRApplication.aspx.vb" Inherits="Contracts_Special_FRApplication" %>

<%@ MasterType VirtualPath="~/Contracts/Special/masterSpecial.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Special Application
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="WizardContent" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
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
                                    <tr>
                                        <td class="GridRow1B" style="width: 120px">
                                            Market
                                        </td>
                                        <td class="GridRow1B" style="width: 480px">
                                            <asp:DropDownList ID="ddlMarkets" runat="server" AppendDataBoundItems="True" CssClass="TextBox"
                                                DataSourceID="dsMarket" DataTextField="Market" DataValueField="MarketID">
                                                <asp:ListItem Selected="True" Value="">all markets</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:ObjectDataSource ID="dsMarket" runat="server" OldValuesParameterFormatString="original_{0}"
                                                SelectMethod="GetData" TypeName="TourOperTableAdapters.MarketTableAdapter"></asp:ObjectDataSource>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="GridRowClear" style="width: 120px">
                                            Tour Operator
                                        </td>
                                        <td class="GridRowClear" style="width: 480px" align="left">
                                            <asp:TextBox ID="fltName" runat="server" CssClass="TextBox" />
                                            <asp:TextBoxWatermarkExtender ID="fltNameExt" runat="server" TargetControlID="fltName"
                                                WatermarkCssClass="WaterMark" WatermarkText="Tour operator name (use % as wildchar)" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="ComandRow2T" style="padding-top: 5px; text-align: right">
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
            <div class="Blue">
                <%--
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                --%>
                <asp:CollapsiblePanelExtender ID="cpeAttachNo" runat="server" TargetControlID="divContracts"
                    CollapseControlID="lbAttachNo" ExpandControlID="lbAttachNo" ImageControlID="imgExpNo"
                    CollapsedImage="~/Images/expand_.png" ExpandedImage="~/Images/collapse_.png"
                    Collapsed="False">
                </asp:CollapsiblePanelExtender>
                <asp:CollapsiblePanelExtender ID="cpeAttachYes" runat="server" TargetControlID="divAttached"
                    CollapseControlID="lblAttachYes" ExpandControlID="lblAttachYes" ImageControlID="imgExpYes"
                    CollapsedImage="~/Images/expand_.png" ExpandedImage="~/Images/collapse_.png"
                    Collapsed="False">
                </asp:CollapsiblePanelExtender>
                <%--<table cellpadding="0" cellspacing="0" width="840px">--%>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="GridLabelBG">
                            <asp:Label ID="lbAttachNo" runat="server" SkinID="skGridLabel">Available Tour Operators&nbsp;<asp:Image
                                ID="imgExpNo" runat="server" ImageUrl="~/Images/collapse_.png" />&nbsp; </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder">
                            <asp:Panel ID="divContracts" runat="server" Visible="false">
                                <asp:GridView ID="gvContracts" runat="server" DataKeyNames="TourOpID" SkinID="skGridView"
                                    AutoGenerateColumns="False" AllowPaging="True" ShowFooter="True" DataSourceID="dsFilteredContracts"
                                    PageSize="15" EnableModelValidation="True">
                                    <RowStyle Wrap="False" />
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnSelect" runat="server" Text="Attach" CommandName="Select" Font-Underline="false" />
                                            </ItemTemplate>
                                            <ItemStyle Width="70px" HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Select" ImageUrl="~/Images/select_.gif" />
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:Button ID="btnAttachAll" runat="server" OnClick="btnAttachAll_Click" SkinID="skBtnBase" Text="Attach" style="margin-top: 5px;" />
                                            </FooterTemplate>
                                            <ItemStyle Width="70px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="TourOp" HeaderText="Tour Operator" SortExpression="TourOpId">
                                            <ItemStyle Width="250px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="MarketId" HeaderText="Market" SortExpression="MarketId">
                                            <ItemStyle Width="70px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="PayModeId" HeaderText="Pay Mode" SortExpression="PayModeId">
                                            <ItemStyle Width="70px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="PayCondId" HeaderText="Pay Cond" SortExpression="PayCondId">
                                            <ItemStyle Width="70px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="CreditDays" HeaderText="Credit Days" SortExpression="CreditDays">
                                            <ItemStyle Width="70px" />
                                        </asp:BoundField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        There are no tour operators to attach this special to.
                                    </EmptyDataTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:GridView>
                                <asp:ObjectDataSource ID="dsFilteredContracts" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetDataByParams" TypeName="dsSpecialTableAdapters.SelectTO4SpecialFRTableAdapter">
                                    <SelectParameters>
                                        <%--<asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" DefaultValue="admin" />--%>
                                        <asp:Parameter Name="UserName" Type="String" />
                                        <asp:QueryStringParameter Name="SpecialID" QueryStringField="SpecialID" Type="Int32" />
                                        <asp:Parameter Name="TourOpID" Type="Int32" />
                                        <asp:ControlParameter ControlID="ddlMarkets" Name="MarketId" PropertyName="SelectedValue" Type="String" />
                                        <asp:ControlParameter ControlID="fltName" Name="TourOp" PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="GridLabelBG">
                            <asp:Label ID="lblAttachYes" runat="server" SkinID="skGridLabel">Attached Tour Operators
                                &nbsp;<asp:Image ID="imgExpYes" runat="server" ImageUrl="~/Images/collapse_.png" />&nbsp;
                            </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder">
                            <asp:Panel ID="divAttached" runat="server">
                                <asp:GridView ID="gvAttached" runat="server" DataKeyNames="TourOpID,ContractID" SkinID="skGridView"
                                    AutoGenerateColumns="False" AllowPaging="True" DataSourceID="dsAttachCnt" ShowFooter="True">
                                    <RowStyle Wrap="False" />
                                    <Columns>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbDeattach" runat="server" CausesValidation="False" 
                                                    CommandName="Dettach" CommandArgument='<%# Eval("ContractID") %>' 
                                                    OnClientClick="return confirm('Are you sure you want to DEATTACH special?')"
                                                    Visible='<%# Eval("StateId")=4 %>' 
                                                    Text="Deattach" />
                                            </ItemTemplate>
                                            <ItemStyle Width="70px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbSuspend" runat="server" CausesValidation="False" 
                                                    CommandName="Suspend" CommandArgument='<%# Eval("ContractID") %>'
                                                    OnClientClick="return confirm('Are you sure you want to SUSPEND special attachment?')"
                                                    Visible='<%# Eval("StateId")=4%>' 
                                                    Text="Suspend" />
                                                <asp:Label ID="txtSusp" runat="server" Text="Suspended" ForeColor="Red" Font-Italic="true" 
                                                    Font-Size="80%" Visible='<%# Eval("StateId")=6 %>' />
                                                <%--<asp:Label ID="Label1" runat="server" 
                                                    Text='<%# Eval("Active") & "|" &  Eval("ContractID") %>' 
                                                    ForeColor="Red" Font-Italic="true" Font-Size="80%" />--%>
                                            </ItemTemplate>
                                            <ItemStyle Width="70px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="TourOp" HeaderText="Tour Operator" SortExpression="TourOpId">
                                            <ItemStyle Width="250px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="MarketId" HeaderText="Market" SortExpression="MarketId">
                                            <ItemStyle Width="70px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" ReadOnly="True">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle Width="210px" />
                                        </asp:BoundField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        Tehere are no contracts this special is attached to.
                                    </EmptyDataTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:GridView>
                                <asp:ObjectDataSource ID="dsAttachCnt" runat="server" SelectMethod="GetDataBySID"
                                    TypeName="dsSpecialTableAdapters.SelectTO2SpecialTableAdapter" OldValuesParameterFormatString="original_{0}">
                                    <SelectParameters>
                                        <%--<asp:ControlParameter ControlID="hfuserName" Name="UserName" PropertyName="Value" Type="String" />--%>
                                        <asp:Parameter Name="UserName" Type="String" />
                                        <asp:QueryStringParameter Name="SpecialID" QueryStringField="SpecialID" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
                <%--</ContentTemplate> </asp:UpdatePanel>--%>
                <%--<asp:HiddenField ID="hfuserName" runat="server" />
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>
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
                                    <asp:Label ID="popMessage" runat="server" Text="Message"></asp:Label>
                                </p>
                                <p style="text-align: right;" class="GridRow2T">
                                    <br />
                                    <asp:Button ID="btnYes" runat="server" Text="Yes" SkinID="skBtnBase" />&nbsp;
                                    <asp:Button ID="btnNo" runat="server" Text="No" SkinID="skBtnBase" />&nbsp;
                                </p>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
