<%@ Page Language="VB" MasterPageFile="~/Maintenance/SihotMap/MapSihot.master" AutoEventWireup="false" CodeFile="MapComplementary.aspx.vb" Inherits="Maintenance_SihotMap_MapComplementary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Map Complimentary Guest Categories
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" Runat="Server">
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lbComplementary" runat="server" Text="Complimentary Guest Categories" SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvComplementary" runat="server" DataSourceID="dsComplementary" DataKeyNames="ComplementaryType"
                        SkinID="skGridView" AutoGenerateColumns="False" EnableModelValidation="True">
                        <RowStyle Wrap="False" Height="30px" />
                        <Columns>
                            <asp:BoundField DataField="ComplementaryType" HeaderText="SIHOT Type" ReadOnly="True" SortExpression="ComplementaryType" >
                                <ItemStyle Width="152px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Guest Type" SortExpression="GuestType">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("GuestType") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                        <asp:DropDownList ID="ddlGuestType" runat="server" SelectedValue='<%# Bind("GuestType") %>' CssClass="TextBox" >
                                            <asp:ListItem Text="Adult" Value ="A" />
                                            <asp:ListItem Text="Child" Value ="C" />
                                            <asp:ListItem Text="Junior" Value ="J" />
                                        </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemStyle Width="152px" />
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ibDelete" runat="server" CausesValidation="False" ToolTip="Delete complementary type" 
                                        CommandName="Delete" OnClientClick="confirm('Are you sure you want to delete complimentary type?')"
                                        ImageUrl="~/Images/delete_inline.gif" />
                                </ItemTemplate>
                                <ItemStyle Width="50px" />
                                <ControlStyle CssClass="ImgButton" />
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr> 
                                    <td class="GridRow2B" style="width: 152px; font-weight: bold;" >
                                        SIHOT Type
                                    </td> 
                                    <td class="GridRow2B" style="width: 152px; font-weight: bold;" >
                                        Guest Type
                                    </td> 
                                    <td class="GridRow2B" style="width: 52px; font-weight: bold;" >
                                        &nbsp;
                                    </td> 
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                    </asp:GridView>
                    <asp:FormView ID="fvComplementary" runat="server" DataSourceID="dsComplementary" DataKeyNames="ComplementaryType">
                        <InsertItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr> 
                                    <td class="GridRowClear" style="width: 152px; height: 30px;" >
                                        <asp:TextBox ID="txtComplementaryType" runat="server" Text='<%# Bind("ComplementaryType") %>' CssClass="TextBox" Width="90%" />
                                        <asp:RequiredFieldValidator ID="txtComplementaryType_Required" runat="server" ErrorMessage="Required field!" 
                                            Display="None" ControlToValidate="txtComplementaryType" />
                                        <asp:ValidatorCalloutExtender ID="txtComplementaryType_RequiredCallout" runat="server" TargetControlID="txtComplementaryType_Required" />
                                    </td> 
                                    <td class="GridRowClear" style="width: 152px; height: 30px;" >
                                        <asp:DropDownList ID="ddlGuestType" runat="server" SelectedValue='<%# Bind("GuestType") %>' CssClass="TextBox" Width="90%" >
                                            <asp:ListItem Text="Adult" Value ="A" />
                                            <asp:ListItem Text="Child" Value ="C" />
                                            <asp:ListItem Text="Junior" Value ="J" />
                                        </asp:DropDownList>
                                    </td> 
                                    <td class="GridRowClear" style="width: 52px; height: 30px;" >
                                        <asp:ImageButton ID="ibUpdate" runat="server" CausesValidation="True"
                                            CommandName="Insert" ImageUrl="~/Images/accept_inline.gif" CssClass="ImgButton" />&nbsp;
                                        <asp:ImageButton ID="ibCancel" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" ImageUrl="~/Images/decline_inline.gif" CssClass="ImgButton" />
                                    </td> 
                                </tr>
                            </table>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr> 
                                    <td class="GridRowClear" style="width: 356px; text-align: right; padding-top: 5px;" >
                                        <asp:Button ID="btNew" runat="server" Text="New Complementary Type" SkinID="skBtnBase" CommandName="New" />
                                    </td> 
                                </tr>
                            </table>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr> 
                                    <td class="GridRowClear" style="width: 356px; text-align: right; padding-top: 5px;" >
                                        <asp:Button ID="btNew" runat="server" Text="New Complementary Type" SkinID="skBtnBase" CommandName="New" />
                                    </td> 
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                    </asp:FormView>
                </td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="dsComplementary" runat="server" InsertMethod="Insert" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="dsMapChildSetTableAdapters.SmartComplementaryTableAdapter" 
            UpdateMethod="Update" DeleteMethod="Delete">
            <DeleteParameters>
                <asp:Parameter Name="Original_ComplementaryType" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="ComplementaryType" Type="String" />
                <asp:Parameter Name="GuestType" Type="String" />
                <asp:Parameter Name="Deleted" Type="Boolean" />
                <asp:Parameter Name="ChangeUser" Type="String" />
                <asp:Parameter Name="Original_ComplementaryType" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="ComplementaryType" Type="String" />
                <asp:Parameter Name="GuestType" Type="String" />
                <asp:Parameter Name="Deleted" Type="Boolean" />
                <asp:Parameter Name="ChangeUser" Type="String" />
            </InsertParameters>
        </asp:ObjectDataSource>
    </div>

</asp:Content>

