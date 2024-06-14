<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" CodeFile="Create.aspx.vb" Inherits="Contracts_Wizard_Create" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Contract Create
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" Runat="Server">
    <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="2" Height="650px" 
        SkinID="WizardTemp" Width="900px">
        <WizardSteps>
            <asp:WizardStep runat="server" title="Hotels" StepType="Start">
                <div class="Green">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <asp:Panel ID="pnSearchHead" runat="server">
                                <td class="GridLabelBG" style="width: 600px;">
                                    <asp:Label ID="lblFilter0" runat="server" SkinID="skGridLabel">
                       
                            Search/Filter
                            &nbsp;
                            <asp:Image runat="server" ImageUrl="~/Images/collapse_.png" ID="imgExpander"></asp:Image>

                            





                            



                            





                            &nbsp;
                        </asp:Label>
                                </td>
                            </asp:Panel>
                        </tr>
                        <tr>
                            <td class="GridBorder">
                                <asp:Panel ID="pnSearch0" runat="server">
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="GridRow1B">
                                                Hotel</td>
                                            <td class="GridRow1B">
                                                <asp:DropDownList ID="ddlHotels" runat="server" AutoPostBack="True" 
                                                    DataSourceID="dsAllHotels" DataTextField="Hotel" DataValueField="Hotel" 
                                                    Width="300px" CssClass="TextBox">
                                                </asp:DropDownList>
                                                <asp:ObjectDataSource ID="dsAllHotels" runat="server" DeleteMethod="Delete" 
                                                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                                                    SelectMethod="GetAllActive" TypeName="dsMaintHotelTableAdapters.HotelTableAdapter" 
                                                    UpdateMethod="Update">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="Original_HotelID" Type="Int32" />
                                                    </DeleteParameters>
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
                                                        <asp:Parameter Direction="InputOutput" Name="NewID" Type="Int32" />
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
                                                        <asp:Parameter Name="Logo" Type="Object" />
                                                        <asp:Parameter Name="MaxOccupancy" Type="Int16" />
                                                        <asp:Parameter Name="Original_HotelID" Type="Int32" />
                                                    </UpdateParameters>
                                                </asp:ObjectDataSource>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="GridRow1B">
                                                Name
                                            </td>
                                            <td class="GridRow1B">
                                                <asp:TextBox ID="fltNameHtl" runat="server" CssClass="TextBox" Width="300px"></asp:TextBox>
                                                <asp:TextBoxWatermarkExtender ID="fltNameExt0" runat="server" Enabled="True" 
                                                    TargetControlID="fltNameHtl" WatermarkCssClass="WaterMark" 
                                                    WatermarkText="Hotel name (use % as wildchar)">
                                                </asp:TextBoxWatermarkExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="GridRow1B">
                                                City
                                            </td>
                                            <td class="GridRow1B" width="350">
                                                <asp:TextBox ID="fltCityHtl" runat="server" CssClass="TextBox" Width="300px"></asp:TextBox>
                                                <asp:TextBoxWatermarkExtender ID="fltCityExt0" runat="server" Enabled="True" 
                                                    TargetControlID="fltCityHtl" WatermarkCssClass="WaterMark" 
                                                    WatermarkText="City name (use % as wildchar)">
                                                </asp:TextBoxWatermarkExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="GridRow1B">
                                                Country
                                            </td>
                                            <td class="GridRow1B" width="350">
                                                <asp:TextBox ID="fltCountryHtl" runat="server" CssClass="TextBox" Width="300px"></asp:TextBox>
                                                <asp:TextBoxWatermarkExtender ID="fltCountryExt0" runat="server" Enabled="True" 
                                                    TargetControlID="fltCountryHtl" WatermarkCssClass="WaterMark" 
                                                    WatermarkText="Country name (use % as wildchar)">
                                                </asp:TextBoxWatermarkExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="GridRowClear">
                                            </td>
                                            <td class="GridRowClear" width="350">
                                                <asp:CheckBox ID="fltActiveHtl" runat="server" Checked="True" 
                                                    Text="Show only active hotels" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="ComandRow2T" colspan="2">
                                                <asp:Button ID="btnFilter" runat="server" SkinID="skBtnFilter" />
                                                &nbsp;
                                                <asp:Button ID="btnClear" runat="server" SkinID="skBtnClear" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                    </table>
                </div>
                <br />
                <div class="Blue" style=" height:600px">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="GridLabelBG">
                                <asp:Label ID="lbHotels" runat="server" SkinID="skGridLabel" Text="Hotels"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="GridBorder">
                                <asp:GridView ID="gvHotels" runat="server" AutoGenerateColumns="False" 
                                    DataKeyNames="HotelID" DataSourceID="dsHotels" SkinID="skGridView" 
                                    AllowPaging="True" SelectedIndex="0">
                                    <Columns>
                                        <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" 
                                            ShowSelectButton="True" />
                                        <asp:BoundField DataField="HotelID" ReadOnly="True" SortExpression="HotelID">
                                            <ItemStyle HorizontalAlign="Right" Width="50px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Hotel" HeaderText="Hotel" SortExpression="Hotel">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle Width="350px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="City" HeaderText="City" SortExpression="City">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle Width="200px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Country" HeaderText="Country" 
                                            SortExpression="Country">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle Width="200px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Tel" HeaderText="Tel" SortExpression="Tel">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle Width="150px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Fax" HeaderText="Fax" SortExpression="Fax">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle Width="150px" />
                                        </asp:BoundField>
                                        <asp:CheckBoxField DataField="Flat" HeaderText="F" SortExpression="Flat">
                                            <ItemStyle Width="25px" />
                                        </asp:CheckBoxField>
                                        <asp:CheckBoxField DataField="Active" HeaderText="A" SortExpression="Active">
                                            <ItemStyle Width="25px" />
                                        </asp:CheckBoxField>
                                    </Columns>
                                    <RowStyle Wrap="False" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </div>
                <asp:ObjectDataSource ID="dsHotels" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}" 
                    SelectMethod="GetDataByFilter" 
                    TypeName="dsMaintHotelTableAdapters.HotelTableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_HotelID" Type="Int32" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="hfUsername" Name="UserName" 
                            PropertyName="Value" Type="String" />
                        <asp:ControlParameter ControlID="fltNameHtl" Name="Hotel" PropertyName="Text" 
                            Type="String" />
                        <asp:ControlParameter ControlID="fltCityHtl" Name="City" PropertyName="Text" 
                            Type="String" />
                        <asp:ControlParameter ControlID="fltCountryHtl" Name="Country" PropertyName="Text" 
                            Type="String" />
                        <asp:ControlParameter ControlID="fltActiveHtl" Name="ActiveOnly" 
                            PropertyName="Checked" Type="Boolean" />
                    </SelectParameters>
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
                        <asp:Parameter Name="Logo" Type="Object" />
                        <asp:Parameter Name="MaxOccupancy" Type="Int16" />
                        <asp:Parameter Name="Original_HotelID" Type="Int32" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
            </asp:WizardStep>
            <asp:WizardStep runat="server" title="Tour Operator">
              <div class="Green">
            <table cellpadding="0" cellspacing="0">
            <tr>
                <asp:Panel ID="Panel1" runat="server" >
                    <td class="GridLabelBG" width="600px">
                        <asp:Label ID="lblFilter" runat="server" SkinID="skGridLabel">
                            Search/Filter
                            &nbsp;

                       &nbsp;
                        </asp:Label>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:Panel ID="pnSearch" runat="server" >
                        <table cellpadding="0" cellspacing="0">
                           <tr>
                                <td class="GridRow1B">
                                    Market
                                    <asp:Label ID="Label7" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                </td>
                                <td class="GridRow1B" style="width: 400px;">
                                 <asp:DropDownList ID="ddlMarkets" runat="server" AppendDataBoundItems="True" 
                                        CssClass="TextBox" DataSourceID="dsMarkets" DataTextField="Market" 
                                        DataValueField="MarketID" Width="300px">
                                        <asp:ListItem Selected="True" Value="">all markets</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                               
                           </tr>
                           <tr>
                                <td class="GridRow1B">
                                    Name
                                </td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="fltNameTO" runat="server" CssClass="TextBox" Width="300px" />
                                    <asp:TextBoxWatermarkExtender ID="fltNameExt" runat="server" TargetControlID="fltNameTO" 
                                        WatermarkCssClass="WaterMark" 
                                        WatermarkText="TourOperator name (use % as wildchar)" Enabled="True" />
                                </td>
                           </tr>
                           <tr>
                                <td class="GridRow1B">
                                    City
                                </td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="fltCityTO" runat="server" CssClass="TextBox" Width="300px" />
                                    <asp:TextBoxWatermarkExtender ID="fltCityExt" runat="server" TargetControlID="fltCityTO" 
                                        WatermarkCssClass="WaterMark" 
                                        WatermarkText="City name (use % as wildchar)" Enabled="True" />
                                </td>
                           </tr>
                           <tr>
                                <td class="GridRow1B">
                                    Country
                                </td>
                                <td class="GridRow1B">
                                    <asp:TextBox ID="fltCountryTO" runat="server" CssClass="TextBox" 
                                        Width="300px" />
                                    <asp:TextBoxWatermarkExtender ID="fltCountryExt" runat="server" TargetControlID="fltCountryTO" 
                                        WatermarkCssClass="WaterMark" 
                                        WatermarkText="Country name (use % as wildchar)" Enabled="True" />
                                </td>
                           </tr>
                           
                           <tr>
                                <td class="GridRow1B">
                                    Pay Condition
                                </td>
                                <td class="GridRow1B" style="width: 400px;">
                                    <asp:DropDownList ID="ddlPay" runat="server" CssClass="TextBox"
                                        DataSourceID="dsPayCond"
                                        DataTextField="PayCond" DataValueField="PayCondID" 
                                        AppendDataBoundItems="True" Width="300px" >
                                        <asp:ListItem Selected="True" Value="">all pay cond.</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsPayCond" runat="server" DeleteMethod="Delete" 
                                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                                        SelectMethod="GetData" TypeName="TourOperTableAdapters.PayCondTableAdapter" 
                                        UpdateMethod="Update">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Original_PayCondID" Type="String" />
                                        </DeleteParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="PayCond" Type="String" />
                                            <asp:Parameter Name="Original_PayCondID" Type="String" />
                                        </UpdateParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="PayCondID" Type="String" />
                                            <asp:Parameter Name="PayCond" Type="String" />
                                        </InsertParameters>
                                    </asp:ObjectDataSource>
                                </td>
                           </tr>
                           <tr>
                                <td class="FilterRow"></td>
                                <td class="FilterRow">
                                    <asp:CheckBox ID="fltActiveTO" runat="server" Text="Show only active TO" 
                                        Checked="True" AutoPostBack="False" />
                                </td>
                                <td class="FilterRow"></td>
                            </tr>
                            <tr>
                                <td colspan="3" class="ComandRow2T">
                                    <asp:Button ID="Button1" runat="server" SkinID="skBtnFilter"/>&nbsp;
                                    <asp:Button ID="Button2" runat="server" SkinID="skBtnClear"/>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>

    </div>
    <br />
    <asp:ObjectDataSource ID="dsTOSearch" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataForFilter" 
        TypeName="TourOperTableAdapters.TourOpTableAdapter" DeleteMethod="Delete" 
        InsertMethod="Insert" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_TourOpID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="MarketId" Type="String" />
            <asp:Parameter Name="ParentTourOpId" Type="Int32" />
            <asp:Parameter Name="TourOp" Type="String" />
            <asp:Parameter Name="BillingName" Type="String" />
            <asp:Parameter Name="RNC" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="Tel1" Type="String" />
            <asp:Parameter Name="Tel2" Type="String" />
            <asp:Parameter Name="Tel3" Type="String" />
            <asp:Parameter Name="Fax" Type="String" />
            <asp:Parameter Name="URL" Type="String" />
            <asp:Parameter Name="Email1" Type="String" />
            <asp:Parameter Name="Email2" Type="String" />
            <asp:Parameter Name="PayModeId" Type="String" />
            <asp:Parameter Name="PayCondId" Type="String" />
            <asp:Parameter Name="PayCondExtId" Type="Int32" />
            <asp:Parameter Name="CreditDays" Type="Int32" />
            <asp:Parameter Name="BillingParent" Type="Boolean" />
            <asp:Parameter Name="Active" Type="Boolean" />
            <asp:Parameter Name="Note" Type="String" />
            <asp:Parameter Name="Original_TourOpID" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="hfUsername" Name="UserName" 
                PropertyName="Value" Type="String" />
            <asp:ControlParameter ControlID="fltNameTO" Name="TourOp" PropertyName="Text" 
                Type="String" />
            <asp:ControlParameter ControlID="ddlMarkets" Name="MarketID" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddlPay" Name="PayCondID" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="fltCityTO" Name="City" PropertyName="Text" 
                Type="String" />
            <asp:ControlParameter ControlID="fltCountryTO" Name="Country" PropertyName="Text" 
                Type="String" />
            <asp:ControlParameter ControlID="fltActiveTO" Name="ActiveOnly" 
                PropertyName="Checked" Type="Boolean" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="TourOpID" Type="Int32" />
            <asp:Parameter Name="MarketId" Type="String" />
            <asp:Parameter Name="ParentTourOpId" Type="Int32" />
            <asp:Parameter Name="TourOp" Type="String" />
            <asp:Parameter Name="BillingName" Type="String" />
            <asp:Parameter Name="RNC" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="Tel1" Type="String" />
            <asp:Parameter Name="Tel2" Type="String" />
            <asp:Parameter Name="Tel3" Type="String" />
            <asp:Parameter Name="Fax" Type="String" />
            <asp:Parameter Name="URL" Type="String" />
            <asp:Parameter Name="Email1" Type="String" />
            <asp:Parameter Name="Email2" Type="String" />
            <asp:Parameter Name="PayModeId" Type="String" />
            <asp:Parameter Name="PayCondId" Type="String" />
            <asp:Parameter Name="PayCondExtId" Type="Int32" />
            <asp:Parameter Name="CreditDays" Type="Int32" />
            <asp:Parameter Name="BillingParent" Type="Boolean" />
            <asp:Parameter Name="Active" Type="Boolean" />
            <asp:Parameter Name="Note" Type="String" />
            <asp:Parameter Direction="InputOutput" Name="NewID" Type="Int32" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <br />
    <div class="Blue"  style="height: 600px;">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="Label1" runat="server" Text="Tour Operators" 
                        SkinID="skGridLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvTO" runat="server" 
                                  DataSourceID="dsTOSearch"
                                  SkinID="skGridView" SelectedIndex="0" 
                        DataKeyNames="TourOpID,TourOp" AllowPaging="True" Visible="False">
                        <Columns>
                            <asp:CommandField ButtonType="Image" SelectImageUrl="~/Images/select_.gif" 
                                ShowSelectButton="True" />
                            <asp:BoundField DataField="TourOpID" Visible="False" HeaderText="TourOpID" 
                                ReadOnly="True" SortExpression="TourOpID">
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="TourOp" HeaderText="TourOperator" 
                                SortExpression="TourOp">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="250px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="PayCondId" HeaderText="PayCond" 
                                SortExpression="PayCondId" />
                            <asp:BoundField DataField="MarketId" HeaderText="Market" 
                                SortExpression="MarketId">
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Address" Visible="False" HeaderText="Address" SortExpression="Address">
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="120px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="120px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Tel1" HeaderText="Tel" SortExpression="Tel">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Fax" HeaderText="Fax" SortExpression="Fax">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Email1" HeaderText="Email" SortExpression="Email" 
                                Visible="False">
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:CheckBoxField DataField="Active" HeaderText="A" SortExpression="Active" />
                        </Columns>
                    </asp:GridView>
                    <br />
                </td>
            </tr>
        </table>
    </div>
    <br />
            </asp:WizardStep>
            <asp:WizardStep runat="server" StepType="Finish" Title="Details">
            <div class="Blue">
                
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="ContractID" 
                    DataSourceID="dsContract" DefaultMode="Insert" Width="500px">
                    <ItemTemplate>
                        ContractID:
                        <asp:Label ID="ContractIDLabel" runat="server" 
                            Text='<%# Eval("ContractID") %>' />
                        <br />
                        Template:
                        <asp:CheckBox ID="TemplateCheckBox" runat="server" 
                            Checked='<%# Bind("Template") %>' Enabled="false" />
                        <br />
                        HotelId:
                        <asp:Label ID="HotelIdLabel" runat="server" Text='<%# Bind("HotelId") %>' />
                        <br />
                        MarketId:
                        <asp:Label ID="MarketIdLabel" runat="server" Text='<%# Bind("MarketId") %>' />
                        <br />
                        Start:
                        <asp:Label ID="StartLabel" runat="server" Text='<%# Bind("Start") %>' />
                        <br />
                        Finish:
                        <asp:Label ID="FinishLabel" runat="server" Text='<%# Bind("Finish") %>' />
                        <br />
                        Commision:
                        <asp:Label ID="CommisionLabel" runat="server" Text='<%# Bind("Commision") %>' />
                        <br />
                        Title:
                        <asp:Label ID="TitleLabel" runat="server" Text='<%# Bind("Title") %>' />
                        <br />
                        Year:
                        <asp:Label ID="YearLabel" runat="server" Text='<%# Bind("Year") %>' />
                        <br />
                        Description:
                        <asp:Label ID="DescriptionLabel" runat="server" 
                            Text='<%# Bind("Description") %>' />
                        <br />
                        StateId:
                        <asp:Label ID="StateIdLabel" runat="server" Text='<%# Bind("StateId") %>' />
                        <br />
                        CopyId:
                        <asp:Label ID="CopyIdLabel" runat="server" Text='<%# Bind("CopyId") %>' />
                        <br />
                        TourOpId:
                        <asp:Label ID="TourOpIdLabel" runat="server" Text='<%# Bind("TourOpId") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="Delete" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                            CommandName="New" Text="New" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        ContractID:
                        <asp:Label ID="ContractIDLabel1" runat="server" 
                            Text='<%# Eval("ContractID") %>' />
                        <br />
                        Template:
                        <asp:CheckBox ID="TemplateCheckBox" runat="server" 
                            Checked='<%# Bind("Template") %>' />
                        <br />
                        HotelId:
                        <asp:TextBox ID="HotelIdTextBox" runat="server" Text='<%# Bind("HotelId") %>' />
                        <br />
                        MarketId:
                        <asp:TextBox ID="MarketIdTextBox" runat="server" 
                            Text='<%# Bind("MarketId") %>' />
                        <br />
                        Start:
                        <asp:TextBox ID="StartTextBox" runat="server" Text='<%# Bind("Start") %>' />
                        <br />
                        Finish:
                        <asp:TextBox ID="FinishTextBox" runat="server" Text='<%# Bind("Finish") %>' />
                        <br />
                        Commision:
                        <asp:TextBox ID="CommisionTextBox" runat="server" 
                            Text='<%# Bind("Commision") %>' />
                        <br />
                        Title:
                        <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                        <br />
                        Year:
                        <asp:TextBox ID="YearTextBox" runat="server" Text='<%# Bind("Year") %>' />
                        <br />
                        Description:
                        <asp:TextBox ID="DescriptionTextBox" runat="server" 
                            Text='<%# Bind("Description") %>' />
                        <br />
                        StateId:
                        <asp:TextBox ID="StateIdTextBox" runat="server" Text='<%# Bind("StateId") %>' />
                        <br />
                        CopyId:
                        <asp:TextBox ID="CopyIdTextBox" runat="server" Text='<%# Bind("CopyId") %>' />
                        <br />
                        TourOpId:
                        <asp:TextBox ID="TourOpIdTextBox" runat="server" 
                            Text='<%# Bind("TourOpId") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        Start:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="StartTextBox" runat="server" 
                            Text='<%# Bind("Start", "{0:d}") %>' CssClass="TextBox" Width="400px" />
                        <asp:CalendarExtender ID="StartTextBox_CalendarExtender" runat="server" 
                            Enabled="True" TargetControlID="StartTextBox" CssClass="cal_Theme1">
                        </asp:CalendarExtender>
                        <br />
                        End:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="FinishTextBox" runat="server" 
                            Text='<%# Bind("Finish", "{0:d}") %>' CssClass="TextBox" Width="400px" />
                        <asp:CalendarExtender ID="FinishTextBox_CalendarExtender" runat="server" 
                            Enabled="True" TargetControlID="FinishTextBox" CssClass="cal_Theme1">
                        </asp:CalendarExtender>
                        <br />
                        Commision:&nbsp;
                        <asp:TextBox ID="CommisionTextBox" runat="server" 
                            Text='<%# Bind("Commision") %>' CssClass="TextBox" Width="400px" />
                        <br />
                        Title:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                            DataSourceID="dsContractTitle" DataTextField="ContractTitle" 
                            DataValueField="ContractTitle" SelectedValue='<%# Bind("Title") %>' 
                            Width="400px" CssClass="TextBox">
                        </asp:DropDownList>
                        <br />
                        Year:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="YearTextBox" runat="server" Text='<%# Bind("Year") %>' 
                            CssClass="TextBox" Width="400px" MaxLength="4" />
                        <br />
                        Description:
                        <asp:TextBox ID="DescriptionTextBox" runat="server" Height="63px" 
                            Text='<%# Bind("Description") %>' Width="400px" CssClass="TextBox" 
                            TextMode="MultiLine" />
                        <br />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Save" 
                            Font-Bold="True" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                            CommandName="Cancel" Text="Cancel" Font-Bold="True" />
                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                            ControlToCompare="StartTextBox" ControlToValidate="FinishTextBox" 
                            Display="None" ErrorMessage="End date must be greater then Start date" 
                            Operator="GreaterThan" Type="Date"></asp:CompareValidator>
                        <asp:ValidatorCalloutExtender ID="CompareValidator1_ValidatorCalloutExtender" 
                            runat="server" Enabled="True" TargetControlID="CompareValidator1">
                        </asp:ValidatorCalloutExtender>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" 
                            ControlToValidate="CommisionTextBox" Display="None" 
                            ErrorMessage="Must input number" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                        <asp:ValidatorCalloutExtender ID="CompareValidator2_ValidatorCalloutExtender" 
                            runat="server" Enabled="True" TargetControlID="CompareValidator2">
                        </asp:ValidatorCalloutExtender>
                        <asp:CompareValidator ID="CompareValidator3" runat="server" 
                            ControlToValidate="YearTextBox" Display="None" ErrorMessage="Must input number" 
                            Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                        <asp:ValidatorCalloutExtender ID="CompareValidator3_ValidatorCalloutExtender" 
                            runat="server" Enabled="True" TargetControlID="CompareValidator3">
                        </asp:ValidatorCalloutExtender>
                    </InsertItemTemplate>
                </asp:FormView>
                
            </div>
                
            </asp:WizardStep>
        </WizardSteps>
        <HeaderTemplate>
                    <table cellpadding="0" cellspacing="0" width="100%">
                        <tr style="font-size: x-small;">
                            <td style="width:70px;" align="right" >TO:&nbsp;&nbsp;</td>
                            <td ><%="(" & gvTO.SelectedValue & ") "%></td>
                        </tr>
                        <tr style="font-size: x-small;">
                            <td style="width:70px;" align="right" >Hotel:&nbsp;&nbsp;</td>
                            <td ><%="(" & gvHotels.SelectedValue & ") "%></td>
                        </tr>
                    </table> 
                </HeaderTemplate>
        <SideBarStyle Width="110px" Wrap="True" />
    </asp:Wizard>
     <asp:ObjectDataSource runat="server" 
        DeleteMethod="Delete" InsertMethod="Insert" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="TourOperTableAdapters.MarketTableAdapter" UpdateMethod="Update" 
        ID="dsMarkets"><DeleteParameters>
