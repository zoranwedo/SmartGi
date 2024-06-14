<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Responsible.aspx.vb" Inherits="Accounting_Responsible" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="Green">
        <table cellpadding="0" cellspacing="0" style="border-style: None; border-collapse: collapse;">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="lblDep" runat="server" Text="Responsible" SkinID="skGridLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <table cellpadding="0" cellspacing="0" style="border-style: None; border-collapse: collapse;">
                        <tr style="height: 22px;">
                            <td class="GridRow2B">
                                Department
                            </td>
                            <td class="GridRow2B">
                                Employee
                            </td>
                            <td class="GridRow2B">
                                Amount
                            </td>
                            <td class="GridRow2B">
                                &nbsp;
                            </td>
                        </tr>
                        <tr style="height: 22px;">
                            <td class="GridRow1B" style="width: 250px;">
                                COBROS
                            </td>
                            <td class="GridRow1B" style="width: 250px;">
                                PAMELA MENDEZ
                            </td>
                            <td class="GridRow1B" style="width: 100px;">
                                5,008.00
                            </td>
                            <td class="GridRow1B" style="width: 75px; padding-left: 5px;">
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" CommandName="Insert"
                                    ImageUrl="~/Images/delete_inline.gif" CssClass="ImgButton" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="padding-top: 5px; margin-top: 2px; text-align: right;" class="GridRowClear">
                                <asp:Button ID="btnNew" runat="server" Text="New" SkinID="skBtnBase" CommandName="New" />&nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <br />
        <table cellpadding="0" cellspacing="0" style="border-style: None; border-collapse: collapse;">
            <tr>
                <td class="GridLabelBG">
                    <asp:Label ID="Label1" runat="server" Text="Responsible" SkinID="skGridLabel"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="GridBorder">
                    <table cellpadding="0" cellspacing="0" style="border-style: None; border-collapse: collapse;">
                        <tr style="height: 22px;">
                            <td class="GridRow2B">
                                Department
                            </td>
                            <td class="GridRow2B">
                                Employee
                            </td>
                            <td class="GridRow2B">
                                Amount
                            </td>
                            <td class="GridRow2B">
                                &nbsp;
                            </td>
                        </tr>
                        <tr style="height: 22px;">
                            <td class="GridRow1B" style="width: 250px;">
                                COBROS
                            </td>
                            <td class="GridRow1B" style="width: 250px;">
                                PAMELA MENDEZ
                            </td>
                            <td class="GridRow1B" style="width: 100px;">
                                5,008.00
                            </td>
                            <td class="GridRow1B" style="width: 75px; padding-left: 5px;">
                                <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="True" CommandName="Insert"
                                    ImageUrl="~/Images/delete_inline.gif" CssClass="ImgButton" />
                            </td>
                        </tr>
                        <tr style="height: 27px;">
                            <td class="GridRowClear" style="width: 150px;">
                                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="TextBox">
                                    <asp:ListItem Selected="True" Text="CUENTAS POR COBRAR" />
                                </asp:DropDownList>
                            </td>
                            <td class="GridRowClear" style="width: 150px;">
                                <asp:DropDownList ID="DropDownList3" runat="server" CssClass="TextBox">
                                    <asp:ListItem Selected="True" Text="SONIA IBARRA" />
                                </asp:DropDownList>
                            </td>
                            <td class="GridRowClear" style="width: 100px;">
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DepName") %>' CssClass="TextBox" />
                            </td>
                            <td class="GridRowClear" style="width: 75px; padding-left: 5px;">
                                <asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="True" CommandName="Insert"
                                    ImageUrl="~/Images/accept_inline.gif" CssClass="ImgButton" />
                                <asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" CommandName="Cancel"
                                    ImageUrl="~/Images/decline_inline.gif" CssClass="ImgButton" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div id="popFt2Apply" class="Blue" >
        <div class="GridBorder">
            <table id="gvFt2Apply" style="border-collapse: collapse;" cellspacing="0" border="0">
                <tbody>
                    <tr class="GridRowClear" align="left">
                        <td style="width: 15px;">
                            <input type="image" name="gvFt2Apply$ctl02$ImageButton1" id="gvFt2Apply_ctl02_ImageButton1"
                                text="Select" src="../Images/select_.gif" style="border-width: 0px;">
                        </td>
                        <td style="width: 120px;">
                            <a id="gvFt2Apply_ctl02_lbNewInvoice" title="878968" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;gvFt2Apply$ctl02$lbNewInvoice&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">
                                FT-RT 105479</a>
                        </td>
                        <td style="width: 150px;">
                            (2/21/2020 - 2/28/2020)
                        </td>
                        <td style="width: 80px; white-space: nowrap;" align="right">
                            697.87
                        </td>
                        <td style="width: 5px;">
                            &nbsp;
                        </td>
                    </tr>
                    <tr class="GridRowClear" align="left">
                        <td>
                            <input type="image" name="gvFt2Apply$ctl03$ImageButton1" id="gvFt2Apply_ctl03_ImageButton1"
                                text="Select" src="../Images/select_.gif" style="border-width: 0px;">
                        </td>
                        <td>
                            <a id="A1" title="878968" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;gvFt2Apply$ctl02$lbNewInvoice&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">
                                FT-RT 105482</a>
                        </td>
                        <td>
                            (2/22/2020 - 2/28/2020)
                        </td>
                        <td style="white-space: nowrap;" align="right">
                            1,900.50
                        </td>
                        <td style="width: 5px;">
                            &nbsp;
                        </td>
                    </tr>
                    <tr class="GridRowClear" align="left">
                        <td>
                            <input type="image" name="gvFt2Apply$ctl04$ImageButton1" id="gvFt2Apply_ctl04_ImageButton1"
                                text="Select" src="../Images/select_.gif" style="border-width: 0px;">
                        </td>
                        <td>
                            <a id="A2" title="878968" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;gvFt2Apply$ctl02$lbNewInvoice&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">
                                FT-RT 105494</a>
                        </td>
                        <td>
                            (2/22/2020 - 2/28/2020)
                        </td>
                        <td style="white-space: nowrap;" align="right">
                            1,356.90
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr class="GridRowClear" align="left">
                        <td>
                            <input type="image" name="gvFt2Apply$ctl05$ImageButton1" id="gvFt2Apply_ctl05_ImageButton1"
                                text="Select" src="../Images/select_.gif" style="border-width: 0px;">
                        </td>
                        <td>
                            <a id="A3" title="878968" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;gvFt2Apply$ctl02$lbNewInvoice&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">
                                FT-RT 105501</a>
                        </td>
                        <td>
                            (2/22/2020 - 2/27/2020)
                        </td>
                        <td style="white-space: nowrap;" align="right">
                            2,700.70
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr class="GridRowClear" align="left">
                        <td>
                            <input type="image" name="gvFt2Apply$ctl05$ImageButton1" id="Image1" text="Select"
                                src="../Images/select_.gif" style="border-width: 0px;">
                        </td>
                        <td>
                            <a id="A4" title="878968" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;gvFt2Apply$ctl02$lbNewInvoice&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">
                                FT-RT 105479</a>
                        </td>
                        <td>
                            (2/23/2020 - 2/26/2020)
                        </td>
                        <td style="white-space: nowrap;" align="right">
                            689.78
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr class="GridRowClear" align="left">
                        <td>
                            <input type="image" name="gvFt2Apply$ctl07$ImageButton1" id="gvFt2Apply_ctl07_ImageButton1"
                                text="Select" src="../Images/select_.gif" style="border-width: 0px;">
                        </td>
                        <td>
                            <a id="A5" title="878968" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;gvFt2Apply$ctl02$lbNewInvoice&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">
                                FT-RT 105540</a>
                        </td>
                        <td>
                            (2/24/2020 - 2/28/2020)
                        </td>
                        <td style="white-space: nowrap;" align="right">
                            896.54
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr class="GridRowClear" align="left">
                        <td>
                            <input type="image" name="gvFt2Apply$ctl08$ImageButton1" id="gvFt2Apply_ctl08_ImageButton1"
                                text="Select" src="../Images/select_.gif" style="border-width: 0px;">
                        </td>
                        <td>
                            <a id="A6" title="878968" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;gvFt2Apply$ctl02$lbNewInvoice&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, true))">
                                ND-OT-CL 1588</a>
                        </td>
                        <td>
                            (2/24/2020 - 3/02/2020)
                        </td>
                        <td style="white-space: nowrap;" align="right">
                            1,500.00
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <br />
        <table cellspacing="2" cellpadding="0">
            <tbody>
                <tr>
                    <td class="Blue">
                        <div class="GridLabelBG">
                            <span id="lbDetails" class="GridLabel" style="display: inline-block; height: 30px;">
                                New Application & Transfer</span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="border: solid 2px #005C99; padding: 0px 4px 0px 4px; background-color: White;">
                        <div style="overflow: auto; width: 800px;">
                            <div class="Blue">
                                <table id="fvTransaction" style="border-collapse: collapse;" cellspacing="0" border="0">
                                    <tbody>
                                        <tr style="vertical-align: middle; height: 25px; font-weight: bold;">
                                            <td class="GridRow2B" colspan="2">
                                                Date
                                            </td>
                                            <td class="GridRow2B" style="width: 100px;">
                                                Document
                                            </td>
                                            <td class="GridRow2B" style="width: 80px; text-align: center;">
                                                Balance
                                            </td>
                                            <td class="GridRow2B" style="width: 80px; text-align: center;">
                                                Applied
                                            </td>
                                            <td class="GridRow2B" style="width: 300px;">
                                                Comment
                                            </td>
                                            <td style="width: 17px;">
                                            </td>
                                        </tr>
                                        <tr style="vertical-align: middle; height: 30px; font-weight: bold;">
                                            <td class="GridRow1B" style="padding-right: 5px; padding-left: 5px;" colspan="2">
                                                <input name="fvTransaction$ctr_transDate$txtDate" type="text" value="1/31/2020" id="fvTransaction_ctr_transDate_txtDate"
                                                    class="TextBox">
                                            </td>
                                            <td class="GridRow1B">
                                                IR-FL-EB 81
                                            </td>
                                            <td class="GridRow1B" style="text-align: right;">
                                                14,701.26
                                            </td>
                                            <td class="GridRow1B" style="text-align: right;">&nbsp;</td>
                                            <td class="GridRow1B">
                                                <span style="padding-left: 5px;">
                                                    <input name="fvTransaction$txt_transNote" type="text" id="fvTransaction_txt_transNote" class="TextBox" style="width: 280px;">
                                                </span>
                                            </td>
                                            <td class="GridRow1B">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="GridRow1B" style="width: 20px; text-align: right;">
                                                <img id="btnDetailAdd" src="../Images/plus.gif" style="height: 12px; border-width: 0px;">&nbsp;
                                            </td>
                                            <td class="GridRow1B" style="width: 80px;">
                                                <input name="txtInvoice" type="text" readonly="readonly" id="txtInvoice" class="TextBox">
                                            </td>
                                            <td class="GridRow1B" colspan="5">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="GridRow2B" colspan="5">
                                                &nbsp;
                                            </td>
                                            <td class="GridRow2B" colspan="2" style="text-align: right; height: 28px; padding-top: 5px;">
                                                <input type="submit" name="fvTransFooter$btCancel" value="Cancel" id="fvTransFooter_btCancel"
                                                    class="Button" style="color: White; border-style: None;">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        <br />
        <table>
        <tbody>
            <tr>
                <td class="Blue">
                    <div class="GridLabelBG">
                        <span id="Span1" class="GridLabel" style="display: inline-block; height: 30px;">
                            New Application & Transfer</span>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="border: solid 2px #005C99; padding: 0px 4px 0px 4px; background-color: White;">
                    <div style="overflow: auto; width: 800px;">
                        <div class="Blue">
                            <table id="Table2" style="border-collapse: collapse;" cellspacing="0" border="0">
                                <tbody>
                                    <tr style="vertical-align: middle; height: 25px; font-weight: bold;">
                                        <td class="GridRow2B" colspan="2">
                                            Date
                                        </td>
                                        <td class="GridRow2B" style="width: 100px;">
                                            Document
                                        </td>
                                        <td class="GridRow2B" style="width: 80px; text-align: center;">
                                            Balance
                                        </td>
                                        <td class="GridRow2B" style="text-align: center;" colspan="2">
                                            Applied
                                        </td>
                                        <td class="GridRow2B" style="width: 300px;">
                                            Comment
                                        </td>
                                        <td class="GridRow2B" style="width: 50px;">
                                            &nbsp;
                                        </td>
                                        <td rowspan="2" style="width: 17px;">
                                        </td>
                                    </tr>
                                                    <tr style="vertical-align: middle; height: 30px; font-weight: bold;">
                                                        <td class="GridRowClear" colspan="2">
                                                            <input name="fvTransaction$ctr_transDate$txtDate" type="text" value="1/31/2020" id="Text1" class="TextBox">
                                                        </td>
                                                        <td class="GridRow1B">
                                                            ND-OT-CL 1588
                                                        </td>
                                                        <td class="GridRow1B" style="text-align: right;">
                                                            1,281.39
                                                        </td>
                                                        <td class="GridRow1B" style="width: 80px; text-align: right;">
                                                        </td>
                                                        <td class="GridRow1B" style="width: 80px; text-align: right;">
                                                            <span id="fvTransaction_lblCreditAmount" style="padding-right: 4px;"></span>
                                                        </td>
                                                        <td class="GridRow1B">
                                                            <span style="padding-left: 5px;">
                                                                <input name="fvTransaction$txt_transNote" type="text" id="Text2" class="TextBox"
                                                                    style="width: 280px;">
                                                            </span>
                                                        </td>
                                                        <td class="GridRow1B">
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <input type="hidden" name="hf_ftrtID" id="Hidden3" value="901605">
                        </div>
                        <div class="Red">
                            <div id="pnlNewInvoice" style="margin-top: 2px; margin-bottom: 2px;">
                                <table style="border-collapse: collapse;" cellspacing="0" cellpadding="0">
                                    <tbody>
                                        <tr>
                                            <td class="GridRowClear" style="width: 90px;">
                                                &nbsp;
                                            </td>
                                            <td class="GridRowClear" style="width: 100px; font-weight: bold;">
                                                <span id="lbl_ftrt">NC-CC-RE 5</span>
                                            </td>
                                            <td class="GridRowClear" style="width: 80px; text-align: right;">
                                                <span id="lbl_detailBalance">75.00</span>
                                            </td>
                                            <td class="GridRowClear" style="width: 72px; padding: 0px 4px 0px 4px;">
                                                <input name="txt_debitAmount" type="text" value="75.00" id="txt_debitAmount" class="TextBox"
                                                    style="text-align: right;"><span id="dec_txt_debitAmount" style="color: Red; display: none;"></span><input
                                                        type="hidden" name="ca_dec_txt_debitAmount_ClientState" id="ca_dec_txt_debitAmount_ClientState"><span
                                                            id="req_txt_debitAmount" style="color: Red; display: none;"></span><input type="hidden"
                                                                name="ca_req_txt_debitAmount_ClientState" id="ca_req_txt_debitAmount_ClientState"><span
                                                                    id="rng_txt_debitAmount" style="color: Red; display: none;"></span><input type="hidden"
                                                                        name="ca_rng_txt_debitAmount_ClientState" id="ca_rng_txt_debitAmount_ClientState">
                                            </td>
                                            <td class="GridRowClear" style="width: 72px; padding: 0px 4px 0px 4px;">
                                            </td>
                                            <td class="GridRowClear" style="width: 300px;">
                                                <span style="padding-left: 3px;">
                                                    <input name="txt_ftrtNote" type="text" id="txt_ftrtNote" class="TextBox" style="width: 280px;">
                                                </span>
                                            </td>
                                            <td class="GridRowClear" style="width: 50px;">
                                                <input type="image" name="btnNewUpdate" id="btnNewUpdate" class="ImgButton" text="Update"
                                                    src="../Images/accept_inline.gif" onclick="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;btnNewUpdate&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, false))"
                                                    style="border-width: 0px; width: 12px; height: 14px;">
                                                <input type="image" name="btnNewCancel" id="btnNewCancel" class="ImgButton" text="Cancel"
                                                    src="../Images/decline_inline.gif" style="border-width: 0px; height: 14px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="5">
                                            </td>
                                            <td colspan="2" style="color: Red; padding-left: 10px; font-weight: bold; font-style: italic;">
                                                <span id="lbl_detailError"></span>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="Blue">
                            <table id="Table3" style="border-collapse: collapse;" cellspacing="0" border="0">
                                <tbody>
                                    <tr>
                                        <td colspan="2">
                                            <table style="border-collapse: collapse;" cellspacing="0" cellpadding="0">
                                                <tbody>
                                                    <tr style="vertical-align: middle; height: 25px; font-weight: bold;">
                                                        <td class="GridRow1T" style="width: 90px;">
                                                            &nbsp;
                                                        </td>
                                                        <td class="GridRow1T" style="width: 100px;">
                                                            &nbsp;
                                                        </td>
                                                        <td class="GridRow1T" style="width: 80px;">
                                                            &nbsp;
                                                        </td>
                                                        <td class="GridRow1T" style="width: 80px; text-align: right;">
                                                            <span id="fvTransFooter_Label2" style="padding-right: 4px;"></span>
                                                        </td>
                                                        <td class="GridRow1T" style="width: 80px; text-align: right;">
                                                            <span id="fvTransFooter_Label4" style="padding-right: 4px;"></span>
                                                        </td>
                                                        <td class="GridRow1T" style="width: 300px;">
                                                            &nbsp;
                                                        </td>
                                                        <td class="GridRow1T" style="width: 50px;">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="GridRow2T" colspan="5">
                                                            &nbsp;
                                                        </td>
                                                        <td class="GridRow2T" colspan="2" style="text-align: right; height: 28px; padding-top: 5px;">
                                                            &nbsp;
                                                            <input type="submit" name="fvTransFooter$btCancel" value="Cancel" id="Submit1" class="Button"
                                                                style="color: White; border-style: None;">
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <input type="hidden" name="msgPop$dummy" id="Hidden4">
                            <div id="Div2" style="display: none; position: fixed;">
                                <div id="Div3" style="background-color: White; width: 400px; display: none">
                                    <div style="width: 100%;">
                                        <div class="GridLabelBG">
                                            <span id="Span4" class="GridLabel" style="display: inline-block; height: 30px;">Title</span>
                                        </div>
                                        <div class="GridBorder" style="text-align: left;">
                                            <table style="width: 100%;" cellspacing="0" cellpadding="0">
                                                <tbody>
                                                    <tr>
                                                        <td style="vertical-align: top; text-align: left; padding: 5px; width: 24px;">
                                                            <img id="Img1" src="../App_UserControls/no-entry.png" style="border-width: 0px;">
                                                        </td>
                                                        <td style="vertical-align: middle; text-align: center; padding: 5px;">
                                                            <span id="Span5">Message</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="GridRowClear" style="text-align: right; padding-top: 10px; padding-bottom: 5px;
                                                            border-top: 1px solid;" colspan="2">
                                                            <input type="submit" name="msgPop$btnMsgBoxYes" value="Yes" onclick="{$find('MessagePop').hide();};WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;msgPop$btnMsgBoxYes&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, false))"
                                                                id="Submit2" class="Button" style="color: White; border-style: None; width: 80px;">
                                                            <input type="submit" name="msgPop$btnMsgBoxNo" value="No" onclick="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;msgPop$btnMsgBoxNo&quot;, &quot;&quot;, true, &quot;&quot;, &quot;&quot;, false, false))"
                                                                id="Submit3" class="Button" style="color: White; border-style: None; width: 80px;
                                                                margin-left: 10px;">
                                                            <input type="hidden" name="msgPop$hfAction" id="Hidden5">
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="Div4" style="display: none; position: fixed; left: 0px; top: 0px;" class="modalBackground">
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </tbody>
        </table>
    </div>
    </form>
</body>
</html>
