<%@ Page Language="VB" MasterPageFile="~/Maintenance/SihotMap/MapSihot.master" AutoEventWireup="false" 
    CodeFile="MapChildSet.aspx.vb" Inherits="Maintenance_SihotMap_MapChildSet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    SIHOT Children Categories
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" Runat="Server">
    <div class="Blue">
        <table cellpadding="0" cellspacing="2px">
            <tr>
                <td class="GridLabelBG" colspan="3">
                    <asp:Label ID="lbChildSets" runat="server" Text="Children Sets" SkinID="skGridLabel" />
                    <asp:LinkButton ID="btOverview" runat="server" Text="Overview" 
                        style="float:right; color: White; padding: 4px; font-weight: bold;" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder" style="vertical-align: top;" rowspan="3" >
                    <asp:GridView ID="gvChildSets" runat="server" 
                        SkinID="skGridView" AutoGenerateColumns="False" 
                        EnableModelValidation="True" DataKeyNames="ChildSetID" 
                        DataSourceID="dsChildSets" 
                        SelectedIndex="0">
                        <Columns>
                            <asp:CommandField SelectImageUrl="~/Images/select_.gif" ShowCancelButton="False"
                                ShowSelectButton="True" ButtonType="Image">
                                <ItemStyle Width="25px" />
                            </asp:CommandField>
                            <asp:BoundField DataField="ChildSetID" >
                                <ItemStyle Height="20px" Width="50px" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Child Sets" >
                                <ItemTemplate>
                                    <asp:Label ID="Label0" runat="server" Visible='<%# Eval("ChildSetID")=0  %>' Text="Adults Only" Font-Italic="true" />
                                    <asp:Label ID="Label1" runat="server" Visible='<%# Eval("ChildSetID")<>0 %>' Text='<%# Bind("Chld1Category") %>' style="margin-right: 5px;" />
                                    <asp:Label ID="Label2" runat="server" Visible='<%# Eval("ChildSetID")<>0 %>' Text='<%# Bind("Chld2Category") %>' style="margin-right: 5px;" />
                                    <asp:Label ID="Label3" runat="server" Visible='<%# Eval("ChildSetID")<>0 %>' Text='<%# Bind("Chld3Category") %>' style="margin-right: 5px;" />
                                    <asp:Label ID="Label4" runat="server" Visible='<%# Eval("ChildSetID")<>0 %>' Text='<%# Bind("Chld4Category") %>' />
                                </ItemTemplate>
                                <ItemStyle Height="20px" Width="200px" />
                            </asp:TemplateField>
                       </Columns>
                    </asp:GridView>
                </td>
                <td class="GridBorder" style="vertical-align: top;" >
                    <asp:FormView ID="fvSet" runat="server" DataKeyNames="ChildSetID" 
                        DataSourceID="dsSet">
                        <EditItemTemplate>
                            <table cellspacing="0" cellpadding="0">
                                <tr>
                                    <td class="GridRow2B" style="width: 100px; text-align: center; font-weight: bold;">
                                        <asp:Label ID="ChildSetIDLabel" runat="server" Text='<%# "Child Set " & Eval("ChildSetID") %>' CssClass="SelectRow" />
                                    </td>
                                    <td class="GridRow2B" style="width: 100px; text-align: center; font-weight: bold;">SIHOT Code</td>
                                    <td class="GridRow2B" style="width: 100px; text-align: center; font-weight: bold;">Label</td>
                                    <td class="GridRow2B" style="width: 100px; text-align: center; font-weight: bold;">From Than</td>
                                    <td class="GridRow2B" style="width: 100px; text-align: center; font-weight: bold;">Less </td>
                                    <td class="GridRow2B" style="width: 100px; text-align: center; font-weight: bold;">Type</td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="height: 23px; text-align: center; font-weight: bold;">Category 1</td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:TextBox ID="Chld1CategoryTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld1Category") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:TextBox ID="Chld1LabelTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld1Label") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:TextBox ID="Chld1FromTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld1From") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:TextBox ID="Chld1UpToTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld1UpTo") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:DropDownList ID="Chld1TypeDropDown" runat="server" SelectedValue='<%# Bind("Chld1Type") %>' CssClass="TextBox" >
                                            <asp:ListItem Text="no category" Value="" />
                                            <asp:ListItem Text="I (infant)" Value="I" />
                                            <asp:ListItem Text="C (child)" Value="C" />
                                            <asp:ListItem Text="J (junior)" Value="J" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="height: 23px; text-align: center; font-weight: bold;">Category 2</td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:TextBox ID="Chld2CategoryTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld2Category") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:TextBox ID="Chld2LabelTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld2Label") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:TextBox ID="Chld2FromTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld2From") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:TextBox ID="Chld2UpToTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld2UpTo") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:DropDownList ID="Chld2TypeDropDown" runat="server" SelectedValue='<%# Bind("Chld2Type") %>' CssClass="TextBox" >
                                            <asp:ListItem Text="no category" Value="" />
                                            <asp:ListItem Text="I (infant)" Value="I" />
                                            <asp:ListItem Text="C (child)" Value="C" />
                                            <asp:ListItem Text="J (junior)" Value="J" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="height: 23px; text-align: center; font-weight: bold;">Category 3</td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:TextBox ID="Chld3CategoryTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld3Category") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:TextBox ID="Chld3LabelTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld3Label") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:TextBox ID="Chld3FromTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld3From") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:TextBox ID="Chld3UpToTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld3UpTo") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:DropDownList ID="Chld3TypeDropDown" runat="server" SelectedValue='<%# Bind("Chld3Type") %>' CssClass="TextBox" >
                                            <asp:ListItem Text="no category" Value="" />
                                            <asp:ListItem Text="I (infant)" Value="I" />
                                            <asp:ListItem Text="C (child)" Value="C" />
                                            <asp:ListItem Text="J (junior)" Value="J" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="height: 23px; text-align: center; font-weight: bold;">Category 4</td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:TextBox ID="Chld4CategoryTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld4Category") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:TextBox ID="Chld4LabelTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld4Label") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:TextBox ID="Chld4FromTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld4From") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:TextBox ID="Chld4UpToTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld4UpTo") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:DropDownList ID="Chld4TypeDropDown" runat="server" SelectedValue='<%# Bind("Chld4Type") %>' CssClass="TextBox" >
                                            <asp:ListItem Text="no category" Value="" />
                                            <asp:ListItem Text="I (infant)" Value="I" />
                                            <asp:ListItem Text="C (child)" Value="C" />
                                            <asp:ListItem Text="J (junior)" Value="J" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear" style="width: 52px; height: 30px; text-align: right;" colspan="6">
                                        <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" 
                                            CommandName="Update" Text="Update" SkinID="skBtnBase" />&nbsp;
                                        <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" Text="Cancel" SkinID="skBtnBase" />
                                    </td>
                                </tr>
                            </table>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <table cellspacing="0" cellpadding="0">
                                <tr>
                                    <td class="GridRow2B" style="width: 100px; text-align: center; font-weight: bold;">
                                        <asp:Label ID="ChildSetIDLabel" runat="server" Text='<%# "Child Set " & Eval("ChildSetID") %>' CssClass="SelectRow" />
                                    </td>
                                    <td class="GridRow2B" style="width: 100px; text-align: center; font-weight: bold;">SIHOT Code</td>
                                    <td class="GridRow2B" style="width: 100px; text-align: center; font-weight: bold;">Label</td>
                                    <td class="GridRow2B" style="width: 100px; text-align: center; font-weight: bold;">From</td>
                                    <td class="GridRow2B" style="width: 100px; text-align: center; font-weight: bold;">Less Than</td>
                                    <td class="GridRow2B" style="width: 100px; text-align: center; font-weight: bold;">Type</td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="height: 23px; text-align: center; font-weight: bold;">Category 1</td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:TextBox ID="Chld1CategoryTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld1Category") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:TextBox ID="Chld1LabelTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld1Label") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:TextBox ID="Chld1FromTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld1From") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:TextBox ID="Chld1UpToTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld1UpTo") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:DropDownList ID="Chld1TypeDropDown" runat="server" SelectedValue='<%# Bind("Chld1Type") %>' CssClass="TextBox" >
                                            <asp:ListItem Text="no category" Value="" />
                                            <asp:ListItem Text="I (infant)" Value="I" />
                                            <asp:ListItem Text="C (child)" Value="C" />
                                            <asp:ListItem Text="J (junior)" Value="J" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="height: 23px; text-align: center; font-weight: bold;">Category 2</td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:TextBox ID="Chld2CategoryTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld2Category") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:TextBox ID="Chld2LabelTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld2Label") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:TextBox ID="Chld2FromTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld2From") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:TextBox ID="Chld2UpToTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld2UpTo") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:DropDownList ID="Chld2TypeDropDown" runat="server" SelectedValue='<%# Bind("Chld2Type") %>' CssClass="TextBox" >
                                            <asp:ListItem Text="no category" Value="" />
                                            <asp:ListItem Text="I (infant)" Value="I" />
                                            <asp:ListItem Text="C (child)" Value="C" />
                                            <asp:ListItem Text="J (junior)" Value="J" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="height: 23px; text-align: center; font-weight: bold;">Category 3</td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:TextBox ID="Chld3CategoryTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld3Category") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:TextBox ID="Chld3LabelTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld3Label") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:TextBox ID="Chld3FromTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld3From") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:TextBox ID="Chld3UpToTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld3UpTo") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:DropDownList ID="Chld3TypeDropDown" runat="server" SelectedValue='<%# Bind("Chld3Type") %>' CssClass="TextBox" >
                                            <asp:ListItem Text="no category" Value="" />
                                            <asp:ListItem Text="I (infant)" Value="I" />
                                            <asp:ListItem Text="C (child)" Value="C" />
                                            <asp:ListItem Text="J (junior)" Value="J" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="height: 23px; text-align: center; font-weight: bold;">Category 4</td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:TextBox ID="Chld4CategoryTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld4Category") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:TextBox ID="Chld4LabelTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld4Label") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:TextBox ID="Chld4FromTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld4From") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:TextBox ID="Chld4UpToTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld4UpTo") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <%--<asp:TextBox ID="Chld4TypeTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld4Type") %>' />--%>
                                        <asp:DropDownList ID="Chld4TypeDropDown" runat="server" SelectedValue='<%# Bind("Chld4Type") %>' CssClass="TextBox" >
                                            <asp:ListItem Text="no category" Value="" />
                                            <asp:ListItem Text="I (infant)" Value="I" />
                                            <asp:ListItem Text="C (child)" Value="C" />
                                            <asp:ListItem Text="J (junior)" Value="J" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear" style="width: 52px; height: 30px; text-align: right;" colspan="6">
                                        <asp:Button ID="InsertButton" runat="server" CausesValidation="True" 
                                            CommandName="Insert" Text="Insert" SkinID="skBtnBase" />&nbsp;
                                        <asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" Text="Cancel" SkinID="skBtnBase" />
                                    </td>
                                </tr>
                            </table>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <table cellspacing="0" cellpadding="0">
                                <tr>
                                    <td class="GridRow2B" style="width: 100px; text-align: center; font-weight: bold;">
                                        <asp:Label ID="ChildSetIDLabel" runat="server" Text='<%# "Child Set " & Eval("ChildSetID") %>' CssClass="SelectRow" />
                                    </td>
                                    <td class="GridRow2B" style="width: 100px; text-align: center; font-weight: bold;">SIHOT Code</td>
                                    <td class="GridRow2B" style="width: 100px; text-align: center; font-weight: bold;">Label</td>
                                    <td class="GridRow2B" style="width: 100px; text-align: center; font-weight: bold;">From</td>
                                    <td class="GridRow2B" style="width: 100px; text-align: center; font-weight: bold;">Less Than</td>
                                    <td class="GridRow2B" style="width: 100px; text-align: center; font-weight: bold;">Type</td>
                                </tr>
                                <asp:Panel ID="pnlAdults" runat="server" Visible='<%# Eval("ChildSetID")=0  %>' >
                                <tr>
                                    <td class="SelectRow1B" style="height: 23px; text-align: center; font-weight: bold;">Category 1</td>
                                    <td colspan="5" rowspan="5" style="text-align: center; vertical-align: middle; font-style: italic;">
                                        Adults Only
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="height: 23px; text-align: center; font-weight: bold;">Category 2</td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="height: 23px; text-align: center; font-weight: bold;">Category 3</td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="height: 23px; text-align: center; font-weight: bold;">Category 4</td>
                                </tr>
                                <tr>
                                    <td style="height: 30px;" >&nbsp;</td>
                                </tr>
                                </asp:Panel>
                                <asp:Panel ID="pnlSet" runat="server" Visible='<%# Eval("ChildSetID")<>0 %>' >
                                <tr>
                                    <td class="SelectRow1B" style="height: 23px; text-align: center; font-weight: bold;">Category 1</td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:Label ID="Chld1CategoryLabel" runat="server" Text='<%# Bind("Chld1Category") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:Label ID="Chld1LabelLabel" runat="server" Text='<%# Bind("Chld1Label") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                       <asp:Label ID="Chld1FromLabel" runat="server" Text='<%# Bind("Chld1From") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                       <asp:Label ID="Chld1UpToLabel" runat="server" Text='<%# Bind("Chld1UpTo") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                      <asp:Label ID="Chld1TypeLabel" runat="server" Text='<%# Bind("Chld1Type") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="height: 23px; text-align: center; font-weight: bold;">Category 2</td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:Label ID="Chld2CategoryLabel" runat="server" Text='<%# Bind("Chld2Category") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:Label ID="Chld2LabelLabel" runat="server" Text='<%# Bind("Chld2Label") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:Label ID="Chld2FromLabel" runat="server" Text='<%# Bind("Chld2From") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:Label ID="Chld2UpToLabel" runat="server" Text='<%# Bind("Chld2UpTo") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:Label ID="Chld2TypeLabel" runat="server" Text='<%# Bind("Chld2Type") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="height: 23px; text-align: center; font-weight: bold;">Category 3</td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:Label ID="Chld3CategoryLabel" runat="server" Text='<%# Bind("Chld3Category") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:Label ID="Chld3LabelLabel" runat="server" Text='<%# Bind("Chld3Label") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:Label ID="Chld3FromLabel" runat="server" Text='<%# Bind("Chld3From") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:Label ID="Chld3UpToLabel" runat="server" Text='<%# Bind("Chld3UpTo") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:Label ID="Chld3TypeLabel" runat="server" Text='<%# Bind("Chld3Type") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1B" style="height: 23px; text-align: center; font-weight: bold;">Category 4</td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:Label ID="Chld4CategoryLabel" runat="server" Text='<%# Bind("Chld4Category") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:Label ID="Chld4LabelLabel" runat="server" Text='<%# Bind("Chld4Label") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:Label ID="Chld4FromLabel" runat="server" Text='<%# Bind("Chld4From") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:Label ID="Chld4UpToLabel" runat="server" Text='<%# Bind("Chld4UpTo") %>' />
                                    </td>
                                    <td class="GridRow1B" style="text-align: center;" >
                                        <asp:Label ID="Chld4TypeLabel" runat="server" Text='<%# Bind("Chld4Type") %>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear" style="width: 52px; height: 30px; text-align: right;" colspan="6">
                                        <asp:Button ID="EditButton" runat="server" CausesValidation="False" 
                                            CommandName="Edit" Text="Edit" SkinID="skBtnBase" />&nbsp;
                                        <asp:Button ID="DeleteButton" runat="server" CausesValidation="False" 
                                            CommandName="Delete" Text="Delete" SkinID="skBtnBase" 
                                            OnClientClick="return confirm('Are you sure you want to delete this child set?')"/>&nbsp;
                                        <asp:Button ID="NewButton" runat="server" CausesValidation="False" 
                                            CommandName="New" Text="New" SkinID="skBtnBase" />
                                    </td>
                                </tr>
                                </asp:Panel>
                            </table>
                        </ItemTemplate>
                    </asp:FormView>
                </td>
            </tr>
            <tr>
                <td class="GridLabelBG" >
                    <asp:Label ID="lblSetFor" runat="server" Text="Applies For" SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder" style="vertical-align: top;" >
                    <asp:GridView ID="gvSetFor" runat="server"
                        SkinID="skGridView" AutoGenerateColumns="False" 
                        DataKeyNames="ChildSetForID" DataSourceID="dsSetFor" >
                        <Columns>
                            <asp:BoundField DataField="ChildSetForID" HeaderText="ChildSetForID" InsertVisible="False" ReadOnly="True" SortExpression="ChildSetForID" Visible="False" />
                            <asp:BoundField DataField="ChildSetID" HeaderText="ChildSetID" SortExpression="ChildSetID" ReadOnly="True" Visible="False" />
                            <asp:TemplateField HeaderText="TourOp" >
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlTourOp" runat="server" CssClass="TextBox" 
                                        DataSourceID="dsTourOp" DataTextField="TourOp" DataValueField="TourOpID"
                                        SelectedValue='<%# Bind("TourOpID") %>'
                                        AppendDataBoundItems="true" >
                                        <asp:ListItem Text="all" Value="" />
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsTourOp" runat="server" 
                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                        TypeName="dsMapChildSetTableAdapters.TourOpTableAdapter">
                                    </asp:ObjectDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("TourOp") %>' />
                                    <asp:Label ID="Label5" runat="server" Text="all" Visible='<%# Eval("TourOpID") is DbNull.Value %>' style="margin-left: 10px; font-style: italic;" />
                                </ItemTemplate>
                                <ItemStyle Width="250px" Height="23px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Hotel">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" 
                                        DataSourceID="dsHotel" DataTextField="Hotel" DataValueField="HotelID"
                                        SelectedValue='<%# Bind("HotelID") %>'
                                        Enabled="false"
                                        AutoPostBack="true" AppendDataBoundItems="true" >
                                        <asp:ListItem Text="all" Value="" />
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsHotel" runat="server" 
                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                        TypeName="dsMapChildSetTableAdapters.HotelTableAdapter">
                                    </asp:ObjectDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Hotel") %>' />
                                    <asp:Label ID="Label6" runat="server" Text="all" Visible='<%# Eval("HotelID") is DbNull.Value %>' style="margin-left: 10px; font-style: italic;" />
                                </ItemTemplate>
                                <ItemStyle Width="350px" Height="23px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Room Type" >
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlRoomType" runat="server" CssClass="TextBox" 
                                        DataSourceID="dsRoomType" DataTextField="RoomTypeID" DataValueField="RoomTypeID" 
                                        SelectedValue='<%# Eval("RoomTypeID") %>'
                                        ondatabinding="ddlRoomType_DataBinding"
                                        AppendDataBoundItems="true" >
                                        <asp:ListItem Text="all" Value="" />
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsRoomType" runat="server" 
                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByHotelID" 
                                        TypeName="dsMapChildSetTableAdapters.RoomTypeTableAdapter">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("RoomTypeID") %>' />
                                    <asp:Label ID="Label7" runat="server" Text="all" Visible='<%# Eval("RoomTypeID") is DbNull.Value %>' style="margin-left: 10px; font-style: italic;" />
                                </ItemTemplate>
                                <ItemStyle Width="100px" Height="23px" />
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ibEdit" runat="server" CausesValidation="False" 
                                        CommandName="Edit" ImageUrl="~/Images/edit_inline.gif" />&nbsp;
                                    <asp:ImageButton ID="ibDelete" runat="server" CausesValidation="False" 
                                        CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete child set application?')"
                                        ImageUrl="~/Images/delete_inline.gif" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:ImageButton ID="ibUpdate" runat="server" CausesValidation="True"
                                        CommandName="Update" ImageUrl="~/Images/accept_inline.gif" />&nbsp;
                                    <asp:ImageButton ID="ibCancel" runat="server" CausesValidation="False" 
                                        CommandName="Cancel" ImageUrl="~/Images/decline_inline.gif" />
                                </EditItemTemplate>
                                <ItemStyle Width="75px" Height="23px" />
                                <ControlStyle CssClass="ImgButton" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:FormView ID="fvSetFor" runat="server" DataKeyNames="ChildSetForID" 
                        DataSourceID="dsSetFor">
                        <InsertItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr> 
                                    <td class="GridRowClear" style="width: 252px; height: 30px;" >
                                        <asp:DropDownList ID="ddlTourOp" runat="server" CssClass="TextBox" 
                                            DataSourceID="dsTourOp" DataTextField="TourOp" DataValueField="TourOpID"
                                            SelectedValue='<%# Bind("TourOpID") %>'
                                            AppendDataBoundItems="true" >
                                            <asp:ListItem Text="all" Value="" />
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsTourOp" runat="server" 
                                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                            TypeName="dsMapChildSetTableAdapters.TourOpTableAdapter">
                                        </asp:ObjectDataSource>
                                    </td>
                                    <td class="GridRowClear" style="width: 352px; height: 30px;" >
                                        <asp:DropDownList ID="ddlHotel" runat="server" CssClass="TextBox" 
                                            DataSourceID="dsHotel" DataTextField="Hotel" DataValueField="HotelID"
                                            SelectedValue='<%# Bind("HotelID") %>'
                                            AutoPostBack="true" AppendDataBoundItems="true" >
                                            <asp:ListItem Text="all" Value="" />
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsHotel" runat="server" 
                                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                            TypeName="dsMapChildSetTableAdapters.HotelTableAdapter">
                                        </asp:ObjectDataSource>
                                    </td>
                                    <td class="GridRowClear" style="width: 102px; height: 30px;" >
                                        <asp:DropDownList ID="ddlRoomType" runat="server" CssClass="TextBox" 
                                            DataSourceID="dsRoomType" DataTextField="RoomTypeID" DataValueField="RoomTypeID" 
                                            ondatabinding="ddlRoomType_DataBinding"
                                            AppendDataBoundItems="true" >
                                            <asp:ListItem Text="all" Value="" />
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="dsRoomType" runat="server" 
                                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByHotelID" 
                                            TypeName="dsMapChildSetTableAdapters.RoomTypeTableAdapter">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="ddlHotel" Name="HotelId" PropertyName="SelectedValue" Type="Int32" />
                                            </SelectParameters>
                                        </asp:ObjectDataSource>
                                    </td>
                                    <td class="GridRowClear" style="width: 52px; height: 30px;" >
                                        <asp:ImageButton ID="ibInsert" runat="server" CausesValidation="True"
                                            CommandName="Insert" ImageUrl="~/Images/accept_inline.gif" CssClass="ImgButton" />&nbsp;
                                        <asp:ImageButton ID="ibCancel" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" ImageUrl="~/Images/decline_inline.gif" CssClass="ImgButton" />
                                    </td>
                                </tr>
                            </table> 
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <div class="GridRowClear" style="width: 758px; height: 30px; text-align: right; padding-top: 5px;" >
                                <asp:Button ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add" SkinID="skBtnBase" />
                            </div>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <div class="GridRowClear" style="width: 758px; height: 30px; text-align: right; padding-top: 5px;" >
                                <asp:Button ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add" SkinID="skBtnBase" />
                            </div>
                        </EmptyDataTemplate>
                    </asp:FormView>
                </td>
            </tr>
        </table>
    </div>

    <div class="Red">
        <asp:HiddenField ID="dummy" runat="server" />
        <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
            PopupDragHandleControlID="popLabel" CancelControlID="btnYes" DropShadow="True"
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
                            <asp:Label ID="popMessage" runat="server" Text="Message" />
                        </p>
                        <p style="text-align: right;" class="GridRow1T"><br />
                            <asp:Button ID="btnYes" runat="server" Text="OK" SkinID="skBtnBase" />&nbsp;
                        </p>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
    <asp:ObjectDataSource ID="dsChildSets" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="dsMapChildSetTableAdapters.ChildSetTableAdapter">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsSet" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataBySetID" 
        TypeName="dsMapChildSetTableAdapters.ChildSetTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_ChildSetID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Chld1Category" Type="String" />
            <asp:Parameter Name="Chld1Label" Type="String" />
            <asp:Parameter Name="Chld1From" Type="Int16" />
            <asp:Parameter Name="Chld1UpTo" Type="Int16" />
            <asp:Parameter Name="Chld1Type" Type="String" />
            <asp:Parameter Name="Chld2Category" Type="String" />
            <asp:Parameter Name="Chld2Label" Type="String" />
            <asp:Parameter Name="Chld2From" Type="Int16" />
            <asp:Parameter Name="Chld2UpTo" Type="Int16" />
            <asp:Parameter Name="Chld2Type" Type="String" />
            <asp:Parameter Name="Chld3Category" Type="String" />
            <asp:Parameter Name="Chld3Label" Type="String" />
            <asp:Parameter Name="Chld3From" Type="Int16" />
            <asp:Parameter Name="Chld3UpTo" Type="Int16" />
            <asp:Parameter Name="Chld3Type" Type="String" />
            <asp:Parameter Name="Chld4Category" Type="String" />
            <asp:Parameter Name="Chld4Label" Type="String" />
            <asp:Parameter Name="Chld4From" Type="Int16" />
            <asp:Parameter Name="Chld4UpTo" Type="Int16" />
            <asp:Parameter Name="Chld4Type" Type="String" />
            <asp:Parameter Name="ChldCategories" Type="Int16" />
            <asp:Parameter Name="Original_ChildSetID" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="gvChildSets" Name="ChildSetID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="Chld1Category" Type="String" />
            <asp:Parameter Name="Chld1Label" Type="String" />
            <asp:Parameter Name="Chld1From" Type="Int16" />
            <asp:Parameter Name="Chld1UpTo" Type="Int16" />
            <asp:Parameter Name="Chld1Type" Type="String" />
            <asp:Parameter Name="Chld2Category" Type="String" />
            <asp:Parameter Name="Chld2Label" Type="String" />
            <asp:Parameter Name="Chld2From" Type="Int16" />
            <asp:Parameter Name="Chld2UpTo" Type="Int16" />
            <asp:Parameter Name="Chld2Type" Type="String" />
            <asp:Parameter Name="Chld3Category" Type="String" />
            <asp:Parameter Name="Chld3Label" Type="String" />
            <asp:Parameter Name="Chld3From" Type="Int16" />
            <asp:Parameter Name="Chld3UpTo" Type="Int16" />
            <asp:Parameter Name="Chld3Type" Type="String" />
            <asp:Parameter Name="Chld4Category" Type="String" />
            <asp:Parameter Name="Chld4Label" Type="String" />
            <asp:Parameter Name="Chld4From" Type="Int16" />
            <asp:Parameter Name="Chld4UpTo" Type="Int16" />
            <asp:Parameter Name="Chld4Type" Type="String" />
            <asp:Parameter Name="ChldCategories" Type="Int16" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsSetFor" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataBySetID" 
        TypeName="dsMapChildSetTableAdapters.ChildSetForTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_ChildSetForID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="gvChildSets" Name="ChildSetID" PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter Name="TourOpID" Type="Int32" />
            <asp:Parameter Name="HotelID" Type="Int32" />
            <asp:Parameter Name="RoomTypeID" Type="String" />
            <asp:Parameter Name="Original_ChildSetForID" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="gvChildSets" Name="ChildSetID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="gvChildSets" Name="ChildSetID" PropertyName="SelectedValue" Type="Int32" />
            <asp:Parameter Name="TourOpID" Type="Int32" />
            <asp:Parameter Name="HotelID" Type="Int32" />
            <asp:Parameter Name="RoomTypeID" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsOverview" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="dsMapChildSetTableAdapters.ChildSetOverviewTableAdapter"></asp:ObjectDataSource>
</asp:Content>

