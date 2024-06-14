<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    EnableEventValidation="false" CodeFile="ExtendSpec.aspx.vb" Inherits="Contracts_Special_ExtendSpec" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Extend Special
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" runat="Server">
    <div class="Blue">
        <table cellpadding="0" cellspacing="0" style="width: 100%;">
            <tr>
                <td class="LocalMenuRow" style="width: 130px;">
                    <asp:HyperLink ID="linkBack" runat="server" SkinID="skHypLink" Enabled="false" Text="&lt;&lt; Back to Specials" />
                </td>
                <td class="LocalMenuRow">
                    <asp:Menu ID="LocalMenu" runat="server" SkinID="skLocalMenu" Enabled="false">
                        <Items>
                            <asp:MenuItem Text="Detail" />
                            <asp:MenuItem Text="Application" />
                            <asp:MenuItem Text="Overview" />
                        </Items>
                    </asp:Menu>
                </td>
            </tr>
        </table>
        <br />
        <asp:FormView ID="fvSpecial" runat="server" DataKeyNames="SpecialID,HotelId" DataSourceID="dsSpecialByID"
            Width="100%">
            <EmptyDataTemplate>
                <table cellpadding="0" cellspacing="0" style="width: 100%;">
                    <tr>
                        <td class="GridLabelBG">
                            <asp:Label ID="lblContractTitle" runat="server" SkinID="skGridLabel" Text="Create New Special" />
                        </td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <ItemTemplate>
                <table cellpadding="0" cellspacing="0" style="width: 100%;">
                    <tr>
                        <td class="GridLabelBG" colspan="5">
                            <asp:Label ID="lblContractTitle" runat="server" SkinID="skGridLabel" Text='<%# "[" & Eval("SpecialID") & "] ["& Eval("RateCodeId") & "] "& Eval("Title") %>' />
                            <asp:HiddenField ID="hfFreeRate" runat="server" Value='<%# Eval("PrDiscountTypeId") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="GridRowClear" style="width: 32px;">
                            &nbsp;
                        </td>
                        <td class="GridRow1B" style="text-align: left; width: 80px; padding-right: 5px;"
                            nowrap="nowrap">
                            Duration:
                        </td>
                        <td class="GridRow1B" nowrap="nowrap" style="text-align: left; width: 300px; padding-right: 5px;">
                            <asp:Label ID="StartHeader" runat="server" Text='<%# Eval("Start", "{0:d}") & " - " & Eval("Finish", "{0:d}") %>' />
                        </td>
                        <td class="GridRow1B" nowrap="nowrap" style="text-align: left; width: 150px; padding-right: 5px;">
                            Status:
                            <asp:Label ID="Label1" runat="server" Style="font-style: italic" Text='<%# iif(Eval("StateId") >0, "Active", "Inactive") %>' />
                            <asp:Label ID="lblState" runat="server" Style="font-style: italic" Text='<%# Eval("StateId") %>'
                                Visible="False" />
                        </td>
                        <td style="text-align: left; padding-left: 5px;" nowrap="nowrap">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="GridRowClear" style="width: 32px;">
                            &nbsp;
                        </td>
                        <td class="GridRow1B" nowrap="nowrap" style="text-align: left; width: 80px; padding-right: 5px;">
                            Hotel
                        </td>
                        <td class="GridRow1B" colspan="2" nowrap="nowrap" style="text-align: left; padding-right: 5px;">
                            <asp:Label ID="HotelHeader" runat="server" Text='<%# Eval("Hotel") %>' />
                        </td>
                        <td nowrap="nowrap" style="text-align: left; padding-left: 5px;">
                            &nbsp;
                        </td>
                        <tr>
                            <td class="GridRowClear" style="width: 32px;">
                                &nbsp;
                            </td>
                            <td class="GridRow2B" nowrap="nowrap" style="text-align: left; width: 80px; padding-right: 5px;">
                                Book.Code
                            </td>
                            <td class="GridRow2B" nowrap="nowrap" style="text-align: left; padding-right: 5px;">
                                <asp:Label ID="BookingHeader" runat="server" Text='<%# Eval("BookingCode") %>' />
                            </td>
                            <td class="GridRow2B" nowrap="nowrap" style="text-align: left; padding-left: 5px;">
                                Offer:
                                <asp:Label ID="SpecialDiscType" runat="server" Font-Italic="true" Text='<%# Eval("PrType") %>' />
                            </td>
                            <td>
                                &nbsp;
                                <asp:Button ID="cmdClose" runat="server" CommandName="CloseExtend" Width="100px"
                                    SkinID="skBtnBase" Text='Close' />
                            </td>
                        </tr>
                </table>
            </ItemTemplate>
        </asp:FormView>
        <asp:ObjectDataSource ID="dsSpecialByID" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataFull" TypeName="dsSpecialTableAdapters.SpecialTableAdapter"
            DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_SpecialID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="HotelId" Type="Int32" />
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="BookingCode" Type="String" />
                <asp:Parameter Name="PerPax" Type="Boolean" />
                <asp:Parameter Name="RateOption" Type="Int16" />
                <asp:Parameter Name="Start" Type="DateTime" />
                <asp:Parameter Name="Finish" Type="DateTime" />
                <asp:Parameter Name="BkStart" Type="DateTime" />
                <asp:Parameter Name="BkFinish" Type="DateTime" />
                <asp:Parameter Name="Payment" Type="DateTime" />
                <asp:Parameter Name="RoomingList" Type="DateTime" />
                <asp:Parameter Name="StayCriteriaMin" Type="Int16" />
                <asp:Parameter Name="StayCriteriaMax" Type="Int16" />
                <asp:Parameter Name="PrDiscountTypeId" Type="Int32" />
                <asp:Parameter Name="PrPropagate" Type="Boolean" />
                <asp:Parameter Name="PrDiscountOn" Type="String" />
                <asp:Parameter Name="PrDiscount" Type="Decimal" />
                <asp:Parameter Name="ScDiscountTypeId" Type="Int32" />
                <asp:Parameter Name="ScDiscountOn" Type="String" />
                <asp:Parameter Name="ScDiscount" Type="Decimal" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="StateId" Type="Int32" />
                <asp:Parameter Name="CtrEBB" Type="Boolean" />
                <asp:Parameter Name="Original_SpecialID" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="SpecialID" QueryStringField="SpecialID" Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="HotelId" Type="Int32" />
                <asp:Parameter Name="Category" Type="String" />
                <asp:Parameter Name="BookingCode" Type="String" />
                <asp:Parameter Name="PerPax" Type="Boolean" />
                <asp:Parameter Name="RateOption" Type="Int16" />
                <asp:Parameter Name="Start" Type="DateTime" />
                <asp:Parameter Name="Finish" Type="DateTime" />
                <asp:Parameter Name="BkStart" Type="DateTime" />
                <asp:Parameter Name="BkFinish" Type="DateTime" />
                <asp:Parameter Name="Payment" Type="DateTime" />
                <asp:Parameter Name="RoomingList" Type="DateTime" />
                <asp:Parameter Name="StayCriteriaMin" Type="Int16" />
                <asp:Parameter Name="StayCriteriaMax" Type="Int16" />
                <asp:Parameter Name="PrDiscountTypeId" Type="Int32" />
                <asp:Parameter Name="PrPropagate" Type="Boolean" />
                <asp:Parameter Name="PrDiscountOn" Type="String" />
                <asp:Parameter Name="PrDiscount" Type="Decimal" />
                <asp:Parameter Name="ScDiscountTypeId" Type="Int32" />
                <asp:Parameter Name="ScDiscountOn" Type="String" />
                <asp:Parameter Name="ScDiscount" Type="Decimal" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="StateId" Type="Int32" />
                <asp:Parameter Name="CtrEBB" Type="Boolean" />
            </InsertParameters>
        </asp:ObjectDataSource>
    </div>
    <div style="margin-top: 5px; margin-left: 25px; margin-bottom: 5px">
        <br />
        <div class="Red">
            <table cellpadding="0" cellspacing="2">
                <tr>
                    <td class="GridLabelBG" colspan="3">
                        <asp:Label ID="lbDetails" runat="server" Text="Extend Special Booking" SkinID="skGridLabel"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="GridBorder" valign="top">
                        <asp:FormView ID="fvSpec" runat="server" DataKeyNames="SpecialID" DataSourceID="dsSpec">
                            <EditItemTemplate>
                                <table cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td class="GridRow2B" style="width: 100px; text-align: right;">
                                            [<asp:Label ID="IdLabel" runat="server" Text='<%# Eval("SpecialID") %>' />]&nbsp;
                                        </td>
                                        <td class="GridRow2B" style="width: 400px">
                                            <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' Font-Bold="true" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="SelectRow1B">
                                            Hotel
                                        </td>
                                        <td class="GridRow1B">
                                            <asp:Label ID="HotelIdLabel" runat="server" Text='<%# Eval("Hotel") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="SelectRow1B">
                                            Category
                                        </td>
                                        <td class="GridRow1B">
                                            <asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Category") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="SelectRow1B">
                                            Booking Code
                                        </td>
                                        <td class="GridRow1B">
                                            <asp:Label ID="BookingCodeLabel" runat="server" Text='<%# Eval("BookingCode") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="SelectRow1B">
                                            Rate Type
                                        </td>
                                        <td class="GridRow1B">
                                            <asp:Label ID="PerPaxIDLabel" runat="server" Text='<%# Bind("RateTypeId") %>' />&nbsp;
                                            <i>(<asp:Label ID="Label2" runat="server" Text='<%# Bind("RateCodeId") %>' />)</i>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="SelectRow1B">
                                            Rate Option
                                        </td>
                                        <td class="GridRow1B">
                                            <asp:Label ID="RateOptionLabel" runat="server" Text='<%# Eval("RateOptionDisp") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="SelectRow1B">
                                            Start
                                        </td>
                                        <td class="GridRow1B">
                                            <asp:Label ID="StartLabel" runat="server" Text='<%# Eval("Start", "{0:d}") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="SelectRow1B">
                                            End
                                        </td>
                                        <td class="GridRow1B">
                                            <asp:Label ID="FinishLabel" runat="server" Text='<%# Eval("Finish", "{0:d}") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="SelectRow1B">
                                            Book.Start
                                        </td>
                                        <td class="GridRow1B">
                                            <asp:Label ID="BkStartLabel" runat="server" Text='<%# Eval("BkStart", "{0:d}") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="SelectRow1B">
                                            Book.End
                                        </td>
                                        <td class="GridRow1B">
                                            <asp:TextBox ID="txtBkFinish" runat="server" Text='<%# Bind("BkFinish","{0:d}") %>'
                                                CssClass="TextBox" />
                                            <asp:CalendarExtender ID="extBkFinish" runat="server" TargetControlID="txtBkFinish"
                                                TodaysDateFormat="d" CssClass="cal_Theme1" />
                                            <asp:CompareValidator ID="datBkFinish" runat="server" ControlToValidate="txtBkFinish"
                                                Display="None" Operator="DataTypeCheck" Type="Date" SkinID="skDate" ErrorMessage="Date input required" />
                                            <asp:ValidatorCalloutExtender ID="valBkFinish" runat="server" TargetControlID="datBkFinish"
                                                SkinID="skExtender" />
                                            <asp:CompareValidator ID="cmpBkFinish" runat="server" ControlToValidate="txtBkFinish"
                                                Operator="GreaterThanEqual" Type="Date" SkinID="skDate" 
                                                ErrorMessage="Must be less or equal to End date." Display="None"
                                                ValueToCompare='<%#Iif(Eval("BkFinish") Is DbNull.Value, Date.Today.ToShortDateString, Eval("BkFinish","{0:d}"))%>'
                                                Enabled='<%# Iif(Eval("BkFinish") Is DbNull.Value, False, True) %>'  />
                                            <asp:ValidatorCalloutExtender ID="vcmpBkFinish" runat="server" TargetControlID="cmpBkFinish"
                                                SkinID="skExtender" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="SelectRowClear">
                                            Description
                                        </td>
                                        <td class="GridRowClear">
                                            <asp:TextBox ID="txtDescription" runat="server" CssClass="TextBox" Text='<%# Bind("Description") %>'
                                                TextMode="MultiLine"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="GridRow2T" colspan="2" style="text-align: right; padding-top: 5px;">
                                            <asp:Button ID="btUpdate" runat="server" Text="Update" SkinID="skBtnBase" CommandName="ExtUpdate" />&nbsp;
                                            <asp:Button ID="btCancel" runat="server" Text="Cancel" SkinID="skBtnBase" CommandName="Cancel"
                                                CausesValidation="false" />&nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="GridRow2B" style="width: 100px; text-align: right;">
                                            [<asp:Label ID="IdLabel" runat="server" Text='<%# Eval("SpecialID") %>' />]&nbsp;
                                        </td>
                                        <td class="GridRow2B" style="width: 400px">
                                            <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' Font-Bold="true" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="SelectRow1B">
                                            Hotel
                                        </td>
                                        <td class="GridRow1B">
                                            <asp:Label ID="HotelIdLabel" runat="server" Text='<%# Eval("Hotel") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="SelectRow1B">
                                            Category
                                        </td>
                                        <td class="GridRow1B">
                                            <asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Category") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="SelectRow1B">
                                            Booking Code
                                        </td>
                                        <td class="GridRow1B">
                                            <asp:Label ID="BookingCodeLabel" runat="server" Text='<%# Eval("BookingCode") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="SelectRow1B">
                                            Rate Type
                                        </td>
                                        <td class="GridRow1B">
                                            <asp:Label ID="PerPaxIDLabel" runat="server" Text='<%# Bind("RateTypeId") %>' />&nbsp;
                                            <i>(<asp:Label ID="Label2" runat="server" Text='<%# Bind("RateCodeId") %>' />)</i>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="SelectRow1B">
                                            Rate Option
                                        </td>
                                        <td class="GridRow1B">
                                            <asp:Label ID="RateOptionLabel" runat="server" Text='<%# Eval("RateOptionDisp") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="SelectRow1B">
                                            Start
                                        </td>
                                        <td class="GridRow1B">
                                            <asp:Label ID="StartLabel" runat="server" Text='<%# Eval("Start", "{0:d}") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="SelectRow1B">
                                            End
                                        </td>
                                        <td class="GridRow1B">
                                            <asp:Label ID="FinishLabel" runat="server" Text='<%# Eval("Finish", "{0:d}") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="SelectRow1B">
                                            Book.Start
                                        </td>
                                        <td class="GridRow1B">
                                            <asp:Label ID="BkStartLabel" runat="server" Text='<%# Eval("BkStart", "{0:d}") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="SelectRow1B">
                                            Book.End
                                        </td>
                                        <td class="GridRow1B">
                                            <asp:Label ID="BkFinishLabel" runat="server" Text='<%# Eval("BkFinish", "{0:d}") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="SelectRowClear">
                                            Description
                                        </td>
                                        <td class="GridRowClear">
                                            <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Description") %>' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="GridRow2T" colspan="2" style="text-align: right; padding-top: 5px;">
                                            <asp:Button ID="btEdit" runat="server" Text="Edit" SkinID="skBtnBase" CommandName="Edit" />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:FormView>
                        <asp:ObjectDataSource ID="dsSpec" runat="server" DeleteMethod="Delete" InsertMethod="InsertQuery"
                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataFull" TypeName="dsSpecialTableAdapters.SpecialTableAdapter"
                            UpdateMethod="Update">
                            <DeleteParameters>
                                <asp:Parameter Name="Original_SpecialID" Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="HotelId" Type="Int32" />
                                <asp:Parameter Name="Category" Type="String" />
                                <asp:Parameter Name="BookingCode" Type="String" />
                                <asp:Parameter Name="RateOption" Type="Int16" />
                                <asp:Parameter Name="Start" Type="DateTime" />
                                <asp:Parameter Name="Finish" Type="DateTime" />
                                <asp:Parameter Name="BkStart" Type="DateTime" />
                                <asp:Parameter Name="BkFinish" Type="DateTime" />
                                <asp:Parameter Name="Payment" Type="DateTime" />
                                <asp:Parameter Name="RoomingList" Type="DateTime" />
                                <asp:Parameter Name="StayCriteriaMin" Type="Int16" />
                                <asp:Parameter Name="StayCriteriaMax" Type="Int16" />
                                <asp:Parameter Name="PrDiscountTypeId" Type="Int32" />
                                <asp:Parameter Name="PrPropagate" Type="Boolean" />
                                <asp:Parameter Name="PrDiscountOn" Type="String" />
                                <asp:Parameter Name="PrDiscount" Type="Decimal" />
                                <asp:Parameter Name="ScDiscountTypeId" Type="Int32" />
                                <asp:Parameter Name="ScDiscountOn" Type="String" />
                                <asp:Parameter Name="ScDiscount" Type="Decimal" />
                                <asp:Parameter Name="Description" Type="String" />
                                <asp:Parameter Name="StateId" Type="Int32" />
                                <asp:Parameter Name="CtrEBB" Type="Boolean" DefaultValue="False" />
                                <asp:Parameter Name="RateTypeId" Type="String" />
                                <asp:Parameter Name="RateCodeId" Type="String" />
                                <asp:Parameter Name="Title" Type="String" />
                                <asp:Parameter Name="RateRecieved" Type="DateTime" />
                                <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value"
                                    Type="String" />
                                <asp:Parameter Name="Original_SpecialID" Type="Int32" />
                            </UpdateParameters>
                            <SelectParameters>
                                <asp:QueryStringParameter DefaultValue="1700" Name="SpecialID" QueryStringField="SpecialID"
                                    Type="Int32" />
                            </SelectParameters>
                            <InsertParameters>
                                <asp:Parameter Name="HotelId" Type="Int32" />
                                <asp:Parameter Name="Category" Type="String" />
                                <asp:Parameter Name="BookingCode" Type="String" />
                                <asp:Parameter Name="RateOption" Type="Int16" />
                                <asp:Parameter Name="Start" Type="DateTime" />
                                <asp:Parameter Name="Finish" Type="DateTime" />
                                <asp:Parameter Name="BkStart" Type="DateTime" />
                                <asp:Parameter Name="BkFinish" Type="DateTime" />
                                <asp:Parameter Name="Payment" Type="DateTime" />
                                <asp:Parameter Name="RoomingList" Type="DateTime" />
                                <asp:Parameter Name="StayCriteriaMin" Type="Int16" />
                                <asp:Parameter Name="StayCriteriaMax" Type="Int16" />
                                <asp:Parameter Name="PrDiscountTypeId" Type="Int32" />
                                <asp:Parameter Name="PrPropagate" Type="Boolean" />
                                <asp:Parameter Name="PrDiscountOn" Type="String" />
                                <asp:Parameter Name="PrDiscount" Type="Decimal" />
                                <asp:Parameter Name="ScDiscountTypeId" Type="Int32" />
                                <asp:Parameter Name="ScDiscountOn" Type="String" />
                                <asp:Parameter Name="ScDiscount" Type="Decimal" />
                                <asp:Parameter Name="Description" Type="String" />
                                <asp:Parameter Name="StateId" Type="Int32" />
                                <asp:Parameter Name="CtrEBB" Type="Boolean" DefaultValue="False" />
                                <asp:Parameter Name="RateTypeId" Type="String" />
                                <asp:Parameter Name="Title" Type="String" />
                                <asp:Parameter Name="RateRecieved" Type="DateTime" />
                                <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value"
                                    Type="String" />
                                <asp:Parameter Direction="InputOutput" Name="NewID" Type="Int32" />
                            </InsertParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
            </table>
            <table cellpadding="0" cellspacing="2">
                <tr>
                    <td class="GridLabelBG" colspan="3">
                        <asp:Label ID="Label3" runat="server" Text="Edit Special Rate Periods" SkinID="skGridLabel"></asp:Label>
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
                                <asp:BoundField DataField="ContractID" HeaderText="ContractId" SortExpression="ContractId"
                                    Visible="False" />
                                <asp:BoundField DataField="Start" DataFormatString="{0:d}" HeaderText="Start" SortExpression="Start"
                                    ReadOnly="True">
                                    <ItemStyle Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Finish" DataFormatString="{0:d}" HeaderText="End" SortExpression="Finish"
                                    ReadOnly="True">
                                    <ItemStyle Width="100px" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Note" SortExpression="Note">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtNote" runat="server" Text='<%# Bind("Note") %>' Height="100px"
                                            CssClass="TextBox" TextMode="MultiLine" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblNote" runat="server" Text='<%# Bind("Note") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle Width="600px" Wrap="true" />
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:ImageButton ID="ibUpdate" runat="server" CausesValidation="True" CommandName="ExpUpdate"
                                            CommandArgument = '<%# Bind("CtrPeriodID") %>' 
                                            ImageUrl="~/Images/accept_inline.gif" Text="Update" />
                                        &nbsp;<asp:ImageButton ID="ibCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                            ImageUrl="~/Images/decline_inline.gif" Text="Cancel" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ibEdit" runat="server" CausesValidation="False" CommandName="Edit"
                                            ImageUrl="~/Images/edit_inline.gif" Text="Edit" />
                                    </ItemTemplate>
                                    <ControlStyle CssClass="ImgButton" />
                                    <ItemStyle Width="70px" />
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                            <div style="width: 500px;">Not a free-rate special.</div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                        <asp:ObjectDataSource ID="dsPeriods" runat="server" SelectMethod="GetData" TypeName="dsSpecialTableAdapters.FreeSpecialPeriodTableAdapter"
                            OldValuesParameterFormatString="original_{0}">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="SpecialID" QueryStringField="SpecialID" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
            </table>
            <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
                Enabled="true" PopupDragHandleControlID="popLabel" CancelControlID="btnNo" DropShadow="True"
                BackgroundCssClass="modalBackground" TargetControlID="hfUserName" X="200" Y="200">
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
                                <asp:Button ID="btnYes" runat="server" Text="Yes" SkinID="skBtnBase" />&nbsp;
                                <asp:Button ID="btnNo" runat="server" Text="No" SkinID="skBtnBase" />&nbsp;
                            </p>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
        <br />
        <div class="Blue">
            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td class="ComandRow2T" style="text-align: center; height: 30px;">
                        &nbsp;
                        <asp:Button ID="cmdWizClose" runat="server" CommandName="CloseExtend" SkinID="skBtnBase"
                            Text="Close" Width="100px" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
