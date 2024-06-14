<%@ Page Language="VB" MasterPageFile="~/Maintenance/InvExport/InvExport.master"
    AutoEventWireup="false" CodeFile="InvExportSetup.aspx.vb" Inherits="Maintenance_InvExport_InvExportSetup"
    Title="XML Invoice Export Setup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    XML Invoice Export Setup
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ExpContent" runat="Server">
    <div class="Blue">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblPath" runat="server" Text="XML Export Path" SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gridRoomTypes" runat="server" SkinID="skGridView" AutoGenerateColumns="False"
                        DataSourceID="dsInvoiceXML" DataKeyNames="InvoiceXmlExportID">
                        <Columns>
                            <asp:BoundField DataField="InvoiceXmlExportID" HeaderText="InvoiceXmlExportID" ReadOnly="True"
                                SortExpression="InvoiceXmlExportID" InsertVisible="False" Visible="False" />
                            <asp:BoundField DataField="InvoiceXmlExportPath" HeaderText="Export Path" SortExpression="InvoiceXmlExportPath">
                                <ControlStyle CssClass="TextBox" />
                                <ItemStyle Width="600px" />
                            </asp:BoundField>
                            <asp:CommandField ShowEditButton="True" EditImageUrl="~/Images/edit_inline.gif" UpdateImageUrl="~/Images/accept_inline.gif"
                                CancelImageUrl="~/Images/delete_inline.gif" ButtonType="Image" />
                        </Columns>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:GridView>
                    <asp:ObjectDataSource ID="dsInvoiceXML" runat="server" OldValuesParameterFormatString="original_{0}"
                        SelectMethod="GetData" TypeName="dsBavelTableAdapters.InvoiceXmlExportTableAdapter"
                        UpdateMethod="Update">
                        <UpdateParameters>
                            <asp:Parameter Name="InvoiceXmlExportPath" Type="String" />
                            <asp:Parameter Name="Original_InvoiceXmlExportID" Type="Int32" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
        <br />
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG" colspan="3">
                    <asp:Label ID="lblTTOO" runat="server" Text="Export For Tour Operators" SkinID="skGridLabel" />
                </td>
            </tr>
            <tr>
                <td class="GridBorder" style="height: 100px; vertical-align: top;">
                    <asp:GridView ID="gvTTOO" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="TourOpID" DataSourceID="dsTTOO" SkinID="skGridView">
                        <Columns>
                            <asp:BoundField DataField="TourOpID" ReadOnly="True" SortExpression="TourOpID">
                                <ItemStyle Width="60px" HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Tour Operator" SortExpression="TourOp">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("TourOp") %>' 
                                        NavigateUrl='<%# "~/Maintenance/TO/TODetail.aspx?TOID=" & Eval("TourOpID") %>' />
                                </ItemTemplate>
                                <ItemStyle Width="420px" Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="From Date" SortExpression="InvDate">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEdInvDate" runat="server" CssClass="TextBox" Text='<%# Bind("InvDate", "{0:d}") %>' />
                                    <asp:CompareValidator ID="cvEdInvDate" runat="server" ControlToValidate="txtEdInvDate"
                                        Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date" />
                                    <asp:ValidatorCalloutExtender ID="cvEdInvDate_ValidatorCalloutExtender" runat="server"
                                        Enabled="True" TargetControlID="cvEdInvDate" />
                                    <asp:CalendarExtender ID="txtInvDate_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="txtEdInvDate" CssClass="cal_Theme1" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblEdInvDate" runat="server" Text='<%# Eval("InvDate", "{0:d}") %>' />
                                </ItemTemplate>
                                <ItemStyle Width="90px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Single Booking" SortExpression="SingleBooking">
                                <EditItemTemplate>
                                    <asp:CheckBox ID="cbEdSingle" runat="server" Checked='<%# Bind("SingleBooking") %>' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbEdSingle" runat="server" Checked='<%# Eval("SingleBooking") %>' Enabled="false" />
                                </ItemTemplate>
                                <ItemStyle Width="70px" />
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Image" 
                                ShowEditButton="True"
                                EditImageUrl="~/Images/edit_inline.gif" 
                                UpdateImageUrl="~/Images/accept_inline.gif"
                                CancelImageUrl="~/Images/decline_inline.gif" >
                                <ItemStyle Width="50px" />
                                <ControlStyle CssClass="ImgButton" />
                            </asp:CommandField>
                            <asp:CommandField ButtonType="Image" 
                                ShowDeleteButton="True"
                                DeleteImageUrl="~/Images/delete_inline.gif" >
                                <ItemStyle Width="25px" />
                                <ControlStyle CssClass="ImgButton" />
                            </asp:CommandField>
                        </Columns>
                    </asp:GridView>

                    <asp:FormView ID="fvTTOO" runat="server" DataKeyNames="TourOpID" DataSourceID="dsTTOO">
                        <InsertItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="width: 62px;">
                                        &nbsp;
                                    </td>
                                    <td style="width: 422px;">
                                        <div>
                                            <asp:ObjectDataSource ID="dsDdTTOO" runat="server" OldValuesParameterFormatString="original_{0}"
                                                TypeName="dsBavelTableAdapters.TourOp4ExportTableAdapter" SelectMethod="GetAllData" />
                                            <asp:DropDownList ID="ddTTOO" runat="server" CssClass="TextBox" SelectedValue='<%# Bind("TourOpID") %>'
                                                DataSourceID="dsDdTTOO" DataTextField="TourOp" DataValueField="TourOpID" />
                                            <asp:ListSearchExtender ID="autoTTOO" runat="server" TargetControlID="ddTTOO" PromptText="Type to search TTOO"
                                                QueryPattern="StartsWith" PromptCssClass="WaterMark" IsSorted="True" />
                                        </div>
                                    </td>
                                    <td style="width: 92px;">
                                        <div>
                                            <asp:TextBox ID="txtInvDate" runat="server" CssClass="TextBox" Text='<%# Bind("InvDate") %>' />
                                            <asp:CompareValidator ID="cvInvDate" runat="server" ControlToValidate="txtInvDate"
                                                Display="None" ErrorMessage="Only date input" Operator="DataTypeCheck" Type="Date" />
                                            <asp:ValidatorCalloutExtender ID="cvInvDate_ValidatorCalloutExtender" runat="server"
                                                Enabled="True" TargetControlID="cvInvDate" />
                                            <asp:CalendarExtender ID="txtInvDate_CalendarExtender" runat="server" Enabled="True"
                                                TargetControlID="txtInvDate" CssClass="cal_Theme1" />
                                        </div>
                                    </td>
                                    <td style="width: 72px;">
                                        <asp:CheckBox ID="cbSingle" runat="server" Checked='<%# Bind("SingleBooking") %>' />
                                        <asp:HiddenField ID="hfGross" runat="server" Value='<%# Bind("GrossBilling") %>' />
                                        <asp:HiddenField ID="hfByCheckout" runat="server" Value='<%# Bind("ByCheckout") %>'/>
                                    </td> 
                                    <td style="width: 75px;">
                                        <asp:ImageButton ID="btInsert" runat="server" ImageUrl="~/Images/accept_inline.gif"
                                            CommandName="Insert" CssClass="ImgButton" />
                                        <asp:ImageButton ID="btCancel" runat="server" ImageUrl="~/Images/decline_inline.gif"
                                            CommandName="Cancel" CssClass="ImgButton" CausesValidation="false" />
                                    </td>
                                </tr>
                            </table>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="width: 643px;" >&nbsp;</td> 
                                    <td style="width: 77px; text-align: right; padding-top: 10px;" >
                                        <asp:Button ID="btNew" runat="server" Text="Add" SkinID="skBtnBase" CommandName="New" />
                                    </td> 
                                 </tr> 
                             </table> 
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="width: 643px;" >&nbsp;</td> 
                                    <td style="width: 77px; text-align: right;" >
                                        <asp:Button ID="btNew" runat="server" Text="Add" SkinID="skBtnBase" CommandName="New" />
                                    </td> 
                                 </tr> 
                             </table> 
                        </EmptyDataTemplate>
                    </asp:FormView>
                    
                    <asp:ObjectDataSource ID="dsTTOO" runat="server" OldValuesParameterFormatString="original_{0}"
                        TypeName="dsBavelTableAdapters.InvoiceXmlTourOpTableAdapter" SelectMethod="GetData"
                        DeleteMethod="DeleteQuery" InsertMethod="InsertQuery" 
                        UpdateMethod="UpdateQuery">
                        <DeleteParameters>
                            <asp:Parameter Name="TourOpID" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="InvDate" Type="String" />
                            <asp:Parameter Name="SingleBooking" Type="Boolean" />
                            <asp:Parameter Name="GrossBilling" Type="Boolean" />
                            <asp:Parameter Name="ByCheckout" Type="Boolean" />
                            <asp:Parameter Name="Original_TourOpID" Type="Int32" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="TourOpID" Type="Int32" />
                            <asp:Parameter Name="InvDate" Type="String" />
                            <asp:Parameter Name="SingleBooking" Type="Boolean" />
                            <asp:Parameter Name="GrossBilling" Type="Boolean" />
                            <asp:Parameter Name="ByCheckout" Type="Boolean" />
                        </InsertParameters>
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
                            <asp:Button ID="btnOK" runat="server" Text="OK" SkinID="skBtnBase" />
                            &nbsp;
                        </p>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
</asp:Content>
