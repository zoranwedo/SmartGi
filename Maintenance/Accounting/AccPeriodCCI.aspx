<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Accounting/AccPeriod.master" AutoEventWireup="false" 
    CodeFile="AccPeriodCCI.aspx.vb" Inherits="Maintenance_Accounting_AccPeriodCCI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Accounting Periods
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
                    <asp:Label ID="lblTitle" runat="server" Text="Accounting Periods for:" SkinID="skGridLabel" BackColor="Transparent" Height="20px" />
                    </div>
                    <div class="SelectRow1B" style="margin-bottom: 2px;">
                    <asp:FormView ID="fvPeriods" runat="server" DataKeyNames="HotelID,pYear,pMonth" 
                        DataSourceID="dsPeriods">
                        <ItemTemplate>
                            <asp:Label ID="HotelLabel" runat="server" Text='<%# Bind("Hotel") %>' SkinID="skGridLabel" BackColor="Transparent" Height="20px" />
                        </ItemTemplate>
                    </asp:FormView>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanelMain" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                    <asp:GridView ID="gvPeriods" runat="server" AllowSorting="False" ShowHeader="false" 
                        AutoGenerateColumns="False" DataKeyNames="HotelID" DataSourceID="dsPeriods" 
                        SkinID="skGridView">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbCreate" runat="server" CausesValidation="False" Text="Create"
                                        CommandName="Create" CommandArgument='<%# Eval("pYear") & "/" & Eval("pMonth") & "/" & Eval("HotelID") %>' 
                                        OnClientClick='<%# CreateWarning(Eval("pYear"),Eval("pMonth"),Eval("Hotel")) %>' 
                                        Visible='<%# Not Eval("PeriodExists") %>' ForeColor="Green" Font-Bold="true" />
                                </ItemTemplate>
                                <ItemStyle Width="60px" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Period" >
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("pYear") & "/" & Eval("pMonth") %>' 
                                        Visible='<%# Eval("Closed") %>' ForeColor="Gray" />
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("pYear") & "/" & Eval("pMonth") %>' 
                                        Visible='<%# Not Eval("Closed") %>' />
                                </ItemTemplate>
                                <ItemStyle Width="80px" Font-Bold="true" HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Closed Modules">
                                <ItemTemplate>
                                    <asp:Panel ID="pnlModules" runat="server" Visible='<%# Not Eval("Closed") %>' >
                                    <asp:HiddenField ID="hfHotelID" runat="server" Value='<%# Eval("HotelID") %>' />
                                    <asp:HiddenField ID="hfYear" runat="server" Value='<%# Eval("pYear") %>' />
                                    <asp:HiddenField ID="hfMonth" runat="server" Value='<%# Eval("pMonth") %>' />
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
                                <ItemStyle Width="210px" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:Image ID="imgClosed" runat="server" ImageUrl="~/Images/flag_finish.png" 
                                        Visible='<%# Eval("PeriodExists") And Eval("Closed") %>' 
                                        ToolTip='<%# "Period closed on: " & Eval("DateClosed") & " by " & Eval("UserClosed") %>' />
                                    <asp:LinkButton ID="lbClose" runat="server" CausesValidation="False" Text="Close"
                                        CommandName="Close" CommandArgument='<%# Eval("pYear") & "/" & Eval("pMonth") & "/" & Eval("HotelID") %>'  
                                        OnClientClick='<%# CloseWarning(Eval("pYear"),Eval("pMonth"),Eval("Hotel")) %>' 
                                        Visible='<%# Eval("PeriodExists") And Not Eval("Closed") %>' ForeColor="Gray" />
                                </ItemTemplate>
                                <ItemStyle Width="80px" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:Image ID="imgOpen" runat="server" ImageUrl="~/Images/flag_blue.png" ToolTip="Period is open" 
                                        Visible='<%# Eval("PeriodExists") And Not Eval("Closed") %>' />
                                    <asp:LinkButton ID="lbOpen" runat="server" CausesValidation="False" Text="Open"
                                        CommandName="Open" CommandArgument='<%# Eval("pYear") & "/" & Eval("pMonth") & "/" & Eval("HotelID") %>'  
                                        OnClientClick='<%# OpenWarning(Eval("pYear"),Eval("pMonth"),Eval("Hotel")) %>' 
                                        Visible='<%# Eval("PeriodExists") And Eval("Closed") %>' />
                                </ItemTemplate>
                                <ItemStyle Width="80px" HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle Height="25px" />
                    </asp:GridView>
                    <p style="text-align: right;" >
                        <asp:LinkButton ID="lbAll" runat="server" Text="See All..." ToolTip="Go to old accounting period maintenance form" />
                    </p>
                    <asp:ObjectDataSource ID="dsPeriods" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                        TypeName="dsAccHotelPeriodTableAdapters.AccPeriodTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="gvHotels" Name="HotelID" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                        </ContentTemplate>
                    </asp:UpdatePanel>
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

