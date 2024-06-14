<%@ Page Title="" Language="VB" MasterPageFile="~/Contracts/Special/masterSpecial.master" AutoEventWireup="false" CodeFile="SpecAssociation.aspx.vb" Inherits="Contracts_Special_SpecAssociation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Special Association
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="WizardContent" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanelMain" runat="server">
        <ContentTemplate>
        <div class="Blue">
            <table cellpadding="0" cellspacing="0" >
                <tr>
                    <td class="GridLabelBG">
                        <asp:Label ID="lbSpecGroup" runat="server" SkinID="skGridLabel">Associated Specials</asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="GridBorder">
                        <asp:GridView ID="gvSpecGroup" runat="server" SkinID="skGridView" 
                            AutoGenerateColumns="False" DataSourceID="dsSpecGroup" 
                            DataKeyNames="SpecGroupID"
                            AllowSorting="false" 
                            EnableModelValidation="True" 
                            SelectedIndex="0" >
                            <Columns>
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
                                        <asp:Label ID="Label2" runat="server" Text='<%# "(" & Eval("SpecialID") & ")" %>'  
                                            Visible='<%# Eval("SpecialID")=Request.QueryString("SpecialID") %>' />
                                         <asp:HyperLink ID="hlSpecial" runat="server" 
                                            NavigateUrl='<%# "~/Contracts/Special/DetailSpec.aspx?SpecialID=" & Eval("SpecialID") %>' 
                                            Text='<%# "(" & Eval("SpecialID") & ")" %>' 
                                            Visible='<%# Eval("SpecialID")<>Request.QueryString("SpecialID") %>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" Width="60px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title">
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
                                <asp:TemplateField HeaderText="" >
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbRemove" runat="server" Text="Remove"
                                            CommandName="Remove" CommandArgument='<%# Bind("SpecialID") %>'
                                            Visible='<%# Eval("SpecialID")=Request.QueryString("SpecialID") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="50px" Font-Bold="true" />
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <div style="width: 1098px; height: 20px;">
                                    Special is not associated to any group
                                </div> 
                            </EmptyDataTemplate>
                            <SelectedRowStyle CssClass="GridRow1TB" />
                        </asp:GridView>
                        <asp:ObjectDataSource ID="dsSpecGroup" runat="server" 
                            TypeName="dsSpecAssociationTableAdapters.SpecialGroupTableAdapter"
                            SelectMethod="GetDataBySpecial" >
                            <SelectParameters>
                                <asp:QueryStringParameter Name="SpecialID" Type="Int32" QueryStringField="SpecialID"/>
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <asp:Panel ID="pnlExport" runat="server" >
                        <%--
                        <div class="GridRow1T" style="margin-top: 2px; padding-top: 5px; text-align: right;">
                            <asp:Label ID="Label3" runat="server" Width="170px" Font-Bold="true">
                                Export Group Rate Sheet For:&nbsp;
                            </asp:Label> 
                            <asp:DropDownList ID="ddlTourOp" runat="server" CssClass="TextBox" Width="900px" 
                                DataSourceID="dsTourOp" DataTextField="TourOp" DataValueField="TourOpId" />
                        </div>
                        <div class="Green" style="padding-top: 5px; float: right;">
                            <asp:Button ID="btEDS" runat="server" Text="Karisma Layout" SkinID="skBtnBase" />
                            <asp:Button ID="btGOGO" runat="server" Text="GOGO Layout" SkinID="skBtnBase" /> 
                        </div>
                        --%>
                        <table cellpadding="0" cellspacing="0" style="margin-top: 2px;" >
                            <tr>
                                <td class="GridRow1T" style="width: 170px; padding-top: 5px;">
                                    Export Group Rate Sheet For:
                                </td>
                                <td class="GridRow1T" style="width: 702px; padding-top: 5px;">
                                    <asp:DropDownList ID="ddlTourOp" runat="server" CssClass="TextBox"
                                        DataSourceID="dsTourOp" DataTextField="TourOp" DataValueField="TourOpId" />
                                </td>
                                <td class="GridRow1T" style="width: 210px; padding-top: 5px;">
                                <div class="Green" >
                                    <asp:Button ID="btEDS" runat="server" Text="Karisma Layout" SkinID="skBtnBase" />
                                    <asp:Button ID="btGOGO" runat="server" Text="GOGO Layout" SkinID="skBtnBase" /> 
                                </div>
                                </td>
                            </tr>
                        </table> 
                        <asp:ObjectDataSource ID="dsTourOp" runat="server" 
                            TypeName="dsSpecAssociationTableAdapters.GroupTourOpTableAdapter"
                            SelectMethod="GetDataBySpecial">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="SpecialID" Type="Int32" QueryStringField="SpecialID"/>
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="dsLayoutRates" runat="server" 
                                TypeName="dsSpecMatrixTableAdapters.LayoutRatesTableAdapter" 
                                SelectMethod="GetDataByGroup" >
                            <SelectParameters>
                                <asp:ControlParameter ControlID="gvSpecGroup" Name="SpecGroupID" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="ddlTourOp" Name="TourOpId" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        </asp:Panel> 
                    </td>
                </tr>
            </table>
            <br />
            <asp:Panel ID="pnlSpec4Group" runat="server" Visible="False">
                <table cellpadding="0" cellspacing="0" >
                    <tr>
                        <td class="GridLabelBG">
                            <asp:Label ID="lblSpec4Group" runat="server" SkinID="skGridLabel">Specials For Association</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder">
                            <asp:GridView ID="gvSpec4Group" runat="server" SkinID="skGridView" 
                                AutoGenerateColumns="False" DataSourceID="dsSpec4Group"
                                AllowSorting="false" 
                                EnableModelValidation="True" >
                                <Columns>
                                    <asp:TemplateField HeaderText="Group">
                                        <ItemTemplate>
                                            <%--<asp:Label ID="Label3" runat="server" Text='<%# Bind("l") %>' ForeColor="Red" />--%>
                                            <asp:LinkButton ID="lbAssociateSP" runat="server" 
                                                Text="Associate to New Group"
                                                CommandName="AssociateSP" CommandArgument='<%# Bind("SpecialID") %>'
                                                Visible='<%# (Eval("l")=1) AND (Eval("SpecGroupID") Is DBNull.Value) %>' />
                                            <asp:LinkButton ID="lbAssociateGR" runat="server" 
                                                Text='<%# "Associate to Group #" & Eval("SpecGroupID") %>'
                                                CommandName="AssociateGR" CommandArgument='<%# Bind("SpecGroupID") %>'
                                                Visible='<%# (Eval("l")=1) AND (Eval("SpecGroupID") IsNot DBNull.Value) %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="150px" Font-Bold="true" />
                                    </asp:TemplateField>
                                    <asp:TemplateField SortExpression="SpecialID">
                                        <ItemTemplate>
                                            <%--(<asp:Label ID="Label1" runat="server" Text='<%# Bind("SpecialID") %>' />)--%>
                                            (<asp:HyperLink ID="hlSpecial4" runat="server" 
                                                NavigateUrl='<%# "~/Contracts/Special/DetailSpec.aspx?SpecialID=" & Eval("SpecialID") %>' 
                                                Text='<%# Eval("SpecialID") %>' />)
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" Width="60px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title">
                                    <ItemStyle Width="300px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="RateCodeId" HeaderText="Rate Code" 
                                        SortExpression="RateCodeId">
                                    <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="BookingCode" HeaderText="Book.Code" 
                                        SortExpression="BookingCode">
                                    <ItemStyle Width="100px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="BkStart" DataFormatString="{0:d}" 
                                        HeaderText="Book.Start" SortExpression="BkStart">
                                    <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="BkFinish" DataFormatString="{0:d}" 
                                        HeaderText="Book.Finish" SortExpression="BkFinish">
                                    <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Start" DataFormatString="{0:d}" HeaderText="Start" 
                                        SortExpression="Start">
                                    <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Finish" DataFormatString="{0:d}" HeaderText="Finish" 
                                        SortExpression="Finish">
                                    <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Description" HeaderText="Description" 
                                        SortExpression="Description" Visible="False" />
                                    <asp:TemplateField HeaderText="Active" SortExpression="StateId">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="cbActive" runat="server" Checked='<%# Eval("StateId")>0 %>' Enabled="false" />
                                        </ItemTemplate>
                                        <ItemStyle Width="50px" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:ObjectDataSource ID="dsSpec4Group" runat="server" 
                                TypeName="dsSpecAssociationTableAdapters.SelectSpecial4AssociationTableAdapter"
                                SelectMethod="GetDataBySpecial" >
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="SpecialID" Type="Int32" QueryStringField="SpecialID"/>
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                </table>
            </asp:Panel>

            <asp:HiddenField ID="dummy" runat="server" />
            <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
                PopupDragHandleControlID="popLabel" CancelControlID="btnNo" DropShadow="True"
                BackgroundCssClass="modalBackground" TargetControlID="dummy" X="200" Y="200">
            </asp:ModalPopupExtender>
            <asp:Panel ID="popPanel" runat="server" Width="300px" BackColor="White" Style="display: none">
                <table cellpadding="0" cellspacing="0" style="width: 100%;">
                    <tr>
                        <td class="GridLabelBG">
                            <asp:Label ID="popLabel" runat="server" Text="Delete data" SkinID="skGridLabel" />
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder">
                            <p style="text-align: center;">
                                <asp:Label ID="popMessage" runat="server" Text="Are you sure?" />
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
        </ContentTemplate>
    </asp:UpdatePanel>  
</asp:Content>

