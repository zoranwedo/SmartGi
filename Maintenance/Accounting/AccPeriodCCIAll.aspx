<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Accounting/AccPeriod.master" AutoEventWireup="false" 
    CodeFile="AccPeriodCCIAll.aspx.vb" Inherits="Maintenance_Accounting_AccPeriodCCIAll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Accounting Periods
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AccountContent" Runat="Server">
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="Label1" runat="server" Text="Hotel Periods" SkinID="skGridLabel" />
                </td>
            </tr>
            <%--<tr>
                <td>
                    <asp:DropDownList ID="ddlHotels" runat="server" AutoPostBack="True" 
                        CssClass="TextBox" DataSourceID="dsHotels" DataTextField="Hotel" 
                        DataValueField="HotelID" />
                    <asp:ObjectDataSource ID="dsHotels" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                        TypeName="dsAccHotelPeriodTableAdapters.HotelTableAdapter" />
                </td>
            </tr>--%>
            <tr>
                <td class="GridBorder">
                    <div class="SelectRowClear" style="font-weight: bold; padding: 2px;">Hotel</div>
                    <div class="GridRow1B" style="text-align: center; padding: 2px;">
                    <asp:DropDownList ID="ddlHotels" runat="server" AutoPostBack="True" 
                        CssClass="TextBox" DataSourceID="dsHotels" DataTextField="Hotel" 
                        DataValueField="HotelID" />
                    <asp:ObjectDataSource ID="dsHotels" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                        TypeName="dsAccHotelPeriodTableAdapters.HotelTableAdapter" />
                    </div>
                    <asp:GridView ID="gvPeriods" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" DataKeyNames="HotelID,PeriodYear,PeriodMonth" 
                        DataSourceID="dsPeriods" SkinID="skGridView">
                        <Columns>
                            <asp:BoundField DataField="HotelID" HeaderText="HotelID" ReadOnly="True" Visible="False" />
                            <asp:BoundField DataField="PeriodYear" HeaderText="Year" ReadOnly="True" >
                                <ItemStyle Width="60px" HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PeriodMonth" HeaderText="Month" ReadOnly="True" >
                                <ItemStyle Width="60px" HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Closed Modules">
                                <ItemTemplate>
                                    <asp:Panel ID="pnlModules" runat="server" Visible='<%# Not Eval("Closed") %>' >
                                    <asp:HiddenField ID="hfHotelID" runat="server" Value='<%# Eval("HotelID") %>' />
                                    <asp:HiddenField ID="hfYear" runat="server" Value='<%# Eval("PeriodYear") %>' />
                                    <asp:HiddenField ID="hfMonth" runat="server" Value='<%# Eval("PeriodMonth") %>' />
                                    <asp:DataList ID="dlModules" runat="server" DataKeyField="AccTypeID" 
                                        DataSourceID="dsModules" RepeatDirection="Horizontal" >
                                        <ItemTemplate>
                                            <asp:LinkButton ID="cbModuleClose" runat="server" Font-Underline="False"
                                                CommandArgument='<%# Eval("HotelID") & ";" & Eval("PeriodYear") & ";" & Eval("PeriodMonth") & ";" & Eval("AccTypeID")  %>' 
                                                OnCommand="cbModuleClose_CheckedChanged"
                                                OnClientClick='<%# CloseModuleWarning(Eval("PeriodYear"),Eval("PeriodMonth"),Eval("AccType"),Eval("Closed")) %>'
                                                UseSubmitBehavior="false" > 
                                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/cbChecked.png" Visible='<%# Eval("Closed") %>' style="margin-right: 3px;" />
                                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/cbUnchecked.png" Visible='<%# Not Eval("Closed") %>' style="margin-right: 3px;" />
                                                <asp:Label ID="lblAccType" runat ="server" Text='<%# Eval("AccType") %>' style="margin-right: 9px;" /> 
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:ObjectDataSource ID="dsModules" runat="server" OldValuesParameterFormatString="original_{0}" 
                                        SelectMethod="GetData" TypeName="dsAccHotelPeriodTableAdapters.AccPeriod_AccTypeTableAdapter">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="hfHotelID" Name="HotelID" PropertyName="Value" Type="Int32" />
                                            <asp:ControlParameter ControlID="hfYear" Name="PeriodYear" PropertyName="Value" Type="Int32" />
                                            <asp:ControlParameter ControlID="hfMonth" Name="PeriodMonth" PropertyName="Value" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                    </asp:Panel>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Panel ID="pnlModules" runat="server" Visible='<%# Not Eval("Closed") %>' Enabled="false" >
                                    <asp:HiddenField ID="hfHotelID" runat="server" Value='<%# Eval("HotelID") %>' />
                                    <asp:HiddenField ID="hfYear" runat="server" Value='<%# Eval("PeriodYear") %>' />
                                    <asp:HiddenField ID="hfMonth" runat="server" Value='<%# Eval("PeriodMonth") %>' />
                                    <asp:DataList ID="dlModules" runat="server" DataKeyField="AccTypeID" 
                                        DataSourceID="dsModules" RepeatDirection="Horizontal" >
                                        <ItemTemplate>
                                            <asp:LinkButton ID="cbModuleClose" runat="server" Font-Underline="False" UseSubmitBehavior="false" > 
                                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/cbChecked.png" Visible='<%# Eval("Closed") %>' style="margin-right: 3px;" />
                                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/cbUnchecked.png" Visible='<%# Not Eval("Closed") %>' style="margin-right: 3px;" />
                                                <asp:Label ID="lblAccType" runat ="server" Text='<%# Eval("AccType") %>' style="margin-right: 9px;" /> 
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:ObjectDataSource ID="dsModules" runat="server" OldValuesParameterFormatString="original_{0}" 
                                        SelectMethod="GetData" TypeName="dsAccHotelPeriodTableAdapters.AccPeriod_AccTypeTableAdapter">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="hfHotelID" Name="HotelID" PropertyName="Value" Type="Int32" />
                                            <asp:ControlParameter ControlID="hfYear" Name="PeriodYear" PropertyName="Value" Type="Int32" />
                                            <asp:ControlParameter ControlID="hfMonth" Name="PeriodMonth" PropertyName="Value" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                    </asp:Panel>
                                </EditItemTemplate>
                                <ItemStyle Width="210px" HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:CheckBoxField DataField="Closed" HeaderText="Closed" >
                                <ItemStyle Width="50px" HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:CheckBoxField>
                            <asp:BoundField DataField="DateClosed" DataFormatString="{0:d}" HeaderText="on" ReadOnly="True">
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="UserClosed" HeaderText="by" ReadOnly="True" >
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ibEdit" runat="server" CausesValidation="False" 
                                        CommandName="Edit" ImageUrl="~/Images/edit_inline.gif" Text="Edit"
                                        style="margin-right: 5px;" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:ImageButton ID="ibUpdate" runat="server" CausesValidation="True" 
                                        CommandName="Update" ImageUrl="~/Images/accept_inline.gif" Text="Update"
                                        style="margin-right: 5px;" />
                                    &nbsp;<asp:ImageButton ID="ibUpdateCancel" runat="server" CausesValidation="False" 
                                        CommandName="Cancel" ImageUrl="~/Images/decline_inline.gif" Text="Cancel" />
                                </EditItemTemplate>
                                <ItemStyle Width="50px" />
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ibDelete" runat="server" CausesValidation="False" 
                                        CommandName="Delete" ImageUrl="~/Images/delete_inline.gif" Text="Delete"
                                        OnClientClick="return confirm('Are you sure you want to delete period?')"
                                        style="margin-right: 5px;" />
                                </ItemTemplate>
                                <ItemStyle Width="30px" />
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <table cellpadding="0" cellspacing="2px" class="GridRow2B">
                                <tr>
                                    <td style="width: 68px;">Year</td>
                                    <td style="width: 110px;">Month</td>
                                    <td style="width: 50px;">&nbsp;</td>
                                    <td style="width: 80px;">&nbsp;</td>
                                    <td style="width: 80px;">&nbsp;</td>
                                    <td style="width: 82px;">&nbsp;</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                    </asp:GridView>
                    <asp:FormView ID="fvNewPeriod" runat="server"
                        DataKeyNames="HotelID,PeriodYear,PeriodMonth" DataSourceID="dsPeriods">
                        <InsertItemTemplate>
                            <table cellpadding="0" cellspacing="2px">
                                <tr>
                                    <td style="width: 120px; text-align: right;"><b>New Period:</b></td>
                                    <td style="width: 100px;">
                                        <asp:DropDownList ID="ddlYear" runat="server" OnDataBound="ddlYear_DataBound"
                                            SelectedValue='<%# Bind("PeriodYear") %>' CssClass="TextBox">
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width: 160px;">
                                        <asp:DropDownList ID="ddlMonth" runat="server" 
                                            SelectedValue='<%# Bind("PeriodMonth") %>' CssClass="TextBox">
                                            <asp:ListItem Value="1">1 (January)</asp:ListItem>
                                            <asp:ListItem Value="2">2 (February)</asp:ListItem>
                                            <asp:ListItem Value="3">3 (March)</asp:ListItem>
                                            <asp:ListItem Value="4">4 (April)</asp:ListItem>
                                            <asp:ListItem Value="5">5 (May)</asp:ListItem>
                                            <asp:ListItem Value="6">6 (June)</asp:ListItem>
                                            <asp:ListItem Value="7">7 (July)</asp:ListItem>
                                            <asp:ListItem Value="8">8 (August)</asp:ListItem>
                                            <asp:ListItem Value="9">9 (September)</asp:ListItem>
                                            <asp:ListItem Value="10">10 (October)</asp:ListItem>
                                            <asp:ListItem Value="11">11 (November)</asp:ListItem>
                                            <asp:ListItem Value="12">12 (December)</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width: 60px; text-align: right;">
                                        <asp:ImageButton ID="ibInsert" runat="server" CausesValidation="True" CommandName="Insert"
                                            ImageUrl="~/Images/accept_inline.gif" style="margin-right: 5px;" />
                                        <asp:ImageButton ID="ibInsertCancel" runat="server" CausesValidation="False"
                                            CommandName="Cancel" ImageUrl="~/Images/decline_inline.gif" style="margin-right: 5px;" />
                                    </td>
                                </tr>
                            </table>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="2px">
                                <tr>
                                    <td style="width: 630px; text-align: right; ">
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" style="margin-top: 5px;" />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <table cellpadding="0" cellspacing="2px">
                                <tr>
                                    <td style="width: 630px; text-align: right;">
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" style="margin-top: 5px;" />
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                    </asp:FormView>
                    <asp:ObjectDataSource ID="dsPeriods" runat="server" DeleteMethod="Delete" 
                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                        SelectMethod="GetDataByHotel" 
                        TypeName="dsAccHotelPeriodTableAdapters.AccPeriodAllTableAdapter" 
                        UpdateMethod="Update">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlHotels" Name="HotelID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                        <DeleteParameters>
                            <asp:Parameter Name="Original_HotelID" Type="Int32" />
                            <asp:Parameter Name="Original_PeriodYear" Type="Int32" />
                            <asp:Parameter Name="Original_PeriodMonth" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter DefaultValue="" Name="Closed" Type="Boolean" />
                            <asp:Parameter DefaultValue="" Name="DateClosed" Type="DateTime" />
                            <asp:Parameter Name="UserClosed" Type="String" />
                            <asp:Parameter Name="Original_HotelID" Type="Int32" />
                            <asp:Parameter Name="Original_PeriodYear" Type="Int32" />
                            <asp:Parameter Name="Original_PeriodMonth" Type="Int32" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:ControlParameter ControlID="ddlHotels" Name="HotelID" PropertyName="SelectedValue" Type="Int32" />
                            <asp:Parameter Name="PeriodYear" Type="Int32" />
                            <asp:Parameter Name="PeriodMonth" Type="Int32" />
                            <asp:Parameter DefaultValue="False" Name="Closed" Type="Boolean" />
                            <asp:Parameter DefaultValue="" Name="DateClosed" Type="DateTime" />
                            <asp:Parameter DefaultValue="" Name="UserClosed" Type="String" />
                        </InsertParameters>
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

