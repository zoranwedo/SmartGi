<%@ Page Title="" Language="VB" MasterPageFile="~/Contracts/Special/Wizard/masterWizard.master"
    AutoEventWireup="false" CodeFile="Penality.aspx.vb" Inherits="Contracts_Special_Wizard_Penality" %>
    
        <%@ MasterType VirtualPath="~/Contracts/Special/Wizard/masterWizard.master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Policies
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="WizardContent" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
    <ContentTemplate>
    <div class="Red">
        <asp:Panel ID="pnlRoom" runat="server">
            <table cellpadding="0" cellspacing="2px">
                <tr>
                    <td class="GridLabelBG">
                        <asp:Label ID="Label6" runat="server" SkinID="skGridLabel" 
                            Text="Children Policy"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="GridBorder">
                        <%--<asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>--%>
                                <asp:GridView ID="gridPolicy" runat="server" AutoGenerateColumns="False" DataSourceID="dsPolicy"
                                    SkinID="skGridView" DataKeyNames="Category">
                                    <Columns>
                                        <asp:BoundField DataField="HotelID" HeaderText="HotelID" ReadOnly="True" Visible="False" />
                                        <asp:BoundField DataField="Category" HeaderText="Category" ReadOnly="True">
                                            <ItemStyle Width="80px" />
                                            <HeaderStyle HorizontalAlign="Left" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ChldLabel" HeaderText="Label">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ControlStyle CssClass="TextBox" />
                                            <ItemStyle Width="100px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ChldShLabel" HeaderText="Short">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ControlStyle CssClass="TextBox" />
                                            <ItemStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="From">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtFrom" runat="server" CssClass="TextBox" Enabled='<%# Eval("Category")=1 %>'
                                                    Text='<%# Bind("ChldFrom") %>' />
                                                <asp:CompareValidator ID="intFrom" runat="server" ControlToValidate="txtFrom" Operator="DataTypeCheck"
                                                    SkinID="skInteger" Type="Integer" />
                                                <asp:ValidatorCalloutExtender ID="extFrom" runat="server" SkinID="skExtender" TargetControlID="intFrom" />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblFrom" runat="server" Text='<%# Bind("ChldFrom") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="80px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Less Than">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtMax" runat="server" CssClass="TextBox" Text='<%# Bind("ChldMax") %>' />
                                                <asp:CompareValidator ID="intMax" runat="server" ControlToValidate="txtMax" Operator="DataTypeCheck"
                                                    SkinID="skInteger" Type="Integer" />
                                                <asp:ValidatorCalloutExtender ID="extMax" runat="server" SkinID="skExtender" TargetControlID="intMax" />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblMax" runat="server" Text='<%# Bind("ChldMax") %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="80px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Type">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="cbType" runat="server" CssClass="TextBox" SelectedValue='<%# Bind("ChldType") %>'>
                                                    <asp:ListItem Value="">(no category)</asp:ListItem>
                                                    <asp:ListItem Value="I">I (Infant)</asp:ListItem>
                                                    <asp:ListItem Value="C">C (Child)</asp:ListItem>
                                                    <asp:ListItem Value="J">J (Junior)</asp:ListItem>
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("ChldType") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="120px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                                    CommandName="Edit" ImageUrl="~/Images/edit_inline.gif" Text="Edit" 
                                                    Visible="<%# Master.CanEdit() %>" />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" 
                                                    CommandName="Update" ImageUrl="~/Images/accept_inline.gif" Text="Update" />
                                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                                    CommandName="Cancel" ImageUrl="~/Images/decline_inline.gif" Text="Cancel" />
                                            </EditItemTemplate>
                                            <ControlStyle CssClass="ImgButton" />
                                            <ItemStyle Width="50px" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:GridView>
                                <asp:ObjectDataSource ID="dsPolicy" runat="server" SelectMethod="GetData" TypeName="ContractsTableAdapters.SelectContractPolicyTableAdapter"
                                    UpdateMethod="ContractPolicyUpdate">
                                    <UpdateParameters>
                                        <asp:QueryStringParameter Name="ContractID" QueryStringField="ContractID" Type="Int32" />
                                        <asp:Parameter Name="Category" Type="Int32" />
                                        <asp:Parameter Name="ChldLabel" Type="String" />
                                        <asp:Parameter Name="ChldShLabel" Type="String" />
                                        <asp:Parameter Name="ChldFrom" Type="Int16" />
                                        <asp:Parameter Name="ChldMax" Type="Int16" />
                                        <asp:Parameter Name="ChldType" Type="String" />
                                    </UpdateParameters>
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="ContractID" QueryStringField="ContractID" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            &nbsp;</td>
                </tr>
                 <tr><td>&nbsp;</td></tr>
                <tr>
                    <td class="GridLabelBG">
                        <asp:Label ID="lblNoShow" runat="server" SkinID="skGridLabel" Text="No Show Policy" />
                    </td>
                </tr>
                <tr>
                    <td class="GridBorder" style="vertical-align: top;" valign="top">
                        <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>--%>
                                <asp:GridView ID="gvNoShow" runat="server" AutoGenerateColumns="False" DataKeyNames="CtrNoShowID"
                                    DataSourceID="dsNoShow" SkinID="skGridView">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Start">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtNsStart" runat="server" Text='<%# Bind("Start", "{0:d}") %>' CssClass="TextBox" />
                                                <asp:CalendarExtender ID="calNsStart" runat="server" CssClass="cal_Theme1" Enabled="True" TargetControlID="txtNsStart" />
                                                <asp:CompareValidator ID="valNsStart" runat="server" ControlToValidate="txtNsStart"
                                                    Display="None" ErrorMessage="Date input required." Operator="DataTypeCheck" Type="Date" />
                                                <asp:ValidatorCalloutExtender ID="extNsStart" runat="server" Enabled="True" TargetControlID="valNsStart" />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblNsStart" runat="server" Text='<%# Bind("Start", "{0:d}") %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="100px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Finish" HeaderText="End" DataFormatString="{0:d}"
                                            HtmlEncode="False" ReadOnly="True">
                                            <ItemStyle Width="100px" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="Charge Type">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="cbNsChargeType" runat="server" CssClass="TextBox" 
                                                    SelectedValue='<%# Bind("ChargeType") %>' AutoPostBack="True" 
                                                    onselectedindexchanged="cbNsChargeType_SelectedIndexChanged">
                                                    <asp:ListItem Value="1">nights</asp:ListItem>
                                                    <asp:ListItem Value="0">amount</asp:ListItem>
                                                    <asp:ListItem Value="2">full stay</asp:ListItem>
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblNsChargeAmount" runat="server" Text="amount" Visible='<%# Eval("ChargeType")=0 %>' />
                                                <asp:Label ID="lblNsChargeNight" runat="server" Text="night" Visible='<%# Eval("ChargeType")=1 %>' />
                                                <asp:Label ID="lblNsChargeFull" runat="server" Text="full stay" Visible='<%# Eval("ChargeType")=2 %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="100px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Charge">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtNsCharge" runat="server" Text='<%# Bind("Charge") %>' CssClass="TextBox" />
                                                <asp:CompareValidator ID="valNsCharge" runat="server" ControlToValidate="txtNsCharge"
                                                    Display="None" ErrorMessage="Number input required." Operator="DataTypeCheck" Type="Double" />
                                                <asp:ValidatorCalloutExtender ID="calNsCharge" runat="server" Enabled="True" TargetControlID="valNsCharge" />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblNsCharge" runat="server" Text='<%# Eval("Charge") %>' />
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <ItemStyle Width="80px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                                    CommandName="Edit" ImageUrl="~/Images/edit_inline.gif" Text="Edit" 
                                                    Visible="<%# Master.CanEdit() %>" />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" 
                                                    CommandName="Update" ImageUrl="~/Images/accept_inline.gif" Text="Update" />
                                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                                    CommandName="Cancel" ImageUrl="~/Images/decline_inline.gif" Text="Cancel" />
                                            </EditItemTemplate>
                                            <ControlStyle CssClass="ImgButton" />
                                            <ItemStyle Width="50px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="btNsDelete" runat="server" CausesValidation="False" CommandName="Delete"
                                                    ImageUrl="~/Images/delete_inline.gif" OnClientClick="return confirm('Are you sure you want to delete the record')"
                                                    CssClass="ImgButton" Visible="<%# Master.CanEdit() %>" />
                                            </ItemTemplate>
                                            <EditItemTemplate>&nbsp;</EditItemTemplate>
                                            <ItemStyle Width="25px" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <asp:Button ID="btnNsNew" runat="server" CausesValidation="False" 
                                            onclick="btnNsNew_Click" SkinID="skBtnBase" Text="Create" 
                                            Visible="<%# Master.CanEdit() %>" />
                                    </EmptyDataTemplate>
                                    <HeaderStyle Wrap="True" HorizontalAlign="Left" />
                                </asp:GridView>
                                <asp:FormView ID="fvOccupancy" runat="server" DataSourceID="dsNoShow" 
                            Width="461px">
                                    <RowStyle HorizontalAlign="Right" />
                                    <InsertItemTemplate>
                                        <table border="0" cellpadding="0" cellspacing="0" style="border-style: None; border-collapse: collapse;">
                                            <tr class="GridRow1T">
                                                <td style="width: 102px;">
                                                    <asp:TextBox ID="txtINsStart" runat="server" CssClass="TextBox" Text='<%# Bind("Start", "{0:d}") %>' />
                                                    <asp:CalendarExtender ID="calINsStart" runat="server" CssClass="cal_Theme1" Enabled="True" TargetControlID="txtINsStart" />
                                                    <asp:CompareValidator ID="valINsStart" runat="server" ControlToValidate="txtINsStart"
                                                        Display="None" ErrorMessage="Date input required." Operator="DataTypeCheck" Type="Date" />
                                                    <asp:ValidatorCalloutExtender ID="extINsStart" runat="server" Enabled="True" TargetControlID="valINsStart" />
                                                </td>
                                                <td style="width: 102px;">&nbsp;</td>
                                                <td style="width: 102px;">
                                                    <asp:DropDownList ID="cbINsChargeType" runat="server" CssClass="TextBox" 
                                                        SelectedValue='<%# Bind("ChargeType") %>' AutoPostBack="True" 
                                                        onselectedindexchanged="cbINsChargeType_SelectedIndexChanged">
                                                        <asp:ListItem Value="1">nights</asp:ListItem>
                                                        <asp:ListItem Value="0">amount</asp:ListItem>
                                                        <asp:ListItem Value="2">full stay</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="width: 82px;">
                                                    <asp:TextBox ID="txtINsCharge" runat="server" CssClass="TextBox" Text='<%# Bind("Charge") %>'
                                                        Style="text-align: right;" />
                                                </td>
                                                <td style="width: 79px;">
                                                    <asp:ImageButton ID="btNsInsert" runat="server" CausesValidation="True" CommandName="Insert"
                                                        CssClass="ImgButton" ImageUrl="~/Images/accept_inline.gif" />
                                                    <asp:ImageButton ID="btNsCancel" runat="server" CausesValidation="False"
                                                        CommandName="Cancel" CssClass="ImgButton" ImageUrl="~/Images/decline_inline.gif" />
                                                </td>
                                            </tr>
                                        </table>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <table border="0" cellpadding="0" cellspacing="0" style="border-style: None; border-collapse: collapse;">
                                            <tr class="GridRow1T">
                                                <td style="width: 275px; height: 30px;">&nbsp;</td>
                                                <td style="width: 150px; padding-top:5px; padding-bottom:5px; text-align:right;">
                                                    <asp:Button ID="btnNsNew" runat="server" SkinID="skBtnBase" 
                                                        Text="New" Visible="<%# Master.CanEdit() %>" CommandName="New" />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnNsDelete" runat="server" 
                                                        CommandArgument='<%# Eval("CtrNoShowID") %>' onclick="btnNsDelete_Click" 
                                                        SkinID="skBtnBase" Text="Remove" Visible="<%# Master.CanEdit() %>" />
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <EmptyDataTemplate>
                                        <table border="0" cellpadding="0" cellspacing="0" style="border-style: None; border-collapse: collapse;">
                                            <tr class="GridRow1T">
                                                <td style="width: 388px; height: 30px;">&nbsp;</td>
                                                <td style="width: 79px; padding-top:5px; padding-bottom:5px; text-align:right;">
                                                    <asp:Button ID="btnNsNew" runat="server" CommandName="New" SkinID="skBtnBase" Text="New" />
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </EmptyDataTemplate>
                                </asp:FormView>
                                <asp:ObjectDataSource ID="dsNoShow" runat="server" 
                            DeleteMethod="Delete" InsertMethod="Insert"
                                    SelectMethod="GetDataByContractID" TypeName="ContractsTableAdapters.ContractNoShowTableAdapter" 
                            UpdateMethod="Update">
                                    <DeleteParameters>
                                        <asp:Parameter Name="CtrNoShowID" Type="Int32" />
                                    </DeleteParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="CtrNoShowID" Type="Int32" />
                                        <asp:Parameter Name="Start" Type="DateTime" />
                                        <asp:Parameter Name="ChargeType" Type="Int16" />
                                        <asp:Parameter Name="Charge" Type="Decimal" />
                                    </UpdateParameters>
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="ContractID" QueryStringField="ContractID" Type="Int32" />
                                    </SelectParameters>
                                    <InsertParameters>
                                        <asp:QueryStringParameter Name="ContractId" QueryStringField="ContractID" Type="Int32" />
                                        <asp:Parameter Name="Start" Type="DateTime" />
                                        <asp:Parameter Name="Charge" Type="Decimal" />
                                        <asp:Parameter Name="ChargeType" Type="Int16" />
                                    </InsertParameters>
                                </asp:ObjectDataSource>
                            <%--</ContentTemplate>
                        </asp:UpdatePanel>--%>
                    </td>
                </tr>
                <tr><td>&nbsp;</td></tr>
                <tr>
                    <td class="GridLabelBG">
                        <asp:Label ID="lblCancel" runat="server" SkinID="skGridLabel" Text="Cancelation Policy" />
                    </td>
                </tr>
                <tr>
                    <td class="GridBorder" style="vertical-align: top;">
                        <%--<asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>--%>
                                <asp:GridView ID="gvCancel" runat="server" AutoGenerateColumns="False" DataKeyNames="CtrCancelID"
                                    DataSourceID="dsCancelation" SkinID="skGridView" PageSize="15">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Start" SortExpression="Start">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtCancStart" runat="server" Text='<%# Bind("Start", "{0:d}") %>' CssClass="TextBox" />
                                                <asp:CalendarExtender ID="calCancStart" runat="server" CssClass="cal_Theme1" Enabled="True" TargetControlID="txtCancStart" />
                                                <asp:CompareValidator ID="valCancStart" runat="server" ControlToValidate="txtCancStart"
                                                    Display="None" ErrorMessage="Date input required." Operator="DataTypeCheck" Type="Date" />
                                                <asp:ValidatorCalloutExtender ID="extCancStart" runat="server" Enabled="True" TargetControlID="valCancStart" />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblCancStart" runat="server" Text='<%# Bind("Start", "{0:d}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="100px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="End" SortExpression="Finish">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtCancFinish" runat="server" Text='<%# Bind("Finish", "{0:d}") %>' CssClass="TextBox" />
                                                <asp:CalendarExtender ID="calCancFinish" runat="server" CssClass="cal_Theme1" Enabled="True" TargetControlID="txtCancFinish" />
                                                <asp:CompareValidator ID="valCancFinish" runat="server" ControlToValidate="txtCancFinish"
                                                    Display="None" ErrorMessage="Date input required." Operator="DataTypeCheck" Type="Date" />
                                                <asp:ValidatorCalloutExtender ID="extCancFinish" runat="server" Enabled="True" TargetControlID="valCancFinish" />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblCancFinish" runat="server" Text='<%# Bind("Finish", "{0:d}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="100px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Days Prior To Arrival">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtDaysBefore" runat="server" Text='<%# Bind("DaysBefore") %>' CssClass="TextBox" />
                                                <asp:CompareValidator ID="valDaysBefore" runat="server" ControlToValidate="txtDaysBefore"
                                                    Display="None" ErrorMessage="Date input required." Operator="DataTypeCheck" Type="Integer" />
                                                <asp:ValidatorCalloutExtender ID="extDaysBefore" runat="server" Enabled="True" TargetControlID="valDaysBefore" />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblDaysBefore" runat="server" Text='<%# Bind("DaysBefore") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Width="100px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Charge Type">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="cbCancCancelType" runat="server" CssClass="TextBox" 
                                                    SelectedValue='<%# Bind("ChargeType") %>' AutoPostBack="True" 
                                                    onselectedindexchanged="cbCancCancelType_SelectedIndexChanged">
                                                    <asp:ListItem Value="1">nights</asp:ListItem>
                                                    <asp:ListItem Value="0">amount</asp:ListItem>
                                                    <asp:ListItem Value="2">full stay</asp:ListItem>
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblCancCancelAmount" runat="server" Text="amount" Visible='<%# Eval("ChargeType")=0 %>' />
                                                <asp:Label ID="lblCancCancelNight" runat="server" Text="night" Visible='<%# Eval("ChargeType")=1 %>' />
                                                <asp:Label ID="lblCancCancelFull" runat="server" Text="full stay" Visible='<%# Eval("ChargeType")=2 %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="100px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Charge">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtCancCharge" runat="server" Text='<%# Bind("Charge") %>' CssClass="TextBox" />
                                                <asp:CompareValidator ID="valCancCharge" runat="server" ControlToValidate="txtCancCharge"
                                                    Display="None" ErrorMessage="CompareValidator" Operator="DataTypeCheck" Type="Double" />
                                                <asp:ValidatorCalloutExtender ID="extCancCharge" runat="server" Enabled="True" TargetControlID="valCancCharge" />
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblCancCharge" runat="server" Text='<%# Eval("Charge") %>' />
                                            </ItemTemplate>
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <ItemStyle Width="80px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                                    CommandName="Edit" ImageUrl="~/Images/edit_inline.gif" Text="Edit" 
                                                    Visible="<%# Master.CanEdit() %>" />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" 
                                                    CommandName="Update" ImageUrl="~/Images/accept_inline.gif" Text="Update" />
                                                &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                                    CommandName="Cancel" ImageUrl="~/Images/decline_inline.gif" Text="Cancel" />
                                            </EditItemTemplate>
                                            <ControlStyle CssClass="ImgButton" />
                                            <ItemStyle Width="50px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="btCancDelete" runat="server" CausesValidation="False" CommandName="Delete"
                                                    ImageUrl="~/Images/delete_inline.gif" OnClientClick="return confirm('Are you sure you want to delete the record')"
                                                    CssClass="ImgButton" Visible="<%# Master.CanEdit() %>" />
                                            </ItemTemplate>
                                            <EditItemTemplate>&nbsp;</EditItemTemplate>
                                            <ItemStyle Width="25px" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <asp:Button ID="btnNsNew1" runat="server" CausesValidation="False" 
                                            onclick="btnNsNew1_Click" SkinID="skBtnBase" Text="Create" 
                                            Visible="<%# Master.CanEdit() %>" />
                                    </EmptyDataTemplate>
                                    <HeaderStyle Wrap="True" HorizontalAlign="Left" />
                                </asp:GridView>
                                <asp:FormView ID="fvCancelation" runat="server" 
                            DataSourceID="dsCancelation" Width="569px" >
                                    <RowStyle HorizontalAlign="Right" />
                                    <InsertItemTemplate>
                                        <table border="0" cellpadding="0" cellspacing="0" 
                                            style="border-style: None; border-collapse: collapse;">
                                            <tr class="GridRow1T">
                                                <td style="width: 102px; height: 30px;">
                                                    <asp:TextBox ID="txtICancStart" runat="server" Text='<%# Bind("Start", "{0:d}") %>' CssClass="TextBox" />
                                                    <asp:CalendarExtender ID="calICancStart" runat="server" CssClass="cal_Theme1" Enabled="True" TargetControlID="txtICancStart" />
                                                    <asp:CompareValidator ID="valICancStart" runat="server" ControlToValidate="txtICancStart"
                                                        Display="None" ErrorMessage="Date input required." Operator="DataTypeCheck" Type="Date" />
                                                    <asp:ValidatorCalloutExtender ID="extICancStart" runat="server" Enabled="True" TargetControlID="valICancStart" />
                                                </td>
                                                <td style="width: 102px;">
                                                    <asp:TextBox ID="txtICancFinish" runat="server" Text='<%# Bind("Finish") %>' CssClass="TextBox" />
                                                    <asp:CalendarExtender ID="calICancFinish" runat="server" CssClass="cal_Theme1" Enabled="True" TargetControlID="txtICancFinish" />
                                                    <asp:CompareValidator ID="valICancFinish" runat="server" ControlToValidate="txtICancFinish"
                                                        Display="None" ErrorMessage="Date input required." Operator="DataTypeCheck" Type="Date" />
                                                    <asp:ValidatorCalloutExtender ID="extICancFinish" runat="server" Enabled="True" TargetControlID="valICancFinish" />
                                                </td>
                                                <td style="width: 102px;">
                                                    <asp:TextBox ID="txtIDaysBefore" runat="server" Text='<%# Bind("DaysBefore") %>' CssClass="TextBox" />
                                                    <asp:CompareValidator ID="valIDaysBefore" runat="server" ControlToValidate="txtIDaysBefore"
                                                        Display="None" ErrorMessage="Date input required." Operator="DataTypeCheck" Type="Integer" />
                                                    <asp:ValidatorCalloutExtender ID="extIDaysBefore" runat="server" Enabled="True" TargetControlID="valIDaysBefore" />
                                                </td>
                                                <td style="width: 102px;">
                                                    <asp:DropDownList ID="cbICancCancelType" runat="server" CssClass="TextBox" SelectedValue='<%# Bind("ChargeType") %>' >
                                                        <asp:ListItem Value="1">nights</asp:ListItem>
                                                        <asp:ListItem Value="0">amount</asp:ListItem>
                                                        <asp:ListItem Value="2">full stay</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="width: 82px;">
                                                    <asp:TextBox ID="txtICancCharge" runat="server" Text='<%# Bind("Charge") %>' CssClass="TextBox" />
                                                    <asp:CompareValidator ID="valICancCharge" runat="server" ControlToValidate="txtICancCharge"
                                                        Display="None" ErrorMessage="CompareValidator" Operator="DataTypeCheck" Type="Double" />
                                                    <asp:ValidatorCalloutExtender ID="extICancCharge" runat="server" Enabled="True" TargetControlID="valICancCharge" />
                                                </td>
                                                <td style="width: 79px; "> 
                                                    <asp:ImageButton ID="btCancInsert" runat="server" CausesValidation="True" 
                                                        CommandName="Insert" CssClass="ImgButton" 
                                                        ImageUrl="~/Images/accept_inline.gif" />
                                                    <asp:ImageButton ID="btCancCancel" runat="server" 
                                                        CausesValidation="False" CommandName="Cancel" CssClass="ImgButton" 
                                                        ImageUrl="~/Images/decline_inline.gif" />
                                                </td>
                                            </tr>
                                        </table>
                                    </InsertItemTemplate>
                                    <EmptyDataTemplate>
                                        <table border="0" cellpadding="0" cellspacing="0" 
                                            style="border-style: None; border-collapse: collapse;">
                                            <tr class="GridRow1T">
                                                <td style="width: 488px;">&nbsp;</td>
                                                <td style="width: 79px; padding-top:5px; text-align:right; text-align:right;">
                                                    <asp:Button ID="btCancNew" runat="server" CommandName="New" SkinID="skBtnBase" Text="New" />
                                                </td>
                                            </tr>
                                        </table>
                                    </EmptyDataTemplate>
                                    <ItemTemplate>
                                        <table border="0" cellpadding="0" cellspacing="0" 
                                            style="border-style: None; border-collapse: collapse;">
                                            <tr class="GridRow1T">
                                                <td style="width: 488px;">&nbsp;</td>
                                                <td style="width: 150px; padding-top:5px; padding-bottom:5px; text-align:right;">
                                                    <asp:Button ID="btCancNew" runat="server" SkinID="skBtnBase" 
                                                        Text="New" Visible="<%# Master.CanEdit() %>" CommandName="New" />
                                                    &nbsp;<asp:Button ID="btCancDelete" runat="server" onclick="btCancDelete_Click" 
                                                        SkinID="skBtnBase" Text="Remove" Visible="<%# Master.CanEdit() %>" />
                                                    &nbsp;</td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:FormView>
                                <asp:ObjectDataSource ID="dsCancelation" runat="server" SelectMethod="GetDataByContractID"
                                    TypeName="ContractsTableAdapters.ContractCancelationTableAdapter" 
                                    DeleteMethod="Delete" InsertMethod="Insert" 
                            UpdateMethod="Update" OldValuesParameterFormatString="original_{0}">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Original_CtrCancelID" Type="Int32" />
                                    </DeleteParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="Start" Type="DateTime" />
                                        <asp:Parameter Name="Finish" Type="DateTime" />
                                        <asp:Parameter Name="DaysBefore" Type="Int16" />
                                        <asp:Parameter Name="ChargeType" Type="Int16" />
                                        <asp:Parameter Name="Charge" Type="Decimal" />
                                        <asp:Parameter Name="Original_CtrCancelID" Type="Int32" />
                                    </UpdateParameters>
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="ContractID" QueryStringField="ContractID" Type="Int32" />
                                    </SelectParameters>
                                    <InsertParameters>
                                        <asp:QueryStringParameter Name="ContractId" QueryStringField="ContractID" 
                                            Type="Int32" />
                                        <asp:Parameter Name="Start" Type="DateTime" />
                                        <asp:Parameter Name="Finish" Type="DateTime" />
                                        <asp:Parameter Name="DaysBefore" Type="Int16" />
                                        <asp:Parameter Name="ChargeType" Type="Int16" />
                                        <asp:Parameter Name="Charge" Type="Decimal" />
                                    </InsertParameters>
                                </asp:ObjectDataSource>
                            <%--</ContentTemplate>
                        </asp:UpdatePanel>--%>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <%--<asp:UpdatePanel ID="UpdatePanel4" runat="server">
            <ContentTemplate>--%>
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
    </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>