<asp:Parameter Name="Original_MarketID" Type="String"></asp:Parameter>
</DeleteParameters>
<InsertParameters>
<asp:Parameter Name="MarketID" Type="String"></asp:Parameter>
<asp:Parameter Name="Market" Type="String"></asp:Parameter>
</InsertParameters>
<UpdateParameters>
<asp:Parameter Name="Market" Type="String"></asp:Parameter>
<asp:Parameter Name="Original_MarketID" Type="String"></asp:Parameter>
</UpdateParameters>
</asp:ObjectDataSource>

    <asp:ObjectDataSource runat="server" 
        DeleteMethod="Delete" InsertMethod="Insert" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="ContractsTableAdapters.ContractTableAdapter" UpdateMethod="Update" 
        ID="dsContract">
                                    <DeleteParameters>
                                        <asp:Parameter Name="Original_ContractID" Type="Int32"></asp:Parameter>
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="Template" Type="Boolean" DefaultValue="false"></asp:Parameter>
                                        <asp:Parameter Name="HotelId" Type="Int32"></asp:Parameter>
                                        <asp:Parameter Name="MarketId" Type="String"></asp:Parameter>
                                        <asp:Parameter DefaultValue="" Name="Start" Type="DateTime" />
                                        <asp:Parameter Name="Finish" Type="DateTime" />
                                        <asp:Parameter Name="Commision" Type="Decimal" />
                                        <asp:Parameter Name="Title" Type="String" />
                                        <asp:Parameter Name="Year" Type="Int16" />
                                        <asp:Parameter Name="Description" Type="String" DefaultValue="" />
                                        <asp:Parameter Name="StateId" Type="Int32" DefaultValue="-1"></asp:Parameter>
                                        <asp:Parameter Name="CopyId" Type="Int32"></asp:Parameter>
                                        <asp:Parameter Name="TourOpId" Type="Int32"></asp:Parameter>
                                        <asp:Parameter Direction="InputOutput" Name="NewID" Type="Int32" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="Template" Type="Boolean"></asp:Parameter>
                                        <asp:Parameter Name="HotelId" Type="Int32"></asp:Parameter>
                                        <asp:Parameter Name="MarketId" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="Start" Type="DateTime"></asp:Parameter>
                                        <asp:Parameter Name="Finish" Type="DateTime"></asp:Parameter>
                                        <asp:Parameter Name="Commision" Type="Decimal"></asp:Parameter>
                                        <asp:Parameter Name="Title" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="Year" Type="Int16"></asp:Parameter>
                                        <asp:Parameter Name="Description" Type="String"></asp:Parameter>
                                        <asp:Parameter Name="StateId" Type="Int32"></asp:Parameter>
                                        <asp:Parameter Name="CopyId" Type="Int32"></asp:Parameter>
                                        <asp:Parameter Name="TourOpId" Type="Int32"></asp:Parameter>
                                        <asp:Parameter Name="Original_ContractID" Type="Int32"></asp:Parameter>
                                    </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsContractTitle" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetData" 
        TypeName="ContractsTableAdapters.ContractTitleTableAdapter" 
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
    
    <div class = "Blue">
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

