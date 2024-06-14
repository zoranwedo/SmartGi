<%@ Page Title="" Language="VB" MasterPageFile="~/Contracts/Wizard/masterWizard.master" AutoEventWireup="false" EnableEventValidation="false" CodeFile="EBB.aspx.vb" Inherits="Contracts_Wizard_EBB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Early Booking Bonus
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="WizardContent" Runat="Server">

    <div class="Blue">
    <table cellpadding="0" cellspacing="0">
        <tr>
            <td class="GridBorder">
                <asp:GridView ID="gvSpecials" runat="server" SkinID="skGridView" SelectedIndex="0" 
                     DataSourceID="dsContSpec" DataKeyNames="SpecialId" 
                    AllowPaging="True" >
                    <Columns>
                        <asp:CommandField ButtonType="Image" InsertVisible="False" SelectImageUrl="~/Images/select_.gif"
                            ShowCancelButton="False" ShowSelectButton="True">
                            <ItemStyle Width="25px" />
                        </asp:CommandField>
                        <asp:BoundField DataField="SpecialId" HeaderText="SpcId" ReadOnly="True" 
                            SortExpression="SpecialId">
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Title">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="BookingCode" HeaderText="BookingCode" 
                            SortExpression="BookingCode">
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Start">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("Start", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="End">
                            <ItemTemplate>
                                <asp:Label ID="Label51" runat="server" Text='<%# Eval("Finish", "{0:d}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Hotel" HeaderText="Hotel" SortExpression="Hotel" />
                        <asp:BoundField DataField="TourOpId" HeaderText="TourOpId" 
                            SortExpression="TourOpId">
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="TO">
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("TourOp") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="SpoCodeId" HeaderText="SpoCodeId" 
                            SortExpression="SpoCodeId">
                        </asp:BoundField>
                        <asp:BoundField DataField="NetCodeId" HeaderText="NetCodeId" 
                            SortExpression="NetCodeId">
                        </asp:BoundField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                    CommandName="Delete" 
                                    onclientclick="return confirm('Are you sure you want to deattache special from contract')" 
                                    Text="Deattach"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <asp:Panel ID="Panel1" runat="server" Width="915px" HorizontalAlign="Right">
                        <asp:Button ID="btnNew" runat="server" CommandName="New" 
                            SkinID="skBtnBase" Text="New" onclick="btnNew_Click" />
                        </asp:Panel>
                    </EmptyDataTemplate>
                   
                    <SelectedRowStyle CssClass="SelectRow1TB" />
                   
                    <HeaderStyle HorizontalAlign="Left" />
                   
                </asp:GridView>
                <asp:ObjectDataSource ID="dsContSpec" runat="server" DeleteMethod="DeleteQuery" 
                    SelectMethod="GetDataEBB" 
                    TypeName="dsSpecialTableAdapters.ContractSpecialByCIDTableAdapter" 
                    OldValuesParameterFormatString="original_{0}">
                    <DeleteParameters>
                        <asp:Parameter Name="ContractID" Type="Int32" />
                        <asp:Parameter Name="SpecialID" Type="Int32" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="ContractID" QueryStringField="ContractID" 
                            Type="Int32" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </td>
        </tr>
    </table>
    </div>
    <br />
    
    <div class="Red">
    <table cellpadding="0" cellspacing="2">
            <tr>
                <td class="GridBorder">
        <asp:FormView ID="fvSpec" runat="server" DataKeyNames="SpecialID" DataSourceID="dsSpec" >
            <EditItemTemplate>
                <table cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="GridRow2B" style="width: 100px">
                            Special
                            <asp:Label ID="lblSpecialID" runat="server" 
                                Text='<%# " [" & Eval("HotelId") & "]" %>' Visible="False" />
                        </td>
                        <td class="GridRow2B" colspan="3" style="width: 300px">
                            <asp:TextBox ID="txtSpecial" runat="server" CssClass="TextBox" 
                                Text='<%# Bind("Title") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Hotel
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:HiddenField ID="hfHotelID" runat="server" Value='<%# Bind("HotelId") %>' />
                            <asp:Label ID="lblHotel" runat="server" Text='<%# Eval("Hotel") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Category
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:DropDownList ID="cdCategory" runat="server" CssClass="TextBox" DataSourceID="dsCategory"
                                DataTextField="SpecialCategory" DataValueField="SpecialCategory" SelectedValue='<%# Bind("Category") %>'>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Booking Code
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtBookingCode" runat="server" CssClass="TextBox" Text='<%# Bind("BookingCode") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Rate options
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:DropDownList ID="cbRateOption" runat="server" SelectedValue='<%# Bind("RateOption") %>'
                                CssClass="TextBox">
                                <asp:ListItem Value="0" Text="PerArrival" />
                                <asp:ListItem Value="1" Text="PerStay" />
                                <asp:ListItem Text="Inclusiv" Value="2" />
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Rate Type.</td>
                        <td class="GridRow1B" colspan="3">
                            <asp:DropDownList ID="ddlRateType" runat="server" CssClass="TextBox" 
                                DataSourceID="dsRateType" DataTextField="RateTypeID" 
                                DataValueField="RateTypeID" SelectedValue='<%# Bind("RateTypeId") %>'>
                            </asp:DropDownList>
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="TextBox" 
                                Text='<%# Bind("RateCodeId") %>' ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Start
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtStart" runat="server" Text='<%# Bind("Start", "{0:d}") %>' CssClass="TextBox" />
                            <asp:ImageButton ID="imgStart" runat="server" SkinID="skCalendarButton" 
                                ImageUrl="~/Images/Calendar.png" />
                            <asp:CalendarExtender ID="extStart" runat="server" TargetControlID="txtStart" PopupButtonID="imgStart"
                                TodaysDateFormat="d" DaysModeTitleFormat="d" ClearTime="True" 
                                CssClass="cal_Theme1" />
                            <asp:CompareValidator ID="datStart" runat="server" ControlToValidate="txtStart" Operator="DataTypeCheck"
                                Type="Date" SkinID="skDate" CultureInvariantValues="True" />
                            <asp:ValidatorCalloutExtender ID="valStart" runat="server" TargetControlID="datStart"
                                SkinID="skExtender" />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            End
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtFinish" runat="server" Text='<%# Bind("Finish","{0:d}") %>' CssClass="TextBox" />
                            <asp:ImageButton ID="imgFinish" runat="server" SkinID="skCalendarButton" 
                                ImageUrl="~/Images/Calendar.png" />
                            <asp:CalendarExtender ID="extFinish" runat="server" TargetControlID="txtFinish" PopupButtonID="imgFinish"
                                TodaysDateFormat="d" CssClass="cal_Theme1" />
                            <asp:CompareValidator ID="datFinish" runat="server" ControlToValidate="txtFinish"
                                Operator="DataTypeCheck" Type="Date" SkinID="skDate" />
                            <asp:ValidatorCalloutExtender ID="valFinish" runat="server" TargetControlID="datFinish"
                                SkinID="skExtender" />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Booking Start
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtBkStart" runat="server" Text='<%# Bind("BkStart","{0:d}") %>'
                                CssClass="TextBox" />
                            <asp:ImageButton ID="imgBkStart" runat="server" SkinID="skCalendarButton" 
                                ImageUrl="~/Images/Calendar.png" />
                            <asp:CalendarExtender ID="extBkStart" runat="server" TargetControlID="txtBkStart"
                                PopupButtonID="imgBkStart" TodaysDateFormat="d" CssClass="cal_Theme1" />
                            <asp:CompareValidator ID="datBkStart" runat="server" ControlToValidate="txtBkStart"
                                Operator="DataTypeCheck" Type="Date" SkinID="skDate" />
                            <asp:ValidatorCalloutExtender ID="valBkStart" runat="server" TargetControlID="datBkStart"
                                SkinID="skExtender" />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Booking End
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtBkFinish" runat="server" Text='<%# Bind("BkFinish","{0:d}") %>'
                                CssClass="TextBox" />
                            <asp:ImageButton ID="imgBkFinish" runat="server" SkinID="skCalendarButton" 
                                ImageUrl="~/Images/Calendar.png" />
                            <asp:CalendarExtender ID="extBkFinish" runat="server" TargetControlID="txtBkFinish"
                                PopupButtonID="imgBkFinish" TodaysDateFormat="d" CssClass="cal_Theme1" />
                            <asp:CompareValidator ID="datBkFinish" runat="server" ControlToValidate="txtBkFinish"
                                Operator="DataTypeCheck" Type="Date" SkinID="skDate" />
                            <asp:ValidatorCalloutExtender ID="valBkFinish" runat="server" TargetControlID="datBkFinish"
                                SkinID="skExtender" />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Payment
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtPayment" runat="server" Text='<%# Bind("Payment","{0:d}") %>'
                                CssClass="TextBox" />
                            <asp:ImageButton ID="imgPayment" runat="server" SkinID="skCalendarButton" 
                                ImageUrl="~/Images/Calendar.png" />
                            <asp:CalendarExtender ID="extPayment" runat="server" TargetControlID="txtPayment"
                                PopupButtonID="imgPayment" TodaysDateFormat="d" />
                            <asp:CompareValidator ID="datPayment" runat="server" ControlToValidate="txtPayment"
                                Operator="DataTypeCheck" Type="Date" SkinID="skDate" />
                            <asp:ValidatorCalloutExtender ID="valPayment" runat="server" TargetControlID="datPayment"
                                SkinID="skExtender" />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Rooming list
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtRooming" runat="server" Text='<%# Bind("RoomingList","{0:d}") %>'
                                CssClass="TextBox" />
                            <asp:ImageButton ID="imgRooming" runat="server" SkinID="skCalendarButton" 
                                ImageUrl="~/Images/Calendar.png" />
                            <asp:CalendarExtender ID="extRooming" runat="server" TargetControlID="txtRooming"
                                PopupButtonID="imgRooming" TodaysDateFormat="d" />
                            <asp:CompareValidator ID="datRooming" runat="server" ControlToValidate="txtRooming"
                                Operator="DataTypeCheck" Type="Date" SkinID="skDate" />
                            <asp:ValidatorCalloutExtender ID="valRooming" runat="server" TargetControlID="datRooming"
                                SkinID="skExtender" />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Min. Stay
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtStayMin" runat="server" CssClass="TextBox" Text='<%# Bind("StayCriteriaMin") %>'></asp:TextBox>
                            <asp:CompareValidator ID="intStayMin" runat="server" ControlToValidate="txtStayMin"
                                Operator="DataTypeCheck" Type="Integer" SkinID="skInteger" />
                            <asp:ValidatorCalloutExtender ID="extStayMin" runat="server" TargetControlID="intStayMin"
                                SkinID="skExtender" />
                            <asp:TextBoxWatermarkExtender ID="wmStayMin" runat="server" TargetControlID="txtStayMin"
                                WatermarkText="(Minimum)" />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Max. Stay
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtStayMax" runat="server" CssClass="TextBox" Text='<%# Bind("StayCriteriaMax") %>'></asp:TextBox>
                            <asp:CompareValidator ID="intStayMax" runat="server" ControlToValidate="txtStayMax"
                                Operator="DataTypeCheck" Type="Integer" SkinID="skInteger" />
                            <asp:ValidatorCalloutExtender ID="extStayMax" runat="server" TargetControlID="intStayMax"
                                SkinID="skExtender" />
                            <asp:TextBoxWatermarkExtender ID="wmStayMax" runat="server" TargetControlID="txtStayMax"
                                WatermarkText="(Maximum)" />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Description</td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtDescription" runat="server" CssClass="TextBox" 
                                Text='<%# Bind("Description") %>' TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B" colspan="4">
                            Discounts
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Primary
                        </td>
                        <td class="GridRow1B">
                                <asp:DropDownList ID="cbPrType" runat="server" CssClass="TextBox" />
                                <asp:CascadingDropDown ID="exPrType" runat="server" 
                                    TargetControlID="cbPrType" 
                                    Category="PrTypeID" 
                                    ContextKey="Pr"
                                    SelectedValue='<%# Bind("PrDiscountTypeId") %>'
                                    ServicePath="~/SpecDisc.asmx" 
                                    ServiceMethod="GetTypeID"
                                    UseContextKey="True">
                                </asp:CascadingDropDown>
                        </td>
                        <td class="GridRow1B">
                            On
                        </td>
                        <td class="GridRow1B">
                                <asp:DropDownList ID="cbPrOn" runat="server" CssClass="TextBox" />
                                <asp:CascadingDropDown ID="exPrOn" runat="server" 
                                    TargetControlID="cbPrOn" 
                                    ParentControlID="cbPrType" 
                                    Category="PrTypeOn"
                                    ContextKey="Pr"
                                    SelectedValue='<%# Bind("PrDiscountOn") %>'
                                    ServicePath="~/SpecDisc.asmx" 
                                    ServiceMethod="GetOn"
                                    UseContextKey="True">
                                </asp:CascadingDropDown>
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B" style="text-indent: 20px">
                            Discount
                        </td>
                        <td class="GridRow1B">
                                <asp:DropDownList ID="cbPrDisc" runat="server" CssClass="TextBox" />
                                <asp:CascadingDropDown ID="exPrDisc" runat="server" 
                                    TargetControlID="cbPrDisc" 
                                    ParentControlID="cbPrType" 
                                    Category="PrDisc"
                                    ContextKey="Pr"
                                    SelectedValue='<%# Bind("PrDiscount") %>'
                                    ServicePath="~/SpecDisc.asmx" 
                                    ServiceMethod="GetDiscount"
                                    UseContextKey="True">
                                </asp:CascadingDropDown>
                        </td>
                        <td class="GridRow1B">
                            &nbsp;
                        </td>
                        <td class="GridRow1B">
                            <asp:CheckBox ID="cbPropagate" runat="server" Text="Propagate" Checked='<%# Bind("PrPropagate") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Secondary
                        </td>
                        <td class="GridRow1B">
                                <asp:DropDownList ID="cbScType" runat="server" CssClass="TextBox" />
                                <asp:CascadingDropDown ID="exScType" runat="server" 
                                    TargetControlID="cbScType" 
                                    Category="ScTypeID" 
                                    ContextKey="Sc"
                                    SelectedValue='<%# Bind("ScDiscountTypeId") %>'
                                    ServicePath="~/SpecDisc.asmx" 
                                    ServiceMethod="GetTypeID"
                                    UseContextKey="True">
                                </asp:CascadingDropDown>
                        </td>
                        <td class="GridRow1B">
                            On
                        </td>
                        <td class="GridRow1B">
                                <asp:DropDownList ID="cbScOn" runat="server" CssClass="TextBox" />
                                <asp:CascadingDropDown ID="exScOn" runat="server" 
                                    TargetControlID="cbScOn" 
                                    ParentControlID="cbScType" 
                                    Category="ScTypeOn"
                                    ContextKey="Sc"
                                    SelectedValue='<%# Bind("ScDiscountOn") %>'
                                    ServicePath="~/SpecDisc.asmx" 
                                    ServiceMethod="GetOn"
                                    UseContextKey="True">
                                </asp:CascadingDropDown>
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRowClear" style="text-indent: 20px">
                            Discount
                        </td>
                        <td class="GridRowClear">
                                <asp:DropDownList ID="cbScDisc" runat="server" CssClass="TextBox" />
                                <asp:CascadingDropDown ID="exScDisc" runat="server" 
                                    TargetControlID="cbScDisc" 
                                    ParentControlID="cbScType" 
                                    Category="ScDisc"
                                    ContextKey="Sc"
                                    SelectedValue='<%# Bind("ScDiscount") %>'
                                    ServicePath="~/SpecDisc.asmx" 
                                    ServiceMethod="GetDiscount"
                                    UseContextKey="True">
                                </asp:CascadingDropDown>
                        </td>
                        <td class="GridRowClear">
                            &nbsp;
                        </td>
                        <td class="GridRowClear">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="GridRow2T" colspan="4" style="text-align: right; padding-top: 5px;">
                            <asp:Button ID="btUpdate" runat="server" Text="Update" SkinID="skBtnBase" CommandName="Update" />&nbsp;
                            <asp:Button ID="btCancel" runat="server" Text="Cancel" SkinID="skBtnBase" CommandName="Cancel" />&nbsp;
                        </td>
                    </tr>
                </table>
            </EditItemTemplate>
            <InsertItemTemplate>
                <table cellspacing="0" cellpadding="0">
                    <tr>
                        <td class="GridRow2B" style="width: 100px">
                            Special
                            <asp:Label ID="lblSpecialID" runat="server" 
                                Text='<%# " [" & Eval("HotelId") & "]" %>' Visible="False" />
                        </td>
                        <td class="GridRow2B" colspan="3" style="width: 300px">
                            <asp:TextBox ID="txtSpecial" runat="server" CssClass="TextBox" 
                                Text='<%# Bind("Title") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="txtSpecial" Display="None" ErrorMessage="Required Field">Required Field</asp:RequiredFieldValidator>
                            <asp:ValidatorCalloutExtender ID="RequiredFieldValidator4_ValidatorCalloutExtender" 
                                runat="server" Enabled="True" TargetControlID="RequiredFieldValidator4">
                            </asp:ValidatorCalloutExtender>
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Hotel
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:DropDownList ID="cbHotelID" runat="server" CssClass="TextBox" 
                                DataSourceID="dsHotel" DataTextField="Hotel" DataValueField="HotelID" 
                                SelectedValue='<%# Bind("HotelId") %>' Enabled="False">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Category
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:DropDownList ID="cdCategory" runat="server" CssClass="TextBox" DataSourceID="dsCategory"
                                DataTextField="SpecialCategory" DataValueField="SpecialCategory" SelectedValue='<%# Bind("Category") %>'>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Booking Code
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtBookingCode" runat="server" CssClass="TextBox" Text='<%# Bind("BookingCode") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtBookingCode" Display="None" ErrorMessage="Required Field">*</asp:RequiredFieldValidator>
                            <asp:ValidatorCalloutExtender ID="RequiredFieldValidator1_ValidatorCalloutExtender" 
                                runat="server" Enabled="True" TargetControlID="RequiredFieldValidator1">
                            </asp:ValidatorCalloutExtender>
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Rate options
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:DropDownList ID="cbRateOption" runat="server" SelectedValue='<%# Bind("RateOption") %>'
                                CssClass="TextBox">
                                <asp:ListItem Value="0" Text="PerArrival" />
                                <asp:ListItem Value="1" Text="PerStay" />
                                <asp:ListItem Text="Inclusiv" Value="2" />
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Rate Type</td>
                        <td class="GridRow1B" colspan="3">
                            <asp:DropDownList ID="ddlRateType" runat="server" CssClass="TextBox" 
                                DataSourceID="dsRateType" DataTextField="RateTypeID" 
                                DataValueField="RateTypeID" SelectedValue='<%# Bind("RateTypeId") %>'>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Start
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtStart" runat="server" Text='<%# Bind("Start", "{0:d}") %>' CssClass="TextBox" />
                            <asp:ImageButton ID="imgStart" runat="server" SkinID="skCalendarButton" 
                                ImageUrl="~/Images/Calendar.png" />
                            <asp:CalendarExtender ID="extStart" runat="server" TargetControlID="txtStart" PopupButtonID="imgStart"
                                TodaysDateFormat="d" DaysModeTitleFormat="d" ClearTime="True" 
                                CssClass="cal_Theme1" />
                            <asp:CompareValidator ID="datStart" runat="server" ControlToValidate="txtStart" Operator="DataTypeCheck"
                                Type="Date" SkinID="skDate" CultureInvariantValues="True" />
                            <asp:ValidatorCalloutExtender ID="valStart" runat="server" TargetControlID="datStart"
                                SkinID="skExtender" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtStart" Display="None" ErrorMessage="Required Field">*</asp:RequiredFieldValidator>
                            <asp:ValidatorCalloutExtender ID="RequiredFieldValidator2_ValidatorCalloutExtender" 
                                runat="server" Enabled="True" TargetControlID="RequiredFieldValidator2">
                            </asp:ValidatorCalloutExtender>
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            End
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtFinish" runat="server" Text='<%# Bind("Finish","{0:d}") %>' CssClass="TextBox" />
                            <asp:ImageButton ID="imgFinish" runat="server" SkinID="skCalendarButton" 
                                ImageUrl="~/Images/Calendar.png" />
                            <asp:CalendarExtender ID="extFinish" runat="server" TargetControlID="txtFinish" PopupButtonID="imgFinish"
                                TodaysDateFormat="d" CssClass="cal_Theme1" />
                            <asp:CompareValidator ID="datFinish" runat="server" ControlToValidate="txtFinish"
                                Operator="DataTypeCheck" Type="Date" SkinID="skDate" />
                            <asp:ValidatorCalloutExtender ID="valFinish" runat="server" TargetControlID="datFinish"
                                SkinID="skExtender" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtFinish" Display="None" ErrorMessage="Required Field">*</asp:RequiredFieldValidator>
                            <asp:ValidatorCalloutExtender ID="RequiredFieldValidator3_ValidatorCalloutExtender" 
                                runat="server" Enabled="True" TargetControlID="RequiredFieldValidator3">
                            </asp:ValidatorCalloutExtender>
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Booking Start
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtBkStart" runat="server" Text='<%# Bind("BkStart","{0:d}") %>'
                                CssClass="TextBox" />
                            <asp:ImageButton ID="imgBkStart" runat="server" SkinID="skCalendarButton" 
                                ImageUrl="~/Images/Calendar.png" />
                            <asp:CalendarExtender ID="extBkStart" runat="server" TargetControlID="txtBkStart"
                                PopupButtonID="imgBkStart" TodaysDateFormat="d" CssClass="cal_Theme1" />
                            <asp:CompareValidator ID="datBkStart" runat="server" ControlToValidate="txtBkStart"
                                Operator="DataTypeCheck" Type="Date" SkinID="skDate" />
                            <asp:ValidatorCalloutExtender ID="valBkStart" runat="server" TargetControlID="datBkStart"
                                SkinID="skExtender" />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Booking End
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtBkFinish" runat="server" Text='<%# Bind("BkFinish","{0:d}") %>'
                                CssClass="TextBox" />
                            <asp:ImageButton ID="imgBkFinish" runat="server" SkinID="skCalendarButton" 
                                ImageUrl="~/Images/Calendar.png" />
                            <asp:CalendarExtender ID="extBkFinish" runat="server" TargetControlID="txtBkFinish"
                                PopupButtonID="imgBkFinish" TodaysDateFormat="d" CssClass="cal_Theme1" />
                            <asp:CompareValidator ID="datBkFinish" runat="server" ControlToValidate="txtBkFinish"
                                Operator="DataTypeCheck" Type="Date" SkinID="skDate" />
                            <asp:ValidatorCalloutExtender ID="valBkFinish" runat="server" TargetControlID="datBkFinish"
                                SkinID="skExtender" />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Payment
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtPayment" runat="server" Text='<%# Bind("Payment","{0:d}") %>'
                                CssClass="TextBox" />
                            <asp:ImageButton ID="imgPayment" runat="server" SkinID="skCalendarButton" 
                                ImageUrl="~/Images/Calendar.png" />
                            <asp:CalendarExtender ID="extPayment" runat="server" TargetControlID="txtPayment"
                                PopupButtonID="imgPayment" TodaysDateFormat="d" />
                            <asp:CompareValidator ID="datPayment" runat="server" ControlToValidate="txtPayment"
                                Operator="DataTypeCheck" Type="Date" SkinID="skDate" />
                            <asp:ValidatorCalloutExtender ID="valPayment" runat="server" TargetControlID="datPayment"
                                SkinID="skExtender" />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Rooming list
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtRooming" runat="server" Text='<%# Bind("RoomingList","{0:d}") %>'
                                CssClass="TextBox" />
                            <asp:ImageButton ID="imgRooming" runat="server" SkinID="skCalendarButton" 
                                ImageUrl="~/Images/Calendar.png" />
                            <asp:CalendarExtender ID="extRooming" runat="server" TargetControlID="txtRooming"
                                PopupButtonID="imgRooming" TodaysDateFormat="d" />
                            <asp:CompareValidator ID="datRooming" runat="server" ControlToValidate="txtRooming"
                                Operator="DataTypeCheck" Type="Date" SkinID="skDate" />
                            <asp:ValidatorCalloutExtender ID="valRooming" runat="server" TargetControlID="datRooming"
                                SkinID="skExtender" />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Min. Stay
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtStayMin" runat="server" CssClass="TextBox" Text='<%# Bind("StayCriteriaMin") %>'></asp:TextBox>
                            <asp:CompareValidator ID="intStayMin" runat="server" ControlToValidate="txtStayMin"
                                Operator="DataTypeCheck" Type="Integer" SkinID="skInteger" />
                            <asp:ValidatorCalloutExtender ID="extStayMin" runat="server" TargetControlID="intStayMin"
                                SkinID="skExtender" />
                            <asp:TextBoxWatermarkExtender ID="wmStayMin" runat="server" TargetControlID="txtStayMin"
                                WatermarkText="(Minimum)" />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Max. Stay
                        </td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtStayMax" runat="server" CssClass="TextBox" Text='<%# Bind("StayCriteriaMax") %>'></asp:TextBox>
                            <asp:CompareValidator ID="intStayMax" runat="server" ControlToValidate="txtStayMax"
                                Operator="DataTypeCheck" Type="Integer" SkinID="skInteger" />
                            <asp:ValidatorCalloutExtender ID="extStayMax" runat="server" TargetControlID="intStayMax"
                                SkinID="skExtender" />
                            <asp:TextBoxWatermarkExtender ID="wmStayMax" runat="server" TargetControlID="txtStayMax"
                                WatermarkText="(Maximum)" />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Description</td>
                        <td class="GridRow1B" colspan="3">
                            <asp:TextBox ID="txtDescription" runat="server" CssClass="TextBox" 
                                Text='<%# Bind("Description") %>' TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B" colspan="4">
                            Discounts
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Primary
                        </td>
                        <td class="GridRow1B">
                                <asp:DropDownList ID="cbPrType" runat="server" CssClass="TextBox" />
                                <asp:CascadingDropDown ID="exPrType" runat="server" 
                                    TargetControlID="cbPrType" 
                                    Category="PrTypeID" 
                                    ContextKey="Pr"
                                    SelectedValue='<%# Bind("PrDiscountTypeId") %>'
                                    ServicePath="~/SpecDisc.asmx" 
                                    ServiceMethod="GetTypeID"
                                    UseContextKey="True">
                                </asp:CascadingDropDown>
                        </td>
                        <td class="GridRow1B">
                            On
                        </td>
                        <td class="GridRow1B">
                                <asp:DropDownList ID="cbPrOn" runat="server" CssClass="TextBox" />
                                <asp:CascadingDropDown ID="exPrOn" runat="server" 
                                    TargetControlID="cbPrOn" 
                                    ParentControlID="cbPrType" 
                                    Category="PrTypeOn"
                                    ContextKey="Pr"
                                    SelectedValue='<%# Bind("PrDiscountOn") %>'
                                    ServicePath="~/SpecDisc.asmx" 
                                    ServiceMethod="GetOn"
                                    UseContextKey="True">
                                </asp:CascadingDropDown>
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B" style="text-indent: 20px">
                            Discount
                        </td>
                        <td class="GridRow1B">
                                <asp:DropDownList ID="cbPrDisc" runat="server" CssClass="TextBox" />
                                <asp:CascadingDropDown ID="exPrDisc" runat="server" 
                                    TargetControlID="cbPrDisc" 
                                    ParentControlID="cbPrType" 
                                    Category="PrDisc"
                                    ContextKey="Pr"
                                    SelectedValue='<%# Bind("PrDiscount") %>'
                                    ServicePath="~/SpecDisc.asmx" 
                                    ServiceMethod="GetDiscount"
                                    UseContextKey="True">
                                </asp:CascadingDropDown>
                        </td>
                        <td class="GridRow1B">
                            &nbsp;
                        </td>
                        <td class="GridRow1B">
                            <asp:CheckBox ID="cbPropagate" runat="server" Text="Propagate" Checked='<%# Bind("PrPropagate") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Secondary
                        </td>
                        <td class="GridRow1B">
                                <asp:DropDownList ID="cbScType" runat="server" CssClass="TextBox" />
                                <asp:CascadingDropDown ID="exScType" runat="server" 
                                    TargetControlID="cbScType" 
                                    Category="ScTypeID" 
                                    ContextKey="Sc"
                                    SelectedValue='<%# Bind("ScDiscountTypeId") %>'
                                    ServicePath="~/SpecDisc.asmx" 
                                    ServiceMethod="GetTypeID"
                                    UseContextKey="True">
                                </asp:CascadingDropDown>
                        </td>
                        <td class="GridRow1B">
                            On
                        </td>
                        <td class="GridRow1B">
                                <asp:DropDownList ID="cbScOn" runat="server" CssClass="TextBox" />
                                <asp:CascadingDropDown ID="exScOn" runat="server" 
                                    TargetControlID="cbScOn" 
                                    ParentControlID="cbScType" 
                                    Category="ScTypeOn"
                                    ContextKey="Sc"
                                    SelectedValue='<%# Bind("ScDiscountOn") %>'
                                    ServicePath="~/SpecDisc.asmx" 
                                    ServiceMethod="GetOn"
                                    UseContextKey="True">
                                </asp:CascadingDropDown>
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRowClear" style="text-indent: 20px">
                            Discount
                        </td>
                        <td class="GridRowClear">
                                <asp:DropDownList ID="cbScDisc" runat="server" CssClass="TextBox" />
                                <asp:CascadingDropDown ID="exScDisc" runat="server" 
                                    TargetControlID="cbScDisc" 
                                    ParentControlID="cbScType" 
                                    Category="ScDisc"
                                    ContextKey="Sc"
                                    SelectedValue='<%# Bind("ScDiscount") %>'
                                    ServicePath="~/SpecDisc.asmx" 
                                    ServiceMethod="GetDiscount"
                                    UseContextKey="True">
                                </asp:CascadingDropDown>
                        </td>
                        <td class="GridRowClear">
                            &nbsp;
                        </td>
                        <td class="GridRowClear">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="GridRow2T" colspan="4" style="text-align: right; padding-top: 5px;">
                            <asp:Button ID="btUpdate" runat="server" Text="Save" SkinID="skBtnBase" 
                                CommandName="Insert" />&nbsp;
                            <asp:Button ID="btCancel" runat="server" Text="Cancel" SkinID="skBtnBase" CommandName="Cancel" />&nbsp;
                        </td>
                    </tr>
                </table>
            </InsertItemTemplate>
            <ItemTemplate>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="GridRow2B" style="width: 100px">
                            Special
                        </td>
                        <td class="GridRow2B" style="width: 300px">
                            <asp:Label ID="DescriptionLabel" runat="server" 
                                Text='<%# Eval("Title") %>' />
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
                            <asp:Label ID="CategoryLabel" runat="server" Text='<%# Bind("Category") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Booking Code
                        </td>
                        <td class="GridRow1B">
                            <asp:Label ID="BookingCodeLabel" runat="server" 
                                Text='<%# Bind("BookingCode") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRowClear">
                            Rate options
                        </td>
                        <td class="GridRow1B">
                            <asp:Label ID="RateOptionLabel" runat="server" 
                                Text='<%# Bind("RateOptionDisp") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            &nbsp;
                        </td>
                        <td class="GridRow1B">
                            <asp:Label ID="PerPaxIDLabel" runat="server" Text='<%# Eval("RateCodeId") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Start
                        </td>
                        <td class="GridRow1B">
                            <asp:Label ID="StartLabel" runat="server" 
                                Text='<%# Bind("Start", "{0:d}") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            End
                        </td>
                        <td class="GridRow1B">
                            <asp:Label ID="FinishLabel" runat="server" 
                                Text='<%# Bind("Finish", "{0:d}") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Booking Star
                        </td>
                        <td class="GridRow1B">
                            <asp:Label ID="BkStartLabel" runat="server" 
                                Text='<%# Bind("BkStart", "{0:d}") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Booking End
                        </td>
                        <td class="GridRow1B">
                            <asp:Label ID="BkFinishLabel" runat="server" 
                                Text='<%# Bind("BkFinish", "{0:d}") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Payment
                        </td>
                        <td class="GridRow1B">
                            <asp:Label ID="PaymentLabel" runat="server" 
                                Text='<%# Bind("Payment", "{0:d}") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Rooming list
                        </td>
                        <td class="GridRow1B">
                            <asp:Label ID="RoomingListLabel" runat="server" 
                                Text='<%# Bind("RoomingList", "{0:d}") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Min. Stay
                        </td>
                        <td class="GridRow1B">
                            <asp:Label ID="StayCriteriaMinLabel" runat="server" 
                                Text='<%# Bind("StayCriteriaMin") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Max. Stay
                        </td>
                        <td class="GridRow1B">
                            <asp:Label ID="StayCriteriaMaxLabel" runat="server" 
                                Text='<%# Bind("StayCriteriaMax") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Description</td>
                        <td class="GridRow1B">
                            <asp:TextBox ID="txtDescription" runat="server" CssClass="TextBox" 
                                Text='<%# Bind("Description") %>' TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B" colspan="2">
                            Discounts
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Primary
                        </td>
                        <td class="GridRow1B">
                            <asp:Label ID="ScDiscountOnLabel0" runat="server" 
                                Text='<%# Eval("PrType")&" charge on " & Eval("PrOn") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B" style="text-indent: 20px">
                            Discount
                        </td>
                        <td class="GridRow1B">
                            <asp:Label ID="ScDiscountOnLabel1" runat="server" 
                                Text='<%# Eval("PrOn") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRow1B">
                            Secondary
                        </td>
                        <td class="GridRow1B">
                            <asp:Label ID="ScDiscountOnLabel2" runat="server" 
                                Text='<%# Eval("ScType") &" charge on " & Eval("ScOn") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="SelectRowClear" style="text-indent: 20px">
                            Discount
                        </td>
                        <td class="GridRowClear">
                            <asp:Label ID="ScDiscountOnLabel3" runat="server" 
                                Text='<%# Eval("ScDiscount") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="GridRow2T" colspan="2" style="text-align: right; padding-top: 5px;">
                            <asp:Button ID="btUpdate" runat="server" CommandName="Edit" SkinID="skBtnBase" 
                                Text="Edit" />
                            &nbsp;<asp:Button ID="btUpdate0" runat="server" CommandName="New" SkinID="skBtnBase" 
                                Text="New" />
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
                <asp:Parameter Name="Original_SpecialID" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="gvSpecials" DefaultValue="" Name="SpecialID" 
                    PropertyName="SelectedValue" Type="Int32" />
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
                <asp:Parameter Direction="InputOutput" Name="NewID" Type="Int32" />
            </InsertParameters>
        </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="dsRateType" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetSpecialRate" 
                        TypeName="dsSpecialTableAdapters.RateTypeTableAdapter">
                    </asp:ObjectDataSource>
                </td>
                <td class="GridBorder" valign="top">
                    <asp:Panel ID="pnlMP" runat="server" BorderStyle="None" style="height: 100%;">
                        <table style="height: 100%;">
                            <tr style="height: 100%;">
                                <td>
                                    <asp:GridView ID="gridMealPlan" runat="server" AllowSorting="True" 
                                        AutoGenerateColumns="False" DataKeyNames="MealPlanID,SpecialID" DataSourceID="dsMealPlan" 
                                        SkinID="skGridView" Width="100%">
                                        <Columns>
                                            <asp:BoundField DataField="SpecialID" HeaderText="SpecialID" ReadOnly="True" 
                                                SortExpression="SpecialID" Visible="False" />
                                            <asp:TemplateField SortExpression="SelectedMP">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CheckBox1" runat="server" 
                                                        Checked='<%# Bind("SelectedMP") %>' />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:CheckBox ID="CheckBox2" runat="server" 
                                                        Checked='<%# Bind("SelectedMP") %>' />
                                                </EditItemTemplate>
                                                <ItemStyle Width="25px" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="MealPlanID" HeaderText="Meal Plan" ReadOnly="True">
                                                <HeaderStyle Font-Bold="True" HorizontalAlign="Left" />
                                                <ItemStyle Width="100px" />
                                            </asp:BoundField>
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 30px; text-align: right;">
                                    <asp:Button ID="btnUpdate" runat="server" SkinID="skBtnBase" Text="Update" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:ObjectDataSource ID="dsMealPlan" runat="server" SelectMethod="GetData" 
                        TypeName="dsSpecialTableAdapters.SelectSpecialMealPlanTableAdapter" 
                        UpdateMethod="SpecialMealPlanUpdate">
                        <UpdateParameters>
                            <asp:Parameter Name="SpecialID" Type="Int32" />
                            <asp:Parameter Name="MealPlanID" Type="String" />
                            <asp:Parameter Name="SelectedMP" Type="Boolean" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="gvSpecials" Name="SpecialID" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
                <td class="GridBorder" valign="top">
                    <asp:Panel ID="pnlRoom" runat="server" BorderStyle="None" style="height: 100%;" 
                        Width="191px">
                        <table style="height: 100%;">
                            <tr style="height: 100%;">
                                <td>
                                    <asp:GridView ID="gridRoomType" runat="server" AllowSorting="True" 
                                        AutoGenerateColumns="False" DataSourceID="dsRoomType" 
                                        SkinID="skGridView" Width="100%" DataKeyNames="SpecialID,RoomTypeID">
                                        <Columns>
                                            <asp:BoundField DataField="SpecialID" HeaderText="SpecialID" ReadOnly="True" 
                                                SortExpression="SpecialID" Visible="False" />
                                            <asp:TemplateField SortExpression="SelectedRT">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CheckBox3" runat="server" 
                                                        Checked='<%# Bind("SelectedRT") %>' />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:CheckBox ID="CheckBox4" runat="server" 
                                                        Checked='<%# Bind("SelectedRT") %>' />
                                                </EditItemTemplate>
                                                <ItemStyle Width="25px" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="RoomTypeID" HeaderText="Room Type" ReadOnly="True">
                                                <HeaderStyle Font-Bold="True" HorizontalAlign="Left" />
                                                <ItemStyle Width="100px" />
                                            </asp:BoundField>
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 30px; text-align: right;">
                                    <asp:Button ID="btnUpdate0" runat="server" SkinID="skBtnBase" Text="Update" />
                                    <asp:ObjectDataSource ID="dsRoomType" runat="server" SelectMethod="GetData" 
                                        TypeName="dsSpecialTableAdapters.SelectSpecialRoomTableAdapter" 
                                        UpdateMethod="SpecialRoomUpdate">
                                        <UpdateParameters>
                                            <asp:Parameter Name="SpecialID" Type="Int32" />
                                            <asp:Parameter Name="RoomTypeId" Type="String" />
                                            <asp:Parameter Name="SelectedRT" Type="Boolean" />
                                        </UpdateParameters>
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="gvSpecials" Name="SpecialID" 
                                                PropertyName="SelectedValue" Type="Int32" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </div>
    <div class = "Blue">
    <asp:HiddenField ID="dummy" runat="server" />
        <asp:ObjectDataSource ID="dsCategory" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="dsSpecialTableAdapters.SpecialCategoryTableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsHotel" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="dsSpecialTableAdapters.HotelTableAdapter"></asp:ObjectDataSource>
    <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
        PopupDragHandleControlID="popLabel" CancelControlID="btnNo" DropShadow="True" 
        BackgroundCssClass="modalBackground" TargetControlID="dummy" X="200" Y="200">
    </asp:ModalPopupExtender>

    <asp:Panel ID="popPanel" runat="server" Width="300px" BackColor="White" Style="display: none">
        <table cellpadding="0" cellspacing="0" style="width: 100%;">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="popLabel" runat="server" Text="Delete data" SkinID="skGridLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <p style="text-align: center;">
                        <asp:Label ID="popMessage" runat="server" Text="Are you sure?"></asp:Label>
                    </p>
                    <p style="text-align: right;" class="GridRow2TB">
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

