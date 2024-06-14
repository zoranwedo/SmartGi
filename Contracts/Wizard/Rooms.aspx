<%@ Page Title="" Language="VB" MasterPageFile="~/Contracts/Wizard/masterWizard.master"
    AutoEventWireup="false" CodeFile="Rooms.aspx.vb" Inherits="Contracts_Wizard_Rooms" %>
    
 <%@ MasterType VirtualPath="~/Contracts/Wizard/masterWizard.master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Rooms
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="WizardContent" runat="Server">
    <div class="Red">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <table cellpadding="0" cellspacing="2px">
            <tr>
                <td class="GridLabelBG" colspan="2" style="width: 300px;">
                    <asp:Label ID="Label7" runat="server" SkinID="skGridLabel" Text="Contracted Rooms"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder" style="vertical-align: top; width: 100px">
                    <asp:GridView ID="gridRoom" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        DataSourceID="dsRooms" SkinID="skGridView" Width="100%" DataKeyNames="RoomTypeID,ContractID">
                        <Columns>
                            <asp:BoundField DataField="ContractID" HeaderText="ContractID" ReadOnly="True" SortExpression="ContractID"
                                Visible="False" />
                            <asp:TemplateField SortExpression="SelectedRT">
                                <HeaderTemplate>
                                    <asp:ImageButton ID="btnRoomToggle" runat="server" ImageUrl="~/Images/cbCheckedCursor2.png" 
                                        ToolTip="Toggle selection" OnClick="btnRoomToggle_Click" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbRoomSel" runat="server" Checked='<%# Bind("SelectedRT") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:CheckBox ID="cbRoomSel" runat="server" Checked='<%# Bind("SelectedRT") %>' />
                                </EditItemTemplate>
                                <ItemStyle Width="25px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="RoomTypeID" HeaderText="Room" ReadOnly="True" SortExpression="RoomTypeID">
                                <HeaderStyle Font-Bold="True" HorizontalAlign="Left" />
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                    <div style="padding-top: 5px; padding-bottom: 5px; text-align: right">
                        <asp:Button ID="btnUpdate0" runat="server" SkinID="skBtnBase" Text="Update" />
                     </div>
                       <asp:ObjectDataSource ID="dsRooms" runat="server" SelectMethod="GetData" TypeName="ContractsTableAdapters.SelectContractRoomTableAdapter"
                            UpdateMethod="ContractRoomUpdate">
                            <UpdateParameters>
                                <asp:QueryStringParameter Name="ContractID" QueryStringField="ContractID" Type="Int32" />
                                <asp:Parameter Name="RoomTypeId" Type="String" />
                                <asp:Parameter Name="SelectedRT" Type="Boolean" />
                            </UpdateParameters>
                            <SelectParameters>
                                <asp:QueryStringParameter Name="ContractID" QueryStringField="ContractID" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                </td>
                <td class="GridBorder" style="vertical-align: top;">
                    <asp:GridView ID="gvRooms" runat="server" SkinID="skGridView" DataSourceID="dsCntRooms"
                        SelectedIndex="0" DataKeyNames="RoomTypeId,ContractId,HotelId" AutoGenerateColumns="False"
                        ShowFooter="True">
                        <Columns>
                            <asp:CommandField SelectImageUrl="~/Images/select_.gif" ShowCancelButton="False"
                                ShowSelectButton="True" ButtonType="Image">
                                <ItemStyle Width="25px" />
                            </asp:CommandField>
                            <asp:BoundField DataField="RoomTypeId" HeaderText="Room" ReadOnly="True" SortExpression="RoomTypeId">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="50px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Discounts" SortExpression="DiscIsPercent">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="cbDiscType" runat="server" CssClass="TextBox" SelectedValue='<%# Bind("DiscIsPercent") %>'>
                                        <asp:ListItem Value="True">Percent</asp:ListItem>
                                        <asp:ListItem Value="False">Amount</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblDscPercent" runat="server" Text="Percent" Visible='<%# Eval("DiscIsPercent")%>' />
                                    <asp:Label ID="lblDscAmount" runat="server" Text="Amount" Visible='<%# not Eval("DiscIsPercent") %>' />
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DiscChld1" SortExpression="DiscChld1">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("DiscChld1") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="TextBox" Text='<%# Bind("DiscChld1") %>' />
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox1"
                                        Display="None" ErrorMessage="Number required." Operator="DataTypeCheck" Type="Double" />
                                    <asp:ValidatorCalloutExtender ID="cxCompareValidator1" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator1" />
                                </EditItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DiscChld2" SortExpression="DiscChld2">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("DiscChld2") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="TextBox" Text='<%# Bind("DiscChld2") %>' />
                                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="TextBox2"
                                        Display="None" ErrorMessage="Number required." Operator="DataTypeCheck" Type="Double" />
                                    <asp:ValidatorCalloutExtender ID="cxCompareValidator2" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator2" />
                                </EditItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DiscChld3" SortExpression="DiscChld3">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("DiscChld3") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" CssClass="TextBox" Text='<%# Bind("DiscChld3") %>' />
                                    <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="TextBox3"
                                        Display="None" ErrorMessage="Number required." Operator="DataTypeCheck" Type="Double" />
                                    <asp:ValidatorCalloutExtender ID="cxCompareValidator3" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator3" />
                                </EditItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DiscChld4" SortExpression="DiscChld4">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("DiscChld4") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" CssClass="TextBox" Text='<%# Bind("DiscChld4") %>' />
                                    <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="TextBox4"
                                        Display="None" ErrorMessage="Number required." Operator="DataTypeCheck" Type="Double" />
                                    <asp:ValidatorCalloutExtender ID="cxCompareValidator4" runat="server"
                                        Enabled="True" TargetControlID="CompareValidator4" />
                                </EditItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="MaxOcc" SortExpression="MaxOccupancy" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("MaxOccupancy") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" CssClass="TextBox" Text='<%# Bind("MaxOccupancy") %>' />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Note" SortExpression="Note" Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Note") %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" CssClass="TextBox" Text='<%# Bind("Note") %>' />
                                </EditItemTemplate>
                                <ControlStyle Width="150px" />
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="300px" />
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                        CommandName="Edit" ImageUrl="~/Images/edit_inline.gif" Text="Edit" 
                                        Visible="<%# Master.CanEdit() %>" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" 
                                        CommandName="Update" ImageUrl="~/Images/accept_inline.gif" Text="Update" />
                                    &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                        CommandName="Cancel" ImageUrl="~/Images/decline_inline.gif" Text="Cancel" />
                                </EditItemTemplate>
                                <ControlStyle CssClass="ImgButton" />
                                <ItemStyle Width="70px" />
                            </asp:TemplateField>
                        </Columns>
                        <SelectedRowStyle CssClass="SelectRow1TB" />
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:GridView>
                    <asp:ObjectDataSource ID="dsCntRooms" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ContractsTableAdapters.ContractRoomTableAdapter"
                        UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_ContractId" Type="Int32" />
                            <asp:Parameter Name="Original_HotelId" Type="Int32" />
                            <asp:Parameter Name="Original_RoomTypeId" Type="String" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="DiscIsPercent" Type="Boolean" />
                            <asp:Parameter Name="DiscChld1" Type="Decimal" />
                            <asp:Parameter Name="DiscChld2" Type="Decimal" />
                            <asp:Parameter Name="DiscChld3" Type="Decimal" />
                            <asp:Parameter Name="DiscChld4" Type="Decimal" />
                            <asp:Parameter Name="Note" Type="String" />
                            <asp:Parameter Name="Original_ContractId" Type="Int32" />
                            <asp:Parameter Name="Original_HotelId" Type="Int32" />
                            <asp:Parameter Name="Original_RoomTypeId" Type="String" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="ContractID" QueryStringField="ContractID" Type="Int32" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ContractId" Type="Int32" />
                            <asp:Parameter Name="HotelId" Type="Int32" />
                            <asp:Parameter Name="RoomTypeId" Type="String" />
                            <asp:Parameter Name="DiscIsPercent" Type="Boolean" />
                            <asp:Parameter Name="DiscChld1" Type="Decimal" />
                            <asp:Parameter Name="DiscChld2" Type="Decimal" />
                            <asp:Parameter Name="DiscChld3" Type="Decimal" />
                            <asp:Parameter Name="DiscChld4" Type="Decimal" />
                            <asp:Parameter Name="MaxOccupancy" Type="Int16" />
                            <asp:Parameter Name="Note" Type="String" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
        </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        <asp:UpdatePanel ID="updPanel" runat="server">
            <ContentTemplate>
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td style="width: 25px;">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/select_.gif" />
                        </td>
                        <td class="GridLabelBG">
                            <asp:Label ID="lblOccupancy" runat="server" SkinID="skGridLabel" Text="Occupancy For Selected Room"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td class="GridBorder" style="vertical-align: top;">
                            <asp:GridView ID="gvOccupancy" runat="server" AutoGenerateColumns="False" DataKeyNames="OccupancyID"
                                DataSourceID="dsRoomOccupancy" SkinID="skGridView">
                                <Columns>
                                    <asp:BoundField DataField="OccupancyID" HeaderText="OccupancyID" InsertVisible="False"
                                        ReadOnly="True" SortExpression="OccupancyID" Visible="False" />
                                    <asp:BoundField DataField="HotelId" HeaderText="HotelId" InsertVisible="False" ReadOnly="True"
                                        SortExpression="HotelId" Visible="False" />
                                    <asp:BoundField DataField="RoomTypeId" HeaderText="RoomTypeId" InsertVisible="False"
                                        ReadOnly="True" SortExpression="RoomTypeId" Visible="False" />
                                    <asp:BoundField DataField="Adult" HeaderText="Adult" SortExpression="Adult">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ControlStyle CssClass="TextBox" />
                                        <ItemStyle Width="50px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Chld1" HeaderText="Ch1" SortExpression="Chld1">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ControlStyle CssClass="TextBox" />
                                        <ItemStyle Width="50px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Chld2" HeaderText="Ch2" SortExpression="Chld2">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ControlStyle CssClass="TextBox" />
                                        <ItemStyle Width="50px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Chld3" HeaderText="Ch3" SortExpression="Chld3">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ControlStyle CssClass="TextBox" />
                                        <ItemStyle Width="50px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Chld4" HeaderText="Ch4" SortExpression="Chld4">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ControlStyle CssClass="TextBox" />
                                        <ItemStyle Width="50px" />
                                    </asp:BoundField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                                                CommandName="Edit" ImageUrl="~/Images/edit_inline.gif" Text="Edit" 
                                                Visible="<%# Master.CanEdit() %>" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" 
                                                CommandName="Update" ImageUrl="~/Images/accept_inline.gif" Text="Update" />
                                            &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                                                CommandName="Cancel" ImageUrl="~/Images/decline_inline.gif" Text="Cancel" />
                                        </EditItemTemplate>
                                        <ControlStyle CssClass="ImgButton" />
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" Width="50px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField InsertVisible="False" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="False" CommandName="Delete"
                                                ImageUrl="~/Images/delete_inline.gif" 
                                                OnClientClick="return confirm('Are you sure you want to delete the record')" 
                                                Visible="<%# Master.CanEdit() %>" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("HotelId") %>' />
                                            <asp:HiddenField ID="HiddenField2" runat="server" Value='<%# Bind("RoomTypeId") %>' />
                                        </EditItemTemplate>
                                        <ItemStyle Width="25px" />
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle Wrap="True" />
                            </asp:GridView>
                            <asp:FormView ID="fvOccupancy" runat="server" DataKeyNames="RoomTypeId" DataSourceID="dsRoomOccupancy">
                                <RowStyle HorizontalAlign="Right" />
                                <InsertItemTemplate>
                                    <table border="0" cellpadding="0" cellspacing="0" style="border-style: None; border-collapse: collapse;">
                                        <tr class="GridRow1T">
                                            <td>
                                                <asp:TextBox ID="AdultTextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Adult") %>'
                                                    Width="45px" />
                                                <asp:TextBox ID="Chld1TextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld1") %>'
                                                    Width="45px" />
                                                <asp:TextBox ID="Chld2TextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld2") %>'
                                                    Width="45px" />
                                                <asp:TextBox ID="Chld3TextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld3") %>'
                                                    Width="45px" />
                                                <asp:TextBox ID="Chld4TextBox" runat="server" CssClass="TextBox" Text='<%# Bind("Chld4") %>'
                                                    Width="45px" />
                                            </td>
                                            <td style="width: 75px; text-align: left;">
                                                <asp:ImageButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                                    CssClass="ImgButton" ImageUrl="~/Images/accept_inline.gif" />
                                                <asp:ImageButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                                    CommandName="Cancel" CssClass="ImgButton" ImageUrl="~/Images/decline_inline.gif" />
                                            </td>
                                        </tr>
                                    </table>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <table border="0" cellpadding="0" cellspacing="0" style="border-style: None; border-collapse: collapse;">
                                        <tr class="GridRow1T">
                                            <td style="height: 30px;">
                                                <asp:Label ID="lblEmpty" runat="server" Width="250px">&nbsp;</asp:Label>
                                            </td>
                                            <td style="width: 75px; padding-left: 5px;">
                                                <asp:Button ID="btnNew" runat="server" CommandName="New" SkinID="skBtnBase" 
                                                    Text="New" Visible="<%# Master.CanEdit() %>" />
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <EmptyDataTemplate>
                                    <table border="0" cellpadding="0" cellspacing="0" style="border-style: None; border-collapse: collapse;">
                                        <tr class="GridRow1T">
                                            <td style="height: 30px;">
                                                <asp:Label ID="lblEmpty" runat="server" Width="250px">&nbsp;</asp:Label>
                                            </td>
                                            <td style="width: 75px; padding-left: 5px;">
                                                <asp:Button ID="btnNew" runat="server" CommandName="New" SkinID="skBtnBase" Text="New" />
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                            </asp:FormView>
                            <asp:ObjectDataSource ID="dsRoomOccupancy" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                                OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByRoomID"
                                TypeName="ContractsTableAdapters.ContractRoomOccupancyTableAdapter" UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_OccupancyID" Type="Int32" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:QueryStringParameter Name="ContractId" QueryStringField="ContractID" Type="Int32" />
                                    <asp:Parameter Name="HotelId" Type="Int32" />
                                    <asp:Parameter Name="RoomTypeId" Type="String" />
                                    <asp:Parameter Name="Adult" Type="Int32" />
                                    <asp:Parameter Name="Chld1" Type="Int32" />
                                    <asp:Parameter Name="Chld2" Type="Int32" />
                                    <asp:Parameter Name="Chld3" Type="Int32" />
                                    <asp:Parameter Name="Chld4" Type="Int32" />
                                    <asp:Parameter Name="Original_OccupancyID" Type="Int32" />
                                </UpdateParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="gvRooms" DefaultValue="0" Name="RoomTypeID" PropertyName="SelectedValue"
                                        Type="String" />
                                    <asp:QueryStringParameter Name="ContractID" QueryStringField="ContractID" Type="Int32" />
                                </SelectParameters>
                                <InsertParameters>
                                    <asp:QueryStringParameter Name="ContractId" QueryStringField="ContractID" Type="Int32" />
                                    <asp:ControlParameter ControlID="gvRooms" Name="HotelId" PropertyName="SelectedDataKey(2)"
                                        Type="Int32" />
                                    <asp:ControlParameter ControlID="gvRooms" Name="RoomTypeId" PropertyName="SelectedValue"
                                        Type="String" />
                                    <asp:Parameter Name="Adult" Type="Int32" />
                                    <asp:Parameter Name="Chld1" Type="Int32" />
                                    <asp:Parameter Name="Chld2" Type="Int32" />
                                    <asp:Parameter Name="Chld3" Type="Int32" />
                                    <asp:Parameter Name="Chld4" Type="Int32" />
                                </InsertParameters>
                            </asp:ObjectDataSource>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
        <asp:HiddenField ID="dummy" runat="server" />
        <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
            PopupDragHandleControlID="popLabel" CancelControlID="btnNo" DropShadow="True"
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
                            <asp:Button ID="btnYes" runat="server" Text="Yes" SkinID="skBtnBase" />&nbsp;
                            <asp:Button ID="btnNo" runat="server" Text="No" SkinID="skBtnBase" />&nbsp;
                        </p>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
