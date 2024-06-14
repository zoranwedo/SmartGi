<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false" 
    CodeFile="CrsMatrix.aspx.vb" Inherits="Maintenance_CRS_CrsMatrix" %>

<%@ Register src="~/App_UserControls/MessagePop.ascx" tagname="MessagePop" tagprefix="uc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    SynXis Connected Tour Operators
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" Runat="Server">
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblTitle" runat="server" Text="SynXis Mapping Matrix" SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:UpdateProgress ID="upProcessing" runat="server" >
                        <ProgressTemplate>
                            <div id="Div1" runat="server"
                                style="z-index: 100; 
                                       position: fixed;
                                       top: 50%; left: 50%;
                                       transform: translate(-50%, -50%);
                                       -webkit-transform: translate(-50%, -50%);
                                       -moz-transform: translate(-50%, -50%);
                                       -o-transform: translate(-50%, -50%);
                                       -ms-transform: translate(-50%, -50%);
                                       text-align: center;
                                       width: 90%; height: 50px; padding-top: 20px;
                                       border: dotted 1px; border-radius: 10px; 
                                       background: White; filter: alpha(opacity=20); 
                                       -moz-opacity:.8; opacity:.8;">
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/status_anim.gif" />
                                <b>Filtering...</b>
                            </div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                        <ContentTemplate>

                    <table cellpadding="0" cellspacing="0" style="border-collapse: collapse;">
                        <tr style="font-weight: bold;">
                            <td class="GridRow2B" style="width: 50px;">Market</td>
                            <td class="GridRow2B" style="width: 70px;">Hotel Code</td>
                            <td class="GridRow2B" style="width: 70px;">Complex</td>
                            <td class="GridRow2B" style="width: 300px;">Hotel</td>
                            <td class="GridRow2B" style="width: 350px;"><asp:Label runat="server" ID="lblCompany">SIHOT Company</asp:Label></td>
                            <td class="GridRow2B" style="width: 250px;">Tour Operator</td>
                            <td class="GridRow2B" style="width: 50px;">&nbsp</td>
                        </tr>
                        <tr style="background-color: #F0FFFF;">
                            <td class="GridRow1B FilterCtrl">
                                <asp:ComboBox ID="fltMarketID" runat="server" 
                                    Width="22px" CssClass="SmartStyle" RenderMode="Block" 
                                    AutoCompleteMode="Suggest" AppendDataBoundItems="True" 
                                    DataSourceID="dsSmartMarket" DataTextField="MarketID" 
                                    DataValueField="MarketID" MaxLength="0" AutoPostBack="True">
                                    <asp:ListItem Text="..." Value="" />
                                </asp:ComboBox>
                            </td>
                            <td class="GridRow1B FilterCtrl">
                                <asp:ComboBox ID="fltHotelCode" runat="server" 
                                    Width="42px" CssClass="SmartStyle" RenderMode="Block" 
                                    AutoCompleteMode="Suggest" AppendDataBoundItems="True" 
                                    DataSourceID="dsSihotHotel" DataTextField="HOTEL-NO" 
                                    DataValueField="HOTEL-NO" MaxLength="0" AutoPostBack="True">
                                    <asp:ListItem Text="..." Value="" />
                                </asp:ComboBox>
                            </td>
                            <td class="GridRow1B FilterCtrl">
                                <asp:ComboBox ID="fltComplex" runat="server" 
                                    Width="42px" CssClass="SmartStyle" RenderMode="Block" 
                                    AutoCompleteMode="Suggest" AppendDataBoundItems="True" 
                                    DataSourceID="dsSihotComplex" DataTextField="COMPLEX-CODE" 
                                    DataValueField="COMPLEX-CODE" MaxLength="0" AutoPostBack="True">
                                    <asp:ListItem Text="..." Value="" />
                                </asp:ComboBox>
                            </td>
                            <td class="GridRow1B FilterCtrl">
                                <asp:ComboBox ID="fltHotel" runat="server" 
                                    Width="272px" CssClass="SmartStyle" RenderMode="Block" 
                                    AutoCompleteMode="Suggest" AppendDataBoundItems="True" 
                                    DataSourceID="dsSmartHotel" DataTextField="Hotel" 
                                    DataValueField="HotelID" MaxLength="0" AutoPostBack="True">
                                    <asp:ListItem Text="..." Value="" />
                                </asp:ComboBox>
                            </td>
                            <td class="GridRow1B FilterCtrl">
                                <asp:ComboBox ID="fltCompany" runat="server" 
                                    Width="322" CssClass="SmartStyle" RenderMode="Block" 
                                    AutoCompleteMode="Suggest" AppendDataBoundItems="True" 
                                    DataSourceID="dsSihotTourOp" DataTextField="Company" 
                                    DataValueField="centralID" MaxLength="0" AutoPostBack="True">
                                    <asp:ListItem Text="..." Value="" />
                                </asp:ComboBox>
                            </td>
                            <td class="GridRow1B FilterCtrl">
                                <asp:ComboBox ID="fltTourOp" runat="server" 
                                    Width="222" CssClass="SmartStyle" RenderMode="Block" 
                                    AutoCompleteMode="Suggest" AppendDataBoundItems="True" 
                                    DataSourceID="dsSmartTourOp" DataTextField="TourOp" 
                                    DataValueField="TourOpID" MaxLength="0" AutoPostBack="True">
                                    <asp:ListItem Text="..." Value="" />
                                </asp:ComboBox>
                            </td>
                            <td class="GridRow1B">&nbsp;</td>
                        </tr>
                    </table>

                    <asp:FormView ID="fvMatrixNew" runat="server" DataKeyNames="MappID" DataSourceID="dsMatrix">
                        <InsertItemTemplate>
                            <table cellpadding="0" cellspacing="2" style="border-collapse: collapse; table-layout: fixed;" class="GridRow1B">
                                <tr>
                                    <td style="width: 50px;">
                                        <asp:DropDownList ID="ddlMarketID" runat="server" CssClass="TextBox"
                                            DataSourceID="dsSmartMarket" DataTextField="MarketID" DataValueField="MarketID" 
                                            SelectedValue='<%# Bind("MarketID") %>' />
                                    </td>
                                    <td style="width: 70px;">
                                        <asp:TextBox ID="ddlHotelCode" runat="server" CssClass="TextBox" Text='<%# Eval("HotelCode") %>' ReadOnly="true" Width="65px"/>
                                        <asp:PopupControlExtender ID="popSihotMapp" runat="server" CommitProperty="Text" 
                                            PopupControlID="gvSihotMapp"
                                            TargetControlID="ddlHotelCode" 
                                            Position="Bottom">
                                        </asp:PopupControlExtender>
                                        <asp:GridView ID="gvSihotMapp" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                            DataKeyNames="HotelID,HOTEL-NO,COMPLEX-CODE,Hotel" DataSourceID="dsSihotHotelMap" GridLines="None"
                                            CssClass="ListGrid" 
                                            OnSelectedIndexChanging="gvSihotMapp_SelectedIndexChanged"
                                            OnSelectedIndexChanged="gvSihotMapp_SelectedIndexChanged" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="HOTEL-NO" SortExpression="HOTEL-NO">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="Label1" runat="server" Text='<%# Bind("[HOTEL-NO]") %>' CommandName="Select" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="70px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="COMPLEX-CODE" SortExpression="COMPLEX-CODE">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="Label2" runat="server" Text='<%# Bind("[COMPLEX-CODE]") %>' CommandName="Select" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="70px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Hotel" SortExpression="Hotel">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="Label3" runat="server" Text='<%# Bind("Hotel") %>' CommandName="Select" Width="300px" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="300px" />
                                                </asp:TemplateField>
                                            </Columns>
                                            <RowStyle CssClass="ListItem" />
                                        </asp:GridView>
                                    </td>
                                    <td style="width: 70px;">
                                        <asp:TextBox ID="ddlComplexCode" runat="server" CssClass="TextBox" Text='<%# Eval("ComplexCode") %>' ReadOnly="true" Width="65px"/>
                                    </td>
                                    <td style="width: 300px;">
                                        <asp:TextBox ID="ddlHotel" runat="server" CssClass="TextBox" Text='<%# Eval("Hotel") %>' ReadOnly="true" />
                                    </td>
                                    <td style="width: 350px;">
                                        <asp:DropDownList ID="ddlCompName" runat="server" CssClass="TextBox" DataSourceID="dsSihotTourOp" 
                                            DataTextField="Company" DataValueField="centralID" SelectedValue='<%# Bind("CompanyCID") %>' />
                                    </td>
                                    <td style="width: 298px;">
                                        <asp:DropDownList ID="ddlTourOpID" runat="server" CssClass="TextBox" DataSourceID="dsSmartTourOpActive" 
                                            DataTextField="TourOp" DataValueField="TourOpID" SelectedValue='<%# Bind("TourOpID") %>' 
                                            AppendDataBoundItems="true" >
                                            <asp:ListItem Selected="True" Text="not mapped" Value="" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4"></td>
                                    <td >
                                        <div class="Red">
                                        <asp:LinkButton ID="btnConpany" runat="server" CausesValidation="false"
                                            Text="No SIHOT Company?" 
                                            OnClick="btnConpany_Click" />
                                        </div>
                    <asp:UpdatePanel ID="upNewCompany" runat="server">
                        <ContentTemplate>
                                        <asp:Panel ID="pnlNewCompany" runat="server" BackColor="White" Visible="false" style="padding: 5px;">
                                        <div class="GridLabelBG">
                                            <asp:Label ID="popTitle" runat="server" Text="SIHOT Company" SkinID="skGridLabel" />
                                        </div>
                                        <div class="GridBorder" style="text-align: left;">
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td style="width: 70px;">
                                                        <asp:Label ID="Label3" runat="server" Text="CentralID" />
                                                    </td>
                                                    <td style="width: 280px;">
                                                        <asp:TextBox ID="txtNewCentralID" runat="server" CssClass="TextBox" />
                                                        <asp:RequiredFieldValidator ID="req_txtNewCentralID" runat="server" ErrorMessage="This is required field!"
                                                            ControlToValidate="txtNewCentralID" Display="None" />
                                                        <asp:ValidatorCalloutExtender ID="ext_req_txtNewCentralID" runat="server" TargetControlID="req_txtNewCentralID"
                                                            HighlightCssClass="WaterMark" />
                                                        <asp:CompareValidator ID="int_txtNewCentralID" runat="server" ControlToValidate="txtNewCentralID"
                                                            ErrorMessage="Must input number" Operator="DataTypeCheck" Type="Integer" Display="None" />
                                                        <asp:ValidatorCalloutExtender ID="req_int_txtNewCentralID" runat="server" Enabled="True"
                                                            TargetControlID="int_txtNewCentralID" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 80px;">
                                                        <asp:Label ID="Label4" runat="server" Text="Name" />
                                                    </td>
                                                    <td style="width: 280px;">
                                                        <asp:TextBox ID="txtNewCompanyName" runat="server" CssClass="TextBox" />
                                                        <asp:RequiredFieldValidator ID="req_txtNewCompanyName" runat="server" ErrorMessage="This is required field!"
                                                            ControlToValidate="txtNewCompanyName" Display="None" />
                                                        <asp:ValidatorCalloutExtender ID="ext_req_txtNewCompanyName" runat="server" TargetControlID="req_txtNewCompanyName"
                                                            HighlightCssClass="WaterMark" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        <asp:Button ID="btCompanyInsert" runat="server" Text="Insert" SkinID="skBtnBase" Style="margin: 6px 3px 3px 3px;"
                                                            OnClick="btCompanyInsert_Click" />
                                                        <asp:Button ID="btCompanyCancel" runat="server" Text="Cancel" SkinID="skBtnBase" Style="margin: 6px 3px 3px 3px;"
                                                            OnClick="btCompanyCancel_Click" CausesValidation="false" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        </asp:Panel>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                                    </td>
                                    <td style="height: 30px; text-align: right; vertical-align: middle;">
                                        <asp:Button ID="UpdateButton" runat="server" CommandName="Insert" 
                                            Text="Insert" SkinID="skBtnBase" style="margin-right: 5px;" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" CausesValidation="False" 
                                            Text="Cancel" SkinID="skBtnBase" style="margin-right: 5px;" />
                                    </td>
                                </tr>
                            </table>

                        </InsertItemTemplate>
                        <ItemTemplate>
                            <div style="text-align: right; height: 30px; width: 1140px;" class="GridRow1B">
                                <asp:Button ID="NewButton" runat="server" CommandName="New" CausesValidation="False" 
                                    Text="New" SkinID="skBtnBase" style="margin-right: 5px; margin-top: 5px;" />
                            </div>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <div style="text-align: right; height: 30px; width: 1140px; vertical-align: middle;" class="GridRow1B">
                                <asp:Button ID="NewButton" runat="server" CommandName="New" CausesValidation="False" 
                                    Text="New" SkinID="skBtnBase" style="margin-right: 5px;" />
                            </div>
                        </EmptyDataTemplate>
                    </asp:FormView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                    <asp:UpdatePanel ID="upNew" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                        <ContentTemplate>
                    <asp:DataList ID="dlMatrix" runat="server" DataKeyField="MappID" DataSourceID="dsMatrix">
                        <HeaderTemplate>
                            <table cellpadding="0" cellspacing="0" style="border-collapse: collapse;">
                        </HeaderTemplate>
                        <ItemTemplate>
                                <tr style="height: 26px;">
                                    <td class="GridRow1B" style="width: 50px;">
                                        <asp:HiddenField ID="MappIDLabel" runat="server" Value='<%# Eval("MappID") %>' />
                                        <asp:TextBox ID="MarketIDLabel" runat="server" Text='<%# Eval("MarketID") %>' CssClass="TextBoxLabel" ReadOnly="false" />
                                    </td>
                                    <td class="GridRow1B" style="width: 70px;">
                                        <asp:TextBox ID="HotelCodeLabel" runat="server" Text='<%# Eval("HotelCode") %>' CssClass="TextBoxLabel" ReadOnly="false" />
                                    </td>
                                    <td class="GridRow1B" style="width: 70px;">
                                        <asp:TextBox ID="ComplexCodeLabel" runat="server" Text='<%# Eval("ComplexCode") %>' CssClass="TextBoxLabel" ReadOnly="false" />
                                    </td>
                                    <td class="GridRow1B" style="width: 300px;">
                                        <asp:TextBox ID="HotelLabel" runat="server" Text='<%# Eval("Hotel") %>' CssClass="TextBoxLabel" ReadOnly="false" />
                                    </td>
                                    <td class="GridRow1B" style="width: 350px;">
                                        <asp:TextBox ID="CompNameLabel" runat="server" Text='<%# Eval("CompanyCID","({0})") & " " & Eval("CompName") %>' CssClass="TextBoxLabel" ReadOnly="false" />
                                    </td>
                                    <td class="GridRow1B" style="width: 250px;">
                                        <asp:TextBox ID="TourOpLabel" runat="server" Text='<%# Eval("TourOp") %>' CssClass="TextBoxLabel" ReadOnly="false" />
                                    </td>
                                    <td class="GridRow1B" style="width: 50px; text-align: center;">
                                        <asp:ImageButton ID="btEdit" runat="server" ImageUrl="~/Images/edit_inline.gif" CssClass="ImgButton" 
                                            CommandName="Edit" Visible="false" />
                                        <asp:ImageButton ID="btDelete" runat="server" ImageUrl="~/Images/delete_inline.gif" CssClass="ImgButton" 
                                            CommandName="Delete" CommandArgument='<%# Eval("MappID") %>'
                                            OnClientClick="if (!confirm('Are you sure you want to delete this mapping?')) return false;" />
                                    </td>
                                </tr>
                        </ItemTemplate>
                        <EditItemTemplate>
                                <tr>
                                    <td class="GridRow1B" style="width: 50px;">
                                        <asp:DropDownList ID="ddlMarketID" runat="server" CssClass="TextBox"
                                            DataSourceID="dsSmartMarket" DataTextField="MarketID" DataValueField="MarketID" 
                                            SelectedValue='<%# Bind("MarketID") %>' />
                                    </td>
                                    <td class="GridRow1B" style="width: 70px;">
                                        <asp:TextBox ID="ddlHotelCode" runat="server" CssClass="TextBox" Text='<%# Bind("HotelCode") %>' ReadOnly="true" Width="65px"/>
                                        <asp:PopupControlExtender ID="popSihotMapp" runat="server" CommitProperty="Text" 
                                            PopupControlID="gvSihotMapp"
                                            TargetControlID="ddlHotelCode" 
                                            Position="Bottom">
                                        </asp:PopupControlExtender>
                                        <asp:GridView ID="gvSihotMapp" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                            DataKeyNames="HotelID,HOTEL-NO,COMPLEX-CODE,Hotel" DataSourceID="dsSihotHotelMap" GridLines="None"
                                            CssClass="ListGrid" 
                                            onselectedindexchanged="gvSihotMapp_SelectedIndexChanged" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="HOTEL-NO" SortExpression="HOTEL-NO">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="Label1" runat="server" Text='<%# Bind("[HOTEL-NO]") %>' CommandName="Select" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="70px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="COMPLEX-CODE" SortExpression="COMPLEX-CODE">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="Label2" runat="server" Text='<%# Bind("[COMPLEX-CODE]") %>' CommandName="Select" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="70px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Hotel" SortExpression="Hotel">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="Label3" runat="server" Text='<%# Bind("Hotel") %>' CommandName="Select" Width="300px" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="300px" />
                                                </asp:TemplateField>
                                            </Columns>
                                            <RowStyle CssClass="ListItem" />
                                        </asp:GridView>
                                    </td>
                                    <td class="GridRow1B" style="width: 70px;">
                                        <asp:TextBox ID="ddlComplexCode" runat="server" CssClass="TextBox" Text='<%# Bind("ComplexCode") %>' ReadOnly="true" Width="65px"/>
                                    </td>
                                    <td class="GridRow1B" style="width: 300px;">
                                        <asp:TextBox ID="ddlHotel" runat="server" CssClass="TextBox" Text='<%# Eval("Hotel") %>' ReadOnly="true" />
                                    </td>
                                    <td class="GridRow1B" style="width: 250px;">
                                        <asp:DropDownList ID="ddlCompName" runat="server" CssClass="TextBox" DataSourceID="dsSihotTourOp" 
                                            DataTextField="CompName" DataValueField="centralID" SelectedValue='<%# Bind("CompanyCID") %>' />
                                    </td>
                                    <td class="GridRow1B" style="width: 250px;">
                                        <asp:DropDownList ID="ddlTourOpID" runat="server" CssClass="TextBox" DataSourceID="dsSmartTourOp" 
                                            DataTextField="TourOp" DataValueField="TourOpID" SelectedValue='<%# Bind("TourOpID") %>' 
                                            AppendDataBoundItems="true" >
                                            <asp:ListItem Selected="True" Text="not mapped" Value="" />
                                        </asp:DropDownList>
                                    </td>
                                    <td class="GridRow1B" style="width: 50px;">
                                        <asp:ImageButton ID="btUpdate" runat="server" ImageUrl="~/Images/accept_inline.gif" CssClass="ImgButton" 
                                            CommandName="Update" />
                                        <asp:ImageButton ID="btCancel" runat="server" ImageUrl="~/Images/decline_inline.gif" CssClass="ImgButton" 
                                            CommandName="Cancel" CausesValidation="true" />
                                    </td>
                                </tr>
                        </EditItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:DataList>
                    
                    <uc:MessagePop ID="msgPop" runat="server" Title="SynXis Connected Tour Operators" />
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="fltMarketID" EventName="SelectedIndexChanged" />
                            <asp:AsyncPostBackTrigger ControlID="fltHotelCode" EventName="SelectedIndexChanged" />
                            <asp:AsyncPostBackTrigger ControlID="fltComplex" EventName="SelectedIndexChanged" />
                            <asp:AsyncPostBackTrigger ControlID="fltHotel" EventName="SelectedIndexChanged" />
                            <asp:AsyncPostBackTrigger ControlID="fltCompany" EventName="SelectedIndexChanged" />
                            <asp:AsyncPostBackTrigger ControlID="fltTourOp" EventName="SelectedIndexChanged" />
                            <asp:AsyncPostBackTrigger ControlID="fvMatrixNew" EventName="ItemInserted" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>



    </div>
    
    <asp:ObjectDataSource ID="dsMatrix" runat="server" DeleteMethod="DeleteQuery" 
        InsertMethod="InsertQuery" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataByFilter" 
        TypeName="dsCRSTableAdapters.crsConnectedMatrixTableAdapter" 
        UpdateMethod="UpdateQuery">
        <UpdateParameters>
            <asp:Parameter Name="MarketID" Type="String" />
            <asp:Parameter Name="HotelCode" Type="Int32" />
            <asp:Parameter Name="ComplexCode" Type="String" />
            <asp:Parameter Name="CompanyCID" Type="Int64" />
            <asp:Parameter Name="TourOpID" Type="Int32" />
            <asp:Parameter Name="ChangeUser" Type="String" />
            <asp:Parameter Name="MappID" Type="Int32" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="fltMarketID" Name="MarketID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="fltHotelCode" Name="HotelCode" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="fltComplex" Name="ComplexCode" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="fltTourOp" Name="TourOpID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="fltCompany" Name="CompanyCID" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="fltHotel" Name="HotelID" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsSmartMarket" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="dsCRSTableAdapters.SmartMarketTableAdapter"/>
    <asp:ObjectDataSource ID="dsSihotHotelMap" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="dsCRSTableAdapters.HotelMappingTableAdapter"/>
    <asp:ObjectDataSource ID="dsSihotTourOp" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="dsCRSTableAdapters.SihotCompaniesTableAdapter"/>
    <asp:ObjectDataSource ID="dsSmartTourOp" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="dsCRSTableAdapters.SmartTourOpTableAdapter"/>
    <asp:ObjectDataSource ID="dsSmartTourOpActive" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataActive" 
        TypeName="dsCRSTableAdapters.SmartTourOpTableAdapter"/>
    <asp:ObjectDataSource ID="dsSihotHotel" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="dsCRSTableAdapters.SihotHotelTableAdapter"/>
    <asp:ObjectDataSource ID="dsSmartHotel" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="dsCRSTableAdapters.SmartHotelTableAdapter"/>
    <asp:ObjectDataSource ID="dsSihotComplex" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="dsCRSTableAdapters.SihotComplexTableAdapter"/>
</asp:Content>

