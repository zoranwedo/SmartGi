<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ProFormCharge.aspx.vb" Inherits="Proforma_ProFormCharge" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>

    <script language="javascript" type="text/javascript">
        function cancel() {
            window.parent.document.getElementById('dumyChargeClose').click();
        }
    </script>

</head>
<body>
    <form id="form_C" runat="server">
    <asp:ToolkitScriptManager ID="tkScriptManager" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true" />
    <div class="Green" style="background-color: Transparent; vertical-align: bottom; width: 524px;">
        <div class="GridLabelBG" style="overflow: hidden;">
            <asp:ImageButton ID="ibRatesClose" runat="server" CausesValidation="False" CssClass="InvButton" 
                style="float: right; background: white; border-radius: 10px; margin: 3px;" 
                ImageUrl="~/Images/cancel_big.gif" OnClientClick="cancel();" />
            <asp:Label ID="lblTitle" runat="server" Text="Proforma Charge" CssClass="GridLabel" Height="26px" />
        </div>
        <asp:Panel ID="pnlCharge" runat="server" Style="table-layout: fixed;">
            <div style="table-layout: fixed; overflow: visible; border: solid 2px; padding: 5px; background-color: White;">
                <asp:UpdatePanel ID="UpdatePanelPage" runat="server">
                    <ContentTemplate>
                        <asp:FormView ID="fvCharge" runat="server" DataKeyNames="InvDocID" DataSourceID="dsChargeStat">
                            <ItemTemplate>
                                <table cellpadding="0" cellspacing="0" style="background-color: White;">
                                    <tr>
                                        <td class="GridRow1B" style="width: 252px; text-align: right; font-weight: bold;">
                                            Amount Billed
                                        </td>
                                        <td class="GridRow1B" style="width: 102px; text-align: right;">
                                            <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount","{0:N2}") %>' />
                                        </td>
                                        <td class="GridRow1B" style="width: 154px; text-align: right;">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="GridRow1B" colspan="3" style="padding: 2px 0px 2px 0px;">
                                            <asp:GridView ID="gvCharge" runat="server" AutoGenerateColumns="False" DataKeyNames="InvDocID,ChargingID"
                                                DataSourceID="dsCharge" ShowHeader="False" SkinID="skGridView" OnRowDeleted="gvCharge_RowDeleted"
                                                OnRowUpdated="gvCharge_RowUpdated">
                                                <Columns>
                                                    <asp:BoundField DataField="ChargingID" HeaderText="ChargingID" InsertVisible="False"
                                                        ReadOnly="True" SortExpression="ChargingID" Visible="False" />
                                                    <asp:TemplateField HeaderText="DateText" SortExpression="DateText">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDateText" runat="server" Text='<%# Bind("DateText") %>' />
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtDateText" runat="server" CssClass="TextBox" Text='<%# Bind("DateText") %>' Style="text-align: right;" />
                                                        </EditItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Right" />
                                                        <ItemStyle HorizontalAlign="Right" Width="250px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("Amount", "{0:N2}") %>' />
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtAmount" runat="server" CssClass="TextBox" Text='<%# Bind("Amount") %>' Style="text-align: right;" />
                                                            <asp:RequiredFieldValidator ID="req_txtAmount" runat="server" Display="None" ErrorMessage="Required Field"
                                                                ControlToValidate="txtAmount" />
                                                            <asp:ValidatorCalloutExtender runat="server" ID="ext_req_txtAmount" TargetControlID="req_txtAmount" />
                                                            <asp:CompareValidator ID="cmp_txtAmount" runat="server" Display="None" Operator="DataTypeCheck"
                                                                ControlToValidate="txtAmount" Type="Double" ErrorMessage="Please enter a valid amount" />
                                                            <asp:ValidatorCalloutExtender runat="server" ID="exp_cmp_txtAmount" TargetControlID="cmp_txtAmount" />
                                                        </EditItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Right" />
                                                        <ItemStyle HorizontalAlign="Right" Width="100px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField SortExpression="HotelText">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblHotelText" runat="server" Text='<%# Bind("HotelText") %>' Style="padding-left: 4px;" />
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:TextBox ID="txtHotelText" runat="server" CssClass="TextBox" Text='<%# Bind("HotelText") %>' />
                                                        </EditItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="100px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ShowHeader="False">
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="btnEdit" runat="server" CausesValidation="False" CssClass="ImgButton"
                                                                ImageUrl="~/Images/edit_inline.gif" CommandName="Edit" />
                                                            <asp:ImageButton ID="btnDel" runat="server" CausesValidation="False" CssClass="ImgButton"
                                                                ImageUrl="~/Images/delete_inline.gif" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this charge?');" />
                                                        </ItemTemplate>
                                                        <EditItemTemplate>
                                                            <asp:ImageButton ID="btnUpdate" runat="server" CausesValidation="True" CssClass="ImgButton"
                                                                ImageUrl="~/Images/accept_inline.gif" CommandName="Update" />
                                                            <asp:ImageButton ID="btnCancel" runat="server" CausesValidation="False" CssClass="ImgButton"
                                                                ImageUrl="~/Images/decline_inline.gif" CommandName="Cancel" />
                                                        </EditItemTemplate>
                                                        <ItemStyle Width="50px" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="GridRow1B" style="text-align: right; font-weight: bold;">
                                            <asp:Label ID="Label2" runat="server" Text='<%# TotalSign(Eval("Total")) %>' />
                                        </td>
                                        <td class="GridRow1B" style="text-align: right;">
                                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("Total","{0:N2}") %>' />
                                        </td>
                                        <td class="GridRow1B" style="text-align: right;">
                                            <asp:LinkButton ID="lbAdd" runat="server" Text="Add" CommandName="Edit" />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <table cellpadding="0" cellspacing="0" style="background-color: White;">
                                    <tr>
                                        <td class="GridRow1B" style="width: 252px; text-align: right; font-weight: bold;">
                                            Amount Billed
                                        </td>
                                        <td class="GridRow1B" style="width: 102px; text-align: right;">
                                            <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount","{0:N2}") %>' />
                                        </td>
                                        <td class="GridRow1B" colspan="2" style="text-align: right;">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="GridRow1B" colspan="4" style="padding: 2px 0px 2px 0px;">
                                            <asp:GridView ID="gvCharge" runat="server" AutoGenerateColumns="False" DataKeyNames="InvDocID,ChargingID"
                                                DataSourceID="dsCharge" ShowHeader="False" SkinID="skGridView">
                                                <Columns>
                                                    <asp:BoundField DataField="ChargingID" HeaderText="ChargingID" InsertVisible="False"
                                                        ReadOnly="True" SortExpression="ChargingID" Visible="False" />
                                                    <asp:TemplateField HeaderText="DateText" SortExpression="DateText">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDateText" runat="server" Text='<%# Bind("DateText") %>' />
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Right" />
                                                        <ItemStyle HorizontalAlign="Right" Width="250px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("Amount", "{0:N2}") %>' />
                                                        </ItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Right" />
                                                        <ItemStyle HorizontalAlign="Right" Width="100px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField SortExpression="HotelText">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblHotelText" runat="server" Text='<%# Bind("HotelText") %>' Style="padding-left: 4px;" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="100px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField ShowHeader="False">
                                                        <ItemTemplate>
                                                            &nbsp;
                                                        </ItemTemplate>
                                                        <ItemStyle Width="50px" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="GridRow1B">
                                            <asp:TextBox ID="insDateText" runat="server" CssClass="TextBox" Style="text-align: right;" />
                                        </td>
                                        <td class="GridRow1B">
                                            <asp:TextBox ID="insAmount" runat="server" CssClass="TextBox" Style="text-align: right;" />
                                            <asp:RequiredFieldValidator ID="req_insAmount" runat="server" Display="None" ErrorMessage="Required Field"
                                                ControlToValidate="insAmount" />
                                            <asp:ValidatorCalloutExtender runat="server" ID="ext_req_insAmount" TargetControlID="req_insAmount" />
                                            <asp:CompareValidator ID="cmp_insAmount" runat="server" Display="None" Operator="DataTypeCheck"
                                                ControlToValidate="insAmount" Type="Double" ErrorMessage="Please enter a valid amount" />
                                            <asp:ValidatorCalloutExtender runat="server" ID="exp_cmp_insAmount" TargetControlID="cmp_insAmount" />
                                        </td>
                                        <td class="GridRow1B" style="width: 102px;">
                                            <asp:TextBox ID="insHotelText" runat="server" CssClass="TextBox" />
                                        </td>
                                        <td class="GridRow1B" style="width: 52px; text-align: left;">
                                            <asp:ImageButton ID="InsUpdate" runat="server" CausesValidation="True" CssClass="ImgButton"
                                                ImageUrl="~/Images/accept_inline.gif" CommandName="AddNew" />
                                            <asp:ImageButton ID="InsCancel" runat="server" CausesValidation="False" CssClass="ImgButton"
                                                ImageUrl="~/Images/decline_inline.gif" CommandName="Cancel" />
                                        </td>
                                    </tr>
                                </table>
                            </EditItemTemplate>
                        </asp:FormView>
                        <asp:ObjectDataSource ID="dsChargeStat" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="dsProformaTableAdapters.InvDocumentChargeStatTableAdapter">
                            <SelectParameters>
                                <asp:QueryStringParameter DefaultValue="50" Name="InvDocID" QueryStringField="ProformaID" Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="dsCharge" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                            OldValuesParameterFormatString="original_{0}" TypeName="dsProformaTableAdapters.InvDocumentChargingTableAdapter"
                            SelectMethod="GetDataByID" UpdateMethod="Update">
                            <DeleteParameters>
                                <asp:Parameter Name="Original_InvDocID" Type="Int32" />
                                <asp:Parameter Name="Original_ChargingID" Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="DateText" Type="String" />
                                <asp:Parameter Name="Amount" Type="Decimal" />
                                <asp:Parameter Name="HotelText" Type="String" />
                                <asp:Parameter Name="Original_InvDocID" Type="Int32" />
                                <asp:Parameter Name="Original_ChargingID" Type="Int32" />
                            </UpdateParameters>
                            <SelectParameters>
                                <asp:QueryStringParameter Name="InvDocID" QueryStringField="ProformaID" Type="Int32" />
                            </SelectParameters>
                            <InsertParameters>
                                <asp:Parameter Name="InvDocID" Type="Int32" />
                                <asp:Parameter Name="DateText" Type="String" />
                                <asp:Parameter Name="Amount" Type="Decimal" />
                                <asp:Parameter Name="HotelText" Type="String" />
                            </InsertParameters>
                        </asp:ObjectDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <p style="width: 100%; text-align: right;">
                    <asp:Button ID="btnClose" runat="server" SkinID="skBtnBase" Text="Close" OnClientClick="cancel();" />
                </p>
            </div>
        </asp:Panel>
    </div>
    </form>
</body>
</html>
