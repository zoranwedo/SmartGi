<%@ Page Title="" Language="VB" MasterPageFile="~/Contracts/Special/masterFRSpecial.master" AutoEventWireup="false" CodeFile="FRSpecApplication.aspx.vb" Inherits="Contracts_Special_FRSpecApplication" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Free Rate Application
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="WizardContent" Runat="Server">
                 <div class="Green">
 
        <table cellpadding="0" cellspacing="0">
            <tr>
                <asp:Panel ID="PnlContract" runat="server" >
                    <td class="GridLabelBG" width="600px">
                        <asp:Label ID="Label2" runat="server" SkinID="skGridLabel">
                            Search/Filter
                            &nbsp;
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/collapse_.png" />
                        &nbsp;
                        </asp:Label>
                    </td>
                </asp:Panel>
            </tr>
            <tr>
                <td class="GridBorder" style="width: 541px">
                    <asp:Panel ID="Panel2" runat="server"  Width="763px">
                        <table cellpadding="0" cellspacing="0" >
                           <tr>
                                <td class="GridRow1B">
                                    Market
                                </td>
                                <td class="GridRow1B" style="width: 400px">
                                 <asp:DropDownList ID="ddlMarkets" runat="server" AppendDataBoundItems="True" 
                                        CssClass="TextBox" DataSourceID="ObjectDataSource1" DataTextField="Market" 
                                        DataValueField="MarketID" Width="400px" AutoPostBack="True">
                                        <asp:ListItem Selected="True" Value="">all markets</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete" 
                                        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                                        SelectMethod="GetData" TypeName="TourOperTableAdapters.MarketTableAdapter" 
                                        UpdateMethod="Update">
                                        <DeleteParameters>
                                            <asp:Parameter Name="Original_MarketID" Type="String" />
                                        </DeleteParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="Market" Type="String" />
                                            <asp:Parameter Name="Original_MarketID" Type="String" />
                                        </UpdateParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="MarketID" Type="String" />
                                            <asp:Parameter Name="Market" Type="String" />
                                        </InsertParameters>
                                    </asp:ObjectDataSource>
                                </td>
                               
                           </tr>
                           <tr>
                                <td class="GridRow1B">
                                    Tour Operator</td>
                                <td class="GridRow1B" style="width: 400px">
                                    <asp:DropDownList ID="ddlTO" runat="server" CssClass="TextBox"
                                        DataSourceID="dsUserTO"
                                        DataTextField="TourOp" DataValueField="TourOpID" 
                                        AppendDataBoundItems="True" Width="400px" >
                                        <asp:ListItem Selected="True" Value="">all TO</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="dsUserTO" runat="server" OldValuesParameterFormatString="original_{0}" 
                                        SelectMethod="GetDataByMarketID" 
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
                                            <asp:ControlParameter ControlID="ddlMarkets" Name="MarketId" 
                                                PropertyName="SelectedValue" Type="String" />
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
                                </td>
                           </tr>
                             <tr>
                                <td class="GridRowClear"></td>
                                <td class="GridRowClear" style="width: 400px">
                                </td>
                                <td class="GridRowClear"></td>
                            </tr>
                            <tr>
                                <td colspan="2" class="ComandRow2T">
                                    <asp:Button ID="Button3" runat="server" SkinID="skBtnFilter"/>&nbsp;
                                    <asp:Button ID="Button4" runat="server" SkinID="skBtnClear"/>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            
        </table>

    </div>
        <br />
        <div class = "Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lbHotels" runat="server" Text="Available Tour Operators" 
                        SkinID="skGridLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvContracts" runat="server" DataKeyNames="ContractID"
                                  SkinID="skGridView" AutoGenerateColumns="False" 
                        AllowPaging="True" SelectedIndex="0" ShowFooter="True" 
                        DataSourceID="dsFilteredContracts">
                        <RowStyle Wrap="False" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbSel" runat="server" />
                                    <asp:MutuallyExclusiveCheckBoxExtender ID="cbSel_MutuallyExclusiveCheckBoxExtender" 
                                        runat="server" Enabled="True" Key="" TargetControlID="cbSel">
                                    </asp:MutuallyExclusiveCheckBoxExtender>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:Button ID="btnAttachAll" runat="server" onclick="btnAttachAll_Click" 
                                        SkinID="skBtnBase" Text="Attach" />
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField SortExpression="ContractID">
                                <ItemTemplate>
                                    (<asp:Label ID="txtContID" runat="server" Text='<%# Eval("ContractID") %>'></asp:Label>)
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ContractID") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemStyle HorizontalAlign="Right" Width="50px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="RateCodeId" SortExpression="RateCodeId">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("RateCodeId") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="txtRateCodeID" runat="server" Text='<%# Eval("RateCodeId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="350px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MarketId" HeaderText="Market" 
                                SortExpression="MarketId">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Hotel" SortExpression="Hotel">
                                <ItemTemplate>
                                    (<asp:Label ID="Label1" runat="server" Text='<%# Eval("HotelId") %>'></asp:Label>)
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Hotel") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Hotel") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="200px" />
                            </asp:TemplateField>
                            <asp:TemplateField SortExpression="TourOpId">
                                <ItemTemplate>
                                    (<asp:Label ID="txtTO" runat="server" Text='<%# Eval("TourOpId") %>'></asp:Label>)
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("TourOpId") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemStyle Width="20px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="TourOp" HeaderText="Tour Operator" 
                                SortExpression="TourOpId">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="200px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Start" DataFormatString="{0:MM/dd/yyyy}" 
                                HeaderText="Start" HtmlEncode="False" SortExpression="Start">
                            <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Finish" DataFormatString="{0:MM/dd/yyyy}" 
                                HeaderText="End" HtmlEncode="False" SortExpression="Finish">
                            <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Commision" HeaderText="Commision" 
                                SortExpression="Commision" Visible="False" />
                            <asp:BoundField DataField="Description" HeaderText="Description" 
                                SortExpression="Description" Visible="False" />
                            <asp:BoundField DataField="StateId" HeaderText="StateId" 
                                SortExpression="StateId" Visible="False" />
                            <asp:BoundField DataField="Commision" HeaderText="Commision" 
                                SortExpression="Commision" Visible="False" />
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="dsFilteredContracts" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByTO" 
                        TypeName="dsSpecialTableAdapters.SelectContract4SpecialFullTableAdapter">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hfUsername" Name="UserName" 
                                PropertyName="Value" Type="String" />
                            <asp:QueryStringParameter Name="SpecialID" QueryStringField="SpecialID" 
                                Type="Int32" />
                            <asp:ControlParameter ControlID="ddlTO" Name="TourOpId" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
        <br />
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblAttach" runat="server" Text="Attached Tour Operators" 
                        SkinID="skGridLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvAttached" runat="server" DataKeyNames="ContractID"
                                  SkinID="skGridView" AutoGenerateColumns="False" 
                        AllowPaging="True" SelectedIndex="0" ShowFooter="True" 
                        DataSourceID="dsAttachCnt">
                        <RowStyle Wrap="False" />
                        <Columns>
                            <asp:CommandField ShowEditButton="True" Visible="False" />
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                        CommandName="Delete" 
                                        onclientclick="return confirm('Are you sure you want to deattach contract')" 
                                        Text="Deattach"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField SortExpression="ContractID">
                                <ItemTemplate>
                                    (<asp:Label ID="txtContID" runat="server" Text='<%# Bind("ContractID") %>'></asp:Label>)
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ContractID") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemStyle HorizontalAlign="Right" Width="50px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" 
                                ReadOnly="True">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="350px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" 
                                ReadOnly="True">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="MarketId" HeaderText="Market" 
                                SortExpression="MarketId" ReadOnly="True">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Hotel" SortExpression="Hotel">
                                <ItemTemplate>
                                    (<asp:Label ID="Label1" runat="server" Text='<%# Eval("HotelId") %>'></asp:Label>)
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Hotel") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Hotel") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="200px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tour Operator" SortExpression="TourOpId">
                                <ItemTemplate>
                                    (<asp:Label ID="txtTO" runat="server" Text='<%# Bind("TourOpId") %>'></asp:Label>)
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("TourOp") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TourOp") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="200px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Start" DataFormatString="{0:MM/dd/yyyy}" 
                                HeaderText="Start" HtmlEncode="False" SortExpression="Start" 
                                ReadOnly="True">
                            <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Finish" DataFormatString="{0:MM/dd/yyyy}" 
                                HeaderText="End" HtmlEncode="False" SortExpression="Finish" 
                                ReadOnly="True">
                            <ItemStyle Width="80px" />
                            </asp:BoundField>
                        </Columns>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:GridView>
                    <asp:ObjectDataSource ID="dsAttachCnt" runat="server" SelectMethod="GetData" 
                        TypeName="dsSpecialTableAdapters.ContractSpecialBySIDTableAdapter" 
                        DeleteMethod="DeleteQuery">
                        <DeleteParameters>
                            <asp:Parameter Name="ContractID" Type="Int32" />
                            <asp:QueryStringParameter Name="SpecialID" QueryStringField="SpecialID" 
                                Type="Int32" />
                        </DeleteParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="SpecialID" QueryStringField="SpecialID" 
                                Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
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

