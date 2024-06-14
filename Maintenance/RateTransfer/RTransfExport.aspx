<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/RateTransfer/masterRtTransf.master"
    AutoEventWireup="false" CodeFile="RTransfExport.aspx.vb" Inherits="Maintenance_RateTransfer_RTransfExport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Rate Export
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ProFormaContent" runat="Server">
    <br />
    <asp:UpdatePanel runat="server" ID="updPanel">
        <ContentTemplate>
            <div class="Blue">
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="GridLabelBG">
                            <asp:Label ID="lblInSection" runat="server" Text="Export For" SkinID="skGridLabel" />
                        </td>
                        <td style="width:25px;" rowspan="3"></td>
                        <td class="GridLabelBG">
                            <asp:Label ID="lblInSection0" runat="server" Text="Response From" SkinID="skGridLabel" />
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder" style="vertical-align: top;">
                            <asp:GridView ID="gvTransf" runat="server" SkinID="skGridView" AutoGenerateColumns="False"
                                DataSourceID="dsForExport" DataKeyNames="HotelEHID">
                                <Columns>
                                    <asp:TemplateField HeaderText="Hotel" SortExpression="HotelEHID">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("HotelEHID") %>' CssClass="TextBox"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="reqTextBox1" runat="server" ErrorMessage="This is required field!"
                                                ControlToValidate="TextBox1" Display="None" />
                                            <asp:ValidatorCalloutExtender ID="reqreqTextBox1" runat="server" TargetControlID="reqTextBox1"
                                                HighlightCssClass="WaterMark">
                                            </asp:ValidatorCalloutExtender>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("HotelEHID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="100px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Export" SortExpression="Respond">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Respond") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hfUID" runat="server" Value='<%# Eval("Export_UID") %>' />
                                            <asp:DropDownList ID="cbStatus" runat="server" CssClass="TextBox" 
                                                SelectedValue='<%# Bind("Respond") %>'>
                                                <asp:ListItem Value="">-</asp:ListItem>
                                                <asp:ListItem Value="-1">don&#39;t import</asp:ListItem>
                                                <asp:ListItem Value="0">import</asp:ListItem>
                                                <asp:ListItem Value="1">imported</asp:ListItem>
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                        <ItemStyle Width="100px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField InsertVisible="False" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="false" CommandName="Delete"
                                                ImageUrl="~/Images/delete_inline.gif" OnClientClick="return confirm('Are you sure you want to delete the record')" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            &nbsp;</EditItemTemplate>
                                        <ItemStyle Width="75px" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                        <tr class="GridRow1B">
                                            <td style="width: 200px; padding-right: 2px;">
                                                <b>Hotel</b>
                                            </td>
                                            <td style="width: 75px; padding-left: 5px;">
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                            </asp:GridView>
                            <asp:FormView ID="fvTransf" runat="server" DataKeyNames="Export_UID" DataSourceID="dsForExport">
                                <InsertItemTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                        <tr>
                                            <td style="width: 204px; height: 30px;">
                                                &nbsp;
                                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="TextBox" DataSourceID="dsHotel"
                                                    DataTextField="HotelEHID" DataValueField="HotelEHID" SelectedValue='<%# Bind("HotelEHID") %>'>
                                                </asp:DropDownList>
                                            </td>
                                            <td style="width: 75px; padding-left: 5px;">
                                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Insert"
                                                    ImageUrl="~/Images/accept_inline.gif" CssClass="ImgButton" />
                                                <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                                    ImageUrl="~/Images/decline_inline.gif" CssClass="ImgButton" />
                                            </td>
                                        </tr>
                                    </table>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                        <tr class="GridRow1T">
                                            <td style="width: 204px; height: 30px;">
                                                &nbsp;
                                            </td>
                                            <td style="width: 75px; padding-left: 5px; text-align: center;">
                                                <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <EmptyDataTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                        <tr class="GridRow1T">
                                            <td style="width: 204px; height: 30px;">
                                                &nbsp;
                                            </td>
                                            <td style="width: 75px; padding-left: 5px; text-align: center;">
                                                <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                            </asp:FormView>
                        </td>
                        <td class="GridBorder" style="vertical-align: top">
                            <asp:GridView ID="gvTransf0" runat="server" AutoGenerateColumns="False" 
                                DataKeyNames="HotelEHID" DataSourceID="dsNotResponse" SkinID="skGridView">
                                <Columns>
                                    <asp:TemplateField HeaderText="Hotel" SortExpression="HotelEHID">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox3" runat="server" CssClass="TextBox" 
                                                Text='<%# Bind("HotelEHID") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="reqTextBox2" runat="server" 
                                                ControlToValidate="TextBox1" Display="None" 
                                                ErrorMessage="This is required field!" />
                                            <asp:ValidatorCalloutExtender ID="reqreqTextBox2" runat="server" 
                                                HighlightCssClass="WaterMark" TargetControlID="reqTextBox1">
                                            </asp:ValidatorCalloutExtender>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("HotelEHID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="50px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ExportDate" DataFormatString="{0:d}" 
                                        HeaderText="Date" HtmlEncode="False" SortExpression="ExportDate" >
                                        <ItemStyle Width="80px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ExportOrd" HeaderText="Ord" 
                                        SortExpression="ExportOrd" >
                                        <ItemStyle Width="50px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ExportFile" HeaderText="File" 
                                        SortExpression="ExportFile">
                                        <ItemStyle Wrap="False" />
                                    </asp:BoundField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <table border="0" cellpadding="0" cellspacing="0" 
                                        style="border-style: None; border-collapse: collapse;">
                                        <tr class="GridRow1B">
                                            <td style="width: 200px; padding-right: 2px;">
                                                <b>Hotel</b>
                                            </td>
                                            <td style="width: 75px; padding-left: 5px;">
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 30px; text-align: right;">
                            <asp:Button ID="btnRun" runat="server" Text="Export" SkinID="skBtnBase" />&nbsp;
                        </td>
                        <td style="height: 30px; text-align: right;">
                            <asp:Button ID="btnRun0" runat="server" SkinID="skBtnBase" 
                                Text="Process Response" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:HiddenField ID="dummy" runat="server" />
                <asp:ObjectDataSource ID="dsForExport" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetForExport" 
                    TypeName="dsRateTransferTableAdapters.smart_PMS_ExportTableAdapter" 
                    DeleteMethod="Delete" InsertMethod="Insert" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_HotelEHID" Type="String" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="HotelEHID" Type="String" />
                        <asp:Parameter Name="ExportDate" Type="DateTime" />
                        <asp:Parameter Name="ExportOrd" Type="Int32" />
                        <asp:Parameter Name="ExportFile" Type="String" />
                        <asp:Parameter Name="Respond" Type="Int32" />
                        <asp:Parameter Name="Note" Type="String" />
                        <asp:Parameter DbType="Guid" Name="Original_Export_UID" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="HotelEHID" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsNotResponse" runat="server" 
                    DataObjectTypeName="System.Guid" DeleteMethod="Delete" InsertMethod="Insert" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetNotResponse" 
                    TypeName="dsRateTransferTableAdapters.smart_PMS_ExportTableAdapter" 
                    UpdateMethod="Update">
                    <UpdateParameters>
                        <asp:Parameter Name="HotelEHID" Type="String" />
                        <asp:Parameter DbType="Guid" Name="Original_Export_UID" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="HotelEHID" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="dsHotel" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="dsRateTransferTableAdapters.smartHotelTableAdapter">
                </asp:ObjectDataSource>
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
                                <p style="text-align: right;" class="GridRow1T">
                                    <br />
                                    <asp:Button ID="btnNo" runat="server" Text="OK" SkinID="skBtnBase" />&nbsp;
                                </p>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:UpdateProgress ID="upExporting" runat="server">
                    <ProgressTemplate>
                        <asp:AlwaysVisibleControlExtender ID="ace" runat="server" TargetControlID="popExporting"
                            VerticalOffset="200" HorizontalOffset="100" />
                        <asp:Panel ID="popExporting" runat="server" BackColor="White">
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="GridLabelBG">
                                        <asp:Label ID="lblProcess" runat="server" Text="Rate Transfer" SkinID="skGridLabel"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridBorder" style="border-bottom-style: none">
                                        <asp:Panel ID="Panel0" runat="server" Width="600px" Height="300px">
                                            <br />
                                            &nbsp;&nbsp;
                                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/status_anim.gif" />
                                            &nbsp;Processing...</asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridBorder" style="border-top-style: none; text-align: right;">
                                        <asp:Button ID="btnOK0" runat="server" Text="OK" SkinID="skBtnBase" Enabled="false" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <asp:ModalPopupExtender ID="modExport" runat="server" PopupControlID="popExport"
                    PopupDragHandleControlID="lblExport" CancelControlID="btnOK" DropShadow="True" BackgroundCssClass="modalBackground"
                    TargetControlID="popExport" X="100" Y="200">
                </asp:ModalPopupExtender>
                <asp:Panel ID="popExport" runat="server" BackColor="White" Style="display: none">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="GridLabelBG">
                                <asp:Label ID="lblExport" runat="server" Text="Import report" SkinID="skGridLabel"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="GridBorder" style="border-bottom-style: none">
                                <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto" Width="600px" Height="300px"
                                    Wrap="false">
                                    <asp:Label ID="lblImportRep" runat="server" Text="Exporting"></asp:Label>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td class="GridBorder" style="border-top-style: none; text-align: right;">
                                <asp:Button ID="btnOK" runat="server" Text="OK" SkinID="skBtnBase" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
