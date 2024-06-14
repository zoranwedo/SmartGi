<%@ Page Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" MaintainScrollPositionOnPostback="true"
    CodeFile="TourOpSpeedEdit.aspx.vb" Inherits="Maintenance_TO_TourOpSpeedEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Tour Operator Speed Edit
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" Runat="Server">
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="Label1" runat="server" Text="Tour Operators" SkinID="skGridLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="Green GridBorder">
                    <b>Filter</b>&nbsp;
                    <asp:TextBox ID="txtFilter" runat="server" CssClass="TextBox" Width="300" />&nbsp;
                    <asp:CheckBox ID="cbFilter" runat="server" Checked="true" Text="Only Active" />&nbsp;
                    <asp:Button ID="btFilter" runat="server" Text="Filter" SkinID="skBtnFilter" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvTourOp" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" 
                        SkinID="skGridView" DataKeyNames="TourOpID" DataSourceID="dsTourOp" >
                        <Columns>
                            <asp:TemplateField >
                                <ItemTemplate>
                                    <asp:Label ID="Label0" runat="server" Text='<%# Eval("TourOpID") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="lblTourOpID" runat="server" Text='<%# Eval("TourOpID") %>' />
                                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("TourOp") %>' />
                                    <asp:HiddenField ID="HiddenField16" runat="server" Value='<%# Bind("RNC") %>' />
                                    <asp:HiddenField ID="HiddenField2" runat="server" Value='<%# Bind("State") %>' />
                                    <asp:HiddenField ID="HiddenField3" runat="server" Value='<%# Bind("ZipCode") %>' />
                                    <asp:HiddenField ID="HiddenField4" runat="server" Value='<%# Bind("Tel1") %>' />
                                    <asp:HiddenField ID="HiddenField5" runat="server" Value='<%# Bind("Tel2") %>' />
                                    <asp:HiddenField ID="HiddenField6" runat="server" Value='<%# Bind("Tel3") %>' />
                                    <asp:HiddenField ID="HiddenField7" runat="server" Value='<%# Bind("Fax") %>' />
                                    <asp:HiddenField ID="HiddenField8" runat="server" Value='<%# Bind("URL") %>' />
                                    <asp:HiddenField ID="HiddenField9" runat="server" Value='<%# Bind("Email1") %>' />
                                    <asp:HiddenField ID="HiddenField10" runat="server" Value='<%# Bind("Email2") %>' />
                                    <asp:HiddenField ID="HiddenField11" runat="server" Value='<%# Bind("PayModeId") %>' />
                                    <asp:HiddenField ID="HiddenField12" runat="server" Value='<%# Bind("PayCondId") %>' />
                                    <asp:HiddenField ID="HiddenField13" runat="server" Value='<%# Bind("PayCondExtId") %>' />
                                    <asp:HiddenField ID="HiddenField14" runat="server" Value='<%# Bind("CreditDays") %>' />
                                    <asp:HiddenField ID="HiddenField15" runat="server" Value='<%# Bind("BillingParent") %>' />
                                </EditItemTemplate>
                                <ItemStyle Width="60px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="TourOp" HeaderText="Tour Operator" SortExpression="TourOp" ReadOnly="true">
                                <ItemStyle Width="300px" />
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="TourOp" SortExpression="TourOp">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Market" SortExpression="MarketId">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("MarketId") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsMarket" 
                                        DataTextField="Market" DataValueField="MarketID" CssClass="TextBox"
                                        SelectedValue='<%# Bind("MarketId") %>'>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsMarket" runat="server" 
                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                        TypeName="dsTourOpSpeedTableAdapters.MarketTableAdapter">
                                    </asp:ObjectDataSource>
                                </EditItemTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Parent Tour Op." SortExpression="ParentTourOpId">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("ParentTourOp") %>'/>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:HiddenField ID="hfTourOpID" runat="server" Value='<%# Eval("TourOpID") %>' />
                                    <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" 
                                        DataSourceID="dsParent" DataTextField="TourOp" DataValueField="TourOpID" 
                                        SelectedValue='<%# Bind("ParentTourOpId") %>' CssClass="TextBox">
                                        <asp:ListItem Value="">none</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsParent" runat="server" 
                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                        TypeName="dsTourOpSpeedTableAdapters.TourOpParentTableAdapter" >
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="hfTourOpID" Name="TourOpID" 
                                                PropertyName="Value" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </EditItemTemplate>
                                <ItemStyle Width="250px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address">
                                <ItemStyle Width="200px" />
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City">
                                <ItemStyle Width="150px" />
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Country Code" SortExpression="CountryCode">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("CountryCode") %>'/>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList3" runat="server" AppendDataBoundItems="True" 
                                        DataSourceID="dsCountry" DataTextField="Country" CssClass="TextBox"
                                        DataValueField="CountryCode" SelectedValue='<%# Bind("CountryCode") %>'>
                                        <asp:ListItem Value="">unknown</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsCountry" runat="server" 
                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                        TypeName="dsTourOpSpeedTableAdapters.CountryCodeTableAdapter">
                                    </asp:ObjectDataSource>
                                </EditItemTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Country" HeaderText="Country" ReadOnly="True" SortExpression="Country">
                                <ItemStyle Width="150px" />
                            </asp:BoundField>
                            <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active">
                                <ItemStyle Width="50px" />
                            </asp:CheckBoxField>
                            <asp:CommandField ShowEditButton="True" >
                                <ItemStyle Width="100px" />
                            </asp:CommandField>
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="dsTourOp" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByFilter" 
                        TypeName="dsTourOpSpeedTableAdapters.TourOpTableAdapter" 
                        UpdateMethod="Update">
                        <UpdateParameters>
                            <asp:Parameter Name="MarketId" Type="String" />
                            <asp:Parameter Name="ParentTourOpId" Type="Int32" />
                            <asp:Parameter Name="TourOp" Type="String" />
                            <asp:Parameter Name="RNC" Type="String" />
                            <asp:Parameter Name="Address" Type="String" />
                            <asp:Parameter Name="City" Type="String" />
                            <asp:Parameter Name="State" Type="String" />
                            <asp:Parameter Name="ZipCode" Type="String" />
                            <asp:Parameter Name="Country" Type="String" />
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
                            <asp:Parameter Name="CountryCode" Type="String" />
                            <asp:Parameter Name="Original_TourOpID" Type="Int32" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtFilter" Name="Filter" PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="cbFilter" Name="Active" PropertyName="Checked" Type="Boolean" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

