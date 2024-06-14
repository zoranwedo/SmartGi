<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ProFormStaySplit.aspx.vb" Inherits="Proforma_ProFormStaySplit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>

    <script language="javascript" type="text/javascript">
        function okay() {
            window.parent.document.getElementById('dumyRefresh').click();
        }
    </script>

</head>
<body>
    <form id="form_BS" runat="server">
    <asp:ToolkitScriptManager ID="tkScriptManager" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true" />
    <div class="Blue" style="background-color: Transparent; vertical-align: bottom; width: 546px;">
        <div class="GridLabelBG" style="overflow: hidden;">
            <asp:ImageButton ID="ibRatesClose" runat="server" CausesValidation="False" CssClass="InvButton" 
                style="float: right; background: white; border-radius: 10px; margin: 3px;" 
                ImageUrl="~/Images/cancel_big.gif" OnClientClick="okay();" />
            <asp:Label ID="lblTitle" runat="server" Text="Split Stay Detail" CssClass="GridLabel" Height="26px" />
        </div>
        <asp:Panel ID="pnlSplit" runat="server" Style="table-layout: fixed;">
            <div style="table-layout: fixed; overflow: visible; border: solid 2px; padding: 5px; background-color: White;">
                <asp:UpdatePanel ID="UpdatePanelPage" runat="server">
                    <ContentTemplate>
                        <asp:HiddenField ID="hfSplit" runat="server" Value="false" />
                        <asp:GridView ID="SplitGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="InvResID, Departure"
                            SkinID="skGridView" >
                            <EditRowStyle CssClass="SelectRow1B" />
                            <Columns>
                                <asp:TemplateField HeaderText="Rate Code">
                                    <ItemTemplate>
                                        <asp:HiddenField ID="hfResID" runat="server" Value='<%# Bind("InvResID") %>' />
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("RateCodeID") %>' ToolTip='<%# Eval("InvResID") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="150px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Arrival" >
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Arrival","{0:d}") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="80px" HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Departure" >
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Departure","{0:d}") %>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <table cellpadding="0" cellspacing="0" style="border-collapse: collapse; background-color: White;">
                                            <tr>
                                                <td rowspan="2" style="padding: 0px 4px 0px 4px;">
                                                    <asp:TextBox ID="txtDeparture" runat="server" Text='<%# Bind("Departure","{0:d}") %>' CssClass="TextBox"
                                                        Enabled="false" style="width: 80px; background-color: Transparent; text-align: center;" />
                                                </td>
                                                <td style="padding: 0px 3px 0px 3px;">
                                                    <asp:ImageButton ID="btnUp" runat="server" ImageUrl="~/Images/up.gif" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding: 0px 3px 0px 3px;">
                                                    <asp:ImageButton ID="btnDwn" runat="server" ImageUrl="~/Images/dwn.gif" />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:NumericUpDownExtender ID="NUD1" runat="server"
                                            TargetControlID="txtDeparture" 
                                            TargetButtonDownID="btnDwn"
                                            TargetButtonUpID="btnUp"
                                            Minimum="1"
                                            Maximum='<%# Eval("MaxTravelNights") %>'
                                            RefValues='<%# RefValues(Eval("Arrival"), Eval("MaxTravelNights")) %>' />
                                    </EditItemTemplate>
                                    <ItemStyle Width="110px" HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Amount" >
                                    <ItemTemplate>
                                        <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("Amount","{0:N2}") %>' />
                                    </ItemTemplate>
                                    <ItemStyle Width="80px" HorizontalAlign="Right" />
                                    <HeaderStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnSplit" runat="server" CssClass="ImgButton" ImageUrl="~/Images/unpublish_inline.gif" 
                                            CommandName="Split" CommandArgument='<%# Container.DataItemIndex%>' Visible='<%# Eval("TravelNights")>1 %>' />
                                        <asp:ImageButton ID="btnEdit" runat="server" CssClass="ImgButton" ImageUrl="~/Images/edit_inline.gif" 
                                            CommandName="Edit" Visible='<%# Not Eval("TheLast") %>' />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:ImageButton ID="btnUpdate" runat="server" CausesValidation="True" CssClass="ImgButton"
                                            ImageUrl="~/Images/accept_inline.gif" CommandName="Update" />
                                        <asp:ImageButton ID="btnCancel" runat="server" CausesValidation="False" CssClass="ImgButton"
                                            ImageUrl="~/Images/decline_inline.gif" CommandName="Cancel" />
                                    </EditItemTemplate>
                                    <ItemStyle Width="50px" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnDel" runat="server" CssClass="ImgButton" ImageUrl="~/Images/delete_inline.gif" 
                                            CommandName="Delete" Visible='<%# Not Eval("TheFirst") %>' 
                                            OnClientClick="return confirm('Are you sure you want to delete charge detail?');" />
                                    </ItemTemplate>
                                    <EditItemTemplate></EditItemTemplate>
                                    <ItemStyle Width="50px" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:Label ID="lblError" runat="server" ForeColor="Red" />
                    </ContentTemplate>
                </asp:UpdatePanel>
                <p style="width: 100%; text-align: right;">
                    <asp:Button ID="btnClose" runat="server" SkinID="skBtnBase" Text="Close" OnClientClick="okay();" />
                </p>
            </div>
        </asp:Panel>
    </div>
    <asp:ObjectDataSource ID="dsSplitTable" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="dsProformaTableAdapters.BookingSplitTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="BookingID" QueryStringField="BookingID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    </form>
</body>
</html>
