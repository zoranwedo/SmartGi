<%@ Page Language="VB" MasterPageFile="~/Maintenance/Accounting/masterTypes.master" AutoEventWireup="false" 
    CodeFile="AccCorrections.aspx.vb" Inherits="Maintenance_Accounting_AccCorrections" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Correction Documents
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AccountContent" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="dummy" runat="server" />
            <div class="Blue">
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="GridLabelBG">
                            <asp:Label ID="lblMarket" runat="server" Text="Correction Documents" SkinID="skGridLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder">
                            <asp:GridView ID="gvCorrections" runat="server" SkinID="skGridView" AllowSorting="True"
                                AutoGenerateColumns="False" DataKeyNames="TrDocID" 
                                DataSourceID="dsAccCorrections">
                                <Columns>
                                    <asp:TemplateField HeaderText="DocClass" SortExpression="TrDocClass">
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("TrDocClass") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="60px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TypeClass" SortExpression="TrTypeClass">
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("TrTypeClass") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="60px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Class" SortExpression="TrClass">
                                        <ItemTemplate>
                                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("TrClass") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TrCode" SortExpression="TrCode">
                                        <ItemTemplate>
                                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("TrCode") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="80px" Font-Bold="true" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="AccType" SortExpression="AccountTypeID">
                                        <ItemTemplate>
                                            (<asp:Label ID="Label2" runat="server" Text='<%# Bind("AccountTypeID") %>' />)
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("AccountType") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TranType" SortExpression="TranTypeID">
                                        <ItemTemplate>
                                            (<asp:Label ID="Label3" runat="server" Text='<%# Bind("TranTypeID") %>' />)
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("TranType") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="DocType" SortExpression="DocTypeID">
                                        <ItemTemplate>
                                            (<asp:Label ID="Label4" runat="server" Text='<%# Bind("DocTypeID") %>' />)
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("DocType") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sign" SortExpression="TrSign">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("TrSign") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="50px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TrOrd" SortExpression="TrOrd">
                                        <ItemTemplate>
                                            <asp:Label ID="Label12" runat="server" Text='<%# Bind("TrOrd") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="50px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="TrAccount" HeaderText="TrAccount" SortExpression="TrAccount" ReadOnly="True">
                                        <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Description" SortExpression="TrDescription">
                                        <ItemTemplate>
                                            <asp:Label ID="Label13" runat="server" Text='<%# Bind("TrDescription") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="400px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField InsertVisible="False" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnRemove" runat="server" 
                                                CommandName="RemoveCorrection" CommandArgument='<%# Bind("TrDocID") %>'
                                                ToolTip="Remove document from corrections"
                                                ImageUrl="~/Images/delete_inline.gif" OnClientClick="if (!confirm('Are you sure you want to remove this document from corrections?')) return;" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:GridView>
                            <asp:ObjectDataSource ID="dsAccCorrections" runat="server" 
                                TypeName="dsAccCorrectionTableAdapters.AccCorrectionTableAdapter"
                                SelectMethod="GetData" OldValuesParameterFormatString="original_{0}">
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="GridLabelBG">
                            <asp:Label ID="Label14" runat="server" Text="Include in Corrections" SkinID="skGridLabel" />
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder">
                            <div class="Green">
                                <table cellpadding="0" cellspacing="0" class="GridBorder" width="100%">
                                    <tr>
                                        <td style="width: 30px; padding-right: 5px;" >
                                            Filter
                                        </td>
                                        <td style="width: 300px; padding-right: 5px;">
                                            <asp:TextBox ID="fltDocCode" runat="server" CssClass="TextBox" />
                                            <asp:TextBoxWatermarkExtender ID="fltDocCode_TextBoxWatermarkExtender" 
                                                runat="server" TargetControlID="fltDocCode" WatermarkCssClass="WaterMark" 
                                                WatermarkText="Enter part of the Document Code to search" />
                                        </td>
                                        <td>
                                            <asp:Button ID="btFilter" runat="server" SkinID="skBtnBase" Text="Filter"/>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <asp:GridView ID="gvNoCorrections" runat="server" SkinID="skGridView" AllowSorting="True"
                                AutoGenerateColumns="False" DataKeyNames="TrDocID" 
                                DataSourceID="dsAccNoCorrections">
                                <Columns>
                                    <asp:TemplateField HeaderText="DocClass" SortExpression="TrDocClass">
                                        <ItemTemplate>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("TrDocClass") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="60px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TypeClass" SortExpression="TrTypeClass">
                                        <ItemTemplate>
                                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("TrTypeClass") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="60px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Class" SortExpression="TrClass">
                                        <ItemTemplate>
                                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("TrClass") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TrCode" SortExpression="TrCode">
                                        <ItemTemplate>
                                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("TrCode") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="80px" Font-Bold="true" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="AccType" SortExpression="AccountTypeID">
                                        <ItemTemplate>
                                            (<asp:Label ID="Label2" runat="server" Text='<%# Bind("AccountTypeID") %>' />)
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("AccountType") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TranType" SortExpression="TranTypeID">
                                        <ItemTemplate>
                                            (<asp:Label ID="Label3" runat="server" Text='<%# Bind("TranTypeID") %>' />)
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("TranType") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="DocType" SortExpression="DocTypeID">
                                        <ItemTemplate>
                                            (<asp:Label ID="Label4" runat="server" Text='<%# Bind("DocTypeID") %>' />)
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("DocType") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sign" SortExpression="TrSign">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("TrSign") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="50px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TrOrd" SortExpression="TrOrd">
                                        <ItemTemplate>
                                            <asp:Label ID="Label12" runat="server" Text='<%# Bind("TrOrd") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="50px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="TrAccount" HeaderText="TrAccount" SortExpression="TrAccount" ReadOnly="True">
                                        <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Description" SortExpression="TrDescription">
                                        <ItemTemplate>
                                            <asp:Label ID="Label13" runat="server" Text='<%# Bind("TrDescription") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="400px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField InsertVisible="False" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnAdd" runat="server" CausesValidation="false" 
                                                CommandName="AddCorrection" CommandArgument='<%# Bind("TrDocID") %>'
                                                ToolTip="Add document to corrections"
                                                ImageUrl="~/Images/accept_inline.gif" 
                                                OnClientClick="if (!confirm('Are you sure you want to add this document to corrections?')) return;" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:GridView>
                            <asp:ObjectDataSource ID="dsAccNoCorrections" runat="server" 
                                TypeName="dsAccCorrectionTableAdapters.AccNoCorrectionTableAdapter"
                                SelectMethod="GetData" OldValuesParameterFormatString="original_{0}">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="fltDocCode" Name="TrCode" PropertyName="Text" Type="String" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                </table>
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
                                <p style="text-align: right;" class="GridRow1T">
                                    <br />
                                    <asp:Button ID="btnNo" runat="server" Text="OK" SkinID="skBtnBase" />&nbsp;
                                </p>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </div>
            <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
                PopupDragHandleControlID="popLabel" CancelControlID="btnNo" DropShadow="True"
                BackgroundCssClass="modalBackground" TargetControlID="dummy">
            </asp:ModalPopupExtender>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

