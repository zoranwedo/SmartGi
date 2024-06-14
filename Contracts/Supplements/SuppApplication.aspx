<%@ Page Title="" Language="VB" MasterPageFile="~/Contracts/Supplements/masterSupplement.master"
    AutoEventWireup="false" CodeFile="SuppApplication.aspx.vb" Inherits="Contracts_Supplements_SuppApplication" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Supplement Application
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="WizardContent" runat="Server">
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
                                        DataSourceID="ObjectDataSource1" DataTextField="Market" DataValueField="MarketID">
                                        <asp:ListItem Selected="True" Value="">all markets</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" 
                                        SelectMethod="GetData" TypeName="TourOperTableAdapters.MarketTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRow1B" style="width: 120px">
                                    Tour Operator
                                </td>
                                <td class="GridRow1B" style="width: 480px">
                                    <asp:DropDownList ID="ddlTO" runat="server" CssClass="TextBox" DataSourceID="dsUserTO"
                                        DataTextField="TourOp" DataValueField="TourOpID" AppendDataBoundItems="True">
                                        <asp:ListItem Selected="True" Value="">all TO</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsUserTO" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetDataByMarketID" TypeName="TourOperTableAdapters.TourOpTableAdapter">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
                                            <asp:ControlParameter ControlID="ddlMarkets" Name="MarketId" PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear" style="width: 120px; text-align: left;">
                                    Title
                                </td>
                                <td class="GridRowClear" style="width: 480px" align="left">
                                    <asp:TextBox ID="fltName" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="fltNameExt" runat="server" TargetControlID="fltName"
                                        WatermarkCssClass="WaterMark" WatermarkText="Contract title (use % as wildchar)" />
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
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lbAttachNo" runat="server" SkinID="skGridLabel">Available Contracts &nbsp;<asp:Image
                        ID="imgExpNo" runat="server" ImageUrl="~/Images/collapse_.png" />&nbsp; </asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:Panel ID="divContracts" runat="server">
                        <asp:GridView ID="gvContracts" runat="server" DataSourceID="dsFilteredContracts"
                            DataKeyNames="ContractID,Title" SkinID="skGridView" AutoGenerateColumns="False"
                            AllowPaging="True" ShowFooter="True">
                            <RowStyle Wrap="False" />
                            <HeaderStyle HorizontalAlign="Left" />
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        Attach
                                    </ItemTemplate>
                                    <ItemStyle Width="70px" HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="cbSel" runat="server" />
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Button ID="btnAttachAll" runat="server" OnClick="btnAttachAll_Click" SkinID="skBtnBase" Text="Attach" />
                                    </FooterTemplate>
                                    <ItemStyle Width="70px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="TourOp" HeaderText="Tour Operator" SortExpression="TourOpId">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle Width="350px" />
                                </asp:BoundField>
                                <asp:TemplateField SortExpression="ContractID">
                                    <ItemTemplate>
                                        (<asp:HyperLink ID="lnkContract" runat="server" 
                                            NavigateUrl='<%# "~/Contracts/ContractOverview.aspx?ContractID=" & Eval("ContractID") %>' 
                                            Text='<%# Eval("ContractID") %>' />)&nbsp;
                                    </ItemTemplate>
                                    <ItemStyle Width="50px" HorizontalAlign ="Right" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle Width="200px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="MarketId" HeaderText="Market" SortExpression="MarketId"
                                    Visible="False">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="RateCodeId" HeaderText="Rate Code" SortExpression="RateCodeId">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Start" DataFormatString="{0:d}" HeaderText="Start" HtmlEncode="False"
                                    SortExpression="Start">
                                    <ItemStyle Width="80px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Finish" DataFormatString="{0:d}" HeaderText="End" HtmlEncode="False"
                                    SortExpression="Finish">
                                    <ItemStyle Width="80px" />
                                </asp:BoundField>
                           </Columns>
                            <EmptyDataTemplate>
                                There are no contracts to attach this supplement to.
                            </EmptyDataTemplate>
                        </asp:GridView>
                        <asp:ObjectDataSource ID="dsFilteredContracts" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="FilterData" 
                            TypeName="SupplementsTableAdapters.Conracts4SupplementTableAdapter">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value"
                                    Type="String" />
                                <asp:QueryStringParameter Name="SupplementID" QueryStringField="SupplementID" Type="Int32" />
                                <asp:ControlParameter ControlID="ddlTO" Name="TourOpId" PropertyName="SelectedValue"
                                    Type="Int32" />
                                <asp:ControlParameter ControlID="ddlMarkets" Name="MarketID" 
                                    PropertyName="SelectedValue" Type="String" />
                                <asp:ControlParameter ControlID="fltName" Name="Title" PropertyName="Text" 
                                    Type="String" />
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
                    <asp:Label ID="lblAttachYes" runat="server" SkinID="skGridLabel">Attached Contracts/Tour Operators
                        &nbsp;<asp:Image ID="imgExpYes" runat="server" ImageUrl="~/Images/collapse_.png" />&nbsp;
                    </asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:Panel ID="divAttached" runat="server" >
                        <div style="padding-bottom: 5px;">
                        <b>Contracts:</b>
                        <asp:GridView ID="gvAttached" runat="server" DataKeyNames="ContractID" SkinID="skGridView"
                            AutoGenerateColumns="False" AllowPaging="True" DataSourceID="dsAttachCnt">
                            <RowStyle Wrap="False" />
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbDeattach" runat="server" CausesValidation="False" 
                                            CommandName="Dettach" CommandArgument='<%# Eval("ContractID") %>'
                                            Visible='<%# Eval("Active") %>' 
                                            OnClientClick="return confirm('Are you sure you want to DEATTACH supplement?')"
                                            Text="Deattach" />
                                    </ItemTemplate>
                                    <ItemStyle Width="70px" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbSuspend" runat="server" CausesValidation="False" 
                                            CommandName="Suspend" CommandArgument='<%# Eval("ContractID") %>'
                                            OnClientClick="return confirm('Are you sure you want to SUSPEND supplement attachment?')"
                                            Visible='<%# Eval("Active") %>' 
                                            Text="Suspend" />
                                        <asp:Label ID="txtSusp" runat="server" Text="Suspended" ForeColor="Red" Font-Italic="true" Font-Size="80%"
                                            Visible='<%# iif(Eval("Active") ,false,true) %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="70px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="TourOp" HeaderText="Tour Operator" SortExpression="TourOpId">
                                    <ItemStyle Width="350px" />
                                </asp:BoundField>
                                <asp:TemplateField SortExpression="ContractID">
                                    <ItemTemplate>
                                        (<asp:HyperLink ID="lnkContract1" runat="server" 
                                            NavigateUrl='<%# "~/Contracts/ContractOverview.aspx?ContractID=" & Eval("ContractID") %>' 
                                            Text='<%# Eval("ContractID") %>' />)&nbsp;
                                    </ItemTemplate>
                                    <ItemStyle Width="50px" HorizontalAlign ="Right" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle Width="200px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="MarketId" HeaderText="Market" SortExpression="MarketId"
                                    ReadOnly="true" Visible="false">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="RateCodeId" HeaderText="Rate Code" SortExpression="RateCodeId">
                                    <ItemStyle Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Start" DataFormatString="{0:d}" HeaderText="Start" HtmlEncode="False"
                                    SortExpression="Start">
                                    <ItemStyle Width="80px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Finish" DataFormatString="{0:d}" HeaderText="End" HtmlEncode="False"
                                    SortExpression="Finish">
                                    <ItemStyle Width="80px" />
                                </asp:BoundField>
                            </Columns>
                            <EmptyDataTemplate>
                                Tehere are no contracts this supplement is attached to.
                            </EmptyDataTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:GridView>
                        <asp:ObjectDataSource ID="dsAttachCnt" runat="server" SelectMethod="GetDataBySuppID"
                            TypeName="SupplementsTableAdapters.ContractSupplementTableAdapter">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="SupplementId" QueryStringField="SupplementId" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        </div>
                        <b>Tour Operators:</b>
                        <asp:GridView ID="gvAttachedTO" runat="server" DataKeyNames="TourOpID" SkinID="skGridView"
                            AutoGenerateColumns="False" AllowPaging="True" DataSourceID="dsSuppTO">
                            <RowStyle Wrap="False" />
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbDeattach" runat="server" CausesValidation="False" Text="Deattach"
                                            CommandName="Dettach" CommandArgument='<%# Eval("TourOpID") %>'
                                            OnClientClick="return confirm('This functionality is not implemented yet')"
                                            Visible='<%# Eval("Active") %>' 
                                            Enabled="false" />
                                            <%--OnClientClick="return confirm('Are you sure you want to DEATTACH supplement?')"--%>
                                    </ItemTemplate>
                                    <ItemStyle Width="70px" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbSuspend" runat="server" CausesValidation="False" 
                                            CommandName="Suspend" CommandArgument='<%# Eval("TourOpID") %>' Text="Suspend" 
                                            OnClientClick="return confirm('This functionality is not implemented yet')"
                                            Visible='<%# Eval("Active") %>' 
                                            Enabled="false" />
                                            <%--OnClientClick="return confirm('Are you sure you want to SUSPEND supplement attachment?')"--%>
                                        <asp:Label ID="txtSusp" runat="server" Text="Suspended" ForeColor="Red" Font-Italic="true" Font-Size="80%"
                                            Visible='<%# iif(Eval("Active") ,false,true) %>' 
                                            Enabled="false" />
                                    </ItemTemplate>
                                    <ItemStyle Width="70px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="TourOp" HeaderText="Tour Operator" SortExpression="TourOpId">
                                    <ItemStyle Width="966px" />
                                </asp:BoundField>
                                <%--<asp:TemplateField SortExpression="ContractID">
                                    <ItemTemplate>
                                        (<asp:HyperLink ID="lnkContract1" runat="server" 
                                            NavigateUrl='<%# "~/Contracts/ContractOverview.aspx?ContractID=" & Eval("ContractID") %>' 
                                            Text='<%# Eval("ContractID") %>' />)&nbsp;
                                    </ItemTemplate>
                                    <ItemStyle Width="50px" HorizontalAlign ="Right" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="MarketId" HeaderText="Market" SortExpression="MarketId" ReadOnly="true" Visible="false">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField >
                                    <ItemStyle Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField >
                                    <ItemStyle Width="80px" />
                                </asp:BoundField>
                                <asp:BoundField >
                                    <ItemStyle Width="80px" />
                                </asp:BoundField>--%>
                            </Columns>
                            <EmptyDataTemplate>
                                Tehere are no contracts this supplement is attached to.
                            </EmptyDataTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:GridView>
                        <asp:ObjectDataSource ID="dsSuppTO" runat="server" SelectMethod="GetData"
                            TypeName="SupplementsTableAdapters.SupplementTourOpTableAdapter">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="SupplementId" QueryStringField="SupplementId" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </asp:Panel>
                </td>
            </tr>
        </table>
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
</asp:Content>
