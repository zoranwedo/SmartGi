<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Hotel/masterHotels.master"
    AutoEventWireup="false" CodeFile="HotelDetail.aspx.vb" Inherits="Maintenance_Hotel_HotelDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Hotel Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HotelContent" runat="Server">
    <div class="Blue">
        <table cellpadding="0" cellspacing="2">
            <tr>
                <td class="GridBorder">
                    <asp:DetailsView ID="dwHotelDetail" runat="server" Width="600px" DataSourceID="dsHotelDetail"
                        DataKeyNames="HotelID" SkinID="skDetailView" AutoGenerateRows="False" EnableModelValidation="True">
                        <FieldHeaderStyle Width="100px" CssClass="SelectRow1TB padingLeft5" />
                        <Fields>
                            <asp:TemplateField HeaderText="Hotel" SortExpression="Hotel">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtHotel" runat="server" Text='<%# Bind("Hotel") %>' CssClass="TextBox" />
                                    <asp:RequiredFieldValidator ID="reqHotel" runat="server" ErrorMessage="This is required field!"
                                        ControlToValidate="txtHotel" Display="None" />
                                    <asp:ValidatorCalloutExtender ID="reqHotelExt" runat="server" TargetControlID="reqHotel"
                                        HighlightCssClass="WaterMark" />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtHotel1" runat="server" Text='<%# Bind("Hotel") %>' CssClass="TextBox" />
                                    <asp:RequiredFieldValidator ID="reqHotelID1" runat="server" ErrorMessage="This is required field!"
                                        ControlToValidate="txtHotel1" Display="None" />
                                    <asp:ValidatorCalloutExtender ID="reqHotelIDExt1" runat="server" TargetControlID="reqHotelID1"
                                        HighlightCssClass="WaterMark" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Hotel") %>' />
                                </ItemTemplate>
                                <HeaderStyle CssClass="GridRow2B" Font-Bold="True" />
                                <ItemStyle CssClass="GridRow2B" Font-Bold="True" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ID" SortExpression="HotelID">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("HotelID") %>' />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtHotelID" runat="server" Text='<%# Bind("HotelID") %>' CssClass="TextBox" />
                                    <asp:RequiredFieldValidator ID="reqHotelID" runat="server" ErrorMessage="This is required field!"
                                        ControlToValidate="txtHotelID" Display="None" />
                                    <asp:ValidatorCalloutExtender ID="reqHotelIDExt" runat="server" TargetControlID="reqHotelID"
                                        HighlightCssClass="WaterMark" />
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtHotelID"
                                        ErrorMessage="Must input number" Operator="DataTypeCheck" Type="Integer" />
                                    <asp:ValidatorCalloutExtender ID="CompareValidator1_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator1" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("HotelID") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="HotelHID" HeaderText="Code" SortExpression="HotelHID">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="RNC" HeaderText="RNC" SortExpression="RNC">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" />
                            <asp:TemplateField HeaderText="Sort Order" SortExpression="SortPriority">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("SortPriority") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="TextBox" Text='<%# Bind("SortPriority") %>' />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtSort" runat="server" CssClass="TextBox" Text='<%# Bind("SortPriority") %>' />
                                </InsertItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField ShowHeader="false">
                                <ItemTemplate><b>Address</b></ItemTemplate>
                                <ItemStyle CssClass="GridRow1B" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Address" HeaderText="Street" SortExpression="Address">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" Visible="False">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ZipCode" HeaderText="Zip Code" SortExpression="ZipCode">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>

                            <asp:TemplateField ShowHeader="false">
                                <ItemTemplate><b>Contact</b></ItemTemplate>
                                <ItemStyle CssClass="GridRow1B" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Contact" HeaderText="Contact" SortExpression="Contact">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Tel" HeaderText="Tel" SortExpression="Tel">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Fax" HeaderText="Fax" SortExpression="Fax">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>

                            <asp:TemplateField ShowHeader="false">
                                <ItemTemplate><b>Bank</b></ItemTemplate>
                                <ItemStyle CssClass="GridRow1B" />
                            </asp:TemplateField>
                            <%--<asp:BoundField DataField="Bank" HeaderText="Bank" SortExpression="Bank">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="BankAccount" HeaderText="Bank Account" SortExpression="BankAccount">
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>--%>
                            
                            <asp:TemplateField HeaderText="Accounts">
                                <ItemTemplate>
                    <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                       <tr>
                            <td style="width: 302px; height: 16px;" class="SelectRow1B">
                                Bank
                            </td>
                            <td style="width: 122px; height: 16px;" class="SelectRow1B">
                                Account
                            </td>
                            <td style="width: 75px; height: 16px;" class="SelectRow1B">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                    <asp:GridView ID="gvAdjustment" runat="server" SkinID="skGridView" AllowSorting="True"
                        AutoGenerateColumns="False" DataKeyNames="HotelBankID" ShowHeader="false"
                        DataSourceID="dsBanks" >
                        <Columns>
                            <asp:BoundField DataField="HotelBankID" InsertVisible="False" ReadOnly="True" Visible="False" />
                            <asp:BoundField DataField="BankName" >
                                <ControlStyle CssClass="TextBox" />
                                <ItemStyle Width="300px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="BankAccount" >
                                <ControlStyle CssClass="TextBox" />
                                <ItemStyle Width="120px" />
                            </asp:BoundField>
                            <asp:CommandField CancelImageUrl="~/Images/decline_inline.gif" ShowEditButton="True"
                                ButtonType="Image" EditImageUrl="~/Images/edit_inline.gif" UpdateImageUrl="~/Images/accept_inline.gif">
                                <ControlStyle CssClass="ImgButton" />
                                <ItemStyle Width="50px" />
                            </asp:CommandField>
                            <asp:TemplateField InsertVisible="False" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="false" 
                                        CommandName="Delete" ImageUrl="~/Images/delete_inline.gif" 
                                        onclientclick="if (!confirm('Are you sure you want to delete this record?')) return;"  />
                                </ItemTemplate>
                                <EditItemTemplate>&nbsp;</EditItemTemplate>
                                <ItemStyle Width="25px" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:FormView ID="newType" runat="server" DataSourceID="dsBanks">
                        <InsertItemTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                <tr class="GridRow1T">
                                    <td style="width: 302px; height: 30px; padding-right: 2px;">
                                        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("BankName") %>' 
                                            CssClass="TextBox" />
                                        <asp:RequiredFieldValidator ID="reqNameTextBox" runat="server" 
                                            ErrorMessage="This is required field!" ControlToValidate="NameTextBox" 
                                            Display="None" />
                                        <asp:ValidatorCalloutExtender ID="reqNameTextBoxExt" runat="server" 
                                            TargetControlID="reqNameTextBox" HighlightCssClass="WaterMark" />
                                    </td>
                                    <td style="width: 122px;">
                                        <asp:TextBox ID="AccountTextBox" runat="server" Text='<%# Bind("BankAccount") %>' 
                                            CssClass="TextBox" />
                                        <asp:RequiredFieldValidator ID="reqAccountTextBox" runat="server" 
                                            ErrorMessage="This is required field!" ControlToValidate="AccountTextBox" 
                                            Display="None" />
                                        <asp:ValidatorCalloutExtender ID="reqAccountTextBoxExt" runat="server" 
                                            TargetControlID="reqAccountTextBox" HighlightCssClass="WaterMark" />
                                    </td>
                                    <td style="width: 75px; padding-left: 5px;">
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
                                <tr>
                                    <%--<td style="width: 420px; margin-top: 2px;">
                                        &nbsp;
                                    </td>--%>
                                    <td style="padding: 3px; margin-top: 2px;">
                                        <asp:Button ID="btnNew" runat="server" Text="Add" SkinID="skBtnBase" CommandName="New" />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                <tr>
                                    <td style="width: 310px; margin-top: 2px;">
                                        &nbsp;
                                    </td>
                                    <td style="padding-top: 5px; margin-top: 2px;">
                                        <asp:Button ID="btnNew" runat="server" Text="Add" SkinID="skBtnBase" CommandName="New" />
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                    </asp:FormView>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="Rooms" HeaderText="Rooms" SortExpression="Rooms" Visible="False" />
                            <asp:BoundField DataField="Htl_Titulo" HeaderText="Htl_Titulo" SortExpression="Htl_Titulo" Visible="False" />
                            <asp:CheckBoxField DataField="Flat" HeaderText="Flat" SortExpression="Flat" Visible="false" />
                            <asp:CheckBoxField DataField="AdultOnly" HeaderText="Adult Only" SortExpression="AdultOnly" Visible="false"/>

                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update"
                                        Text="Update" />
                                    &nbsp;
                                    <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel"
                                        Text="Cancel" />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Insert"
                                        Text="Save" />
                                    &nbsp;
                                    <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel"
                                        Text="Cancel" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit"
                                        Text="Edit" />
                                    &nbsp;
                                    <%--<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="New"
                                        Text="New" />
                                    &nbsp;--%>
                                    <asp:Button ID="Button3" runat="server" CausesValidation="False" CommandName="Delete"
                                        Text="Delete" OnClientClick="return confirm('Are you sure you want to delete the record')" />
                                </ItemTemplate>
                                <ControlStyle BorderStyle="None" CssClass="Button" Font-Size="10pt" ForeColor="White" />
                                <ItemStyle CssClass="ComandRow2T" Height="30px" HorizontalAlign="Right" VerticalAlign="Middle" />
                            </asp:TemplateField>
                        </Fields>
                    </asp:DetailsView>
                </td>
                <td class="GridBorder" valign="top">
                    <asp:Panel ID="pnlUpload" runat="server" BorderStyle="None">
                        <asp:DetailsView ID="imgGrid" runat="server" DataSourceID="dsHotelLogo" SkinID="skDetailView">
                            <Fields>
                                <asp:TemplateField HeaderText="Logo" ShowHeader="False">
                                    <ItemStyle CssClass="GridRow2B" Font-Bold="True" />
                                    <ItemTemplate>
                                        <asp:Label ID="lblLogo" runat="server" Text="Logo" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Logo" ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" AlternateText="No logo for hotel." Height="200px"
                                            Width="200px" ImageUrl='<%# Eval("HotelID", "~/Maintenance/Hotel/imgShow.aspx?HotelID={0}") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                        </asp:DetailsView>
                        <table>
                            <tr>
                                <td>
                                    <asp:FileUpload ID="fileUpload" runat="server" BorderStyle="None" CssClass="TextBox" />
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 30px; text-align: right;">
                                    <asp:Button ID="Button1" runat="server" Text="Upload" SkinID="skBtnBase" />
                                    &nbsp;
                                    <asp:Button ID="Button2" runat="server" Text="Delete" SkinID="skBtnBase" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <%--<asp:ObjectDataSource ID="dsHotelLogo" runat="server" OldValuesParameterFormatString="original_{0}"
                        TypeName="dsMaintHotelTableAdapters.HotelTableAdapter"
                        SelectMethod="GetDataByHotelID" 
                        UpdateMethod="UpdateLogo" 
                        DeleteMethod="Delete" 
                        InsertMethod="Insert">--%>
                    <asp:ObjectDataSource ID="dsHotelLogo" runat="server" OldValuesParameterFormatString="original_{0}"
                        TypeName="dsMaintHotelTableAdapters.HotelTableAdapter"
                        SelectMethod="GetDataByHotelID" 
                        UpdateMethod="UpdateLogo" >
                        <UpdateParameters>
                            <asp:Parameter Name="Logo" Type="Object" />
                            <asp:QueryStringParameter Name="Original_HotelID" QueryStringField="HotelID" Type="Int32" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="HotelID" QueryStringField="HotelID" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
                <td class="GridBorder" valign="top">
                    <asp:Panel ID="pnlMP" runat="server" Style="height: 100%;" BorderStyle="None">
                        <table style="height: 100%;">
                            <tr style="height: 100%;">
                                <td>
                                    <asp:GridView ID="gridMealPlan" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                                        DataKeyNames="MealPlanID" DataSourceID="dsMealPlan" SkinID="skGridView" Width="100%">
                                        <Columns>
                                            <asp:BoundField DataField="HotelId" HeaderText="HotelId" SortExpression="HotelId" ReadOnly="True" Visible="False" />
                                            <asp:TemplateField SortExpression="SelectedMP">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("SelectedMP") %>' Enabled="true" />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("SelectedMP") %>' />
                                                </EditItemTemplate>
                                                <ItemStyle Width="25px" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="MealPlanID" HeaderText="Meal Plan" ReadOnly="True">
                                                <HeaderStyle HorizontalAlign="Left" Font-Bold="True" />
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
                    <asp:ObjectDataSource ID="dsMealPlan" runat="server" 
                        TypeName="dsMaintHotelTableAdapters.SelectHotelMealPlanTableAdapter"
                        SelectMethod="GetData" 
                        UpdateMethod="HotelMealPlanUpdate">
                        <UpdateParameters>
                            <asp:QueryStringParameter Name="HotelID" QueryStringField="HotelID" Type="Int32" />
                            <asp:Parameter Name="MealPlanID" Type="String" />
                            <asp:Parameter Name="SelectedMP" Type="Boolean" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="HotelID" QueryStringField="HotelID" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="dsHotelDetail" runat="server" OldValuesParameterFormatString="original_{0}"
            TypeName="dsMaintHotelTableAdapters.HotelTableAdapter"
            SelectMethod="GetDataByHotelID" 
            DeleteMethod="Delete" 
            InsertMethod="InsertHotel" 
            UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_HotelID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="HotelID" QueryStringField="HotelID" Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="HotelID" Type="Int32" />
                <asp:Parameter Name="HotelHID" Type="String" />
                <asp:Parameter Name="Hotel" Type="String" />
                <asp:Parameter Name="RNC" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="ZipCode" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="Tel" Type="String" />
                <asp:Parameter Name="Fax" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Contact" Type="String" />
                <asp:Parameter Name="Bank" Type="String" />
                <asp:Parameter Name="BankAccount" Type="String" />
                <asp:Parameter Name="Rooms" Type="Int32" />
                <asp:Parameter Name="Htl_Titulo" Type="String" />
                <asp:Parameter Name="AdultOnly" Type="Boolean" />
                <asp:Parameter Name="Flat" Type="Boolean" />
                <asp:Parameter Name="Active" Type="Boolean" />
                <asp:Parameter Name="Logo" Type="Object" />
                <asp:Parameter Name="MaxOccupancy" Type="Int16" />
                <asp:Parameter Name="SortPriority" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="HotelHID" Type="String" />
                <asp:Parameter Name="Hotel" Type="String" />
                <asp:Parameter Name="RNC" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="ZipCode" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="Tel" Type="String" />
                <asp:Parameter Name="Fax" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Contact" Type="String" />
                <asp:Parameter Name="Bank" Type="String" />
                <asp:Parameter Name="BankAccount" Type="String" />
                <asp:Parameter Name="Rooms" Type="Int32" />
                <asp:Parameter Name="Htl_Titulo" Type="String" />
                <asp:Parameter Name="AdultOnly" Type="Boolean" />
                <asp:Parameter Name="Flat" Type="Boolean" />
                <asp:Parameter Name="Active" Type="Boolean" />
                <%--<asp:Parameter Name="Logo" Type="Object" />--%>
                <asp:Parameter Name="MaxOccupancy" Type="Int16" />
                <asp:Parameter Name="SortPriority" Type="Int32" />
                <asp:Parameter Name="Original_HotelID" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsBanks" runat="server" DeleteMethod="Delete" 
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetDataByHotel" 
            TypeName="AccUnitsTableAdapters.HotelBankTableAdapter" 
            UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_HotelBankID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:QueryStringParameter Name="HotelID" QueryStringField="HotelID" Type="Int32" />
                <asp:Parameter Name="BankName" Type="String" />
                <asp:Parameter Name="BankAccount" Type="String" />
                <asp:Parameter Name="Original_HotelBankID" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="HotelID" QueryStringField="HotelID" Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:QueryStringParameter Name="HotelID" QueryStringField="HotelID" Type="Int32" />
                <asp:Parameter Name="BankName" Type="String" />
                <asp:Parameter Name="BankAccount" Type="String" />
            </InsertParameters>
        </asp:ObjectDataSource>
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
</asp:Content>
