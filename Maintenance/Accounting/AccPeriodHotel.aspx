<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Accounting/AccPeriod.master" AutoEventWireup="false" 
    CodeFile="AccPeriodHotel.aspx.vb" Inherits="Maintenance_Accounting_AccPeriodHotel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Hotel Accounting Periods
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AccountContent" Runat="Server">
    <div class="Blue">
        <table cellspacing="5px">
            <tr>
                <td class="GridLabelBG" colspan="2">
                    <asp:Label ID="lbHotels" runat="server" Text="Hotels And Periods" SkinID="skGridLabel">
                    </asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvHotels" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" DataKeyNames="HotelID" DataSourceID="dsHotels" 
                        SkinID="skGridView" SelectedIndex="0">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbHotelID" runat="server" CausesValidation="False" 
                                        CommandName="Select" Text='<%# "(" & Eval("HotelID") & ")" %>' />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" Width="25px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Code" >
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbHotelHID" runat="server" CausesValidation="False" 
                                        CommandName="Select" Text='<%# Eval("HotelHID") %>' />
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle Width="60px" HorizontalAlign="Center" Font-Bold="true" Font-Italic="true" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Hotel" SortExpression="Hotel">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbHotel" runat="server" CausesValidation="False" 
                                        CommandName="Select" Text='<%# Eval("Hotel") %>' />
                                </ItemTemplate>
                                <ItemStyle Width="350px" />
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle Height="25px" />
                    </asp:GridView>
                    <asp:ObjectDataSource ID="dsHotels" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                        TypeName="dsAccHotelPeriodTableAdapters.HotelTableAdapter">
                    </asp:ObjectDataSource>
                </td>
                <td class="GridBorder" style="vertical-align: top;">
                    <div class="SelectRow1T">
                    <asp:Label ID="lblTitle" runat="server" Text="Hotel Accounting Periods for:" SkinID="skGridLabel" BackColor="Transparent" Height="20px" />
                    </div>
                    <div class="SelectRow1B" style="margin-bottom: 2px;">
                    <asp:FormView ID="fvPeriods" runat="server" DataKeyNames="HotelID" 
                        DataSourceID="dsHotel">
                        <ItemTemplate>
                            <asp:Label ID="HotelLabel" runat="server" Text='<%# Bind("Hotel") %>' SkinID="skGridLabel" BackColor="Transparent" Height="20px" />
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:ObjectDataSource ID="dsHotel" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByID" 
                        TypeName="dsAccHotelPeriodTableAdapters.HotelTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="gvHotels" Name="HotelID" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    </div>
                    <asp:FormView ID="fvNewPeriod" runat="server" DataSourceID="dsNewPeriod" DefaultMode="Edit" >
                        <EditItemTemplate>
                            <table cellpadding="0" cellspacing="2">
                                <tr>
                                    <td class="GridRowClear" style="width: 58px;" >
                                        <asp:LinkButton ID="lbCreate" runat="server" Text="Create" CommandName="Create" 
                                            ValidationGroup="valNew" ForeColor="Green" Font-Bold="true"
                                            OnClientClick='<%# CreateWarning() %>' />
                                    </td>
                                    <td class="GridRowClear" style="width: 80px;" >
                                        <asp:TextBox ID="newPeriodStart" runat="server" Text='<%# Bind("PeriodStart","{0:d}") %>' 
                                            CssClass="TextBox" style="text-align: center;" Enabled='<%# Eval("TheFirst") %>' />
                                        <asp:CalendarExtender ID="cal_newPeriodStart" runat="server" Enabled='<%# Eval("TheFirst") %>'
                                            TargetControlID="newPeriodStart" CssClass="cal_Theme1">
                                        </asp:CalendarExtender>
                                        <asp:CompareValidator ID="date_newPeriodStart" runat="server" ControlToValidate="newPeriodStart"
                                            Display="None" ErrorMessage="Please input a valid date" Operator="DataTypeCheck" Type="Date"
                                            ValidationGroup="valNew" />
                                        <asp:ValidatorCalloutExtender ID="ext_date_newPeriodStart" runat="server"
                                            Enabled="True" TargetControlID="date_newPeriodStart" />
                                        <asp:RequiredFieldValidator ID="req_newPeriodStart" runat="server" ControlToValidate="newPeriodStart"
                                            Display="None" ErrorMessage="Please imput a start date"
                                            ValidationGroup="valNew" />
                                        <asp:ValidatorCalloutExtender ID="ext_req_newPeriodStart" runat="server"
                                            Enabled="True" TargetControlID="req_newPeriodStart" />
                                    </td>
                                    <td class="GridRowClear" style="width: 100px;" >
                                        <asp:TextBox ID="newPeriodFinish" runat="server" Text='<%# Bind("PeriodFinish","{0:d}") %>' 
                                            CssClass="TextBox" style="text-align: center;" />
                                        <asp:CalendarExtender ID="cal_newPeriodFinish" runat="server" 
                                            TargetControlID="newPeriodFinish" CssClass="cal_Theme1">
                                        </asp:CalendarExtender>
                                        <asp:CompareValidator ID="date_newPeriodFinish" runat="server" ControlToValidate="newPeriodFinish"
                                            Display="None" ErrorMessage="Please input a valid date" Operator="DataTypeCheck" Type="Date"
                                            ValidationGroup="valNew" />
                                        <asp:ValidatorCalloutExtender ID="ext_date_newPeriodFinish" runat="server"
                                            Enabled="True" TargetControlID="date_newPeriodFinish" />
                                        <asp:RequiredFieldValidator ID="req_newPeriodFinish" runat="server" ControlToValidate="newPeriodFinish"
                                            Display="None" ErrorMessage="Please imput a finish date"
                                            ValidationGroup="valNew" />
                                        <asp:ValidatorCalloutExtender ID="ext_req_newPeriodFinish" runat="server"
                                            Enabled="True" TargetControlID="req_newPeriodFinish" />
                                    </td>
                                    <td class="GridRowClear" style="width: 50px;" >&nbsp;</td>
                                    <td class="GridRowClear" style="width: 90px;" >&nbsp;</td>
                                    <td class="GridRowClear" style="width: 90px;" >&nbsp;</td>
                                </tr>
                            </table>
                        </EditItemTemplate>
                    </asp:FormView>
                    <asp:ObjectDataSource ID="dsNewPeriod" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                        TypeName="dsAccHotelPeriodTableAdapters.AccHotelPeriodNewTableAdapter" >
                        <SelectParameters>
                            <asp:ControlParameter ControlID="gvHotels" Name="HotelID" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:GridView ID="gvPeriods" runat="server" SkinID="skGridView" 
                        AutoGenerateColumns="False" DataKeyNames="HapID" DataSourceID="dsPeriods" 
                        ShowHeader="False" PageSize="12" >
                        <Columns>
                            <asp:TemplateField >
                                <ItemTemplate>
                                    <asp:HiddenField ID="hfRangeStart" runat="server" Value='<%# Bind("RangeStart","{0:d}") %>' />
                                    <asp:HiddenField ID="hfRangeFinish" runat="server" Value='<%# Bind("RangeFinish","{0:d}") %>' />
                                </ItemTemplate>
                                <ItemStyle Width="60px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="PeriodStart" HeaderText="PeriodStart" 
                                ReadOnly="True" SortExpression="PeriodStart" DataFormatString="{0:d}">
                            <ItemStyle Width="80px" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="PeriodFinish" >
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("PeriodFinish","{0:d}") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="editPeriodFinish" runat="server" Text='<%# Bind("PeriodFinish","{0:d}") %>' CssClass="TextBox" />
                                    <asp:CalendarExtender ID="cal_editPeriodFinish" runat="server" 
                                        TargetControlID="editPeriodFinish" CssClass="cal_Theme1">
                                    </asp:CalendarExtender>
                                    <asp:CompareValidator ID="date_editPeriodFinish" runat="server" ControlToValidate="editPeriodFinish"
                                        Display="None" ErrorMessage="Please input a valid date" Operator="DataTypeCheck" Type="Date" 
                                        ValidationGroup="valEdit" />
                                    <asp:ValidatorCalloutExtender ID="ext_date_editPeriodFinish" runat="server"
                                        Enabled="True" TargetControlID="date_editPeriodFinish" />
                                    <asp:RequiredFieldValidator ID="req_editPeriodFinish" runat="server" ControlToValidate="editPeriodFinish"
                                        Display="None" ErrorMessage="Please imput a finish date"
                                        ValidationGroup="valEdit" />
                                    <asp:ValidatorCalloutExtender ID="ext_req_editPeriodFinish" runat="server"
                                        Enabled="True" TargetControlID="req_editPeriodFinish" />
                                </EditItemTemplate>
                                <ItemStyle Width="100px" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                        CommandName="Edit" ImageUrl="~/Images/edit_inline.gif" Text="Edit" 
                                        Visible='<%# Not (Eval("Closed") Or Eval("NextClosed")) %>' style="margin-left: 5px;" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" 
                                        CommandName="UpdatePeriod" ImageUrl="~/Images/accept_inline.gif" Text="Update" 
                                        CommandArgument='<%# Eval("HapID") & "/" & Container.DataItemIndex %>' 
                                        style="margin-left: 5px;" 
                                        ValidationGroup="valEdit" />
                                    <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                        CommandName="Cancel" ImageUrl="~/Images/decline_inline.gif" Text="Cancel"
                                        style="margin-left: 5px;" />
                                </EditItemTemplate>
                                <ItemStyle Width="50px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Closed" >
                                <ItemTemplate>
                                    <asp:Image ID="imgClosed" runat="server" ImageUrl="~/Images/flag_finish.png" Visible='<%# Eval("Closed") %>' 
                                        ToolTip='<%# "Period closed on: " & Eval("DateClosed") & " by " & Eval("UserClosed") %>' />
                                    <asp:LinkButton ID="lbClose" runat="server" CausesValidation="False" Text="Close"
                                        Visible='<%# Not Eval("Closed") %>' CommandName="Close" CommandArgument='<%# Eval("HapID") %>' 
                                        OnClientClick='<%# CloseWarning(Eval("PeriodStart","{0:d}"),Eval("PeriodFinish","{0:d}")) %>' 
                                        ForeColor="Gray" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Image ID="imgClosed" runat="server" ImageUrl="~/Images/flag_finish.png" Visible='<%# Eval("Closed") %>' 
                                        ToolTip='<%# "Period closed on: " & Eval("DateClosed") & " by " & Eval("UserClosed") %>' />
                                </EditItemTemplate>
                                <ItemStyle Width="90px" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:Image ID="imgOpen" runat="server" ImageUrl="~/Images/flag_blue.png" ToolTip="Period is open" 
                                        Visible='<%# Not Eval("Closed") %>' />
                                    <asp:LinkButton ID="lbOpen" runat="server" CausesValidation="False" Text="Open"
                                        Visible='<%# Eval("Closed") %>' CommandName="Open" CommandArgument='<%# Eval("HapID") %>' 
                                        OnClientClick='<%# OpenWarning(Eval("PeriodStart","{0:d}"),Eval("PeriodFinish","{0:d}")) %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Image ID="imgOpen" runat="server" ImageUrl="~/Images/flag_blue.png" ToolTip="Period is open" 
                                        Visible='<%# Not Eval("Closed") %>' />
                                </EditItemTemplate>
                                <ItemStyle Width="90px" HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <p style="text-align: right;" >
                        <asp:CheckBox ID="cbAll" runat="server" Checked="false" 
                            Text="See All ..." ToolTip="Show/hide older hotel accounting periods" 
                            AutoPostBack="True" />
                    </p>
                    <asp:ObjectDataSource ID="dsPeriods" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData12" 
                        TypeName="dsAccHotelPeriodTableAdapters.AccHotelPeriodTableAdapter" >
                        <SelectParameters>
                            <asp:ControlParameter ControlID="gvHotels" Name="HotelID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="dummy" runat="server" />
        <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
            Enabled="true" PopupDragHandleControlID="popLabel" CancelControlID="btnOK" DropShadow="True"
            BackgroundCssClass="modalBackground" TargetControlID="dummy" X="200" Y="200">
        </asp:ModalPopupExtender>
        <asp:Panel ID="popPanel" runat="server" Width="300px" BackColor="White" Style="display: none">
            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td class="GridLabelBG">
                        <asp:Label ID="popLabel" runat="server" Text="Title" SkinID="skGridLabel" />
                    </td>
                </tr>
                <tr>
                    <td class="GridBorder">
                        <p style="text-align: center;">
                            <asp:Label ID="popMessage" runat="server" Text="Message" />
                        </p>
                        <p style="text-align: right;" class="GridRow2T">
                            <br />
                            <asp:Button ID="btnOK" runat="server" Text="OK" SkinID="skBtnBase" />
                        </p>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
</asp:Content>

