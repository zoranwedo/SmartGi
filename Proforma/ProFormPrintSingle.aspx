<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ProFormPrintSingle.aspx.vb" Inherits="Proforma_ProFormPrintSingle" %>

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
            <asp:Label ID="lblTitle" runat="server" Text="Single Proforma Print" CssClass="GridLabel" Height="26px" />
        </div>
        <div style="table-layout: fixed; overflow: visible; border: solid 2px; padding: 5px; background-color: White;">
            <div style="font-weight: bold;">
                Print Options
            </div>
            <div style="margin: 10px; padding: 5px 5px 5px 20px; border: solid 1px;">
                <asp:CheckBox ID="cbChSeparate" runat="server" Text="Separate Children" Checked="true" /><br />
                <%--<asp:CheckBox ID="cbExcludeCM" runat="server" Text="Exclude CM" Checked="true" /><br />--%>
                <asp:CheckBox ID="cbExcel" runat="server" Text="Print to Excel" Checked="true" />
            </div>
            <div style="margin: 10px; padding: 5px 5px 5px 20px; border: solid 1px;">
                <asp:CheckBox ID="cbCancelled" runat="server" Text="Print Cancelled" Checked="false" ToolTip="Show cancelled, not penalized reservations" /><br />
            </div>
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
    </div>
    </form>
</body>
</html>
