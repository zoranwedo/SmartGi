<%@ Page Title="" Language="VB" MasterPageFile="~/masterSMART.master" AutoEventWireup="false"
    CodeFile="RateType.aspx.vb" Inherits="Maintenance_RateType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Rate Types
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterContent" runat="Server">
    <div class="Blue">
        <br />
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblRateType" runat="server" Text="Rate Types" 
                        SkinID="skGridLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:GridView ID="gridRateTypes" runat="server" SkinID="skGridView" AutoGenerateColumns="False"
                                DataSourceID="dsRateTypes" DataKeyNames="RateTypeID">
                                <Columns>
                                    <asp:BoundField DataField="RateTypeID" HeaderText="Code" ReadOnly="True" SortExpression="RateTypeID">
                                        <ItemStyle Width="50px" />
                                    </asp:BoundField>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="Up" runat="server" Height="8px" ImageUrl="~/Images/up.gif" Width="10px"
                                                CommandName="prUp" CommandArgument='<%# Eval("RateTypeID") %>' />
                                            &nbsp;
                                            <asp:ImageButton ID="Dwn" runat="server" Height="8px" ImageUrl="~/Images/dwn.gif"
                                                Width="10px" CommandName="prDwn" CommandArgument='<%# Eval("RateTypeID") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="50px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Type" SortExpression="RateType">
                                        <%--<EditItemTemplate>
                                            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="TextBox" SelectedValue='<%# Bind("RateType") %>'>
                                                <asp:ListItem Value="1">Special (SPO)</asp:ListItem>
                                                <asp:ListItem Value="2">Early Booking (EBB)</asp:ListItem>
                                                <asp:ListItem Value="3">Contracting (NET)</asp:ListItem>
                                            </asp:DropDownList>
                                        </EditItemTemplate>--%>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Visible='<%# Eval("RateType") = 1 %>'>Special (SPO)</asp:Label>
                                            <asp:Label ID="Label2" runat="server" Visible='<%# Eval("RateType") = 2 %>'>Early Booking (EBB)</asp:Label>
                                            <asp:Label ID="Label3" runat="server" Visible='<%# Eval("RateType") = 3 %>'>Contracting (NET)</asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle Width="200px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Priority" HeaderText="Priority" SortExpression="Priority" Visible="False" />
                                    <asp:BoundField DataField="RateSeq" HeaderText="RateSeq" SortExpression="RateSeq" Visible="False" />
                                    <asp:TemplateField HeaderText="PMS Code" SortExpression="RateTypeHID">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("RateTypeHID") %>' MaxLength="3" CssClass="TextBox" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="This is required field!"
                                                ControlToValidate="TextBox1" Display="None" />
                                            <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="RequiredFieldValidator1"
                                                HighlightCssClass="WaterMark">
                                            </asp:ValidatorCalloutExtender>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("RateTypeHID") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="80px" />
                                    </asp:TemplateField>
                                    <asp:CommandField CancelImageUrl="~/Images/decline_inline.gif" ShowEditButton="True"
                                        ButtonType="Image" EditImageUrl="~/Images/edit_inline.gif" 
                                        UpdateImageUrl="~/Images/accept_inline.gif">
                                        <ControlStyle CssClass="ImgButton" />
                                        <ItemStyle Width="50px" />
                                    </asp:CommandField>
                                    <asp:TemplateField InsertVisible="False" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="false" CommandName="Delete"
                                                ImageUrl="~/Images/delete_inline.gif" OnClientClick="return confirm('Are you sure you want to delete the record')" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            &nbsp;</EditItemTemplate>
                                        <ItemStyle Width="25px" />
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:GridView>
                            <asp:FormView ID="newRateType" runat="server" DataKeyNames="RateTypeID" DataSourceID="dsRateTypes">
                                <InsertItemTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                        <tr class="GridRow1T">
                                            <td style="width: 42px;">
                                                <asp:TextBox ID="RateCodeIDTextBox" runat="server" Text='<%# Bind("RateTypeID") %>'
                                                    CssClass="TextBox" MaxLength="6" />
                                                <asp:RequiredFieldValidator ID="reqRateID" runat="server" ErrorMessage="This is required field!"
                                                    ControlToValidate="RateCodeIDTextBox" Display="None" />
                                                <asp:ValidatorCalloutExtender ID="reqRateIDExt" runat="server" TargetControlID="reqRateID"
                                                    HighlightCssClass="WaterMark">
                                                </asp:ValidatorCalloutExtender>
                                            </td>
                                            <td style="width: 62px; height: 30px;">
                                                &nbsp;
                                            </td>
                                            <td style="width: 202px;">
                                                <asp:DropDownList ID="DropDownList1" runat="server" Width="200px" CssClass="TextBox"
                                                    SelectedValue='<%# Bind("RateType") %>'>
                                                    <asp:ListItem Value="1">Special (SPO)</asp:ListItem>
                                                    <asp:ListItem Value="2">Early Booking (EBB)</asp:ListItem>
                                                    <asp:ListItem Value="3">Contracting (NET)</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td style="width: 82px; text-align: right;">
                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("RateTypeHID") %>' MaxLength="3" CssClass="TextBox" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="This is required field!"
                                                    ControlToValidate="TextBox2" Display="None" />
                                                <asp:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="RequiredFieldValidator2"
                                                    HighlightCssClass="WaterMark">
                                                </asp:ValidatorCalloutExtender>
                                            </td>
                                            <td style="width: 73px; padding-left: 5px;">
                                                <asp:ImageButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                                    ImageUrl="~/Images/accept_inline.gif" />
                                                <asp:ImageButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                                    CommandName="Cancel" ImageUrl="~/Images/decline_inline.gif" />
                                            </td>
                                        </tr>
                                    </table>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                        <tr class="GridRow1T">
                                            <td style="width: 388px; height: 30px;">
                                                &nbsp;
                                            </td>
                                            <td style="width: 73px; padding-left: 5px;">
                                                <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <EmptyDataTemplate>
                                    <table cellpadding="0" cellspacing="0" border="0" style="border-style: None; border-collapse: collapse;">
                                        <tr class="GridRow1T">
                                            <td style="width: 388px; height: 30px;">
                                                &nbsp;
                                            </td>
                                            <td style="width: 73px; padding-left: 5px;">
                                                <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </EmptyDataTemplate>
                            </asp:FormView>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="gridRateTypes" EventName="RowCommand" />
                            <asp:AsyncPostBackTrigger ControlID="newRateType" EventName="ItemCommand" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </div>
    <asp:ObjectDataSource ID="dsRateTypes" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetBasicData" TypeName="dsMaintBasicTableAdapters.RateTypeTableAdapter"
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_RateTypeID" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="RateTypeHID" Type="String" />
            <asp:Parameter Name="Original_RateTypeID" Type="String" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="RateTypeID" Type="String" />
            <asp:Parameter Name="RateType" Type="Int16" />
            <asp:Parameter Name="Priority" Type="Int32" />
            <asp:Parameter Name="RateSeq" Type="Int32" />
            <asp:Parameter Name="RateTypeHID" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:HiddenField ID="dummy" runat="server" />
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
