<%@ Page Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="Company.aspx.vb" Inherits="Maintenance_Company" Debug="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Company Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" runat="Server">
    <div class="Blue">
        <table cellpadding="0" cellspacing="2">
            <tr>
                <td class="GridLabelBG" style="font-weight: bold;" >
                    <asp:Label ID="lblTitle" runat="server" Text="Company" CssClass="GridLabel" Height="26px" style="margin-right: 33px;" />
                    <%--<asp:DropDownList ID="ddlCompanies" runat="server" AutoPostBack="True" CssClass="GridRowClear"
                        DataSourceID="dsCompanyList" DataTextField="Company" DataValueField="CompanyID" 
                        Height="26px" Width="480px" Font-Bold="true" BackColor="Transparent" ForeColor="Gray"/>--%>
                    <asp:ObjectDataSource ID="dsCompanyList" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetActive" 
                        TypeName="dsCompanyTableAdapters.CompanyTableAdapter">
                    </asp:ObjectDataSource>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="GridRowClear" style="font-size:larger;">
                    <asp:DropDownList ID="ddlCompanies" runat="server" AutoPostBack="True" CssClass="GridRowClear"
                        DataSourceID="dsCompanyList" DataTextField="Company" DataValueField="CompanyID" 
                        Font-Bold="true" Width="600px" />
                        </td>
                    </tr>
                    <tr>
                        <td >
                    <asp:DetailsView ID="dvCompany" runat="server" 
                        SkinID="skDetailView" Width="600px" AutoGenerateRows="False" 
                        DataKeyNames="CompanyID" DataSourceID="dsCompany">
                        <FieldHeaderStyle Width="120px" />
                        <Fields>
                            <asp:TemplateField HeaderText="Company" Visible="False"  >
                                <EditItemTemplate>
                                    <asp:HiddenField ID="hfActive" runat="server" Value='<%# Bind("Active") %>' />
                                    <asp:TextBox ID="txCompany" runat="server" Text='<%# Bind("Company") %>' CssClass="TextBox" />
                                    <asp:RequiredFieldValidator ID="req_txCompany" runat="server" ErrorMessage="This is required field!" ControlToValidate="txCompany" Display="None" />
                                    <asp:ValidatorCalloutExtender ID="ext_req_txCompany" runat="server" TargetControlID="req_txCompany" HighlightCssClass="WaterMark" />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:HiddenField ID="hfActive" runat="server" Value='<%# Bind("Active") %>' />
                                    <asp:TextBox ID="txCompany" runat="server" Text='<%# Bind("Company") %>' CssClass="TextBox" />
                                    <asp:RequiredFieldValidator ID="req_txCompany" runat="server" ErrorMessage="This is required field!" ControlToValidate="txCompany" Display="None" />
                                    <asp:ValidatorCalloutExtender ID="ext_req_txCompany" runat="server" TargetControlID="req_txCompany" HighlightCssClass="WaterMark" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbConpany" runat="server" Text='<%# Bind("Company") %>' />
                                </ItemTemplate>
                                <ItemStyle CssClass="GridRow2B" Font-Bold="True" />
                                <HeaderStyle CssClass="GridRow2B" Font-Bold="True" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Company Code" >
                                <EditItemTemplate>
                                    <asp:TextBox ID="txCode" runat="server" Text='<%# Bind("CompanyCode") %>' CssClass="TextBox" />
                                    <asp:RequiredFieldValidator ID="req_txCode" runat="server" ErrorMessage="This is required field!" ControlToValidate="txCode" Display="None" />
                                    <asp:ValidatorCalloutExtender ID="ext_req_txCode" runat="server" TargetControlID="req_txCode" HighlightCssClass="WaterMark" />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txCode" runat="server" Text='<%# Bind("CompanyCode") %>' CssClass="TextBox" />
                                    <asp:RequiredFieldValidator ID="req_txCode" runat="server" ErrorMessage="This is required field!" ControlToValidate="txCode" Display="None" />
                                    <asp:ValidatorCalloutExtender ID="ext_req_txCode" runat="server" TargetControlID="req_txCode" HighlightCssClass="WaterMark" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbCode" runat="server" Text='<%# Bind("CompanyCode") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="RNC" HeaderText="RNC" >
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Address" HeaderText="Address" >
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="City" HeaderText="City" >
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="State" HeaderText="State" >
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" >
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CountryCode" HeaderText="CountryCode" >
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Country" HeaderText="Country" >
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Tel" HeaderText="Tel" >
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Fax" HeaderText="Fax" >
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Email" HeaderText="Email" >
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Contact" HeaderText="Contact" >
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Bank" HeaderText="Bank" >
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="BankAccount" HeaderText="Bank Account" >
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:CheckBoxField DataField="Local" HeaderText="Local" />
                            <asp:TemplateField HeaderText="Invoice Layout" >
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlLayout" runat="server" CssClass="TextBox" 
                                        SelectedValue='<%# Bind("FnLayout") %>' AutoPostBack="True" 
                                        onselectedindexchanged="ddlLayout_SelectedIndexChanged" >
                                        <asp:ListItem Text="Date in Reference" Value="0" />
                                        <asp:ListItem Text="Hotel in Reference" Value="1" />
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="ddlLayout" runat="server" CssClass="TextBox" 
                                        SelectedValue='<%# Bind("FnLayout") %>' AutoPostBack="True" 
                                        onselectedindexchanged="ddlLayout_SelectedIndexChanged" >
                                        <asp:ListItem Text="Date in Reference" Value="0" />
                                        <asp:ListItem Text="Hotel in Reference" Value="1" />
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text="Date in Reference" Visible='<%# Eval("FnLayout")=0 %>' />
                                    <asp:Label ID="Label2" runat="server" Text="Hotel in Reference" Visible='<%# Eval("FnLayout")=1 %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False" >
                                <ItemTemplate>
                                    <asp:HiddenField ID="hfLayout" runat="server" Value='<%# Eval("FnLayout") %>' />
                                    <asp:Image ID="imgLayout" runat="server" Width="590px"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--<asp:CheckBoxField DataField="Active" HeaderText="Active" Visible="False" />--%>
                            <asp:TemplateField ShowHeader="false">
                                <ItemTemplate>
                                    Company Titles (since 8/1/2023)
                                </ItemTemplate>
                                <ItemStyle CssClass="SelectRow1TB" VerticalAlign="Top" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Hotel2Cedar" HeaderText="Hotel to CCI" >
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Cedar2TourOp" HeaderText="CCI to Tour Op." >
                                <ControlStyle CssClass="TextBox" />
                            </asp:BoundField>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:Button ID="btUpdate" runat="server" CausesValidation="True" Text="Update" CommandName="Update" />&nbsp;
                                    <asp:Button ID="btCancel" runat="server" CausesValidation="False" Text="Cancel" CommandName="Cancel" />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:Button ID="btInsert" runat="server" CausesValidation="True" Text="Insert" CommandName="Insert" />&nbsp;
                                    <asp:Button ID="btCancel" runat="server" CausesValidation="False" Text="Cancel" CommandName="Cancel" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Button ID="btEdit" runat="server" CausesValidation="False" Text="Edit" CommandName="Edit" />&nbsp;
                                    <asp:Button ID="btDelete" runat="server" CausesValidation="False" Text="Delete"
                                        CommandName="DelCompany" CommandArgument='<%# Eval("CompanyID") %>' 
                                        Visible='<%# Eval("CompanyID")>5 %>' />&nbsp;
                                    <asp:Button ID="btNew" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                                </ItemTemplate>
                                <ControlStyle BorderStyle="None" CssClass="Button" Font-Size="10pt" ForeColor="White" />
                                <ItemStyle CssClass="ComandRow2T" Height="30px" HorizontalAlign="Right" VerticalAlign="Middle" />
                            </asp:TemplateField>
                        </Fields>
                        <EmptyDataTemplate>
                            There are no active companies
                            <div style="text-align:right;">
                            <asp:Button ID="btNew" runat="server" CausesValidation="False" CommandName="New" Text="New" SkinID="skBtnBase" />
                            </div>
                        </EmptyDataTemplate>
                    </asp:DetailsView>
                        </td>
                    </tr>
                </table>
                </td>
            </tr>
            <tr>
                <td class="GridLabelBG" style="font-weight: bold;" >
                    <asp:Label ID="lblHotels" runat="server" Text="Billed by Hotels" CssClass="GridLabel" Height="26px" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvHotels" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="HotelID" DataSourceID="dsHotels"
                        ShowHeader="False" Width="600px" BorderStyle="None">
                        <RowStyle CssClass="GridRowClear" />
                        <Columns>
                            <asp:BoundField DataField="Hotel" HeaderText="Hotel" SortExpression="Hotel" >
                                <ItemStyle BorderStyle="None" />
                            </asp:BoundField>
                        </Columns>
                        <EmptyDataTemplate>
                            No hotels are billing to selected company.
                        </EmptyDataTemplate>
                    </asp:GridView>
                    <asp:FormView ID="fvAddHotel" runat="server" Width="600px" 
                        DataSourceID="dsAdHotel">
                        <RowStyle CssClass="ComandRow2T" HorizontalAlign="Right" />
                        <InsertRowStyle CssClass="ComandRow2T" />
                        <ItemTemplate>
                            <asp:Button ID="btAddHotel" runat="server" SkinID="skBtnBase" Text="Add Hotel" CommandName="New" />
                        </ItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="ddlAddHotel" runat="server" DataSourceID="dsAdHotel" 
                                DataTextField="Hotel" DataValueField="HotelID" CssClass="TextBox">
                            </asp:DropDownList>
                            <asp:Button ID="btAddHotel" runat="server" SkinID="skBtnBase" Text="Add" CommandName="AddHotel" />&nbsp;
                            <asp:Button ID="btCancelHotel" runat="server" SkinID="skBtnBase" Text="Cancel" CommandName="Cancel" />
                        </InsertItemTemplate>
                    </asp:FormView>
                    <asp:ObjectDataSource ID="dsAdHotel" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="NotInCompany" 
                        TypeName="dsCompanyTableAdapters.CompanyHotelTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlCompanies" Name="CompanyID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="dsCompany" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataByID" TypeName="dsCompanyTableAdapters.CompanyTableAdapter"
            UpdateMethod="Update" InsertMethod="Insert" DeleteMethod="Delete">
            <DeleteParameters>
                <asp:Parameter Name="Original_CompanyID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="CompanyCode" Type="String" />
                <asp:Parameter Name="Company" Type="String" />
                <asp:Parameter Name="RNC" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="ZipCode" Type="String" />
                <asp:Parameter Name="CountryCode" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="Tel" Type="String" />
                <asp:Parameter Name="Fax" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Contact" Type="String" />
                <asp:Parameter Name="Bank" Type="String" />
                <asp:Parameter Name="BankAccount" Type="String" />
                <asp:Parameter Name="Local" Type="Boolean" />
                <asp:Parameter Name="Active" Type="Boolean" />
                <asp:Parameter Name="FnLayout" Type="Int32" />
                <asp:Parameter Name="Hotel2Cedar" Type="String" />
                <asp:Parameter Name="Cedar2TourOp" Type="String" />
                <asp:Parameter Name="Original_CompanyID" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlCompanies" Name="CompanyID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="CompanyCode" Type="String" />
                <asp:Parameter Name="Company" Type="String" />
                <asp:Parameter Name="RNC" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="ZipCode" Type="String" />
                <asp:Parameter Name="CountryCode" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="Tel" Type="String" />
                <asp:Parameter Name="Fax" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Contact" Type="String" />
                <asp:Parameter Name="Bank" Type="String" />
                <asp:Parameter Name="BankAccount" Type="String" />
                <asp:Parameter Name="Local" Type="Boolean" />
                <asp:Parameter Name="Active" Type="Boolean" />
                <asp:Parameter Name="FnLayout" Type="Int32" />
                <asp:Parameter Name="Hotel2Cedar" Type="String" />
                <asp:Parameter Name="Cedar2TourOp" Type="String" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsHotels" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
            TypeName="dsCompanyTableAdapters.CompanyHotelTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlCompanies" Name="CompanyID" 
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
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
