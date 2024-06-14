<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" CodeFile="SpecialGroup.aspx.vb" Inherits="Contracts_Special_SpecialGroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Special Group
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" Runat="Server">
    <div class="Blue">
        <table cellpadding="0" cellspacing="0" style="width: 100%;">
            <tr>
                <td class="LocalMenuRow" >
                    <asp:HyperLink ID="linkBack" runat="server" SkinID="skHypLink" NavigateUrl="~/Contracts/Groups.aspx"
                        Text="&lt;&lt; Back to Special Groups" />
                </td>
            </tr>
        </table>
        <br />
        <asp:FormView ID="fvGroup" runat="server" 
            DataKeyNames="SpecGroupID" DataSourceID="dsGroup"
            Width="100%" EnableModelValidation="True">
            <ItemTemplate>
                <table cellpadding="0" cellspacing="0" style="width: 100%;">
                    <tr>
                        <td class="GridLabelBG" colspan="4">
                            <asp:Label ID="TitleHeader" runat="server" SkinID="skGridLabel" 
                                Text='<%# "Group #" & Eval("SpecGroupID") & " (" & Eval("Title") & ")" %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="GridRowClear" style="width: 32px;" rowspan="4">&nbsp;</td>
                        <td class="GridRow1B" style="text-align: left; width: 80px; padding-right: 5px;" nowrap="nowrap">
                            Duration
                        </td>
                        <td class="GridRow1B" nowrap="nowrap" 
                            style="text-align: left; width: 450px; padding-right: 5px;">
                            <asp:Label ID="DurationHeader" runat="server" Text='<%# Eval("gStart", "{0:d}") & " - " & Eval("gFinish", "{0:d}") %>' />
                        </td>
                        <td rowspan="4" >&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="GridRow1B" nowrap="nowrap" style="text-align: left; padding-right: 5px;">
                            Hotel
                        </td>
                        <td class="GridRow1B" nowrap="nowrap" style="text-align: left; padding-right: 5px;">
                            <asp:Label ID="HotelHeader" runat="server" Text='<%# Eval("Hotel") %>' />
                        </td>
                    <tr>
                        <td class="GridRow1B" nowrap="nowrap" style="text-align: left; padding-right: 5px;">
                            Book.Code
                        </td>
                        <td class="GridRow1B" nowrap="nowrap" style="text-align: left; padding-right: 5px;">
                            <asp:Label ID="BkCodeHeader" runat="server" Text='<%# Eval("BookingCode") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="GridRow2B" nowrap="nowrap" style="text-align: left; padding-right: 5px;">
                            Book.Window
                        </td>
                        <td class="GridRow2B" nowrap="nowrap" style="text-align: left; padding-right: 5px;">
                            <asp:Label ID="BkWindowHeader" runat="server"  Text='<%# Eval("BkStart", "{0:d}") & " - " & Eval("BkFinish", "{0:d}") %>' />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:FormView>
        <asp:ObjectDataSource ID="dsGroup" runat="server"
            TypeName="dsSpecAssociationTableAdapters.SpecialGroupDetailTableAdapter"
            SelectMethod="GetData">
            <SelectParameters>
                <asp:QueryStringParameter Name="SpecGroupID" QueryStringField="SpecGroupID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div> 
    <br />

        <div class="Blue" style="margin-top: 5px; margin-left: 25px; margin-bottom: 5px">
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
                            AllowSorting="false" 
                            EnableModelValidation="True" >
                            <Columns>
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
                                        <asp:LinkButton ID="lbRemove" runat="server" Text="Remove" CommandName="Remove" CommandArgument='<%# Bind("SpecialID") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="150px" Font-Bold="true" />
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <div style="width: 1098px; height: 20px;">
                                    Special is not associated to any group
                                </div> 
                            </EmptyDataTemplate>
                        </asp:GridView>
                        <asp:ObjectDataSource ID="dsSpecGroup" runat="server" 
                            TypeName="dsSpecAssociationTableAdapters.SpecialGroupTableAdapter"
                            SelectMethod="GetDataByGroup" >
                            <SelectParameters>
                                <asp:QueryStringParameter Name="SpecGroupID" Type="Int32" QueryStringField="SpecGroupID"/>
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
                                <td class="GridRow1T" style="width: 720px; padding-top: 5px;">
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
                            SelectMethod="GetDataByGroup">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="SpecGroupID" Type="Int32" QueryStringField="SpecGroupID"/>
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="dsLayoutRates" runat="server" 
                                TypeName="dsSpecMatrixTableAdapters.LayoutRatesTableAdapter" 
                                SelectMethod="GetDataByGroup" 
                                OldValuesParameterFormatString="original_{0}" >
                            <SelectParameters>
                                <asp:QueryStringParameter Name="SpecGroupID" QueryStringField="SpecGroupID" 
                                    Type="Int32" />
                                <asp:ControlParameter ControlID="ddlTourOp" Name="TourOpId" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        </asp:Panel> 
                    </td>
                </tr>
            </table>
            <br />
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
                                    <asp:TemplateField SortExpression="SpecialID">
                                        <ItemTemplate>
                                            <%--(<asp:Label ID="Label1" runat="server" Text='<%# Bind("SpecialID") %>'></asp:Label>)--%>
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
                                    <asp:TemplateField HeaderText="Group">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbAssociate" runat="server" Font-Bold="true"
                                                Text='<%# "Associate to " & Iif(Eval("SpecGroupID") Is DBNull.Value,"New Group","Group #" & Eval("SpecGroupID")) %>'
                                                CommandName="Associate" CommandArgument='<%# Bind("SpecialID") %>'
                                                Visible='<%# Eval("l")=1 %>'/>
                                        </ItemTemplate>
                                        <ItemStyle Width="150px" />
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <div style="width: 1098px; height: 20px;">
                                        There are no more specials that can be associated to this group.
                                    </div> 
                                </EmptyDataTemplate>
                            </asp:GridView>
                            <asp:ObjectDataSource ID="dsSpec4Group" runat="server" 
                                TypeName="dsSpecAssociationTableAdapters.SelectSpecial4AssociationTableAdapter"
                                SelectMethod="GetDataByGroup" >
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="SpecGroupID" Type="Int32" QueryStringField="SpecGroupID"/>
                                </SelectParameters>
                            </asp:ObjectDataSource>
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
                            <asp:Label ID="popLabel" runat="server" Text="Delete data" SkinID="skGridLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder">
                            <p style="text-align: center;">
                                <asp:Label ID="popMessage" runat="server" Text="Are you sure?"></asp:Label>
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
</asp:Content>

