<%@ Page Title="" Language="VB" MasterPageFile="~/Contracts/Special/Wizard/masterWizard.master"
    AutoEventWireup="false" CodeFile="Validate.aspx.vb" Inherits="Contracts_Special_Wizard_Validate" %>

<%@ MasterType VirtualPath="~/Contracts/Special/Wizard/masterWizard.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="Server">
    Validation
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="WizardContent" runat="Server">
    <div class="Red">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblMarket" runat="server" Text="Validation Report" SkinID="skGridLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <asp:GridView ID="gvValidate" runat="server" AutoGenerateColumns="False" DataSourceID="dsValidate"
                        SkinID="skGridView" ShowHeader="False">
                        <RowStyle Height="25px" />
                        <Columns>
                            <asp:TemplateField SortExpression="Valid">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Valid") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Error.gif" Visible='<%# Eval("Valid") = 0 %>' />
                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/Warning.gif" Visible='<%# Eval("Valid")=-1 %>' />
                                    <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/OK.gif" Visible='<%# Eval("Valid")=1 %>' />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="40px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="MsgText" SortExpression="MsgText">
                                <ItemStyle Width="700px" />
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <asp:ObjectDataSource ID="dsValidate" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="dsCtrPrevTableAdapters.ContractValidateTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="ContractID" QueryStringField="ContractID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:HiddenField ID="dummy" runat="server" />
        <br />
        <asp:CheckBox ID="cbActivate" runat="server" Checked="True" 
            Text="Activate Contract On Finish" Visible="False" />
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
