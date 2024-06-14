<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Hotel/masterHotels.master"
    AutoEventWireup="false" CodeFile="HotelPeriods.aspx.vb" Inherits="Maintenance_Hotel_HotelPeriods"
    EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Hotel Periods
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HotelContent" runat="Server">
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gridPeriods" runat="server" SkinID="skGridView" AutoGenerateColumns="False"
                        DataKeyNames="HotelPeriodID,PeriodType" DataSourceID="dsPeriods" 
                        SelectedIndex="0">
                        <HeaderStyle HorizontalAlign="Left" />
                        <Columns>
                            <asp:CommandField SelectImageUrl="~/Images/select_.gif" ShowCancelButton="False"
                                ShowSelectButton="True" ButtonType="Image">
                                <ItemStyle Width="25px" />
                            </asp:CommandField>
                            <asp:BoundField DataField="HotelPeriodID" HeaderText="HotelPeriodID" InsertVisible="False"
                                ReadOnly="True" SortExpression="HotelPeriodID" Visible="False" />
                            <asp:BoundField DataField="HotelId" HeaderText="HotelId" SortExpression="HotelId"
                                Visible="False" />
                            <asp:BoundField DataField="Start" DataFormatString="{0:d}" HeaderText="Start" SortExpression="Start">
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Finish" DataFormatString="{0:d}" HeaderText="End" SortExpression="Finish">
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Type" SortExpression="PeriodType">
                                <ItemTemplate>
                                    <asp:Label ID="lblFlat" runat="server" Text="Flat" Visible='<%# Eval("PeriodType")=0 %>' />
                                    <asp:Label ID="lblPercent" runat="server" Text="Percent" Visible='<%# Eval("PeriodType")=1 %>' />
                                    <asp:Label ID="lblSplit" runat="server" Text="Split" Visible='<%# Eval("PeriodType")=2 %>' />
                                </ItemTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="HotelPercent" DataFormatString="{0:N2}" HeaderText="%"
                                NullDisplayText="-" SortExpression="HotelPercent">
                                <ItemStyle Width="50px" />
                            </asp:BoundField>
                            <asp:TemplateField ShowHeader="False" SortExpression="Recalculated">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbRacalc" runat="server" Visible='<%# Eval("Recalculated") > -1 %>'
                                        SkinID="hypLink" CommandName="Recalc" onclick="lbRacalc_Click" >Recalc</asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle Width="80px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="PrevPeriodId" HeaderText="PrevPeriodId" SortExpression="PrevPeriodId"
                                Visible="False" />
                        </Columns>
                        <EmptyDataTemplate>
                            <asp:Panel ID="pnlNewPeriod" runat="server" style="width: 510px; height: 30px; text-align:right; padding-top: 5px;">
                                <asp:Button ID="btNew" runat="server" CausesValidation="False" CommandName="NewPeriod"
                                    Text="Insert Hotel Period" BorderStyle="None" SkinID="skBtnBase" />
                            </asp:Panel>
                        </EmptyDataTemplate>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="dsPeriods" runat="server" DeleteMethod="HotelPeriodDelete"
                        InsertMethod="HotelPeriodInsert" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetDataByHotelID" TypeName="dsMaintHotelTableAdapters.HotelPeriodTableAdapter"
                        UpdateMethod="HotelPeriodEdit">
                        <DeleteParameters>
                            <asp:Parameter Name="HotelPeriodId" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="HotelPeriodId" Type="Int32" />
                            <asp:Parameter Name="Start" Type="DateTime" />
                            <asp:Parameter Name="Finish" Type="DateTime" />
                            <asp:Parameter Name="PeriodType" Type="Int16" />
                            <asp:Parameter Name="HotelPercent" Type="Decimal" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="HotelId" QueryStringField="HotelID" Type="Int32" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:QueryStringParameter Name="HotelId" QueryStringField="HotelID" 
                                Type="Int32" />
                            <asp:Parameter Name="Start" Type="DateTime" />
                            <asp:Parameter Name="Finish" Type="DateTime" />
                            <asp:Parameter Name="PeriodType" Type="Int16" />
                            <asp:Parameter Name="HotelPercent" Type="Decimal" />
                            <asp:Parameter Direction="InputOutput" Name="NewPeriodID" Type="Object" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
    </div>
    <div class="Red">
        <asp:Panel ID="pnlPeriod" runat="server" >
        <table cellpadding="0" cellspacing="2px">
            <tr>
                <td style="width:25px;">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/select_.gif" />
                </td>
                <td class="GridLabelBG">
                    <asp:Label ID="lblSelPeriod" runat="server" SkinID="skGridLabel" Text="Selected Period" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td class="GridBorder" style="vertical-align: top;">
                    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">--%>
                    <%--<ContentTemplate>--%>
                    <asp:DetailsView ID="dvPeriod" runat="server" AutoGenerateRows="False" DataKeyNames="HotelPeriodID"
                        DataSourceID="dsSelPeriod" SkinID="skDetailView" Width="490px">
                        <Fields>
                            <asp:BoundField DataField="HotelPeriodID" HeaderText="HotelPeriodID" InsertVisible="False"
                                ReadOnly="True" SortExpression="HotelPeriodID" Visible="False" />
                            <asp:BoundField DataField="HotelId" HeaderText="HotelId" 
                                SortExpression="HotelId" Visible="False" />
                            <asp:TemplateField HeaderText="Start" SortExpression="Start">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEdStart" runat="server" Text='<%# Bind("Start", "{0:d}") %>' CssClass="TextBox" Width="360px" />
                                    <asp:ImageButton ID="btEdStart" runat="server" ImageUrl="~/Images/Calendar.png" />
                                    <asp:CalendarExtender ID="extEdStart" runat="server" TargetControlID="txtEdStart" PopupButtonID="btEdStart" PopupPosition="BottomRight" />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtInsStart" runat="server" Text='<%# Bind("Start", "{0:d}") %>' CssClass="TextBox" Width="360px" />
                                    <asp:ImageButton ID="btInsStart" runat="server" ImageUrl="~/Images/Calendar.png" />
                                    <asp:CalendarExtender ID="extInsStart" runat="server" TargetControlID="txtInsStart" PopupButtonID="btInsStart" PopupPosition="BottomRight" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblStart" runat="server" Text='<%# Bind("Start", "{0:d}") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="End" SortExpression="Finish">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEdFinish" runat="server" Text='<%# Bind("Finish", "{0:d}") %>' CssClass="TextBox" Width="360px" />
                                    <asp:ImageButton ID="btEdFinish" runat="server" ImageUrl="~/Images/Calendar.png" />
                                    <asp:CalendarExtender ID="extEdFinish" runat="server" TargetControlID="txtEdFinish" PopupButtonID="btEdFinish" PopupPosition="BottomRight" />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtInsFinish" runat="server" Text='<%# Bind("Finish", "{0:d}") %>' CssClass="TextBox" Width="360px" />
                                    <asp:ImageButton ID="btInsFinish" runat="server" ImageUrl="~/Images/Calendar.png" />
                                    <asp:CalendarExtender ID="extInsFinish" runat="server" TargetControlID="txtInsFinish" PopupButtonID="btInsFinish" PopupPosition="BottomRight" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblFinish" runat="server" Text='<%# Bind("Finish", "{0:d}") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PeriodType" SortExpression="PeriodType">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlEdType" runat="server" AutoPostBack="True" CssClass="TextBox"
                                        SelectedValue='<%# Bind("PeriodType") %>' OnSelectedIndexChanged="ddlEdType_SelectedIndexChanged">
                                        <%--<asp:ListItem Value="0">Flat</asp:ListItem>--%>
                                        <asp:ListItem Value="1">Percent</asp:ListItem>
                                        <%--<asp:ListItem Value="2">Split</asp:ListItem>--%>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="ddlInsType" runat="server" AutoPostBack="True" CssClass="TextBox"
                                        SelectedValue='<%# Bind("PeriodType") %>' OnSelectedIndexChanged="ddlInsType_SelectedIndexChanged">
                                        <%--<asp:ListItem Value="0">Flat</asp:ListItem>--%>
                                        <asp:ListItem Value="1">Percent</asp:ListItem>
                                        <%--<asp:ListItem Value="2">Split</asp:ListItem>--%>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblItFlat" runat="server" Text="Flat" Visible='<%# Eval("PeriodType")=0 %>' />
                                    <asp:Label ID="lblItPercent" runat="server" Text="Percent" Visible='<%# Eval("PeriodType")=1 %>' />
                                    <asp:Label ID="lblItSplit" runat="server" Text="Split" Visible='<%# Eval("PeriodType")=2 %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="" ShowHeader="True">
                                <ItemTemplate>
                                    <asp:Label ID="lblItPc" runat="server" Text='<%# Eval("HotelPercent", "{0:N2}") %>' />
                                        <%--Visible='<%# Eval("PeriodType")=1 %>' />--%>
                                    <asp:GridView ID="gridSplit" runat="server" AutoGenerateColumns="False" DataKeyNames="MealPlanID"
                                        DataSourceID="dsSplit" SkinID="skGridView">
                                        <Columns>
                                            <asp:BoundField DataField="HotelPeriodID" HeaderText="HotelPeriodID" ReadOnly="True" Visible="False" />
                                            <asp:BoundField DataField="MealPlanID" HeaderText="MP" ReadOnly="True" SortExpression="MealPlanID">
                                                <ItemStyle Width="50px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RENTlab" HeaderText="RENT" SortExpression="RENTlab">
                                                <ControlStyle CssClass="TextBox" />
                                                <ItemStyle Width="65px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RENTpc" DataFormatString="{0:N2}" HeaderText="RENT%" SortExpression="RENTpc">
                                                <ControlStyle CssClass="TextBox" />
                                                <ItemStyle Width="50px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="AYBlab" HeaderText="AYB" SortExpression="AYBlab">
                                                <ControlStyle CssClass="TextBox" />
                                                <ItemStyle Width="65px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="AYBpc" DataFormatString="{0:N2}" HeaderText="AYB%" SortExpression="AYBpc">
                                                <ControlStyle CssClass="TextBox" />
                                                <ItemStyle Width="50px" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="HotelPercent" DataFormatString="{0:N2}" HeaderText="%"
                                                ReadOnly="True" SortExpression="HotelPercent">
                                                <ItemStyle Width="50px" />
                                            </asp:BoundField>
                                            <asp:CommandField CancelImageUrl="~/Images/decline_inline.gif" ShowEditButton="True"
                                                ButtonType="Image" EditImageUrl="~/Images/edit_inline.gif" UpdateImageUrl="~/Images/accept_inline.gif">
                                                <ControlStyle CssClass="ImgButton" />
                                                <ItemStyle Width="50px" />
                                            </asp:CommandField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:GridView ID="gridFlat" runat="server" AutoGenerateColumns="False" DataKeyNames="HotelPeriodID,MealPlanID"
                                        DataSourceID="dsFlat" SkinID="skGridView">
                                        <Columns>
                                            <asp:BoundField DataField="HotelPeriodID" HeaderText="HotelPeriodID" ReadOnly="True"
                                                SortExpression="HotelPeriodID" Visible="False" />
                                            <asp:BoundField DataField="MealPlanID" HeaderText="Meal Plan" ReadOnly="True" SortExpression="MealPlanID">
                                                <ItemStyle Width="100px" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="IsPerPax" SortExpression="IsPerPax">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsPerPax") %>' Enabled="false" />
                                                </ItemTemplate>
                                                <ItemStyle Width="280px" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </ItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtInsPc" runat="server" Text='<%# Bind("HotelPercent", "{0:N2}") %>' CssClass="TextBox" />
                                        <%--Visible='<%# True Or Eval("PeriodType")=1 %>' />--%>
                                </InsertItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEdPc" runat="server" Text='<%# Bind("HotelPercent", "{0:N2}") %>' CssClass="TextBox" />
                                        <%--Visible='<%# True Or Eval("PeriodType")=1 %>' />--%>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Recalculated" HeaderText="Recalculated" SortExpression="Recalculated" Visible="False" />
                            <asp:BoundField DataField="PrevPeriodId" HeaderText="PrevPeriodId" SortExpression="PrevPeriodId" Visible="False" />
                            <asp:CommandField ButtonType="Button" ShowEditButton="True" ShowInsertButton="True">
                                <ControlStyle BorderStyle="None" CssClass="Button" ForeColor="White" />
                                <ItemStyle CssClass="GridRow2TB" BorderStyle="None" Height="30px" HorizontalAlign="Right" />
                            </asp:CommandField>
                        </Fields>
                        <FieldHeaderStyle Width="100px" />
                    </asp:DetailsView>
                    <asp:ObjectDataSource ID="dsFlat" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetDataPeriodID" TypeName="dsMaintHotelTableAdapters.HotelPeriodFlatMPTableAdapter"
                        UpdateMethod="Update">
                        <UpdateParameters>
                            <asp:Parameter Name="IsPerPax" Type="Boolean" />
                            <asp:Parameter Name="Original_HotelPeriodID" Type="Int32" />
                            <asp:Parameter Name="Original_MealPlanID" Type="String" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="dvPeriod" Name="HotelPeriodID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="dsSelPeriod" runat="server" DeleteMethod="HotelPeriodDelete"
                        InsertMethod="HotelPeriodInsert"
                        SelectMethod="GetDataByPreiodID" TypeName="dsMaintHotelTableAdapters.HotelPeriodTableAdapter"
                        UpdateMethod="HotelPeriodEdit">
                        <DeleteParameters>
                            <asp:Parameter Name="HotelPeriodId" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="HotelPeriodId" Type="Int32" />
                            <asp:Parameter Name="Start" Type="DateTime" />
                            <asp:Parameter Name="Finish" Type="DateTime" />
                            <asp:Parameter Name="PeriodType" Type="Int16" />
                            <asp:Parameter Name="HotelPercent" Type="Decimal" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="HotelId" QueryStringField="HotelID" Type="Int32" />
                            <asp:ControlParameter ControlID="gridPeriods" Name="HotelPeriodID" PropertyName="SelectedValue"
                                Type="Int32" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:QueryStringParameter Name="HotelId" QueryStringField="HotelID" 
                                Type="Int32" />
                            <asp:Parameter Name="Start" Type="DateTime" />
                            <asp:Parameter Name="Finish" Type="DateTime" />
                            <asp:Parameter Name="PeriodType" Type="Int16" />
                            <asp:Parameter Name="HotelPercent" Type="Decimal" />
                            <asp:Parameter Direction="InputOutput" Name="NewPeriodID" Type="Object" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="dsSplit" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetDataByPeriodID" TypeName="dsMaintHotelTableAdapters.HotelPeriodPercentTableAdapter"
                        UpdateMethod="Update">
                        <UpdateParameters>
                            <asp:Parameter Name="RENTlab" Type="String" />
                            <asp:Parameter Name="RENTpc" Type="Decimal" />
                            <asp:Parameter Name="AYBlab" Type="String" />
                            <asp:Parameter Name="AYBpc" Type="Decimal" />
                            <asp:Parameter Name="HotelPercent" Type="Decimal" />
                            <asp:Parameter Name="Original_HotelPeriodID" Type="Int32" />
                            <asp:Parameter Name="Original_MealPlanID" Type="String" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="dvPeriod" Name="HotelPeriodID" PropertyName="SelectedValue"
                                Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="dsFlatRates" runat="server" DeleteMethod="Delete" 
                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                        SelectMethod="GetDataByPeriodID" 
                        TypeName="dsMaintHotelTableAdapters.HotelPeriodFlatTableAdapter" 
                        UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_HotelPeriodFlatID" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="RatePax1" Type="Decimal" />
                            <asp:Parameter Name="RatePax2" Type="Decimal" />
                            <asp:Parameter Name="RatePax3" Type="Decimal" />
                            <asp:Parameter Name="RatePax4" Type="Decimal" />
                            <asp:Parameter Name="RatePax5" Type="Decimal" />
                            <asp:Parameter Name="RatePax6" Type="Decimal" />
                            <asp:Parameter Name="RatePax7" Type="Decimal" />
                            <asp:Parameter Name="RatePax8" Type="Decimal" />
                            <asp:Parameter Name="RatePax9" Type="Decimal" />
                            <asp:Parameter Name="RatePax10" Type="Decimal" />
                            <asp:Parameter Name="RateChld1" Type="Decimal" />
                            <asp:Parameter Name="RateChld2" Type="Decimal" />
                            <asp:Parameter Name="RateChld3" Type="Decimal" />
                            <asp:Parameter Name="RateChld4" Type="Decimal" />
                            <asp:Parameter Name="RateExtra" Type="Int16" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="Original_HotelPeriodFlatID" Type="Int32" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="gridPeriods" Name="HotelPeriodID" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:Parameter Name="HotelPeriodId" Type="Int32" />
                            <asp:Parameter Name="HotelId" Type="Int32" />
                            <asp:Parameter Name="RoomTypeId" Type="String" />
                            <asp:Parameter Name="MarketId" Type="String" />
                            <asp:Parameter Name="MealPlanId" Type="String" />
                            <asp:Parameter Name="IsPerPax" Type="Boolean" />
                            <asp:Parameter Name="RatePax1" Type="Decimal" />
                            <asp:Parameter Name="RatePax2" Type="Decimal" />
                            <asp:Parameter Name="RatePax3" Type="Decimal" />
                            <asp:Parameter Name="RatePax4" Type="Decimal" />
                            <asp:Parameter Name="RatePax5" Type="Decimal" />
                            <asp:Parameter Name="RatePax6" Type="Decimal" />
                            <asp:Parameter Name="RatePax7" Type="Decimal" />
                            <asp:Parameter Name="RatePax8" Type="Decimal" />
                            <asp:Parameter Name="RatePax9" Type="Decimal" />
                            <asp:Parameter Name="RatePax10" Type="Decimal" />
                            <asp:Parameter Name="RateChld1" Type="Decimal" />
                            <asp:Parameter Name="RateChld2" Type="Decimal" />
                            <asp:Parameter Name="RateChld3" Type="Decimal" />
                            <asp:Parameter Name="RateChld4" Type="Decimal" />
                            <asp:Parameter Name="RateExtra" Type="Int16" />
                            <asp:Parameter Name="Description" Type="String" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                    <%--</ContentTemplate>--%>
                    <%--</asp:UpdatePanel>--%>
                  </td>
                </tr>
        </table>
        <asp:Panel ID="pnlRates" runat="server" Visible="False" >
        <table cellpadding="0" cellspacing="2px">
            <tr>
                <td style="width:25px;">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/select_.gif" />
                </td>
                <td class="GridLabelBG">
                    <asp:Label ID="Label1" runat="server" SkinID="skGridLabel" Text="Rates" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td class="GridBorder" style="vertical-align: top;">
                    <%--<asp:UpdatePanel ID="UpdatePanel2" runat="server">--%>
                    <%--<ContentTemplate>--%>
                    <asp:GridView ID="gridRates" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="HotelPeriodFlatID" DataSourceID="dsFlatRates" 
                        SkinID="skGridView" ShowFooter="True">
                        <FooterStyle Font-Italic="True" />
                        <EmptyDataTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>No rates has been generated.</td>
                                </tr>
                                <tr>
                                    <td class="GridRow2T" style="text-align: right; height: 30px; padding-top: 5px; width: 490px;">
                            <asp:Button ID="btGenerate" runat="server" BorderStyle="None" 
                                CausesValidation="False" SkinID="skBtnBase" 
                                Text="Generate Flat Rates"
                                OnClick="btGenerate_Click" />
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <%--<HeaderStyle HorizontalAlign="Right" />--%>
                        <Columns>
                            <asp:BoundField DataField="HotelPeriodFlatID" HeaderText="HotelPeriodFlatID" 
                                InsertVisible="False" ReadOnly="True" SortExpression="HotelPeriodFlatID" 
                                Visible="False" />
                            <asp:BoundField DataField="HotelPeriodId" HeaderText="HotelPeriodId" 
                                SortExpression="HotelPeriodId" Visible="False" />
                            <asp:BoundField DataField="HotelId" HeaderText="HotelId" 
                                SortExpression="HotelId" Visible="False" />
                            <asp:BoundField DataField="RoomTypeId" HeaderText="Room" ReadOnly="True" 
                                SortExpression="Room">
                            <ItemStyle Width="60px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MarketId" HeaderText="MarketId" 
                                SortExpression="MarketId" Visible="False" >
                            </asp:BoundField>
                            <asp:BoundField DataField="MealPlanId" HeaderText="MP" ReadOnly="True" 
                                SortExpression="MP">
                            <ItemStyle Width="50px" />
                            </asp:BoundField>
                            <asp:CheckBoxField DataField="IsPerPax" HeaderText="PerPax" SortExpression="IsPerPax" ReadOnly="True">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="50px" />
                            </asp:CheckBoxField>
                            <asp:TemplateField HeaderText="Single">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtPax1" runat="server" Text='<%# Bind("RatePax1", "{0:N2}") %>' CssClass="TextBox" />
                                    <asp:CompareValidator ID="numPax1" runat="server" ControlToValidate="txtPax1" Operator="DataTypeCheck" Type="Currency" SkinID="skInteger" />
                                    <asp:ValidatorCalloutExtender ID="extPax1" runat="server" TargetControlID="numPax1" SkinID="skExtender" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblPax1" runat="server" Text='<%# Bind("RatePax1", "{0:N2}") %>' style="padding-right:2px;" />
                                </ItemTemplate>
                                <ItemStyle Width="60px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Double">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtPax2" runat="server" Text='<%# Bind("RatePax2", "{0:N2}") %>' CssClass="TextBox" />
                                    <asp:CompareValidator ID="numPax2" runat="server" ControlToValidate="txtPax2" Operator="DataTypeCheck" Type="Currency" SkinID="skInteger" />
                                    <asp:ValidatorCalloutExtender ID="extPax2" runat="server" TargetControlID="numPax2" SkinID="skExtender" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblPax2" runat="server" Text='<%# Bind("RatePax2", "{0:N2}") %>' style="padding-right:2px;" />
                                </ItemTemplate>
                                <ItemStyle Width="60px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Triple">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtPax3" runat="server" Text='<%# Bind("RatePax3", "{0:N2}") %>' CssClass="TextBox" />
                                    <asp:CompareValidator ID="numPax3" runat="server" ControlToValidate="txtPax3" Operator="DataTypeCheck" Type="Currency" SkinID="skInteger" />
                                    <asp:ValidatorCalloutExtender ID="extPax3" runat="server" TargetControlID="numPax3" SkinID="skExtender" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblPax3" runat="server" Text='<%# Bind("RatePax3", "{0:N2}") %>' style="padding-right:2px;" />
                                </ItemTemplate>
                                <ItemStyle Width="60px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Quadruple">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtPax4" runat="server" Text='<%# Bind("RatePax4", "{0:N2}") %>' CssClass="TextBox" />
                                    <asp:CompareValidator ID="numPax4" runat="server" ControlToValidate="txtPax4" Operator="DataTypeCheck" Type="Currency" SkinID="skInteger" />
                                    <asp:ValidatorCalloutExtender ID="extPax4" runat="server" TargetControlID="numPax4" SkinID="skExtender" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblPax4" runat="server" Text='<%# Bind("RatePax4", "{0:N2}") %>' style="padding-right:2px;" />
                                </ItemTemplate>
                                <ItemStyle Width="60px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Quintuple">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtPax5" runat="server" Text='<%# Bind("RatePax5", "{0:N2}") %>' CssClass="TextBox" />
                                    <asp:CompareValidator ID="numPax5" runat="server" ControlToValidate="txtPax5" Operator="DataTypeCheck" Type="Currency" SkinID="skInteger" />
                                    <asp:ValidatorCalloutExtender ID="extPax5" runat="server" TargetControlID="numPax5" SkinID="skExtender" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblPax5" runat="server" Text='<%# Bind("RatePax5", "{0:N2}") %>' style="padding-right:2px;" />
                                </ItemTemplate>
                                <ItemStyle Width="60px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sextuple">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtPax6" runat="server" Text='<%# Bind("RatePax6", "{0:N2}") %>' CssClass="TextBox" />
                                    <asp:CompareValidator ID="numPax6" runat="server" ControlToValidate="txtPax6" Operator="DataTypeCheck" Type="Currency" SkinID="skInteger" />
                                    <asp:ValidatorCalloutExtender ID="extPax6" runat="server" TargetControlID="numPax6" SkinID="skExtender" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblPax6" runat="server" Text='<%# Bind("RatePax6", "{0:N2}") %>' style="padding-right:2px;" />
                                </ItemTemplate>
                                <ItemStyle Width="60px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Septuple">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtPax7" runat="server" Text='<%# Bind("RatePax7", "{0:N2}") %>' CssClass="TextBox" />
                                    <asp:CompareValidator ID="numPax7" runat="server" ControlToValidate="txtPax7" Operator="DataTypeCheck" Type="Currency" SkinID="skInteger" />
                                    <asp:ValidatorCalloutExtender ID="extPax7" runat="server" TargetControlID="numPax7" SkinID="skExtender" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblPax7" runat="server" Text='<%# Bind("RatePax7", "{0:N2}") %>' style="padding-right:2px;" />
                                </ItemTemplate>
                                <ItemStyle Width="60px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Octuple">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtPax8" runat="server" Text='<%# Bind("RatePax8", "{0:N2}") %>' CssClass="TextBox" />
                                    <asp:CompareValidator ID="numPax8" runat="server" ControlToValidate="txtPax8" Operator="DataTypeCheck" Type="Currency" SkinID="skInteger" />
                                    <asp:ValidatorCalloutExtender ID="extPax8" runat="server" TargetControlID="numPax8" SkinID="skExtender" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblPax8" runat="server" Text='<%# Bind("RatePax8", "{0:N2}") %>' style="padding-right:2px;" />
                                </ItemTemplate>
                                <ItemStyle Width="60px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nonuple">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtPax9" runat="server" Text='<%# Bind("RatePax9", "{0:N2}") %>' CssClass="TextBox" />
                                    <asp:CompareValidator ID="numPax9" runat="server" ControlToValidate="txtPax9" Operator="DataTypeCheck" Type="Currency" SkinID="skInteger" />
                                    <asp:ValidatorCalloutExtender ID="extPax9" runat="server" TargetControlID="numPax9" SkinID="skExtender" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblPax9" runat="server" Text='<%# Bind("RatePax9", "{0:N2}") %>' style="padding-right:2px;" />
                                </ItemTemplate>
                                <ItemStyle Width="60px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Decuple">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtPax10" runat="server" Text='<%# Bind("RatePax10", "{0:N2}") %>' CssClass="TextBox" />
                                    <asp:CompareValidator ID="numPax10" runat="server" ControlToValidate="txtPax10" Operator="DataTypeCheck" Type="Currency" SkinID="skInteger" />
                                    <asp:ValidatorCalloutExtender ID="extPax10" runat="server" TargetControlID="numPax10" SkinID="skExtender" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblPax10" runat="server" Text='<%# Bind("RatePax10", "{0:N2}") %>' style="padding-right:2px;" />
                                </ItemTemplate>
                                <ItemStyle Width="60px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ch1">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCh1" runat="server" Text='<%# Bind("RateChld1", "{0:N2}") %>' CssClass="TextBox" />
                                    <asp:CompareValidator ID="numCh1" runat="server" ControlToValidate="txtCh1" Operator="DataTypeCheck" Type="Currency" SkinID="skInteger" />
                                    <asp:ValidatorCalloutExtender ID="extCh1" runat="server" TargetControlID="numCh1" SkinID="skExtender" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblCh1" runat="server" Text='<%# Bind("RateChld1", "{0:N2}") %>' style="padding-right:2px;" />
                                </ItemTemplate>
                                <ItemStyle Width="60px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ch2">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCh2" runat="server" Text='<%# Bind("RateChld2", "{0:N2}") %>' CssClass="TextBox" />
                                    <asp:CompareValidator ID="numCh2" runat="server" ControlToValidate="txtCh2" Operator="DataTypeCheck" Type="Currency" SkinID="skInteger" />
                                    <asp:ValidatorCalloutExtender ID="extCh2" runat="server" TargetControlID="numCh2" SkinID="skExtender" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblCh2" runat="server" Text='<%# Bind("RateChld2", "{0:N2}") %>' style="padding-right:2px;" />
                                </ItemTemplate>
                                <ItemStyle Width="60px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ch3">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCh3" runat="server" Text='<%# Bind("RateChld3", "{0:N2}") %>' CssClass="TextBox" />
                                    <asp:CompareValidator ID="numCh3" runat="server" ControlToValidate="txtCh3" Operator="DataTypeCheck" Type="Currency" SkinID="skInteger" />
                                    <asp:ValidatorCalloutExtender ID="extCh3" runat="server" TargetControlID="numCh3" SkinID="skExtender" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblCh3" runat="server" Text='<%# Bind("RateChld3", "{0:N2}") %>' style="padding-right:2px;" />
                                </ItemTemplate>
                                <ItemStyle Width="60px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ch4">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCh4" runat="server" Text='<%# Bind("RateChld4", "{0:N2}") %>' CssClass="TextBox" />
                                    <asp:CompareValidator ID="numCh4" runat="server" ControlToValidate="txtCh4" Operator="DataTypeCheck" Type="Currency" SkinID="skInteger" />
                                    <asp:ValidatorCalloutExtender ID="extCh4" runat="server" TargetControlID="numCh4" SkinID="skExtender" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblCh4" runat="server" Text='<%# Bind("RateChld4", "{0:N2}") %>' style="padding-right:2px;" />
                                </ItemTemplate>
                                <ItemStyle Width="60px" />
                            </asp:TemplateField>
                            <asp:CommandField CancelImageUrl="~/Images/decline_inline.gif" ShowEditButton="True"
                                ButtonType="Image" EditImageUrl="~/Images/edit_inline.gif" UpdateImageUrl="~/Images/accept_inline.gif">
                                <ControlStyle CssClass="ImgButton" />
                                <ItemStyle Width="50px" />
                            </asp:CommandField>
                        </Columns>
                    </asp:GridView>
                    <%--</ContentTemplate>--%>
                    <%--</asp:UpdatePanel>--%>
                </td>
            </tr>
       </table>
       </asp:Panel>
       </asp:Panel>
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
