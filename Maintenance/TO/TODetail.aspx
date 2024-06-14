<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/TO/TOMaster.master"
    AutoEventWireup="false" CodeFile="TODetail.aspx.vb" Inherits="Maintenance_TO_TODetail" %>

<asp:Content ID="Content2" ContentPlaceHolderID="TOTitle" runat="Server">
    Tour Operator Details
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="TOContent" runat="Server">
    <div class="Blue">
        <table cellpadding="0" cellspacing="2">
            <tr>
                <td class="GridBorder">
                    <asp:DetailsView ID="dsAgencyDet" runat="server" AutoGenerateRows="False" DataKeyNames="TourOpID"
                        DataSourceID="dsTODetail" SkinID="skDetailView" Width="600px">
                        <Fields>
                            <asp:TemplateField HeaderText="Tour Operator" SortExpression="TourOp">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtTourOp" runat="server" Text='<%# Bind("TourOp") %>' CssClass="TextBox" />
                                    <asp:RequiredFieldValidator ID="reqTO" runat="server" ErrorMessage="This is required field!" Display="None" 
                                        ControlToValidate="txtTourOp" />
                                    <asp:ValidatorCalloutExtender ID="reqTOExt" runat="server" HighlightCssClass="WaterMark" 
                                        TargetControlID="reqTO" />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtTourOp1" runat="server" Text='<%# Bind("TourOp") %>' CssClass="TextBox" />
                                    <asp:RequiredFieldValidator ID="reqTO1" runat="server" ErrorMessage="This is required field!" Display="None"
                                        ControlToValidate="txtTourOp1" />
                                    <asp:ValidatorCalloutExtender ID="reqTOExt1" runat="server" HighlightCssClass="WaterMark" 
                                        TargetControlID="reqTO1" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("TourOp") %>' />
                                </ItemTemplate>
                                <HeaderStyle CssClass="GridRow2B" Font-Bold="True" />
                                <ItemStyle CssClass="GridRow2B" Font-Bold="True" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="TourOpID" SortExpression="TourOpID" InsertVisible="false" >
                                <%--
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("TourOpID") %>' />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtTOId" runat="server" Text='<%# Bind("TourOpID") %>' CssClass="TextBox" />
                                    <asp:RequiredFieldValidator ID="reqTOId" runat="server" ErrorMessage="This is required field!" ControlToValidate="txtTOId" Display="None" />
                                    <asp:ValidatorCalloutExtender ID="reqTOIdExt" runat="server" TargetControlID="reqTOId" HighlightCssClass="WaterMark" />
                                    <asp:CompareValidator ID="RangeValidator1" runat="server" Display="None" ControlToValidate="txtTOId" ErrorMessage="This is number field!" Operator="DataTypeCheck" Type="Integer"/>
                                    <asp:ValidatorCalloutExtender ID="RangeValidator1_ValidatorCalloutExtender" runat="server" Enabled="True" TargetControlID="RangeValidator1" HighlightCssClass="WaterMark" />
                                </InsertItemTemplate>
                                --%>
                                <InsertItemTemplate>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("TourOpID") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Market" SortExpression="MarketId">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsMarkets" DataTextField="Market"
                                        DataValueField="MarketID" SelectedValue='<%# Bind("MarketId") %>' CssClass="TextBox" />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="dsMarkets" DataTextField="Market"
                                        DataValueField="MarketID" SelectedValue='<%# Bind("MarketId") %>' CssClass="TextBox" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("MarketId") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Parent TourOperator" SortExpression="ParentTourOpId">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList9" runat="server" DataSourceID="dsTOParent" DataTextField="TourOp"
                                        DataValueField="TourOpID" SelectedValue='<%# Bind("ParentTourOpId") %>' AppendDataBoundItems="True"
                                        CssClass="TextBox" Width="350px" >
                                        <asp:ListItem Value="">not set</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:CheckBox ID="CheckBox1" runat="server" Text="Billing Parent" Checked='<%# Bind("BillingParent") %>' />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="dsTOParent" DataTextField="TourOp"
                                        DataValueField="TourOpID" SelectedValue='<%# Bind("ParentTourOpId") %>' AppendDataBoundItems="True"
                                        CssClass="TextBox" Width="350px" >
                                        <asp:ListItem Value="">not set</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:CheckBox ID="CheckBox1" runat="server" Text="Billing Parent" Checked='<%# Bind("BillingParent") %>' />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label101" runat="server" Text='<%# Eval("ParentTourOp") %>' Width="350px" />
                                    <asp:CheckBox ID="CheckBox1" runat="server" Text="Billing Parent" Checked='<%# Eval("BillingParent") %>' Enabled="false"  Visible='<%# Eval("BillingParent") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="BillingName" HeaderText="Billing Name" SortExpression="BillingName">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Commision" SortExpression="Commision">
                                <EditItemTemplate>
                                    <asp:CheckBox ID="cbCommision" runat="server" ToolTip="Appies" Checked='<%# Bind("Commision") %>' />
                                    <asp:TextBox ID="txtCommisionRate" runat="server" Text='<%# Bind("CommisionRate") %>' Width="443px" CssClass="TextBox" />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:CheckBox ID="cbCommision" runat="server" ToolTip="Appies" Checked='<%# Bind("Commision") %>' /> 
                                    <asp:TextBox ID="txtCommisionRate" runat="server" Text='<%# Bind("CommisionRate") %>' Width="443px" CssClass="TextBox" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbCommision" runat="server" ToolTip="Appies" Checked='<%# Eval("Commision") %>' Enabled="false" />
                                    <asp:Label ID="lblCommisionRate" runat="server" Text='<%# Eval("CommisionRate") %>' /> %
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="RNC" HeaderText="RNC" SortExpression="RNC">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ZipCode" HeaderText="Zip Code" SortExpression="ZipCode">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Country" SortExpression="CountryCode">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="cbCountryCode" runat="server" AppendDataBoundItems="True" 
                                        DataSourceID="dsCountry" DataTextField="Country" CssClass="TextBox"
                                        DataValueField="CountryCode" SelectedValue='<%# Bind("CountryCode") %>'>
                                        <asp:ListItem Value="">not set</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="cbCountryCode" runat="server" AppendDataBoundItems="True" 
                                        DataSourceID="dsCountry" DataTextField="Country" CssClass="TextBox"
                                        DataValueField="CountryCode" SelectedValue='<%# Bind("CountryCode") %>'>
                                        <asp:ListItem Value="">not set</asp:ListItem>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    (<asp:Label ID="lblCountryCode" runat="server" Text='<%# Bind("CountryCode") %>' />)
                                    &nbsp;<asp:Label ID="lblCountry" runat="server" Text='<%# Bind("Country") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--<asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>--%>
                            <asp:BoundField DataField="Tel1" HeaderText="Tel1" SortExpression="Tel1">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Tel2" HeaderText="Tel2" SortExpression="Tel2">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Tel3" HeaderText="Tel3" SortExpression="Tel3">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Fax" HeaderText="Fax" SortExpression="Fax">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="URL" HeaderText="URL" SortExpression="URL">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Email1" HeaderText="Email1" SortExpression="Email1">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Email2" HeaderText="Email2" SortExpression="Email2">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Pay Mode" SortExpression="PayModeId">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="dsPayMode" DataTextField="PayMode"
                                        DataValueField="PayModeID" SelectedValue='<%# Bind("PayModeId") %>' AppendDataBoundItems="True"
                                        CssClass="TextBox">
                                        <asp:ListItem Value="">not set</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="dsPayMode" DataTextField="PayMode"
                                        DataValueField="PayModeID" SelectedValue='<%# Bind("PayModeId") %>' CssClass="TextBox" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("PayModeId") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Pay Condition" SortExpression="PayCondId">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="dsPayCond" DataTextField="PayCond"
                                        DataValueField="PayCondID" SelectedValue='<%# Bind("PayCondId") %>' CssClass="TextBox" />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="dsPayCond" DataTextField="PayCond"
                                        DataValueField="PayCondID" SelectedValue='<%# Bind("PayCondId") %>' CssClass="TextBox" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("PayCondId") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Pay Cond Ext" SortExpression="PayCondExtId">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="dsCondExt" DataTextField="Description"
                                        DataValueField="PayCondExtID" SelectedValue='<%# Bind("PayCondExtId") %>' AppendDataBoundItems="True"
                                        CssClass="TextBox">
                                        <asp:ListItem Value="">not set</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList9" runat="server" DataSourceID="dsCondExt" DataTextField="Description"
                                        DataValueField="PayCondExtID" SelectedValue='<%# Bind("PayCondExtId") %>' AppendDataBoundItems="True"
                                        CssClass="TextBox">
                                        <asp:ListItem Value="">not set</asp:ListItem>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("PayCondExtId") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="CreditDays" HeaderText="Credit Days" SortExpression="CreditDays">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active"  />
                            <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Created" HeaderText="Created" SortExpression="Created" ReadOnly="true" InsertVisible="false" DataFormatString="{0:d}" />
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />&nbsp;
                                    <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />&nbsp;
                                    <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />&nbsp;
                                    <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="New" Text="New" />&nbsp;
                                    <asp:Button ID="Button3" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" 
                                        OnClientClick="return confirm('Are you sure you want to delete the record')" />
                                </ItemTemplate>
                                <ControlStyle BorderStyle="None" CssClass="Button" Font-Size="10pt" ForeColor="White" />
                                <ItemStyle CssClass="ComandRow2T" Height="30px" HorizontalAlign="Right" VerticalAlign="Middle" />
                            </asp:TemplateField>
                        </Fields>
                        <FieldHeaderStyle Width="120px" />
                    </asp:DetailsView>
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
                        <asp:Label ID="popLabel" runat="server" Text="Delete data" SkinID="skGridLabel" />
                    </td>
                </tr>
                <tr>
                    <td class="GridBorder">
                        <p style="text-align: center;">
                            <asp:Label ID="popMessage" runat="server" Text="Are you sure?" />
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
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
    </div>
    <asp:ObjectDataSource ID="dsTODetail" runat="server" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataByTOID" UpdateMethod="Update" DeleteMethod="Delete" InsertMethod="InsertQuery"
        TypeName="TourOperTableAdapters.TourOpTableAdapter">
        <DeleteParameters>
            <asp:Parameter Name="Original_TourOpID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="MarketId" Type="String" />
            <asp:Parameter Name="ParentTourOpId" Type="Int32" />
            <asp:Parameter Name="TourOp" Type="String" />
            <asp:Parameter Name="BillingName" Type="String" />
            <asp:Parameter Name="RNC" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="Tel1" Type="String" />
            <asp:Parameter Name="Tel2" Type="String" />
            <asp:Parameter Name="Tel3" Type="String" />
            <asp:Parameter Name="Fax" Type="String" />
            <asp:Parameter Name="URL" Type="String" />
            <asp:Parameter Name="Email1" Type="String" />
            <asp:Parameter Name="Email2" Type="String" />
            <asp:Parameter Name="PayModeId" Type="String" />
            <asp:Parameter Name="PayCondId" Type="String" />
            <asp:Parameter Name="PayCondExtId" Type="Int32" />
            <asp:Parameter Name="CreditDays" Type="Int32" />
            <asp:Parameter Name="BillingParent" Type="Boolean" />
            <asp:Parameter Name="Active" Type="Boolean" />
            <asp:Parameter Name="Note" Type="String" />
            <asp:Parameter Name="CountryCode" Type="String" />
            <asp:Parameter Name="Commision" Type="Boolean" />
            <asp:Parameter Name="CommisionRate" Type="Decimal" />
            <asp:Parameter Name="Original_TourOpID" Type="Int32" />
            <asp:Parameter Name="TourOpID" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="TOID" QueryStringField="TOID" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="MarketId" Type="String" />
            <asp:Parameter Name="ParentTourOpId" Type="Int32" />
            <asp:Parameter Name="TourOp" Type="String" />
            <asp:Parameter Name="BillingName" Type="String" />
            <asp:Parameter Name="RNC" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="CountryCode" Type="String" />
            <asp:Parameter Name="Tel1" Type="String" />
            <asp:Parameter Name="Tel2" Type="String" />
            <asp:Parameter Name="Tel3" Type="String" />
            <asp:Parameter Name="Fax" Type="String" />
            <asp:Parameter Name="URL" Type="String" />
            <asp:Parameter Name="Email1" Type="String" />
            <asp:Parameter Name="Email2" Type="String" />
            <asp:Parameter Name="PayModeId" Type="String" />
            <asp:Parameter Name="PayCondId" Type="String" />
            <asp:Parameter Name="PayCondExtId" Type="Int32" />
            <asp:Parameter Name="CreditDays" Type="Int32" />
            <asp:Parameter Name="BillingParent" Type="Boolean" />
            <asp:Parameter Name="Active" Type="Boolean" />
            <asp:Parameter Name="Note" Type="String" />
            <asp:Parameter Name="Commision" Type="Boolean" />
            <asp:Parameter Name="CommisionRate" Type="Decimal" />
            <asp:Parameter Direction="InputOutput" Name="NewID" Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsMarkets" runat="server"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="TourOperTableAdapters.MarketTableAdapter" />
    <asp:ObjectDataSource ID="dsPayMode" runat="server"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="TourOperTableAdapters.PayModeTableAdapter" />
    <asp:ObjectDataSource ID="dsCondExt" runat="server"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="TourOperTableAdapters.PayCondExtTableAdapter" /> 
    <asp:ObjectDataSource ID="dsPayCond" runat="server"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="TourOperTableAdapters.PayCondTableAdapter" />
    <asp:ObjectDataSource ID="dsTOParent" runat="server"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
        TypeName="dsTourOpSpeedTableAdapters.TourOpParentTableAdapter" >
        <SelectParameters>
            <asp:QueryStringParameter Name="TourOpID" QueryStringField="TOID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsCountry" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="dsTourOpSpeedTableAdapters.CountryCodeTableAdapter">
    </asp:ObjectDataSource>
</asp:Content>
