<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AccGroupApplication.aspx.vb"
    Inherits="Accounting_AccGroupApplication" %>

<%@ Register Src="~/App_UserControls/InputDateControl.ascx" TagName="InputDateControl" TagPrefix="uc" %>
<%@ Register Src="~/App_UserControls/FromToDateControl.ascx" TagName="FromToDateControl" TagPrefix="uc" %>
<%@ Register Src="~/App_UserControls/MessagePop.ascx" TagName="MessagePop" TagPrefix="uc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Application to Group Invoices</title>
</head>
<body>
    <form id="form1" runat="server" >
    <asp:ToolkitScriptManager ID="tkScriptManager" runat="server" EnableScriptGlobalization="true"
        EnableScriptLocalization="true" />
    <table cellpadding="0" cellspacing="2" class="Blue">
        <tr>
            <td>
                <asp:Panel ID="pnSearchHead" runat="server" CssClass="GridLabelBG">
                    <asp:Label ID="lblFilter" runat="server" SkinID="skGridLabel">New Application to Group Invoices</asp:Label>
                    <asp:ImageButton ID="ibClose" runat="server" ImageUrl="~/Images/cancel_big.gif" Style="float: right; margin: 3px 3px 0px 0px;" />
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td class="GridBorder">
                <asp:HiddenField ID="hfFocus" runat="server" />
                <div style="padding-top: 5px; display: inline-table;">
                    <asp:CollapsiblePanelExtender ID="cpeSearch" runat="server" TargetControlID="pnSearch"
                        CollapseControlID="imgExpander" ExpandControlID="imgExpander" ImageControlID="imgExpander"
                        CollapsedImage="~/Images/expand_.png" ExpandedImage="~/Images/collapse_.png"
                        Collapsed="False">
                    </asp:CollapsiblePanelExtender>
                    <asp:Image ID="imgExpander" runat="server" ImageUrl="~/Images/collapse_.png" Style="float: left;
                        margin-right: 10px;" />
                    <asp:Panel ID="pnSearch" runat="server" DefaultButton="btSearch">
                        <table cellpadding="0" cellspacing="0" class="Red GridBorder">
                            <tr>
                                <td class="GridRow1B" style="width: 120px;">
                                    Group Code
                                </td>
                                <td class="GridRow1B" style="width: 353px;">
                                    <asp:TextBox ID="txtGroup" runat="server" CssClass="TextBox" />
                                    <asp:TextBoxWatermarkExtender ID="wm_txtGroup" runat="server" TargetControlID="txtGroup"
                                        WatermarkCssClass="WaterMark" WatermarkText="Group code like ..." />
                                </td>
                                <td rowspan="2" style="padding-left: 15px; text-align: right;">
                                    <div style="border-left: 2px solid;">
                                        <asp:Button ID="btSearch" runat="server" SkinID="skBtnFilter" Style="margin-left: 10px;
                                            margin-right: 5px; margin-bottom: 7px;" /><br />
                                        <asp:Button ID="btClear" runat="server" SkinID="skBtnClear" Style="margin-left: 10px;
                                            margin-right: 5px;" />
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="GridRowClear">
                                    Document Date
                                </td>
                                <td class="GridRowClear">
                                    <uc:FromToDateControl ID="ctrlDate" runat="server" MandatoryFrom="false" MandatoryTo="false" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </div>
                <%--<asp:UpdatePanel runat="server" ID="pnlTransaction">
                <ContentTemplate>--%>
                <asp:FormView ID="fvTransaction" runat="server" DataKeyNames="TransID,TransDate,Balance,TransNote,TrSign"
                    DataSourceID="dsSrcDocument" DefaultMode="Edit">
                    <ItemTemplate>
                        <table cellspacing="0" cellpadding="0" style="border-collapse: collapse;">
                            <tr style="vertical-align: middle; height: 25px; font-weight: bold;">
                                <td class="GridRow2B" style="width: 90px;">
                                    Date
                                </td>
                                <td class="GridRow2B" style="width: 100px;">
                                    Document
                                </td>
                                <td class="GridRow2B" style="width: 80px; text-align: center;">
                                    Eff.Balance
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
                            </tr>
                            <tr style="vertical-align: middle; height: 30px; font-weight: bold;">
                                <td class="GridRow1B" style="padding-right: 5px; padding-left: 5px;">
                                    <%# Eval("TransDate","{0:d}") %>
                                </td>
                                <td class="GridRow1B">
                                    <%# Eval("DocCode") & " " & Eval("DocNumber") %>
                                </td>
                                <td class="GridRow1B" style="text-align: right;">
                                    <%# Eval("Balance","{0:N2}") %>
                                </td>
                                <td class="GridRow1B" style="width: 80px; text-align: right;">
                                    <asp:Label ID="lblDebitAmount" runat="server" Text='<%# Eval("DebitAmount","{0:N2}") %>'
                                        Visible='<%# Eval("TrSign") = "C" %>' Style="padding-right: 4px;" />
                                </td>
                                <td class="GridRow1B" style="width: 80px; text-align: right;">
                                    <asp:Label ID="lblCreditAmount" runat="server" Text='<%# Eval("CreditAmount","{0:N2}") %>'
                                        Visible='<%# Eval("TrSign") = "D" %>' Style="padding-right: 4px;" />
                                </td>
                                <td class="GridRow1B">
                                    <%# Eval("TransNote") %>
                                </td>
                                <td class="GridRow1B">
                                    <asp:ImageButton ID="btnTransEdit" runat="server" CausesValidation="True" CommandName="Edit"
                                        ImageUrl="~/Images/edit_inline.gif" Text="Edit" CssClass="ImgButton" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <table cellspacing="0" cellpadding="0" style="border-collapse: collapse;">
                            <tr style="vertical-align: middle; height: 25px; font-weight: bold;">
                                <td class="GridRow2B" style="width: 150px;">
                                    Date
                                </td>
                                <td class="GridRow2B" style="width: 100px;">
                                    Document
                                </td>
                                <td class="GridRow2B" style="width: 80px; text-align: center;">
                                    Eff.Balance
                                </td>
                                <td class="GridRow2B" style="text-align: center;" colspan="2">
                                    Applied
                                </td>
                                <td class="GridRow2B" style="width: 305px;">
                                    Comment
                                </td>
                            </tr>
                            <tr style="vertical-align: middle; font-weight: bold;">
                                <td class="GridRow2B" style="padding-right: 5px; padding-left: 5px;">
                                    <div style="width: 140px;">
                                        <uc:InputDateControl ID="ctr_transDate" runat="server" DateValue='<%# Bind("TransDate","{0:d}") %>'
                                            ReadOnly='<%# Eval("TransID")<>0 %>' />
                                    </div>
                                </td>
                                <td class="GridRow2B">
                                    <%# Eval("DocCode") & " " & Eval("DocNumber") %>
                                </td>
                                <td class="GridRow2B" style="text-align: right;">
                                    <asp:Label ID="lblBalance" runat="server" Text='<%# Eval("Balance","{0:N2}") %>'
                                        Style="padding-right: 4px;" />
                                </td>
                                <td class="GridRow2B" style="width: 80px; text-align: right;">
                                    <asp:Label ID="lblDebitAmount" runat="server" Text='<%# Eval("DebitAmount","{0:N2}") %>'
                                        Visible='<%# Eval("TrSign") = "C" %>' Style="padding-right: 4px;" />
                                </td>
                                <td class="GridRow2B" style="width: 80px; text-align: right;">
                                    <asp:Label ID="lblCreditAmount" runat="server" Text='<%# Eval("CreditAmount","{0:N2}") %>'
                                        Visible='<%# Eval("TrSign") = "D" %>' Style="padding-right: 4px;" />
                                </td>
                                <td class="GridRow2B">
                                    <span style="padding-left: 5px;">
                                        <asp:TextBox ID="txt_transNote" runat="server" Text='<%# Bind("TransNote") %>' CssClass="TextBox"
                                            Width="300px" />
                                    </span>
                                </td>
                            </tr>
                        </table>
                    </EditItemTemplate>
                </asp:FormView>
                <asp:Panel ID="pnlInput" runat="server" ScrollBars="Vertical" style="max-height: 400px;">
                <asp:DataList ID="dlDetails" runat="server" DataSourceID="dsDetDocument" Visible="False">
                    <ItemTemplate>
                        <tr style="vertical-align: middle;">
                            <td class="GridRow1B" style="width: 145px; padding-left: 5px;">
                                <%#Eval("ResGroup")%>
                            </td>
                            <td class="GridRow1B" style="width: 95px; text-align: right;">
                                <asp:HiddenField ID="hf_ftrtID" runat="server" Value='<%# Eval("DocumentID") %>' />
                                <%# Eval("DocCode") & " " & Eval("DocNumber") %>
                            </td>
                            <td class="GridRow1B" style="width: 80px; text-align: right;">
                                <asp:Label ID="lblBalance" runat="server" Text='<%# Eval("Balance","{0:N2}") %>' 
                                        style="padding-right: 4px;" />
                            </td>
                            <td class="GridRow1B" style="width: 80px; text-align: right;">
                                <asp:HiddenField ID="hf_creditAmount" runat="server" Value="0" />
                            </td>
                            <td class="GridRow1B" style="width: 80px; text-align: right;">
                                <asp:TextBox ID="txt_creditAmount" runat="server" CssClass="TextBox" Text='<%# Bind("ApplyAmount") %>'
                                    Style="text-align: right;" Width="75px" AutoPostBack="true"
                                    OnTextChanged="txt_creditAmount_TextChanged" />
                            </td>
                            <td class="GridRow1B" style="width: 305px;">
                                <asp:TextBox ID="txt_ftrtNote" runat="server" CssClass="TextBox" Text='<%# Bind("ApplyNote") %>' Width="300px" />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        <tr>
                            <td class="GridRow1T" colspan="6" style="text-align: right; padding-top: 5px; padding-bottom: 3px;">
                                <asp:Button ID="btFinish" runat="server" Text="Finish" SkinID="skBtnBase" OnClick="btFinish_Click" />&nbsp;
                                <asp:Button ID="btCancel" runat="server" Text="Cancel" SkinID="skBtnBase" OnClick="btCancel_Click"  />
                            </td>
                        </tr>
                    </FooterTemplate>
                </asp:DataList>
                </asp:Panel>
                <asp:HiddenField ID="hf_transID" runat="server" />
                <uc:MessagePop ID="msgPop" runat="server" Title="Document Application" />
                <asp:DataList ID="dlTrans" runat="server" Visible="False">
                    <ItemTemplate>
                        <tr style="vertical-align: middle;">
                            <td class="GridRow1B" style="width: 145px; padding-left: 5px;">
                                <%#Eval("ResGroup")%>
                            </td>
                            <td class="GridRow1B" style="width: 95px; text-align: right;">
                                <%# Eval("DocCode") & " " & Eval("DocNumber") %>
                            </td>
                            <td class="GridRow1B" style="width: 80px; text-align: right;">
                                <%# Eval("Balance","{0:N2}") %>
                            </td>
                            <td class="GridRow1B" style="width: 80px; text-align: right;">
                                &nbsp;
                            </td>
                            <td class="GridRow1B" style="width: 80px; text-align: right;">
                                <%#Eval("ApplyAmount", "{0:N2}")%>
                            </td>
                            <td class="GridRow1B" style="width: 305px;">
                                <%# Eval("ApplyNote") %>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        <tr>
                            <td class="GridRow1T" colspan="6" style="text-align: right; padding-top: 5px; padding-bottom: 3px;">
                                <h3 style="text-align: center;">Transaction is confirmed. You can print Batch report or close this form.</h3>
                                <div style="height: 30px; text-align: right; padding-right: 17px;">
                                <asp:Button ID="btnBatch" runat="server" SkinID="skBtnBase" Text="Bach Report" OnClick="btnBatch_Click"/>&nbsp;&nbsp;
                                <asp:Button ID="btnClose" runat="server" SkinID="skBtnBase" Text="Close" OnClick="btnClose_Click" />
                            </td>
                        </tr>
                    </FooterTemplate>
                </asp:DataList>
                <%--</ContentTemplate>
                </asp:UpdatePanel>--%>
            </td>
        </tr>
    </table>
    <asp:ObjectDataSource ID="dsSrcDocument" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataEffective" TypeName="dsAccBookApplicationTableAdapters.SrcDocumentAnyTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="TransID" QueryStringField="TransID" Type="Int32" />
            <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
            <asp:Parameter Name="UserName" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsAccDocStatus" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="dsAccountingTableAdapters.SelectAccDocStatusTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
            <asp:Parameter Name="UserName" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="dsDetDocument" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="dsGroupApplicationTableAdapters.FtToApplyTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
            <asp:ControlParameter ControlID="txtGroup" Name="Group" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="ctrlDate" Name="FromDate" PropertyName="DateFrom"
                Type="String" />
            <asp:ControlParameter ControlID="ctrlDate" Name="ToDate" PropertyName="DateTo" Type="DateTime" />
        </SelectParameters>
    </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsDocHeader" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="dsAccountingTableAdapters.DocHeaderTableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="dsApplications" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="AccDocApplicationTableAdapters.ReportAccTranApplTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="hf_transID" Name="TranID" PropertyName="Value" 
                    Type="Int32" />
                <asp:QueryStringParameter Name="DocumentID" QueryStringField="DocumentID" Type="Int32" />
                <asp:Parameter Name="ShowCancel" Type="Boolean" DefaultValue="False" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </form>
</body>
</html>
