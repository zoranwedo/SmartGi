<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/SihotMap/MapSihot.master" AutoEventWireup="false"
    CodeFile="MapHotel.aspx.vb" Inherits="Maintenance_SihotMap_MapHotel" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    SIHOT Hotel Mapping
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageContent" runat="Server">
    <div class="Green">
        <asp:CollapsiblePanelExtender ID="cpeSearch" runat="server" TargetControlID="pnSearch"
            CollapseControlID="lblFilter" ExpandControlID="lblFilter" ImageControlID="imgExpander"
            CollapsedImage="~/Images/expand_.png" ExpandedImage="~/Images/collapse_.png"
            Collapsed="False">
        </asp:CollapsiblePanelExtender>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <asp:Panel ID="pnSearchHead" runat="server">
                    <td class="GridLabelBG" style="width: 600px;">
                        <asp:Label ID="lblFilter" runat="server" SkinID="skGridLabel">Search/Filter &nbsp;
                            <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" />&nbsp; 
                        </asp:Label>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 600px;">
                    <asp:Panel ID="pnSearch" runat="server" CssClass="popupPanel" DefaultButton="btnFilter">
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="GridRowClear" style="width: 100px;">
                                    Name
                                </td>
                                <td class="GridRowClear" style="width: 500px;" colspan="2">
                                    <asp:TextBox ID="fltName" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="fltNameExt" runat="server" TargetControlID="fltName"
                                        WatermarkCssClass="WaterMark" WatermarkText="Hotel name (use % as wildchar)" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="ComandRow2T" style="width: 200px; height: 30px; padding-top: 5px; text-align: left;">
                                    <asp:CheckBox ID="fltActive" runat="server" Text="Show only active hotels" Checked="True" AutoPostBack="False" />
                                </td> 
                                <td class="ComandRow2T" style="height: 30px; padding-top: 5px">
                                    <asp:Button ID="btnFilter" runat="server" SkinID="skBtnFilter" />&nbsp;
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
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lbHotels" runat="server" Text="Hotels" SkinID="skGridLabel"> </asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvHotels" runat="server" DataSourceID="dsHotels" DataKeyNames="HotelID"
                        SkinID="skGridView" AutoGenerateColumns="False" EnableModelValidation="True">
                        <RowStyle Wrap="False" Height="30px" />
                        <Columns>
                            <asp:TemplateField HeaderText="A" >
                                <HeaderTemplate>
                                    <div style="text-align: center;">A</div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Eval("Active") %>' Enabled="false" />
                                </ItemTemplate>
                                <ItemStyle Width="30px" HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Hotel" >
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Hotel") %>' />
                                </ItemTemplate>
                                <ItemStyle Width="350px" />
                            </asp:TemplateField>
                            <asp:TemplateField >
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("HotelID","({0})&nbsp;") %>' />
                                </ItemTemplate>
                                <ItemStyle Width="50px" HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False" HeaderText="SIHOT:">
                                <EditItemTemplate>
                                    <asp:ImageButton ID="ibEditA0" runat="server" CausesValidation="False" Enabled="false"
                                        ImageUrl="~/Images/right_one_red.png" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="ibEditA1" runat="server" CausesValidation="False" ToolTip="Add mapping" 
                                        CommandName="Edit"
                                        ImageUrl="~/Images/right_one_red.png"
                                        Visible='<%# Eval("HOTEL_NO") Is DBNull.Value %>' />
                                    <asp:ImageButton ID="ibEditA2" runat="server" CausesValidation="False" Enabled="false"
                                        ImageUrl="~/Images/right_one_blue.png"
                                        Visible='<%# Eval("HOTEL_NO") IsNot DBNull.Value %>' />
                                </ItemTemplate>
                                <ItemStyle Width="50px" />
                                <ControlStyle CssClass="ImgButton" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="NO" >
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("HOTEL_NO") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtHOTEL_NO" runat="server" Text='<%# Bind("HOTEL_NO") %>' CssClass="TextBox" />
                                </EditItemTemplate>
                                <ItemStyle Width="50px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="COMPLEX">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("COMPLEX_CODE") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCOMPLEX_CODE" runat="server" Text='<%# Bind("COMPLEX_CODE") %>' CssClass="TextBox" />
                                </EditItemTemplate>
                                <ItemStyle Width="60px" />
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:ImageButton ID="ibUpdate" runat="server" CausesValidation="True"
                                        CommandName="AddMapping" CommandArgument='<%# Eval("HotelID") %>'
                                        ImageUrl="~/Images/accept_inline.gif" Text="Update" />&nbsp;
                                    <asp:ImageButton ID="ibCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                        ImageUrl="~/Images/decline_inline.gif" Text="Cancel" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="ibDelete" runat="server" CausesValidation="False" ToolTip="Remove mapping" 
                                        CommandName="RemoveMapping" CommandArgument='<%# Eval("HotelID") & "," & Eval("HOTEL_NO") & "," & Eval("COMPLEX_CODE") %>'
                                        OnClientClick="confirm('Are you sure you want to remove mapping?')"
                                        ImageUrl="~/Images/delete_inline.gif" Text="Split" 
                                        Visible='<%# Eval("HOTEL_NO") IsNot DBNull.Value %>' />
                                </ItemTemplate>
                                <ItemStyle Width="50px" HorizontalAlign="Right" />
                                <ControlStyle CssClass="ImgButton" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:FormView ID="fvHotel" runat="server" DataKeyNames="HotelID" 
                        DataSourceID="dsHotels">
                        <InsertItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr> 
                                    <td class="GridRowClear" style="width: 404px; height: 30px;" >
                                        <asp:DropDownList ID="cbHotel" runat="server" CssClass="TextBox" 
                                            DataSourceID="HotelList" DataTextField="Hotel" DataValueField="HotelID" 
                                            SelectedValue='<%# Bind("HotelID") %>'>
                                        </asp:DropDownList>
                                        <asp:ObjectDataSource ID="HotelList" runat="server" 
                                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetHotelsList" 
                                            TypeName="dsSIHOTTableAdapters.HotelMapTableAdapter"></asp:ObjectDataSource>
                                    </td> 
                                    <td class="GridRowClear" style="width: 52px; height: 30px;" >
                                        <asp:ImageButton ID="ibEditA0" runat="server" CausesValidation="False" Enabled="false"
                                            ImageUrl="~/Images/right_one_red.png" CssClass="ImgButton" />
                                    </td> 
                                    <td class="GridRowClear" style="width: 52px; height: 30px;" >
                                        <asp:TextBox ID="txtHOTEL_NO" runat="server" Text='<%# Bind("HOTEL_NO") %>' CssClass="TextBox" />
                                        <asp:RequiredFieldValidator ID="txtHOTEL_NO_Required" runat="server" ErrorMessage="Required field!" 
                                            Display="None" ControlToValidate="txtHOTEL_NO" />
                                        <asp:ValidatorCalloutExtender ID="txtHOTEL_NO_RequiredCallout" runat="server" TargetControlID="txtHOTEL_NO_Required" />
                                        <asp:CompareValidator ID="txtHOTEL_NO_Integer" runat="server" ControlToValidate="txtHOTEL_NO"
                                            Display="None" ErrorMessage="Number field!" Operator="DataTypeCheck" Type="Integer" />
                                        <asp:ValidatorCalloutExtender ID="txtHOTEL_NO_IntegerCallout" runat="server" TargetControlID="txtHOTEL_NO_Integer" />
                                    </td> 
                                    <td class="GridRowClear" style="width: 62px; height: 30px;" >
                                        <asp:TextBox ID="txtCOMPLEX_CODE" runat="server" Text='<%# Bind("COMPLEX_CODE") %>' CssClass="TextBox" />
                                    </td> 
                                    <td class="GridRowClear" style="width: 52px; height: 30px;" >
                                        <asp:ImageButton ID="ibUpdate" runat="server" CausesValidation="True"
                                            CommandName="AddMapping" ImageUrl="~/Images/accept_inline.gif" CssClass="ImgButton" />&nbsp;
                                        <asp:ImageButton ID="ibCancel" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" ImageUrl="~/Images/decline_inline.gif" CssClass="ImgButton" />
                                    </td> 
                                </tr>
                            </table>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr> 
                                    <td class="GridRowClear" style="width: 594px; text-align: right; padding-top: 5px;" >
                                        <asp:Button ID="btNew" runat="server" Text="New Hotel Mapping" SkinID="skBtnBase" CommandName="New" />
                                    </td> 
                                </tr>
                            </table>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr> 
                                    <td class="GridRowClear" style="width: 594px; text-align: right; padding-top: 5px;" >
                                        <asp:Button ID="btNew" runat="server" Text="New Hotel Mapping" SkinID="skBtnBase" CommandName="New" />
                                    </td> 
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                    </asp:FormView>
                </td>
            </tr>
        </table>
    </div>
    <asp:ObjectDataSource ID="dsHotels" runat="server" OldValuesParameterFormatString=""
        TypeName="dsSIHOTTableAdapters.HotelMapTableAdapter" 
        SelectMethod="Filter" >
        <SelectParameters>
            <asp:ControlParameter ControlID="fltActive" Name="Active" PropertyName="Checked" Type="Boolean" />
            <asp:ControlParameter ControlID="fltName" Name="Name" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>

    <asp:HiddenField ID="dummy" runat="server" />
    <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
        PopupDragHandleControlID="popLabel" CancelControlID="btnYes" DropShadow="True"
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
                        <asp:Label ID="popMessage" runat="server" Text="Message" />
                    </p>
                    <p style="text-align: right;" class="GridRow1T"><br />
                        <asp:Button ID="btnYes" runat="server" Text="OK" SkinID="skBtnBase" />&nbsp;
                    </p>
                </td>
            </tr>
        </table>
    </asp:Panel>
   
</asp:Content>
