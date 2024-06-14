<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ProFormPrint.aspx.vb" Inherits="Proforma_ProFormPrint" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>

    <script language="javascript" type="text/javascript">
        function cancel() {
            window.parent.document.getElementById('dumyPrintClose').click();
        }
    </script>

</head>
<body>
    <form id="form_P" runat="server">
    <asp:ToolkitScriptManager ID="tkScriptManager" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true" />
    <asp:HiddenField ID="hfProforma" runat="server" />
    <div class="Green" style="background-color: Transparent; vertical-align: bottom; width: 330px;">
        <div class="GridLabelBG" style="overflow: hidden;">
            <asp:ImageButton ID="ibRatesClose" runat="server" CausesValidation="False" CssClass="InvButton" 
                style="float: right; background: white; border-radius: 10px; margin: 3px;" 
                ImageUrl="~/Images/cancel_big.gif" OnClientClick="cancel();" />
            <asp:Label ID="lblTitle" runat="server" Text="Proforma Print" CssClass="GridLabel" Height="26px" />
        </div>
        <asp:Panel ID="pnlCharge" runat="server" Style="table-layout: fixed;">
            <div style="table-layout: fixed; overflow: visible; border: solid 2px; padding: 5px; background-color: White;">
                <div style="font-weight: bold;">
                    Print Options
                </div>
                <div style="margin: 10px; padding: 5px 5px 5px 20px; border: solid 1px;">
                    <asp:CheckBox ID="cbCommision" runat="server" Text="Apply Commision" Checked="false" ToolTip="Apply commision percent to every charge" /><br />
                    <asp:CheckBox ID="cbCommision2" runat="server" Text="Add Commision" Checked="false" ToolTip="Add commision item on Proforma" /><br />
                    <asp:CheckBox ID="cbHotel" runat="server" Text="Hotel Proforma" Checked="false" ToolTip="Show hotel charges on Proforma" />
                    <asp:MutuallyExclusiveCheckboxExtender runat="server" ID="exCommision" TargetControlID="cbCommision" Key="Commision" />
                    <asp:MutuallyExclusiveCheckboxExtender runat="server" ID="exCommision2" TargetControlID="cbCommision2" Key="Commision" />
                    <asp:MutuallyExclusiveCheckboxExtender runat="server" ID="exHotel" TargetControlID="cbHotel" Key="Commision" />
                </div>
                <div style="margin: 10px; padding: 5px 5px 5px 20px; border: solid 1px;">
                    <asp:CheckBox ID="cbCancelled" runat="server" Text="Print Cancelled" Checked="false" ToolTip="Show cancelled, not penalized reservations" /><br />
                </div>
                <asp:Panel ID="pnlFlat" runat="server" Visible="false" style="margin: 10px; padding: 5px; border: solid 1px;" CssClass="Red" >
                    <b>This Proforma can't be printed on standard layout <br />as some of applied rates won't be presented.</b>
                    <div style="padding-left: 15px;">
                        <asp:RadioButton ID="rbStandard" runat="server" Text="Print Anyway" Checked="true" GroupName="Layout" /><br />
                        <asp:RadioButton ID="rbFlat" runat="server" Text="Flat Layout" Checked="false" GroupName="Layout" />
                    </div>
                </asp:Panel>
                <asp:Panel ID="pnlError" runat="server" Visible="false" style="margin: 5px; padding: 10px; border: solid 2px;" CssClass="Red" >
                    <asp:Label ID="lblError" runat="server" Text="Error:" Font-Bold="true" /><br />
                    <div style="padding-left: 10px;">
                        <asp:Label ID="lblErrMsg" runat="server" Text="" />
                    </div>
                </asp:Panel>
                <p style="width: 100%; text-align: right;">
                    <asp:Button ID="btnPrint" runat="server" SkinID="skBtnBase" Text="Print" OnClientClick="cancel();" />
                    <asp:Button ID="btnClose" runat="server" SkinID="skBtnBase" Text="Close" OnClientClick="cancel();" />
                </p>
            </div>
        </asp:Panel>
    </div>
    </form>
</body>
</html>
