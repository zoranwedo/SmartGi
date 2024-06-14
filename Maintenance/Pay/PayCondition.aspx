<%@ Page Title="" Language="VB" MasterPageFile="~/Maintenance/Pay/masterPay.master"
    AutoEventWireup="false" CodeFile="PayCondition.aspx.vb" Inherits="Maintenance_Pay_PayCondition" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Payment options
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PayContent" runat="Server">
    <asp:HiddenField ID="dummy" runat="server" />
    <div class="Blue">
        <br />
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblPayCond" runat="server" Text="Payment Condition" SkinID="skGridLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gridPayCond" runat="server" SkinID="skGridView" AllowSorting="True"
                        AutoGenerateColumns="False" DataKeyNames="PayCondID" DataSourceID="dsPayCond"
                        SelectedIndex="0">
                        <Columns>
                            <asp:CommandField SelectImageUrl="~/Images/select_.gif" ShowCancelButton="False"
                                ShowSelectButton="True" ButtonType="Image">
                                <ItemStyle Width="25px" />
                            </asp:CommandField>
                            <asp:TemplateField HeaderText="Code" SortExpression="PayCondID">
                                <EditItemTemplate>
                                        <asp:TextBox ID="PayCondIDField" runat="server" Text='<%# Bind("PayCondID") %>' Width="45px" CssClass="TextBox" MaxLength="4" />
                                        <asp:RequiredFieldValidator ID="reqCondIDField" runat="server" ErrorMessage="This is required field!" ControlToValidate="PayCondIDField" Display="None" />
                                        <asp:ValidatorCalloutExtender ID="reqCondIDFieldExt" runat="server" TargetControlID="reqCondIDField" HighlightCssClass="WaterMark" />
                                        <asp:RegularExpressionValidator ID="regCondIDField" runat="server" ControlToValidate ="PayCondIDField" ValidationExpression="\b(?:PP|CR)\w*\b"
                                            ErrorMessage="Code must start withh PP (for prepayment) and CR (for credit)" Display="None" />
                                        <asp:ValidatorCalloutExtender ID="regCondIDFieldExt" runat="server" TargetControlID="regCondIDField" HighlightCssClass="WaterMark" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("PayCondID") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="50px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="PayCond" HeaderText="Condition" SortExpression="PayCond">
                                <ControlStyle CssClass="TextBox" />
                                <ItemStyle Width="200px" />
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
                                        onclientclick="return confirm('Are you sure you want to delete the record')" />
                                </ItemTemplate>
                                <EditItemTemplate>&nbsp;</EditItemTemplate>
                                <ItemStyle Width="25px" />
                            </asp:TemplateField>
                        </Columns>
                        <SelectedRowStyle CssClass="SelectRow1B" />
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:GridView>
                    <asp:FormView ID="newPayCond" runat="server" DataKeyNames="PayCondID" DataSourceID="dsPayCond">
                        <InsertItemTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                <tr class="GridRowLast">
                                    <td style="width: 25px; height: 30px;">
                                        &nbsp;
                                    </td>
                                    <td style="width: 50px;">
                                        <asp:TextBox ID="PayCondIDTextBox" runat="server" Text='<%# Bind("PayCondID") %>' Width="45px" CssClass="TextBox" MaxLength="4" />
                                        <asp:RequiredFieldValidator ID="reqCondID" runat="server" ErrorMessage="This is required field!" ControlToValidate="PayCondIDTextBox" Display="None" />
                                        <asp:ValidatorCalloutExtender ID="reqCondIDExt" runat="server" TargetControlID="reqCondID" HighlightCssClass="WaterMark" />
                                        <asp:RegularExpressionValidator ID="regCondID" runat="server" ControlToValidate ="PayCondIDTextBox" ValidationExpression="\b(?:PP|CR)\w*\b"
                                            ErrorMessage="Code must start withh PP (for prepayment) and CR (for credit)" Display="None" />
                                        <asp:ValidatorCalloutExtender ID="regCondIDExt" runat="server" TargetControlID="regCondID" HighlightCssClass="WaterMark" />
                                    </td>
                                    <td style="width: 200px;">
                                        <asp:TextBox ID="PayCondTextBox" runat="server" Text='<%# Bind("PayCond") %>' CssClass="TextBox" />
                                        <asp:RequiredFieldValidator ID="reqCond" runat="server" ErrorMessage="This is required field!" ControlToValidate="PayCondTextBox" Display="None" />
                                        <asp:ValidatorCalloutExtender ID="reqCondExt" runat="server" TargetControlID="reqCond" HighlightCssClass="WaterMark"></asp:ValidatorCalloutExtender>
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
                                <tr class="GridRowLast">
                                    <td style="width: 275px; height: 30px;">
                                        &nbsp;
                                    </td>
                                    <td style="width: 75px; padding-left: 5px;">
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                <tr class="GridRowLast">
                                    <td style="width: 250px; height: 30px;">
                                        &nbsp;
                                    </td>
                                    <td style="width: 75px; padding-left: 5px;">
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                    </asp:FormView>
                    <asp:ObjectDataSource ID="dsPayCond" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataTrimmed" TypeName="dsMaintBasicTableAdapters.PayCondTableAdapter"
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
        </table>
    </div>
    <%#gridPayCond.SelectedValue%>
    <div class="Red">
        <br />
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 25px;">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/select_.gif" />
                </td>
                <td class="GridLabelBG">
                    <asp:Label ID="lblPayExtra" runat="server" Text="Pay Cond. Ext. for Selected Condition" SkinID="skGridLabel" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 25px;">
                    &nbsp;
                </td>
                <td class="GridBorder">
                    <asp:GridView ID="gridPayExtra" runat="server" SkinID="skGridView" AllowSorting="True"
                        AutoGenerateColumns="False" DataKeyNames="PayCondExtID" DataSourceID="dsPayExtra">
                        <Columns>
                            <asp:BoundField DataField="PayCondExtID" HeaderText="PayCondExtID" InsertVisible="False"
                                ReadOnly="True" SortExpression="PayCondExtID" Visible="false" />
                            <asp:BoundField DataField="PayCondId" HeaderText="PayCondId" SortExpression="PayCondId"
                                ReadOnly="True" Visible="false" />
                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description">
                                <ControlStyle CssClass="TextBox" />
                                <ItemStyle Width="250px" />
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
                                        onclientclick="return confirm('Are you sure you want to delete the record')" />
                                </ItemTemplate>
                                <EditItemTemplate>&nbsp;</EditItemTemplate>
                                <ItemStyle Width="25px" />
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:GridView>
                    <asp:FormView ID="newPayExtra" runat="server" DataKeyNames="PayCondExtID" DataSourceID="dsPayExtra">
                        <InsertItemTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                <tr class="GridRowLast">
                                    <td style="width: 250px; height: 30px;">
                                        <asp:TextBox ID="PayExtraTextBox" runat="server" Text='<%# Bind("Description") %>' CssClass="TextBox" />
                                        <asp:RequiredFieldValidator ID="reqExtra" runat="server" ErrorMessage="This is required field!" ControlToValidate="PayExtraTextBox" Display="None" />
                                        <asp:ValidatorCalloutExtender ID="reqExtraExt" runat="server" TargetControlID="reqExtra" HighlightCssClass="WaterMark"></asp:ValidatorCalloutExtender>
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
                                <tr class="GridRowLast">
                                    <td style="width: 250px; height: 30px;">
                                        &nbsp;
                                    </td>
                                    <td style="width: 75px; padding-left: 5px;">
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                <tr class="GridRowLast">
                                    <td style="width: 250px; height: 30px;">
                                        &nbsp;
                                    </td>
                                    <td style="width: 75px; padding-left: 5px;">
                                        <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                    </asp:FormView>
                    <asp:ObjectDataSource ID="dsPayExtra" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByPayCondID"
                        TypeName="dsMaintBasicTableAdapters.PayCondExtTableAdapter" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_PayCondExtID" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="PayCondId" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                            <asp:Parameter Name="Original_PayCondExtID" Type="Int32" />
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="gridPayCond" Name="PayCondId" PropertyName="SelectedValue"
                                Type="String" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:ControlParameter ControlID="gridPayCond" Name="PayCondId" 
                                PropertyName="SelectedValue" Type="String" />
                            <asp:Parameter Name="Description" Type="String" />
                        </InsertParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
        </table>
    </div>
    
    <asp:ModalPopupExtender ID="popExtender" runat="server" PopupControlID="popPanel"
        PopupDragHandleControlID="popLabel" CancelControlID="btnNo" DropShadow="True" 
        BackgroundCssClass="modalBackground" TargetControlID="dummy" X="200" Y="200">
    </asp:ModalPopupExtender>
    <asp:Panel ID="popPanel" runat="server" Width="300px" BackColor="White" Style="display: none">
        <table cellpadding="0" cellspacing="0" style="width: 100%;">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="popLabel" runat="server" Text="Delete data" SkinID="skGridLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <p style="text-align: center;">
                        <asp:Label ID="popMessage" runat="server" Text="Message"></asp:Label>
                    </p>
                    <p style="text-align: right;" class="FooterRow">
                        <br />
                        <asp:Button ID="btnYes" runat="server" Text="Yes" SkinID="skBtnBase" />&nbsp;
                        <asp:Button ID="btnNo" runat="server" Text="No" SkinID="skBtnBase" />&nbsp;
                    </p>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
