<%@ Page Title="" Language="VB" MasterPageFile="~/Contracts/Special/Wizard/masterWizard.master"
    AutoEventWireup="false" CodeFile="Periods.aspx.vb" Inherits="Contracts_Special_Wizard_Periods" %>
    
    <%@ MasterType VirtualPath="~/Contracts/Special/Wizard/masterWizard.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Periods
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="WizardContent" runat="Server">
    <div class="Red">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblMarket" runat="server" Text="Periods" SkinID="skGridLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder" valign="top">
                    <asp:GridView ID="gridPeriods" runat="server" SkinID="skGridView" AutoGenerateColumns="False"
                        DataKeyNames="CtrPeriodID" DataSourceID="dsPeriods">
                        <HeaderStyle HorizontalAlign="Left" />
                        <Columns>
                            <asp:BoundField DataField="CtrPeriodID" HeaderText="CtrPeriodID" InsertVisible="False"
                                ReadOnly="True" SortExpression="CtrPeriodID" Visible="False" />
                            <asp:BoundField DataField="ContractId" HeaderText="ContractId" SortExpression="ContractId"
                                Visible="False" />
                            <asp:TemplateField HeaderText="Start" SortExpression="Start">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Start", "{0:d}") %>' CssClass="TextBox" />
                                    <asp:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="TextBox1" CssClass="cal_Theme1" />
                                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="TextBox1"
                                        Display="None" ErrorMessage="Required date input!" Operator="DataTypeCheck" Type="Date" />
                                    <asp:ValidatorCalloutExtender ID="CompareValidator2_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator2" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                                        Display="None" ErrorMessage="Required field!" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Start", "{0:d}") %>' />
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Finish" DataFormatString="{0:d}" HeaderText="End" SortExpression="Finish"
                                ReadOnly="True">
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Note" SortExpression="Note">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Note") %>' Height="300px"
                                        CssClass="TextBox" TextMode="MultiLine" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:TextBox ID="Label2" runat="server" Text='<%# Bind("Note") %>' Height="45px" 
                                        Style="border: none;" CssClass="TextBox" TextMode="MultiLine" ReadOnly="true" />
                                </ItemTemplate>
                                <ItemStyle Width="600px" />
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:ImageButton ID="ibUpdate" runat="server" CausesValidation="True" CommandName="Update"
                                        ImageUrl="~/Images/accept_inline.gif" Text="Update" />
                                    &nbsp;<asp:ImageButton ID="ibCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                        ImageUrl="~/Images/decline_inline.gif" Text="Cancel" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="ibEdit" runat="server" CausesValidation="False" CommandName="Edit"
                                        ImageUrl="~/Images/edit_inline.gif" Text="Edit" Visible="<%# Master.CanEdit() %>" />
                                </ItemTemplate>
                                <ControlStyle CssClass="ImgButton" />
                                <ItemStyle Width="50px" />
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Delete"
                                        ImageUrl="~/Images/delete_inline.gif" OnClientClick="confirm('Are you sure you want to delete the record')"
                                        Text="Delete" Visible="<%# Master.CanEdit() %>" />
                                </ItemTemplate>
                                <ControlStyle CssClass="ImgButton" />
                                <ItemStyle Width="25px" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:FormView ID="newMarket" runat="server" DataSourceID="dsPeriods" DataKeyNames="ContractId">
                        <InsertItemTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                <tr class="GridRow1T">
                                    <td style="width: 100px;">
                                        <asp:TextBox ID="StartTextBox" runat="server" Text='<%# Bind("Start", "{0:d}") %>'
                                            Width="98px" CssClass="TextBox" />
                                        <asp:CalendarExtender ID="StartTextBox_CalendarExtender" runat="server" CssClass="cal_Theme1"
                                            Enabled="True" TargetControlID="StartTextBox">
                                        </asp:CalendarExtender>
                                        <asp:RequiredFieldValidator ID="reqMarketID" runat="server" ErrorMessage="This is required field!"
                                            ControlToValidate="StartTextBox" Display="None" />
                                        <asp:ValidatorCalloutExtender ID="reqMarketIDExt" runat="server" TargetControlID="reqMarketID"
                                            HighlightCssClass="WaterMark">
                                        </asp:ValidatorCalloutExtender>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="StartTextBox"
                                            Display="None" ErrorMessage="Required date input!" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                                    </td>
                                    <td style="width: 100px;">
                                        &nbsp;
                                    </td>
                                    <td style="width: 400px;">
                                        <asp:TextBox ID="NoteTextBox" runat="server" Text='<%# Bind("Note") %>' CssClass="TextBox" />
                                    </td>
                                    <td style="width: 75px;">
                                        <asp:ImageButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                            ImageUrl="~/Images/accept_inline.gif" CssClass="ImgButton" />
                                        <asp:ImageButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                            CommandName="Cancel" ImageUrl="~/Images/decline_inline.gif" CssClass="ImgButton" />
                                    </td>
                                </tr>
                            </table>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                <tr class="GridRow1T">
                                    <td style="width: 605px; height: 30px;">
                                        &nbsp;
                                    </td>
                                    <td style="width: 75px; padding-left: 5px;">
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" 
                                            CommandName="New" Visible="<%# Master.CanEdit() %>" />&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                <tr class="GridRow1T">
                                    <td style="width: 605px; height: 30px;">
                                        &nbsp;
                                    </td>
                                    <td style="width: 75px; padding-left: 5px;">
                                        <asp:Button ID="btnNew0" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                    </asp:FormView>
                    <asp:ObjectDataSource ID="dsPeriods" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                        SelectMethod="GetData" TypeName="ContractsTableAdapters.ContractPeriodTableAdapter"
                        UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="CtrPeriodID" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="CtrPeriodID" Type="Int32" />
                            <asp:Parameter Name="Start" Type="DateTime" />
                            <asp:Parameter Name="Note" Type="String" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="ContractID" QueryStringField="ContractID" Type="Int32" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:QueryStringParameter Name="ContractId" QueryStringField="ContractID" Type="Int32" />
                            <asp:Parameter Name="Start" Type="DateTime" />
                            <asp:Parameter Name="Note" Type="String" />
                        </InsertParameters>
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
