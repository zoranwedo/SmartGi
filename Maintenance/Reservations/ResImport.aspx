<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Reservations/masterRes.master"
    AutoEventWireup="false" CodeFile="ResImport.aspx.vb" Inherits="Maintenance_Reservations_ResImport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Reservations Import
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ResContent" runat="Server">
    <asp:UpdatePanel runat="server" ID="updPanel">
        <ContentTemplate>
            <asp:HiddenField ID="dummy" runat="server" />
            <div class="Blue">
                <br />
                <table cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="GridLabelBG">
                            <asp:Label ID="lblCtrTitle" runat="server" Text="Import List" SkinID="skGridLabel"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="GridBorder">
                            <asp:GridView ID="gvDTSLog" runat="server" AutoGenerateColumns="False" DataSourceID="dsImportList"
                                SkinID="skGridView" DataKeyNames="import_uid">
                                <Columns>
                                    <asp:BoundField DataField="hotel" HeaderText="Hotel (mapping)" SortExpression="hotel">
                                        <ItemStyle Width="60px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="date_txt" HeaderText="Booking File Date" SortExpression="date_txt"
                                        DataFormatString="{0:d}">
                                        <ItemStyle Width="90px" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Status" SortExpression="status">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hfUID" runat="server" Value='<%# Eval("import_uid") %>' />
                                            <asp:DropDownList ID="cbStatus" runat="server" SelectedValue='<%# Bind("status") %>'
                                                CssClass="TextBox">
                                                <asp:ListItem Value="0">cancel</asp:ListItem>
                                                <asp:ListItem Value="1">don't import</asp:ListItem>
                                                <asp:ListItem Selected="True" Value="2">import</asp:ListItem>
                                                <asp:ListItem Value="3">delete</asp:ListItem>
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                        <ItemStyle Width="100px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Import File" SortExpression="filename">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPath" runat="server" Text='<%# Bind("filename") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="400px" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:FormView ID="fvDTSLog" runat="server" DataSourceID="dsImportList">
                                <InsertItemTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                        <tr>
                                            <td class="GridRow1T" style="width: 60px; height: 30px; padding-right: 2px;" valign="top">
                                                <asp:DropDownList ID="cbIHotel" runat="server" CssClass="TextBox" DataSourceID="dsHotel"
                                                    DataTextField="HotelHID" DataValueField="HotelHID" SelectedValue='<%# Bind("hotel") %>'>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="valRIHotel" runat="server" ControlToValidate="cbIHotel"
                                                    ErrorMessage="Field is required" SkinID="skRequired" />
                                                <asp:ValidatorCalloutExtender ID="calRIHotel" runat="server" TargetControlID="valRIHotel" />
                                            </td>
                                            <td class="GridRow1T" style="width: 90px; height: 30px; padding-right: 2px;" valign="top">
                                                <asp:TextBox ID="txtIDate" runat="server" Text='<%# Bind("date_txt") %>' CssClass="TextBox" />
                                                <asp:CalendarExtender ID="extIDate" runat="server" TargetControlID="txtIDate" />
                                                <asp:CompareValidator ID="valIDate" runat="server" Operator="DataTypeCheck" Type="Date"
                                                    ErrorMessage="Date input required!" ControlToValidate="txtIDate" Display="None" />
                                                <asp:ValidatorCalloutExtender ID="calIDate" runat="server" TargetControlID="valIDate" />
                                                <asp:RequiredFieldValidator ID="valRIDate" runat="server" ControlToValidate="txtIDate"
                                                    ErrorMessage="Field is required" SkinID="skRequired" />
                                                <asp:ValidatorCalloutExtender ID="calRIDate" runat="server" TargetControlID="valRIDate" />
                                            </td>
                                            <td class="GridRow1T" style="width: 100px; height: 30px; padding-right: 2px;" valign="top">
                                                <asp:DropDownList ID="cbIStatus" runat="server" CssClass="TextBox" Enabled="false">
                                                    <asp:ListItem Selected="True" Value="2">import</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td class="GridRow1T" style="width: 350px; height: 30px; padding-right: 2px;" valign="top">
                                                <asp:TextBox ID="txtIPath" runat="server" Text='<%# Bind("filename") %>' CssClass="TextBox" />
                                                <asp:RequiredFieldValidator ID="valRIPath" runat="server" ControlToValidate="txtIPath"
                                                    ErrorMessage="Field is required" SkinID="skRequired" />
                                                <asp:ValidatorCalloutExtender ID="calRIPath" runat="server" TargetControlID="valRIPath" />
                                            </td>
                                            <td class="GridRow1T" style="width: 50px; padding-left: 5px;">
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
                                            <td class="GridRow1T" style="width: 658px; height: 30px; padding-top: 5px;" valign="top"
                                                align="right">
                                                &nbsp;
                                                <asp:Button ID="btnImport" runat="server" Text="Import" OnClick="gvDTSLog_Import"
                                                    SkinID="skBtnBase" />
                                                &nbsp;
                                                <asp:Button ID="btnNew" runat="server" Text="New" CommandName="New" SkinID="skBtnBase" />
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <EmptyDataTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                        <tr>
                                            <td class="GridRow1T" style="width: 658px; height: 30px; padding-top: 5px;" valign="top"
                                                align="right">
                                                <asp:Button ID="btnNew" runat="server" Text="New" CommandName="New" SkinID="skBtnBase" />
                                            </td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                            </asp:FormView>
                            <asp:ObjectDataSource ID="dsHotel" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="dsDTSTableAdapters.HotelTableAdapter" />
                        </td>
                    </tr>
                </table>
                <asp:ObjectDataSource ID="dsImportList" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetData" TypeName="dsDTSTableAdapters.dtsImportListTableAdapter"
                    DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
                    <UpdateParameters>
                        <asp:Parameter Name="filename" Type="String" />
                        <asp:Parameter DbType="Guid" Name="import_uid" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="hotel" Type="String" />
                        <asp:Parameter Name="filename" Type="String" />
                        <asp:Parameter Name="date_txt" Type="DateTime" />
                    </InsertParameters>
                </asp:ObjectDataSource>
                <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
                    PopupDragHandleControlID="popLabel" CancelControlID="btnNo" DropShadow="True"
                    BackgroundCssClass="modalBackground" TargetControlID="dummy" X="200" Y="200">
                </asp:ModalPopupExtender>
                <asp:Panel ID="popPanel" runat="server" Width="300px" BackColor="White" Style="display: none">
                    <table cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                            <td class="GridLabelBG">
                                <asp:Label ID="popLabel" runat="server" Text="Delete Market" SkinID="skGridLabel"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="GridBorder">
                                <p style="text-align: center;">
                                    <asp:Label ID="popMessage" runat="server" Text="Message"></asp:Label>
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
                <asp:UpdateProgress ID="upImporting" runat="server">
                    <ProgressTemplate>
                        <asp:AlwaysVisibleControlExtender ID="ace" runat="server" TargetControlID="popImporting"
                            VerticalOffset="200" HorizontalOffset="100" />
                        <asp:Panel ID="popImporting" runat="server" BackColor="White">
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="GridLabelBG">
                                        <asp:Label ID="Label0" runat="server" Text="Importing" SkinID="skGridLabel"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="GridBorder" style="border-bottom-style: none">
                                        <asp:Panel ID="Panel0" runat="server" Width="600px" Height="300px">
                                            <br />
                                            &nbsp;&nbsp;
                                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/status_anim.gif" />&nbsp;Importing...</asp:Panel>
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
                <asp:ModalPopupExtender ID="modImport" runat="server" PopupControlID="popImport"
                    PopupDragHandleControlID="Label1" CancelControlID="btnOK" DropShadow="True" BackgroundCssClass="modalBackground"
                    TargetControlID="Panel1" X="100" Y="200">
                </asp:ModalPopupExtender>
                <asp:Panel ID="popImport" runat="server" BackColor="White" Style="display: none">
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td class="GridLabelBG">
                                <asp:Label ID="Label1" runat="server" Text="Import report" SkinID="skGridLabel"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="GridBorder" style="border-bottom-style: none">
                                <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto" Width="600px" Height="300px"
                                    Wrap="false">
                                    <asp:Label ID="lblImportRep" runat="server" Text="Importing"></asp:Label>
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
            <div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
