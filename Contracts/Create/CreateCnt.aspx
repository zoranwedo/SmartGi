<%@ Page Title="" Language="VB" MasterPageFile="~/Contracts/Create/masterNewCnt.master"
    AutoEventWireup="false" CodeFile="CreateCnt.aspx.vb" Inherits="Contracts_Create_CreateCnt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="Server">
    Create Contract
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CreateCntContent" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
    <asp:FormView ID="fvNewContract" runat="server" DataKeyNames="ContractID" DataSourceID="dsContract"
        DefaultMode="Insert" Width="100%">
        <InsertItemTemplate>
            <div class="Blue">
                <table cellpadding="0" cellspacing="0" style="width: 100%;">
                    <tr>
                        <td class="GridLabelBG" colspan="2">
                            <asp:Label ID="Label1" runat="server" Text="Create New Contract For:" SkinID="skGridLabel" />
                        </td>
                    </tr>
                    <tr>
                        <td class="GridRowClear" style="width: 30px;">
                            &nbsp;
                        </td>
                        <td class="GridRow2B" style="padding: 6px;">
                            <table cellpadding="0" cellspacing="0" style="width: 630px;">
                                <tr>
                                    <td class="GridRow1B" style="width: 120px; padding-left: 5px;">
                                        Hotel
                                    </td>
                                    <td class="GridRow1B" style="width: 480px;">
                                        <asp:DropDownList ID="ddlHotels" runat="server" CssClass="TextBox" DataSourceID="dsAllHotels"
                                            DataTextField="Hotel" DataValueField="HotelID" SelectedValue='<%# Bind("HotelId") %>'>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRowClear" style="width: 120px; padding-left: 5px;">
                                        Tour Operator
                                    </td>
                                    <td class="GridRowClear" style="width: 480px;">
                                        <asp:DropDownList ID="ddlTO" runat="server" CssClass="TextBox" DataSourceID="dsTOAll0"
                                            DataTextField="TourOp" DataValueField="TourOpID" SelectedValue='<%# Bind("TourOpId") %>'>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="Red">
                <table>
                    <tr>
                        <td class="GridRowClear" style="width: 30px;" rowspan="2">
                            &nbsp;
                        </td>
                        <td class="GridLabelBG" colspan="2">
                            <asp:Label ID="Label6" runat="server" SkinID="skGridLabel" Text="Contract basic details"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder">
                            <table cellpadding="0" cellspacing="0" style="width: 630px;">
                                <tr>
                                    <td class="SelectRow1T" style="width: 120px;">
                                        <asp:LinkButton ID="GetStart" runat="server" 
                                            ToolTip="Get next starting date for contract" onclick="GetStart_Click">
                                            Start
                                        </asp:LinkButton>
                                    </td>
                                    <td class="GridRow1T" style="width: 480px;">
                                        <asp:TextBox ID="txtStart" runat="server" Text='<%# Bind("Start", "{0:d}") %>' CssClass="TextBox" />
                                        <asp:CalendarExtender ID="calStart" runat="server" TargetControlID="txtStart" CssClass="cal_Theme1" />
                                        <asp:CompareValidator ID="valDtStart" runat="server" Display="None" 
                                            ControlToValidate="txtStart"
                                            ErrorMessage="Required date input!" 
                                            Operator="DataTypeCheck" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="extDtStart" runat="server" SkinID="skExtender" TargetControlID="valDtStart" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1T" style="width: 120px;">
                                        End
                                    </td>
                                    <td class="GridRow1T" style="width: 480px;">
                                        <asp:TextBox ID="txtFinish" runat="server" Text='<%# Bind("Finish", "{0:d}") %>' CssClass="TextBox" />
                                        <asp:CalendarExtender ID="calFinish" runat="server" TargetControlID="txtFinish" CssClass="cal_Theme1" />
                                        <asp:CompareValidator ID="valFinish" runat="server" Display="None" 
                                            ControlToValidate="txtFinish" 
                                            ControlToCompare="txtStart"
                                            ErrorMessage="End date must be greater then Start date."
                                            Operator="GreaterThan" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="extFinish" SkinID="skExtender" runat="server" TargetControlID="valFinish" />
                                        <asp:CompareValidator ID="valDtFinish" runat="server" Display="None" 
                                            ControlToValidate="txtFinish"
                                            ErrorMessage="Required date input!" 
                                            Operator="DataTypeCheck" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="extDtFinish" runat="server" SkinID="skExtender" TargetControlID="valDtFinish" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1T" style="width: 120px;">
                                        Commision
                                    </td>
                                    <td class="GridRow1T" style="width: 480px;">
                                        <asp:TextBox ID="txtCommision" runat="server" Text='<%# Bind("Commision") %>' CssClass="TextBox" />
                                        <asp:CompareValidator ID="valCommision" runat="server" Display="None"
                                            ControlToValidate="txtCommision"
                                            ErrorMessage="Must input number" 
                                            Operator="DataTypeCheck" Type="Double" />
                                        <asp:ValidatorCalloutExtender ID="extCommision" runat="server" SkinID="skExtender" TargetControlID="valCommision" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1T" style="width: 120px;">
                                        Title
                                    </td>
                                    <td class="GridRow1T" style="width: 480px;">
                                        <asp:DropDownList ID="ddlTitle" runat="server" CssClass="TextBox" DataSourceID="dsContractTitle"
                                            DataTextField="ContractTitle" DataValueField="ContractTitle" SelectedValue='<%# Bind("Title") %>'>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <%--<tr>
                                    <td class="SelectRow1T" style="width: 120px;">
                                        Year
                                    </td>
                                    <td class="GridRow1T" style="width: 480px;">
                                        <asp:TextBox ID="txtYear" runat="server" Text='<%# Bind("Year") %>' CssClass="TextBox" MaxLength="4" />
                                        <asp:CompareValidator ID="valYear" runat="server" Display="None" 
                                            ControlToValidate="txtYear"
                                            ErrorMessage="Must input number" 
                                            Operator="DataTypeCheck" Type="Integer" />
                                        <asp:ValidatorCalloutExtender ID="extYear" runat="server" SkinID="skExtender" TargetControlID="valYear" />
                                    </td>
                                </tr>--%>
                                <tr>
                                    <td class="SelectRow1T" style="width: 120px;">Rate Received</td>
                                    <td class="GridRow1T" style="width: 480px;">
                                        <asp:TextBox ID="txtRateRc" runat="server" CssClass="TextBox" Text='<%# Bind("RateRecieved", "{0:d}") %>' />
                                        <asp:CalendarExtender ID="txtRateRc_CalendarExtender" runat="server" CssClass="cal_Theme1" TargetControlID="txtRateRc" />
                                        <asp:CompareValidator ID="datRateReceived" runat="server" ControlToValidate="txtRateRc"
                                            CultureInvariantValues="True" Operator="DataTypeCheck" SkinID="skDate" Type="Date" />
                                        <asp:ValidatorCalloutExtender ID="datRateReceived_ValidatorCalloutExtender" runat="server"
                                            SkinID="skExtender" TargetControlID="datRateReceived" />
                                        <asp:RequiredFieldValidator ID="reqRRecived" runat="server" ControlToValidate="txtRateRc"
                                            Display="None" ErrorMessage="Required Field">*</asp:RequiredFieldValidator>
                                        <asp:ValidatorCalloutExtender ID="reqxRRecived"
                                            runat="server" Enabled="True" TargetControlID="reqRRecived">
                                        </asp:ValidatorCalloutExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SelectRow1T" style="width: 120px; vertical-align: top;">
                                        Description
                                    </td>
                                    <td class="GridRow1T" style="width: 480px;">
                                        <asp:TextBox ID="DescriptionTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Description") %>'
                                            TextMode="MultiLine" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridRow2T" style="height: 30px; text-align: right; padding-top: 5px;"
                                        colspan="2">
                                        <asp:Button ID="InsertButton" runat="server" Text="Save" SkinID="skBtnBase" CausesValidation="True"
                                            CommandName="Insert" />
                                        <asp:ModalPopupExtender ID="mpeInsertButton" runat="server" 
                                            DynamicServicePath="" TargetControlID="InsertButton" PopupControlID="popPanel" CancelControlID="btnNo"  OkControlID="btnYes" DropShadow="True" Enabled="True" BackgroundCssClass="modalBackground" X="200" Y="200">
                                        </asp:ModalPopupExtender>
                                        <asp:ConfirmButtonExtender ID="cbeInsertButton" 
                                            runat="server" 
                                            ConfirmText="There are consistent contract for that hotel, tour operator overlapping specified contracting window.Do you want to create contract anyway?" 
                                            DisplayModalPopupID="mpeInsertButton" Enabled="False" 
                                            TargetControlID="InsertButton">
                                        </asp:ConfirmButtonExtender>
                                        &nbsp;
                                        <asp:Button ID="InsertCancelButton0" runat="server" Text="Cancel" SkinID="skBtnBase"
                                            CausesValidation="False" CommandName="Cancel" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
        </InsertItemTemplate>
    </asp:FormView>

    <div class="Blue">
        <asp:HiddenField ID="dummy" runat="server" />
        <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
            PopupDragHandleControlID="popLabel" CancelControlID="btnNo" DropShadow="True"
            BackgroundCssClass="modalBackground" TargetControlID="dummy" X="200" Y="200">
        </asp:ModalPopupExtender>
        <asp:Panel ID="popPanel" runat="server" Width="300px" BackColor="White"><%-- Style="display: none">--%>
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
    
    <asp:ObjectDataSource runat="server" InsertMethod="InsertQuery"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ContractsTableAdapters.ContractByIDTableAdapter"
        UpdateMethod="Update" ID="dsContract">
        <UpdateParameters>
            <asp:Parameter Name="Template" Type="Boolean" />
            <asp:Parameter Name="HotelId" Type="Int32" />
            <asp:Parameter Name="MarketId" Type="String" />
            <asp:Parameter Name="TourOpId" Type="Int32" />
            <asp:Parameter Name="Start" Type="DateTime" />
            <asp:Parameter Name="Finish" Type="DateTime" />
            <asp:Parameter Name="Commision" Type="Decimal" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Year" Type="Int16" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="StateId" Type="Int32" />
            <asp:Parameter Name="CopyId" Type="Int32" />
            <asp:Parameter Name="RateRecieved" Type="DateTime" />
            <asp:Parameter Name="LastUpdate" Type="DateTime" />
            <asp:ControlParameter ControlID="hfUsername" Name="UserName" 
                PropertyName="Value" Type="String" />
            <asp:Parameter Name="Original_ContractID" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:Parameter Name="ContractID" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="Template" Type="Boolean" DefaultValue="false"></asp:Parameter>
            <asp:Parameter Name="HotelId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="MarketId" Type="String"></asp:Parameter>
            <asp:Parameter Name="TourOpId" Type="Int32"></asp:Parameter>
            <asp:Parameter DefaultValue="" Name="Start" Type="DateTime" />
            <asp:Parameter Name="Finish" Type="DateTime" />
            <asp:Parameter Name="Commision" Type="Decimal" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Year" Type="Int16" />
            <asp:Parameter Name="Description" Type="String" DefaultValue="" />
            <asp:Parameter Name="StateId" Type="Int32" DefaultValue="-1"></asp:Parameter>
            <asp:Parameter Name="CopyId" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="RateRecieved" Type="DateTime" />
            <asp:ControlParameter ControlID="hfUsername" DefaultValue="" Name="UserName" 
                PropertyName="Value" Type="String" />
            <asp:Parameter Direction="InputOutput" Name="NewID" Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsContractTitle" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ContractsTableAdapters.ContractTitleTableAdapter"
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_ContractTitle" Type="String" />
            <asp:Parameter Name="Original_ContractYear" Type="Int16" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Original_ContractTitle" Type="String" />
            <asp:Parameter Name="Original_ContractYear" Type="Int16" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="ContractTitle" Type="String" />
            <asp:Parameter Name="ContractYear" Type="Int16" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource runat="server" DeleteMethod="Delete" InsertMethod="Insert"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllActive" TypeName="dsMaintHotelTableAdapters.HotelTableAdapter"
        UpdateMethod="Update" ID="dsAllHotels">
        <DeleteParameters>
            <asp:Parameter Name="Original_HotelID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="HotelID" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="HotelHID" Type="String"></asp:Parameter>
            <asp:Parameter Name="Hotel" Type="String"></asp:Parameter>
            <asp:Parameter Name="RNC" Type="String"></asp:Parameter>
            <asp:Parameter Name="Address" Type="String"></asp:Parameter>
            <asp:Parameter Name="City" Type="String"></asp:Parameter>
            <asp:Parameter Name="State" Type="String"></asp:Parameter>
            <asp:Parameter Name="ZipCode" Type="String"></asp:Parameter>
            <asp:Parameter Name="Country" Type="String"></asp:Parameter>
            <asp:Parameter Name="Tel" Type="String"></asp:Parameter>
            <asp:Parameter Name="Fax" Type="String"></asp:Parameter>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
            <asp:Parameter Name="Contact" Type="String"></asp:Parameter>
            <asp:Parameter Name="Bank" Type="String"></asp:Parameter>
            <asp:Parameter Name="BankAccount" Type="String"></asp:Parameter>
            <asp:Parameter Name="Rooms" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Htl_Titulo" Type="String"></asp:Parameter>
            <asp:Parameter Name="AdultOnly" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="Flat" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="Active" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="Logo" Type="Object"></asp:Parameter>
            <asp:Parameter Name="MaxOccupancy" Type="Int16"></asp:Parameter>
            <asp:Parameter Direction="InputOutput" Name="NewID" Type="Int32"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="HotelHID" Type="String"></asp:Parameter>
            <asp:Parameter Name="Hotel" Type="String"></asp:Parameter>
            <asp:Parameter Name="RNC" Type="String"></asp:Parameter>
            <asp:Parameter Name="Address" Type="String"></asp:Parameter>
            <asp:Parameter Name="City" Type="String"></asp:Parameter>
            <asp:Parameter Name="State" Type="String"></asp:Parameter>
            <asp:Parameter Name="ZipCode" Type="String"></asp:Parameter>
            <asp:Parameter Name="Country" Type="String"></asp:Parameter>
            <asp:Parameter Name="Tel" Type="String"></asp:Parameter>
            <asp:Parameter Name="Fax" Type="String"></asp:Parameter>
            <asp:Parameter Name="Email" Type="String"></asp:Parameter>
            <asp:Parameter Name="Contact" Type="String"></asp:Parameter>
            <asp:Parameter Name="Bank" Type="String"></asp:Parameter>
            <asp:Parameter Name="BankAccount" Type="String"></asp:Parameter>
            <asp:Parameter Name="Rooms" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Htl_Titulo" Type="String"></asp:Parameter>
            <asp:Parameter Name="AdultOnly" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="Flat" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="Active" Type="Boolean"></asp:Parameter>
            <asp:Parameter Name="Logo" Type="Object"></asp:Parameter>
            <asp:Parameter Name="MaxOccupancy" Type="Int16"></asp:Parameter>
            <asp:Parameter Name="Original_HotelID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsTOAll0" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="ContractsTableAdapters.SelectUserTourOpTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="hfUsername" Name="UserName" PropertyName="Value"
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
