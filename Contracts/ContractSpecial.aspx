<%@ Page Title="" Language="VB" MasterPageFile="~/Contracts/masterContracts.master"
    AutoEventWireup="false" EnableEventValidation="false" CodeFile="ContractSpecial.aspx.vb"
    Inherits="Contracts_ContractSpecial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Contracts Special
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContractContent" runat="Server">
    <asp:UpdatePanel ID="UpdatePanelMain" runat="server">
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
                <%--<table cellpadding="0" cellspacing="0" width="890px">--%>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="GridLabelBG">
                            <asp:Label ID="lbAttachNo" runat="server" SkinID="skGridLabel">Available Specials &nbsp;<asp:Image
                                ID="imgExpNo" runat="server" ImageUrl="~/Images/collapse_.png" />&nbsp; </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder">
                            <asp:Panel ID="divContracts" runat="server">
                                <asp:GridView ID="gvContracts" runat="server" DataSourceID="dsFilteredContracts"
                                    DataKeyNames="SpecialID" SkinID="skGridView" AutoGenerateColumns="False" AllowPaging="True"
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
                                            <ItemStyle Width="70px" HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:TemplateField SortExpression="SpecialID">
                                            <ItemTemplate>
                                                (<asp:HyperLink ID="lnkSpecial" runat="server" NavigateUrl='<%# "~/Contracts/Special/DetailSpec.aspx?SpecialID=" & Eval("SpecialID") %>'
                                                    Text='<%# Eval("SpecialID") %>' />)&nbsp;
                                            </ItemTemplate>
                                            <ItemStyle Width="50px" HorizontalAlign="Right" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Title" SortExpression="Title">
                                            <ItemTemplate>
                                                <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Title") %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="250px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="BookingCode" HeaderText="Book.Code" SortExpression="BookingCode">
                                            <ItemStyle Width="100px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category"
                                            Visible="false">
                                            <ItemStyle Width="200px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="RateCodeId" HeaderText="Rate Code" SortExpression="RateCodeId">
                                            <ItemStyle Width="100px" />
                                        </asp:BoundField>
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
                                        Tehere are no specials that can be attached to the contract.
                                    </EmptyDataTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:GridView>
                                <asp:ObjectDataSource ID="dsFilteredContracts" runat="server" OldValuesParameterFormatString="original_{0}"
                                    SelectMethod="GetData" TypeName="dsSpecialTableAdapters.SelectSpecial4ContractTableAdapter">
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
                            <asp:Label ID="lblAttachYes" runat="server" SkinID="skGridLabel">Attached Specials &nbsp;<asp:Image
                                ID="imgExpYes" runat="server" ImageUrl="~/Images/collapse_.png" />&nbsp; </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder">
                            <asp:Panel ID="divAttached" runat="server">
                                <asp:GridView ID="gvSpecials" runat="server" SkinID="skGridView" DataSourceID="dsContSpec"
                                    DataKeyNames="SpecialId" AllowPaging="True" PageSize="5">
                                    <RowStyle Wrap="False" />
                                    <Columns>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbDettach" runat="server" CausesValidation="False" 
                                                    CommandName="Dettach" CommandArgument='<%# Eval("SpecialId") %>'
                                                    OnClientClick="return confirm('Are you sure you want to DEATTACH special from contract?')"
                                                    Visible='<%# Eval("Active") %>' 
                                                    Text="Deattach" />
                                            </ItemTemplate>
                                            <ItemStyle Width="70px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbSuspend" runat="server" CausesValidation="False" 
                                                    CommandName="Suspend" CommandArgument='<%# Eval("SpecialId") %>' 
                                                    OnClientClick="return confirm('Are you sure you want to SUSPEND special attachment to contract?')" 
                                                    Visible='<%# Eval("Active") %>' 
                                                    Text="Suspend" />
                                                <asp:Label ID="txtSusp" runat="server" Text="Suspended" ForeColor="Red" Font-Italic="true"
                                                    Font-Size="80%" Visible='<%# iif(Eval("Active") ,false,true) %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="70px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField SortExpression="SpecialId">
                                            <ItemTemplate>
                                                (<asp:HyperLink ID="lnkSpecial1" runat="server" NavigateUrl='<%# "~/Contracts/Special/DetailSpec.aspx?SpecialID=" & Eval("SpecialID") %>'
                                                    Text='<%# Eval("SpecialID") %>' />)&nbsp;
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Right" Width="50px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Title" SortExpression="Title">
                                            <ItemTemplate>
                                                <asp:Label ID="lblTitle1" runat="server" Text='<%# Eval("Title") %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="250px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="BookingCode" HeaderText="Book.Code" SortExpression="BookingCode">
                                            <ItemStyle Width="100px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category"
                                            Visible="false">
                                            <ItemStyle Width="200px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="SpoCodeId" HeaderText="Rate Code" SortExpression="SpoCodeId">
                                            <ItemStyle Width="100px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Start" HeaderText="Start" SortExpression="Start" DataFormatString="{0:d}">
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Finish" HeaderText="End" SortExpression="Finish" DataFormatString="{0:d}">
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        Tehere are no attached specials to the contract.
                                    </EmptyDataTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:GridView>
                                <asp:ObjectDataSource ID="dsContSpec" runat="server" SelectMethod="GetData"
                                    TypeName="dsSpecialTableAdapters.ContractSpecialByCIDTableAdapter">
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
                    PopupDragHandleControlID="popLabel" CancelControlID="btnNo" DropShadow="True"
                    BackgroundCssClass="modalBackground" TargetControlID="dummy" X="200" Y="200">
                </asp:ModalPopupExtender>
                <asp:Panel ID="popPanel" runat="server" Width="300px" BackColor="White" Style="display: none">
                    <table cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                            <td class="GridLabelBG">
                                <asp:Label ID="popLabel" runat="server" Text="Delete data" SkinID="skGridLabel"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="GridBorder">
                                <p style="text-align: center;">
                                    <asp:Label ID="popMessage" runat="server" Text="Are you sure?"></asp:Label>
                                </p>
                                <p style="text-align: right;" class="GridRow2TB">
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
