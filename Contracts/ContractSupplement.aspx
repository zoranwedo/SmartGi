<%@ Page Title="" Language="VB" MasterPageFile="~/Contracts/masterContracts.master"
    AutoEventWireup="false" CodeFile="ContractSupplement.aspx.vb" Inherits="Contracts_ContractSupplement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Contracts Supplement
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContractContent" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
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
                <%--<table cellpadding="0" cellspacing="0" width="690px">--%>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="GridLabelBG">
                            <asp:Label ID="lbAttachNo" runat="server" SkinID="skGridLabel">Available Supplements
                                &nbsp;<asp:Image ID="imgExpNo" runat="server" ImageUrl="~/Images/collapse_.png" />&nbsp;
                            </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder">
                            <asp:Panel ID="divContracts" runat="server">
                                <asp:GridView ID="gvContracts" runat="server" DataSourceID="dsFilteredContracts"
                                    DataKeyNames="SupplementID" SkinID="skGridView" AutoGenerateColumns="False" AllowPaging="True"
                                    ShowFooter="True">
                                    <RowStyle Wrap="False" />
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
                                                <asp:Button ID="btnAttachAll" runat="server" SkinID="skBtnBase" Text="Attach" OnClick="btnAttachAll_Click" />
                                            </FooterTemplate>
                                            <ItemStyle Width="70px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField SortExpression="SupplementID">
                                            <ItemTemplate>
                                                (<asp:HyperLink ID="lnkSupplement" runat="server" NavigateUrl='<%# "~/Contracts/Supplements/Detail.aspx?SupplementID=" & Eval("SupplementID") %>'
                                                    Text='<%# Eval("SupplementID") %>' />)&nbsp;
                                            </ItemTemplate>
                                            <ItemStyle Width="50px" HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Title" SortExpression="Title">
                                            <ItemTemplate>
                                                <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title") %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="250px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Start" HeaderText="Start" SortExpression="Start" DataFormatString="{0:d}"
                                            HtmlEncode="False">
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Finish" DataFormatString="{0:d}" HeaderText="End" HtmlEncode="False"
                                            SortExpression="Finish">
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        Tehere are no supplements that can be attached to the contract.
                                    </EmptyDataTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:GridView>
                                <asp:ObjectDataSource ID="dsFilteredContracts" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="SupplementsTableAdapters.Supplements4ContractTableAdapter">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value" Type="String" />
                                        <asp:QueryStringParameter Name="ContractID" QueryStringField="ContractID" Type="Int32" />
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
                            <asp:Label ID="lblAttachYes" runat="server" SkinID="skGridLabel">Attached Supplements
                                &nbsp;<asp:Image ID="imgExpYes" runat="server" ImageUrl="~/Images/collapse_.png" />&nbsp;
                            </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder">
                            <asp:Panel ID="divAttached" runat="server">
                                <asp:GridView ID="gvAttached" runat="server" DataKeyNames="SupplementId" SkinID="skGridView"
                                    AllowPaging="True" DataSourceID="dsAttachCnt" PageSize="5">
                                    <RowStyle Wrap="False" />
                                    <Columns>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbDettach" runat="server" CausesValidation="False" 
                                                    CommandName="Dettach" CommandArgument='<%# Eval("SupplementID") %>'
                                                    OnClientClick="return confirm('Are you sure you want to DEATTACH supplement from contract?');"
                                                    Visible='<%# Eval("Active") %>' 
                                                    Text="Deattach" />
                                            </ItemTemplate>
                                            <ItemStyle Width="70px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbSuspend" runat="server" CausesValidation="False" 
                                                    CommandName="Suspend" CommandArgument='<%# Eval("SupplementID") %>' 
                                                    OnClientClick="return confirm('Are you sure you want to SUSPEND supplement attachment to contract?')" 
                                                    Visible='<%# Eval("Active") %>' 
                                                    Text="Suspend" />
                                                <asp:Label ID="txtSusp" runat="server" Text="Suspended" ForeColor="Red" Font-Italic="true"
                                                    Font-Size="80%" Visible='<%# iif(Eval("Active") ,false,true) %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="70px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField SortExpression="SupplementID">
                                            <ItemTemplate>
                                                (<asp:HyperLink ID="lnkSupplement1" runat="server" NavigateUrl='<%# "~/Contracts/Supplements/Detail.aspx?SupplementID=" & Eval("SupplementID") %>'
                                                    Text='<%# Eval("SupplementID") %>' />)&nbsp;
                                            </ItemTemplate>
                                            <ItemStyle Width="50px" HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Title" SortExpression="Title">
                                            <ItemTemplate>
                                                <asp:Label ID="lblTitle1" runat="server" Text='<%# Eval("Title") %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="250px" />
                                        </asp:TemplateField>
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
                                        Tehere are no attached supplements to the contract.
                                    </EmptyDataTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:GridView>
                                <asp:ObjectDataSource ID="dsAttachCnt" runat="server" SelectMethod="GetDataByContID"
                                    TypeName="SupplementsTableAdapters.ContractSupplementTableAdapter">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="ContractID" QueryStringField="ContractID" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="Blue">
                <asp:HiddenField ID="dummy" runat="server" />
                <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
                    Enabled="true" PopupDragHandleControlID="popLabel" CancelControlID="btnNo" DropShadow="True"
                    BackgroundCssClass="modalBackground" TargetControlID="dummy" X="200" Y="200">
                </asp:ModalPopupExtender>
                <asp:Panel ID="popPanel" runat="server" Width="300px" BackColor="White" Style="display: none">
                    <table cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                            <td class="GridLabelBG">
                                <asp:Label ID="popLabel" runat="server" Text="Title" SkinID="skGridLabel" />
                            </td>
                        </tr>
                        <tr>
                            <td class="GridBorder">
                                <p style="text-align: center;">
                                    <asp:Label ID="popMessage" runat="server" Text="Message" />
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
